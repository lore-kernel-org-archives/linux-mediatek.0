From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 01/11] drm/panel: make drm_panel.h
 self-contained
Date: Thu, 18 Jul 2019 18:14:57 +0200
Message-ID: <20190718161507.2047-2-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, CK Hu <ck.hu@mediatek.com>, Thierry Reding <treding@nvidia.com>, Chunming Zhou <david1.zhou@amd.com>, Jani Nikula <jani.nikula@intel.com>, Boris Brezillon <boris.brezillon@bootlin.com>, linux-mediatek@lists.infradead.org, Stefan Agner <stefan@agner.ch>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KCkZpeCBidWlsZCB3YXJu
aW5nIGlmIGRybV9wYW5lbC5oIGlzIGJ1aWx0IHdpdGggQ09ORklHX09GPW4gb3IKQ09ORklHX0RS
TV9QQU5FTD1uIGFuZCBpbmNsdWRlZCB3aXRob3V0IHRoZSBwcmVyZXF1aXNpdGUgZXJyLmg6Cgou
L2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oOiBJbiBmdW5jdGlvbiDigJhvZl9kcm1fZmluZF9wYW5l
bOKAmToKLi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaDoyMDM6OTogZXJyb3I6IGltcGxpY2l0IGRl
Y2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmEVSUl9QVFLigJkgWy1XZXJyb3I9aW1wbGljaXQtZnVu
Y3Rpb24tZGVjbGFyYXRpb25dCiAgcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7CiAgICAgICAgIF5+
fn5+fn4KLi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaDoyMDM6OTogZXJyb3I6IHJldHVybmluZyDi
gJhpbnTigJkgZnJvbSBhIGZ1bmN0aW9uIHdpdGggcmV0dXJuIHR5cGUg4oCYc3RydWN0IGRybV9w
YW5lbCAq4oCZIG1ha2VzIHBvaW50ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0IFstV2Vy
cm9yPWludC1jb252ZXJzaW9uXQogIHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwogICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+CgpGaXhlczogNWZhOGU0YTIyMTgyICgiZHJtL3BhbmVsOiBNYWtlIG9m
X2RybV9maW5kX3BhbmVsKCkgcmV0dXJuIGFuIEVSUl9QVFIoKSBpbnN0ZWFkIG9mIE5VTEwiKQpD
YzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AYm9vdGxpbi5jb20+ClNpZ25lZC1v
ZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CkFja2VkLWJ5OiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgotLS0KIGluY2x1ZGUvZHJtL2RybV9wYW5lbC5oIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fcGFuZWwuaCBiL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCmluZGV4IDhjNzM4YzBlNmU5Zi4u
MjYzNzc4MzYxNDFjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAorKysgYi9p
bmNsdWRlL2RybS9kcm1fcGFuZWwuaApAQCAtMjQsNiArMjQsNyBAQAogI2lmbmRlZiBfX0RSTV9Q
QU5FTF9IX18KICNkZWZpbmUgX19EUk1fUEFORUxfSF9fCiAKKyNpbmNsdWRlIDxsaW51eC9lcnIu
aD4KICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgogI2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KIAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZng=
