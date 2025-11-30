Akamai Edge Logic: Redirects & Geo-Routing
Project Overview

This repository serves as a technical portfolio demonstrating the programmatic management of Akamai Edge configurations. It moves beyond manual Property Manager UI configurations to showcase modern Infrastructure as Code (IaC) and Serverless Edge Computing practices.
This project was developed in a cloud-native environment (GitHub Codespaces) to simulate a remote DevOps workflow.

Key Components
1. Infrastructure as Code (Terraform)
• File: main.tf
• Objective: To manage static delivery rules safely and efficiently.
• Implementation:
• Utilizes the Akamai Terraform Provider to define property rules.
• Implements a 301 Permanent Redirect strategy for legacy product paths (/old-product → /new-product).
• Business Value: Ensures SEO rankings are preserved during site migrations and allows for version-controlled, peer-reviewed configuration changes before deployment.

2. Edge Computing (Akamai EdgeWorkers)
• File: edgeworker-bundle/main.js
• Objective: To handle dynamic, user-centric logic at the network edge.
• Implementation:
• Written in JavaScript (ES6) using the Akamai EdgeWorker API.
• listens for the onClientRequest event to intercept traffic before it reaches the origin server.
• Logic: Inspects the incoming request's Country Code. If the user is located in Great Britain (GB), they are immediately redirected to the localized /uk-store.
• Business Value: Reduces latency by handling logic at the edge and improves user experience by serving localized content automatically.

Technical Stack
• Language: HCL (HashiCorp Configuration Language), JavaScript.
• Provider: Akamai (akamai/akamai).
• Concepts: CDN Management, HTTP Status Codes (301 vs 302), Geo-Targeting, Event-Driven Architecture.
