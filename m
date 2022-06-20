Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B93C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+r2FhS3eqCLunmApmW+5P1UeeiguuExUqm//eLKZET8=; b=BL5Kya0/Xj0qlyS0QfWOeqHInM
	hudjz6mixZm2HIfFtoG9c1H4O9eE/5PluuENlOSw8tveBp3eagOSmZu37O5+DVRMk0TuMstnoGPfI
	FlHPEgTuCAS0cnvxBiZ5BchyaDUS/daoDBdv1jd+gJQ5RQfm0k3X1xhwu/o72pt2J83rTD9bY12Ld
	vaI48bPIEqnhOflUgs7Yywg26BvKT+VsX56TTPVSYqVSt1bgKf2c3eiNO4FOfZXzuslFSvYv6TrEJ
	0WcSFcxFG06ruBgnDH90j9z1xNK72iM4cO13R666e2eV8Z1nBkwMVmIh+fdsW8onZtl2tZLQOxAX5
	xmtZu/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3HYY-000tY6-Ju; Mon, 20 Jun 2022 13:35:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3HYT-000tSk-00; Mon, 20 Jun 2022 13:35:04 +0000
X-UUID: 2d150e638f534c39aad2ed520737dfff-20220620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=+r2FhS3eqCLunmApmW+5P1UeeiguuExUqm//eLKZET8=;
	b=su2C1iN9VzfXavhO1DFguPIZOkobihocG8hLkILUC44UQac6m9iTayuLUtGnx1Rdrsd2j/9ZYnLG0m20z1tkM1ZHz9vaXGHp/yB5DNfmK4AWdVvZSukPYoXCQOX7F4awe/G8hqlMvDYKnTf+fHE1EYtAid7wSvIxjEH0RQnB780=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:c0abd42d-29da-4d7e-b177-10dbb3231c54,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:be3604ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
	l,QS:nil,BEC:nil,COL:0
X-UUID: 2d150e638f534c39aad2ed520737dfff-20220620
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 813301834; Mon, 20 Jun 2022 06:34:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jun 2022 06:31:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 20 Jun 2022 21:31:53 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 20 Jun 2022 21:31:53 +0800
Message-ID: <b4574843defba94e2abfaac29a9ab7be2555c5ec.camel@mediatek.com>
Subject: Re: FW: [PATCH 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
From: xinlei.lee <xinlei.lee@mediatek.com>
To: <fparent@baylibre.com>, <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<allen-kh.cheng@mediatek.com>
Date: Mon, 20 Jun 2022 21:32:29 +0800
In-Reply-To: <PS1PR03MB5084CE11996065F4DD6959F9A6B09@PS1PR03MB5084.apcprd03.prod.outlook.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
	 <1c53c2c73875cf565b819f67267d0e725d49f3c2.camel@mediatek.com>
	 <PS1PR03MB5084CE11996065F4DD6959F9A6B09@PS1PR03MB5084.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_063501_271112_B0AFFF52 
X-CRM114-Status: GOOD (  23.38  )
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMaW51eC1tZWRpYXRlayA8bGlu
dXgtbWVkaWF0ZWstYm91bmNlc0BsaXN0cy5pbmZyYWRlYWQub3JnPiBPbg0KPiBCZWhhbGYgT2Yg
Q0sgSHUNCj4gU2VudDogRnJpZGF5LCBKdW5lIDE3LCAyMDIyIDE6MzEgUE0NCj4gVG86IEZhYmll
biBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPjsgbWF0dGhpYXMuYmdnQGdtYWlsLmNvbTsN
Cj4gSml0YW8gU2hpICjnn7PorrDmtpspIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPjsgDQo+IGty
enlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnDQo+IENj
OiBjaHVua3VhbmcuaHVAa2VybmVsLm9yZzsgcC56YWJlbEBwZW5ndXRyb25peC5kZTsgYWlybGll
ZEBsaW51eC5pZQ0KPiA7IGRhbmllbEBmZndsbC5jaDsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgDQo+IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnOyANCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
MS83XSBkdC1iaW5kaW5nczogZGlzcGxheTogbWVkaWF0ZWs6IGRwaTogYWRkDQo+IHBvd2VyLWRv
bWFpbnMgcHJvcGVydHkNCj4gDQo+IEhpLCBGYWJpZW46DQo+IA0KPiBPbiBNb24sIDIwMjItMDUt
MzAgYXQgMjI6MTQgKzAyMDAsIEZhYmllbiBQYXJlbnQgd3JvdGU6DQo+ID4gRFBJIGlzIHBhcnQg
b2YgdGhlIGRpc3BsYXkgLyBtdWx0aW1lZGlhIGJsb2NrIGluIE1lZGlhVGVrIFNvQ3MsDQo+ID4g
YW5kIA0KPiA+IGFsd2F5cyBoYXZlIGEgcG93ZXItZG9tYWluIChhdCBsZWFzdCBpbiB0aGUgdXBz
dHJlYW0gZGV2aWNlLXRyZWVzKS4NCj4gPiBBZGQgdGhlIHBvd2VyLWRvbWFpbnMgcHJvcGVydHkg
dG8gdGhlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbi4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBG
YWJpZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCAgfCA2
DQo+ID4gKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueQ0KPiA+IGFtDQo+ID4gbA0KPiA+IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZHBpLnkNCj4gPiBhbQ0KPiA+IGwNCj4gPiBpbmRleCA3N2VlMWI5MjM5OTEuLmNhZjRjODg3MDhm
NCAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRwaS55DQo+ID4gYW0NCj4gPiBsDQo+ID4gKysr
DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkcGkueQ0KPiA+IGFtDQo+ID4gbA0KPiA+IEBAIC01Nyw2ICs1Nyw5IEBAIHBy
b3BlcnRpZXM6DQo+ID4gICAgICAgIE91dHB1dCBwb3J0IG5vZGUuIFRoaXMgcG9ydCBzaG91bGQg
YmUgY29ubmVjdGVkIHRvIHRoZQ0KPiA+IGlucHV0IA0KPiA+IHBvcnQgb2YgYW4NCj4gPiAgICAg
ICAgYXR0YWNoZWQgSERNSSBvciBMVkRTIGVuY29kZXIgY2hpcC4NCj4gPiAgDQo+ID4gKyAgcG93
ZXItZG9tYWluczoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICByZXF1aXJlZDoN
Cj4gPiAgICAtIGNvbXBhdGlibGUNCj4gPiAgICAtIHJlZw0KPiA+IEBAIC02NCw2ICs2Nyw3IEBA
IHJlcXVpcmVkOg0KPiA+ICAgIC0gY2xvY2tzDQo+ID4gICAgLSBjbG9jay1uYW1lcw0KPiA+ICAg
IC0gcG9ydA0KPiA+ICsgIC0gcG93ZXItZG9tYWlucw0KPiA+ICANCj4gPiAgYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlDQo+ID4gIA0KPiA+IEBAIC03MSwxMSArNzUsMTMgQEAgZXhhbXBsZXM6
DQo+ID4gICAgLSB8DQo+ID4gICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvYXJtLWdpYy5oPg0KPiA+ICAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2Nr
L210ODE3My1jbGsuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tdDgx
ODMtcG93ZXIuaD4NCj4gDQo+IFdoeSBkbyB5b3UgaW5jbHVkZSBtdDgxODMgcG93ZXIgaGVhZGVy
IGZpbGUgZm9yIG10ODE3MyBkcGkgbm9kZT8NCj4gDQo+IFJlZ2FyZHMsDQo+IENLDQo+IA0KPiA+
ICANCj4gPiAgICAgIGRwaTA6IGRwaUAxNDAxZDAwMCB7DQo+ID4gICAgICAgICAgY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDgxNzMtZHBpIjsNCj4gPiAgICAgICAgICByZWcgPSA8MHgxNDAxZDAw
MCAweDEwMDA+Ow0KPiA+ICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxOTQgSVJRX1RZ
UEVfTEVWRUxfTE9XPjsNCj4gPiArICAgICAgICBwb3dlci1kb21haW5zID0gPCZzcG0gTVQ4MTcz
X1BPV0VSX0RPTUFJTl9NTT47DQo+ID4gICAgICAgICAgY2xvY2tzID0gPCZtbXN5cyBDTEtfTU1f
RFBJX1BJWEVMPiwNCj4gPiAgICAgICAgICAgICAgIDwmbW1zeXMgQ0xLX01NX0RQSV9FTkdJTkU+
LA0KPiA+ICAgICAgICAgICAgICAgPCZhcG1peGVkc3lzIENMS19BUE1JWEVEX1RWRFBMTD47DQo+
IA0KPiANCg0KSGkgZnBhcmVudDoNCg0KSSB0aGluayBDSydzIHN1Z2dlc3Rpb24sIHByb2JhYmx5
IGJlY2F1c2UgeW91IGluY2x1ZGVkIHRoZSB3cm9uZyBoZWFkZXINCmZpbGUgZm9yIHBvd2VyLg0K
QmVjYXVzZSBJIGRpZCBub3QgZmluZCB0aGUgZGVmaW5pdGlvbiBvZiBNVDgxNzNfUE9XRVJfRE9N
QUlOX01NIGluIHRoZQ0KcGF0aCBvZiBkdC1iaW5kaW5ncy9wb3dlci9tdDgxODMtcG93ZXIuaCwg
aXQgd2FzIGRlZmluZWQgaW4gZHQtDQpiaW5kaW5ncy9wb3dlci9tdDgxNzMtcG93ZXIuaC4NClBs
ZWFzZSBkaXNjdXNzIGlmIHlvdSBoYXZlIGRpZmZlcmVudCBvcGluaW9ucy4NCg0KQmVzdCBSZWdh
cmRzIQ0KeGlubGVpDQo=


