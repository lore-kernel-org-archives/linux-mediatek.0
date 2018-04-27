From: matthias.bgg@kernel.org
Subject: [v3 09/10] drm: mediatek: Omit warning on probe defers
Date: Fri, 27 Apr 2018 11:24:01 +0200
Message-ID: <9d514a4ab45f0700663fa756d5aa3913922b6fb7.1524820923.git.mbrugger@suse.com>
References: <cover.1524820923.git.mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1524820923.git.mbrugger@suse.com>
In-Reply-To: <cover.1524820923.git.mbrugger@suse.com>
References: <cover.1524820923.git.mbrugger@suse.com>
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
Cc: sean.wang@mediatek.com, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+CgpXaGVuIHByb2JlIHRo
cm91Z2ggdGhlIE1GRCwgaXQgY2FuIGhhcHBlbiB0aGF0IHRoZQpjbG9jayBkcml2ZXJzIHdhc24n
dCBwcm9iZWQgYmVmb3JlIHRoZSBkZHAgZHJpdmVyIGdldHMKaW52b2tlZC4gVGhlIGRyaXZlciB1
c2VkIHRvIG9taXQgYSB3YXJuaW5nIHRoYXQgdGhlIGRyaXZlcgpmYWlsZWQgdG8gZ2V0IHRoZSBj
bG9ja3MuIE9taXQgdGhpcyBlcnJvciBvbiB0aGUgZGVmZXJlZCBwcm9iZSBwYXRoLgoKU2lnbmVk
LW9mZi1ieTogTWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwLmMKaW5kZXggYmFmYzVjNzdjNGZiLi42YjM5OTM0OGEyZGMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCkBAIC0zNzQsNyArMzc0LDggQEAgc3RhdGljIGlu
dCBtdGtfZGRwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlkZHAtPmNs
ayA9IGRldm1fY2xrX2dldChkZXYsIE5VTEwpOwogCWlmIChJU19FUlIoZGRwLT5jbGspKSB7Ci0J
CWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBjbG9ja1xuIik7CisJCWlmIChQVFJfRVJSKGRk
cC0+Y2xrKSAhPSAtRVBST0JFX0RFRkVSKQorCQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0
IGNsb2NrXG4iKTsKIAkJcmV0dXJuIFBUUl9FUlIoZGRwLT5jbGspOwogCX0KIAotLSAKMi4xNi4z
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
