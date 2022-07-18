Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E92C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 12:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CXD+MKa/THuOcEHTbgRjAT/wlPG/2KQah8tBnn2Eeg=; b=y6af/LtEni12q8BFm9hZnBf791
	AMbEetiQm+FZohLKsvJBXutH84M4dokLXNfE5Gq+hD8AIHnemaOXMsY/5M4hWgvOuEQh7o3LbKvT2
	Zvu5TZdDQMQAIe/TaBetEzu450OIwfyS1ljiupFfgvCnngD8e3kWg5gv8J816AiZyWWQlgcyXlPff
	z8tFEICfBfgCkpGOXB6mrzRMsTr+XFZmdRyywah2N0eVlL+fq9i/dputoMhfWFaEBcCXDGo0rMgUw
	mRgJrhHPuxwC9rVZ7krTOplPPIBRAjqVa2hswWyaVraIcLJcTTrwE7gyJ6PQasD64UzDOSUVC5lc+
	hcX26lYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPxo-00DL4w-T3; Mon, 18 Jul 2022 12:35:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPxl-00DL2Y-SE; Mon, 18 Jul 2022 12:35:03 +0000
X-UUID: 19526dafd23f4345b3e237e8432c458c-20220718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=8CXD+MKa/THuOcEHTbgRjAT/wlPG/2KQah8tBnn2Eeg=;
	b=iObQvGyzuWjXG4oTXMaopTq8jrAFSk9Wguy1w+w/pRqBnVm3fQRD60mto1hFaHmxTkteeJhwtsCqFqVJB0lwUtp0p5A1ffwqM2bvape/TCij/QKV0AjygxZZmyCiOi/NViS/Ab6diUe0oCJnr8PUiC1zYlvb7OJ9V1GlnzfCmHg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:7d424239-0bfe-498f-a8ed-3a60aa661e3d,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:1d81cbd7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 19526dafd23f4345b3e237e8432c458c-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2114334560; Mon, 18 Jul 2022 05:34:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 18 Jul 2022 19:34:17 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 18 Jul 2022 19:34:16 +0800
Message-ID: <bb7877319b395e764653f14297c130f114799c7e.camel@mediatek.com>
Subject: Re: [PATCH 3/5] media: mediatek: vcodec: Add mt8188 encoder driver
From: Irui Wang <irui.wang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Hans Verkuil" <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin
	<tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
CC: Yong Wu <yong.wu@mediatek.com>, Maoguang Meng
	<maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 18 Jul 2022 19:34:16 +0800
In-Reply-To: <98b0edfa-9669-3adb-894d-5d6fce9e2f8f@collabora.com>
References: <20220716093808.29894-1-irui.wang@mediatek.com>
	 <20220716093808.29894-4-irui.wang@mediatek.com>
	 <98b0edfa-9669-3adb-894d-5d6fce9e2f8f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_053501_954708_C7390A9C 
X-CRM114-Status: GOOD (  19.61  )
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

RGVhciBBbmdlbG8sDQpPbiBNb24sIDIwMjItMDctMTggYXQgMTE6NTMgKzAyMDAsIEFuZ2Vsb0dp
b2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJbCAxNi8wNy8yMiAxMTozOCwgSXJ1aSBXYW5n
IGhhIHNjcml0dG86DQo+ID4gQWRkIG10ODE4OCdzIGNvbXBhdGlibGUgIm1lZGlhdGVrLG10ODE4
OC12Y29kZWMtZW5jIi4NCj4gPiBBZGQgbXQ4MTg4J3MgZGV2aWNlIHByaXZhdGUgZGF0YSAibXQ4
MTg4X3BkYXRhIi4NCj4gPiBSZW1vdmUgcGxhdGZvcm1fZ2V0X3Jlc291cmNlIEFQSSB0byBnZXQg
SVJRIHJlc291cmUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSXJ1aSBXYW5nIDxpcnVpLndh
bmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4uL21lZGlhdGVrL3Zjb2RlYy9tdGtf
dmNvZGVjX2VuY19kcnYuYyAgICAgIHwgMjEgKysrKysrKysrKysrDQo+ID4gLS0tLS0tLQ0KPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+ID4g
DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay92
Y29kZWMvbXRrX3Zjb2RlY19lbmNfZHJ2LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bWVkaWF0ZWsvdmNvZGVjL210a192Y29kZWNfZW5jX2Rydi5jDQo+ID4gaW5kZXggOTVlOGMyOWNj
YzY1Li42YjA2ODhiNDg3MmQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tZWRpYXRlay92Y29kZWMvbXRrX3Zjb2RlY19lbmNfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYw0KPiA+
IEBAIC0yMjgsNyArMjI4LDYgQEAgc3RhdGljIGludCBtdGtfdmNvZGVjX3Byb2JlKHN0cnVjdA0K
PiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgbXRrX3Zj
b2RlY19kZXYgKmRldjsNCj4gPiAgIAlzdHJ1Y3QgdmlkZW9fZGV2aWNlICp2ZmRfZW5jOw0KPiA+
IC0Jc3RydWN0IHJlc291cmNlICpyZXM7DQo+ID4gICAJcGhhbmRsZSBycHJvY19waGFuZGxlOw0K
PiA+ICAgCWVudW0gbXRrX3Zjb2RlY19md190eXBlIGZ3X3R5cGU7DQo+ID4gICAJaW50IHJldDsN
Cj4gPiBAQCAtMjcyLDEzICsyNzEsNiBAQCBzdGF0aWMgaW50IG10a192Y29kZWNfcHJvYmUoc3Ry
dWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgCQlnb3RvIGVycl9yZXM7DQo+
ID4gICAJfQ0KPiA+ICAgDQo+ID4gLQlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwg
SU9SRVNPVVJDRV9JUlEsIDApOw0KPiANCj4gVGhpcyBuZWVkcyB0byBiZSBhIHNlcGFyYXRlZCBj
b21taXQgd2l0aCBhIEZpeGVzIHRhZyENClNlcGFyYXRlIHRvIGFub3RoZXIgcGF0Y2gsIHRoYW5r
cy4NCj4gDQo+ID4gLQlpZiAocmVzID09IE5VTEwpIHsNCj4gPiAtCQlkZXZfZXJyKCZwZGV2LT5k
ZXYsICJmYWlsZWQgdG8gZ2V0IGlycSByZXNvdXJjZSIpOw0KPiA+IC0JCXJldCA9IC1FTk9FTlQ7
DQo+ID4gLQkJZ290byBlcnJfcmVzOw0KPiA+IC0JfQ0KPiA+IC0NCj4gPiAgIAlkZXYtPmVuY19p
cnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOw0KPiA+ICAgCWlycV9zZXRfc3RhdHVzX2Zs
YWdzKGRldi0+ZW5jX2lycSwgSVJRX05PQVVUT0VOKTsNCj4gPiAgIAlyZXQgPSBkZXZtX3JlcXVl
c3RfaXJxKCZwZGV2LT5kZXYsIGRldi0+ZW5jX2lycSwNCj4gPiBAQCAtNDI4LDYgKzQyMCwxOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a192Y29kZWNfZW5jX3BkYXRhDQo+ID4gbXQ4MTk1X3Bk
YXRhID0gew0KPiA+ICAgCS5jb3JlX2lkID0gVkVOQ19TWVMsDQo+ID4gICB9Ow0KPiA+ICAgDQo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3Zjb2RlY19lbmNfcGRhdGEgbXQ4MTg4X3BkYXRh
ID0gew0KPiA+ICsJLnVzZXNfZXh0ID0gdHJ1ZSwNCj4gPiArCS5jYXB0dXJlX2Zvcm1hdHMgPSBt
dGtfdmlkZW9fZm9ybWF0c19jYXB0dXJlX2gyNjQsDQo+ID4gKwkubnVtX2NhcHR1cmVfZm9ybWF0
cyA9DQo+ID4gQVJSQVlfU0laRShtdGtfdmlkZW9fZm9ybWF0c19jYXB0dXJlX2gyNjQpLA0KPiA+
ICsJLm91dHB1dF9mb3JtYXRzID0gbXRrX3ZpZGVvX2Zvcm1hdHNfb3V0cHV0LA0KPiA+ICsJLm51
bV9vdXRwdXRfZm9ybWF0cyA9IEFSUkFZX1NJWkUobXRrX3ZpZGVvX2Zvcm1hdHNfb3V0cHV0KSwN
Cj4gPiArCS5taW5fYml0cmF0ZSA9IDY0LA0KPiA+ICsJLm1heF9iaXRyYXRlID0gNTAwMDAwMDAs
DQo+ID4gKwkuY29yZV9pZCA9IFZFTkNfU1lTLA0KPiA+ICsJLmlzXzM0Yml0ID0gdHJ1ZSwNCj4g
PiArfTsNCj4gPiArDQo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtf
dmNvZGVjX2VuY19tYXRjaFtdID0gew0KPiA+ICAgCXsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxNzMtdmNvZGVjLWVuYyIsDQo+ID4gICAJCQkuZGF0YSA9ICZtdDgxNzNfYXZjX3BkYXRhfSwN
Cj4gPiBAQCAtNDM2LDYgKzQ0MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
DQo+ID4gbXRrX3Zjb2RlY19lbmNfbWF0Y2hbXSA9IHsNCj4gPiAgIAl7LmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ4MTgzLXZjb2RlYy1lbmMiLCAuZGF0YSA9DQo+ID4gJm10ODE4M19wZGF0YX0s
DQo+ID4gICAJey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi12Y29kZWMtZW5jIiwgLmRh
dGEgPQ0KPiA+ICZtdDgxOTJfcGRhdGF9LA0KPiA+ICAgCXsuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxOTUtdmNvZGVjLWVuYyIsIC5kYXRhID0NCj4gPiAmbXQ4MTk1X3BkYXRhfSwNCj4gPiAr
CXsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODgtdmNvZGVjLWVuYyIsIC5kYXRhID0NCj4g
PiAmbXQ4MTg4X3BkYXRhfSwNCj4gDQo+IFBsZWFzZSBrZWVwIHRoaXMgbGlzdCBhbHBoYWJldGlj
YWxseSBzb3J0ZWQuDQpGaXggaW4gbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MNCkJlc3QgUmVnYXJk
cy4NCj4gDQo+ID4gICAJe30sDQo+ID4gICB9Ow0KPiA+ICAgTU9EVUxFX0RFVklDRV9UQUJMRShv
ZiwgbXRrX3Zjb2RlY19lbmNfbWF0Y2gpOw0KPiANCj4gDQo=


