Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E9EC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 07:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sc99MnwwqSQeCLplOEFQ5aPfy5Sej8K6W2oT4FH9RyI=; b=WCbz1fNGaBcq4H
	c97upCNr0w5ZkG0SGS3A9KQjhBJo/xyyZkP5RHEJ1o2JuA0hd7D5OKLqW3fnWVfsP2ZJ1jJGjnZ3b
	uEiBjpXiD/aaJhTSVM5LHHDfAZ2KpUWK0J7/MmwF6KAkjzedzm1SoONMHDOB0D/XT1w42sEHuAzL9
	uFPzWwf6gM5WlXZAEKUBdbOqZRHhuDa9oUF4/Ex22skx+8JZSxuMzRVr+alXZ/tXZzSxdiSDr8bN9
	CCxy/7zcw35+Xbdac107lWi60Sj5Jc44fl8laOo3cCd8YlW6nk1iAXM7LJzEDra4r7C8uz16a191v
	v9A8AyIpsCp3y2w/rcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZSdx-00EYh8-Dl; Wed, 30 Mar 2022 07:21:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZSdi-00EYbx-EY; Wed, 30 Mar 2022 07:21:13 +0000
X-UUID: b7e7abd3e8794e888cb7c270001930d8-20220330
X-UUID: b7e7abd3e8794e888cb7c270001930d8-20220330
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 666390043; Wed, 30 Mar 2022 00:21:04 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 00:21:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 15:21:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 15:21:01 +0800
Message-ID: <701a4568d50ca60747731f6ccb1d7d14882d11b7.camel@mediatek.com>
Subject: Re: [PATCH v4 02/22] arm64: dts: mt8192: Add spmi node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Wed, 30 Mar 2022 15:21:00 +0800
In-Reply-To: <8e482005-8f44-3502-3bca-0824f3e2dd7a@gmail.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-3-allen-kh.cheng@mediatek.com>
 <8e482005-8f44-3502-3bca-0824f3e2dd7a@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_002110_527266_4E488728 
X-CRM114-Status: GOOD (  17.17  )
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

SGkgTWF0aGlhcywKCk9uIFdlZCwgMjAyMi0wMy0yMyBhdCAxODoxNiArMDEwMCwgTWF0dGhpYXMg
QnJ1Z2dlciB3cm90ZToKPiAKPiBPbiAxOC8wMy8yMDIyIDE1OjQ1LCBBbGxlbi1LSCBDaGVuZyB3
cm90ZToKPiA+IEFkZCBzcG1pIG5vZGUgZm9yIG10ODE5MiBTb0MuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxhbGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20+Cj4gPiBS
ZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEu
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDwKPiA+IGFu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPiA+IC0tLQo+ID4gICBhcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIHwgMTcgKysrKysrKysrKysrKysr
KysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiA+IGIvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gaW5kZXggNzY0Mjg1OTk0
NDRlLi4wZjlmMjExY2E5ODYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE5Mi5kdHNpCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE5Mi5kdHNpCj4gPiBAQCAtNTM1LDYgKzUzNSwyMyBAQAo+ID4gICAJCQlhc3NpZ25lZC1j
bG9jay1wYXJlbnRzID0gPCZ0b3Bja2dlbgo+ID4gQ0xLX1RPUF9PU0NfRDEwPjsKPiA+ICAgCQl9
Owo+ID4gICAKPiA+ICsJCXNwbWk6IHNwbWlAMTAwMjcwMDAgewo+ID4gKwkJCWNvbXBhdGlibGUg
PSAibWVkaWF0ZWssbXQ2ODczLXNwbWkiOwo+ID4gKwkJCXJlZyA9IDwwIDB4MTAwMjcwMDAgMCAw
eDAwMGUwMD4sCj4gPiArCQkJICAgICAgPDAgMHgxMDAyOTAwMCAwIDB4MDAwMTAwPjsKPiA+ICsJ
CQlyZWctbmFtZXMgPSAicG1pZiIsICJzcG1pbXN0IjsKPiA+ICsJCQljbG9ja3MgPSA8JmluZnJh
Y2ZnIENMS19JTkZSQV9QTUlDX0FQPiwKPiA+ICsJCQkJIDwmaW5mcmFjZmcgQ0xLX0lORlJBX1BN
SUNfVE1SPiwKPiA+ICsJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9TUE1JX01TVF9TRUw+Owo+ID4g
KwkJCWNsb2NrLW5hbWVzID0gInBtaWZfc3lzX2NrIiwKPiA+ICsJCQkJICAgICAgInBtaWZfdG1y
X2NrIiwKPiA+ICsJCQkJICAgICAgInNwbWltc3RfY2xrX211eCI7Cj4gPiArCQkJYXNzaWduZWQt
Y2xvY2tzID0gPCZ0b3Bja2dlbgo+ID4gQ0xLX1RPUF9QV1JBUF9VTFBPU0NfU0VMPjsKPiA+ICsJ
CQlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZ0b3Bja2dlbgo+ID4gQ0xLX1RPUF9PU0NfRDEw
PjsKPiA+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiA+ICsJCQkjc2l6ZS1jZWxscyA9IDww
PjsKPiAKPiBXaGF0IGRvIHdlIG5lZWQgdGhlIGFkZHJlc3MtY2VsbHMgYW5kIHNpemUtY2VsbHMg
Zm9yPwo+IAo+IFJlZ2FyZHMsCj4gTWF0dGhpYXMKPiAKCldlIHdpaWwgYWRkIHR3byByZWd1bGF0
b3JzIGZvciBib2FyZCBsZXZlbCAobXQ4MTkyLWFzdXJhZGEuZHRzaSkuCgpBZHJlc3MtY2VsbHMg
YW5kIHNpemUtY2VsbHMgYXJlIHVzZWQgdG8gZGVudGlmeSByZWd1bGF0b3IuCgomc3BtaSB7CiAg
ICAgICAgZ3JwaWQgPSA8MTE+OwoKICAgICAgICBtdDYzMTVfNjogcG1pY0A2IHsKICAgICAgICAg
ICAgICAgCmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2MzE1LXJlZ3VsYXRvciI7CiAgICAgICAg
ICAgICAgICByZWcgPSA8MHg2IDA+OwoKCQkuLi4uCiAgICAgICAgfTsKCiAgICAgICAgbXQ2MzE1
Xzc6IHBtaWNANyB7CiAgICAgICAgICAgICAgIApjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjMx
NS1yZWd1bGF0b3IiOwogICAgICAgICAgICAgICAgcmVnID0gPDB4NyAwPjsKCgkJLi4uLgogICAg
ICAgIH07Cn07CgpUaGFua3MsCkFsbGVuCgo+ID4gKwo+ID4gICAJCXNjcF9hZHNwOiBjbG9jay1j
b250cm9sbGVyQDEwNzIwMDAwIHsKPiA+ICAgCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
OTItc2NwX2Fkc3AiOwo+ID4gICAJCQlyZWcgPSA8MCAweDEwNzIwMDAwIDAgMHgxMDAwPjsKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
