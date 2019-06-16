From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource-91nzXlUTePbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH net-next 0/2] net: mediatek: Add MT7621 TRGMII mode support
Date: Sun, 16 Jun 2019 20:20:08 +0200
Message-ID: <20190616182010.18778-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Vivien Didelot <vivien.didelot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource-91nzXlUTePbQT0dZR+AlfA@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

TGlrZSBtYW55IG90aGVyIG1lZGlhdGVrIFNPQ3MsIHRoZSBNVDc2MjEgU09DIGFuZCB0aGUgaW50
ZXJuYWwgTVQ3NTMwIHN3aXRjaCBib3RoCnN1cHBvcnRzIFRSR01JSSBtb2RlLiBNVDc2MjEgVFJH
TUlJIHNwZWVkIGlzIDEyMDBNQml0LgoKUmVuw6kgdmFuIERvcnN0ICgyKToKICBuZXQ6IGV0aGVy
bmV0OiBtZWRpYXRlazogQWRkIE1UNzYyMSBUUkdNSUkgbW9kZSBzdXBwb3J0CiAgbmV0OiBkc2E6
IG10NzUzMDogQWRkIE1UNzYyMSBUUkdNSUkgbW9kZSBzdXBwb3J0CgogZHJpdmVycy9uZXQvZHNh
L210NzUzMC5jICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKy0tCiBkcml2ZXJzL25ldC9l
dGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jIHwgMzggKysrKysrKysrKysrKysrKysrLS0t
CiBkcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5oIHwgMTEgKysrKysr
CiAzIGZpbGVzIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgotLSAK
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
