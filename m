From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH V3,4/8] drm/mediatek: fix the rate and divder of hdmi
 phy for MT2701
Date: Mon, 28 Jan 2019 16:52:20 +0800
Message-ID: <1548665540.10401.0.camel@mtksdaap41>
References: <20190125040205.5451-1-wangyan.wang@mediatek.com>
 <20190125040205.5451-5-wangyan.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190125040205.5451-5-wangyan.wang@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Wangyan Wang <wangyan.wang@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, jitao.shi@mediatek.com, srv_heupstream@mediatek.com, chunhui dai <chunhui.dai@mediatek.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Colin Ian King <colin.king@canonical.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

T24gRnJpLCAyMDE5LTAxLTI1IGF0IDEyOjAyICswODAwLCBXYW5neWFuIFdhbmcgd3JvdGU6Cj4g
RnJvbTogY2h1bmh1aSBkYWkgPGNodW5odWkuZGFpQG1lZGlhdGVrLmNvbT4KPiAKPiBEdWUgdG8g
YSBjbGVyaWNhbCBlcnJvcix0aGVyZSBpcyBvbmUgemVybyBsZXNzIGZvciAxMjgwMDAwMC4KPiBG
aXggaXQgZm9yIDEyODAwMDAwMC4KPiAKClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0
ZWsuY29tPgoKPiBGaXhlczogMGZjNzIxYjI5NjhlICgiZHJtL21lZGlhdGVrOiBhZGQgaGRtaSBk
cml2ZXIgZm9yIE1UMjcwMSBhbmQgTVQ3NjIzIikKPiBTaWduZWQtb2ZmLWJ5OiBjaHVuaHVpIGRh
aSA8Y2h1bmh1aS5kYWlAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IHdhbmd5YW4gd2Fu
ZyA8d2FuZ3lhbi53YW5nQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19tdDI3MDFfaGRtaV9waHkuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210MjcwMV9oZG1pX3BoeS5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19tdDI3MDFfaGRtaV9waHkuYwo+IGluZGV4IDQzYmMwNThkNTUyOC4uODhk
ZDllODEyY2EwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQy
NzAxX2hkbWlfcGh5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210Mjcw
MV9oZG1pX3BoeS5jCj4gQEAgLTExNCw4ICsxMTQsOCBAQCBzdGF0aWMgaW50IG10a19oZG1pX3Bs
bF9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQgbG9uZyByYXRlLAo+ICAKPiAg
CWlmIChyYXRlIDw9IDY0MDAwMDAwKQo+ICAJCXBvc19kaXYgPSAzOwo+IC0JZWxzZSBpZiAocmF0
ZSA8PSAxMjgwMDAwMCkKPiAtCQlwb3NfZGl2ID0gMTsKPiArCWVsc2UgaWYgKHJhdGUgPD0gMTI4
MDAwMDAwKQo+ICsJCXBvc19kaXYgPSAyOwo+ICAJZWxzZQo+ICAJCXBvc19kaXYgPSAxOwo+ICAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
