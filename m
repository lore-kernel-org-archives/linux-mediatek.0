Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C242C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 09:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mctK6i2MW9I8ZTXcNqIOaSn6pyq1UwwBuxYdaaO/nM=; b=ApzRIhjTSinLRUPLnc5ju4IT7z
	h9zm3TxM4CqOw651TMYdVm2ScshTboWdxeLbTNjOa5Kj3pPjU2eK4yHVKllvHqfSg1Xk4xBRg3IOQ
	cKEiuuY8wojEjQOZpiHUaw4upxkwICtOxGdeN8rpdUtd4obM0VFZolZM2kS52IEhGIRwh3H64G5+3
	L02FPqVC2sfhrwxGevIP+e3yyPpTcv9LfXsdSxk7po9gIGIsOtWm9tEfmWB/xjfXULIlJrpQuD7jN
	fwyGpLSvOlAD7201A4r4Eem0ES95VVxKfzwGru6DDSGMJVMcXDQMIqnjUgJ+8U+3Km7S4Jbx+r6lN
	XaMItiHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lrx-001gGN-1K; Thu, 16 Jun 2022 09:32:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lrl-001gEl-DS; Thu, 16 Jun 2022 09:32:43 +0000
X-UUID: bc494569f3ca473aa113894ec38fec5f-20220616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=2mctK6i2MW9I8ZTXcNqIOaSn6pyq1UwwBuxYdaaO/nM=;
	b=Kr5TCbas7+kBFQPBak72vljZcWn+Bj3a5NVx8UrPbdojZi9TtElqZSto3P+V2VHyjaHBcocQ4REBbjKTZqjNRHYGDB3vhutJ1VDBfDmpIhzyIbiMx7VtLa18pWDD6Fu+BJkrJkNxS3c1S4CWIuhibu3PoC1zcVFF4jrJzrpsJ+w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:84f8c329-66f1-462c-843b-4f75f8fb494c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:6cbc79f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: bc494569f3ca473aa113894ec38fec5f-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1331957129; Thu, 16 Jun 2022 02:32:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 02:32:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 17:32:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 17:32:34 +0800
Message-ID: <b1b944bfbebda8eff7c98503533ac23bfee8196d.camel@mediatek.com>
Subject: Re: [V9,4/7] mtk-jpegenc: add jpegenc timeout func interface
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Irui Wang
	<irui.wang@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih
	<tzungbi@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
	<srv_heupstream@mediatek.com>
Date: Thu, 16 Jun 2022 17:32:34 +0800
In-Reply-To: <a64aa50e843967d691300af3cda27b85b8353f96.camel@collabora.com>
References: <20220613032306.23237-1-irui.wang@mediatek.com>
	 <20220613032306.23237-5-irui.wang@mediatek.com>
	 <a64aa50e843967d691300af3cda27b85b8353f96.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_023241_501037_1492C923 
X-CRM114-Status: GOOD (  21.42  )
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

T24gV2VkLCAyMDIyLTA2LTE1IGF0IDEwOjAyIC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBMZSBsdW5kaSAxMyBqdWluIDIwMjIgw6AgMTE6MjMgKzA4MDAsIElydWkgV2FuZyBhIMOp
Y3JpdCA6DQo+ID4gRnJvbToga3lyaWUgd3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAN
Cj4gPiBHZW5lcmFsaXplcyBqcGVnZW5jIHRpbWVvdXQgZnVuYyBpbnRlcmZhY2VzIHRvIGhhbmRs
ZSBIVyB0aW1lb3V0Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IGt5cmllIHd1IDxreXJpZS53
dUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9qcGVn
L210a19qcGVnX2NvcmUuaCAgICB8ICA4ICsrKysrKw0KPiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0
ZWsvanBlZy9tdGtfanBlZ19lbmNfaHcuYyAgfCAyNQ0KPiA+ICsrKysrKysrKysrKysrKysrKysN
Cj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19jb3Jl
LmgNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19j
b3JlLmgNCj4gPiBpbmRleCBmNmU5ODBmZGU0ZWYuLjA2ODNkODBmY2VhNSAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5o
DQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVn
X2NvcmUuaA0KPiA+IEBAIC03Niw2ICs3NiwxMiBAQCBzdHJ1Y3QgbXRrX2pwZWdfdmFyaWFudCB7
DQo+ID4gIAl1MzIgY2FwX3FfZGVmYXVsdF9mb3VyY2M7DQo+ID4gIH07DQo+ID4gIA0KPiA+ICtz
dHJ1Y3QgbXRrX2pwZWdfaHdfcGFyYW0gew0KPiA+ICsJc3RydWN0IHZiMl92NGwyX2J1ZmZlciAq
c3JjX2J1ZmZlcjsNCj4gPiArCXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgKmRzdF9idWZmZXI7DQo+
ID4gKwlzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdXJyX2N0eDsNCj4gPiArfTsNCj4gPiArDQo+ID4g
IGVudW0gbXRrX2pwZWdlbmNfaHdfaWQgew0KPiA+ICAJTVRLX0pQRUdFTkNfSFcwLA0KPiA+ICAJ
TVRLX0pQRUdFTkNfSFcxLA0KPiA+IEBAIC0xMDcsNiArMTEzLDggQEAgc3RydWN0IG10a19qcGVn
ZW5jX2NvbXBfZGV2IHsNCj4gPiAgCXN0cnVjdCBtdGtfanBlZ2VuY19jbGsgdmVuY19jbGs7DQo+
ID4gIAlpbnQganBlZ2VuY19pcnE7DQo+ID4gIAlpbnQgaHdfaWQ7DQo+ID4gKwlzdHJ1Y3QgZGVs
YXllZF93b3JrIGpvYl90aW1lb3V0X3dvcms7DQo+ID4gKwlzdHJ1Y3QgbXRrX2pwZWdfaHdfcGFy
YW0gaHdfcGFyYW07DQo+ID4gIH07DQo+ID4gIA0KPiA+ICAvKioNCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2VuY19ody5jDQo+
ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3
LmMNCj4gPiBpbmRleCA4YWM2YjAzMWRjZDQuLjk5ZjNkYjJhMzkzYSAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMN
Cj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdf
ZW5jX2h3LmMNCj4gPiBAQCAtMTg1LDYgKzE4NSwyNiBAQCB2b2lkIG10a19qcGVnX3NldF9lbmNf
cGFyYW1zKHN0cnVjdA0KPiA+IG10a19qcGVnX2N0eCAqY3R4LCAgdm9pZCBfX2lvbWVtICpiYXNl
KQ0KPiA+ICB9DQo+ID4gIEVYUE9SVF9TWU1CT0xfR1BMKG10a19qcGVnX3NldF9lbmNfcGFyYW1z
KTsNCj4gPiAgDQo+ID4gK3N0YXRpYyB2b2lkIG10a19qcGVnZW5jX3RpbWVvdXRfd29yayhzdHJ1
Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBkZWxheWVkX3dvcmsg
KmRseV93b3JrID0gdG9fZGVsYXllZF93b3JrKHdvcmspOw0KPiA+ICsJc3RydWN0IG10a19qcGVn
ZW5jX2NvbXBfZGV2ICpjanBlZyA9DQo+ID4gKwkJY29udGFpbmVyX29mKGRseV93b3JrLA0KPiA+
ICsJCQkgICAgIHN0cnVjdCBtdGtfanBlZ2VuY19jb21wX2RldiwNCj4gPiArCQkJICAgICBqb2Jf
dGltZW91dF93b3JrKTsNCj4gPiArCWVudW0gdmIyX2J1ZmZlcl9zdGF0ZSBidWZfc3RhdGUgPSBW
QjJfQlVGX1NUQVRFX0VSUk9SOw0KPiA+ICsJc3RydWN0IHZiMl92NGwyX2J1ZmZlciAqc3JjX2J1
ZiwgKmRzdF9idWY7DQo+ID4gKw0KPiA+ICsJc3JjX2J1ZiA9IGNqcGVnLT5od19wYXJhbS5zcmNf
YnVmZmVyOw0KPiA+ICsJZHN0X2J1ZiA9IGNqcGVnLT5od19wYXJhbS5kc3RfYnVmZmVyOw0KPiA+
ICsJZHN0X2J1Zi0+dmIyX2J1Zi50aW1lc3RhbXAgPSBzcmNfYnVmLT52YjJfYnVmLnRpbWVzdGFt
cDsNCj4gDQo+IEFub3RoZXIgY2FzZSBmb3IgdjRsMl9tMm1fYnVmX2NvcHlfbWV0YWRhdGE/IEFz
IHlvdSBrbm93IGVhcmx5IHRoZQ0KPiBkc3RfYnVmLCB5b3UNCj4gY291bGQgZG8gdGhhdCBvbmNl
IGJlZm9yZSB5b3Ugc3RhcnQgdGhlIGVuY29kaW5nLCB0aGlzIGNvdWxkIHBvc3NpYmx5DQo+IHJl
bW92ZSB0aGUNCj4gZHVwbGljYXRpb24uDQpUaGlzIGlzIGFub3RoZXIgcHJvY2VzcyBmbG93LiBp
ZiBlbmNvZGluZyBzdWNjZXNzZXMsIHRoZSBpcnEgZnVuY3Rpb24NCndvdWxkIGNvcHkgdGltZXN0
YW1wLCBvdGhlcndpc2UgdGhlIHRpbWVvdXQgZnVuY3Rpb24gd291bGQgaGFuZGxlIGl0Lg0KPiAN
Cj4gPiArDQo+ID4gKwltdGtfanBlZ19lbmNfcmVzZXQoY2pwZWctPnJlZ19iYXNlKTsNCj4gPiAr
CWNsa19kaXNhYmxlX3VucHJlcGFyZShjanBlZy0+dmVuY19jbGsuY2xrcy0+Y2xrKTsNCj4gPiAr
CXBtX3J1bnRpbWVfcHV0KGNqcGVnLT5kZXYpOw0KPiA+ICsJdjRsMl9tMm1fYnVmX2RvbmUoc3Jj
X2J1ZiwgYnVmX3N0YXRlKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIGlycXJldHVybl90
IG10a19qcGVnZW5jX2h3X2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKnByaXYpDQo+ID4gIHsN
Cj4gPiAgCXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgKnNyY19idWYsICpkc3RfYnVmOw0KPiA+IEBA
IC0xOTYsNiArMjE2LDggQEAgc3RhdGljIGlycXJldHVybl90DQo+ID4gbXRrX2pwZWdlbmNfaHdf
aXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqcHJpdikNCj4gPiAgCXN0cnVjdCBtdGtfanBlZ2Vu
Y19jb21wX2RldiAqanBlZyA9IHByaXY7DQo+ID4gIAlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICptYXN0
ZXJfanBlZyA9IGpwZWctPm1hc3Rlcl9kZXY7DQo+ID4gIA0KPiA+ICsJY2FuY2VsX2RlbGF5ZWRf
d29yaygmanBlZy0+am9iX3RpbWVvdXRfd29yayk7DQo+ID4gKw0KPiA+ICAJaXJxX3N0YXR1cyA9
IHJlYWRsKGpwZWctPnJlZ19iYXNlICsgSlBFR19FTkNfSU5UX1NUUykgJg0KPiA+ICAJCUpQRUdf
RU5DX0lOVF9TVEFUVVNfTUFTS19BTExJUlE7DQo+ID4gIAlpZiAoaXJxX3N0YXR1cykNCj4gPiBA
QCAtMjcyLDYgKzI5NCw5IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdlbmNfaHdfcHJvYmUoc3RydWN0
DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAJZGV2LT5wbGF0X2RldiA9IHBkZXY7
DQo+ID4gIAlkZXYtPmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gIA0KPiA+ICsJSU5JVF9ERUxBWUVE
X1dPUksoJmRldi0+am9iX3RpbWVvdXRfd29yaywNCj4gPiArCQkJICBtdGtfanBlZ2VuY190aW1l
b3V0X3dvcmspOw0KPiA+ICsNCj4gPiAgCWpwZWdlbmNfY2xrID0gJmRldi0+dmVuY19jbGs7DQo+
ID4gIA0KPiA+ICAJanBlZ2VuY19jbGstPmNsa19udW0gPSBkZXZtX2Nsa19idWxrX2dldF9hbGwo
JnBkZXYtPmRldiwNCj4gDQo+IA0K


