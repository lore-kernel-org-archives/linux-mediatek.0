Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1398EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 01:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/v9GV1xpkZKNcGK0kAOLtngLK/Q4w4viOsn9pg5QRe8=; b=JG6BQthBb2r4bPVK9SkIM5W4yq
	QsHaigXV4STg9l0kNGz/Kn1EDiUYhMRWiDQZapMmvFeHYCOTMpC8bwTI47K+tNK+1CdX+uyl4gBk3
	h8GZRV1SuKFTRB+dg5zsQ/mCcHwEefXQjhn2QQMjlRbMGS9Vc5BcIeuMo1RTc8cRKeYxgqKbhBdDx
	xC/7pT+xOQQNOC0axy54WWLDHjm/v7dLXgtQhSOON9tjSRvvfAbQcTg4rfPmk6N5nXz1XOPksG4Us
	zz4hXShFnBZNCzjlQey8BcL6//nGrCMSkTXw1CnQmtX+iHHE0SsIYCG1RdM27zKOdQRApoWnnzzKZ
	2jnukwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnMY-000LxM-Nw; Mon, 25 Jul 2022 01:58:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnMK-000Lgu-Uy; Mon, 25 Jul 2022 01:58:14 +0000
X-UUID: 6fa16ca8c42d45398023356a33d3ce1c-20220724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=/v9GV1xpkZKNcGK0kAOLtngLK/Q4w4viOsn9pg5QRe8=;
	b=Ja2mBW/+HzmmaIUMiTiBAKWmXUHccfHE4XUcM1EaU0kT1GfzJYiTDCskbYAoZdJ/npwvfFwpGLQOK3zg34Tra8y0VeDZHwk4w4l9Sp8rqchTTX+nYqEmSlw+CWizpZyZfomSAa8V9RBN96i/9LdvA0Lk7X9sJHp9czKHFPIXPgA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:8846a5f0-bdf6-4860-b56f-1b152e3e4460,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:40915eb3-06d2-48ef-b2dd-540836705165,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6fa16ca8c42d45398023356a33d3ce1c-20220724
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1611212504; Sun, 24 Jul 2022 18:53:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 25 Jul 2022 09:53:19 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Jul 2022 09:53:17 +0800
Message-ID: <dd9c3ff6ad081627ff9419d6f08995ea06cad820.camel@mediatek.com>
Subject: Re: [V11,3/7] mtk-jpegenc: manage jpegenc multi-hardware
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
Date: Mon, 25 Jul 2022 09:53:17 +0800
In-Reply-To: <f8618c29-167b-a627-e4b1-d117ec860b7e@collabora.com>
References: <20220716093435.29796-1-irui.wang@mediatek.com>
	 <20220716093435.29796-4-irui.wang@mediatek.com>
	 <f8618c29-167b-a627-e4b1-d117ec860b7e@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_185813_170852_A0C4EA63 
X-CRM114-Status: GOOD (  19.04  )
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

T24gTW9uLCAyMDIyLTA3LTE4IGF0IDEyOjQwICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTYvMDcvMjIgMTE6MzQsIElydWkgV2FuZyBoYSBzY3JpdHRvOg0K
PiA+IEZyb206IGt5cmllIHd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gbWFu
YWdlIGVhY2ggaGFyZHdhcmUgaW5mb3JtYXRpb24sIGluY2x1ZGluZyBpcnEvY2xrL3Bvd2VyLg0K
PiA+IHRoZSBoYXJkd2FyZSBpbmNsdWRlcyBIVzAgYW5kIEhXMS4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBreXJpZSB3dSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IGlydWkgd2FuZyA8aXJ1aS53YW5nQG1lZGlhdGVrLmNvbT4NCj4gPiANCj4gPiAtLS0NCj4g
PiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9NYWtlZmlsZSB8ICAxMSAr
LQ0KPiA+ICAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jICAgIHwg
IDk0ICsrKysrKy0tLS0NCj4gPiAgIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2NvcmUuaCAgICB8ICAzNyArKysrDQo+ID4gICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9t
dGtfanBlZ19lbmNfaHcuYyAgfCAxNjMNCj4gPiArKysrKysrKysrKysrKysrKysNCj4gPiAgIDQg
ZmlsZXMgY2hhbmdlZCwgMjcyIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvTWFr
ZWZpbGUNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9NYWtlZmls
ZQ0KPiA+IGluZGV4IDc2YzMzYWFkMGYzZi4uNjk3MDNkYjRiMGE1IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9NYWtlZmlsZQ0KPiA+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9NYWtlZmlsZQ0KPiA+IEBAIC0x
LDYgKzEsOSBAQA0KPiA+ICAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
DQo+ID4gLW10a19qcGVnLW9ianMgOj0gbXRrX2pwZWdfY29yZS5vIFwNCj4gPiArb2JqLSQoQ09O
RklHX1ZJREVPX01FRElBVEVLX0pQRUcpICs9IG10a19qcGVnLm8gXA0KPiA+ICsJbXRrLWpwZWct
ZW5jLWh3Lm8NCj4gPiArDQo+ID4gK210a19qcGVnLXkgOj0gbXRrX2pwZWdfY29yZS5vIFwNCj4g
PiAgIAkJIG10a19qcGVnX2RlY19ody5vIFwNCj4gPiAtCQkgbXRrX2pwZWdfZGVjX3BhcnNlLm8g
XA0KPiA+IC0JCSBtdGtfanBlZ19lbmNfaHcubw0KPiA+IC1vYmotJChDT05GSUdfVklERU9fTUVE
SUFURUtfSlBFRykgKz0gbXRrX2pwZWcubw0KPiA+ICsJCSBtdGtfanBlZ19kZWNfcGFyc2Uubw0K
PiA+ICsNCj4gPiArbXRrLWpwZWctZW5jLWh3LXkgOj0gbXRrX2pwZWdfZW5jX2h3Lm8NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2NvcmUuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19q
cGVnX2NvcmUuYw0KPiA+IGluZGV4IDcyNGZiN2FlYjBlZS4uMzI4NmU5NjA2NTA1IDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19j
b3JlLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRr
X2pwZWdfY29yZS5jDQo+IA0KPiAuLnNuaXAuLg0KPiANCj4gPiBAQCAtMTQ5Nyw2ICsxNTE2LDE4
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2pwZWdfdmFyaWFudA0KPiA+IG10a19qcGVnX2Ry
dmRhdGEgPSB7DQo+ID4gICAJLmNhcF9xX2RlZmF1bHRfZm91cmNjID0gVjRMMl9QSVhfRk1UX0pQ
RUcsDQo+ID4gICB9Ow0KPiA+ICAgDQo+ID4gK3N0YXRpYyBzdHJ1Y3QgbXRrX2pwZWdfdmFyaWFu
dCBtdGs4MTk1X2pwZWdlbmNfZHJ2ZGF0YSA9IHsNCj4gDQo+IG10ODE5NV9qcGVnZW5jX2RydmRh
dGEsIG9yIG10a19qcGVnZW5jX211bHRpY29yZV9kcnZkYXRhDQo+IA0KPiAoc2FtZSBhcHBsaWVz
IGZvciBqcGVnZGVjKQ0KPiANCj4gPiArCS5mb3JtYXRzID0gbXRrX2pwZWdfZW5jX2Zvcm1hdHMs
DQo+ID4gKwkubnVtX2Zvcm1hdHMgPSBNVEtfSlBFR19FTkNfTlVNX0ZPUk1BVFMsDQo+ID4gKwku
cW9wcyA9ICZtdGtfanBlZ19lbmNfcW9wcywNCj4gPiArCS5tMm1fb3BzID0gJm10a19qcGVnX211
bHRpY29yZV9lbmNfbTJtX29wcywNCj4gDQo+IFNhbWUgY29tbWVudCBmb3IganBnZW5jIGFzIHdl
bGw6IGFkZCBzdXBwb3J0IGZvciB0aGlzIGRldmljZSBhZnRlcg0KPiBhZGRpbmcgc3VwcG9ydA0K
PiBmb3IgbXVsdGljb3JlIGVuY29kZXIuDQpIaSBBbmdlbG8sDQpUaGFua3MgZm9yIHlvdXIgc3Vn
Z2VzdGlvbiwgSSB3aWxsIGZpeCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0K
S3lyaWUuDQoNCj4gDQo+ID4gKwkuZGV2X25hbWUgPSAibXRrLWpwZWctZW5jIiwNCj4gPiArCS5p
b2N0bF9vcHMgPSAmbXRrX2pwZWdfZW5jX2lvY3RsX29wcywNCj4gPiArCS5vdXRfcV9kZWZhdWx0
X2ZvdXJjYyA9IFY0TDJfUElYX0ZNVF9ZVVlWLA0KPiA+ICsJLmNhcF9xX2RlZmF1bHRfZm91cmNj
ID0gVjRMMl9QSVhfRk1UX0pQRUcsDQo+ID4gK307DQo+ID4gKw0KPiA+ICsjaWYgZGVmaW5lZChD
T05GSUdfT0YpDQo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfanBl
Z19tYXRjaFtdID0gew0KPiA+ICAgCXsNCj4gPiAgIAkJLmNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ4MTczLWpwZ2RlYyIsDQo+ID4gQEAgLTE1MTAsMTAgKzE1NDEsMTUgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQNCj4gPiBtdGtfanBlZ19tYXRjaFtdID0gew0KPiA+ICAgCQku
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdGstanBnZW5jIiwNCj4gPiAgIAkJLmRhdGEgPSAmbXRr
X2pwZWdfZHJ2ZGF0YSwNCj4gPiAgIAl9LA0KPiA+ICsJew0KPiA+ICsJCS5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE5NS1qcGdlbmMiLA0KPiA+ICsJCS5kYXRhID0gJm10azgxOTVfanBlZ2Vu
Y19kcnZkYXRhLA0KPiA+ICsJfSwNCj4gPiAgIAl7fSwNCj4gPiAgIH07DQo+ID4gICANCj4gPiAg
IE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10a19qcGVnX21hdGNoKTsNCj4gPiArI2VuZGlmDQo+
ID4gICANCj4gPiAgIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10a19qcGVnX2RyaXZl
ciA9IHsNCj4gPiAgIAkucHJvYmUgPSBtdGtfanBlZ19wcm9iZSwNCj4gDQo+IA0KPiANCj4gDQo=


