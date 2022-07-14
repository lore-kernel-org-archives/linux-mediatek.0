Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0D1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 02:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kd7LOSUHnty+mmCrCGbAAkLajMy4XSaOVbTJyHtoA8k=; b=sDqBvep4bVdKMK2JqxdtvtN1DZ
	sybHLeY2qTEplEkV45QB9D3PZJImx/CzbDcK1x0bSvopYcS2DOyMDpACfg0H87isDEhfTlblAoZpP
	PSEO8HGKqULrv2fIyPo1SWUI2SR+7db8zrSUFGZ5jYKinRCoYTZrpo0P+dS+97aNXm3N8Z6bXO5N+
	6TWUgPIZoc9yd3rjJ7y6SLgUybkX3llT6yGJmv6a7RjmO1NKMmezZoIlOZAfUmNj6LWNW0cCio/Qm
	zPvX07RkV5wArPxy7ciBMqgizuIO03Jjc4U5+Kgjv4KYgUrO21+b6ihyDEGdmL9tUuTKdS8yhVqsb
	EILuHWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBoI1-009xIu-Th; Thu, 14 Jul 2022 02:09:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBoHp-009xCv-OZ; Thu, 14 Jul 2022 02:09:07 +0000
X-UUID: 9b24f08ede6743d195b8411ac175fb5f-20220713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=kd7LOSUHnty+mmCrCGbAAkLajMy4XSaOVbTJyHtoA8k=;
	b=VzSCAQfqbhu4qJGFYIwltSSeUfp74ZycMuXbJumlbxU3BcP51Bc6RLdeU+NhzsSw46HA/a6KRAbHRzisXZ3x1CpeDpm2fpkJ1u4AsmolN1RkAfr8pI9zPjZ2TM1PezJ/OhyztNCDflrtaG6GcEed5LEchl+TIicqwpLLAw/nJgU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:7867f10f-5b0d-4e90-8ad4-062eca6952d2,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:7cd5ec32-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9b24f08ede6743d195b8411ac175fb5f-20220713
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 710886523; Wed, 13 Jul 2022 19:08:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 14 Jul 2022 09:18:55 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Jul 2022 09:18:54 +0800
Message-ID: <1d30edbe1761bea511f6619d934e550e05ac4f7a.camel@mediatek.com>
Subject: Re: [PATCH net v4 1/3] stmmac: dwmac-mediatek: fix clock issue
From: Biao Huang <biao.huang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, David Miller
	<davem@davemloft.net>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <macpaul.lin@mediatek.com>, Jisheng
 Zhang <jszhang@kernel.org>, Mohammad Athari Bin Ismail
	<mohammad.athari.ismail@intel.com>
Date: Thu, 14 Jul 2022 09:18:54 +0800
In-Reply-To: <c8fdfa7b-f4eb-8308-4064-b868ce945e3a@gmail.com>
References: <20220713101002.10970-1-biao.huang@mediatek.com>
	 <20220713101002.10970-2-biao.huang@mediatek.com>
	 <c8fdfa7b-f4eb-8308-4064-b868ce945e3a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_190905_830428_CD6F0AEC 
X-CRM114-Status: GOOD (  26.23  )
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

RGVhciBNYXR0aGlhcywNCglUaGFua3MgZm9yIHlvdXIgY29tbWVudHN+DQoNCk9uIFdlZCwgMjAy
Mi0wNy0xMyBhdCAxNDoxMSArMDIwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToNCj4gDQo+IE9u
IDEzLzA3LzIwMjIgMTI6MTAsIEJpYW8gSHVhbmcgd3JvdGU6DQo+ID4gVGhlIHBtX3J1bnRpbWUg
dGFrZXMgY2FyZSBvZiB0aGUgY2xvY2sgaGFuZGxpbmcgaW4gY3VycmVudA0KPiA+IHN0bW1hYyBk
cml2ZXJzLCBhbmQgZHdtYWMtbWVkaWF0ZWsgaW1wbGVtZW50IHRoZQ0KPiA+IG1lZGlhdGVrX2R3
bWFjX2Nsa3NfY29uZmlnKCkgYXMgdGhlIGNhbGxiYWNrIGZvciBwbV9ydW50aW1lLg0KPiA+IA0K
PiA+IFRoZW4sIHN0cmlwcGluZyBkdXBsaWNhdGVkIGNsb2NrcyBoYW5kbGluZyBpbiBvbGQgaW5p
dCgpL2V4aXQoKQ0KPiA+IHRvIGZpeCBjbG9jayBpc3N1ZSBpbiBzdXNwZW5kL3Jlc3VtZSB0ZXN0
Lg0KPiA+IA0KPiA+IEFzIHRvIGNsb2NrcyBpbiBwcm9iZS9yZW1vdmUsIHZlbmRvciBuZWVkIHN5
bW1ldHJpYyBoYW5kbGluZyB0bw0KPiA+IGVuc3VyZSBjbG9ja3MgYmFsYW5jZS4NCj4gPiANCj4g
PiBUZXN0IHBhc3MsIGluY2x1ZGluZyBzdXNwZW5kL3Jlc3VtZSBhbmQga28gaW5zZXJ0aW9uL3Jl
bW92ZS4NCj4gPiANCj4gPiBGaXhlczogMzE4NmJkYWQ5N2Q1ICgic3RtbWFjOiBkd21hYy1tZWRp
YXRlazogYWRkIHBsYXRmb3JtIGxldmVsDQo+ID4gY2xvY2tzIG1hbmFnZW1lbnQiKQ0KPiA+IFNp
Z25lZC1vZmYtYnk6IEJpYW8gSHVhbmcgPGJpYW8uaHVhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0t
LQ0KPiA+ICAgLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMgIHwg
NDkgKysrKysrKystLS0tDQo+ID4gLS0tLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIxIGlu
c2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jDQo+ID4gYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jDQo+ID4g
aW5kZXggNmZmODhkZjU4NzY3Li5jYThhYjI5MDAxM2MgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMNCj4g
PiBAQCAtNTc2LDMyICs1NzYsNyBAQCBzdGF0aWMgaW50IG1lZGlhdGVrX2R3bWFjX2luaXQoc3Ry
dWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2LCB2b2lkICpwcml2KQ0KPiA+ICAgCQl9DQo+
ID4gICAJfQ0KPiA+ICAgDQo+ID4gLQlyZXQgPSBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZSh2YXJp
YW50LT5udW1fY2xrcywgcGxhdC0+Y2xrcyk7DQo+ID4gLQlpZiAocmV0KSB7DQo+ID4gLQkJZGV2
X2VycihwbGF0LT5kZXYsICJmYWlsZWQgdG8gZW5hYmxlIGNsa3MsIGVyciA9ICVkXG4iLA0KPiA+
IHJldCk7DQo+ID4gLQkJcmV0dXJuIHJldDsNCj4gPiAtCX0NCj4gPiAtDQo+ID4gLQlyZXQgPSBj
bGtfcHJlcGFyZV9lbmFibGUocGxhdC0+cm1paV9pbnRlcm5hbF9jbGspOw0KPiA+IC0JaWYgKHJl
dCkgew0KPiA+IC0JCWRldl9lcnIocGxhdC0+ZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBybWlpIGlu
dGVybmFsIGNsaywNCj4gPiBlcnIgPSAlZFxuIiwgcmV0KTsNCj4gPiAtCQlnb3RvIGVycl9jbGs7
DQo+ID4gLQl9DQo+ID4gLQ0KPiA+ICAgCXJldHVybiAwOw0KPiA+IC0NCj4gPiAtZXJyX2NsazoN
Cj4gPiAtCWNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKHZhcmlhbnQtPm51bV9jbGtzLCBwbGF0
LT5jbGtzKTsNCj4gPiAtCXJldHVybiByZXQ7DQo+ID4gLX0NCj4gPiAtDQo+ID4gLXN0YXRpYyB2
b2lkIG1lZGlhdGVrX2R3bWFjX2V4aXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgdm9p
ZA0KPiA+ICpwcml2KQ0KPiA+IC17DQo+ID4gLQlzdHJ1Y3QgbWVkaWF0ZWtfZHdtYWNfcGxhdF9k
YXRhICpwbGF0ID0gcHJpdjsNCj4gPiAtCWNvbnN0IHN0cnVjdCBtZWRpYXRla19kd21hY192YXJp
YW50ICp2YXJpYW50ID0gcGxhdC0+dmFyaWFudDsNCj4gPiAtDQo+ID4gLQljbGtfZGlzYWJsZV91
bnByZXBhcmUocGxhdC0+cm1paV9pbnRlcm5hbF9jbGspOw0KPiA+IC0JY2xrX2J1bGtfZGlzYWJs
ZV91bnByZXBhcmUodmFyaWFudC0+bnVtX2Nsa3MsIHBsYXQtPmNsa3MpOw0KPiA+ICAgfQ0KPiA+
ICAgDQo+ID4gICBzdGF0aWMgaW50IG1lZGlhdGVrX2R3bWFjX2Nsa3NfY29uZmlnKHZvaWQgKnBy
aXYsIGJvb2wgZW5hYmxlZCkNCj4gPiBAQCAtNjQzLDcgKzYxOCw2IEBAIHN0YXRpYyBpbnQgbWVk
aWF0ZWtfZHdtYWNfY29tbW9uX2RhdGEoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2
LA0KPiA+ICAgCXBsYXQtPmFkZHI2NCA9IHByaXZfcGxhdC0+dmFyaWFudC0+ZG1hX2JpdF9tYXNr
Ow0KPiA+ICAgCXBsYXQtPmJzcF9wcml2ID0gcHJpdl9wbGF0Ow0KPiA+ICAgCXBsYXQtPmluaXQg
PSBtZWRpYXRla19kd21hY19pbml0Ow0KPiA+IC0JcGxhdC0+ZXhpdCA9IG1lZGlhdGVrX2R3bWFj
X2V4aXQ7DQo+ID4gICAJcGxhdC0+Y2xrc19jb25maWcgPSBtZWRpYXRla19kd21hY19jbGtzX2Nv
bmZpZzsNCj4gPiAgIAlpZiAocHJpdl9wbGF0LT52YXJpYW50LT5kd21hY19maXhfbWFjX3NwZWVk
KQ0KPiA+ICAgCQlwbGF0LT5maXhfbWFjX3NwZWVkID0gcHJpdl9wbGF0LT52YXJpYW50LQ0KPiA+
ID5kd21hY19maXhfbWFjX3NwZWVkOw0KPiA+IEBAIC03MTIsMTMgKzY4NiwzMiBAQCBzdGF0aWMg
aW50IG1lZGlhdGVrX2R3bWFjX3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gPiAgIAltZWRpYXRla19kd21hY19jb21tb25fZGF0YShwZGV2LCBwbGF0X2RhdCwgcHJp
dl9wbGF0KTsNCj4gPiAgIAltZWRpYXRla19kd21hY19pbml0KHBkZXYsIHByaXZfcGxhdCk7DQo+
ID4gICANCj4gPiArCXJldCA9IG1lZGlhdGVrX2R3bWFjX2Nsa3NfY29uZmlnKHByaXZfcGxhdCwg
dHJ1ZSk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICAg
CXJldCA9IHN0bW1hY19kdnJfcHJvYmUoJnBkZXYtPmRldiwgcGxhdF9kYXQsICZzdG1tYWNfcmVz
KTsNCj4gPiAgIAlpZiAocmV0KSB7DQo+ID4gICAJCXN0bW1hY19yZW1vdmVfY29uZmlnX2R0KHBk
ZXYsIHBsYXRfZGF0KTsNCj4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCWdvdG8gZXJyX2Rydl9w
cm9iZTsNCj4gPiAgIAl9DQo+ID4gICANCj4gPiAgIAlyZXR1cm4gMDsNCj4gPiArDQo+ID4gK2Vy
cl9kcnZfcHJvYmU6DQo+ID4gKwltZWRpYXRla19kd21hY19jbGtzX2NvbmZpZyhwcml2X3BsYXQs
IGZhbHNlKTsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBp
bnQgbWVkaWF0ZWtfZHdtYWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ID4gK3sNCj4gPiArCXN0cnVjdCBtZWRpYXRla19kd21hY19wbGF0X2RhdGEgKnByaXZfcGxhdCA9
DQo+ID4gZ2V0X3N0bW1hY19ic3BfcHJpdigmcGRldi0+ZGV2KTsNCj4gPiArCWludCByZXQ7DQo+
ID4gKw0KPiA+ICsJcmV0ID0gc3RtbWFjX3BsdGZyX3JlbW92ZShwZGV2KTsNCj4gPiArCW1lZGlh
dGVrX2R3bWFjX2Nsa3NfY29uZmlnKHByaXZfcGxhdCwgZmFsc2UpOw0KPiA+ICsNCj4gDQo+IFdl
IGVuYWxiZSB0aGUgY2xvY2tzIGFmdGVyIGNhbGxpbmcgc3RtbWFjX3Byb2JlX2NvbmZpZ19kdCgp
LCBzbyB3ZQ0KPiBzaG91bGQgDQo+IGRpc2FibGUgdGhlbSBiZWZvcmUgY2FsbGluZyBzdG1tYWNf
cGx0ZnJfcmVtb3ZlKCksIGNvcnJlY3Q/DQo+IA0KPiBPdGhlciB0aGVuIHRoYXQ6DQo+IFJldmll
d2VkLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPg0KDQpUbyBl
bnN1cmUgdGhlIGh3IGNvbmZpZ3VyYXRpb24gaW4gc3RtbWFjX3BsdGZyX3JlbW92ZSBiZWhhdmlv
cg0Kbm9ybWFsbHksIHdlIHNob3VsZCBkaXNhYmxlIGNsb2NrcyBhZnRlciBzdG1tYWNfcGx0ZnJf
cmVtb3ZlLg0KDQpBbmQgdGhlcmUgaXMgbm8gb3JkZXIgcmVxdWlyZW1lbnQgYmV0d2VlbiBjbG9j
a3MgY29uZmlndXJlZCBieSANCnN0bW1hY19wcm9iZV9jb25maWdfZHQvc3RtbWFjX3JlbW92ZV9j
b25maWdfZHQgYW5kIGNsb2Nrcw0KY29uZmlndXJlZCBieSBtZWRpYXRla19kd21hY19jbGtzX2Nv
bmZpZywgc28gaXQncyBzYWZlIGZvcg0KY3VycmVudCBzbmlwcGV0Lg0KDQpCZXN0IFJlZ2FyZHMh
DQpCaWFvDQoNCj4gDQo+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4gICBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtZWRpYXRla19kd21hY19tYXRjaFtdID0g
ew0KPiA+IEBAIC03MzMsNyArNzI2LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWVkaWF0
ZWtfZHdtYWNfbWF0Y2gpOw0KPiA+ICAgDQo+ID4gICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBtZWRpYXRla19kd21hY19kcml2ZXIgPSB7DQo+ID4gICAJLnByb2JlICA9IG1lZGlhdGVr
X2R3bWFjX3Byb2JlLA0KPiA+IC0JLnJlbW92ZSA9IHN0bW1hY19wbHRmcl9yZW1vdmUsDQo+ID4g
KwkucmVtb3ZlID0gbWVkaWF0ZWtfZHdtYWNfcmVtb3ZlLA0KPiA+ICAgCS5kcml2ZXIgPSB7DQo+
ID4gICAJCS5uYW1lICAgICAgICAgICA9ICJkd21hYy1tZWRpYXRlayIsDQo+ID4gICAJCS5wbQkJ
PSAmc3RtbWFjX3BsdGZyX3BtX29wcywNCg==


