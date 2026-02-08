 # Intercede App - MVP Architecture Overview

Intercede is an iOS-first church app that enables **members to submit prayer requests and praise reports** and allows **admins/pastors to manage, approve, and share content**. This document outlines the architecture, workflows, and tech choices for the MVP.

---

## 1. Actors

**Members (church-goers)**
- No accounts required
- Submit:
  - Prayer requests
  - Praise reports
- Optional: view praise feed (approved reports only)
- Local storage: remembers last submitted church

**Admins / Pastors**
- Login required (email + password)
- Can:
  - Approve / reject praise reports
  - Assign prayer requests to moderators
  - Upload notes/videos for members

---

## 2. iOS Frontend (SwiftUI)

**Member Screens**
- Enter church code → Confirm church → Submit request/report
- Optional read-only praise feed
- Local storage (UserDefaults) for last-used church

**Admin Screens**
- Login / Create Church
- Moderation queue for prayer requests and praise reports
- Approve & publish content
- Upload videos / PDFs / notes

---

## 3. Backend (Go / Phoenix)

**REST API Endpoints**

- **Member-facing**
  - `POST /submit/prayer_request`
  - `POST /submit/praise_report`
  - `GET /praise_feed`

- **Admin-facing**
  - `POST /admin/login`
  - `GET /admin/prayer_requests?status=pending`
  - `PATCH /admin/prayer_requests/:id` (assign/status update)
  - `POST /admin/approve_praise/:id`
  - `POST /admin/content/upload`

**Responsibilities**
- Authenticate admins
- Enforce role-based access
- Trigger push notifications (APNs)
- Multi-tenant church scoping

---

## 4. Database (PostgreSQL)

**Tables**

| Table | Core Fields |
|-------|-------------|
| churches | id, name, code, logo |
| users | id, church_id, email, role, password_hash |
| prayer_requests | id, church_id, content, submitter_name, status, assigned_to, created_at |
| praise_reports | id, church_id, content, submitter_name, consent_to_share, status, reviewed_by, reviewed_at |
| content | id, church_id, type(video/pdf), title, url, uploaded_by, published_at |

---

## 5. Storage (S3 / Supabase)

- Stores videos, PDFs, and sermon notes uploaded by admins
- Backend serves URLs according to church access
- Optional: signed URLs for secure downloads

---

## 6. Push Notifications (APNs)

- **Member submission confirmation** → device receives “Request received”
- **Admin acknowledgment** → device receives “Your church viewed your prayer request”
- Optional: approved praise report → device receives “Praise report published”

Tokens stored per device/session (no member accounts required)

---

## 7. Core Workflows

### Member Submission
1. Member enters church code
2. Backend validates church → stores submission in DB
3. Backend triggers APNs → confirmation
4. Admin sees request in moderation queue

### Praise Report Moderation
1. Member submits praise report
2. Admin reviews → approves/publishes
3. Published report added to feed
4. Optional member push notification

---

## 8. Key Architecture Principles

- iOS-first, SwiftUI for smooth UX
- API-first backend (Go or Phoenix) for cross-platform expansion
- Multi-tenant safe: church-scoped data
- Simple state model: Submission → Moderation → Published
- Push notifications integrated
- Expandable to videos, PDFs, praise feed, and future admin portals

---

## 9. Future Considerations

- Optional member accounts for history & subscriptions
- Multi-church caching and last-used church per device
- Advanced moderation tools for admins
- Web admin portal for content management
- Additional analytics & reporting

