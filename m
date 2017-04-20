From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] drm/mediatek: fix a loop timeout
Date: Thu, 20 Apr 2017 13:24:23 +0300
Message-ID: <20170420102423.5yqe6uwohaeleyyl@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>, shaoming chen <shaoming.chen@mediatek.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

V2UgZXhwZWN0ZWQgdG8gZW5kIHdpdGggInRpbWVvdXRfbXMiIHNldCB0byB6ZXJvLCBidXQgaXQn
cyBhIHBvc3Qtb3Agc28KdGhlIGN1cnJlbnQgY29kZSBlbmRzIHdpdGggLTEuICBMZXQncyBmaXgg
dGhpcyBieSBjaGFuZ2luZyBpdCB0byBhCnByZS1vcC4KCkZpeGVzOiAyMTg5ODgxNjgzMWYgKCJk
cm0vbWVkaWF0ZWs6IGFkZCBkc2kgdHJhbnNmZXIgZnVuY3Rpb24iKQpTaWduZWQtb2ZmLWJ5OiBE
YW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+CgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMKaW5kZXggODA4Yjk5NWE5OTBmLi4zYTBiNmQxMDU3YTIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYwpAQCAtOTAyLDcgKzkwMiw3IEBAIHN0YXRpYyB2b2lkIG10a19k
c2lfd2FpdF9mb3JfaWRsZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQogewogCXUzMiB0aW1lb3V0X21z
ID0gNTAwMDAwOyAvKiB0b3RhbCAxcyB+IDJzIHRpbWVvdXQgKi8KIAotCXdoaWxlICh0aW1lb3V0
X21zLS0pIHsKKwl3aGlsZSAoLS10aW1lb3V0X21zKSB7CiAJCWlmICghKHJlYWRsKGRzaS0+cmVn
cyArIERTSV9JTlRTVEEpICYgRFNJX0JVU1kpKQogCQkJYnJlYWs7CiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
