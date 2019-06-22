From: Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH v3 0/4] Panel rotation patches
Date: Fri, 21 Jun 2019 20:41:01 -0700
Message-ID: <20190622034105.188454-1-dbasehore@chromium.org>
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
Cc: Derek Basehore <dbasehore@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>, intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

VGhpcyBhZGRzIHRoZSBwbHVtYmluZyBmb3IgcmVhZGluZyBwYW5lbCByb3RhdGlvbiBmcm9tIHRo
ZSBkZXZpY2V0cmVlCmFuZCBzZXRzIHVwIGFkZGluZyBhIHBhbmVsIHByb3BlcnR5IGZvciB0aGUg
cGFuZWwgb3JpZW50YXRpb24gb24KTWVkaWF0ZWsgU29DcyB3aGVuIGEgcm90YXRpb24gaXMgcHJl
c2VudC4KCnYzIGNoYW5nZXM6Ci1jaGFuZ2VkIGZyb20gYXR0YWNoL2RldGFjaCBjYWxsYmFja3Mg
dG8gZGlyZWN0bHkgc2V0dGluZyBmaXhlZCBwYW5lbAogdmFsdWVzIGluIGRybV9wYW5lbF9hdHRh
Y2gKLXJlbW92ZWQgdXBkYXRlIHRvIERvY3VtZW50YXRpb24KLWFkZGVkIHNlcGFyYXRlIGZ1bmN0
aW9uIGZvciBxdWlya2VkIHBhbmVsIG9yaWVudGF0aW9uIHByb3BlcnR5IGluaXQKCnYyIGNoYW5n
ZXM6CmZpeGVkIGJ1aWxkIGVycm9ycyBpbiBpOTE1CgpEZXJlayBCYXNlaG9yZSAoNCk6CiAgZHJt
L3BhbmVsOiBBZGQgaGVscGVyIGZvciByZWFkaW5nIERUIHJvdGF0aW9uCiAgZHJtL3BhbmVsOiBz
ZXQgZGlzcGxheSBpbmZvIGluIHBhbmVsIGF0dGFjaAogIGRybS9jb25uZWN0b3I6IFNwbGl0IG91
dCBvcmllbnRhdGlvbiBxdWlyayBkZXRlY3Rpb24KICBkcm0vbXRrOiBhZGQgcGFuZWwgb3JpZW50
YXRpb24gcHJvcGVydHkKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgIHwgNDUg
KysrKysrKysrKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jICAgICAgICB8
IDcwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUv
aW50ZWxfZHAuYyAgICB8ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS92bHZfZHNpLmMgICAg
IHwgIDUgKy0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgIDggKysrKwog
aW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICAgICB8ICAyICsKIGluY2x1ZGUvZHJtL2Ry
bV9wYW5lbC5oICAgICAgICAgICAgfCAyMSArKysrKysrKysKIDcgZmlsZXMgY2hhbmdlZCwgMTM4
IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIx
YjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
SW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4
