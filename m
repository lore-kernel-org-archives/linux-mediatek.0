From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/8] drm/mediatek: Use regmap for register access
Date: Fri, 20 Apr 2018 12:00:19 +0200
Message-ID: <1524218419.16259.7.camel@pengutronix.de>
References: <20171114214114.15793-1-mbrugger@suse.com>
 <20171114214114.15793-2-mbrugger@suse.com>
 <1511427282.7685.1.camel@pengutronix.de>
 <3fffe06c-f19b-ef26-a19d-771611aae158@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3fffe06c-f19b-ef26-a19d-771611aae158@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com, ck.hu@mediatek.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org
Cc: sean.wang@mediatek.com, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux@armlinux.org.uk, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, mchehab@kernel.org, pi-cheng.chen@linaro.org, davem@davemloft.net, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

SGkgTWF0dGhpYXMsCgpPbiBGcmksIDIwMTgtMDQtMjAgYXQgMTE6NDEgKzAyMDAsIE1hdHRoaWFz
IEJydWdnZXIgd3JvdGU6Cj4gSGkgUGhpbGlwcCwKPiAKPiBPbiAxMS8yMy8yMDE3IDA5OjU0IEFN
LCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+ID4gSGkgTWF0dGhpYXMsCj4gPiAKPiA+IE9uIFR1ZSwg
MjAxNy0xMS0xNCBhdCAyMjo0MSArMDEwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKPiA+ID4g
VGhlIG1tc3lzIG1lbW9yeSBzcGFjZSBpcyBzaGFyZWQgYmV0d2VlbiB0aGUgZHJtIGFuZCB0aGUK
PiA+ID4gY2xrIGRyaXZlci4gVXNlIHJlZ21hcCB0byBhY2Nlc3MgaXQuCj4gPiA+IAo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4KPiA+ID4g
LS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAgNCAr
Ky0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyAgfCAzMCAr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcC5oICB8ICA0ICsrLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jICB8IDEzICsrKystLS0tLS0tLS0KPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICB8ICAyICstCj4gPiA+ICA1IGZpbGVzIGNoYW5n
ZWQsIDI2IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBbLi4uXQo+IAo+
IFsuLi5dCj4gPiA+ICAJfQo+ID4gPiAgCj4gPiA+ICAJdmFsdWUgPSBtdGtfZGRwX3NlbF9pbihj
dXIsIG5leHQsICZhZGRyKTsKPiA+ID4gIAlpZiAodmFsdWUpIHsKPiA+ID4gLQkJcmVnID0gcmVh
ZGxfcmVsYXhlZChjb25maWdfcmVncyArIGFkZHIpICYgfnZhbHVlOwo+ID4gPiAtCQl3cml0ZWxf
cmVsYXhlZChyZWcsIGNvbmZpZ19yZWdzICsgYWRkcik7Cj4gPiA+ICsJCXJlZ21hcF9yZWFkKGNv
bmZpZ19yZWdzLCBhZGRyLCAmcmVnKTsKPiA+ID4gKwkJcmVnICY9IH52YWx1ZTsKPiA+ID4gKwkJ
cmVnbWFwX3dyaXRlKGNvbmZpZ19yZWdzLCBhZGRyLCByZWcpOwo+ID4gCj4gPiAJCXJlZ21hcF91
cGRhdGVfYml0cyhjb25maWdfcmVncywgYWRkciwgdmFsdWUsIDApOwo+ID4gCj4gPiBSZXZpZXdl
ZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiA+IAo+IAo+IFRo
YW5rcyBmb3IgaGF2aW5nIGEgbG9vayBvbiB0aGF0Lgo+IAo+IEknbGwgdXBkYXRlIHRoZSBuZXh0
IHZlcnNpb24gd2l0aCByZWdtYXBfdXBkYXRlX2JpdHMgYW5kIGxlYXZlIHlvdXIgUmV2aWV3ZWQt
YnksCj4gaG9wZSB0aGF0J3Mgb2suCgpZZXMsIHRoYXQncyBmaW5lLgoKcmVnYXJkcwpQaGlsaXBw
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
