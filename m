From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 09/11] drm: direct include of drm.h in
 drm_syncobj.c
Date: Thu, 18 Jul 2019 18:15:05 +0200
Message-ID: <20190718161507.2047-10-sam@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190718161507.2047-1-sam@ravnborg.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, CK Hu <ck.hu@mediatek.com>, Thierry Reding <treding@nvidia.com>, Chunming Zhou <david1.zhou@amd.com>, Jani Nikula <jani.nikula@intel.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, linux-mediatek@lists.infradead.org, Stefan Agner <stefan@agner.ch>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
List-Id: linux-mediatek@lists.infradead.org

RG8gbm90IHJlbHkgb24gaW5jbHVkaW5nIGRybS5oIGZyb20gZHJtX2ZpbGUuaCwKYXMgdGhlIGlu
Y2x1ZGUgaW4gZHJtX2ZpbGUuaCB3aWxsIGJlIGRyb3BwZWQuCgpTaWduZWQtb2ZmLWJ5OiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRl
bi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPgpDYzogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwu
Y29tPgpDYzogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KQ2M6IENocmlzdGlh
biBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fc3luY29iai5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fc3luY29iai5jCmluZGV4IGExOTljOGQ1NmI5NS4uNzVjYjRiYjc2MTllIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX3N5bmNvYmouYwpAQCAtNTMsNiArNTMsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3N5
bmNfZmlsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KIAorI2luY2x1ZGUgPGRybS9k
cm0uaD4KICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgogI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5o
PgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtLmg+Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeA==
