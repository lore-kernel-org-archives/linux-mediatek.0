Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D132FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcFqdKGBkrCWUuZ8d4jRpvi/jRPpgDWYogOis7qUTF8=; b=1xo+/VpfP302jL
	788oJ46XlFC7gyuF71oOG5p3qCJT1W9BaovLTglEF8aomz0c0L7svHjjbWDHjaiOh0J/Fvq/ER6N0
	H5VpXb8aOnwOdvMnjCnq5FkeHeg8dJWyyDMd2JpWHOoTk08WPgmdbF0JW0nnPyUFnShzb9Qq9ZacB
	OgS3k3Xjxn9rEYEXv9AK4/OqFdtDwldJyW7rYFI7Z9JOc6h7brqBlQN7WTarHFJsU5IWcwSG0y8uv
	K1o/yWryQ8JaX+sBLNr9lY4pMvUZMpCj3qgpYCJAXD62qIq+afGB0BCHhj2pqNZM0oCGvaDSCe4xN
	TSwEwOpaapWWJ/YPysmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njdz8-000kFK-Ob; Wed, 27 Apr 2022 09:29:22 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njdyw-000kBh-AN; Wed, 27 Apr 2022 09:29:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3AB4320003;
 Wed, 27 Apr 2022 09:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651051743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=soyn1rvA89oTJzAqYQLvMAQyhAlfHV3ANoWX+URBfFc=;
 b=M15ZabbSNpJFIBlKT7MK3/iZlLUSspEov+J6NATfLMRrUfJyy/n3kjIJiAjgaWHz7vdjvT
 Bu1TU3Btr5rX/GaGd9Y/hNHtjlzqNKE5vn+QLCG+yY0jle0LqTImz3oOWdPrZZdUT24F3T
 1ZTGrlCEBqAwD+916+F/0QStUomS+38e0Jt4OLn9kjknODOpoVrMOQvWagq7nagWTng5mt
 Scf7f4hYx2+tvrRNzlyLTlX3Y8nosZG/JGSS5f799m3AkhmogdLAcm1pkdDUDw+ZTZvyHP
 DvMN2vB3eZzzX+Epxb2bClixrg3e4BXhSPWHqJjM0hXjjFKxvCDPY4l/Om/NDg==
Date: Wed, 27 Apr 2022 11:28:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Cai Huoqing
 <cai.huoqing@linux.dev>, Florian Fainelli <f.fainelli@gmail.com>, Colin Ian
 King <colin.king@intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Paul Cercueil <paul@crapouillou.net>,
 Pratyush Yadav <p.yadav@ti.com>, Yu Kuai <yukuai3@huawei.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS), linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/Mediatek SoC support), linux-mediatek@lists.infradead.org
 (moderated list:ARM/Mediatek SoC support), linux-kernel@vger.kernel.org
 (open list), linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: Re: [PATCH v6 0/5] spi: add support for Mediatek SPI-NAND controller
Message-ID: <20220427112857.7ddd7fc8@xps13>
In-Reply-To: <20220424032527.673605-1-gch981213@gmail.com>
References: <20220424032527.673605-1-gch981213@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_022910_865426_882B86D7 
X-CRM114-Status: GOOD (  15.57  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTWFyaywKCmdjaDk4MTIxM0BnbWFpbC5jb20gd3JvdGUgb24gU3VuLCAyNCBBcHIgMjAyMiAx
MToyNToyMiArMDgwMDoKCj4gTWVkaWF0ZWsgaGFzIGFuIGV4dGVuZGVkIHZlcnNpb24gb2YgdGhl
aXIgTkFORCBGbGFzaCBJbnRlcmZhY2Ugd2hpY2gKPiBoYXMgYSBTUEktTkFORCBtb2RlLiBJbiB0
aGlzIG1vZGUsIHRoZSBjb250cm9sbGVyIGNhbiBwZXJmb3JtIDEtYml0Cj4gc3BpLW1lbSBvcHMg
Zm9yIHVwLXRvIDB4YTAgYnl0ZXMgYW5kIHR5cGljYWwgU1BJLU5BTkQgc2luZ2xlLCBkdWFsCj4g
YW5kIHF1YWQgSU8gcGFnZSBjYWNoZSBvcHMgd2l0aCAyLWJ5dGUgYWRkcmVzcy4gQWRkaXRpb25h
bGx5LCB0aGUKPiBwYWdlIGNhY2hlIG9wcyBjYW4gYmUgcGVyZm9ybWVkIHdpdGggRUNDIGFuZCBh
dXRvIGRhdGEgZm9ybWF0dGluZwo+IHVzaW5nIHRoZSBFQ0MgZW5naW5lIG9mIHRoZSBjb250cm9s
bGVyLgo+IAo+IFRoaXMgcGF0Y2hzZXQgaW1wbGVtZW50cyBzdXBwb3J0IG9mIHRoaXMgbW9kZSBh
cyBhIHNlcGFyYXRlZCBTUEktTUVNCj4gZHJpdmVyIHdpdGggcGlwZWxpbmVkIEVDQyBlbmdpbmUu
CgoKWy4uLl0KClRoZSBwYXRjaCBhY3R1YWxseSBsb29rIGluZGVwZW5kZW50LCBzbyBpZiBpdCdz
IGZpbmUgZm9yIHlvdSBJIGNhbiB0YWtlCnRoZSB0d28gbXRkIHBhdGNoZXMgYW5kIGxldCB5b3Ug
bWVyZ2UgdGhlIHNwaS9iaW5kaW5nIGNoYW5nZXMuCgpXb3VsZCB0aGlzIHdvcmsgZm9yIHlvdT8K
Cj4gQ2h1YW5ob25nIEd1byAoNSk6Cj4gICBtdGQ6IG5hbmQ6IG1ha2UgbXRrX2VjYy5jIGEgc2Vw
YXJhdGVkIG1vZHVsZQo+ICAgc3BpOiBhZGQgZHJpdmVyIGZvciBNVEsgU1BJIE5BTkQgRmxhc2gg
SW50ZXJmYWNlCj4gICBtdGQ6IG5hbmQ6IG10ay1lY2M6IGFsc28gcGFyc2UgbmFuZC1lY2MtZW5n
aW5lIGlmIGF2YWlsYWJsZQo+ICAgc3BpOiBkdC1iaW5kaW5nczogYWRkIGJpbmRpbmcgZG9jIGZv
ciBzcGktbXRrLXNuZmkKPiAgIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhZGQgbXRrLXNuZmkgZm9y
IG10NzYyMgo+IAo+ICAuLi4vYmluZGluZ3Mvc3BpL21lZGlhdGVrLHNwaS1tdGstc25maS55YW1s
ICAgfCAgIDg4ICsKPiAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaSAg
ICAgIHwgICAxMiArCj4gIGRyaXZlcnMvbXRkL25hbmQvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDcgKwo+ICBkcml2ZXJzL210ZC9uYW5kL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgfCAgICAxICsKPiAgZHJpdmVycy9tdGQvbmFuZC97cmF3L210a19lY2MuYyA9PiBlY2Mt
bXRrLmN9IHwgICAgOCArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAgICAg
ICAgICAgICAgfCAgICAxICsKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgIHwgICAgMiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tdGtfbmFuZC5jICAg
ICAgICAgICAgICAgfCAgICAyICstCj4gIGRyaXZlcnMvc3BpL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMTAgKwo+ICBkcml2ZXJzL3NwaS9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAxICsKPiAgZHJpdmVycy9zcGkvc3BpLW10ay1zbmZpLmMgICAg
ICAgICAgICAgICAgICAgIHwgMTQ3MCArKysrKysrKysrKysrKysrKwo+ICAuLi4vbGludXgvbXRk
L25hbmQtZWNjLW10ay5oICAgICAgICAgICAgICAgICAgfCAgICAwCj4gIDEyIGZpbGVzIGNoYW5n
ZWQsIDE1OTcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvbWVkaWF0ZWssc3BpLW10
ay1zbmZpLnlhbWwKPiAgcmVuYW1lIGRyaXZlcnMvbXRkL25hbmQve3Jhdy9tdGtfZWNjLmMgPT4g
ZWNjLW10ay5jfSAoOTglKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zcGkvc3BpLW10
ay1zbmZpLmMKPiAgcmVuYW1lIGRyaXZlcnMvbXRkL25hbmQvcmF3L210a19lY2MuaCA9PiBpbmNs
dWRlL2xpbnV4L210ZC9uYW5kLWVjYy1tdGsuaCAoMTAwJSkKPiAKCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
