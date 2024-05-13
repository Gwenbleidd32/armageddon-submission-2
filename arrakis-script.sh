#Thanks to Remo
#!/bin/bash
# Update and install Apache2
apt update
apt install -y apache2

# Start and enable Apache2
systemctl start apache2
systemctl enable apache2

# GCP Metadata server base URL and header
METADATA_URL="http://metadata.google.internal/computeMetadata/v1"
METADATA_FLAVOR_HEADER="Metadata-Flavor: Google"

# Use curl to fetch instance metadata
local_ipv4=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/network-interfaces/0/ip")
zone=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/zone")
project_id=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/project/project-id")
network_tags=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/tags")

# Create a simple HTML page and include instance details
cat <<EOF > /var/www/html/index.html
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Background and Centered Image with Text</title>
    <style>
        /* Set the body to display full height of the viewport with no margin */
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Verdana', sans-serif; /* Default to Roboto, replace with 'Jersey 20' if available */
        }

        /* Fullscreen background image */
        .background {
            background-image: url('https://storage.googleapis.com/poop-4-scoop/br1.jpg?x-goog-signature=07bfd4fabce195e660437879b099fa34f3cc7b97ad1c30a3c813cd428e9ce372226956d9efa2ec6c5644987aeca2a8909fc3b8cf1931dc5df7aa7306c3c42e84ec9a06031baba64124b171e786f9e555cf7cc99790aa5eb00b92e208d974e30b57f7d89bd6c343257eae7d7a4f93a7411abdf528f551838c300ca5169e58e2c1d85fff89f5f8f784d1d3684292af7ef36774f3d7d0fb5b44650f23a4f3d19c2f8af1b2dce7cfcc85ee56e795136028e94892d6a7d5ae8362a75c27ecfd9b89afab15f810c9faa84669d834a4c661982c3b348c12480d2b0c4de7c78933ed714f5621169725d6607400fcc7ec3798ad20639c8df3a732aa4b30efb55d10d5addc&x-goog-algorithm=GOOG4-RSA-SHA256&x-goog-credential=t-form%40pooper-scooper.iam.gserviceaccount.com%2F20240512%2Feurope-central2%2Fstorage%2Fgoog4_request&x-goog-date=20240512T195538Z&x-goog-expires=259200&x-goog-signedheaders=host');
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover; /* Cover the entire viewport */
            position: relative; /* Allows for absolute positioning of elements inside */
            display: flex;
            justify-content: center;
            align-items: center; /* Center the child div vertically and horizontally */
            flex-direction: column; /* Align children vertically */
        }

        /* Header styling */
        header {
            position: absolute;
            top: 0;
            width: 100%;
            background: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
            color: white;
            padding: 10px 20px;
            text-align: center;
        }

        /* Centered image container */
        .centered-image {
            width: 300px; /* Fixed width for the centered image */
            height: 300px;
            background-image: url('https://storage.googleapis.com/poop-4-scoop/dune.webp?x-goog-signature=523a8936f615ce5bc73360a9666e0c0daf82514160976aa3644216ed5066db2ec8d50c9885482038f7eef77397993d9504c6598053b480544f15ab77be776cd5f4c05cc4dc781ede2c4c720e62a8e984b2eee298f1a8325c4a2b20dc409ebfa8ec0cbeac4c6f157177bcd707a5a1713c7b9e9d6ed76406f50d90a184181e9bbee964c34720456bf7368f6887a36e34b1fed44ebcee359bff336521743466823215490883a2f8484b9b8d4ca6bae53020c4d6ddcb65fdb2d9a8b039067249797c5f8d92f81d95997dbd256f248e16c4f8f73fdfd101bf36986237cfd972408ee2469fdabc19510b566bca9d42385e4c740e00dab2a80895524430eee8c8a6e13f&x-goog-algorithm=GOOG4-RSA-SHA256&x-goog-credential=t-form%40pooper-scooper.iam.gserviceaccount.com%2F20240512%2Feurope-central2%2Fstorage%2Fgoog4_request&x-goog-date=20240512T195614Z&x-goog-expires=259200&x-goog-signedheaders=host');
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover; /* Change to cover to ensure the image fills the circle */
            border-radius: 50%; /* Makes the container a circle */
            margin-bottom: 20px; /* Space between the image and the text */
        }

        /* Text container */
        .text-container {
            color: white;
            text-align: center;
            font-size: 1.5em;
            width: 35%; /* Width relative to the parent */
            padding: 10px;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background for text */
            border-radius: 15px; /* Rounded corners for the text container */
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="background">
        <header></header>
        <div class="centered-image"></div>
        <div class="text-container">
            Armageddon has arrived
        </div>
    </div>
</body>
</html>