From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v7 7/9] drm/mediatek: add dsi transfer function
Date: Wed, 7 Sep 2016 10:33:52 +0800
Message-ID: <1473215632.11736.21.camel@mtksdaap41>
References: <1472815484-43821-1-git-send-email-yt.shen@mediatek.com>
 <1472815484-43821-8-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1472815484-43821-8-git-send-email-yt.shen@mediatek.com>
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

SGksIFlUOgoKT24gRnJpLCAyMDE2LTA5LTAyIGF0IDE5OjI0ICswODAwLCBZVCBTaGVuIHdyb3Rl
Ogo+IEZyb206IHNoYW9taW5nIGNoZW4gPHNoYW9taW5nLmNoZW5AbWVkaWF0ZWsuY29tPgo+IAo+
IGFkZCBkc2kgcmVhZC93cml0ZSBjb21tYW5kcyBmb3IgdHJhbnNmZXIgZnVuY3Rpb24KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBzaGFvbWluZyBjaGVuIDxzaGFvbWluZy5jaGVuQG1lZGlhdGVrLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDE4OCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxODggaW5z
ZXJ0aW9ucygrKQo+IAoKW3NuaXAuLi5dCgo+ICAKPiArc3RhdGljIHZvaWQgbXRrX2RzaV9pcnFf
ZGF0YV9jbGVhcihzdHJ1Y3QgbXRrX2RzaSAqZHNpLCB1MzIgaXJxX2JpdCkKPiArewo+ICsJZHNp
LT5pcnFfZGF0YSAmPSB+aXJxX2JpdDsKPiArfQo+ICsKCltzbmlwLi4uXQoKPiArCj4gK3N0YXRp
YyBzMzIgbXRrX2RzaV93YWl0X2Zvcl9pcnFfZG9uZShzdHJ1Y3QgbXRrX2RzaSAqZHNpLCB1MzIg
aXJxX2ZsYWcsCj4gKwkJCQkgICAgIHVuc2lnbmVkIGludCB0aW1lb3V0KQo+ICt7Cj4gKwlzMzIg
cmV0ID0gMDsKPiArCXVuc2lnbmVkIGxvbmcgamlmZmllcyA9IG1zZWNzX3RvX2ppZmZpZXModGlt
ZW91dCk7Cj4gKwo+ICsJcmV0ID0gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQoX2Rz
aV9pcnFfd2FpdF9xdWV1ZSwKPiArCQkJCQkgICAgICAgZHNpLT5pcnFfZGF0YSAmIGlycV9mbGFn
LAo+ICsJCQkJCSAgICAgICBqaWZmaWVzKTsKPiArCWlmIChyZXQgPT0gMCkgewo+ICsJCWRldl9p
bmZvKGRzaS0+ZGV2LCAiV2FpdCBEU0kgSVJRKDB4JTA4eCkgVGltZW91dFxuIiwgaXJxX2ZsYWcp
Owo+ICsKPiArCQltdGtfZHNpX2VuYWJsZShkc2kpOwo+ICsJCW10a19kc2lfcmVzZXRfZW5naW5l
KGRzaSk7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQoKSSB0aGluayBtdGtfZHNpX2ly
cV9kYXRhX2NsZWFyKCkgYW5kIG10a19kc2lfd2FpdF9mb3JfaXJxX2RvbmUoKSBzaG91bGQKYmUg
bW92ZWQgdG8gdGhlIDZ0aCBwYXRjaCBbMV0gb2YgdGhpcyBzZXJpZXMgYmVjYXVzZSB0aGVzZSB0
d28gZnVuY3Rpb25zCmRlYWwgdGhlIGlycSBjb250cm9sLgoKClsxXSBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzkzMTA4MTkvCgoKUmVnYXJkcywKQ0sKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
