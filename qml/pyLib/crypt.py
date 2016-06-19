import gnupg,re

keyserver = "keys.gnupg.net"
gpg = gnupg.GPG(gpgbinary="gpg2",options=["--trust-model","always"])

def setKeyserver(newserver):
    '''
Change the preset keyserver
    '''
    global keyserver
    keyserver = newserver

_keypattern = re.compile(r".*<(.*)>.*")
def isKeyFor(uids,email):
    '''
Takes a List of key uids (from GPG.list_keys()) and checks if they contain "email"
    '''
    acc = False
    for uid in uids:
        mat = _keypattern.match(uid)
        if mat and mat.group(1) == email:
            acc = True
    return acc


