From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v7 7/9] drm/mediatek: add dsi transfer function
Date: Tue, 13 Sep 2016 17:25:54 +0800
Message-ID: <1473758754.28437.40.camel@mtksdaap41>
References: <1472815484-43821-1-git-send-email-yt.shen@mediatek.com>
 <1472815484-43821-8-git-send-email-yt.shen@mediatek.com>
 <1473215632.11736.21.camel@mtksdaap41>
 <1473675381.12398.27.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1473675381.12398.27.camel@mtksdaap41>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YT Shen <yt.shen@mediatek.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jie Qiu <jie.qiu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, yingjoe.chen@mediatek.com, Dan Carpenter <dan.carpenter@oracle.com>, Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, shaoming chen <shaoming.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

SGksIFlUOgoKT24gTW9uLCAyMDE2LTA5LTEyIGF0IDE4OjE2ICswODAwLCBZVCBTaGVuIHdyb3Rl
Ogo+IEhpIENLLAo+IAo+IE9uIFdlZCwgMjAxNi0wOS0wNyBhdCAxMDozMyArMDgwMCwgQ0sgSHUg
d3JvdGU6Cj4gPiBIaSwgWVQ6Cj4gPiAKPiA+IE9uIEZyaSwgMjAxNi0wOS0wMiBhdCAxOToyNCAr
MDgwMCwgWVQgU2hlbiB3cm90ZToKPiA+ID4gRnJvbTogc2hhb21pbmcgY2hlbiA8c2hhb21pbmcu
Y2hlbkBtZWRpYXRlay5jb20+Cj4gPiA+IAo+ID4gPiBhZGQgZHNpIHJlYWQvd3JpdGUgY29tbWFu
ZHMgZm9yIHRyYW5zZmVyIGZ1bmN0aW9uCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBzaGFv
bWluZyBjaGVuIDxzaGFvbWluZy5jaGVuQG1lZGlhdGVrLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMTg4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxODggaW5zZXJ0aW9u
cygrKQo+ID4gPiAKPiA+IAo+ID4gW3NuaXAuLi5dCj4gPiAKPiA+ID4gIAo+ID4gPiArc3RhdGlj
IHZvaWQgbXRrX2RzaV9pcnFfZGF0YV9jbGVhcihzdHJ1Y3QgbXRrX2RzaSAqZHNpLCB1MzIgaXJx
X2JpdCkKPiA+ID4gK3sKPiA+ID4gKwlkc2ktPmlycV9kYXRhICY9IH5pcnFfYml0Owo+ID4gPiAr
fQo+ID4gPiArCj4gPiAKPiA+IFtzbmlwLi4uXQo+ID4gCj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBz
MzIgbXRrX2RzaV93YWl0X2Zvcl9pcnFfZG9uZShzdHJ1Y3QgbXRrX2RzaSAqZHNpLCB1MzIgaXJx
X2ZsYWcsCj4gPiA+ICsJCQkJICAgICB1bnNpZ25lZCBpbnQgdGltZW91dCkKPiA+ID4gK3sKPiA+
ID4gKwlzMzIgcmV0ID0gMDsKPiA+ID4gKwl1bnNpZ25lZCBsb25nIGppZmZpZXMgPSBtc2Vjc190
b19qaWZmaWVzKHRpbWVvdXQpOwo+ID4gPiArCj4gPiA+ICsJcmV0ID0gd2FpdF9ldmVudF9pbnRl
cnJ1cHRpYmxlX3RpbWVvdXQoX2RzaV9pcnFfd2FpdF9xdWV1ZSwKPiA+ID4gKwkJCQkJICAgICAg
IGRzaS0+aXJxX2RhdGEgJiBpcnFfZmxhZywKPiA+ID4gKwkJCQkJICAgICAgIGppZmZpZXMpOwo+
ID4gPiArCWlmIChyZXQgPT0gMCkgewo+ID4gPiArCQlkZXZfaW5mbyhkc2ktPmRldiwgIldhaXQg
RFNJIElSUSgweCUwOHgpIFRpbWVvdXRcbiIsIGlycV9mbGFnKTsKPiA+ID4gKwo+ID4gPiArCQlt
dGtfZHNpX2VuYWJsZShkc2kpOwo+ID4gPiArCQltdGtfZHNpX3Jlc2V0X2VuZ2luZShkc2kpOwo+
ID4gPiArCX0KPiA+ID4gKwo+ID4gPiArCXJldHVybiByZXQ7Cj4gPiA+ICt9Cj4gPiAKPiA+IEkg
dGhpbmsgbXRrX2RzaV9pcnFfZGF0YV9jbGVhcigpIGFuZCBtdGtfZHNpX3dhaXRfZm9yX2lycV9k
b25lKCkgc2hvdWxkCj4gPiBiZSBtb3ZlZCB0byB0aGUgNnRoIHBhdGNoIFsxXSBvZiB0aGlzIHNl
cmllcyBiZWNhdXNlIHRoZXNlIHR3byBmdW5jdGlvbnMKPiA+IGRlYWwgdGhlIGlycSBjb250cm9s
Lgo+IFdlIHdpbGwgbW92ZSBtdGtfZHNpX2lycV9kYXRhX2NsZWFyKCkgdG8gcGF0Y2ggImRybS9t
ZWRpYXRlazogYWRkIGRzaQo+IGludGVycnVwdCBjb250cm9sIiBhbmQgcHV0IG10a19kc2lfd2Fp
dF9mb3JfaXJxX2RvbmUoKSBoZXJlLCBiZWNhdXNlIGl0Cj4gaXMgdXNlZCBpbiB0aGUgdHJhbnNm
ZXIgZnVuY3Rpb24uCgptdGtfZHNpX2lycV9kYXRhX2NsZWFyKCkgaXMgYWxzbyBvbmx5IHVzZWQg
aW4gdHJhbnNmZXIgZnVuY3Rpb24gbm93LiBJCnRoaW5rIGJvdGggZnVuY3Rpb24gY291bGQgYmUg
dXNlZCBmb3Igb3RoZXIgYXBwbGljYXRpb24gcmF0aGVyIHRoYW4KdHJhbnNmZXIgZnVuY3Rpb24s
IHNvIHRoZXNlIHR3byBmdW5jdGlvbiBhcmUgZ2VuZXJhbCBmdW5jdGlvbiBmb3IgaXJxCmNvbnRy
b2wuCgpSZWdhcmRzLApDSwoKPiAKPiBSZWdhcmRzLAo+IHl0LnNoZW4KPiA+IAo+ID4gCj4gPiBb
MV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85MzEwODE5Lwo+ID4gCj4gPiAK
PiA+IFJlZ2FyZHMsCj4gPiBDSwo+ID4gCj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
