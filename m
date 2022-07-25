Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 02:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRgjdVVxy+QXwj3CSkcj1bxIXeCmOwraRVXJsi0HjFE=; b=nrZbAdYdTmo3KFWNT8uoJKJHCR
	qbxKyXMqI7Q51WVvFuiTPhPJ6r6m3EtwpP3EG80bPTnTD0e3ZmbwUfc5Ts7rXVmYg1aknfAQ8dHij
	Ag9C6FX9i3uxsG4264lpr5D4R30r7Q0x34TGOPujnTM/AGEZpkGdgFKsHChbYSAtYGsgCHMB/8wh4
	Sd6WA4Kf+ggNZHSC5mpVgzrpksKzIytlj1nIQ+kYNqCm5ML4AVjKUrUf6xJ7x9Aph4ivaOEg3CEZ5
	3TX4wz0T8d3jkSj4oR04301nmpdMOnlI9sWrE7XSkVtxJiJfuVy2O19ZxU+XAPxTRJy359SLSrZhe
	ZQ9OMtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnvE-001678-FT; Mon, 25 Jul 2022 02:34:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnv3-0015ur-Kl; Mon, 25 Jul 2022 02:34:07 +0000
X-UUID: f94cad86faf241bfa25adf0bbac7dc78-20220724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=DRgjdVVxy+QXwj3CSkcj1bxIXeCmOwraRVXJsi0HjFE=;
	b=cLhHaPgeg7Es9iZDM0x0z/T2ZiYN7yFCEwslOlouPadciYD56Uhumaq5/JAxG3c+qtd+BpVr8ej4AEcuVOzyd7Y1GQEqBOCL7/+HcWokjGnxGrh0sw6+6QUJ2PShRdEyNSjGSQmB16h+6jqBItBlRfJpUDK1CAMiMSAXYP+UfaQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:974fad8c-84b1-4cbb-b0b8-4ad31f58ce9f,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:551060b3-06d2-48ef-b2dd-540836705165,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f94cad86faf241bfa25adf0bbac7dc78-20220724
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1511404613; Sun, 24 Jul 2022 19:33:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with ShadowRedundancy id 15.2.792.3;
 Mon, 25 Jul 2022 02:32:31 +0000
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 25 Jul 2022 10:14:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Jul 2022 10:14:06 +0800
Message-ID: <788c192e17d1fa88105a9bb5238a023e593b251b.camel@mediatek.com>
Subject: Re: [V5,3/8] media: mtk-jpegdec: manage jpegdec multi-hardware
From: kyrie.wu <kyrie.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Irui
 Wang <irui.wang@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih
	<tzungbi@chromium.org>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
	<srv_heupstream@mediatek.com>
Date: Mon, 25 Jul 2022 10:14:06 +0800
In-Reply-To: <00dc6bff-d87a-0d80-fe20-ae70e5ad0c4f@collabora.com>
References: <20220716093408.29734-1-irui.wang@mediatek.com>
	 <20220716093408.29734-4-irui.wang@mediatek.com>
	 <00dc6bff-d87a-0d80-fe20-ae70e5ad0c4f@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_193405_735660_3EA97CD2 
X-CRM114-Status: GOOD (  23.50  )
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

T24gTW9uLCAyMDIyLTA3LTE4IGF0IDEyOjIyICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTYvMDcvMjIgMTE6MzQsIElydWkgV2FuZyBoYSBzY3JpdHRvOg0K
PiA+IEZyb206IGt5cmllIHd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gbWFu
YWdlIGVhY2ggaGFyZHdhcmUgaW5mb3JtYXRpb24sIGluY2x1ZGluZyBpcnEvY2xrL3Bvd2VyLg0K
PiA+IHRoZSBoYXJkd2FyZSBpbmNsdWRlcyBIVzAvSFcxL0hXMi4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBreXJpZSB3dSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IGlydWkgd2FuZyA8aXJ1aS53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiAtLS0NCj4g
PiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9NYWtlZmlsZSB8ICAgNSAr
LQ0KPiA+ICAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jICAgIHwg
IDIzICsrKw0KPiA+ICAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5o
ICAgIHwgIDM3ICsrKysNCj4gPiAgIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2RlY19ody5jICB8IDE3Mg0KPiA+ICsrKysrKysrKysrKysrKysrKw0KPiA+ICAgNCBmaWxlcyBj
aGFuZ2VkLCAyMzUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL01ha2VmaWxlDQo+
ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvTWFrZWZpbGUNCj4gPiBp
bmRleCA2OTcwM2RiNGIwYTUuLjI2ZTg0ODUyNTIzZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvTWFrZWZpbGUNCj4gPiBAQCAtMSw5ICsxLDEw
IEBADQo+ID4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gPiAg
IG9iai0kKENPTkZJR19WSURFT19NRURJQVRFS19KUEVHKSArPSBtdGtfanBlZy5vIFwNCj4gPiAt
CW10ay1qcGVnLWVuYy1ody5vDQo+ID4gKwltdGstanBlZy1lbmMtaHcubyBcDQo+ID4gKwltdGst
anBlZy1kZWMtaHcubw0KPiA+ICAgDQo+ID4gICBtdGtfanBlZy15IDo9IG10a19qcGVnX2NvcmUu
byBcDQo+ID4gLQkJIG10a19qcGVnX2RlY19ody5vIFwNCj4gPiAgIAkJIG10a19qcGVnX2RlY19w
YXJzZS5vDQo+ID4gICANCj4gPiAgIG10ay1qcGVnLWVuYy1ody15IDo9IG10a19qcGVnX2VuY19o
dy5vDQo+ID4gK210ay1qcGVnLWRlYy1ody15IDo9IG10a19qcGVnX2RlY19ody5vDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19j
b3JlLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBl
Z19jb3JlLmMNCj4gPiBpbmRleCAzODZkNDhjYzRmNTkuLmE5ZThiZTk3NmJiMCAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29y
ZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19q
cGVnX2NvcmUuYw0KPiA+IEBAIC0xMTAwLDYgKzExMDAsMTAgQEAgc3RhdGljIHZvaWQNCj4gPiBt
dGtfanBlZ19tdWx0aWNvcmVfZW5jX2RldmljZV9ydW4odm9pZCAqcHJpdikNCj4gPiAgIAlxdWV1
ZV93b3JrKGpwZWctPndvcmtxdWV1ZSwgJmN0eC0+anBlZ193b3JrKTsNCj4gPiAgIH0NCj4gPiAg
IA0KPiA+ICtzdGF0aWMgdm9pZCBtdGtfanBlZ19tdWx0aWNvcmVfZGVjX2RldmljZV9ydW4odm9p
ZCAqcHJpdikNCj4gPiArew0KPiANCj4gLi4uLiB3aHkgaXMgdGhpcyBmdW5jdGlvbiBlbXB0eT8h
DQo+IA0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgc3RhdGljIHZvaWQgbXRrX2pwZWdfZGVjX2Rldmlj
ZV9ydW4odm9pZCAqcHJpdikNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpj
dHggPSBwcml2Ow0KPiA+IEBAIC0xMTY2LDYgKzExNzAsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCB2NGwyX20ybV9vcHMNCj4gPiBtdGtfanBlZ19tdWx0aWNvcmVfZW5jX20ybV9vcHMgPSB7DQo+
ID4gICAJLmRldmljZV9ydW4gPSBtdGtfanBlZ19tdWx0aWNvcmVfZW5jX2RldmljZV9ydW4sDQo+
ID4gICB9Ow0KPiA+ICAgDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9tMm1fb3BzIG10
a19qcGVnX211bHRpY29yZV9kZWNfbTJtX29wcyA9DQo+ID4gew0KPiA+ICsJLmRldmljZV9ydW4g
PSBtdGtfanBlZ19tdWx0aWNvcmVfZGVjX2RldmljZV9ydW4sDQo+ID4gK307DQo+ID4gKw0KPiA+
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCB2NGwyX20ybV9vcHMgbXRrX2pwZWdfZGVjX20ybV9vcHMg
PSB7DQo+ID4gICAJLmRldmljZV9ydW4gPSBtdGtfanBlZ19kZWNfZGV2aWNlX3J1biwNCj4gPiAg
IAkuam9iX3JlYWR5ICA9IG10a19qcGVnX2RlY19qb2JfcmVhZHksDQo+ID4gQEAgLTE2ODAsNiAr
MTY4OCwxNyBAQCBzdGF0aWMgc3RydWN0IG10a19qcGVnX3ZhcmlhbnQNCj4gPiBtdGs4MTk1X2pw
ZWdlbmNfZHJ2ZGF0YSA9IHsNCj4gPiAgIAkuY2FwX3FfZGVmYXVsdF9mb3VyY2MgPSBWNEwyX1BJ
WF9GTVRfSlBFRywNCj4gPiAgIH07DQo+ID4gICANCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfanBlZ192YXJpYW50IG10azgxOTVfanBlZ2RlY19kcnZkYXRhID0gew0KPiA+ICsJLmZvcm1h
dHMgPSBtdGtfanBlZ19kZWNfZm9ybWF0cywNCj4gPiArCS5udW1fZm9ybWF0cyA9IE1US19KUEVH
X0RFQ19OVU1fRk9STUFUUywNCj4gPiArCS5xb3BzID0gJm10a19qcGVnX2RlY19xb3BzLA0KPiA+
ICsJLm0ybV9vcHMgPSAmbXRrX2pwZWdfbXVsdGljb3JlX2RlY19tMm1fb3BzLA0KPiA+ICsJLmRl
dl9uYW1lID0gIm10ay1qcGVnLWRlYyIsDQo+ID4gKwkuaW9jdGxfb3BzID0gJm10a19qcGVnX2Rl
Y19pb2N0bF9vcHMsDQo+ID4gKwkub3V0X3FfZGVmYXVsdF9mb3VyY2MgPSBWNEwyX1BJWF9GTVRf
SlBFRywNCj4gPiArCS5jYXBfcV9kZWZhdWx0X2ZvdXJjYyA9IFY0TDJfUElYX0ZNVF9ZVVY0MjBN
LA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgICNpZiBkZWZpbmVkKENPTkZJR19PRikNCj4gPiAgIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19qcGVnX21hdGNoW10gPSB7DQo+ID4g
ICAJew0KPiA+IEBAIC0xNjk4LDYgKzE3MTcsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9k
ZXZpY2VfaWQNCj4gPiBtdGtfanBlZ19tYXRjaFtdID0gew0KPiA+ICAgCQkuY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDgxOTUtanBnZW5jIiwNCj4gPiAgIAkJLmRhdGEgPSAmbXRrODE5NV9qcGVn
ZW5jX2RydmRhdGEsDQo+ID4gICAJfSwNCj4gPiArCXsNCj4gPiArCQkuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxOTUtanBnZGVjIiwNCj4gPiArCQkuZGF0YSA9ICZtdGs4MTk1X2pwZWdkZWNf
ZHJ2ZGF0YSwNCj4gPiArCX0sDQo+ID4gICAJe30sDQo+ID4gICB9Ow0KPiA+ICAgDQo+IA0KPiAu
LnNuaXAuLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay9qcGVnL210a19qcGVnX2RlY19ody5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMNCj4gPiBpbmRleCBkMmYyNWY0M2U4NTIu
LjIzMmU4MTE2NWRkMyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMNCj4gDQo+IC4uc25pcC4uDQo+
IA0KPiA+ICsNCj4gPiArc3RhdGljIGludCBtdGtfanBlZ2RlY19od19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgbXRrX2pwZWdkZWNfY2xr
ICpqcGVnZGVjX2NsazsNCj4gPiArCXN0cnVjdCBtdGtfanBlZ19kZXYgKm1hc3Rlcl9kZXY7DQo+
ID4gKwlzdHJ1Y3QgbXRrX2pwZWdkZWNfY29tcF9kZXYgKmRldjsNCj4gPiArCWludCByZXQsIGk7
DQo+ID4gKw0KPiA+ICsJc3RydWN0IGRldmljZSAqZGVjcyA9ICZwZGV2LT5kZXY7DQo+ID4gKw0K
PiA+ICsJaWYgKCFkZWNzLT5wYXJlbnQpDQo+ID4gKwkJcmV0dXJuIC1FUFJPQkVfREVGRVI7DQo+
ID4gKw0KPiA+ICsJbWFzdGVyX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZWNzLT5wYXJlbnQpOw0K
PiA+ICsJaWYgKCFtYXN0ZXJfZGV2KQ0KPiA+ICsJCXJldHVybiAtRVBST0JFX0RFRkVSOw0KPiA+
ICsNCj4gPiArCWRldiA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmRldiksIEdG
UF9LRVJORUwpOw0KPiA+ICsJaWYgKCFkZXYpDQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4g
Kw0KPiA+ICsJZGV2LT5wbGF0X2RldiA9IHBkZXY7DQo+ID4gKwlkZXYtPmRldiA9ICZwZGV2LT5k
ZXY7DQo+ID4gKw0KPiA+ICsJaWYgKCFtYXN0ZXJfZGV2LT5pc19qcGdkZWNfbXVsdGlodykgew0K
PiA+ICsJCW1hc3Rlcl9kZXYtPmlzX2pwZ2RlY19tdWx0aWh3ID0gdHJ1ZTsNCj4gPiArCQlmb3Ig
KGkgPSAwOyBpIDwgTVRLX0pQRUdERUNfSFdfTUFYOyBpKyspDQo+ID4gKwkJCW1hc3Rlcl9kZXYt
PmRlY19od19kZXZbaV0gPSBOVUxMOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWpwZWdkZWNfY2xr
ID0gJmRldi0+amRlY19jbGs7DQo+ID4gKw0KPiA+ICsJanBlZ2RlY19jbGstPmNsa19udW0gPSBk
ZXZtX2Nsa19idWxrX2dldF9hbGwoJnBkZXYtPmRldiwNCj4gPiArCQkJCQkJICAgICAmanBlZ2Rl
Y19jbGstDQo+ID4gPmNsa3MpOw0KPiA+ICsJaWYgKGpwZWdkZWNfY2xrLT5jbGtfbnVtIDwgMCkN
Cj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LA0KPiA+ICsJCQkJICAgICAg
anBlZ2RlY19jbGstPmNsa19udW0sDQo+ID4gKwkJCQkgICAgICAiRmFpbGVkIHRvIGdldCBqcGVn
ZGVjIGNsb2NrDQo+ID4gY291bnQuXG4iKTsNCj4gPiArDQo+ID4gKwlkZXYtPnJlZ19iYXNlID0g
ZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPiA+ICsJaWYgKElTX0VS
UihkZXYtPnJlZ19iYXNlKSkNCj4gPiArCQlyZXR1cm4gUFRSX0VSUihkZXYtPnJlZ19iYXNlKTsN
Cj4gPiArDQo+ID4gKwlyZXQgPSBtdGtfanBlZ2RlY19od19pbml0X2lycShkZXYpOw0KPiA+ICsJ
aWYgKHJldCkNCj4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LA0KPiA+ICsJ
CQkJICAgICByZXQsDQo+ID4gKwkJCQkgICAgICJGYWlsZWQgdG8gcmVnaXN0ZXIgSlBFR0RFQyBp
cnENCj4gPiBoYW5kbGVyLlxuIik7DQo+IA0KPiBGaXg6DQo+IAkJcmV0dXJuIGRldl9lcnJfcHJv
YmUoJnBkZXYtPmRldiwgcmV0LA0KPiANCj4gCQkJCSAgICAgIkZhaWxlZCB0byByZWdpc3RlciBK
UEVHREVDIGlycQ0KPiBoYW5kbGVyLlxuIik7DQo+IA0KPiANCj4gUmVnYXJkcywNCj4gQW5nZWxv
DQpIaSBBbmdlbG8sDQpUaGFua3MgZm9yIHlvdXIgY2hlY2tpbmcuDQoNClJlZ2FyZHMsDQpLeXJp
ZS4NCg==


