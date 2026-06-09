-- Demo account logins. Passwords are bcrypt hashes (saltRounds = 10) so they
-- work with the login flow (bcrypt.compare). Plaintext shown for demo reference:
--   tony@starkent.com   / Iam1ronM@n  (Admin)
--   electra@comics.net  / N1njut$u    (Employee)
--   we@assimilate.org   / St@rtr3k    (Client)
INSERT INTO public.account (
        account_firstname,
        account_lastname,
        account_email,
        account_password,
        account_type
    )
VALUES (
        'Tony',
        'Stark',
        'tony@starkent.com',
        '$2b$10$Sdouv4x5qYXhdyHWJmonj.gLK4r2ks/b6yxYrpjh.a1.FMMwclmb.',
        'Admin'
    ),
    (
        'Electra',
        'Natchios',
        'electra@comics.net',
        '$2b$10$ePFTRV5W3iBeVeZ7Saf/rOUXXz7YunRpz5xxk/9jxzP94RQGJel/O',
        'Employee'
    ),
    (
        'The',
        'Borg',
        'we@assimilate.org',
        '$2b$10$yX6EmVbfNpnbA0OR6JqMjOEnPY0dLbxH4lSIPHzGuByzIC9I2hoxW',
        'Client'
    )
