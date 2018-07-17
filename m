From: matthias.bgg@kernel.org
Subject: [resend PATCH v4 5/5] drm: mediatek: Omit warning on probe defers
Date: Wed, 18 Jul 2018 00:03:28 +0200
Message-ID: <20180717220328.792-6-matthias.bgg@kernel.org>
References: <20180717220328.792-1-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180717220328.792-1-matthias.bgg@kernel.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org
Cc: sean.wang@mediatek.com, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, pi-cheng.chen@linaro.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+CgpJdCBjYW4gaGFwcGVu
IHRoYXQgdGhlIGNsb2NrIGRyaXZlcnMgd2Fzbid0IHByb2JlZCBiZWZvcmUgdGhlCmRkcCBkcml2
ZXIgZ2V0cyBpbnZva2VkLiBUaGUgZHJpdmVyIHVzZWQgdG8gb21pdCBhIHdhcm5pbmcKdGhhdCB0
aGUgZHJpdmVyIGZhaWxlZCB0byBnZXQgdGhlIGNsb2Nrcy4gT21pdCB0aGlzIGVycm9yIG9uCnRo
ZSBkZWZlcmVkIHByb2JlIHBhdGguCgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxt
YnJ1Z2dlckBzdXNlLmNvbT4KQWNrZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCAzICsrLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwLmMKaW5kZXggYmFmYzVjNzdjNGZiLi42YjM5OTM0OGEyZGMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCkBAIC0zNzQsNyArMzc0LDggQEAg
c3RhdGljIGludCBtdGtfZGRwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAK
IAlkZHAtPmNsayA9IGRldm1fY2xrX2dldChkZXYsIE5VTEwpOwogCWlmIChJU19FUlIoZGRwLT5j
bGspKSB7Ci0JCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBjbG9ja1xuIik7CisJCWlmIChQ
VFJfRVJSKGRkcC0+Y2xrKSAhPSAtRVBST0JFX0RFRkVSKQorCQkJZGV2X2VycihkZXYsICJGYWls
ZWQgdG8gZ2V0IGNsb2NrXG4iKTsKIAkJcmV0dXJuIFBUUl9FUlIoZGRwLT5jbGspOwogCX0KIAot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
