# Akamai Property Redirect Project

This project demonstrates how to manage Akamai Edge logic using Infrastructure as Code (Terraform).

## Objective
To implement a **301 Permanent Redirect** for legacy paths to strictly defined new destinations, ensuring SEO value is retained and user experience is seamless.

## Technical Implementation
- **Tooling:** Terraform (HCL)
- **Akamai Behavior:** `redirect`
- **Logic:**
  - **Criteria:** Matches incoming path `/old-product` OR `/legacy-item`.
  - **Behavior:** Triggers a 301 redirect to `/new-product`.
  - **Query Strings:** Preserved and appended to the new URL.

## Why Terraform?
Using Terraform allows us to version control our Akamai delivery configurations, enabling peer review and rollback capabilities before deploying to the Akamai Staging or Production networks.
