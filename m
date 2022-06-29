Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B88C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 01:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYjOugKbNuhpE9r3Uhqr/DqjT4d07O+V4Y5m7GjM64A=; b=AU12ZcRPWHDhHDerN0XW8rXFGQ
	yNhuwc9ZwabaJmuuHuK7O4OubxQARCMz0PUxy0irzgRC8HA5LneHMyHmfIQyP61fYqZU40NatAQPV
	FR8m3z3GGtf2rxMf1i/Wdxnat/cIihV7oY1uOPWvGIvUIcUJ1sX5TKJqBCryWLkakokg+sjMgKeBp
	9qrRDgA1zqvATorNJfTKfibco8IgqXXZ2hYZ9As4r2cu1yOE3gPwQmKizcvgjP7lp9ZWAxhc2lY6W
	8OGQe4T5xJU0gIpG/IpTIBYh/wLEmQek5yr5+tSaHxwtYcRGwzTFyUQKOVRtADJT86sikMRRH+wDb
	QeHErifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Mck-008vxH-Ep; Wed, 29 Jun 2022 01:36:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6McY-008vtz-D4; Wed, 29 Jun 2022 01:36:01 +0000
X-UUID: cdb8f30a8d5649458155e0347af7aa1e-20220628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=MYjOugKbNuhpE9r3Uhqr/DqjT4d07O+V4Y5m7GjM64A=;
	b=luMP2POki/J8+dMZRtXHnQa1zTpDsCqvhdvaI61AkRwJM/zTI+xNxZQY9YcR7kukYx92VeuYexnonz+iY94C/2K4/xYSUvG/iiQRngSD+3U7RXli2z3K8VgTGUENBAOdpA3jXxZUYomPJg97oPlHIvybP0n1I2f76s0yyBJxyUI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:9e028bac-adfa-4332-a7e6-a4e79b02e77f,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:87442a2,CLOUDID:b3bb17d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: cdb8f30a8d5649458155e0347af7aa1e-20220628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1968132351; Tue, 28 Jun 2022 18:35:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 29 Jun 2022 09:35:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jun 2022 09:35:43 +0800
Message-ID: <5da71e875a65c85c30293ec74475b10e9f3d3a1d.camel@mediatek.com>
Subject: Re: [RESEND V9,1/7] dt-bindings: mediatek: Add mediatek,
 mt8195-jpgenc compatible
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih
	<tzungbi@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nicolas.dufresne@collabora.com>, <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
	<srv_heupstream@mediatek.com>
Date: Wed, 29 Jun 2022 09:35:43 +0800
In-Reply-To: <20220628210716.GA963202-robh@kernel.org>
References: <20220614121024.31667-1-irui.wang@mediatek.com>
	 <20220614121024.31667-2-irui.wang@mediatek.com>
	 <20220617231139.GA2610098-robh@kernel.org>
	 <329eb655ddb503e4327cbe3cffef625bb44630b1.camel@mediatek.com>
	 <20220628210716.GA963202-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_183558_494675_3AC78600 
X-CRM114-Status: GOOD (  33.27  )
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

T24gVHVlLCAyMDIyLTA2LTI4IGF0IDE1OjA3IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gTW9uLCBKdW4gMjAsIDIwMjIgYXQgMDI6MDQ6MzhQTSArMDgwMCwga3lyaWUud3Ugd3JvdGU6
DQo+ID4gT24gRnJpLCAyMDIyLTA2LTE3IGF0IDE3OjExIC0wNjAwLCBSb2IgSGVycmluZyB3cm90
ZToNCj4gPiA+IE9uIFR1ZSwgSnVuIDE0LCAyMDIyIGF0IDA4OjEwOjE4UE0gKzA4MDAsIElydWkg
V2FuZyB3cm90ZToNCj4gPiA+ID4gRnJvbToga3lyaWUgd3UgPGt5cmllLnd1QG1lZGlhdGVrLmNv
bT4NCj4gPiA+ID4gDQo+ID4gPiA+IEFkZCBtZWRpYXRlayxtdDgxOTUtanBnZW5jIGNvbXBhdGli
bGUgdG8gYmluZGluZyBkb2N1bWVudC4NCj4gPiA+ID4gDQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IGt5cmllIHd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAg
Li4uL21lZGlhL21lZGlhdGVrLG10ODE5NS1qcGVnZW5jLnlhbWwgICAgICAgIHwgMTUzDQo+ID4g
PiA+ICsrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE1MyBpbnNl
cnRpb25zKCspDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4gPiA+ID4g
anBlZ2VuYy55YW1sDQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiA+IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4g
PiA+ID4ganBlZ2VuYy55YW1sDQo+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4gPiA+ID4ganBlZ2VuYy55YW1sDQo+ID4g
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uYTdm
OWY3MjNkNWRiDQo+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4gPiA+ID4g
anBlZ2VuYy55YW1sDQo+ID4gPiA+IEBAIC0wLDAgKzEsMTUzIEBADQo+ID4gPiA+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gPiA+ICsl
WUFNTCAxLjINCj4gPiA+ID4gKy0tLQ0KPiA+ID4gPiArJGlkOiANCj4gPiA+ID4gDQpodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRpYS9tZWRpYXRlayxtdDgxOTUtanBlZ2VuYy55YW1s
Iw0KPiA+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3RpdGxlOiBNZWRpYVRlayBKUEVHIEVuY29k
ZXIgRGV2aWNlIFRyZWUgQmluZGluZ3MNCj4gPiA+ID4gKw0KPiA+ID4gPiArbWFpbnRhaW5lcnM6
DQo+ID4gPiA+ICsgIC0ga3lyaWUgd3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvcnAtcGFydG5lci5n
b29nbGUuY29tPg0KPiA+ID4gPiArDQo+ID4gPiA+ICtkZXNjcmlwdGlvbjogfC0NCj4gPiA+ID4g
KyAgTWVkaWFUZWsgSlBFRyBFbmNvZGVyIGlzIHRoZSBKUEVHIGVuY29kZSBoYXJkd2FyZSBwcmVz
ZW50IGluDQo+ID4gPiA+IE1lZGlhVGVrIFNvQ3MNCj4gPiA+ID4gKw0KPiA+ID4gPiArcHJvcGVy
dGllczoNCj4gPiA+ID4gKyAgY29tcGF0aWJsZToNCj4gPiA+ID4gKyAgICBpdGVtczoNCj4gPiA+
ID4gKyAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS1qcGdlbmMNCj4gPiA+ID4gKw0KPiA+
ID4gPiArICBtZWRpYXRlayxqcGVnZW5jLW11bHRpLWNvcmU6DQo+ID4gPiA+ICsgICAgdHlwZTog
Ym9vbGVhbg0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gPiA+ICsgICAgICBJbmRp
Y2F0ZXMgd2hldGhlciB0aGUganBlZyBlbmNvZGVyIGhhcyBtdWx0aXBsZSBjb3JlcyBvcg0KPiA+
ID4gPiBub3QuDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgcG93ZXItZG9tYWluczoNCj4gPiA+ID4g
KyAgICBtYXhJdGVtczogMQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIGlvbW11czoNCj4gPiA+ID4g
KyAgICBtYXhJdGVtczogNA0KPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gPiA+ICsg
ICAgICBQb2ludHMgdG8gdGhlIHJlc3BlY3RpdmUgSU9NTVUgYmxvY2sgd2l0aCBtYXN0ZXIgcG9y
dCBhcw0KPiA+ID4gPiBhcmd1bWVudCwgc2VlDQo+ID4gPiA+ICsgICAgICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvbWVkaWF0ZWssaW9tbXUueQ0KPiA+ID4gPiBhbWwN
Cj4gPiA+ID4gZm9yIGRldGFpbHMuDQo+ID4gPiA+ICsgICAgICBQb3J0cyBhcmUgYWNjb3JkaW5n
IHRvIHRoZSBIVy4NCj4gPiA+ID4gKw0KPiA+ID4gPiArICAiI2FkZHJlc3MtY2VsbHMiOg0KPiA+
ID4gPiArICAgIGNvbnN0OiAyDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgIiNzaXplLWNlbGxzIjoN
Cj4gPiA+ID4gKyAgICBjb25zdDogMg0KPiA+ID4gPiArDQo+ID4gPiA+ICsgIHJhbmdlczogdHJ1
ZQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsjIFJlcXVpcmVkIGNoaWxkIG5vZGU6DQo+ID4gPiA+ICtw
YXR0ZXJuUHJvcGVydGllczoNCj4gPiA+ID4gKyAgIl5qcGdlbmNAWzAtOWEtZl0rJCI6DQo+ID4g
PiA+ICsgICAgdHlwZTogb2JqZWN0DQo+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiA+
ID4gKyAgICAgIFRoZSBqcGVnIGVuY29kZXIgaGFyZHdhcmUgZGV2aWNlIG5vZGUgd2hpY2ggc2hv
dWxkIGJlDQo+ID4gPiA+IGFkZGVkDQo+ID4gPiA+IGFzIHN1Ym5vZGVzIHRvDQo+ID4gPiA+ICsg
ICAgICB0aGUgbWFpbiBqcGVnIG5vZGUuDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICBwcm9wZXJ0
aWVzOg0KPiA+ID4gPiArICAgICAgY29tcGF0aWJsZToNCj4gPiA+ID4gKyAgICAgICAgY29uc3Q6
IG1lZGlhdGVrLG10ODE5NS1qcGdlbmMtaHcNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgcmVn
Og0KPiA+ID4gPiArICAgICAgICBtYXhJdGVtczogMQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAg
ICBod19pZDoNCj4gPiA+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IHwNCj4gPiA+ID4gKyAgICAg
ICAgICBDdXJyZW50IGpwZWdlbmMgaHcgaWQuDQo+ID4gPiANCj4gPiA+IFNhbWUgcXVlc3Rpb24g
aGVyZS4gU3VyZWx5LCBJIGFza2VkIHNvbWV0aW1lIGluIHRoZSBsYXN0IDgNCj4gPiA+IHZlcnNp
b25zLA0KPiA+ID4gYnV0IA0KPiA+ID4gbm8gZXhwbGFuYXRpb24gaGVyZSBhbmQgSSdtIG5vdCBn
b2luZyB0byBnbyBsb29rIGZvciBpdC4NCj4gPiANCj4gPiBEZWFyIFJvYiwNCj4gPiBJJ20gc29y
cnkgZm9yIG5vdCBnaXZpbmcgYW4gYWNjdXJhdGUgZXhwbGFuYXRpb24gaW4gdGltZS4NCj4gPiBU
aGUgTVQ4MTk1IGhhcyBvd24gdHdvIGVuY29kaW5nIGhhcmR3YXJlcywgd2UgdXNlIGh3X2lkIHRv
IA0KPiA+IHJlcHJlc2VudCB0aGVtLg0KPiA+IGh3X2lkID0gMCwgZm9yIGhhcmR3YXJlIDAsIGFu
ZCBod19pZCA9IDEsIHJlcGVzZW50cyBhbm90aGVyIG9uZS4NCj4gPiBJIHdpbGwgaW1wcm92ZSB0
aGUgZGVzY3JpcHRpb24gaW4gdGhlIG5leHQgdmVyc2lvbi4NCj4gDQo+IFdoeSBkbyB5b3UgY2Fy
ZSB3aGljaCBvbmUgaXMgd2hpY2g/IA0KPiANCj4gV2UgZ2VuZXJhbGx5IGRvbid0IGRvIGluc3Rh
bmNlIGluZGljZXMgaW4gRFQsIHNvIGZpZ3VyZSBvdXQgaG93IG5vdA0KPiB0byANCj4gbmVlZCB0
aGlzLg0KPiANCj4gUm9iDQpIaSBCb2IsDQoNClRoYW5rcyBmb3IgeW91ciBndWlkYW5jZSwgSSB3
aWxsIGZpeCB0aGlzIGlzc3VlIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCkt5cmllLg0K


