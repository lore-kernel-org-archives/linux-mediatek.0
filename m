From: Rick Chang <rick.chang@mediatek.com>
Subject: Re: [PATCH] [media] vcodec: fix error return value from
 mtk_jpeg_clk_init()
Date: Fri, 23 Mar 2018 19:07:24 -0700
Message-ID: <1521857244.3372.12.camel@mediatek.com>
References: <f9295ecafa4c845ef5d9414fca47b2dc0fc6640d.1521776018.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <f9295ecafa4c845ef5d9414fca47b2dc0fc6640d.1521776018.git.ryder.lee@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ryder Lee <ryder.lee@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Bin Liu <bin.liu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

T24gRnJpLCAyMDE4LTAzLTIzIGF0IDExOjQ0ICswODAwLCBSeWRlciBMZWUgd3JvdGU6Cj4gVGhl
IGVycm9yIHJldHVybiB2YWx1ZSBzaG91bGQgYmUgZml4ZWQgYXMgaXQgbWF5IHJldHVybiBFUFJP
QkVfREVGRVIuCj4gCj4gQ2M6IFJpY2sgQ2hhbmcgPHJpY2suY2hhbmdAbWVkaWF0ZWsuY29tPgo+
IENjOiBCaW4gTGl1IDxiaW4ubGl1QG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSeWRl
ciBMZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyB8IDQgKystLQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMKPiBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jCj4gaW5kZXggMjI2ZjkwOC4u
YWYxN2FhYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210
a19qcGVnX2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRr
X2pwZWdfY29yZS5jCj4gQEAgLTEwODEsMTEgKzEwODEsMTEgQEAgc3RhdGljIGludCBtdGtfanBl
Z19jbGtfaW5pdChzdHJ1Y3QKPiBtdGtfanBlZ19kZXYgKmpwZWcpCj4gwqAKPiDCoAlqcGVnLT5j
bGtfamRlYyA9IGRldm1fY2xrX2dldChqcGVnLT5kZXYsICJqcGdkZWMiKTsKPiDCoAlpZiAoSVNf
RVJSKGpwZWctPmNsa19qZGVjKSkKPiAtCQlyZXR1cm4gLUVJTlZBTDsKPiArCQlyZXR1cm4gUFRS
X0VSUihqcGVnLT5jbGtfamRlYyk7Cj4gwqAKPiDCoAlqcGVnLT5jbGtfamRlY19zbWkgPSBkZXZt
X2Nsa19nZXQoanBlZy0+ZGV2LCAianBnZGVjLXNtaSIpOwo+IMKgCWlmIChJU19FUlIoanBlZy0+
Y2xrX2pkZWNfc21pKSkKPiAtCQlyZXR1cm4gLUVJTlZBTDsKPiArCQlyZXR1cm4gUFRSX0VSUihq
cGVnLT5jbGtfamRlY19zbWkpOwo+IMKgCj4gwqAJcmV0dXJuIDA7Cj4gwqB9CgpBY2tlZC1ieTog
UmljayBDaGFuZyA8cmljay5jaGFuZ0BtZWRpYXRlay5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
