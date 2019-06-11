From: Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH 0/5] Panel rotation patches
Date: Mon, 10 Jun 2019 17:22:51 -0700
Message-ID: <20190611002256.186969-1-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: linux-kernel@vger.kernel.org
Cc: Derek Basehore <dbasehore@chromium.org>, p.zabel@pengutronix.de, maxime.ripard@bootlin.com, sam@ravnborg.org, intel-gfx@lists.freedesktop.org, airlied@linux.ie, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, ck.hu@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

VGhpcyBhZGRzIHRoZSBwbHVtYmluZyBmb3IgcmVhZGluZyBwYW5lbCByb3RhdGlvbiBmcm9tIHRo
ZSBkZXZpY2V0cmVlCmFuZCBzZXRzIHVwIGFkZGluZyBhIHBhbmVsIHByb3BlcnR5IGZvciB0aGUg
cGFuZWwgb3JpZW50YXRpb24gb24KTWVkaWF0ZWsgU29DcyB3aGVuIGEgcm90YXRpb24gaXMgcHJl
c2VudC4KCkRlcmVrIEJhc2Vob3JlICg1KToKICBkcm0vcGFuZWw6IEFkZCBoZWxwZXIgZm9yIHJl
YWRpbmcgRFQgcm90YXRpb24KICBkdC1iaW5kaW5nczogZGlzcGxheS9wYW5lbDogRXhwYW5kIHJv
dGF0aW9uIGRvY3VtZW50YXRpb24KICBkcm0vcGFuZWw6IEFkZCBhdHRhY2gvZGV0YWNoIGNhbGxi
YWNrcwogIGRybS9jb25uZWN0b3I6IFNwbGl0IG91dCBvcmllbnRhdGlvbiBxdWlyayBkZXRlY3Rp
b24KICBkcm0vbXRrOiBhZGQgcGFuZWwgb3JpZW50YXRpb24gcHJvcGVydHkKCiAuLi4vYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9wYW5lbC50eHQgICAgICAgICAgfCAzMiArKysrKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyAgICAgICAgICAgICAgIHwgMTYgKystLS0tCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMgICAgICAgICAgICAgICAgICAgfCA1NSArKysrKysr
KysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS92bHZfZHNpLmMgICAgICAgICAgICAg
ICAgfCAxMyArKystLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyAgICAgICAg
ICAgIHwgIDggKysrCiBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggICAgICAgICAgICAgICAg
ICAgfCAgMiArLQogaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggICAgICAgICAgICAgICAgICAgICAg
IHwgMTEgKysrKwogNyBmaWxlcyBjaGFuZ2VkLCAxMjAgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRp
b25zKC0pCgotLSAKMi4yMi4wLnJjMi4zODMuZ2Y0ZmJiZjMwYzItZ29vZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlz
dApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
