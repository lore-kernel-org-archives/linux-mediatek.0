Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69273C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 01:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdT5C1SanwI/OgQzNOZ8ROJuAMLL82bNy+VgTTYzTUE=; b=WGV0EKlplVyl2ozlPjgB/SBM7w
	Kv/3ZAN+aCSQClgVSa6YBCyjmFVB5ev3X4nslCWG4Hb/nF0QKt3ughPRMZV7/H/gJNP6poQUaYagM
	KOA80trgvaL8G2xeY9gXVpJagYgflFI5f2JqCP47Zl6EV0NOfgiRTVFn7GXhpsG6hEnU9/FI6dqOk
	ylWEx9p6kWYMr5uvMeLlzmTsXZDkE3cEk0BxTVIRwRVSfk6pY3fLmfQYnDC7It0SzGu8FEkSz1ej4
	IxrxiJzQ+1/bioKikMY3tL2Uc2XYs6SZI1HG/qrRxaOUgPYsuGhxrxo6TXy7JGwWDC05xxe4qvaD8
	FPceHsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9d0V-000zWP-Jv; Fri, 08 Jul 2022 01:42:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9czf-000zEy-7B; Fri, 08 Jul 2022 01:41:20 +0000
X-UUID: 417871fddd6c456ab114bd15a43d94e6-20220707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=GdT5C1SanwI/OgQzNOZ8ROJuAMLL82bNy+VgTTYzTUE=;
	b=AjDMXD9M8Oqmhu5pNfBzSbXXzRxewlXR6voEhYrywESleY7rkh0dDyxascU+N/NKRRYODLb9pEdCvaHz22ijZFXZ1T+4nlHN2uZoeIc9QVvPb84l9++wK0L0niynHKtJY3DySAPyUKijGBOpbBY94dTiTuzlPQiLTQuOELV6PdI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:cb65f6d5-1866-47b0-8cdf-a8905a1946e3,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:88f0da86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 417871fddd6c456ab114bd15a43d94e6-20220707
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 487470174; Thu, 07 Jul 2022 18:41:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Jul 2022 09:40:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 09:40:35 +0800
Message-ID: <e4a50d4e165887ac4741c0b8d68470dc2f060655.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mt8173: Fix nor_flash node
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bin.zhang@mediatek.com>,
	<benliang.zhao@mediatek.com>, <linux-mediatek@lists.infradead.org>
Date: Fri, 8 Jul 2022 09:40:34 +0800
In-Reply-To: <24bf3c0f-7070-0bcd-2fae-9fe086d146b2@gmail.com>
References: <20220630090157.29486-1-xiangsheng.hou@mediatek.com>
	 <20220630090157.29486-2-xiangsheng.hou@mediatek.com>
	 <24bf3c0f-7070-0bcd-2fae-9fe086d146b2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_184119_464811_D851B52F 
X-CRM114-Status: GOOD (  10.55  )
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

SGkgTWF0dGhpYXMsDQoNCk9uIFRodSwgMjAyMi0wNy0wNyBhdCAxNjo0MyArMDIwMCwgTWF0dGhp
YXMgQnJ1Z2dlciB3cm90ZToNCj4gDQo+IE9uIDMwLzA2LzIwMjIgMTE6MDEsIFhpYW5nc2hlbmcg
SG91IHdyb3RlOg0KPiA+IEFkZCBheGkgY2xvY2sgc2luY2UgdGhlIGRyaXZlciBjaGFuZ2UgdG8g
RE1BIG1vZGUgd2hpY2ggbmVlZA0KPiA+IHRvIGVuYWJsZSBheGkgY2xvY2suIEFuZCBjaGFuZ2Ug
c3BpIGNsb2NrIHRvIDI2TUh6IGFzIGRlZmF1bHQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
WGlhbmdzaGVuZyBIb3UgPHhpYW5nc2hlbmcuaG91QG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFwcGxp
ZWQsIHRoYW5rcyENCj4gDQpJIHdpbGwgc2VuZCBhIG5ldyBwYXRjaCB2MyBzaW5jZSB0aGVyZSBu
ZWVkIGEgY2hhbmdlIGluIFtQQVRDSCB2MiAyLzJdDQpieSByZXZpZXcuDQoNClRoYW5rcw0KWGlh
bmdzaGVuZyBIb3UNCg0KDQo=


