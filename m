Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C94C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=532/itSKRll+K3GYE1PjRP2NifzDm/we24T6bcVksY0=; b=ePHjliSXs++9QnuTwSawOhAYTZ
	dmviIVPTi+8Ra7yCRzGtLjbqhjTFQjgid+yGs9zD2jTH9gtN7P8nHUDsmTx5tMRZdMG3PyKA5LYkE
	TTdSfEWNoIoBgEmRqH4ghRboOMk3ze4Nn/VXyevssP3eWlStdEo7+O603NaaNkn2csueB2Deah3cE
	kLxKHuJ8MvRuIC9FGuC6i5oUxY0FfUGR0SmZ0SCWsrPuY7gzfvyEGfk7m8gjA6BfdZjjHOJC2zu6X
	Z+mUVWNGrTsZT8fI75gB/SbVcicqawpimxod6Y0SHD4WLg4qTuEdWWRo7M5BbkHXpIbiadGNJ0ntk
	ebu/CCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jio-002gSU-E2; Fri, 08 Jul 2022 08:52:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jil-002gRW-MZ; Fri, 08 Jul 2022 08:52:20 +0000
X-UUID: 4794c1ec4d334dc880fbdebb9b54504e-20220708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=532/itSKRll+K3GYE1PjRP2NifzDm/we24T6bcVksY0=;
	b=eR+lyfTP/cfJhyezhu1VOY+dTk9gvDdwD9HSNYhmNIJmllBO4bfW16DP/CS228i6Ogw7FoZ/coUIiW9Ng7HboO44LXiLOxLSSHj/JMuKgtQNf5v4YH9StIevEYgTEcKMWlSXFRmE4Voao9FItXJi3Q9I4VIEzUgYv0jaOE0MIoc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5924ac41-eb58-48d1-a410-c231f14be18a,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:c021c463-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4794c1ec4d334dc880fbdebb9b54504e-20220708
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 555779159; Fri, 08 Jul 2022 01:52:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 16:52:11 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 8 Jul 2022 16:52:10 +0800
Message-ID: <81889c7ba5ce34bb767eaeb98528e11c8ff42388.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mt8173: Fix nor_flash node
From: xiangsheng.hou <xiangsheng.hou@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bin.zhang@mediatek.com>,
	<benliang.zhao@mediatek.com>, <linux-mediatek@lists.infradead.org>
Date: Fri, 8 Jul 2022 16:52:10 +0800
In-Reply-To: <184ce9e3-6031-98ab-cae6-a4aa2015b5c4@gmail.com>
References: <20220630090157.29486-1-xiangsheng.hou@mediatek.com>
	 <20220630090157.29486-2-xiangsheng.hou@mediatek.com>
	 <24bf3c0f-7070-0bcd-2fae-9fe086d146b2@gmail.com>
	 <e4a50d4e165887ac4741c0b8d68470dc2f060655.camel@mediatek.com>
	 <184ce9e3-6031-98ab-cae6-a4aa2015b5c4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_015219_781742_2565919C 
X-CRM114-Status: GOOD (  18.08  )
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

SGkgTWF0dGhpYXMsDQoNCk9uIEZyaSwgMjAyMi0wNy0wOCBhdCAxMDoyMiArMDIwMCwgTWF0dGhp
YXMgQnJ1Z2dlciB3cm90ZToNCj4gDQo+IE9uIDA4LzA3LzIwMjIgMDM6NDAsIHhpYW5nc2hlbmcu
aG91IHdyb3RlOg0KPiA+IEhpIE1hdHRoaWFzLA0KPiA+IA0KPiA+IE9uIFRodSwgMjAyMi0wNy0w
NyBhdCAxNjo0MyArMDIwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToNCj4gPiA+IA0KPiA+ID4g
T24gMzAvMDYvMjAyMiAxMTowMSwgWGlhbmdzaGVuZyBIb3Ugd3JvdGU6DQo+ID4gPiA+IEFkZCBh
eGkgY2xvY2sgc2luY2UgdGhlIGRyaXZlciBjaGFuZ2UgdG8gRE1BIG1vZGUgd2hpY2ggbmVlZA0K
PiA+ID4gPiB0byBlbmFibGUgYXhpIGNsb2NrLiBBbmQgY2hhbmdlIHNwaSBjbG9jayB0byAyNk1I
eiBhcyBkZWZhdWx0Lg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWGlhbmdzaGVu
ZyBIb3UgPHhpYW5nc2hlbmcuaG91QG1lZGlhdGVrLmNvbT4NCj4gPiA+IA0KPiA+ID4gQXBwbGll
ZCwgdGhhbmtzIQ0KPiA+ID4gDQo+ID4gDQo+ID4gSSB3aWxsIHNlbmQgYSBuZXcgcGF0Y2ggdjMg
c2luY2UgdGhlcmUgbmVlZCBhIGNoYW5nZSBpbiBbUEFUQ0ggdjINCj4gPiAyLzJdDQo+ID4gYnkg
cmV2aWV3Lg0KPiA+IA0KPiANCj4gVGhhbmtzIGZyb20gbGV0dGluZyBtZSBrbm93LiBGcm9tIHdo
YXQgSSBjYW4gc2VlLCAxLzIgaW4gdjMgZGlkIG5vdA0KPiBjaGFuZ2UsIHNvIA0KPiBhcyBJIGFs
cmVhZHkgYXBwbGllZCBpdCwgeW91IGNvdWxkIGhhdmUgZHJvcHBlZCBpdCBmcm9tIHRoZSBzZXJp
ZXMuDQo+IA0KPiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcuDQo+IA0KWWVzLCB5b3Ug
YXJlIHJpZ2h0IGFuZCBJIHdpbGwgZHJvcCBpdCBpZiB0aGVyZSB3aWxsIGhhdmUgbmV4dCBzZXJp
ZXMuDQoNClRoYW5rcw0KWGlhbmdzaGVuZyBIb3UNCg==


