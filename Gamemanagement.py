from flask import Flask, request, jsonify
from flask_cors import CORS
import mysql.connector

app = Flask(__name__)
CORS(app)

# Function to establish a connection with the MySQL database
def connect_db():
    return mysql.connector.connect(
        host="127.0.0.1",
        user="root",
        password="Delta2047",
        database="GameManagement"
    )

@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    name = data['name']
    email = data['email']
    password = data['password']
    age = data['age']

    db = connect_db()
    cursor = db.cursor()

    try:
        cursor.execute(
            "INSERT INTO User (Name, Email, Password, Age) VALUES (%s, %s, %s, %s)",
            (name, email, password, age)
        )
        db.commit()
        return jsonify({'status': 'success', 'message': 'User registered successfully'})
    except mysql.connector.Error as err:
        return jsonify({'status': 'error', 'message': str(err)})
    finally:
        cursor.close()
        db.close()

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data['email']
    provided_password = data['password']

    db = connect_db()
    cursor = db.cursor()

    try:
        cursor.execute("SELECT UserID, Password FROM User WHERE Email = %s", (email,))
        result = cursor.fetchone()

        if result:
            user_id, stored_password = result
            if provided_password == stored_password:
                return jsonify({'status': 'success', 'message': 'Login successful', 'user_id': user_id})
            else:
                return jsonify({'status': 'failed', 'message': 'Incorrect password'})
        else:
            return jsonify({'status': 'failed', 'message': 'No user found'})
    except mysql.connector.Error as err:
        return jsonify({'status': 'error', 'message': str(err)})
    finally:
        cursor.close()
        db.close()

@app.route('/add-to-wishlist', methods=['POST'])
def add_to_wishlist():
    data = request.get_json()
    user_id = data['user_id']
    game_id = data['game_id']

    db = connect_db()
    cursor = db.cursor()

    try:
        cursor.execute(
            "INSERT INTO AddWishlist (GameID, UserID, DateAdded) VALUES (%s, %s, CURDATE())",
            (game_id, user_id)
        )
        db.commit()
        return jsonify({'status': 'success', 'message': 'Game added to wishlist successfully'})
    except mysql.connector.Error as err:
        return jsonify({'status': 'error', 'message': str(err)})
    finally:
        cursor.close()
        db.close()

@app.route('/view-wishlist', methods=['GET'])
def view_wishlist():
    user_id = request.args.get('user_id')

    db = connect_db()
    cursor = db.cursor()

    try:
        cursor.execute(
            "SELECT g.Title, aw.DateAdded FROM Game g JOIN AddWishlist aw ON g.GameID = aw.GameID WHERE aw.UserID = %s",
            (user_id,)
        )
        wishlist = cursor.fetchall()
        return jsonify([{'title': item[0], 'date_added': item[1]} for item in wishlist])
    except mysql.connector.Error as err:
        return jsonify({'status': 'error', 'message': str(err)})
    finally:
        cursor.close()
        db.close()

if __name__ == '__main__':
    app.run(debug=True)

@app.route('/games', methods=['GET'])
def get_games():
    print("Accessing /games route")
    db = connect_db()
    cursor = db.cursor()
    try:
        cursor.execute("""
            SELECT g.GameID, g.Title, g.Genre, p.PublisherName, g.AgeRating
            FROM Game g
            JOIN Publisher p ON g.PublisherID = p.PublisherID
        """)
        games = cursor.fetchall()
        games_list = [{'gameID': game[0], 'title': game[1], 'genre': game[2], 'publisher': game[3], 'ageRating': game[4]} for game in games]
        return jsonify(games_list)
    except mysql.connector.Error as err:
        return jsonify({'status': 'error', 'message': str(err)})
    finally:
        cursor.close()
        db.close()