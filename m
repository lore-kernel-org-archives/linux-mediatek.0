From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 01/33] mtd: rawnand: brcmnand: convert driver to
 nand_scan()
Date: Fri, 20 Jul 2018 09:12:07 +0200
Message-ID: <20180720091207.7828147d@xps13>
References: <20180719230026.8741-1-miquel.raynal@bootlin.com>
 <20180719230026.8741-2-miquel.raynal@bootlin.com>
 <20180720011719.7545fbb9@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180720011719.7545fbb9@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Mans Rullgard <mans@mansr.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>, Josh Wu <rainyfeeling@outlook.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com, Sylvain Lemieux <slemieux.tyco@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vladimir Zapolskiy <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>, Xiaolei Li <xiaolei.li@mediatek.com>, linux-arm-kernel@lists.infradead.org, Richard
List-Id: linux-mediatek@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBib290bGluLmNvbT4g
d3JvdGUgb24gRnJpLCAyMCBKdWwgMjAxOAowMToxNzoxOSArMDIwMDoKCj4gT24gRnJpLCAyMCBK
dWwgMjAxOCAwMDo1OTo1NCArMDIwMAo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+IHdyb3RlOgo+IAo+ID4gKwo+ID4gK3N0YXRpYyBzdHJ1Y3QgbmFuZF9jb250cm9s
bGVyX29wcyBicmNtbmFuZF9jb250cm9sbGVyX29wcyA9IHsgIAo+IAo+IHN0YXRpYyBjb25zdCAu
Li4KCk1tbWggcmlnaHQsIEknbGwgY29uc3RpZnkgZXZlcnkgY29udHJvbGxlcl9vcHMgZGVmaW5p
dGlvbi4KCj4gCj4gVGhlIHNhbWUgY29tbWVudCBhcHBsaWVzIHRvIGFsbCBwYXRjaGVzIG9mIHRo
aXMgc2VyaWVzLgo+IAo+ID4gKwkuYXR0YWNoX2NoaXAgPSBicmNtbmFuZF9hdHRhY2hfY2hpcCwK
PiA+ICt9OyAgCj4gCgoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
