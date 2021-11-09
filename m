Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0836C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 11:36:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F0A61184
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 11:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0F0A61184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXLP3ZMBk9lbiF10ntepvQDwtoay27uTD4TFZZsJl6I=; b=vW7T9TLQI33Fc+
	CSUagQLtwQWK7/WS/V/W3DeCF9jCYhey9skgYL+3RnwxaAi/15LkbJpLJ4xbBQi+aeIbzFnw8z3AV
	/+VhBALamTZqwmqNbczK/L394pITf6tkVdinSCXF36fwYhf4gY8gH7VF/y1SZv6xNUUuIzNTdfs/N
	mmHMQWbp5iGNoNnFmm8Adj8vKPH9fRWoUv1lMbptUkouMcxZO9aXxTh11ah4GQgBqwYDjvx9gE6BF
	cdCoorFHwHfdVxQa3F8N1X0MdRA8QON2ihsOCTOcHxhbb60LswQ7FJn0rCq2P20oPr1mOBTyR7aqf
	vZ188s6CwWstQ5h6i43Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkPPx-001l39-3c; Tue, 09 Nov 2021 11:35:57 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkPPR-001kkY-K1; Tue, 09 Nov 2021 11:35:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 753E6C0004;
 Tue,  9 Nov 2021 11:35:22 +0000 (UTC)
Date: Tue, 9 Nov 2021 12:35:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <donghunt@amazon.com>, <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: Re: [RFC,v3 4/5] arm64: dts: add snfi node for spi nand
Message-ID: <20211109123521.7785b8c3@xps13>
In-Reply-To: <20211022024021.14665-5-xiangsheng.hou@mediatek.com>
References: <20211022024021.14665-1-xiangsheng.hou@mediatek.com>
 <20211022024021.14665-5-xiangsheng.hou@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_033525_830161_756AF083 
X-CRM114-Status: GOOD (  11.51  )
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

SGkgWGlhbmdzaGVuZywKCnhpYW5nc2hlbmcuaG91QG1lZGlhdGVrLmNvbSB3cm90ZSBvbiBGcmks
IDIyIE9jdCAyMDIxIDEwOjQwOjIwICswODAwOgoKPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZ3NoZW5n
IEhvdSA8eGlhbmdzaGVuZy5ob3VAbWVkaWF0ZWsuY29tPgoKWW91IG1pc3MgYSBjb21taXQgbWVz
c2FnZSBvdGhlcndpc2UgdGhlIGNvbnRlbnQgbG9va3MgZ29vZCB0byBtZS4KCj4gLS0tCj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLXJmYjEuZHRzIHwgMTggKysrKysrKysr
KysrKysrKysrCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLmR0c2kgICAg
IHwgMTMgKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykK
PiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjItcmZi
MS5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NzYyMi1yZmIxLmR0cwo+IGlu
ZGV4IGYyZGM4NTAwMTBmMS4uZjRiYTg2YzQ1MWZjIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLXJmYjEuZHRzCj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDc2MjItcmZiMS5kdHMKPiBAQCAtMjIzLDYgKzIyMywyNCBAQCAmbmFu
ZGMgewo+ICAJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgfTsKPiAgCj4gKyZzbmZpIHsKPiArCXBp
bmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gKwkvKiBwaW4gc2hhcmVkIHdpdGggc3BpYyAqLwo+
ICsJcGluY3RybC0wID0gPCZzbmZpX3BpbnM+Owo+ICsJbmFuZC1lY2MtZW5naW5lID0gPCZiY2g+
Owo+ICsJc3RhdHVzID0gImRpc2FibGVkIjsKPiArCj4gKwlzcGlfbmFuZEAwIHsKPiArCQljb21w
YXRpYmxlID0gInNwaS1uYW5kIjsKPiArCQlyZWcgPSA8MD47Cj4gKwkJc3BpLW1heC1mcmVxdWVu
Y3kgPSA8MTA0MDAwMDAwPjsKPiArCQlzcGktdHgtYnVzLXdpZHRoID0gPDQ+Owo+ICsJCXNwaS1y
eC1idXMtd2lkdGggPSA8ND47Cj4gKwkJbmFuZC1lY2MtZW5naW5lID0gPCZzbmZpPjsKPiArCQlu
YW5kLWVjYy1wbGFjZW1lbnQgPSAiaW50ZXJsZWF2ZWQiOwo+ICsJfTsKPiArfTsKPiArCj4gICZu
b3JfZmxhc2ggewo+ICAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiAgCXBpbmN0cmwtMCA9
IDwmc3BpX25vcl9waW5zPjsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDc2MjIuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLmR0
c2kKPiBpbmRleCA4OTBhOTQyZWM2MDguLjA1MjVlNGRlNWVjMCAxMDA2NDQKPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NzYyMi5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaQo+IEBAIC01NDUsNiArNTQ1LDE5IEBAIG5hbmRj
OiBuZmlAMTEwMGQwMDAgewo+ICAJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gIAl9Owo+ICAKPiAr
CXNuZmk6IHNwaUAxMTAwZDAwMCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDc2MjIt
c25maSI7Cj4gKwkJcmVnID0gPDAgMHgxMTAwRDAwMCAwIDB4MTAwMD47Cj4gKwkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDk2IElSUV9UWVBFX0xFVkVMX0xPVz47Cj4gKwkJY2xvY2tzID0gPCZpbmZy
YWNmZ19hbyBDS19JTkZSQV9ORkkxX0NLPiwKPiArCQkJIDwmaW5mcmFjZmdfYW8gQ0tfSU5GUkFf
U1BJTkZJMV9DSz4sCj4gKwkJCSA8JmluZnJhY2ZnX2FvIENLX0lORlJBX05GSV9IQ0tfQ0s+Owo+
ICsJCWNsb2NrLW5hbWVzID0gIm5maV9jbGsiLCAic25maV9jbGsiLCAiaGNsayI7Cj4gKwkJI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47Cj4gKwkJI3NpemUtY2VsbHMgPSA8MD47Cj4gKwkJc3RhdHVzID0g
ImRpc2FibGVkIjsKPiArCX07Cj4gKwo+ICAJYmNoOiBlY2NAMTEwMGUwMDAgewo+ICAJCWNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ3NjIyLWVjYyI7Cj4gIAkJcmVnID0gPDAgMHgxMTAwZTAwMCAw
IDB4MTAwMD47CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
