import os
import pathlib

import requests
from flask import Flask, session, abort, redirect, request, render_template, url_for
from google.oauth2 import id_token
from google_auth_oauthlib.flow import Flow
from pip._vendor import cachecontrol
import google.auth.transport.requests

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import ForeignKey, text
from sqlalchemy.orm import relationship
from datetime import datetime, timedelta

from sslcommerz_lib import SSLCOMMERZ 

app = Flask("EPharmacy")
app.config["SQLALCHEMY_DATABASE_URI"] = 'mysql://root:@localhost/epharmacy_test'
db = SQLAlchemy(app)
app.secret_key = "EPharmacy.com"

os.environ["OAUTHLIB_INSECURE_TRANSPORT"] = "1"

GOOGLE_CLIENT_ID = "859011934628-kg1kgqhiph6g25h1qvpk5drf8ja0psrh.apps.googleusercontent.com"
client_secrets_file = os.path.join(pathlib.Path(__file__).parent, "client_secret.json")

flow = Flow.from_client_secrets_file(
    client_secrets_file=client_secrets_file,
    scopes=["https://www.googleapis.com/auth/userinfo.profile", "https://www.googleapis.com/auth/userinfo.email", "openid"],
    redirect_uri="http://127.0.0.1:5000/callback"
)

settings = { 'store_id': 'north651ad2fdce573', 'store_pass': 'north651ad2fdce573@ssl', 'issandbox': True }
sslcz = SSLCOMMERZ(settings)

#db models
class User(db.Model):
    UserID = db.Column(db.Integer, primary_key=True)
    Username = db.Column(db.String(255), nullable=False)
    Email = db.Column(db.String(255), nullable=False)
    Address = db.Column(db.String(255), nullable=True)
    PhoneNumber = db.Column(db.String(15), nullable=True)

class Product_info(db.Model):
    productID = db.Column(db.Integer, primary_key=True)
    Manufacturer = db.Column(db.String(47), nullable=True)
    BrandName = db.Column(db.String(38), nullable=True)
    GenericName = db.Column(db.String(393), nullable=True)
    Strength = db.Column(db.String(265), nullable=True)
    Description = db.Column(db.String(26), nullable=True)
    Price = db.Column(db.String(72), nullable=True)

class Cart(db.Model):
    __tablename__ = 'cart'

    CartID = db.Column(db.Integer, primary_key=True)
    UserID = db.Column(db.Integer, ForeignKey('user.UserID'), nullable=False) 
    ProductID = db.Column(db.Integer, ForeignKey('product_info.productID'), nullable=False)
    Quantity = db.Column(db.Integer, nullable=False)

    # Define relationship with Product_info
    product = relationship('Product_info', backref='cart_items')

class History(db.Model):
    HistoryID = db.Column(db.Integer, primary_key=True)
    UserID = db.Column(db.Integer, db.ForeignKey('user.UserID'), nullable=False)
    ProductID = db.Column(db.Integer, db.ForeignKey('product_info.productID'), nullable=False)
    Quantity = db.Column(db.Integer, nullable=False)
    Timestamp = db.Column(db.TIMESTAMP, default=datetime.utcnow, nullable=False)

    # Define relationships
    user = db.relationship('User', backref=db.backref('history_entries', lazy=True))
    product = db.relationship('Product_info', backref=db.backref('history_entries', lazy=True))

class Images(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    category = db.Column(db.String(255), nullable=False)
    url = db.Column(db.String(255), nullable=False)

# Methods

def login_is_required(function):
    def wrapper(*args, **kwargs):
        if "google_id" not in session:
            return abort(401)  # Authorization required
        else:
            return function()

    return wrapper


@app.route("/login")
def login():
    authorization_url, state = flow.authorization_url()
    session["state"] = state
    return redirect(authorization_url)

@app.route("/callback")
def callback():
    flow.fetch_token(authorization_response=request.url)

    if not session["state"] == request.args["state"]:
        abort(500)  # State does not match!

    credentials = flow.credentials
    request_session = requests.session()
    cached_session = cachecontrol.CacheControl(request_session)
    token_request = google.auth.transport.requests.Request(session=cached_session)

    id_info = id_token.verify_oauth2_token(
        id_token=credentials._id_token,
        request=token_request,
        audience=GOOGLE_CLIENT_ID
    )

    session["google_id"] = id_info.get("sub")
    session["name"] = id_info.get("name")
    session["email"] = id_info.get("email") 

    first_name = session["name"].split()[0]
    session["first_name"] = first_name

    # Check if a user with a specific email exists
    email_exists = db.session.query(User).filter(User.Email == session["email"]).count() > 0

    if email_exists == 0:
        # Create a new user and add it to the database
        new_user = User(Username=session["name"], Email=session["email"])
        db.session.add(new_user)
        db.session.commit()

    return redirect("/protected_area")

@app.route("/logout")
def logout():
    session.clear()
    return redirect("/")

@app.route("/")
def index():
    session.clear()
    return render_template('home.html')

@app.route("/shop")
def shop():
    products = Product_info.query.all()
    images = Images.query.join(Product_info, Images.category == Product_info.Description).add_columns(Images.url).all()

    if "google_id" in session:
        return render_template('shop.html', name = session["name"], products=products, images=images)
    else:
        session.clear()
        return render_template('shop.html', products=products, images=images)

@app.route('/view_product/<int:product_id>')
def view_product(product_id):
    product_detail = Product_info.query.get_or_404(product_id)

    if "google_id" in session:
        return render_template('product_details.html', name = session["name"], product=product_detail)
    else:
        return render_template('product_details.html', product=product_detail)

@app.route('/search_products', methods=['GET', 'POST'])
def search_products():
    search_query = request.form.get('search_query')

    products = Product_info.query.filter(Product_info.Description.like(f"%{search_query}%")).all()

    if "google_id" in session:
        return render_template('shop.html', name = session["name"], products=products)
    else:
        session.clear()
        return render_template('shop.html', products=products)


@app.route('/add_to_cart/<int:product_id>', methods=['POST'])
def add_to_cart(product_id):
    if "google_id" in session:
        user = User.query.filter_by(Email=session["email"]).first()
        user_id = user.UserID
        quantity = int(request.form['quantity'])

        new_cart_item = Cart(ProductID=product_id, Quantity=quantity, UserID=user_id)
        db.session.add(new_cart_item)
        db.session.commit()

        # Retrieve the redirect URL from the request
        redirect_url = request.args.get('redirect_url', '/shop')

        return redirect(redirect_url)
    else:
        return redirect(url_for('login'))

@app.route('/cart')
def cart():
    if "google_id" in session:
        user = User.query.filter_by(Email=session["email"]).first()
        user_id = user.UserID
        cart_items = Cart.query.filter_by(UserID=user_id).all()

        total_price = 0

        for item in cart_items:
            item_price = float(item.product.Price)  # Convert to float
            item_quantity = float(item.Quantity)   # Convert to float
            total_price += item_price * item_quantity
            
        formatted_price = "{:.2f}".format(total_price)

        return render_template('cart.html', name = session["name"], cart_items=cart_items, total_price=formatted_price)
    else:
        return render_template('cart.html')
    
@app.route('/remove_from_cart/<int:cart_id>')
def remove_from_cart(cart_id):
    if "google_id" in session:
        cart_item = Cart.query.get_or_404(cart_id)
        db.session.delete(cart_item)
        db.session.commit()
        return redirect(url_for('cart'))
    else:
        return redirect(url_for('login'))

@app.route('/checkout')
def checkout():
    if "google_id" in session:
        user = User.query.filter_by(Email=session["email"]).first()
        user_id = user.UserID
        cart_items = Cart.query.filter_by(UserID=user_id).all()
        user_address = user.Address
        user_phone = user.PhoneNumber
        if user_phone is not None:
            user_phone = user_phone[4:]

        total_price = 0

        for item in cart_items:
            item_price = float(item.product.Price)  # Convert to float
            item_quantity = float(item.Quantity)   # Convert to float
            total_price += item_price * item_quantity

        formatted_price = "{:.2f}".format(total_price)

        return render_template('checkout.html', email = session["email"], name = session["name"], cart_items=cart_items, total_price=formatted_price, address = user_address, phone = user_phone)
    else:
        return redirect(url_for('login'))

@app.route('/order', methods=['GET', 'POST'])
def order():
    if "google_id" in session:
        user = User.query.filter_by(Email=session["email"]).first()
        user_id = user.UserID
        cart_items = Cart.query.filter_by(UserID=user_id).all()

        total_price = 0

        for item in cart_items:
            item_price = float(item.product.Price)  # Convert to float
            item_quantity = float(item.Quantity)   # Convert to float
            total_price += item_price * item_quantity

        #     new_history_item = History(
        #         UserID=user_id,
        #         ProductID=item.ProductID,
        #         Quantity=item.Quantity,
        #         Timestamp=datetime.utcnow() + timedelta(hours=6)
        #     )
        #     db.session.add(new_history_item)
        #     db.session.delete(item)  # Remove item from cart

        # Get address and phone number from the form
        address = request.form.get('address')
        phone_number = "+880" + str(request.form.get('phone_number'))

        # Update user's address and phone number
        user.Address = address
        user.PhoneNumber = phone_number

        db.session.commit()
        # formatted_price = "{:.2f}".format(total_price)

        status_url = request.url_root + url_for('sslc_status')  # Generating the status URL

        post_body = {}
        post_body['total_amount'] = total_price
        post_body['currency'] = "BDT"
        post_body['tran_id'] = "12345"
        post_body['success_url'] = status_url
        post_body['fail_url'] = status_url
        post_body['cancel_url'] = status_url
        post_body['emi_option'] = 0
        post_body['cus_name'] = session["name"]
        post_body['cus_email'] = session["email"]
        post_body['cus_phone'] = user.PhoneNumber
        post_body['cus_add1'] = user.Address
        post_body['cus_city'] = "Dhaka"
        post_body['cus_country'] = "Bangladesh"
        post_body['shipping_method'] = "NO"
        post_body['multi_card_name'] = ""
        post_body['num_of_item'] = 1
        post_body['product_name'] = "Test"
        post_body['product_category'] = "Test Category"
        post_body['product_profile'] = "general"

        response = sslcz.createSession(post_body) # API response
        print("====================")
        print(response)
        print("====================")
        # Need to redirect user to response['GatewayPageURL']

        # return redirect(url_for('cart'))
        return redirect(response['GatewayPageURL'])

    else:
        return redirect(url_for('login'))


@app.route('/sslc/status', methods=['POST'])
def sslc_status():
    if request.method == 'POST':
        payment_data = request.form

        print("====================")
        print(payment_data)
        print("====================")

        status = payment_data['status']
        if status == 'VALID':
            val_id = payment_data['val_id']
            tran_id = payment_data['tran_id']

            return redirect(url_for('sslc_complete', val_id=val_id, tran_id=tran_id))

    return render_template('status.html')

@app.route('/sslc/complete/<val_id>/<tran_id>')
def sslc_complete(val_id, tran_id):
        user = User.query.filter_by(Email=session["email"]).first()
        user_id = user.UserID
        cart_items = Cart.query.filter_by(UserID=user_id).all()

        total_price = 0

        for item in cart_items:
            item_price = float(item.product.Price)  # Convert to float
            item_quantity = float(item.Quantity)   # Convert to float
            total_price += item_price * item_quantity

            new_history_item = History(
                UserID=user_id,
                ProductID=item.ProductID,
                Quantity=item.Quantity,
                Timestamp=datetime.utcnow() + timedelta(hours=6)
            )
            db.session.add(new_history_item)
            db.session.delete(item)  # Remove item from cart

        db.session.commit()
        formatted_price = "{:.2f}".format(total_price)

        return redirect(url_for('cart'))


@app.route('/success')
def success():
    if "google_id" in session:

        return render_template('success.html')
    else:
        return redirect(url_for('login'))
    

@app.route('/history')
def history():
    if "google_id" in session:
        user = User.query.filter_by(Email=session["email"]).first()
        user_id = user.UserID
        history_items = History.query.filter_by(UserID=user_id).all()

        total_price = 0

        for item in history_items:
            item_price = float(item.product.Price)  # Convert to float
            item_quantity = float(item.Quantity)   # Convert to float
            total_price += item_price * item_quantity
            
        formatted_price = "{:.2f}".format(total_price)
        
        return render_template('history.html', name = session["name"], history_items=history_items, total_price=formatted_price)
    else:
        return render_template('history.html')

@app.route('/clear_history')
def clear_history():
    if "google_id" in session:
        user = User.query.filter_by(Email=session["email"]).first()
        user_id = user.UserID

        History.query.filter_by(UserID=user_id).delete()
        db.session.commit()

        return redirect(url_for('history'))
    else:
        return redirect(url_for('login'))



@app.route("/protected_area")
@login_is_required
def protected_area():
    return render_template('home.html', name = session["name"]) 


if __name__ == "__main__":
    app.run(debug=True)