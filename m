Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3F8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 06:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjTSXmUFgfsnkKeAQNPjxCPa4HOvDfIJrYKnoM5J3R0=; b=Hkh8F4iowVV3r3U0yqWBGFlgBM
	Xi/G5fdNZHIEsdcgt/grso/ssggp0pS5ysRd9/xTeF8oazIn9o7pE90UQtY00MaHq83Lb5o67msRo
	wP7BrR59RPP+WrLBNK3EsAx3EoWCGSlK3CbkQQJq7ABHEVQksQeYrTi1lwbPcmhZEw3oQHhxBcb58
	d9xGENlQWlEjOLwNan0TFSSw4f6JMJk0mf9tz/3wWlLCJ7EB2IViXczCGO0czzLTZ98WlmxouhNyR
	wSpobHtPO7syp38HPOsF9sfaRm/zA2Nm25u6SyQozMDheQxaxBDPv/p8gPyrmugrzdXtZk4jYgzRU
	+d66arDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1j28-000jqT-HQ; Thu, 16 Jun 2022 06:31:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1j25-000jp0-Vl; Thu, 16 Jun 2022 06:31:11 +0000
X-UUID: 5239d28e27584754a195b49fd2e589b6-20220615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=mjTSXmUFgfsnkKeAQNPjxCPa4HOvDfIJrYKnoM5J3R0=;
	b=k3vn2dLvH4sHnjUQ/8uAj1PQ/AcQftvtrZdNwMJvFlnJm+eUJfh6GP3pTGViDJDXcdE1g4F5dhwzV/6mqA/3Qael7P+SrVYCHdsAiT1RhbGKpBD6PT5OxUMirAOce0X0pBpqcNKbrzmom+Hqx0qyAbWkY4Vmodt3bVPeGGDEkkw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:42c303a9-50fb-43d0-89fa-4ee439d4cf2c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:2c7e71f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5239d28e27584754a195b49fd2e589b6-20220615
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 191945800; Wed, 15 Jun 2022 23:31:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jun 2022 23:31:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 16 Jun 2022 14:31:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 16 Jun 2022 14:31:00 +0800
Message-ID: <2d0f49294a8bac34dd5dd1ce4201f009a207b7a7.camel@mediatek.com>
Subject: Re: [PATCH v3 6/6] iommu: mtk_iommu: Lookup phandle to retrieve
 syscon to pericfg
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <joro@8bytes.org>, <will@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzysztof.kozlowski@linaro.org>
Date: Thu, 16 Jun 2022 14:30:57 +0800
In-Reply-To: <80c7fa61-e25a-fc45-bdcb-60ac3796b96e@collabora.com>
References: <20220609100802.54513-1-angelogioacchino.delregno@collabora.com>
	 <20220609100802.54513-7-angelogioacchino.delregno@collabora.com>
	 <db422fe4d0b5391ee2aacae989d7e48209e1095f.camel@mediatek.com>
	 <80c7fa61-e25a-fc45-bdcb-60ac3796b96e@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_233110_058318_16698883 
X-CRM114-Status: GOOD (  21.79  )
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

T24gTW9uLCAyMDIyLTA2LTEzIGF0IDEwOjEzICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTMvMDYvMjIgMDc6MzIsIFlvbmcgV3UgaGEgc2NyaXR0bzoNCj4g
PiBPbiBUaHUsIDIwMjItMDYtMDkgYXQgMTI6MDggKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVs
IFJlZ25vDQo+ID4gd3JvdGU6DQo+ID4gPiBPbiBzb21lIFNvQ3MgKG9mIHdoaWNoIG9ubHkgTVQ4
MTk1IGlzIHN1cHBvcnRlZCBhdCB0aGUgdGltZSBvZg0KPiA+ID4gd3JpdGluZyksDQo+ID4gPiB0
aGUgIlIiIGFuZCAiVyIgKEkvTykgZW5hYmxlIGJpdHMgZm9yIHRoZSBJT01NVXMgYXJlIGluIHRo
ZQ0KPiA+ID4gcGVyaWNmZ19hbw0KPiA+ID4gcmVnaXN0ZXIgc3BhY2UgYW5kIG5vdCBpbiB0aGUg
SU9NTVUgc3BhY2U6IGFzIGl0IGhhcHBlbmVkIGFscmVhZHkNCj4gPiA+IHdpdGgNCj4gPiA+IGlu
ZnJhY2ZnLCBpdCBpcyBleHBlY3RlZCB0aGF0IHRoaXMgbGlzdCB3aWxsIGdyb3cuDQo+ID4gDQo+
ID4gQ3VycmVudGx5IEkgZG9uJ3Qgc2VlIHRoZSBsaXN0IHdpbGwgZ3Jvdy4gQXMgY29tbWVudGVk
IGJlZm9yZSwgSW4NCj4gPiB0aGUNCj4gPiBsYXN0ZXN0IFNvQywgVGhlIElPTU1VIGVuYWJsZSBi
aXRzIGZvciBJT01NVSB3aWxsIGJlIGluIEFURiwgcmF0aGVyDQo+ID4gdGhhbiBpbiB0aGlzIHBl
cmljZmcgcmVnaXN0ZXIgcmVnaW9uLiBJbiB0aGlzIGNhc2UsIElzIHRoaXMgcGF0Y2gNCj4gPiB1
bm5lY2Vzc2FyeT8gb3Igd2UgY291bGQgYWRkIHRoaXMgcGF0Y2ggd2hlbiB0aGVyZSBhcmUgMiBT
b0NzIHVzZQ0KPiA+IHRoaXMNCj4gPiBzZXR0aW5nIGF0IGxlYXN0PyAgd2hhdCdzIHlvdXIgb3Bp
bmlvbj8NCj4gPiANCj4gDQo+IFBlcmhhcHMgSSd2ZSBtaXN1bmRlcnN0b29kLi4uIGJlc2lkZXMs
IGNhbiB5b3UgcGxlYXNlIGNoZWNrIGlmDQo+IHRoZXJlJ3MgYW55DQo+IG90aGVyIFNvQyAobm90
IGp1c3QgY2hyb21lYm9va3MsIGFsc28gc21hcnRwaG9uZSBTb0NzKSB0aGF0IG5lZWQgdGhpcw0K
PiBsb2dpYz8NCg0KQXMgZmFyIGFzIEkga25vdywgU21hcnRQaG9uZSBTb0NzIGRvbid0IGVuYWJs
ZSB0aGUgaW5mcmEgaW9tbXUgdW50aWwNCm5vdy4gdGhleSBkb24ndCBoYXZlIHRoaXMgbG9naWMu
IEkgZG9uJ3Qgb2JqZWN0IHRoaXMgcGF0Y2gsIEkgdGhpbmsgd2UNCmNvdWxkIGFkZCBpdCB3aGVu
IGF0IGxlYXN0IDIgU29DcyBuZWVkIHRoaXMuDQoNClRoYW5rcyB2ZXJ5IG11Y2ggZm9yIGhlbHAg
aW1wcm92aW5nIGhlcmUuDQoNCj4gDQo+IFRoYW5rcywNCj4gQW5nZWxvDQo+IA0KPiANCg==


