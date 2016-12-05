From: YT Shen <yt.shen@mediatek.com>
Subject: Re: [PATCH v10 02/13] drm/mediatek: add *driver_data for different
 hardware settings
Date: Mon, 5 Dec 2016 20:50:41 +0800
Message-ID: <1480942241.18661.10.camel@mtksdaap41>
References: <1480070076-6196-1-git-send-email-yt.shen@mediatek.com>
 <1480070076-6196-3-git-send-email-yt.shen@mediatek.com>
 <CAGS+omDmMq7AEnyDzo4Oih_f+g4DE1Jz6xiV=+_3JGtSAfd+-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGS+omDmMq7AEnyDzo4Oih_f+g4DE1Jz6xiV=+_3JGtSAfd+-Q@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Jie Qiu <jie.qiu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?= <yingjoe.chen@mediatek.com>, Dan Carpenter <dan.carpenter@oracle.com>, Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, shaoming chen <shaoming.chen@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, srv_heupstream <srv_heupstream@mediatek.com>, Emil Velikov <emil.l.velikov@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

SGkgRGFuaWVsLAoKT24gV2VkLCAyMDE2LTExLTMwIGF0IDE0OjQyICswODAwLCBEYW5pZWwgS3Vy
dHogd3JvdGU6Cj4gSGkgWVQsCj4gCj4gCj4gT24gRnJpLCBOb3YgMjUsIDIwMTYgYXQgNjozNCBQ
TSwgWVQgU2hlbiA8eXQuc2hlbkBtZWRpYXRlay5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZXJlIGFy
ZSBzb21lIGhhcmR3YXJlIHNldHRpbmdzIGNoYW5nZWQsIGJldHdlZW4gTVQ4MTczICYgTVQyNzAx
Ogo+ID4gRElTUF9PVkwgYWRkcmVzcyBvZmZzZXQgY2hhbmdlZCwgY29sb3IgZm9ybWF0IGRlZmlu
aXRpb24gY2hhbmdlZC4KPiA+IERJU1BfUkRNQSBmaWZvIHNpemUgY2hhbmdlZC4KPiA+IERJU1Bf
Q09MT1Igb2Zmc2V0IGNoYW5nZWQuCj4gPiBNSVBJX1RYIHBsbCBzZXR0aW5nIGNoYW5nZWQuCj4g
PiBBbmQgYWRkIHByZWZpeCBmb3IgbXRrX2RkcF9tYWluICYgbXRrX2RkcF9leHQgJiBtdXRleF9t
b2QuCj4gCj4gU29ycnksIEkgaGF2ZSBub3QgaGFkIHRpbWUgdG8gdGhvcm91Z2hseSByZXZpZXcg
dGhlIG5ldyBwYXRjaCBzZXQsIGJ1dAo+IG9uZSBxdWljayBjb21tZW50Ogo+IAo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oCj4gPiBpbmRleCAyMmEzM2Vl
Li5jZmFhNzYwIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwX2NvbXAuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuaAo+ID4gQEAgLTc4LDYgKzc4LDEwIEBAIHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVu
Y3Mgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUg
KnN0YXRlKTsKPiA+ICB9Owo+ID4KPiA+ICtzdHJ1Y3QgbXRrX2RkcF9jb21wX2RyaXZlcl9kYXRh
IHsKPiA+ICsgICAgICAgdW5zaWduZWQgaW50IGNvbG9yX29mZnNldDsKPiA+ICt9Owo+ID4gKwo+
ID4gIHN0cnVjdCBtdGtfZGRwX2NvbXAgewo+ID4gICAgICAgICBzdHJ1Y3QgY2xrICpjbGs7Cj4g
PiAgICAgICAgIHZvaWQgX19pb21lbSAqcmVnczsKPiA+IEBAIC04NSw2ICs4OSw3IEBAIHN0cnVj
dCBtdGtfZGRwX2NvbXAgewo+ID4gICAgICAgICBzdHJ1Y3QgZGV2aWNlICpsYXJiX2RldjsKPiA+
ICAgICAgICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgaWQ7Cj4gPiAgICAgICAgIGNvbnN0IHN0cnVj
dCBtdGtfZGRwX2NvbXBfZnVuY3MgKmZ1bmNzOwo+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbXRr
X2RkcF9jb21wX2RyaXZlcl9kYXRhICpkYXRhOwo+IAo+IEkgd2FudCB0byBhdm9pZCBhZGRpbmcg
dGhpcyBnZW5lcmljIHBvaW50ZXIgaGVyZSB0byBhbGwgbXRrX2RkcF9jb21wLAo+IHNpbmNlIHRo
aXMgaXMgb25seSB1c2VkIGJ5IHRoZSBjb2xvciBjb21wb25lbnQuCj4gSW5zdGVhZCwgZGVmaW5l
IGNvbG9yIHNwZWNpZmljIHR5cGVzOgo+IAo+IHN0cnVjdCBtdGtfZGlzcF9jb2xvcl9kYXRhIHsK
PiAgICAgICAgdW5zaWduZWQgaW50IG9mZnNldDsKPiB9Owo+IAo+IHN0cnVjdCBtdGtfZGlzcF9j
b2xvciB7Cj4gICAgICAgIHN0cnVjdCBtdGtfZGRwX2NvbXAgICAgICAgICAgICAgZGRwX2NvbXA7
Cj4gICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZGlzcF9jb2xvcl9kYXRhICpkYXRhOwo+IH07Cj4g
Cj4gVGhlbiwgYWRkIGFub3RoZXIgY29tcF90eXBlIGNoZWNrIGFuZCBmZXRjaCB0aGUgZGV2IGRh
dGEgaW4KPiBtdGtfZHJtX3Byb2JlKCkgIG9yIG1heWJlIG10a19kZHBfY29tcF9pbml0KCkuCj4g
Cj4gLURhbgpPSywgd2Ugd2lsbCByZW1vdmUgdGhlIGNvbG9yIGRhdGEgcG9pbnRlciBmcm9tIGdl
bmVyaWMgbXRrX2RkcF9jb21wLgpUaGFua3MuCgpSZWdhcmRzLAp5dC5zaGVuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
