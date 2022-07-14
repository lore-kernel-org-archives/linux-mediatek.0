Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D430C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epthgxtj5NF4smuK4YKb9OND1q8Hs0yT1JSWmqKUuWc=; b=niT7wmt1c8H5R4RHttYYtczDeZ
	VMc2Hc4uHWpIou3RsAIc2J4z3QuDi9hW7UA0LhiR82JARYrneJPqlQUJjLehbtauYEwyRC5hDpmcM
	XCbcNPc3fZXAw+5kHdWaCgKztqMgrUjIwkAa0PzYW8p7slxBZynV3XwO3Gz2hUXxQn8cgaubYJq2e
	Ky558pIeUIt1B0IQSnYtnXmfftV+T9zwnN/5aqqeUAKlTTuKenysW+9U2nNnMrO+/rpF34mIJ9mAE
	DO/aEG6Hfxb68tUJ0+rRUfHIh7kQhDx8E1BbNbHpyIj+65nN8HcMrK/K7UIkSZ7trD8W4EOIMqfHg
	DsF1BjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBuoK-00CdAO-QA; Thu, 14 Jul 2022 09:07:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBuoI-00Cd7D-36; Thu, 14 Jul 2022 09:07:03 +0000
X-UUID: e14c804dac6540c59fca62c03240ce0c-20220714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=epthgxtj5NF4smuK4YKb9OND1q8Hs0yT1JSWmqKUuWc=;
	b=BVQWv6N85+Z3KPpXssgF8wPWjfizX362GHEDP4VWGUnQJ/y6EuCCeKsIoVCcq+QUyjTTbn6gjeGCrqi0t1dWHs5Y9W8PY+hMnFxS5qrw5sbMj5uFcUlODzalXoK0exHRf+qStktIK0/6SD+JnouSNHaXqwP0qJkCaKyayuiXsng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:4dbff324-4e46-4c6f-81ca-07ce55537b56,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:c8894964-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e14c804dac6540c59fca62c03240ce0c-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 410478888; Thu, 14 Jul 2022 02:06:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Jul 2022 16:46:19 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Jul 2022 16:46:12 +0800
Message-ID: <f952e763b8c92decdcf639ddeaad40ffbdc997c8.camel@mediatek.com>
Subject: Re: [V10,0/7] Enable two hardware jpeg encoder for MT8195
From: kyrie.wu <kyrie.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Irui Wang" <irui.wang@mediatek.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Tzung-Bi Shih <tzungbi@chromium.org>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
	<srv_heupstream@mediatek.com>
Date: Thu, 14 Jul 2022 16:46:12 +0800
In-Reply-To: <b12d2df4-73e8-a558-582f-200236bd6560@collabora.com>
References: <20220627025625.8956-1-irui.wang@mediatek.com>
	 <b12d2df4-73e8-a558-582f-200236bd6560@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_020702_176701_C32A4D9D 
X-CRM114-Status: GOOD (  17.53  )
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

T24gVHVlLCAyMDIyLTA3LTA1IGF0IDE0OjU2ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMjcvMDYvMjIgMDQ6NTYsIElydWkgV2FuZyBoYSBzY3JpdHRvOg0K
PiA+IEZyb206IGt5cmllIHd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gVGhp
cyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBtdWx0aSBoYXJkd2FyZSBqcGVnIGVuY29kaW5nLCBi
eSBmaXJzdA0KPiA+IGFkZGluZyB1c2Ugb2ZfcGxhdGZvcm1fcG9wdWxhdGUgdG8gbWFuYWdlIGVh
Y2ggaGFyZHdhcmUNCj4gPiBpbmZvcm1hdGlvbjoNCj4gPiBpbnRlcnJ1cHQsIGNsb2NrLCByZWdp
c3RlciBiYXNlcyBhbmQgcG93ZXIuIFNlY29uZGx5IGFkZCBlbmNvZGluZw0KPiA+IHdvcmsgcXVl
dWUgdG8gZGVhbCB3aXRoIHRoZSBlbmNvZGluZyByZXF1ZXN0c29mIG11bHRpLWhhcmR3YXJlDQo+
ID4gYXQgdGhlIHNhbWUgdGltZS4gTGFzdGx5LCBhZGQgb3V0cHV0IHBpY3R1cmUgcmVvcmRlciBm
dW5jdGlvbg0KPiA+IGludGVyZmFjZSB0byBlbGltaW5hdGUgdGhlIG91dCBvZiBvcmRlciBpbWFn
ZXMuDQo+ID4gDQo+ID4gVGhpcyBzZXJpZXMgaGFzIGJlZW4gdGVzdGVkIHdpdGggTVQ4MTk1IEdz
dHJlYW1lci4NCj4gPiBFbmNvZGluZyB3b3JrZWQgZm9yIHRoaXMgY2hpcC4NCj4gPiANCj4gDQo+
IEhlbGxvIElydWksDQo+IA0KPiBVbmZvcnR1bmF0ZWx5LCBJIGNhbid0IHJlcHJvZHVjZSB5b3Vy
IHN1Y2Nlc3NmdWwgdGVzdCB3aXRoIGdzdHJlYW1lcjoNCj4gd2hlbg0KPiBJIHRyeSB0byBlbmNv
ZGUgYSBqcGVnIHdpdGggdmlkZW90ZXN0c3JjIGlucHV0LCBJIGdldCBhIGtlcm5lbCBwYW5pYy4N
Cj4gDQo+IFRvIHJlcHJvZHVjZSB0aGlzIGJlaGF2aW9yLCBwbGVhc2UgcnVuIHRoZSBmb2xsb3dp
bmc6DQo+IA0KPiBnc3QtbGF1bmNoLTEuMCB2aWRlb3Rlc3RzcmMgISB2NGwyanBlZ2VuYyAhIGZp
bGVzaW5rDQo+IGxvY2F0aW9uPWh3ZW5jdGVzdC5qcGcNCj4gDQo+IA0KPiBIZXJlJ3MgdGhlIHBh
bmljIGxvZzoNCj4gDQo+IFsgIDM0Mi41NjcyMTFdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5V
TEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdA0KPiB2aXJ0dWFsIGFkZHJlc3MgDQo+IDAwMDAwMDAw
MDAwMDAxMDgNCj4gDQo+IFsgIDM0Mi41NzYwMTRdIE1lbSBhYm9ydCBpbmZvOg0KPiANCj4gWyAg
MzQyLjU3ODgwNV0gICBFU1IgPSAweDAwMDAwMDAwOTYwMDAwMDQNCj4gDQo+IFsgIDM0Mi41ODI1
NTJdICAgRUMgPSAweDI1OiBEQUJUIChjdXJyZW50IEVMKSwgSUwgPSAzMiBiaXRzDQo+IA0KPiBb
ICAzNDIuNTg3ODYzXSAgIFNFVCA9IDAsIEZuViA9IDANCj4gDQo+IFsgIDM0Mi41OTA5MTldICAg
RUEgPSAwLCBTMVBUVyA9IDANCj4gDQo+IFsgIDM0Mi41OTQwNjJdICAgRlNDID0gMHgwNDogbGV2
ZWwgMCB0cmFuc2xhdGlvbiBmYXVsdA0KPiANCj4gWyAgMzQyLjU5ODk0MV0gRGF0YSBhYm9ydCBp
bmZvOg0KPiANCj4gWyAgMzQyLjYwMTgyNl0gICBJU1YgPSAwLCBJU1MgPSAweDAwMDAwMDA0DQo+
IA0KPiBbICAzNDIuNjA1NjY4XSAgIENNID0gMCwgV25SID0gMA0KPiANCj4gWyAgMzQyLjYwODY0
M10gdXNlciBwZ3RhYmxlOiA0ayBwYWdlcywgNDgtYml0IFZBcywNCj4gcGdkcD0wMDAwMDAwMTE5
MDI5MDAwDQo+IA0KPiBbICAzNDIuNjE1MDk0XSBbMDAwMDAwMDAwMDAwMDEwOF0gcGdkPTAwMDAw
MDAwMDAwMDAwMDAsDQo+IHA0ZD0wMDAwMDAwMDAwMDAwMDAwDQo+IA0KPiBbICAzNDIuNjIxOTA3
XSBJbnRlcm5hbCBlcnJvcjogT29wczogOTYwMDAwMDQgWyMxXSBTTVANCj4gDQo+IFsgIDM0Mi42
MjY4MDBdIE1vZHVsZXMgbGlua2VkIGluOiBjZGNfZXRoZXIgdXNibmV0IHI4MTUyIGFmX2FsZyBx
cnRyDQo+IG10NzkyMWUgDQo+IG10NzkyMV9jb21tb24gbXQ3Nl9jb25uYWNfbGliIG10NzYgbWFj
ODAyMTEgYnR1c2IgYnRydGwgYnRpbnRlbCBidG10aw0KPiBidGJjbSANCj4gYmx1ZXRvb3RoIGNm
ZzgwMjExIG10a192Y29kZWNfZGVjX2h3IHV2Y3ZpZGVvIHNuZF9zb2ZfbXQ4MTk1DQo+IGVjZGhf
Z2VuZXJpYyANCj4gbXRrX3Zjb2RlY19kZWMgZWNjIG10a19hZHNwX2NvbW1vbiB2aWRlb2J1ZjJf
dm1hbGxvYw0KPiBzbmRfc29mX3h0ZW5zYV9kc3AgcmZraWxsIA0KPiBzbmRfc29mX29mIHY0bDJf
dnA5IHBhbmZyb3N0IG10a19qcGVnIHNuZF9zb2YgdjRsMl9oMjY0DQo+IG10a19qcGVnX2VuY19o
dyA4MDIxcSANCj4gbXRrX3Zjb2RlY19jb21tb24gY3Jvc19lY19zZW5zb3JzIGdwdV9zY2hlZCBj
cm9zX2VjX2xpZF9hbmdsZQ0KPiBtdGtfanBlZ19kZWNfaHcgDQo+IGhpZF9tdWx0aXRvdWNoIHNu
ZF9zb2ZfdXRpbHMgY3Jvc19lY19zZW5zb3JzX2NvcmUgY3JjdDEwZGlmX2NlIGdhcnAgDQo+IGNy
b3NfdXNicGRfbG9nZ2VyIHNic19iYXR0ZXJ5IG1ycCBzdHAgbGxjIGlwbWlfZGV2aW50Zg0KPiBp
cG1pX21zZ2hhbmRsZXIgZnVzZSBpcHY2DQo+IA0KPiBbICAzNDIuNjgwMzMyXSBDUFU6IDMgUElE
OiAxODAgQ29tbToga3dvcmtlci91MTY6NiBUYWludGVkOg0KPiBHICAgICAgICBXIA0KPiA1LjE5
LjAtcmMzLW5leHQtMjAyMjA2MjIrICM4MTQNCj4gDQo+IFsgIDM0Mi42ODk5ODJdIEhhcmR3YXJl
IG5hbWU6IE1lZGlhVGVrIFRvbWF0byAocmV2MikgYm9hcmQgKERUKQ0KPiANCj4gWyAgMzQyLjY5
NTYzN10gV29ya3F1ZXVlOiBtdGstanBlZyBtdGtfanBlZ2VuY193b3JrZXIgW210a19qcGVnXQ0K
PiANCj4gWyAgMzQyLjcwMTQwMl0gcHN0YXRlOiA2MDQwMDBjOSAoblpDdiBkYUlGICtQQU4gLVVB
TyAtVENPIC1ESVQgLVNTQlMNCj4gQlRZUEU9LS0pDQo+IA0KPiBbICAzNDIuNzA4MzYwXSBwYyA6
IG10a19qcGVnZW5jX3dvcmtlcisweDZjLzB4M2UwIFttdGtfanBlZ10NCj4gDQo+IFsgIDM0Mi43
MTM3NjNdIGxyIDogbXRrX2pwZWdlbmNfd29ya2VyKzB4NjQvMHgzZTAgW210a19qcGVnXQ0KPiAN
Cj4gWyAgMzQyLjcxOTE2Nl0gc3AgOiBmZmZmODAwMDA5M2NiY2QwDQo+IA0KPiBbICAzNDIuNzIy
NDc4XSB4Mjk6IGZmZmY4MDAwMDkzY2JjZDAgeDI4OiBmZmZmYjFmMzQxY2RiMDAwIHgyNzoNCj4g
ZmZmZjYwODk4ODVkMDUwNQ0KPiANCj4gWyAgMzQyLjcyOTYxOF0geDI2OiBmZmZmYjFmMzQxY2Ux
ZWUwIHgyNTogZmZmZmIxZjM0MWQwYTJkMCB4MjQ6DQo+IGZmZmY2MDg5OTA3OGQwMDANCj4gDQo+
IFsgIDM0Mi43MzY3NThdIHgyMzogZmZmZmIxZjJlODY5YzU5MCB4MjI6IGZmZmY2MDg5OTA3ODU0
NTggeDIxOg0KPiBmZmZmNjA4OThhMGVhMTIwDQo+IA0KPiBbICAzNDIuNzQzODk4XSB4MjA6IGZm
ZmY2MDg5OGEwZWEwODAgeDE5OiBmZmZmNjA4OThhMGVhMDgwIHgxODoNCj4gMDAwMDAwMDAwMDAw
MDAwMA0KPiANCj4gWyAgMzQyLjc1MTAzOF0geDE3OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjogZmZm
ZmIxZjM0MDVhNThjMCB4MTU6DQo+IDAwMDBhYWFhYzA5MmEzZDANCj4gDQo+IFsgIDM0Mi43NTgx
NzhdIHgxNDogMDAwMDAwMDAwMDAwMDAwMCB4MTM6IDAwMDAwMDAwMDAwMDBjNWYgeDEyOg0KPiAw
NzFjNzFjNzFjNzFjNzFjDQo+IA0KPiBbICAzNDIuNzY1MzE4XSB4MTE6IDAwMDAwMDAwMDAwMDBj
NWYgeDEwOiAwMDAwMDAwMDAwMDAyN2EwIHg5IDoNCj4gZmZmZmIxZjMzZjMyY2U5Yw0KPiANCj4g
WyAgMzQyLjc3MjQ1OF0geDggOiBmZWZlZmVmZWZlZmVmZWZmIHg3IDogMDAwMDAwMDAwMDAwMDAx
OCB4NiA6DQo+IGZmZmZiMWYyZTg2OTk4MDQNCj4gDQo+IFsgIDM0Mi43Nzk1OTddIHg1IDogMDAw
MDAwMDAwMDAwMDAwMCB4NCA6IDAwMDAwMDAwMDAwMDAwMDEgeDMgOg0KPiBmZmZmNjA4OTg1ZDNj
NTcwDQo+IA0KPiBbICAzNDIuNzg2NzM3XSB4MiA6IDAwMDAwMDAwMDAwMDAwMDAgeDEgOiAwMDAw
MDAwMDAwMDAwMDAwIHgwIDoNCj4gMDAwMDAwMDAwMDAwMDAwMA0KPiANCj4gWyAgMzQyLjc5Mzg3
Nl0gQ2FsbCB0cmFjZToNCj4gDQo+IFsgIDM0Mi43OTYzMTldICBtdGtfanBlZ2VuY193b3JrZXIr
MHg2Yy8weDNlMCBbbXRrX2pwZWddDQo+IA0KPiBbICAzNDIuODAxMzc2XSAgcHJvY2Vzc19vbmVf
d29yaysweDI5NC8weDY2NA0KPiANCj4gWyAgMzQyLjgwNTM5Ml0gIHdvcmtlcl90aHJlYWQrMHg3
Yy8weDQ1Yw0KPiANCj4gWyAgMzQyLjgwOTA1NV0gIGt0aHJlYWQrMHgxMDQvMHgxMTANCj4gDQo+
IFsgIDM0Mi44MTIyODNdICByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMA0KPiANCj4gWyAgMzQyLjgx
NTg2M10gQ29kZTogYWExNTAzZTAgOTQwMDAzN2UgZjk0MTU2NjIgYWEwMDAzZTEgKGI5NDEwODQw
KQ0KPiANCj4gWyAgMzQyLjgyMTk1Nl0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBd
LS0tDQo+IA0KPiANCj4gUmVnYXJkcywNCj4gQW5nZWxvDQpIaSBBbmdlbG8sDQpUaGlzIGlzc3Vl
IGlzIGZpeGVkLCBhbmQgSSB3aWxsIHN1cHBseSBhIG5ldyB2ZXJzaW9uLg0KVGhhbmtzLg0KDQpS
ZWdhcmRzLg0K


