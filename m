From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 03/11] drm: drop uapi dependency from
 drm_vblank.h
Date: Thu, 18 Jul 2019 18:14:59 +0200
Message-ID: <20190718161507.2047-4-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, CK Hu <ck.hu@mediatek.com>, Thierry Reding <treding@nvidia.com>, Chunming Zhou <david1.zhou@amd.com>, Jani Nikula <jani.nikula@intel.com>, linux-mediatek@lists.infradead.org, Stefan Agner <stefan@agner.ch>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
List-Id: linux-mediatek@lists.infradead.org

ZHJtX3ZibGFuay5oIGluY2x1ZGVkIHVhcGkvZHJtL2RybS5oLgpJdCB0dXJucyBvdXQgdGhpcyBp
bmNsdWRlIHdhcyBub3QgcmVxdWlyZWQgLSBkZWxldGUgaXQuCgpOb3RlOiB1YXBpL2RybS9kcm0u
aCBpcyBpbmNsdWRlZCBpbmRpcmVjdCB2aWEgZHJtX2ZpbGUuaCwKYnV0IHRoZXJlIGFyZSBubyBk
ZXBlbmRlbmNpZXMgaW4gZHJtX3ZibGFuay5oIHNvIHRoZSByZW1vdmFsCmlzIGxlZ2l0LgoKU2ln
bmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJk
IDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KQ2M6
IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogaW5jbHVkZS9kcm0vZHJt
X3ZibGFuay5oIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV92YmxhbmsuaCBiL2luY2x1ZGUvZHJtL2RybV92YmxhbmsuaApp
bmRleCBlNTI4YmIyZjY1OWQuLjlmZTRiYThiYzYyMiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0v
ZHJtX3ZibGFuay5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV92YmxhbmsuaApAQCAtMzAsNyArMzAs
NiBAQAogCiAjaW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9tb2Rl
cy5oPgotI2luY2x1ZGUgPHVhcGkvZHJtL2RybS5oPgogCiBzdHJ1Y3QgZHJtX2RldmljZTsKIHN0
cnVjdCBkcm1fY3J0YzsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaW50ZWwtZ2Z4
