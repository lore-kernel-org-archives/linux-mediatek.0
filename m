From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: check for memory allocation failure
Date: Tue, 13 Jun 2017 15:45:20 +0800
Message-ID: <1497339920.16952.2.camel@mtksdaap41>
References: <20170609192712.18155-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170609192712.18155-1-christophe.jaillet@wanadoo.fr>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

SGksIENocmlzdG9waGU6CgpBcHBsaWVkIHRvIG15IGJyYW5jaCBtZWRpYXRlay1kcm0tbmV4dC00
LjEzLCB0aGFua3MuCgpSZWdhcmRzLApDSwoKT24gRnJpLCAyMDE3LTA2LTA5IGF0IDIxOjI3ICsw
MjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3JvdGU6Cj4gSWYgJ2Rldm1fa21hbGxvY19hcnJheScg
cmV0dXJucyBOVUxMLCB3ZSBzaG91bGQgcmV0dXJuIC1FTk9NRU0gYXMgYWxyZWFkeQo+IGRvbmUg
YSBmZXcgbGluZXMgYWJvdmUgaW5zdGVhZCBvZiBkZWZlcmVuY2luZyBhIE5VTEwgcG9pbnRlciBh
IGZldyBsaW5lcwo+IGJlbG93Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgSkFJTExF
VCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBp
bmRleCA2NTgyZTFmNTZkMzcuLmNiMzJjOTM2OWYzYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBAQCAtNTU5LDYgKzU1OSw4IEBAIGludCBtdGtfZHJtX2Ny
dGNfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2LAo+ICAJbXRrX2NydGMtPmRkcF9j
b21wID0gZGV2bV9rbWFsbG9jX2FycmF5KGRldiwgbXRrX2NydGMtPmRkcF9jb21wX25yLAo+ICAJ
CQkJCQlzaXplb2YoKm10a19jcnRjLT5kZHBfY29tcCksCj4gIAkJCQkJCUdGUF9LRVJORUwpOwo+
ICsJaWYgKCFtdGtfY3J0Yy0+ZGRwX2NvbXApCj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gIAo+ICAJ
bXRrX2NydGMtPm11dGV4ID0gbXRrX2Rpc3BfbXV0ZXhfZ2V0KHByaXYtPm11dGV4X2RldiwgcGlw
ZSk7Cj4gIAlpZiAoSVNfRVJSKG10a19jcnRjLT5tdXRleCkpIHsKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
