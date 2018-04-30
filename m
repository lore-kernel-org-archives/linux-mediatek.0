From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [v3 09/10] drm: mediatek: Omit warning on probe defers
Date: Mon, 30 Apr 2018 18:58:36 +0800
Message-ID: <1525085916.25456.8.camel@mtksdaap41>
References: <cover.1524820923.git.mbrugger@suse.com>
 <9d514a4ab45f0700663fa756d5aa3913922b6fb7.1524820923.git.mbrugger@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <9d514a4ab45f0700663fa756d5aa3913922b6fb7.1524820923.git.mbrugger@suse.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: matthias.bgg@kernel.org
Cc: mark.rutland@arm.com, airlied@linux.ie, mturquette@baylibre.com, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com, lee.jones@linaro.org, linux-clk@vger.kernel.org, linux@armlinux.org.uk, sean.wang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>, gregkh@linuxfoundation.org, rdunlap@infradead.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, davem@davemloft.net
List-Id: linux-mediatek@lists.infradead.org

SGksIE1hdHRoaWFzOgoKT24gRnJpLCAyMDE4LTA0LTI3IGF0IDExOjI0ICswMjAwLCBtYXR0aGlh
cy5iZ2dAa2VybmVsLm9yZyB3cm90ZToKPiBGcm9tOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dl
ckBzdXNlLmNvbT4KPiAKPiBXaGVuIHByb2JlIHRocm91Z2ggdGhlIE1GRCwgaXQgY2FuIGhhcHBl
biB0aGF0IHRoZQo+IGNsb2NrIGRyaXZlcnMgd2Fzbid0IHByb2JlZCBiZWZvcmUgdGhlIGRkcCBk
cml2ZXIgZ2V0cwo+IGludm9rZWQuIFRoZSBkcml2ZXIgdXNlZCB0byBvbWl0IGEgd2FybmluZyB0
aGF0IHRoZSBkcml2ZXIKPiBmYWlsZWQgdG8gZ2V0IHRoZSBjbG9ja3MuIE9taXQgdGhpcyBlcnJv
ciBvbiB0aGUgZGVmZXJlZCBwcm9iZSBwYXRoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFz
IEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgoKSXQncyBiZXR0ZXIgdG8gdXNlICdkcm0vbWVk
aWF0ZWs6JyBmb3IgdGl0bGUgdG8gYWxpZ24gZHJtIGNvbW1pdHMuCkZvciB0aGUgbW9kaWZpY2F0
aW9uLAoKQWNrZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+CgpSZWdhcmRzLApDSwoK
PiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCAzICsrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiBpbmRleCBiYWZjNWM3N2M0ZmIuLjZi
Mzk5MzQ4YTJkYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4g
QEAgLTM3NCw3ICszNzQsOCBAQCBzdGF0aWMgaW50IG10a19kZHBfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiAgCj4gIAlkZHAtPmNsayA9IGRldm1fY2xrX2dldChkZXYsIE5V
TEwpOwo+ICAJaWYgKElTX0VSUihkZHAtPmNsaykpIHsKPiAtCQlkZXZfZXJyKGRldiwgIkZhaWxl
ZCB0byBnZXQgY2xvY2tcbiIpOwo+ICsJCWlmIChQVFJfRVJSKGRkcC0+Y2xrKSAhPSAtRVBST0JF
X0RFRkVSKQo+ICsJCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgY2xvY2tcbiIpOwo+ICAJ
CXJldHVybiBQVFJfRVJSKGRkcC0+Y2xrKTsKPiAgCX0KPiAgCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
