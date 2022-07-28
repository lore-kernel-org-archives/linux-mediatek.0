Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BE5C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 06:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlPaZHIItHPpmY4SMADYEVzgMujRlcF0veqhCqcg9wE=; b=G1mFk4gubIAqCI
	bCHdBgziQiLtcwDGqWxMNFA/a/xx3ciwwzAr70GyVN3nvkUeAjznXxCgt8wNQBToLWDGDEahrS2QS
	RkAhPoSAAXDD42qGngasgqldjmf7cLGyWysGhkD1BLhxRRKHFIyVz2pSEh5daxYoXDNyM3WoQc1XA
	tv0bD9XZ1j/sZUF1L3LL86zGjUCppS0wZLebqvfgM+sDsBhjt9E64sdZWcEPsAXHs0AjKYWJhu+vw
	6Es2MJ8oKmW3i2wCqGq06TAGVddZ1knj0etsc/TOhBKAG2ctv9ZFhDiXw+tZeRBQlpBzRllrJtywR
	zWWPoo+NKgnmBslyYxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxOQ-005DmN-CP; Thu, 28 Jul 2022 06:53:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGxON-005Dka-Bd; Thu, 28 Jul 2022 06:53:08 +0000
X-UUID: 7db6a74b491e4905a500a7c3b3cb8fd5-20220727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=AlPaZHIItHPpmY4SMADYEVzgMujRlcF0veqhCqcg9wE=;
	b=odyeTxWlAKGG0q/f0033k3+hzbbjdY78pbWZUxW4ZimhNqrJXPLxJQp09wdRe6BZ/NZ7myit6sL/q8mdPhpx/ZYHUbN26HEBAUBWRpS+pABpVuSQTHwfAE0y9YO+ZXdj1CKzzeET31zvlwwnuhYmHk+oLeoCYEw11lWV9q/oTdo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:d27c8431-0e10-4529-b0a8-aa58d65717c4,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:31178ed0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7db6a74b491e4905a500a7c3b3cb8fd5-20220727
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 975903739; Wed, 27 Jul 2022 23:53:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 28 Jul 2022 14:02:27 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 14:02:25 +0800
Message-ID: <b4468be380019ee53e00cb8df3942c195ce5ab2e.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: pmic: mt6366: add binding document
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 28 Jul 2022 14:02:25 +0800
In-Reply-To: <YnpNb258/JRSjZFQ@sirena.org.uk>
References: <20220510064603.15920-1-zhiyong.tao@mediatek.com>
	 <20220510064603.15920-2-zhiyong.tao@mediatek.com>
	 <YnpNb258/JRSjZFQ@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_235307_424225_32B84228 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, tinghan.shen@mediatek.com, wen.su@mediatek.com, srv_heupstream@mediatek.com, hui.liu@mediatek.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, eddie.huang@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIyLTA1LTEwIGF0IDEyOjMzICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBUdWUsIE1heSAxMCwgMjAyMiBhdCAwMjo0NjowM1BNICswODAwLCBaaGl5b25nIFRhbyB3cm90
ZToNCj4gPiBGcm9tOiAiWmhpeW9uZy5UYW8iIDx6aGl5b25nLnRhb0BtZWRpYXRlay5jb20+DQo+
ID4gDQo+ID4gVGhlIGNvbW1pdCBhZGRzIG10NjM2NiBiaW5kaW5nIGRvY3VtZW50Lg0KPiANCj4g
UGxlYXNlIHN1Ym1pdCBwYXRjaGVzIHVzaW5nIHN1YmplY3QgbGluZXMgcmVmbGVjdGluZyB0aGUg
c3R5bGUgZm9yDQo+IHRoZQ0KPiBzdWJzeXN0ZW0sIHRoaXMgbWFrZXMgaXQgZWFzaWVyIGZvciBw
ZW9wbGUgdG8gaWRlbnRpZnkgcmVsZXZhbnQNCj4gcGF0Y2hlcy4NCj4gTG9vayBhdCB3aGF0IGV4
aXN0aW5nIGNvbW1pdHMgaW4gdGhlIGFyZWEgeW91J3JlIGNoYW5naW5nIGFyZSBkb2luZw0KPiBh
bmQNCj4gbWFrZSBzdXJlIHlvdXIgc3ViamVjdCBsaW5lcyB2aXN1YWxseSByZXNlbWJsZSB3aGF0
IHRoZXkncmUgZG9pbmcuDQoNCj09PiBIaSBNYXJrLA0Kd2Ugd2lsbCBmaXggaXQgaW4gdjINClRo
YW5rcw0K


