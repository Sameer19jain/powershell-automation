import requests
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import time

# Configuration
API_URL = "http://localhost:5500/health"
YOUR_EMAIL = "sameer.jain.cseai.2020@"
YOUR_PASSWORD = "Miet@123"
RECIPIENTS = ["ecosportyo@gmail.com"]

def send_email(status):
    subject = "API Status Alert: Nok Status Detected"
    body = f"The application returned a status of 'Nok'.\n\nStatus: {status}"

    msg = MIMEMultipart()
    msg['From'] = YOUR_EMAIL
    msg['To'] = ", ".join(RECIPIENTS)
    msg['Subject'] = subject

    msg.attach(MIMEText(body, 'plain'))

    try:
        with smtplib.SMTP('smtp.gmail.com', 587) as server:
            server.starttls()
            server.login(YOUR_EMAIL, YOUR_PASSWORD)
            text = msg.as_string()
            server.sendmail(YOUR_EMAIL, RECIPIENTS, text)
            print("Email sent successfully.")
    except Exception as e:
        print(f"Failed to send email: {e}")

def check_status():
    try:
        response = requests.get(API_URL)
        response.raise_for_status()
        if response.status_code == 200:
            data = response.json()
            status = data.get("status")
            if status == "Nok":
                send_email(status)
        else:
            print(f"Unexpected status code: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"API request failed: {e}")
    except ValueError as ve:
        print(f"Failed to parse JSON response: {ve}")

if __name__ == "__main__":
    while True:
        check_status()
        time.sleep(60)  # Wait for 60 seconds before checking again