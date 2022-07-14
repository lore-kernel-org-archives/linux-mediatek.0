Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D18CCA47B
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 05:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RtrmG3r6mOkAJ8iPp+cLCjwMXlsBkmXwMCbDwPOeqE=; b=r3QC4zPpggCE6n4frkvwHVNEnp
	jn4GJlm2JH415eTKcB2IoaLLLNudYkUhkXzqsD/tBWGyyRk6K2cxOwJn0OI0M3jdRcs7M5upbdcoY
	EQGPBbif3684p3YWVPMYeEBsIn2bGIA4SzfPCXL+TmNwW2T3NIGaNBkBL7khXlK+uZI+kJ2tV9eCn
	g2eUEGYa15F5jxdMcWEaAQUF8HNNsFmranPEhDs1FvuLJM/XnP0YmMvCg6UK4o5SnV88cCcRYgtvy
	HINDw1QWGv29MSF909pNDE1PwtBTE+LQz6RXVKgcV5ki/UY5GNUXHydTh9JUEqBSuM5DIs3D2fbh7
	ch6UzNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBrYc-00B8Eu-RM; Thu, 14 Jul 2022 05:38:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBrYQ-00B89l-AH; Thu, 14 Jul 2022 05:38:29 +0000
X-UUID: 68a9796ea3a64fabbbcaa6ccf132fb87-20220713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=+RtrmG3r6mOkAJ8iPp+cLCjwMXlsBkmXwMCbDwPOeqE=;
	b=F8zy9XNg7p8cC6+uR2KV7ywIewx88NmoWLu6WkGe5loxqyVkoWwfX3YKOyO3e4Wj9j0f3l00t9Eh97RU9bRjL8LAArUs0RsuQRguIOzWXsRyIWz4FrO05gc0KiZjj4y6SHgysjd5lGQlF9g4blX2pCRzWCEM3X2SlSA2lQlMypw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5c8e74ca-84bf-45df-aa89-966b7dac44e2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:e8dcf232-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 68a9796ea3a64fabbbcaa6ccf132fb87-20220713
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 614104888; Wed, 13 Jul 2022 22:38:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 14 Jul 2022 13:37:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 14 Jul 2022 13:37:31 +0800
Message-ID: <9a7fd7770b013c95983e700d2f1e132fbf5429a6.camel@mediatek.com>
Subject: Re: [PATCH net v4 3/3] net: stmmac: fix unbalanced ptp clock issue
 in suspend/resume flow
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: David Miller <davem@davemloft.net>, Matthias Brugger
	<matthias.bgg@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <macpaul.lin@mediatek.com>, "Jisheng
 Zhang" <jszhang@kernel.org>, Mohammad Athari Bin Ismail
	<mohammad.athari.ismail@intel.com>
Date: Thu, 14 Jul 2022 13:37:31 +0800
In-Reply-To: <20220713203910.74d36732@kernel.org>
References: <20220713101002.10970-1-biao.huang@mediatek.com>
	 <20220713101002.10970-4-biao.huang@mediatek.com>
	 <20220713203910.74d36732@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_223826_386583_34BB8FBD 
X-CRM114-Status: GOOD (  11.45  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RGVhciBKYWt1YiwNCglUaGFua3MgZm9yIHlvdXIgY29tbWVudHN+DQoNCk9uIFdlZCwgMjAyMi0w
Ny0xMyBhdCAyMDozOSAtMDcwMCwgSmFrdWIgS2ljaW5za2kgd3JvdGU6DQo+IE9uIFdlZCwgMTMg
SnVsIDIwMjIgMTg6MTA6MDIgKzA4MDAgQmlhbyBIdWFuZyB3cm90ZToNCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYw0KPiA+
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYw0KPiA+
IGluZGV4IDE5N2ZhYzU4N2FkNS4uYzIzMGI4YjlhYWIxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMNCj4gPiArKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jDQo+ID4gQEAg
LTgzOSwxNCArODM5LDYgQEAgaW50IHN0bW1hY19pbml0X3RzdGFtcF9jb3VudGVyKHN0cnVjdA0K
PiA+IHN0bW1hY19wcml2ICpwcml2LCB1MzIgc3lzdGltZV9mbGFncykNCj4gPiAgCWlmICghKHBy
aXYtPmRtYV9jYXAudGltZV9zdGFtcCB8fCBwcml2LT5kbWFfY2FwLmF0aW1lX3N0YW1wKSkNCj4g
PiAgCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4gIA0KPiA+IC0JcmV0ID0gY2xrX3ByZXBhcmVf
ZW5hYmxlKHByaXYtPnBsYXQtPmNsa19wdHBfcmVmKTsNCj4gPiAtCWlmIChyZXQgPCAwKSB7DQo+
ID4gLQkJbmV0ZGV2X3dhcm4ocHJpdi0+ZGV2LA0KPiA+IC0JCQkgICAgImZhaWxlZCB0byBlbmFi
bGUgUFRQIHJlZmVyZW5jZSBjbG9jazoNCj4gPiAlcGVcbiIsDQo+ID4gLQkJCSAgICBFUlJfUFRS
KHJldCkpOw0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+ICAJc3RtbWFj
X2NvbmZpZ19od190c3RhbXBpbmcocHJpdiwgcHJpdi0+cHRwYWRkciwgc3lzdGltZV9mbGFncyk7
DQo+ID4gIAlwcml2LT5zeXN0aW1lX2ZsYWdzID0gc3lzdGltZV9mbGFnczsNCj4gPiAgDQo+IA0K
PiANCj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYzo4
Mzc6Njogd2FybmluZzoNCj4gdW51c2VkIHZhcmlhYmxlICdyZXQnIFstV3VudXNlZC12YXJpYWJs
ZV0NCj4gICAgICAgICBpbnQgcmV0Ow0KPiAgICAgICAgICAgICBeDQpPSywgSSdsbCBmaXggaXQg
aW4gbmV4dCBzZW5kLg0KDQpCZXN0IFJlZ2FyZHMhDQpCaWFvDQo=


