From: matthias.bgg@kernel.org
Subject: [resend PATCH v4 0/5] arm/arm64: mediatek: Fix mmsys device probing
Date: Wed, 18 Jul 2018 00:03:23 +0200
Message-ID: <20180717220328.792-1-matthias.bgg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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
Cc: sean.wang@mediatek.com, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, mchehab@kernel.org, pi-cheng.chen@linaro.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Q2hhbmdlcyBzaW5jZSB2MzoKLSB1c2UgcGxhdGZvcm0gZGV2aWNlIHRvIHByb2JlIGNsb2NrIGRy
aXZlcgotIGFkZCBBY2tlZC1ieSBDSyBIdSBmb3IgdGhlIHByb2JlIGRlZmVycmVkIHBhdGNoCgpD
aGFuZ2VzIHNpbmNlIHYyOgotIGZpeCBrY29uZmlnIHR5cG8gKHNoYW1lIG9uIG1lKQotIGRlbGV0
ZSBfX2luaXRjb25zdCBmcm9tIG1tX2Nsb2NrcyBhcyBjb252ZXJ0ZWQgdG8gYSBwbGF0Zm9ybSBk
cml2ZXIKICAKQ2hhbmdlcyBzaW5jZSB2MToKLSBhZGQgYmluZGluZyBkb2N1bWVudGF0aW9uCi0g
ZGRwOiB1c2UgcmVnbWFwX3VwZGF0ZV9iaXRzCi0gZGRwOiBpZ25vcmUgRVBST0JFX0RFRkVSIG9u
IGNsb2NrIHByb2JpbmcKLSBtZmQ6IGRlbGV0ZSBtbXN5c19wcml2YXRlCi0gYWRkIFJldmlld2Vk
LWJ5IGFuZCBBY2tlZC1ieSB0YWdzCiAKTU1TWVMgaW4gTWVkaWF0ZWsgU29DcyBoYXMgc29tZSBy
ZWdpc3RlcnMgdG8gY29udHJvbCBjbG9jayBnYXRlcyAod2hpY2ggaXMgCnVzZWQgaW4gdGhlIGNs
ayBkcml2ZXIpIGFuZCBzb21lIHJlZ2lzdGVycyB0byBzZXQgdGhlIHJvdXRpbmcgYW5kIGVuYWJs
ZQp0aGUgZGlmZmVybmV0IGJsb2NrcyBvZiB0aGUgZGlzcGxheSBzdWJzeXN0ZW0uCgpVcCB0byBu
b3cgYm90aCBkcml2ZXJzLCBjbG9jayBhbmQgZHJtIGFyZSBwcm9iZWQgd2l0aCB0aGUgc2FtZSBk
ZXZpY2UgdHJlZQpjb21wYXRpYmxlLiBCdXQgb25seSB0aGUgZmlyc3QgZHJpdmVyIGdldCBwcm9i
ZWQsIHdoaWNoIGluIGVmZmVjdCBicmVha3MKZ3JhcGhpY3Mgb24gbXQ4MTczIGFuZCBtdDI3MDEu
CgpUaGlzIHBhdGNoIHVzZXMgYSBwbGF0Zm9ybSBkZXZpY2UgcmVnaXN0cmF0aW9uIGluIHRoZSBE
Uk0gZHJpdmVyLCB3aGljaAp3aWxsIHRyaWdnZXIgdGhlIHByb2JlIG9mIHRoZSBjb3JyZXNwb25k
aW5nIGNsb2NrIGRyaXZlci4gSXQgd2FzIHRlc3RlZCBvbiB0aGUKYmFuYW5hcGktcjIgYW5kIHRo
ZSBBY2VyIFIxMyBDaHJvbWVib29rLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
