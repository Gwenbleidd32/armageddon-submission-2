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
<html>
<head>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<style>
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
.bgimg {
  background-image: url('https://storage.googleapis.com/poop-4-scoop/punk-o.jpg?x-goog-signature=4eb0480b8743aa5f780f04b1b24e2320ee840d868a4bcac4b5107e1ad13198ebfa2ef5d3a53dafcebea7350108c75d2b64456bcdc003295bed6720cd191e4a1407c7ce3aa39ea2d7df8910c780a9ea1a88b2e4e8d4b1e6286e2d948c7160b84afb1d488e8fda71c6a4bd0150a2db4b19f856371826312d4a39270d139421367d7e3fd4034122991efa94a82558a01c503bf6deaadc0b27e9de7289805925d7c302742bb340cad8289e0a0eb628f6f585e194d094c1fddb88bde65f69afdc319c6abf307de28cad35b1e182a02458dd12583b142fff8f0d0537cee45f6ff6198d6672db353dfc6a1696a1f140b174e7a83641934266db2208f41edc60905cf45f&x-goog-algorithm=GOOG4-RSA-SHA256&x-goog-credential=t-form%40pooper-scooper.iam.gserviceaccount.com%2F20240511%2Feurope-central2%2Fstorage%2Fgoog4_request&x-goog-date=20240511T161945Z&x-goog-expires=259200&x-goog-signedheaders=host');
  min-height: 100%;
  background-position: center;
  background-size: cover;
}
</style>
</head>
<body>

<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
<div class="w3-display-topleft w3-padding-large w3-xlarge">
<img src="https://storage.googleapis.com/poop-4-scoop/cd.png?x-goog-signature=3fa4015cabd586fdee77f418f709ad63765cb3513f5d0d96159833cdf7209d0d3c4efa212184de1d4b902ce17fbc7288be69404ae8b14b9c808f349ce2acf3054a4706326ecf33980dfe86d28cc9837eb3ed5036120e6080f6d076f9e0e5f2ba6bcc1a8b7ed953298f3fea33117de7bf78efe6e5e24c2d649e9b4b43b11a38afc842b1f2d6e7adbc12209df04f1621a7280816b0af38f957a744acaffc711032443dfbf7005c38292a123da8e42fbd55df32b8f1879e8df965e107424770c11ab931e0c38136e2412fb66c775cedcd8b16064b8e7ff7ca7dcddabe2fbf437e92c3ee68eef2fdb0716363ed7f118d6554b411dcfc129f7159be027f00585035c3&x-goog-algorithm=GOOG4-RSA-SHA256&x-goog-credential=t-form%40pooper-scooper.iam.gserviceaccount.com%2F20240511%2Feurope-central2%2Fstorage%2Fgoog4_request&x-goog-date=20240511T162819Z&x-goog-expires=259200&x-goog-signedheaders=host" alt="Descriptive Alt Text" width="20%" height="20%">
</div>
<div class="w3-display-middle">
<h1 class="w3-jumbo w3-animate-top">COMING SOON</h1>
<hr class="w3-border-grey" style="margin:auto;width:40%">
<p class="w3-large w3-center">Cyberpunk-2077</p>
</div>
<div class="w3-display-bottomleft w3-padding-large">
<h3>Welcome to the CD Projeckt Red Game Engine Server!</h3>
<p><b>Instance Name:</b> kamila-1</p>
<p><b>Instance Private IP Address: </b> 10.132.32.2</p>
<p><b>Zone: </b> europe-central2-b</p>
<p><b>Project ID:</b> pooper-scooper</p>
<p><b>Network Tags:</b> N/A</p>
</div>
</div>
</body></html>