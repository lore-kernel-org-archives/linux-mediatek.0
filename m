From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/5] mtd: nand: use usual return values for the
 ->erase() hook
Date: Fri, 1 Dec 2017 10:39:20 +0100
Message-ID: <20171201103920.1ed36f99@bbrezillon>
References: <20171130170132.27522-1-miquel.raynal@free-electrons.com>
 <20171130170132.27522-2-miquel.raynal@free-electrons.com>
 <20171130215113.458d616f@bbrezillon>
 <20171130230246.61a9ed19@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20171130230246.61a9ed19@xps13>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: Hanna Hawa <hannah@marvell.com>, Stefan Agner <stefan@agner.ch>, Nadav Haklai <nadavh@marvell.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Gregory Clement <gregory.clement@free-electrons.com>, devel@driverdev.osuosl.org, Maxim Levitsky <maximlevitsky@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, Ofer Heifetz <oferh@marvell.com>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.o>
List-Id: linux-mediatek@lists.infradead.org

T24gVGh1LCAzMCBOb3YgMjAxNyAyMzowMjo0NiArMDEwMApNaXF1ZWwgUkFZTkFMIDxtaXF1ZWwu
cmF5bmFsQGZyZWUtZWxlY3Ryb25zLmNvbT4gd3JvdGU6Cgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9uYW5kX2Jhc2UuYwo+ID4gPiBiL2RyaXZlcnMvbXRkL25hbmQvbmFuZF9i
YXNlLmMgaW5kZXggNjMwMDQ4ZjVhYmRjLi40ZDFmMmJkYTYwOTUKPiA+ID4gMTAwNjQ0IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvbmFuZF9iYXNlLmMKPiA+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9uYW5kX2Jhc2UuYwo+ID4gPiBAQCAtMzA3Nyw3ICszMDc3LDcgQEAgaW50IG5hbmRfZXJhc2Vf
bmFuZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPiA+ID4gc3RydWN0IGVyYXNlX2luZm8gKmluc3Ry
LCBzdGF0dXMgPSBjaGlwLT5lcmFzZShtdGQsIHBhZ2UgJgo+ID4gPiBjaGlwLT5wYWdlbWFzayk7
IAo+ID4gPiAgCQkvKiBTZWUgaWYgYmxvY2sgZXJhc2Ugc3VjY2VlZGVkICovCj4gPiA+IC0JCWlm
IChzdGF0dXMgJiBOQU5EX1NUQVRVU19GQUlMKSB7Cj4gPiA+ICsJCWlmIChzdGF0dXMpIHsKPiA+
ID4gIAkJCXByX2RlYnVnKCIlczogZmFpbGVkIGVyYXNlLCBwYWdlIDB4JTA4eFxuIiwKPiA+ID4g
IAkJCQkJX19mdW5jX18sIHBhZ2UpOwo+ID4gPiAgCQkJaW5zdHItPnN0YXRlID0gTVREX0VSQVNF
X0ZBSUxFRDsgICAgCj4gPiAKPiA+IFlvdSBmb3Jnb3QgdG8gcGF0Y2ggc2luZ2xlX2VyYXNlKCkg
YWNjb3JkaW5nbHkuICAKPiAKPiBSaWdodCwgc29ycnkgYWJvdXQgdGhhdCwgSSB3aWxsIGZpeCB0
aGF0LgoKSWYgZml4ZWQgaXQgd2hlbiBhcHBseWluZywgbm8gbmVlZCB0byByZXNlbmQuCgpUaGFu
a3MsCgpCb3JpcwoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2ZWwgbWFpbGluZyBsaXN0CmRldmVsQGxpbnV4
ZHJpdmVycHJvamVjdC5vcmcKaHR0cDovL2RyaXZlcmRldi5saW51eGRyaXZlcnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpdmVyZGV2LWRldmVsCg==
