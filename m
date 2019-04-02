From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: Fix an error code in
 mtk_hdmi_dt_parse_pdata()
Date: Tue, 2 Apr 2019 09:43:03 +0800
Message-ID: <1554169383.20131.1.camel@mtksdaap41>
References: <20190328143130.GO32590@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190328143130.GO32590@kadam>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jie Qiu <jie.qiu@mediatek.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

SGksIERhbjoKCk9uIFRodSwgMjAxOS0wMy0yOCBhdCAxNzozMSArMDMwMCwgRGFuIENhcnBlbnRl
ciB3cm90ZToKPiBXZSBkb24ndCB3YW50IHRvIG92ZXJ3cml0ZSAicmV0IiwgaXQgYWxyZWFkeSBo
b2xkcyB0aGUgY29ycmVjdCBlcnJvcgo+IGNvZGUuICBUaGUgInJlZ21hcCIgdmFyaWFibGUgbWln
aHQgYmUgYSB2YWxpZCBwb2ludGVyIGFzIHRoaXMgcG9pbnQuCj4gCj4gRml4ZXM6IDhmODNmMjY4
OTFlMSAoImRybS9tZWRpYXRlazogQWRkIEhETUkgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTog
RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKQXBwbGllZCB0byBtZWRp
YXRlay1kcm0tZml4ZXMtNS4xIFsxXSwgdGhhbmtzLgoKWzFdCmh0dHBzOi8vZ2l0aHViLmNvbS9j
a2h1LW1lZGlhdGVrL2xpbnV4LmdpdC10YWdzL2NvbW1pdHMvbWVkaWF0ZWstZHJtLWZpeGVzLTUu
MQoKUmVnYXJkcywKQ0sKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19oZG1pLmMKPiBpbmRleCA5MTVjYzg0NjIxYWUuLjU0M2EyNWU1NzY1ZSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gQEAgLTE0ODAsNyArMTQ4MCw2
IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10a19oZG1pICpo
ZG1pLAo+ICAJaWYgKElTX0VSUihyZWdtYXApKQo+ICAJCXJldCA9IFBUUl9FUlIocmVnbWFwKTsK
PiAgCWlmIChyZXQpIHsKPiAtCQlyZXQgPSBQVFJfRVJSKHJlZ21hcCk7Cj4gIAkJZGV2X2Vycihk
ZXYsCj4gIAkJCSJGYWlsZWQgdG8gZ2V0IHN5c3RlbSBjb25maWd1cmF0aW9uIHJlZ2lzdGVyczog
JWRcbiIsCj4gIAkJCXJldCk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
