From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v7 3/9] drm/mediatek: replace writeb() with mtk_dsi_mask()
Date: Thu, 26 Sep 2019 16:50:38 +0800
Message-ID: <1569487838.9612.1.camel@mtksdaap41>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
 <20190919065806.111016-4-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190919065806.111016-4-jitao.shi@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, stonea168@163.com, cawa.cheng@mediatek.com, dri-devel@lists.freedesktop.org, sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

SGksIEppdGFvOgoKT24gVGh1LCAyMDE5LTA5LTE5IGF0IDE0OjU4ICswODAwLCBKaXRhbyBTaGkg
d3JvdGU6Cj4gVGhlIHdyaXRlYigpIGlzIHVuYXZhaWxhYmxlIGluIG10ODE3My4gQmVjYXVzZSB0
aGUgbXQ4MTczIGRzaSBtb2R1bGUKPiBkb2Vzbid0IHN1cHBvcnQgOGJpdCBtb2RlIGFjY2Vzcy4K
ClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYwo+IGluZGV4IDdlMjRkMDNjZGNjYy4uYWM4ZTgwZTM3OWY3IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jCj4gQEAgLTk2MCw3ICs5NjAsOSBAQCBzdGF0aWMgdm9pZCBtdGtf
ZHNpX2NtZHEoc3RydWN0IG10a19kc2kgKmRzaSwgY29uc3Qgc3RydWN0IG1pcGlfZHNpX21zZyAq
bXNnKQo+ICAJfQo+ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBtc2ctPnR4X2xlbjsgaSsrKQo+IC0J
CXdyaXRlYih0eF9idWZbaV0sIGRzaS0+cmVncyArIHJlZ19jbWRxX29mZiArIGNtZHFfb2ZmICsg
aSk7Cj4gKwkJbXRrX2RzaV9tYXNrKGRzaSwgKHJlZ19jbWRxX29mZiArIGNtZHFfb2ZmICsgaSkg
JiAofjB4M1UpLAo+ICsJCQkgICAgICgweGZmVUwgPDwgKCgoaSArIGNtZHFfb2ZmKSAmIDNVKSAq
IDhVKSksCj4gKwkJCSAgICAgdHhfYnVmW2ldIDw8ICgoKGkgKyBjbWRxX29mZikgJiAzVSkgKiA4
VSkpOwo+ICAKPiAgCW10a19kc2lfbWFzayhkc2ksIHJlZ19jbWRxX29mZiwgY21kcV9tYXNrLCBy
ZWdfdmFsKTsKPiAgCW10a19kc2lfbWFzayhkc2ksIERTSV9DTURRX1NJWkUsIENNRFFfU0laRSwg
Y21kcV9zaXplKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
