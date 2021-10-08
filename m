Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E97EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 09:21:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D865261042
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 09:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D865261042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7N2ZaBXSlK9evktpp8eIB5AKXa8dWMl28+Bs0OR+Fw8=; b=wTu3sR+pz7eJ2Y
	5IRIjF3hTLme+wl+PX2ff80K7qgeyY3CPVy1jMi+PS9lS6zBpXiLu2X1frEAOsEiY73CrybQnhrHZ
	xLDU5WUuwOXJZfGeSzu8M1PIjyhTo5hgqwkwjeDao1n9//zjcuZs3SYAH+k6V6KPZaDdpdULn3i7h
	aIeV3bycEpxlqhjb18urxhS1r2d5F+Ocu5dwSBKg+Y9Wk9TlRFn5KuqSSx0+lNhheSCYoe42e37vU
	THB7aHLL2dU1bMYVCHuXImK++Ui73095y+6DYwY9ulbUjR1sZ6Wk+kUewG9HB0ax0opg6g9WRcNnw
	RUQEus3y1rJeRrFN5jiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYm3k-002AEo-En; Fri, 08 Oct 2021 09:20:56 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYm3h-002AEL-Vc; Fri, 08 Oct 2021 09:20:55 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 29A4F100004;
 Fri,  8 Oct 2021 09:20:46 +0000 (UTC)
Date: Fri, 8 Oct 2021 11:20:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <info@bootlin.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <donghunt@amazon.com>, <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: Re: [RFC,v1 0/4] Add a driver for Mediatek SPI Nand controller
Message-ID: <20211008112045.11e8d148@xps13>
In-Reply-To: <20210927053629.17847-1-xiangsheng.hou@mediatek.com>
References: <20210927053629.17847-1-xiangsheng.hou@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_022054_315082_9431CB73 
X-CRM114-Status: GOOD (  18.78  )
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

SGVsbG8sCgp4aWFuZ3NoZW5nLmhvdUBtZWRpYXRlay5jb20gd3JvdGUgb24gTW9uLCAyNyBTZXAg
MjAyMSAxMzozNjoyNSArMDgwMDoKCj4gQWRkIGEgZHJpdmVyIGZvciBNZWRpYXRlayBTUEkgTmFu
ZCBjb250cm9sbGVyCj4gCj4gTWVkaWF0ZWsgU1BJIE5hbmQgY29udHJvbGxlciBjb3Npc3RzIG9m
IHR3byBwYXJ0czogb24taG9zdCBIVyBFQ0MgYW5kCj4gc25maShzdGFuZCBmb3Igc3BpIG5hbmQg
Zmxhc2ggaW50ZXJmYWNlKS4gVGhleSBjYW4gY293b3JrIHdpdGggaGlnaAo+IHBlcmZvcm1hbmNl
IHdoaWNoIGNhbGxlZCBFQ0MgbmZpIG1vZGUuIFRoZSBuZmkgc3RhbmQgZm9yIG5hbmQgZmxhc2gK
PiBpbnRlcmZhY2VpKHNuZmkgYSBvbmUgcGFydCBvZiBuZmkpIHdoaWNoIGNhbiBzdXBwb3J0IFNQ
SSBOYW5kIGZsYXNoCj4gYW5kIHJhdyBuYW5kIGZsYXNoLgo+IAo+IEhvd2V2ZXIsIHRoZSBzbmZp
IGRyaXZlciBpbiBzcGkgc3Vic3l0ZW0gbmVlZCB0byBiZSBhd2FyZSBvZiBuYW5kCj4gcGFyYW1l
dGVyKHBhZ2Uvc3BhcmUgc2l6ZSkgYW5kIGVjYyBzdGF0dXMoZW5hYmxlL2Rpc2FibGUpIHdoZW4g
d29yawo+IGF0IEVDQyBuZmkgbW9kZS4gVGhlIHNuZmkgZHJpdmVyIGluIHNwaSBzdWJzeXN0ZW0g
c2VlbXMgZGlmZmljdWx0IHRvCj4ga25vdyB0aGVzZS4KPiAKPiBUaGVyZWZvcmUsIGNvbnNpZGVy
IHR3byB3YXlzIHRvIGxldCBzbmZpIGNhbiBnZXQgdGhlc2UgaW5mb3JtYXRpb24uCj4gVGhlIFJG
QyBwYXRjaCBzZW5kIHRvIHJldmlldyB3aGV0aGVyIHRoZXkgYXJlIHN1aXRhYmxlIGFuZCB3aGlj
aAo+IHNvbHV0aW9uIG1heWJlIGJldHRlci4KPiAKPiBSRkMgcGF0Y2ggdjE6Cj4gQWRkIG5maSBy
ZWdpc3RlciBiYXNlIGF0IGJjaChlY2MpIGR0cyBub2RlIGFuZCBjb25maWcgbmFuZCBwYXJhbWV0
ZXIKPiBhbmQgZWNjIHN0YXR1cyBpbnRvIG5maSByZWdpc3RlcnMgaW4gZWNjIGRyaXZlciwgdGhl
biBwYXJzZSB0aGVzZQo+IGluZm9ybWF0aW9uIGF0IHNuZmkgZHJpdmVyIHRvIHVzZS4KPiAKPiBS
RkMgcGF0Y2ggdjI6Cj4gRXhwb3J0IHNvbWUgZnVuY3Rpb24gaW4gSFcgRUNDIGRyaXZlciBhbmQg
c25maSBkcml2ZXIuCj4gSW4gSFcgRUNDIGRyaXZlciwgZXhwb3J0IGZ1bmN0aW9uIGluY2x1ZGUg
Z2V0IG5hbmQgcGFnZS9zcGFyZSBzaXplLCBIVwo+IEVDQyBzdGF0dXMoZW5hYmxlL2Rpc2FibGUp
IGFuZCBmZG0ob29iIGZyZWUgcGVyIHNlY3RvciBpbiBvb2JsYXlvdXQpIHNpemUuCj4gSW4gc25m
aSBkcml2ZXIgbmVlZCBleHBvcnQgZW1wdHkgcGFnZSBzdGF0dXMgd2hpY2ggdGhlIG5maSBjYW4g
YmUgYXdhcmUKPiB3aGVuIGluIEVDQyBuZmkgbW9kZSh0aGUgc3BpbSBmcmFtZXdvcmsgY2FuIG5v
dCByZXR1cm4gdGhpcyBpbmZvcm1hdGlvbikuCj4gCgpJJ3ZlIGxvb2tlZCBhdCBib3RoIHZlcnNp
b25zIHRoYXQgeW91IHByb3ZpZGVkIGFuZCBJIHRob3VnaHQgYWJvdXQgYQpudW1iZXIgb2YgdGhp
bmdzIHRoYXQgY2Fubm90IGJlIGRvbmUgbGlrZSB0aGlzOgotIEkgYmVsaWV2ZSB0aGUgc25maSBp
cyBhIHJlZ3VsYXIgU1BJIGNvbnRyb2xsZXIuIEkgd2lsbCBsZXQgTWFyawogIGNvbmZpcm0gYnV0
IEkgZG8gbm90IHRoaW5rIHdlIHdhbnQgdG8gc3RhcnQgd3JpdGluZyBTUEktTkFORAogIGNvbnRy
b2xsZXJzLiBJbnN0ZWFkIHdlIHdyaXRlIFNQSSBjb250cm9sbGVycyBhbmQgd2UgcHJvdmlkZSBT
UEktbWVtCiAgb3BlcmF0aW9ucyAod2UndmUgZXhwbGFpbmVkIHRoaXMgaW4gYSBwcmV2aW91cyBF
TEMsIHRoZSB2aWRlbyBpcwogIGF2YWlsYWJsZSBvbiBZb3VUdWJlKS4KLSBZb3UgY2Fubm90IGFk
ZCBhbiBNVEsgRUNDIGFsZ29yaXRobS4gVGhpcyBpcyBkZWRpY2F0ZWQgZm9yIHNvZndhcmUKICBz
b2x1dGlvbnMgb25seSBhbmQgYXMgZmFyIGFzIEkgdW5kZXJzdGFuZCB5b3VyIGVuZ2luZSB1c2Vz
IHRoZSBCQ0gKICBhbGdvcml0aG0uCi0gV2hlbiB0aGUgRUNDIGVuZ2luZSBpcyBwaXBlbGluZWQs
IHRoZXJlIGlzIGFuIGFkZGl0aW9uYWwgY29tcGxleGl0eQogIGluIGludGVyZmFjaW5nIGl0IHdp
dGggYSBTUEkgY29udHJvbGxlciAodGhhdCdzIHlvdXIgY2FzZSBJIGJlbGlldmUpLgogIEkgaGF2
ZSBhbiBleGFtcGxlIHRoYXQgaXMgbm90IHlldCB1cHN0cmVhbSBidXQgSSB0aGluayB3b3J0aCBs
b29raW5nCiAgYXQgdGhhdCBJIHdpbGwgc2VuZCB2ZXJ5IHNvb24gKEkgd2lsbCBDYzogeW91IG9u
IGl0KS4KLSBUaGUgRFQgZGVzY3JpcHRpb24gZm9yIHRob3NlIGVuZ2luZXMgdGhhdCBoYXMgYmVl
biBkZXNjcmliZWQgb24gdGhlCiAgbWFpbGluZyBsaXN0IGFuZCB3aWxsIGJlIGVuZm9yY2VkIGlz
OgoKLy8gRXh0ZXJuYWwgZW5naW5lCgoJJnNwaS1jb250cm9sbGVyIHsKICAgICAgICAgICAgICAg
IGZsYXNoQDAgewogICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNwaS1uYW5k
IjsKICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+OwogICAgICAgICAgICAgICAgICAg
ICAgICBuYW5kLWVjYy1lbmdpbmUgPSA8JmVjY19lbmdpbmU+OwogICAgICAgICAgICAgICAgICAg
ICAgICBzcGktbWF4LWZyZXF1ZW5jeSA9IDw1MDAwMDAwMD47CiAgICAgICAgICAgICAgICAgICAg
ICAgIHNwaS10eC1idXMtd2lkdGggPSA8ND47CiAgICAgICAgICAgICAgICAgICAgICAgIHNwaS1y
eC1idXMtd2lkdGggPSA8ND47CiAgICAgICAgICAgICAgICB9OwogICAgICAgIH07CgogICAgICAg
IGVjY19lbmdpbmU6IGVjY0A0M2M0MDAwMCB7CiAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
Im14aWMsbmFuZC1lY2MtZW5naW5lLXJldjMiOwogICAgICAgICAgICAgICAgcmVnID0gPDB4NDNj
NDAwMDAgMHgxMDAwMD47CiAgICAgICAgfTsKIAoKLy8gUGlwZWxpbmVkIGVuZ2luZQoKCSZzcGkt
Y29udHJvbGxlciB7CiAgICAgICAgICAgICAgIG5hbmQtZWNjLWVuZ2luZSA9IDwmZWNjX2VuZ2lu
ZT47CiAKICAgICAgICAgICAgICAgIGZsYXNoQDAgewogICAgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInNwaS1uYW5kIjsKICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+
OwogICAgICAgICAgICAgICAgICAgICAgICBuYW5kLWVjYy1lbmdpbmUgPSA8JnNwaV9jb250cm9s
bGVyPjsKICAgICAgICAgICAgICAgICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAw
MDA+OwogICAgICAgICAgICAgICAgICAgICAgICBzcGktdHgtYnVzLXdpZHRoID0gPDQ+OwogICAg
ICAgICAgICAgICAgICAgICAgICBzcGktcngtYnVzLXdpZHRoID0gPDQ+OwogCQl9OwoJfTsKCiAg
ICAgICAgZWNjX2VuZ2luZTogZWNjQDQzYzQwMDAwIHsKICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAibXhpYyxuYW5kLWVjYy1lbmdpbmUtcmV2MyI7CiAgICAgICAgICAgICAgICByZWcgPSA8
MHg0M2M0MDAwMCAweDEwMDAwPjsKICAgICAgICB9OwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
