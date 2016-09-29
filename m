From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 2/2] drm/mediatek: clear IRQ status before enable OVL
 interrupt
Date: Thu, 29 Sep 2016 13:37:53 +0800
Message-ID: <1475127473.18843.6.camel@mtksdaap41>
References: <1475119789-64619-1-git-send-email-bibby.hsieh@mediatek.com>
 <1475119789-64619-3-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1475119789-64619-3-git-send-email-bibby.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

QWNrZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+CgpPbiBUaHUsIDIwMTYtMDktMjkg
YXQgMTE6MjkgKzA4MDAsIEJpYmJ5IEhzaWVoIHdyb3RlOgo+IFRvIG1ha2Ugc3VyZSB0aGF0IHRo
ZSBmaXJzdCB2YmxhbmsgSVJRIGFmdGVyIGVuYWJsaW5nCj4gdmJsYW5rIGlzbid0IHRvbyBzaG9y
dCBvciBpbW1lZGlhdGUsIHdlIGhhdmUgdG8gY2xlYXIKPiB0aGUgSVJRIHN0YXR1cyBiZWZvcmUg
ZW5hYmxlIE9WTCBpbnRlcnJ1cHQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJp
YmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX292bC5jIHwgICAgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiBpbmRleCAwMTli
N2NhLi5mNzVjNWI1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwu
Ywo+IEBAIC04MCw2ICs4MCw3IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfZW5hYmxlX3ZibGFuayhz
dHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLAo+ICAJCQkJCQkgZGRwX2NvbXApOwo+ICAKPiAgCXBy
aXYtPmNydGMgPSBjcnRjOwo+ICsJd3JpdGVsKDB4MCwgY29tcC0+cmVncyArIERJU1BfUkVHX09W
TF9JTlRTVEEpOwo+ICAJd3JpdGVsX3JlbGF4ZWQoT1ZMX0ZNRV9DUExfSU5ULCBjb21wLT5yZWdz
ICsgRElTUF9SRUdfT1ZMX0lOVEVOKTsKPiAgfQo+ICAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
