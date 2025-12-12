Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C3DD44149
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Dec 2025 08:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcndyc0Eo2W6Gn4wPAsR2c5zerOO/qUcd+SlLXMeGTk=; b=ogVzY7S+xhm3Kv/OouA4cbwMJg
	jx/9RJXTZap45FcwhWlFsVLT7PmNdGEnlrYqIOoDgIQXZ4uFj2P9Pdc4fuSt2i6c2tNzxkWN9QuEl
	83z4FVnLpqkvOgTWuA5PHVa2UF/avavyjOr/ZM+SjouM1OCZ8qFJP9h4qj5CTW8VV1cqruhQmsy6z
	IyExCyKh70xYaWbxcIVvc+UrZOJQL2i0f+fRaBGADFQ2FAoupKD+bNjApld7VoqmPAdTNo1DXxJiq
	Ib/h/cL7OwbUTLyaSZhuT8hfEzRBror8pSc/g3Fk64cP12NkvgDTaVF0a+S+U58HqPDNgt4qOp5nB
	TjbJQiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTycr-00000000HBb-3ftj;
	Fri, 12 Dec 2025 08:35:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTycp-00000000HB6-1cIN
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Dec 2025 08:35:44 +0000
X-UUID: 886ad128d73511f09f706fa2197c6ceb-20251212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=kcndyc0Eo2W6Gn4wPAsR2c5zerOO/qUcd+SlLXMeGTk=;
	b=r3oxfyRbSk6UBkvamsza/6gOiQuEbf0kVu6WqGN6mXqRdAZp6GQ8iGSTVcBwpA3oXJN5a491x9fEDwibtcjTXD9Vria4GniYO+XMlaDz4PmVMMUzjAvfEwRlhBE9ZwYaZ/DQxp8MbZ7fiEqGO9+7xSm8XICQ108hjXPPgB69liw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e7e43098-3e3d-4034-8418-c5a0684f6278,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:bb48b202-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|836|888|898,TC:-5,Co
	ntent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 886ad128d73511f09f706fa2197c6ceb-20251212
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1500325483; Fri, 12 Dec 2025 01:35:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 16:35:34 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Fri, 12 Dec 2025 16:35:34 +0800
Message-ID: <ccdd65f17f0b8da580b615ab959478fa412376cf.camel@mediatek.com>
Subject: Re: [PATCH mt76 2/7] wifi: mt76: mt7996: fix the behavior of radar
 detection
From: Shayne Chen <shayne.chen@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, linux-wireless
	<linux-wireless@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>
Date: Fri, 12 Dec 2025 16:35:34 +0800
In-Reply-To: <aTgF2MVHFo9fNxHQ@lore-desk>
References: <20251125034639.1416214-1-shayne.chen@mediatek.com>
	 <20251125034639.1416214-2-shayne.chen@mediatek.com>
	 <aTgF2MVHFo9fNxHQ@lore-desk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_003543_438298_874C3D08 
X-CRM114-Status: GOOD (  23.62  )
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

T24gVHVlLCAyMDI1LTEyLTA5IGF0IDEyOjE5ICswMTAwLCBMb3JlbnpvIEJpYW5jb25pIHdyb3Rl
Og0KPiBPbiBOb3YgMjUsIFNoYXluZSBDaGVuIHdyb3RlOg0KPiA+IEZyb206IFN0YW5sZXlZUCBX
YW5nIDxTdGFubGV5WVAuV2FuZ0BtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gUkREX0RFVF9NT0RF
IGlzIGEgZmlybXdhcmUgY29tbWFuZCBpbnRlbmRlZCBmb3IgdGVzdGluZyBhbmQgZG9lcw0KPiA+
IG5vdA0KPiA+IHBhdXNlIFRYIGFmdGVyIHJhZGFyIGRldGVjdGlvbiwgc28gcmVtb3ZlIGl0IGZy
b20gdGhlIG5vcm1hbCBmbG93Ow0KPiA+IGluc3RlYWQsIHVzZSB0aGUgTUFDX0VOQUJMRV9DVFJM
IGZpcm13YXJlIGNvbW1hbmQgdG8gcmVzdW1lIFRYDQo+ID4gYWZ0ZXINCj4gPiB0aGUgcmFkYXIt
dHJpZ2dlcmVkIGNoYW5uZWwgc3dpdGNoIGNvbXBsZXRlcy4NCj4gPiANCj4gPiBGaXhlczogMTUy
OWUzMzVmOTNkICgid2lmaTogbXQ3NjogbXQ3OTk2OiByZXdvcmsgcmFkYXIgSFdSREQgaWR4IikN
Cj4gPiBDby1kZXZlbG9wZWQtYnk6IFNoYXluZSBDaGVuIDxzaGF5bmUuY2hlbkBtZWRpYXRlay5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2hheW5lIENoZW4gPHNoYXluZS5jaGVuQG1lZGlhdGVr
LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFubGV5WVAgV2FuZyA8U3RhbmxleVlQLldhbmdA
bWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IMKgLi4uL25ldC93aXJlbGVzcy9tZWRpYXRlay9t
dDc2L210Nzk5Ni9tYWMuY8KgwqAgfMKgIDggKy0tLQ0KPiA+IMKgLi4uL25ldC93aXJlbGVzcy9t
ZWRpYXRlay9tdDc2L210Nzk5Ni9tYWluLmPCoCB8IDIwICsrKysrKysrDQo+ID4gwqAuLi4vbmV0
L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3OTk2L21jdS5jwqDCoCB8IDQ2DQo+ID4gKysrKysr
KysrKysrKysrKy0tLQ0KPiA+IMKgLi4uL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210Nzk5
Ni9tY3UuaMKgwqAgfMKgIDEgKw0KPiA+IMKgLi4uL3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3
OTk2L210Nzk5Ni5owqDCoMKgIHzCoCAyICsNCj4gPiDCoDUgZmlsZXMgY2hhbmdlZCwgNjUgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3OTk2L21jdS5jDQo+ID4gYi9k
cml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210Nzk5Ni9tY3UuYw0KPiA+IGluZGV4
IDdiZTAzYmJmMzRkNC4uYzE4YzgwOWFjNzdhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbmV0
L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3OTk2L21jdS5jDQo+ID4gKysrIGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5OTYvbWN1LmMNCj4gPiBAQCAtNTIwLDI0ICs1
MjAsMzIgQEAgbXQ3OTk2X21jdV9yeF9yYWRhcl9kZXRlY3RlZChzdHJ1Y3QNCj4gPiBtdDc5OTZf
ZGV2ICpkZXYsIHN0cnVjdCBza19idWZmICpza2IpDQo+ID4gwqAJCWJyZWFrOw0KPiA+IMKgCWNh
c2UgTVRfUkREX0lEWF9CQUNLR1JPVU5EOg0KPiA+IMKgCQlpZiAoIWRldi0+cmRkMl9waHkpDQo+
ID4gLQkJCXJldHVybjsNCj4gPiArCQkJZ290byBlcnI7DQo+ID4gwqAJCW1waHkgPSBkZXYtPnJk
ZDJfcGh5LT5tdDc2Ow0KPiA+IMKgCQlicmVhazsNCj4gPiDCoAlkZWZhdWx0Og0KPiA+IC0JCWRl
dl9lcnIoZGV2LT5tdDc2LmRldiwgIlVua25vd24gUkREIGlkeCAlZFxuIiwgci0NCj4gPiA+cmRk
X2lkeCk7DQo+ID4gLQkJcmV0dXJuOw0KPiA+ICsJCWdvdG8gZXJyOw0KPiA+IMKgCX0NCj4gPiDC
oA0KPiA+IMKgCWlmICghbXBoeSkNCj4gPiAtCQlyZXR1cm47DQo+ID4gKwkJZ290byBlcnI7DQo+
ID4gwqANCj4gPiAtCWlmIChyLT5yZGRfaWR4ID09IE1UX1JERF9JRFhfQkFDS0dST1VORCkNCj4g
PiArCWlmIChyLT5yZGRfaWR4ID09IE1UX1JERF9JRFhfQkFDS0dST1VORCkgew0KPiA+IMKgCQlj
Zmc4MDIxMV9iYWNrZ3JvdW5kX3JhZGFyX2V2ZW50KG1waHktPmh3LT53aXBoeSwNCj4gPiDCoAkJ
CQkJCSZkZXYtDQo+ID4gPnJkZDJfY2hhbmRlZiwNCj4gPiDCoAkJCQkJCUdGUF9BVE9NSUMpOw0K
PiA+IC0JZWxzZQ0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQlzdHJ1Y3QgbXQ3OTk2X3BoeSAqcGh5
ID0gbXBoeS0+cHJpdjsNCj4gPiArDQo+ID4gKwkJcGh5LT5yZGRfdHhfcGF1c2VkID0gdHJ1ZTsN
Cj4gPiDCoAkJaWVlZTgwMjExX3JhZGFyX2RldGVjdGVkKG1waHktPmh3LCBOVUxMKTsNCj4gPiAr
CX0NCj4gPiDCoAlkZXYtPmh3X3BhdHRlcm4rKzsNCj4gPiArDQo+ID4gKwlyZXR1cm47DQo+ID4g
Kw0KPiA+ICtlcnI6DQo+ID4gKwlkZXZfZXJyKGRldi0+bXQ3Ni5kZXYsICJJbnZhbGlkIFJERCBp
ZHggJWRcbiIsIHItDQo+ID4gPnJkZF9pZHgpOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gwqBzdGF0
aWMgdm9pZA0KPiA+IEBAIC00NjEwLDYgKzQ2MTgsMzIgQEAgaW50IG10Nzk5Nl9tY3Vfc2V0X3Jh
ZGlvX2VuKHN0cnVjdA0KPiA+IG10Nzk5Nl9waHkgKnBoeSwgYm9vbCBlbmFibGUpDQo+ID4gwqAJ
CQkJICZyZXEsIHNpemVvZihyZXEpLCB0cnVlKTsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+ICtpbnQg
bXQ3OTk2X21jdV9yZGRfcmVzdW1lX3R4KHN0cnVjdCBtdDc5OTZfcGh5ICpwaHkpDQo+ID4gK3sN
Cj4gPiArCXN0cnVjdCB7DQo+ID4gKwkJdTggYmFuZF9pZHg7DQo+ID4gKwkJdTggX3JzdlszXTsN
Cj4gPiArDQo+ID4gKwkJX19sZTE2IHRhZzsNCj4gPiArCQlfX2xlMTYgbGVuOw0KPiA+ICsJCXU4
IG1hY19lbmFibGU7DQo+ID4gKwkJdTggX3JzdjJbM107DQo+ID4gKwl9IF9fcGFja2VkIHJlcSA9
IHsNCj4gPiArCQkuYmFuZF9pZHggPSBwaHktPm10NzYtPmJhbmRfaWR4LA0KPiA+ICsJCS50YWcg
PQ0KPiA+IGNwdV90b19sZTE2KFVOSV9CQU5EX0NPTkZJR19NQUNfRU5BQkxFX0NUUkwpLA0KPiA+
ICsJCS5sZW4gPSBjcHVfdG9fbGUxNihzaXplb2YocmVxKSAtIDQpLA0KPiA+ICsJCS5tYWNfZW5h
YmxlID0gMiwNCj4gPiArCX07DQo+ID4gKw0KPiA+ICsJaWYgKCFwaHktPnJkZF90eF9wYXVzZWQp
DQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsJcGh5LT5yZGRfdHhfcGF1c2VkID0gZmFs
c2U7DQo+IA0KPiBzaG91bGQgeW91IGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgb2YgbXQ3Nl9tY3Vf
c2VuZF9tc2coKSBiZWZvcmUNCj4gc2V0dGluZw0KPiByZGRfdHhfcGF1c2VkIHRvIGZhbHNlIGhl
cmU/DQo+IA0KPiBSZWdhcmRzLA0KPiBMb3JlbnpvDQo+IA0KSGkgTG9yZW56bywNCg0KWWVzLCB3
aWxsIHBvc3QgdjIgdG8gZml4IGl0Lg0KDQpUaGFua3MsDQpTaGF5bmUNCj4gPiArDQo+ID4gKwly
ZXR1cm4gbXQ3Nl9tY3Vfc2VuZF9tc2coJnBoeS0+ZGV2LT5tdDc2LA0KPiA+IE1DVV9XTV9VTklf
Q01EKEJBTkRfQ09ORklHKSwNCj4gPiArCQkJCSAmcmVxLCBzaXplb2YocmVxKSwgdHJ1ZSk7DQo+
ID4gK30NCj4gPiArDQo+ID4gwqBpbnQgbXQ3OTk2X21jdV9yZGRfY21kKHN0cnVjdCBtdDc5OTZf
ZGV2ICpkZXYsIGludCBjbWQsIHU4DQo+ID4gcmRkX2lkeCwgdTggdmFsKQ0KPiA+IMKgew0KPiA+
IMKgCXN0cnVjdCB7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlh
dGVrL210NzYvbXQ3OTk2L21jdS5oDQo+ID4gYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRl
ay9tdDc2L210Nzk5Ni9tY3UuaA0KPiA+IGluZGV4IGZjOGIwOWU3NmYwMS4uNWIzNTk3Y2E3OWJl
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3
OTk2L21jdS5oDQo+ID4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9t
dDc5OTYvbWN1LmgNCj4gPiBAQCAtODM1LDYgKzgzNSw3IEBAIGVudW0gew0KPiA+IMKgZW51bSB7
DQo+ID4gwqAJVU5JX0JBTkRfQ09ORklHX1JBRElPX0VOQUJMRSwNCj4gPiDCoAlVTklfQkFORF9D
T05GSUdfUlRTX1RIUkVTSE9MRCA9IDB4MDgsDQo+ID4gKwlVTklfQkFORF9DT05GSUdfTUFDX0VO
QUJMRV9DVFJMID0gMHgwYywNCj4gPiDCoH07DQo+ID4gwqANCj4gPiDCoGVudW0gew0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210Nzk5Ni9tdDc5
OTYuaA0KPiA+IGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5OTYvbXQ3
OTk2LmgNCj4gPiBpbmRleCA3YTg4NDMxMTgwMGUuLmQzMTg2NGY5NzNjYyAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210Nzk5Ni9tdDc5OTYuaA0K
PiA+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3OTk2L210Nzk5
Ni5oDQo+ID4gQEAgLTM3Nyw2ICszNzcsNyBAQCBzdHJ1Y3QgbXQ3OTk2X3BoeSB7DQo+ID4gwqAN
Cj4gPiDCoAlib29sIGhhc19hdXhfcng7DQo+ID4gwqAJYm9vbCBjb3VudGVyX3Jlc2V0Ow0KPiA+
ICsJYm9vbCByZGRfdHhfcGF1c2VkOw0KPiA+IMKgfTsNCj4gPiDCoA0KPiA+IMKgc3RydWN0IG10
Nzk5Nl9kZXYgew0KPiA+IEBAIC03MjYsNiArNzI3LDcgQEAgaW50IG10Nzk5Nl9tY3VfZ2V0X3Rl
bXBlcmF0dXJlKHN0cnVjdA0KPiA+IG10Nzk5Nl9waHkgKnBoeSk7DQo+ID4gwqBpbnQgbXQ3OTk2
X21jdV9zZXRfdGhlcm1hbF90aHJvdHRsaW5nKHN0cnVjdCBtdDc5OTZfcGh5ICpwaHksIHU4DQo+
ID4gc3RhdGUpOw0KPiA+IMKgaW50IG10Nzk5Nl9tY3Vfc2V0X3RoZXJtYWxfcHJvdGVjdChzdHJ1
Y3QgbXQ3OTk2X3BoeSAqcGh5LCBib29sDQo+ID4gZW5hYmxlKTsNCj4gPiDCoGludCBtdDc5OTZf
bWN1X3NldF90eHBvd2VyX3NrdShzdHJ1Y3QgbXQ3OTk2X3BoeSAqcGh5KTsNCj4gPiAraW50IG10
Nzk5Nl9tY3VfcmRkX3Jlc3VtZV90eChzdHJ1Y3QgbXQ3OTk2X3BoeSAqcGh5KTsNCj4gPiDCoGlu
dCBtdDc5OTZfbWN1X3JkZF9jbWQoc3RydWN0IG10Nzk5Nl9kZXYgKmRldiwgaW50IGNtZCwgdTgN
Cj4gPiByZGRfaWR4LCB1OCB2YWwpOw0KPiA+IMKgaW50IG10Nzk5Nl9tY3VfcmRkX2JhY2tncm91
bmRfZW5hYmxlKHN0cnVjdCBtdDc5OTZfcGh5ICpwaHksDQo+ID4gwqAJCQkJwqDCoMKgwqAgc3Ry
dWN0IGNmZzgwMjExX2NoYW5fZGVmDQo+ID4gKmNoYW5kZWYpOw0KPiA+IC0tIA0KPiA+IDIuNTEu
MA0KPiA+IA0K


