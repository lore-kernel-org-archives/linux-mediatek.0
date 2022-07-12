Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B843C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 04:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQFZ3FQ4z+umEAnTKkIJ3zh+vGyJ2+S2LZI0h7H2M+I=; b=1KuR9bM21ODyBy//DD2TS6/1/M
	4zolo5rp941fAmuc+jMms1QTF4N34hCdpLr55hsWUUGsOxgkb2B9nG4Q3p/j3sddDXmt4A+WAboDb
	JFFa9VRfDuYuKWzaYI8OGoAdfSAeoeWOJxfaDfAgkVDzET2MVAjieUjCKGuvILhTf9aoCZPKdAX2p
	nrrtXVv0stetTVVVpz2ubB2JHjAtck5NQ8ydNV5PQ0YvJJxklZeoivJI2eNVEFJ0X86eIzTinylYJ
	YHrWV52W1A3AiAccqMXi2VwH9Egf1k35FY9pNePoCgp/UI/eU/I6Y0Bfdr+SZfwaav+1PgI3BcPMz
	GJwxthtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB7U5-007LGk-In; Tue, 12 Jul 2022 04:26:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB7Tu-007L4M-M5; Tue, 12 Jul 2022 04:26:44 +0000
X-UUID: ad30e437489e4b7093c6e02173ff129c-20220711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=sQFZ3FQ4z+umEAnTKkIJ3zh+vGyJ2+S2LZI0h7H2M+I=;
	b=PdyTRAgIOj49buXd3V2CtiKNC/rSYSjg2lQ3bqqa7rhAWkwcOHbBthvPHqfot0AMyt4oLqEMLw7LW8Ud3SJk8s6jUUzUDzLtuZUS68Tbqb2XFmX9xqMrb2CQlW4EIxC8vak6Qb3j5JYOSwbzFzbrDfKg3zaSeuSpCLiVkD2hy/g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:d0e63295-178b-4b8d-9b97-ed78ee9b6d13,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:7aefb732-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ad30e437489e4b7093c6e02173ff129c-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1879492413; Mon, 11 Jul 2022 21:26:33 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 12 Jul 2022 12:16:30 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Jul 2022 12:16:29 +0800
Message-ID: <a31e232115019f6ec670c4955ae8bde7696918ac.camel@mediatek.com>
Subject: Re: [PATCH 1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>,
	<p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
	<yongqiang.niu@mediatek.com>, <enric.balletbo@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Tue, 12 Jul 2022 12:17:00 +0800
In-Reply-To: <65d390ab-7f80-8bd4-66f5-442c46da4f00@gmail.com>
References: <1656645344-12062-1-git-send-email-xinlei.lee@mediatek.com>
	 <1656645344-12062-2-git-send-email-xinlei.lee@mediatek.com>
	 <65d390ab-7f80-8bd4-66f5-442c46da4f00@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_212642_749607_BB29E84D 
X-CRM114-Status: GOOD (  19.43  )
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

T24gV2VkLCAyMDIyLTA3LTA2IGF0IDE2OjIwICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMDEvMDcvMjAyMiAwNToxNSwgeGlubGVpLmxlZUBtZWRpYXRlay5jb20gd3Jv
dGU6DQo+ID4gRnJvbTogWGlubGVpIExlZSA8eGlubGVpLmxlZUBtZWRpYXRlay5jb20+DQo+ID4g
DQo+ID4gQWRkIG1tc3lzIGZ1bmMgdG8gbWFuaXB1bGF0ZSBkcGkgb3V0cHV0IGZvcm1hdCBjb25m
aWcgZm9yIE1UODE4Ni4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFv
LnNoaUBtZWRpYXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWGlubGVpIExlZSA8eGlubGVp
LmxlZUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL3NvYy9tZWRpYXRlay9t
dDgxODYtbW1zeXMuaCAgICB8IDEgKw0KPiA+ICAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1t
c3lzLmMgICAgICAgfCA4ICsrKysrKysrDQo+ID4gICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRl
ay9tdGstbW1zeXMuaCB8IDIgKysNCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxODYt
bW1zeXMuaA0KPiA+IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXQ4MTg2LW1tc3lzLmgNCj4gPiBp
bmRleCBlYjFhZDljMzdhOWMuLjBiNDUwYjAwYjgyOSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L3NvYy9tZWRpYXRlay9tdDgxODYtbW1zeXMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlh
dGVrL210ODE4Ni1tbXN5cy5oDQo+ID4gQEAgLTMsNiArMyw3IEBADQo+ID4gICAjaWZuZGVmIF9f
U09DX01FRElBVEVLX01UODE4Nl9NTVNZU19IDQo+ID4gICAjZGVmaW5lIF9fU09DX01FRElBVEVL
X01UODE4Nl9NTVNZU19IDQo+ID4gICANCj4gPiArI2RlZmluZSBNVDgxODZfTU1TWVNfRFVNTVkw
CQkJMFg0MDANCj4gDQo+IEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhlIGRhdGFzaGVldCwgYnV0
IEkgcmVhbGx5IHdvbmRlciBpZiBpdCdzDQo+IHJlYWxseSBjYWxsZWQgDQo+IGR1bW15MC4gSWYg
c28sIHlvdSB3b3VsZCBuZWVkIHRvIGV4cGxhaW4gaW4gbW9yZSBkZXRhaWwgaW4gdGhlIGNvbW1p
dA0KPiBtZXNzYWdlLg0KPiANCj4gUmVnYXJkcywNCj4gTWF0dGhpYXMNCj4gDQo+ID4gICAjZGVm
aW5lIE1UODE4Nl9NTVNZU19PVkxfQ09OCQkJMHhGMDQNCj4gPiAgICNkZWZpbmUgTVQ4MTg2X01N
U1lTX09WTDBfQ09OX01BU0sJCQkweDMNCj4gPiAgICNkZWZpbmUgTVQ4MTg2X01NU1lTX09WTDBf
MkxfQ09OX01BU0sJCQkweEMNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLW1tc3lzLmMNCj4gPiBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQo+ID4g
aW5kZXggMmIwYjgwNWM2NWRkLi5kZTNmMTFjYjkzMWYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCj4gPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstbW1zeXMuYw0KPiA+IEBAIC0yNTIsNiArMjUyLDE0IEBAIHZvaWQgbXRrX21tc3lzX2Rk
cF9kaXNjb25uZWN0KHN0cnVjdCBkZXZpY2UNCj4gPiAqZGV2LA0KPiA+ICAgfQ0KPiA+ICAgRVhQ
T1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2RkcF9kaXNjb25uZWN0KTsNCj4gPiAgIA0KPiA+ICt2
b2lkIG10a19tbXN5c19kZHBfZHBpX2NvbmZpbmcoc3RydWN0IGRldmljZSAqZGV2LCB1MzIgbWFz
aywgdTMyDQo+ID4gdmFsLA0KPiA+ICsJCQkgICAgICAgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3Br
dCkNCj4gPiArew0KPiA+ICsJbXRrX21tc3lzX3VwZGF0ZV9iaXRzKGRldl9nZXRfZHJ2ZGF0YShk
ZXYpLA0KPiA+IE1UODE4Nl9NTVNZU19EVU1NWTAsIG1hc2ssDQo+ID4gKwkJCSAgICAgIHZhbCwg
Y21kcV9wa3QpOw0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKG10a19tbXN5c19kZHBf
ZHBpX2NvbmZpbmcpOw0KPiA+ICsNCj4gPiAgIHZvaWQgbXRrX21tc3lzX21lcmdlX2FzeW5jX2Nv
bmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBpZHgsDQo+ID4gaW50IHdpZHRoLCBpbnQgaGVp
Z2h0LA0KPiA+ICAgCQkJCSAgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkNCj4gPiAgIHsNCj4g
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgNCj4g
PiBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oDQo+ID4gaW5kZXggMzQz
ZTA5M2YwZmMzLi40MGM1MzhjMDY2NGIgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9z
b2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgNCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRp
YXRlay9tdGstbW1zeXMuaA0KPiA+IEBAIC05MCw0ICs5MCw2IEBAIHZvaWQgbXRrX21tc3lzX21p
eGVyX2luX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlDQo+ID4gKmRldiwgaW50IGlkeCwgYm9vbCBhbHBo
YV9zZWwsIHUxNg0KPiA+ICAgdm9pZCBtdGtfbW1zeXNfbWl4ZXJfaW5fY2hhbm5lbF9zd2FwKHN0
cnVjdCBkZXZpY2UgKmRldiwgaW50IGlkeCwNCj4gPiBib29sIGNoYW5uZWxfc3dhcCwNCj4gPiAg
IAkJCQkgICAgIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpOw0KPiA+ICAgDQo+ID4gK3ZvaWQg
bXRrX21tc3lzX2RkcF9kcGlfY29uZmluZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiBtYXNrLCB1
MzINCj4gPiB2YWwsDQo+ID4gKwkJCSAgICAgICBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KTsN
Cj4gPiAgICNlbmRpZiAvKiBfX01US19NTVNZU19IICovDQoNCkhpIE1hdHRoaWFzDQoNClRoYW5r
IHlvdSBmb3IgeW91ciBzdWdnZXN0aW9uLg0KSSdtIHNvcnJ5IGZvciBub3QgZXhwbGFpbmluZyB3
aGF0IHRoaXMgcmVnaXN0ZXIgZG9lcyBpbiBkZXRhaWwsIEknbGwNCmV4cGxhaW4gaXQgaW4gdGhl
IG5leHQgY29tbWl0IG1lc3NhZ2UuDQoNCkJlc3QgUmVnYXJkcyENCnhpbmxlaQ0K


