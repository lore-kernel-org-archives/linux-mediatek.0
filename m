From: NeilBrown <neil@brown.name>
Subject: [PATCH] Fix compilation problem for mt7621_wdt.c and rt2880_wdt.c
Date: Sun, 30 Dec 2018 14:21:52 +1100
Message-ID: <87va3baecv.fsf@notabene.neil.brown.name>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


These files need
   #include <linux/mod_devicetable.h>
to compile correctly.

Fixes: ac3167257b9f ("headers: separate linux/mod_devicetable.h from linux/=
platform_device.h")
Signed-off-by: NeilBrown <neil@brown.name>
=2D--
 drivers/watchdog/mt7621_wdt.c | 1 +
 drivers/watchdog/rt2880_wdt.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/watchdog/mt7621_wdt.c b/drivers/watchdog/mt7621_wdt.c
index 5c4a764717c4..81208cd3f4ec 100644
=2D-- a/drivers/watchdog/mt7621_wdt.c
+++ b/drivers/watchdog/mt7621_wdt.c
@@ -17,6 +17,7 @@
 #include <linux/watchdog.h>
 #include <linux/moduleparam.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
=20
 #include <asm/mach-ralink/ralink_regs.h>
=20
diff --git a/drivers/watchdog/rt2880_wdt.c b/drivers/watchdog/rt2880_wdt.c
index 98967f0a7d10..db7c57d82cfd 100644
=2D-- a/drivers/watchdog/rt2880_wdt.c
+++ b/drivers/watchdog/rt2880_wdt.c
@@ -18,6 +18,7 @@
 #include <linux/watchdog.h>
 #include <linux/moduleparam.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
=20
 #include <asm/mach-ralink/ralink_regs.h>
=20
=2D-=20
2.14.0.rc0.dirty


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAlwoOdAACgkQOeye3VZi
gbkqWQ//YKTJTvlZMqjc9uJfZ21otVhUFJ5H0mupNw4O8K4DD+KsntNV9BvyeClm
AsNC9XztkaUTW0Oa8De+LQdwHDNXDFl/MA6ISVESD6KPY5ZHjg9yjAstiuUt1HdV
YGODAKsPlkfwSIUVVmWJf7vWw8WXTqn573TPJfxVIsVfkU9zYsv/uN6SfjFxjAVR
p7KMoEqL4SAlo07ZPpED99eK8CmTd6MJTUdtEkiZbRv8Pq0zX7xnikjahEXhsy7a
PqzUDD9asoul0h/8ZgH2zV6ihanMaQWAKHRSeEapLPuswIYpxuwiCM1rDBdkezbK
nnRAsFjAf99DdquBq+W/4UPE47mOIFmV29C4Cpptjs7aHtCfF0RJgNYn3CpaDsTn
xnjiBkcz6NONZIDQEDIDmn5V0yfVbZKd5+WjbhlOeEpYXvigQtM80Gvtpn2NlZaj
yqSwbtDm7qdWw6y3BNcpkZg2UabE+/7EfZjCriZk6RQ4l6NiGSDzFIBK57ea/NT3
JpZYLuIBneTBEki/LnKcHQQ6pACXDBhUGp1VkqgCMxMBPB9eKTgMFTFdd+erercm
rkZjlGRWGadpEzhi/Fe396/U5BPOgrpqB+I1oW7BCqxjlfWQKYPKuwZZaaIPJmzb
43jbdSa/JctG7XFYo9zQayaz7FwL7nf5fTP42f7VATvGVHvG4JM=
=MXIp
-----END PGP SIGNATURE-----
--=-=-=--
