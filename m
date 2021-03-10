Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF61C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:06:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B14A64FE7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B14A64FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+3Nsps54FcM/s20HKt0e8yhsy7Ydkpb1Zehwst918Mo=; b=OyZOKqr0xdvQx7UXQ3xPSbCZG
	+2jEEsATPJQ0sCX/AsQmGJCHDYvIGn/QDPxLcUzbgsO2/ecaDI253+w9F9zJw5s67BunET6K+NcvT
	sAdWNhHOyderHtzgB8e53MObYnkSKA6e1pn+1qB2TKxr9cpjWK9mFMpl2ntxVHDdWTH4sPcssBZ0d
	M2HQCNUXqIBBRAdPDclHlF1o1Lz/wQrq0qcoRGoVpvAbf4C9DR1W9n5mpehpNzFt/SW3v9KLQxfKz
	xq7Pi9xfQ9bkjlOpAKksjZo7HdD4qcE9kKwJPwksNkm6iKgCxlfrzQNHR5xEVr4diiVGBMtfhQzW2
	ZSNqypmfw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJrz8-0066vg-FR; Wed, 10 Mar 2021 06:06:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJryM-0066sJ-Be; Wed, 10 Mar 2021 06:05:56 +0000
X-UUID: 8c90a607311c4e54bf4b644ea7af83dd-20210309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TpSFMejpETm7dL5XOwTkRbiRAvyZRSD0cuBEgmPjSQA=; 
 b=hiNeI0VmnpRRwrs2mK1VuE1wP8QicN+8/80pEexahiiQj9+ml3a56dMmiVpsNp45BUU/2kJRXcFOtoLHM7XQOWgYR7BA17K0iAmVeYYUPkBiydzp14m6X0WavVj3AvwMynsqTPjUG66RUSd9nrWe5UuE5pr9EmJYdcS+EeCB2dc=;
X-UUID: 8c90a607311c4e54bf4b644ea7af83dd-20210309
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1579544552; Tue, 09 Mar 2021 22:05:21 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Mar 2021 22:05:20 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 14:05:18 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Mar 2021 14:05:18 +0800
Message-ID: <1615356318.4818.5.camel@mtkswgap22>
Subject: Re: [PATCH v8 3/4] arm64: dts: mediatek: add mt6765 support
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, mtk01761
 <wendell.lin@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>, Sean Wang
 <Sean.Wang@mediatek.com>, Owen Chen <owen.chen@mediatek.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Evan Green <evgreen@chromium.org>, Yong Wu
 <yong.wu@mediatek.com>, Joerg Roedel <jroedel@suse.de>, Shawn Guo
 <shawnguo@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Ryder Lee
 <Ryder.Lee@mediatek.com>, DTML <devicetree@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Date: Wed, 10 Mar 2021 14:05:18 +0800
In-Reply-To: <CAAOTY__kSW0ci9YJjSALOfRqKxxR3ysZUQ3Mxsab77hmCO0TyA@mail.gmail.com>
References: <1582279929-11535-1-git-send-email-macpaul.lin@mediatek.com>
 <1582279929-11535-4-git-send-email-macpaul.lin@mediatek.com>
 <CAAOTY__kSW0ci9YJjSALOfRqKxxR3ysZUQ3Mxsab77hmCO0TyA@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_060551_528879_447F73BB 
X-CRM114-Status: GOOD (  19.89  )
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

T24gV2VkLCAyMDIxLTAzLTEwIGF0IDAwOjA4ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgTWFjcGF1bDoNCj4gDQo+IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRlay5j
b20+IOaWvCAyMDIw5bm0MuaciDIx5pelIOmAseS6lCDkuIvljYg2OjIy5a+r6YGT77yaDQo+ID4N
Cj4gPiBGcm9tOiBNYXJzIENoZW5nIDxtYXJzLmNoZW5nQG1lZGlhdGVrLmNvbT4NCj4gPg0KPiA+
IEFkZCBiYXNpYyBjaGlwIHN1cHBvcnQgZm9yIE1lZGlhdGVrIDY3NjUsIGluY2x1ZGUNCj4gPiB1
YXJ0IG5vZGUgd2l0aCBjb3JyZWN0IHVhcnQgY2xvY2tzLCBwd3JhcCBkZXZpY2UNCj4gPg0KPiA+
IEFkZCBjbG9jayBjb250cm9sbGVyIG5vZGVzLCBpbmNsdWRlIHRvcGNrZ2VuLCBpbmZyYWNmZywN
Cj4gPiBhcG1peGVkc3lzIGFuZCBzdWJzeXN0ZW0uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBN
YXJzIENoZW5nIDxtYXJzLmNoZW5nQG1lZGlhdGVrLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBP
d2VuIENoZW4gPG93ZW4uY2hlbkBtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFj
cGF1bCBMaW4gPG1hY3BhdWwubGluQG1lZGlhdGVrLmNvbT4NCj4gPiBBY2tlZC1ieTogTWFyYyBa
eW5naWVyIDxtYXJjLnp5bmdpZXJAYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9NYWtlZmlsZSAgICAgICB8ICAgIDEgKw0KPiA+ICBhcmNoL2FybTY0
L2Jvb3QvZHRzL21lZGlhdGVrL210Njc2NS1ldmIuZHRzIHwgICAzMyArKysrDQo+ID4gIGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2NzY1LmR0c2kgICAgfCAgMjUzICsrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDI4NyBpbnNlcnRpb25zKCsp
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
Njc2NS1ldmIuZHRzDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210Njc2NS5kdHNpDQoNCltkZWxldGVkXQ0KDQo+ID4gKw0KPiA+ICsgICAgICAg
ICAgICAgICBtbXN5c19jb25maWc6IHN5c2NvbkAxNDAwMDAwMCB7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NjUtbW1zeXMiLCAic3lzY29u
IjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDE0MDAwMDAwIDAgMHgx
MDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
MjI3IElSUV9UWVBFX0xFVkVMX0xPVz47DQo+IA0KPiBJIGRvZXMgbm90IHNlZSBpbnRlcnJ1cHRz
IHByb3BlcnR5IGluIGJpbmRpbmcgZG9jdW1lbnQgWzFdLCBwbGVhc2UgYWRkDQo+IHRoaXMgaW4g
YmluZGluZyBkb2N1bWVudCBmaXJzdC4NCj4gSSdtIGN1cmlvdXMgYWJvdXQgdGhpcyBpbnRlcnJ1
cHQuIEluIHdoaWNoIGNvbmRpdGlvbiB3b3VsZCBpdCBiZSB0cmlnZ2VyZWQ/DQo+IA0KPiBbMV0g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRp
YXRlay9tZWRpYXRlayxtbXN5cy50eHQ/aD12NS4xMi1yYzINCj4gDQo+IFJlZ2FyZHMsDQo+IENo
dW4tS3VhbmcuDQoNClRoYW5rcyBmb3IgcmVtaW5kaW5nLg0KSSdsbCByZW1vdmUgaW50ZXJydXB0
cyBiaW5kaW5nIGluIG5leHQgdmVyc2lvbiBhbmQgbGVhdmUgaXQgZm9yIG1tc3lzDQpkcml2ZXIg
b3duZXIgdG8gdXBkYXRlIHdoZW4gdGhlIGNvbmZpZ3VyYXRpb24gb2YgbW1zeXMgZHJpdmVyIGlz
DQplbmFibGVkLg0KDQpbLi4uXQ0KDQoNCj4gPiArICAgICAgICAgICAgICAgc21pX2NvbW1vbjog
c21pX2NvbW1vbkAxNDAwMjAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDY3NjUtc21pLWNvbW1vbiIsICJzeXNjb24iOw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4MTQwMDIwMDAgMCAweDEwMDA+Ow0KPiA+ICsg
ICAgICAgICAgICAgICB9Ow0KPiA+ICsNCg0KQFlvbmcgV3UNClRoYW5rcyBmb3IgcmV2aWV3aW5n
IGhlcmUsIEknbGwgcmVwbGFjZSBzbWlfY29tbW9uQDE0MDAyMDAwIHRvDQpzbWlAMTQwMDIwMDAN
Cg0KUmVnYXJkcywNCk1hY3BhdWwgTGluDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
