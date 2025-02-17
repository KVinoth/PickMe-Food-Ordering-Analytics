from flask import Flask, request, jsonify, render_template
import mysql.connector

app = Flask(__name__)


def create_connection():
    return mysql.connector.connect(
        host='localhost',
        user='root',  # replace with your MySQL username
        password='root',  # replace with your MySQL password
        database='pick_me'
    )


# Home route
@app.route('/')
def home():
    return render_template('index.html')


# Place an order (POST)
@app.route('/place_order', methods=['POST'])
def place_order():
    cursor = None
    connection = None
    try:
        order_data = request.get_json()  # Get the JSON data sent by the frontend

        cart = order_data['cart']  # The cart is an array of items
        address = order_data['address']  # The delivery address

        if not cart or not address:
            return jsonify({"error": "Cart is empty or address is missing."}), 400

        # Insert each item in the cart into the database
        connection = create_connection()
        cursor = connection.cursor()

        for item in cart:
            item_name = item['name']
            quantity = item['quantity']

            cursor.execute("SELECT item_id FROM items WHERE item_name = %s", (item_name,))
            result = cursor.fetchone()

            if not result:
                return jsonify({"error": f"Item {item_name} not found."}), 400

            item_id = result[0]  # Get the item_id from the query result
            user_id = 11  # Assuming user_id is 1, change this if needed

            # SQL query to insert the order
            sql = """
                INSERT INTO orders (user_id, item_id, quantity, delivery_address)
                VALUES (%s, %s, %s, %s)
            """
            cursor.execute(sql, (user_id, item_id, quantity, address))

        connection.commit()
        return jsonify({"message": "Order placed successfully!"}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()



# Get all orders (GET)
@app.route('/orders', methods=['GET'])
def get_orders():
    cursor = None
    connection = None
    try:
        connection = create_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM orders")
        orders = cursor.fetchall()

        return jsonify({"orders": orders}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()


if __name__ == '__main__':
    app.run(debug=True)
