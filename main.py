import tkinter as tk
from tkinter import ttk
import mysql.connector

class CarDealershipApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Car Dealership App")

        # Set the background color to pink
        self.root.configure(bg='#000000')

        self.results_text = tk.Text(self.root, height=10, width=50)
        self.results_text.pack(pady=20)

        self.connect_button = ttk.Button(self.root, text="Connect to Database", command=self.connect_to_db)
        self.connect_button.pack(pady=10)

        self.fetch_cars_button = ttk.Button(root, text="Fetch Cars", command=lambda: self.fetch_records("Cars"))
        self.fetch_cars_button.pack(pady=5)

        self.fetch_customers_button = ttk.Button(root, text="Fetch Customers", command=lambda: self.fetch_records("Customers"))
        self.fetch_customers_button.pack(pady=5)

        self.fetch_sales_button = ttk.Button(root, text="Fetch Sales", command=lambda: self.fetch_records("Sales"))
        self.fetch_sales_button.pack(pady=5)

        self.fetch_service_requests_button = ttk.Button(root, text="Fetch Service Requests", command=lambda: self.fetch_records("ServiceRequests"))
        self.fetch_service_requests_button.pack(pady=5)

    def connect_to_db(self):
        # Replace these with your actual database credentials
        db_config = {
            'host': '127.0.0.1',
            'user': 'root',
            'password': 'Florian1601%',
            'database': 'car_dealership',
        }

        try:
            self.connection = mysql.connector.connect(**db_config)
            self.results_text.insert(tk.END, "Connected to the database!\n")
        except mysql.connector.Error as err:
            self.results_text.insert(tk.END, f"Error: {err}\n")

    def execute_query(self, query):
        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(query)
            self.connection.commit()
            print("Query executed successfully.")
        except mysql.connector.Error as err:
            print(f"Error: {err}")
        finally:
            cursor.close()

    def fetch_records(self, table):
        query = f"SELECT * FROM {table};"
        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(query)
            records = cursor.fetchall()

            # Display fetched records in the Text widget
            self.results_text.delete(1.0, tk.END)
            for record in records:
                self.results_text.insert(tk.END, f"{record}\n")

            # Display fetched records in a Treeview widget
            columns = [col[0] for col in cursor.description]
            self.display_records_treeview(records, columns)
        except mysql.connector.Error as err:
            self.results_text.insert(tk.END, f"Error: {err}\n")

    def display_records_treeview(self, records, columns):
        self.tree = ttk.Treeview(self.root, columns=columns, show='headings', selectmode='browse')

        for col in columns:
            self.tree.heading(col, text=col)
            self.tree.column(col, width=100)

        for record in records:
            self.tree.insert('', 'end', values=tuple(record[col] for col in columns))

        self.tree.pack(pady=10)

if __name__ == "__main__":
    root = tk.Tk()
    app = CarDealershipApp(root)
    root.mainloop()
