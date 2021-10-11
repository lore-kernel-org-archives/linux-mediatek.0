Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FDBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 14:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B6C86023F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 14:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B6C86023F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TvbfRda+6dbtHu7fOnVX5g15oFT2DL/9pTS8yaLhVVg=; b=aWTvBbNDlRXcys
	4PzyVHtJLf2d9X/Wv846ifwZzoS5EwEtqymp0mqfaytoeXLMM4y0h9b3Juo7+pzIddrD3PJjDCxi+
	rH9PhUzhxHD45a+0XAS6dYvDWGhm/DqyIOp5HnllHrIk1HGbMZOdJc0XeFXQDnwZXmZmwfNwz07C+
	A/G+kn+eXH7fEp+e0x8dx/OGsUSJXGibVLW6RQSKrIZCJxWXB/I80CritNmtWtS4as4/cj3StA+EM
	rSd00iFKEdqe9I8o0tqNKzBEQcjbrPsCdKEA6b94yTNfsM0HOvH4MgvNq2twzU3Bqd7N8C9FIBlHS
	xu8T6p/ORSQ9jYu3wHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwKl-009mB7-4E; Mon, 11 Oct 2021 14:31:19 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwKh-009mAK-Uu; Mon, 11 Oct 2021 14:31:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D82F7E0015;
 Mon, 11 Oct 2021 14:31:10 +0000 (UTC)
Date: Mon, 11 Oct 2021 16:31:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "xiangsheng.hou" <xiangsheng.hou@mediatek.com>
Cc: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <donghunt@amazon.com>, <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: Re: [RFC,v1 0/4] Add a driver for Mediatek SPI Nand controller
Message-ID: <20211011163108.256752eb@xps13>
In-Reply-To: <cb200da61b942d93a272f3391f756c493cb5a342.camel@mediatek.com>
References: <20210927053629.17847-1-xiangsheng.hou@mediatek.com>
 <20211008112045.11e8d148@xps13>
 <cb200da61b942d93a272f3391f756c493cb5a342.camel@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_073116_291935_401CD87D 
X-CRM114-Status: GOOD (  30.35  )
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

SGVsbG8sCgp4aWFuZ3NoZW5nLmhvdUBtZWRpYXRlay5jb20gd3JvdGUgb24gTW9uLCAxMSBPY3Qg
MjAyMSAxOTozMToyOCArMDgwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IE9uIEZyaSwgMjAyMS0xMC0w
OCBhdCAxMToyMCArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhlbGxvLAo+ID4gCj4g
PiB4aWFuZ3NoZW5nLmhvdUBtZWRpYXRlay5jb20gd3JvdGUgb24gTW9uLCAyNyBTZXAgMjAyMSAx
MzozNjoyNSArMDgwMDoKPiA+ICAgCj4gPiA+IEFkZCBhIGRyaXZlciBmb3IgTWVkaWF0ZWsgU1BJ
IE5hbmQgY29udHJvbGxlcgo+ID4gPiAKPiA+ID4gTWVkaWF0ZWsgU1BJIE5hbmQgY29udHJvbGxl
ciBjb3Npc3RzIG9mIHR3byBwYXJ0czogb24taG9zdCBIVyBFQ0MKPiA+ID4gYW5kCj4gPiA+IHNu
Zmkoc3RhbmQgZm9yIHNwaSBuYW5kIGZsYXNoIGludGVyZmFjZSkuIFRoZXkgY2FuIGNvd29yayB3
aXRoIGhpZ2gKPiA+ID4gcGVyZm9ybWFuY2Ugd2hpY2ggY2FsbGVkIEVDQyBuZmkgbW9kZS4gVGhl
IG5maSBzdGFuZCBmb3IgbmFuZCBmbGFzaAo+ID4gPiBpbnRlcmZhY2VpKHNuZmkgYSBvbmUgcGFy
dCBvZiBuZmkpIHdoaWNoIGNhbiBzdXBwb3J0IFNQSSBOYW5kIGZsYXNoCj4gPiA+IGFuZCByYXcg
bmFuZCBmbGFzaC4KPiA+ID4gCj4gPiA+IEhvd2V2ZXIsIHRoZSBzbmZpIGRyaXZlciBpbiBzcGkg
c3Vic3l0ZW0gbmVlZCB0byBiZSBhd2FyZSBvZiBuYW5kCj4gPiA+IHBhcmFtZXRlcihwYWdlL3Nw
YXJlIHNpemUpIGFuZCBlY2Mgc3RhdHVzKGVuYWJsZS9kaXNhYmxlKSB3aGVuIHdvcmsKPiA+ID4g
YXQgRUNDIG5maSBtb2RlLiBUaGUgc25maSBkcml2ZXIgaW4gc3BpIHN1YnN5c3RlbSBzZWVtcyBk
aWZmaWN1bHQKPiA+ID4gdG8KPiA+ID4ga25vdyB0aGVzZS4KPiA+ID4gCj4gPiA+IFRoZXJlZm9y
ZSwgY29uc2lkZXIgdHdvIHdheXMgdG8gbGV0IHNuZmkgY2FuIGdldCB0aGVzZSBpbmZvcm1hdGlv
bi4KPiA+ID4gVGhlIFJGQyBwYXRjaCBzZW5kIHRvIHJldmlldyB3aGV0aGVyIHRoZXkgYXJlIHN1
aXRhYmxlIGFuZCB3aGljaAo+ID4gPiBzb2x1dGlvbiBtYXliZSBiZXR0ZXIuCj4gPiA+ICAgCj4g
PiAKPiA+IEkndmUgbG9va2VkIGF0IGJvdGggdmVyc2lvbnMgdGhhdCB5b3UgcHJvdmlkZWQgYW5k
IEkgdGhvdWdodCBhYm91dCBhCj4gPiBudW1iZXIgb2YgdGhpbmdzIHRoYXQgY2Fubm90IGJlIGRv
bmUgbGlrZSB0aGlzOgo+ID4gLSBJIGJlbGlldmUgdGhlIHNuZmkgaXMgYSByZWd1bGFyIFNQSSBj
b250cm9sbGVyLiBJIHdpbGwgbGV0IE1hcmsKPiA+ICAgY29uZmlybSBidXQgSSBkbyBub3QgdGhp
bmsgd2Ugd2FudCB0byBzdGFydCB3cml0aW5nIFNQSS1OQU5ECj4gPiAgIGNvbnRyb2xsZXJzLiBJ
bnN0ZWFkIHdlIHdyaXRlIFNQSSBjb250cm9sbGVycyBhbmQgd2UgcHJvdmlkZSBTUEktCj4gPiBt
ZW0KPiA+ICAgb3BlcmF0aW9ucyAod2UndmUgZXhwbGFpbmVkIHRoaXMgaW4gYSBwcmV2aW91cyBF
TEMsIHRoZSB2aWRlbyBpcwo+ID4gICBhdmFpbGFibGUgb24gWW91VHViZSkuICAKPiAKPiBUaGUg
c25maSBjb250cm9sbGVyIGNhbiBzdXBwb3J0IG11bHRpcGxlIFNQSSBwcm90b2NvbHMsIHdoaWNo
IGNhbgo+IHN1cHBvcnQgb3RoZXIgU1BJIGRldmljZSBpbiB0aGVvcnkuIEhvd2V2ZXIsIHRoZSBz
bmZpIG5lZWQgdG8ga25vdyBuYW5kCj4gcGFyYW1ldGVyIGFuZCBlY2Mgc3RhdHVzKGVuYWJsZS9k
aXNhYmxlKSB3aGVuIHdvcmsgd2l0aCBNVEsgb24taG9zdCBIVwo+IEJDSCBFQ0MgZW5naW5lIGZv
ciBuYW5kIGZsYXNoLgo+IAo+IFRoZXJlZm9yZSwgdGhlIFJGQyBwYXRjaCB2MS92MiBpcyB0cnkg
dGhlIHdheSB0byBnZXQgdGhlc2UgaW5mb3JtYXRpb24uCj4gCj4gPiAtIFlvdSBjYW5ub3QgYWRk
IGFuIE1USyBFQ0MgYWxnb3JpdGhtLiBUaGlzIGlzIGRlZGljYXRlZCBmb3Igc29md2FyZQo+ID4g
ICBzb2x1dGlvbnMgb25seSBhbmQgYXMgZmFyIGFzIEkgdW5kZXJzdGFuZCB5b3VyIGVuZ2luZSB1
c2VzIHRoZSBCQ0gKPiA+ICAgYWxnb3JpdGhtLgo+ID4gLSBXaGVuIHRoZSBFQ0MgZW5naW5lIGlz
IHBpcGVsaW5lZCwgdGhlcmUgaXMgYW4gYWRkaXRpb25hbCBjb21wbGV4aXR5Cj4gPiAgIGluIGlu
dGVyZmFjaW5nIGl0IHdpdGggYSBTUEkgY29udHJvbGxlciAodGhhdCdzIHlvdXIgY2FzZSBJCj4g
PiBiZWxpZXZlKS4KPiA+ICAgSSBoYXZlIGFuIGV4YW1wbGUgdGludGVuZGhhdCBpcyBub3QgeWV0
IHVwc3RyZWFtIGJ1dCBJIHRoaW5rIHdvcnRoCj4gPiBsb29raW5nCj4gPiAgIGF0IHRoYXQgSSB3
aWxsIHNlbmQgdmVyeSBzb29uIChJIHdpbGwgQ2M6IHlvdSBvbiBpdCkuICAKPiAKPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2guCj4gCj4gTVRLIEhXIEVDQyhiY2gpIGFsZ29yaXRobSBjYW4gd29yayBp
biBwaXBlbGluZWQgYW5kIGV4dGVybmFsLgo+IEhvd2V2ZXIsIHRoZSBwZXJmb3JtYW5jZSB3b3Jz
ZSB3aGVuIHdvcmsgYXQgZWN0ZXJuYWwgd2hpY2ggcmVhbGl6ZSBhbmQKPiB2ZXJpZnkgaW4gbG9j
YWwuIFRoZXJlZm9yZSwgdHJ5IHRoZSBwaXBlbGluZWQgaW4gUkZDIHBhdGNoIHYxL3YyLgoKWWVz
IHRoaXMgaXMgY29tcGxldGVseSBleHBlY3RlZCBhcyB0aGUgZGF0YSBtdXN0IGJlIG1vdmVkIHR3
aWNlIGluc3RlYWQKb2Ygb25jZS4gSSBiZWxpZXZlIHBpcGVsaW5lZCBtb2RlIGlzIGhhcmRlciB0
byBpbXBsZW1lbnQgaW4gc29mdHdhcmUgYnV0CmJyaW5ncyBiZXR0ZXIgcGVyZm9ybWFuY2VzLgoK
PiBBbmQgYWxzbyByZWFsaXplIHRoZSBtdGQvbmFuZCBpbmZvIGNhbiBiZSBnZXQgaW4gc3BpIGRy
aXZlciB3aGljaCB0aGUKPiBzcGktbXhpYyBkcml2ZXIgaW4geW91ciBwYXRjaC4gVGhpcyBtYXkg
c29sdmUgbW9zdCBvZiBkaWZmaWN1bHR5IHRoYXQKPiBlbmNvdW50ZXJlZCBpbiB0aGUgc25maSBk
cml2ZXIgdGhhdCB0aGUgUkZDIHBhdGNoIHYxL3YyIHRyeSB0byByZXNvbHZlLgoKR3JlYXQsIHRo
YXQgd2FzIGluZGVlZCB0aGUgZ29hbC4KCj4gSSB3aWxsIHByZXBhcmUgdGhlIFJGQyBwYXRjaCB2
MyB3aXRoIGNvcnJlY3QgcGlwZWxpbmVkIGVjYyBlbmdpbmUKPiByZWFsaXphdGlvbiBmb3IgeW91
ciByZXZpZXcuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
