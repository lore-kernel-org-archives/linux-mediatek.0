From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/9] drm/mediatek: add CONFIG_OF dependency
Date: Wed, 10 Aug 2016 23:54:10 +0200
Message-ID: <20160810215424.1926658-5-arnd@arndb.de>
References: <20160810215424.1926658-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160810215424.1926658-1-arnd@arndb.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

VGhlIG1lZGlhdGVrIERSTSBkcml2ZXIgY2FuIGJlIGNvbmZpZ3VyZWQgZm9yIGNvbXBpbGUgdGVz
dGluZyB3aXRoCkNPTkZJR19PRiBkaXNhYmxlZCwgYnV0IHRoZW4gZmFpbHMgdG8gbGluazoKCmRy
aXZlcnMvZ3B1L2J1aWx0LWluLm86IEluIGZ1bmN0aW9uIGBtdGtfZHJtX2JpbmQnOgphbmFsb2dp
eF9kcF9yZWcuYzooLnRleHQrMHg1Mjg4OCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYG9mX2Zp
bmRfZGV2aWNlX2J5X25vZGUnCmFuYWxvZ2l4X2RwX3JlZy5jOigudGV4dCsweDUyOTMwKTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgb2ZfZmluZF9kZXZpY2VfYnlfbm9kZScKClRoaXMgYWRkcyBh
biBleHBsaWNpdCBLY29uZmlnIGRlcGVuZGVuY3kuCgpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgpMaW5rOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Bh
dGNoLzkxMjA4NzEvCi0tLQpJIG9yaWdpbmFsbHkgc2VudCB0aGlzIG9uIE1heSAxOCB3aGVuIHRo
ZSBkcml2ZXIgd2FzIG5ld2x5IGFkZGVkLApidXQgbXkgZml4IG5ldmVyIG1hZGUgaXQuCi0tLQog
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29u
ZmlnIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcKaW5kZXggNWMyMTYzNzM3Njkx
Li45NmViZjhiYjYwMjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29u
ZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9LY29uZmlnCkBAIC0zLDYgKzMsNyBA
QCBjb25maWcgRFJNX01FRElBVEVLCiAJZGVwZW5kcyBvbiBEUk0KIAlkZXBlbmRzIG9uIEFSQ0hf
TUVESUFURUsgfHwgKEFSTSAmJiBDT01QSUxFX1RFU1QpCiAJZGVwZW5kcyBvbiBDT01NT05fQ0xL
CisJZGVwZW5kcyBvbiBPRgogCXNlbGVjdCBEUk1fR0VNX0NNQV9IRUxQRVIKIAlzZWxlY3QgRFJN
X0tNU19IRUxQRVIKIAlzZWxlY3QgRFJNX01JUElfRFNJCi0tIAoyLjkuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
