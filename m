Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A6DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 08:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbM9G5aoswb5VVy2gqVChoD10gq2O76HxZgxQAn6tnE=; b=MJ2+jkyHKfu3/L
	w+xEG2Agv5pK8Vpg+hDTbqRwmn8wX04iFZ4FWwc6bkmKrAr69l/yrl8XoH34PdIv1Cb4yJjtv9PMm
	0ERjvjlYg60y9sC6eQtgnhROV9Ngh6LQmUQP7InkTOsx5ylxuyDuJhQRSdgwY7eA1XmCB4bZqkDSs
	xvFmDTjBXPI3WQuIIeb3mqubET0ixzTLzddPV3Y1zohhKwqmsLT10FOru5TlU/WOzbONeKaK2KHWT
	7FavvcyVnQgyDA7lqcDK1Wu8TqTBP+7DH0LySXVev1p51qgVm/+Vdiz9xqL6SR58iM7q8epsnW2ay
	uoG36PC9jWgQizUeuc4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3Tg-002SSa-Pp; Mon, 23 May 2022 08:31:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2q1-002AAA-Bn; Mon, 23 May 2022 07:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=g6FLCfxIoCr1jPKQ7K2Vu94TDXDvQKQdxG6qUVavy7U=; b=JcL45Xz98PrJNZeUbVFUdg8+hk
 jpqU2VI6PTfTH9v137AQ4Z33gBQ9ltHlB6Cs0GrJELH6ew50iQFHASKesT6wFVZFadWoBgvJUbKXO
 2kssfpuGArs1HOSUghyHyP5rmPDVbTYm8WuDqCmvJI10QLnaUueXvHGDJfdI+XDtr/Q8n7qZeYQbi
 N4gU+rsHSIvOesZYzzJ3uHqPdiBBjVt/gdNG8xjjkU32c0F2UwqghURhjs8XfuAk/R9Jmk3VZF/tG
 DddmSDQLOhlhd+MkxtG5EAgLO2OUX0qqDHUMGBfYp6N8lklOxNqiUflEVb1lCJJGWDkwrkT0MOmzw
 LCTpVqxg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt0Mh-000qg4-Ak; Mon, 23 May 2022 05:12:26 +0000
X-UUID: 1340caaed50947e7ab78927a888583f2-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:cec9d545-df40-4505-acf4-ffffe3500a6b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:e47f3c7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 1340caaed50947e7ab78927a888583f2-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1694326497; Sun, 22 May 2022 22:11:55 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 22:10:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 13:10:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 13:10:23 +0800
Message-ID: <197adcf4e702e0ff5fab0fe07019c6535d90cb47.camel@mediatek.com>
Subject: Re: [PATCH v7 07/19] clk: mediatek: reset: Support nonsequence base
 offsets of reset registers
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 23 May 2022 13:10:23 +0800
In-Reply-To: <20220520151854.kkr2tezmrfniks4j@notapiano>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-8-rex-bc.chen@mediatek.com>
 <20220520151854.kkr2tezmrfniks4j@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_061224_797867_2E5E71A8 
X-CRM114-Status: GOOD (  18.85  )
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

T24gRnJpLCAyMDIyLTA1LTIwIGF0IDExOjE4IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBIaSBSZXgsCj4gCj4gT24gVGh1LCBNYXkgMTksIDIwMjIgYXQgMDg6NTU6MTVQ
TSArMDgwMCwgUmV4LUJDIENoZW4gd3JvdGU6Cj4gPiBUaGUgYmFuayBvZmZzZXRzIGFyZSBub3Qg
c2VyaWFsIGZvciBhbGwgcmVzZXQgcmVnaXN0ZXJzLgo+ID4gRm9yIGV4YW1wbGUsIHRoZXJlIGFy
ZSBmaXZlIGluZnJhIHJlc2V0IGJhbmtzIGZvciBNVDgxOTI6IDB4MTIwLAo+ID4gMHgxMzAsCj4g
PiAweDE0MCwgMHgxNTAgYW5kIDB4NzMwLgo+ID4gCj4gPiBUbyBzdXBwb3J0IHRoaXMsCj4gPiAt
IENoYW5nZSByZWdfb2ZzIHRvIHJzdF9iYW5rX29mcyB3aGljaCBpcyBhIHBvaW50ZXIgdG8gYmFz
ZSBvZmZzZXRzCj4gPiBvZgo+ID4gICB0aGUgcmVzZXQgcmVnaXN0ZXIuCj4gPiAtIEFkZCBhIG5l
dyBkZWZpbmUgUlNUX05SX1BFUl9CQU5LIHRvIGRlZmluZSByZXNldCBudW1iZXIgZm9yIGVhY2gK
PiA+ICAgcmVzZXQgYmFuay4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUmV4LUJDIENoZW4gPHJl
eC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5v
IERlbCBSZWdubyA8Cj4gPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+
Cj4gPiAtLS0KPiAKPiA8c25pcD4KPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZWRp
YXRlay9jbGstbXQyNzAxLWczZC5jCj4gPiBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDI3
MDEtZzNkLmMKPiA+IGluZGV4IDljZmQ1ODk5MzllNS4uNWNiYzVjNDIyMDRkIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10MjcwMS1nM2QuYwo+ID4gKysrIGIvZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10MjcwMS1nM2QuYwo+ID4gQEAgLTM1LDEwICszNSwxMiBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19nYXRlIGczZF9jbGtzW10gPSB7Cj4gPiAgCUdBVEVf
RzNEKENMS19HM0RTWVNfQ09SRSwgImczZF9jb3JlIiwgIm1mZ19zZWwiLCAwKSwKPiA+ICB9Owo+
ID4gIAo+ID4gK3N0YXRpYyB1MTYgcnN0X29mc1tdID0geyAweEMsIH07Cj4gCj4gVmVyeSBuaXRw
aWNreSwgYnV0IHlvdSBjb3VsZCBoYXZlIGxlZnQgdGhlIGhleCBsb3dlcmNhc2UgJzB4YycuCj4g
Cj4gVGhhbmtzLAo+IE7DrWNvbGFzCgpIZWxsbyBOw61jb2xhcywKCm9rLCBJIHdpbGwgbW9kaWZ5
IGl0IGluIG5leHQgdmVyc2lvbi4KCkJScywKUmV4CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
