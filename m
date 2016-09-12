From: YT Shen <yt.shen@mediatek.com>
Subject: Re: [PATCH v7 7/9] drm/mediatek: add dsi transfer function
Date: Mon, 12 Sep 2016 18:16:21 +0800
Message-ID: <1473675381.12398.27.camel@mtksdaap41>
References: <1472815484-43821-1-git-send-email-yt.shen@mediatek.com>
 <1472815484-43821-8-git-send-email-yt.shen@mediatek.com>
 <1473215632.11736.21.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1473215632.11736.21.camel@mtksdaap41>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jie Qiu <jie.qiu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, yingjoe.chen@mediatek.com, Dan Carpenter <dan.carpenter@oracle.com>, Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, shaoming chen <shaoming.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

SGkgQ0ssCgpPbiBXZWQsIDIwMTYtMDktMDcgYXQgMTA6MzMgKzA4MDAsIENLIEh1IHdyb3RlOgo+
IEhpLCBZVDoKPiAKPiBPbiBGcmksIDIwMTYtMDktMDIgYXQgMTk6MjQgKzA4MDAsIFlUIFNoZW4g
d3JvdGU6Cj4gPiBGcm9tOiBzaGFvbWluZyBjaGVuIDxzaGFvbWluZy5jaGVuQG1lZGlhdGVrLmNv
bT4KPiA+IAo+ID4gYWRkIGRzaSByZWFkL3dyaXRlIGNvbW1hbmRzIGZvciB0cmFuc2ZlciBmdW5j
dGlvbgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBzaGFvbWluZyBjaGVuIDxzaGFvbWluZy5jaGVu
QG1lZGlhdGVrLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHNpLmMgfCAxODggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxODggaW5zZXJ0aW9ucygrKQo+ID4gCj4gCj4gW3NuaXAuLi5dCj4gCj4g
PiAgCj4gPiArc3RhdGljIHZvaWQgbXRrX2RzaV9pcnFfZGF0YV9jbGVhcihzdHJ1Y3QgbXRrX2Rz
aSAqZHNpLCB1MzIgaXJxX2JpdCkKPiA+ICt7Cj4gPiArCWRzaS0+aXJxX2RhdGEgJj0gfmlycV9i
aXQ7Cj4gPiArfQo+ID4gKwo+IAo+IFtzbmlwLi4uXQo+IAo+ID4gKwo+ID4gK3N0YXRpYyBzMzIg
bXRrX2RzaV93YWl0X2Zvcl9pcnFfZG9uZShzdHJ1Y3QgbXRrX2RzaSAqZHNpLCB1MzIgaXJxX2Zs
YWcsCj4gPiArCQkJCSAgICAgdW5zaWduZWQgaW50IHRpbWVvdXQpCj4gPiArewo+ID4gKwlzMzIg
cmV0ID0gMDsKPiA+ICsJdW5zaWduZWQgbG9uZyBqaWZmaWVzID0gbXNlY3NfdG9famlmZmllcyh0
aW1lb3V0KTsKPiA+ICsKPiA+ICsJcmV0ID0gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVv
dXQoX2RzaV9pcnFfd2FpdF9xdWV1ZSwKPiA+ICsJCQkJCSAgICAgICBkc2ktPmlycV9kYXRhICYg
aXJxX2ZsYWcsCj4gPiArCQkJCQkgICAgICAgamlmZmllcyk7Cj4gPiArCWlmIChyZXQgPT0gMCkg
ewo+ID4gKwkJZGV2X2luZm8oZHNpLT5kZXYsICJXYWl0IERTSSBJUlEoMHglMDh4KSBUaW1lb3V0
XG4iLCBpcnFfZmxhZyk7Cj4gPiArCj4gPiArCQltdGtfZHNpX2VuYWJsZShkc2kpOwo+ID4gKwkJ
bXRrX2RzaV9yZXNldF9lbmdpbmUoZHNpKTsKPiA+ICsJfQo+ID4gKwo+ID4gKwlyZXR1cm4gcmV0
Owo+ID4gK30KPiAKPiBJIHRoaW5rIG10a19kc2lfaXJxX2RhdGFfY2xlYXIoKSBhbmQgbXRrX2Rz
aV93YWl0X2Zvcl9pcnFfZG9uZSgpIHNob3VsZAo+IGJlIG1vdmVkIHRvIHRoZSA2dGggcGF0Y2gg
WzFdIG9mIHRoaXMgc2VyaWVzIGJlY2F1c2UgdGhlc2UgdHdvIGZ1bmN0aW9ucwo+IGRlYWwgdGhl
IGlycSBjb250cm9sLgpXZSB3aWxsIG1vdmUgbXRrX2RzaV9pcnFfZGF0YV9jbGVhcigpIHRvIHBh
dGNoICJkcm0vbWVkaWF0ZWs6IGFkZCBkc2kKaW50ZXJydXB0IGNvbnRyb2wiIGFuZCBwdXQgbXRr
X2RzaV93YWl0X2Zvcl9pcnFfZG9uZSgpIGhlcmUsIGJlY2F1c2UgaXQKaXMgdXNlZCBpbiB0aGUg
dHJhbnNmZXIgZnVuY3Rpb24uCgpSZWdhcmRzLAp5dC5zaGVuCj4gCj4gCj4gWzFdIGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTMxMDgxOS8KPiAKPiAKPiBSZWdhcmRzLAo+IENL
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
