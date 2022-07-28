Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCA5C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7h/2iU7RE6jW/zp+49ANTe0IZCuacykoZlFu05o6O7U=; b=vCTN+DACzPAFIgvYkbNoWk07eh
	nvEbdjjJgfMvqHAi63beUFefjltvpYNjEQWn8xVI74fguOb0TZ6MEpEabKDdDbxl3ZlmcHOwljZi9
	j0u7HfNt7qhL4da7KHZzyGwXa8xIXwkRX/TnLVsA3quLVMbBkWls7uwlCJi3+LTtyfkJ7JkQkke42
	dLdPFH7rdSfxc+gOKspnvG9bXsAJ+/ICi/QRurQzBi7eGJFyJ99/4OHcuCZNf6NxwscW+A9ghAmo+
	IyB3wRmaKdTboTbdnioSz4vaxUMaWsJ4o288KJyZUHaUGUMk1OqJuXyYrGNlEnH6v53UdHUTQQnEU
	1zQ3l0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGy7r-005TQM-5u; Thu, 28 Jul 2022 07:40:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGy7S-005TFD-Ob; Thu, 28 Jul 2022 07:39:45 +0000
X-UUID: bde39e66c3cf4d3c8d5c2f53d4e68b0c-20220728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=7h/2iU7RE6jW/zp+49ANTe0IZCuacykoZlFu05o6O7U=;
	b=Bz1gLX3uE4mA2Mz4oSOfnLFGnnHmHK+AZfloB4EttdR+gBYRlnP5zcy+Zr6zrnsItrW6BONG1WccmYfEEHmQSILfhYaMFSuPanGVS/TR+YXnivcoRT498B7IiP2tvRkOpyfKtoWfxIxbC0ZrsclZFdbdXqYHVYh7EpZQRgSixaw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:52ab472f-2ed9-426c-a88b-d63341c065e6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:d8a28fd0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: bde39e66c3cf4d3c8d5c2f53d4e68b0c-20220728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 646383231; Thu, 28 Jul 2022 00:39:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 28 Jul 2022 14:58:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 14:58:54 +0800
Message-ID: <3547dbe3cedfdd01dc751fc6be147d05119634ff.camel@mediatek.com>
Subject: Re: [PATCH v3 2/3] memory: mtk-smi: Add enable IOMMU SMC command
 for MM master
From: Yong Wu <yong.wu@mediatek.com>
To: Chengci.Xu <chengci.xu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>, Rob Herring
	<robh+dt@kernel.org>
Date: Thu, 28 Jul 2022 14:58:54 +0800
In-Reply-To: <20220727104541.7309-3-chengci.xu@mediatek.com>
References: <20220727104541.7309-1-chengci.xu@mediatek.com>
	 <20220727104541.7309-3-chengci.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_003942_832785_BFE6ED8B 
X-CRM114-Status: GOOD (  22.71  )
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

T24gV2VkLCAyMDIyLTA3LTI3IGF0IDE4OjQ1ICswODAwLCBDaGVuZ2NpLlh1IHdyb3RlOg0KPiBG
b3IgY29uY2VybnMgYWJvdXQgc2VjdXJpdHksIHRoZSByZWdpc3RlciB0byBlbmFibGUvZGlzYWJs
ZSBJT01NVSBvZg0KPiBTTUkgTEFSQiBzaG91bGQgb25seSBiZSBjb25maWd1cmVkIGluIHNlY3Vy
ZSB3b3JsZC4gVGh1cywgd2UgYWRkIHNvbWUNCj4gU01DIGNvbW1hbmQgZm9yIG11bHRpbWVkaWEg
bWFzdGVyIHRvIGVuYWJsZS9kaXNhYmxlIE1NIElPTU1VIGluIEFURg0KPiBieQ0KPiBzZXR0aW5n
IHRoZSByZWdpc3RlciBvZiBTTUkgTEFSQi4gVGhpcyBmdW5jdGlvbiBpcyBwcmVwYXJlZCBmb3IN
Cj4gTVQ4MTg4Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hlbmdjaS5YdSA8Y2hlbmdjaS54dUBt
ZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jICAgICAgICAg
ICAgICAgICB8IDExICsrKysrKysrKysrDQo+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9t
dGtfc2lwX3N2Yy5oIHwgIDMgKysrDQo+ICBpbmNsdWRlL3NvYy9tZWRpYXRlay9zbWkuaCAgICAg
ICAgICAgICAgIHwgIDcgKysrKysrKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jIGIvZHJpdmVy
cy9tZW1vcnkvbXRrLXNtaS5jDQo+IGluZGV4IGQ3Y2I3ZWFkMmFjNy4uNDFjZTY2YzM5MTIzIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lbW9yeS9tdGstc21pLmMNCj4gKysrIGIvZHJpdmVycy9t
ZW1vcnkvbXRrLXNtaS5jDQo+IEBAIC0zLDYgKzMsNyBAQA0KPiAgICogQ29weXJpZ2h0IChjKSAy
MDE1LTIwMTYgTWVkaWFUZWsgSW5jLg0KPiAgICogQXV0aG9yOiBZb25nIFd1IDx5b25nLnd1QG1l
ZGlhdGVrLmNvbT4NCj4gICAqLw0KPiArI2luY2x1ZGUgPGxpbnV4L2FybS1zbWNjYy5oPg0KPiAg
I2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2NvbXBvbmVudC5oPg0K
PiAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPg0KPiBAQCAtMTQsNiArMTUsNyBAQA0KPiAgI2lu
Y2x1ZGUgPGxpbnV4L29mX3BsYXRmb3JtLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiArI2luY2x1ZGUg
PGxpbnV4L3NvYy9tZWRpYXRlay9tdGtfc2lwX3N2Yy5oPg0KPiAgI2luY2x1ZGUgPHNvYy9tZWRp
YXRlay9zbWkuaD4NCj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9tZW1vcnkvbXQyNzAxLWxhcmIt
cG9ydC5oPg0KPiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL21lbW9yeS9tdGstbWVtb3J5LXBvcnQu
aD4NCj4gQEAgLTg5LDYgKzkxLDcgQEANCj4gICNkZWZpbmUgTVRLX1NNSV9GTEFHX1RIUlRfVVBE
QVRFCUJJVCgwKQ0KPiAgI2RlZmluZSBNVEtfU01JX0ZMQUdfU1dfRkxBRwkJQklUKDEpDQo+ICAj
ZGVmaW5lIE1US19TTUlfRkxBR19TTEVFUF9DVEwJCUJJVCgyKQ0KPiArI2RlZmluZSBNVEtfU01J
X0ZMQUdfU0VDX1JFRwkJQklUKDMpDQoNClJlbmFtZSBtb3JlIGRldGFpbGx5LiBUaGlzIGlzIGFi
b3V0IHRoZSBjb25maWd1cmluZyBwb3J0IHJlZ2lzdGVycy4NCg0Kc29tZXRoaW5nIGxpa2U6IE1U
S19TTUlfRkxBR19DRkdfUE9SVF9TRUNfQ1RMDQoNCj4gICNkZWZpbmUgTVRLX1NNSV9DQVBTKGZs
YWdzLCBfeCkJCSghISgoZmxhZ3MpICYgKF94KSkpDQo+ICANCj4gIHN0cnVjdCBtdGtfc21pX3Jl
Z19wYWlyIHsNCj4gQEAgLTIzNSw2ICsyMzgsNyBAQCBzdGF0aWMgdm9pZA0KPiBtdGtfc21pX2xh
cmJfY29uZmlnX3BvcnRfZ2VuMl9nZW5lcmFsKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIAlzdHJ1
Y3QgbXRrX3NtaV9sYXJiICpsYXJiID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ICAJdTMyIHJl
ZywgZmxhZ3NfZ2VuZXJhbCA9IGxhcmItPmxhcmJfZ2VuLT5mbGFnc19nZW5lcmFsOw0KPiAgCWNv
bnN0IHU4ICpsYXJib3N0ZCA9IGxhcmItPmxhcmJfZ2VuLT5vc3RkID8gbGFyYi0+bGFyYl9nZW4t
DQo+ID5vc3RkW2xhcmItPmxhcmJpZF0gOiBOVUxMOw0KPiArCXN0cnVjdCBhcm1fc21jY2NfcmVz
IHJlczsNCj4gIAlpbnQgaTsNCj4gIA0KPiAgCWlmIChCSVQobGFyYi0+bGFyYmlkKSAmIGxhcmIt
PmxhcmJfZ2VuLQ0KPiA+bGFyYl9kaXJlY3RfdG9fY29tbW9uX21hc2spDQo+IEBAIC0yNTksNiAr
MjYzLDEzIEBAIHN0YXRpYyB2b2lkDQo+IG10a19zbWlfbGFyYl9jb25maWdfcG9ydF9nZW4yX2dl
bmVyYWwoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgCQlyZWcgfD0gQkFOS19TRUwobGFyYi0+YmFu
a1tpXSk7DQo+ICAJCXdyaXRlbChyZWcsIGxhcmItPmJhc2UgKyBTTUlfTEFSQl9OT05TRUNfQ09O
KGkpKTsNCj4gIAl9DQo+ICsNCj4gKwlpZiAoTVRLX1NNSV9DQVBTKGZsYWdzX2dlbmVyYWwsIE1U
S19TTUlfRkxBR19TRUNfUkVHKSkgew0KPiArCQlhcm1fc21jY2Nfc21jKE1US19TSVBfS0VSTkVM
X0lPTU1VX0NPTlRST0wsDQo+IElPTU1VX0FURl9DTURfQ09ORklHX1NNSV9MQVJCLA0KPiArCQkJ
ICAgICAgbGFyYi0+bGFyYmlkLCAodTMyKSgqbGFyYi0+bW11KSwgMCwgMCwgMCwNCj4gMCwgJnJl
cyk7DQo+ICsJCWlmIChyZXMuYTAgIT0gMCkNCj4gKwkJCWRldl9lcnIoZGV2LCAiRW5hYmxlIGlv
bW11IGZhaWwsIHJldCAlbGRcbiIsDQo+IHJlcy5hMCk7DQo+ICsJfQ0KDQpJbiB0aGlzIGNhc2Us
IERvIHdlIHN0aWxsIG5lZWQgd3JpdGUgU01JX0xBUkJfTk9OU0VDX0NPTiBhYm92ZT8gSWYgbm8s
DQogIA0KICAgICAgaWYgKE1US19TTUlfQ0FQUyhmbGFnc19nZW5lcmFsLCBNVEtfU01JX0ZMQUdf
U0VDX1JFRykpIHsNCiAgICAgICAgICB4eA0KICAgICAgICAgIHJldHVybjsNCiAgICAgIH0NCiAg
ICAgIGFuZCBwdXQgdGhpcyBiZWZvcmUgdXBkYXRpbmcgU01JX0xBUkJfTk9OU0VDX0NPTi4NCg0K
SWYgeWVzLiB3ZSBzaG91bGQgYWRkIHNvbWUgY29tbWVudC4NCg0KQW5kLCBDb3VsZCB3ZSBpZ25v
cmUgdGhlIGZhaWwgcmVzdWx0PyANCg0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgY29uc3QgdTggbXRr
X3NtaV9sYXJiX210ODE5NV9vc3RkW11bU01JX0xBUkJfUE9SVF9OUl9NQVhdID0gew0KPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrX3NpcF9zdmMuaA0KPiBiL2lu
Y2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210a19zaXBfc3ZjLmgNCj4gaW5kZXggMDgyMzk4ZTBj
ZmIxLi4wNzYxMTI4YjQzNTQgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvc29jL21lZGlh
dGVrL210a19zaXBfc3ZjLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
X3NpcF9zdmMuaA0KPiBAQCAtMjIsNCArMjIsNyBAQA0KPiAgCUFSTV9TTUNDQ19DQUxMX1ZBTChB
Uk1fU01DQ0NfRkFTVF9DQUxMLCBNVEtfU0lQX1NNQ19DT05WRU5USU9OLA0KPiBcDQo+ICAJCQkg
ICBBUk1fU01DQ0NfT1dORVJfU0lQLCBmbl9pZCkNCj4gIA0KPiArLyogSU9NTVUgcmVsYXRlZCBT
TUMgY2FsbCAqLw0KPiArI2RlZmluZSBNVEtfU0lQX0tFUk5FTF9JT01NVV9DT05UUk9MCU1US19T
SVBfU01DX0NNRCgweDUxNCkNCj4gKw0KPiAgI2VuZGlmDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3NvYy9tZWRpYXRlay9zbWkuaCBiL2luY2x1ZGUvc29jL21lZGlhdGVrL3NtaS5oDQo+IGluZGV4
IDExZjdkNmI1OTY0Mi4uOGM3ODFiN2JkODhkIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3NvYy9t
ZWRpYXRlay9zbWkuaA0KPiArKysgYi9pbmNsdWRlL3NvYy9tZWRpYXRlay9zbWkuaA0KPiBAQCAt
OSw2ICs5LDEzIEBADQo+ICAjaW5jbHVkZSA8bGludXgvYml0b3BzLmg+DQo+ICAjaW5jbHVkZSA8
bGludXgvZGV2aWNlLmg+DQo+ICANCj4gKy8qIElPTU1VICYgU01JIEFURiBDTUQgKi8NCj4gKw0K
PiArZW51bSBJT01NVV9BVEZfQ01EIHsNCj4gKwlJT01NVV9BVEZfQ01EX0NPTkZJR19TTUlfTEFS
QiwJCS8qIEZvciBtbSBtYXN0ZXIgdG8NCj4gZW4vZGlzYWJsZSBpb21tdSAqLw0KPiArCUlPTU1V
X0FURl9DTURfQ09VTlQsDQoNCklPTU1VX0FURl9DTURfTUFYPw0KPiArfTsNCj4gKw0KDQpUaGlz
IGVudW0gb25seSBpcyB1c2VkIGluIElPTU1VIGFuZCBTTUkuIFB1dCBpdCBiZWxvdyBpbnNpZGUg
dGhlIG1hY3JvDQpDT05GSUdfTVRLX1NNSS4NCg0KDQo+ICAjaWYgSVNfRU5BQkxFRChDT05GSUdf
TVRLX1NNSSkNCj4gIA0KPiAgI2RlZmluZSBNVEtfU01JX01NVV9FTihwb3J0KQlCSVQocG9ydCkN
Cg==


