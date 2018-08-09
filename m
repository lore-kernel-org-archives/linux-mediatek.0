From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 07/14] drm/mediatek: add the comment about color format
 setting for OVL
Date: Thu, 9 Aug 2018 10:15:42 +0800
Message-ID: <1533780949-30141-8-git-send-email-stu.hsieh@mediatek.com>
References: <1533780949-30141-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1533780949-30141-1-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

VGhpcyBwYXRjaCBhZGQgdGhlIGNvbW1lbnQgYWJvdXQgY29sb3IgZm9ybWF0IHNldHRpbmcgZm9y
IE9WTAoKU2lnbmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyB8IDUgKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3Bfb3ZsLmMKaW5kZXggOTc4NzgyYTc3NjI5Li4wZmFjZDgyM2M1NTIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKQEAgLTE1Nyw2ICsxNTcsMTEgQEAgc3RhdGlj
IHZvaWQgbXRrX292bF9sYXllcl9vZmYoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWdu
ZWQgaW50IGlkeCkKIAogc3RhdGljIHVuc2lnbmVkIGludCBvdmxfZm10X2NvbnZlcnQoc3RydWN0
IG10a19kaXNwX292bCAqb3ZsLCB1bnNpZ25lZCBpbnQgZm10KQogeworCS8qIFRoZSByZXR1cm4g
dmFsdWUgaW4gc3dpdGNoICJNRU1fTU9ERV9JTlBVVF9GT1JNQVRfWFhYIgorCSAqIGlzIGRlZmlu
ZWQgaW4gbWVkaWF0ZWsgSFcgZGF0YSBzaGVldC4KKwkgKiBUaGUgYWxwaGFiZXQgb3JkZXIgaW4g
WFhYIGlzIG5vIHJlbGF0aW9uIHRvIGRhdGEKKwkgKiBhcnJhbmdlbWVudCBpbiBtZW1vcnkuCisJ
ICovCiAJc3dpdGNoIChmbXQpIHsKIAlkZWZhdWx0OgogCWNhc2UgRFJNX0ZPUk1BVF9SR0I1NjU6
Ci0tIAoyLjEyLjUuMi5nYmRmMjNhYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
