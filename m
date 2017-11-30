From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH 1/5] mtd: nand: use usual return values for the
 ->erase() hook
Date: Thu, 30 Nov 2017 23:02:46 +0100
Message-ID: <20171130230246.61a9ed19@xps13>
References: <20171130170132.27522-1-miquel.raynal@free-electrons.com>
 <20171130170132.27522-2-miquel.raynal@free-electrons.com>
 <20171130215113.458d616f@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20171130215113.458d616f@bbrezillon>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Hanna Hawa <hannah@marvell.com>, Stefan Agner <stefan@agner.ch>, Nadav Haklai <nadavh@marvell.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Gregory Clement <gregory.clement@free-electrons.com>, devel@driverdev.osuosl.org, Maxim Levitsky <maximlevitsky@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, Ofer Heifetz <oferh@marvell.com>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.o>
List-Id: linux-mediatek@lists.infradead.org

PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL25hbmRfYmFzZS5jCj4gPiBiL2RyaXZl
cnMvbXRkL25hbmQvbmFuZF9iYXNlLmMgaW5kZXggNjMwMDQ4ZjVhYmRjLi40ZDFmMmJkYTYwOTUK
PiA+IDEwMDY0NCAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL25hbmRfYmFzZS5jCj4gPiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL25hbmRfYmFzZS5jCj4gPiBAQCAtMzA3Nyw3ICszMDc3LDcgQEAgaW50
IG5hbmRfZXJhc2VfbmFuZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPiA+IHN0cnVjdCBlcmFzZV9p
bmZvICppbnN0ciwgc3RhdHVzID0gY2hpcC0+ZXJhc2UobXRkLCBwYWdlICYKPiA+IGNoaXAtPnBh
Z2VtYXNrKTsgCj4gPiAgCQkvKiBTZWUgaWYgYmxvY2sgZXJhc2Ugc3VjY2VlZGVkICovCj4gPiAt
CQlpZiAoc3RhdHVzICYgTkFORF9TVEFUVVNfRkFJTCkgewo+ID4gKwkJaWYgKHN0YXR1cykgewo+
ID4gIAkJCXByX2RlYnVnKCIlczogZmFpbGVkIGVyYXNlLCBwYWdlIDB4JTA4eFxuIiwKPiA+ICAJ
CQkJCV9fZnVuY19fLCBwYWdlKTsKPiA+ICAJCQlpbnN0ci0+c3RhdGUgPSBNVERfRVJBU0VfRkFJ
TEVEOyAgCj4gCj4gWW91IGZvcmdvdCB0byBwYXRjaCBzaW5nbGVfZXJhc2UoKSBhY2NvcmRpbmds
eS4KClJpZ2h0LCBzb3JyeSBhYm91dCB0aGF0LCBJIHdpbGwgZml4IHRoYXQuCgpUaGFua3MsCk1p
cXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZGV2
ZWwgbWFpbGluZyBsaXN0CmRldmVsQGxpbnV4ZHJpdmVycHJvamVjdC5vcmcKaHR0cDovL2RyaXZl
cmRldi5saW51eGRyaXZlcnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vZHJpdmVyZGV2LWRl
dmVsCg==
