From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH 19/59] drm/mtk: Drop drm_gem_prime_export/import
Date: Mon, 17 Jun 2019 09:51:58 +0800
Message-ID: <1560736318.23549.1.camel@mtksdaap41>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-20-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190614203615.12639-20-daniel.vetter@ffwll.ch>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

SGksIERhbmllbDoKCk9uIEZyaSwgMjAxOS0wNi0xNCBhdCAyMjozNSArMDIwMCwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPiBUaGV5J3JlIHRoZSBkZWZhdWx0Lgo+IAo+IEFzaWRlOiBXb3VsZCBiZSBy
ZWFsbHkgbmljZSB0byBzd2l0Y2ggdGhlIG90aGVycyBvdmVyIHRvCj4gZHJtX2dlbV9vYmplY3Rf
ZnVuY3MuCgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KCj4gCj4gU2ln
bmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gQ2M6
IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gQ2M6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFp
bC5jb20+Cj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBs
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+IGluZGV4
IDFmOGI4OTQzYjBjNi4uZGQ4ZGFiNTYyNTAwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMKPiBAQCAtMzI5LDggKzMyOSw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Ry
aXZlciBtdGtfZHJtX2RyaXZlciA9IHsKPiAgCj4gIAkucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJt
X2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCj4gIAkucHJpbWVfZmRfdG9faGFuZGxlID0gZHJtX2dl
bV9wcmltZV9mZF90b19oYW5kbGUsCj4gLQkuZ2VtX3ByaW1lX2V4cG9ydCA9IGRybV9nZW1fcHJp
bWVfZXhwb3J0LAo+IC0JLmdlbV9wcmltZV9pbXBvcnQgPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwK
PiAgCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlID0gbXRrX2dlbV9wcmltZV9nZXRfc2dfdGFibGUs
Cj4gIAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IG10a19nZW1fcHJpbWVfaW1wb3J0X3Nn
X3RhYmxlLAo+ICAJLmdlbV9wcmltZV9tbWFwID0gbXRrX2RybV9nZW1fbW1hcF9idWYsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
