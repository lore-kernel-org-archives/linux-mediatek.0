From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v10 02/13] drm/mediatek: add *driver_data for different
 hardware settings
Date: Wed, 30 Nov 2016 14:42:39 +0800
Message-ID: <CAGS+omDmMq7AEnyDzo4Oih_f+g4DE1Jz6xiV=+_3JGtSAfd+-Q@mail.gmail.com>
References: <1480070076-6196-1-git-send-email-yt.shen@mediatek.com>
 <1480070076-6196-3-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1480070076-6196-3-git-send-email-yt.shen@mediatek.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Jie Qiu <jie.qiu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, =?UTF-8?B?WWluZ2pvZSBDaGVuICjpmbPoi7HmtLIp?= <yingjoe.chen@mediatek.com>, Dan Carpenter <dan.carpenter@oracle.com>, Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, shaoming chen <shaoming.chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>, Emil Velikov <emil.l.velikov@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

SGkgWVQsCgoKT24gRnJpLCBOb3YgMjUsIDIwMTYgYXQgNjozNCBQTSwgWVQgU2hlbiA8eXQuc2hl
bkBtZWRpYXRlay5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgYXJlIHNvbWUgaGFyZHdhcmUgc2V0dGlu
Z3MgY2hhbmdlZCwgYmV0d2VlbiBNVDgxNzMgJiBNVDI3MDE6Cj4gRElTUF9PVkwgYWRkcmVzcyBv
ZmZzZXQgY2hhbmdlZCwgY29sb3IgZm9ybWF0IGRlZmluaXRpb24gY2hhbmdlZC4KPiBESVNQX1JE
TUEgZmlmbyBzaXplIGNoYW5nZWQuCj4gRElTUF9DT0xPUiBvZmZzZXQgY2hhbmdlZC4KPiBNSVBJ
X1RYIHBsbCBzZXR0aW5nIGNoYW5nZWQuCj4gQW5kIGFkZCBwcmVmaXggZm9yIG10a19kZHBfbWFp
biAmIG10a19kZHBfZXh0ICYgbXV0ZXhfbW9kLgoKU29ycnksIEkgaGF2ZSBub3QgaGFkIHRpbWUg
dG8gdGhvcm91Z2hseSByZXZpZXcgdGhlIG5ldyBwYXRjaCBzZXQsIGJ1dApvbmUgcXVpY2sgY29t
bWVudDoKCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cF9jb21wLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCj4g
aW5kZXggMjJhMzNlZS4uY2ZhYTc2MCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuaAo+IEBAIC03OCw2ICs3OCwxMCBAQCBzdHJ1Y3QgbXRrX2RkcF9j
b21wX2Z1bmNzIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fY3J0Y19z
dGF0ZSAqc3RhdGUpOwo+ICB9Owo+Cj4gK3N0cnVjdCBtdGtfZGRwX2NvbXBfZHJpdmVyX2RhdGEg
ewo+ICsgICAgICAgdW5zaWduZWQgaW50IGNvbG9yX29mZnNldDsKPiArfTsKPiArCj4gIHN0cnVj
dCBtdGtfZGRwX2NvbXAgewo+ICAgICAgICAgc3RydWN0IGNsayAqY2xrOwo+ICAgICAgICAgdm9p
ZCBfX2lvbWVtICpyZWdzOwo+IEBAIC04NSw2ICs4OSw3IEBAIHN0cnVjdCBtdGtfZGRwX2NvbXAg
ewo+ICAgICAgICAgc3RydWN0IGRldmljZSAqbGFyYl9kZXY7Cj4gICAgICAgICBlbnVtIG10a19k
ZHBfY29tcF9pZCBpZDsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3Mg
KmZ1bmNzOwo+ICsgICAgICAgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9kcml2ZXJfZGF0YSAq
ZGF0YTsKCkkgd2FudCB0byBhdm9pZCBhZGRpbmcgdGhpcyBnZW5lcmljIHBvaW50ZXIgaGVyZSB0
byBhbGwgbXRrX2RkcF9jb21wLApzaW5jZSB0aGlzIGlzIG9ubHkgdXNlZCBieSB0aGUgY29sb3Ig
Y29tcG9uZW50LgpJbnN0ZWFkLCBkZWZpbmUgY29sb3Igc3BlY2lmaWMgdHlwZXM6CgpzdHJ1Y3Qg
bXRrX2Rpc3BfY29sb3JfZGF0YSB7CiAgICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0Owp9OwoKc3Ry
dWN0IG10a19kaXNwX2NvbG9yIHsKICAgICAgIHN0cnVjdCBtdGtfZGRwX2NvbXAgICAgICAgICAg
ICAgZGRwX2NvbXA7CiAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX2Rpc3BfY29sb3JfZGF0YSAqZGF0
YTsKfTsKClRoZW4sIGFkZCBhbm90aGVyIGNvbXBfdHlwZSBjaGVjayBhbmQgZmV0Y2ggdGhlIGRl
diBkYXRhIGluCm10a19kcm1fcHJvYmUoKSAgb3IgbWF5YmUgbXRrX2RkcF9jb21wX2luaXQoKS4K
Ci1EYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
