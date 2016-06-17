import gnupg

gpg = gnupg.GPG(options=["--trust-model","always"])
