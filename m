Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4D0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 07:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zd+ubo/DivYSBrNsCbxjyQhbZxZHcOnQvxmNPBxGALA=; b=iUF2ILXHde6ghePUsXC1ATFr6q
	964bVffnRPbl4Vlnw6+e92uknGHLlUwjv11b2E9KL9Bj2ZOvJqTgbAtS+Ptfss+cdXYxoiu2z7koh
	kAoUmZWgwIZgupXLTmKNlOmPEOkEyb0qlUQpBM8ZVRsI7kKdKF7UGIaONINwhfY6q1WGXO69CTP1Q
	cPgJna/2upJZ6hEAOR7WOUNu+WXYzDHToPpURdIpRCe7UuMLa2nVSzIQJ0kJPpGZFg4gOb7pESOjK
	5/ggRdN0grDAqGevwLYId3WmQWfwLn6sxxjkf4wWJnUfttGPywYK6/2Aer8Fpd3w0raP4XA/QNx0y
	nTFKiRWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3BRU-00Ga0B-AO; Mon, 20 Jun 2022 07:03:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3BRA-00GZuD-KW; Mon, 20 Jun 2022 07:03:06 +0000
X-UUID: 7089da461eb34600ae7ca16de8cd096d-20220620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zd+ubo/DivYSBrNsCbxjyQhbZxZHcOnQvxmNPBxGALA=;
	b=gWafuo84NCFmlZizmoiicNZpIyG0SJSCxgGPeftx2uC1akETD5DoHxPrEVGIF59WqXjUSro/FgoMeQDqdTmYphy29ZZu8Pjb3lEMNojJJ2GaLSHZL2+kz3veG6mcx2ZkJy83kRx2Azbt0Ws6CE+9AP+/KXSUMnZKyNaICQCmZCs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:17ae8ba2-2e05-41fc-b092-9f554483c3f8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:7c342b3d-9948-4b2a-a784-d8a6c1086106,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 7089da461eb34600ae7ca16de8cd096d-20220620
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 805396942; Mon, 20 Jun 2022 00:03:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jun 2022 00:00:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 20 Jun 2022 14:59:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 20 Jun 2022 14:59:58 +0800
Message-ID: <af50210b95d0cd8b2e3103b3d4a9702aeeba9452.camel@mediatek.com>
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<kernel@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-usb@vger.kernel.org>
Date: Mon, 20 Jun 2022 14:59:58 +0800
In-Reply-To: <bc5458fe-083c-d679-9fcb-95810a290da8@linaro.org>
References: <20220617222916.2435618-1-nfraprado@collabora.com>
	 <20220617222916.2435618-3-nfraprado@collabora.com>
	 <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
	 <bb460aa483cc888ffa36709d9e9c1f2e3be0e000.camel@mediatek.com>
	 <bc5458fe-083c-d679-9fcb-95810a290da8@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_000304_739262_507B8391 
X-CRM114-Status: GOOD (  30.69  )
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

T24gU3VuLCAyMDIyLTA2LTE5IGF0IDE0OjA1ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAxOS8wNi8yMDIyIDA5OjQ2LCBDaHVuZmVuZyBZdW4gd3JvdGU6DQo+ID4gT24g
RnJpLCAyMDIyLTA2LTE3IGF0IDE4OjI1IC0wNzAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3Rl
Og0KPiA+ID4gT24gMTcvMDYvMjAyMiAxNToyOSwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3Jv
dGU6DQo+ID4gPiA+IFRoZSBjdXJyZW50IGNsb2NrIGxpc3QgaW4gdGhlIGJpbmRpbmcgZG9lc24n
dCBhbGxvdyBmb3Igb25lIG9mDQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBvcHRpb25hbCBjbG9ja3Mg
dG8gYmUgbWlzc2luZyBhbmQgYSBzdWJzZXF1ZW50IGNsb2NrIHRvIGJlDQo+ID4gPiA+IHByZXNl
bnQuDQo+ID4gPiA+IEFuDQo+ID4gPiA+IGV4YW1wbGUgd2hlcmUgdGhpcyBpcyBhbiBpc3N1ZSBp
cyBpbiBtdDgxOTIuZHRzaSwgd2hpY2ggaGFzDQo+ID4gPiA+ICJzeXNfY2siLA0KPiA+ID4gPiAi
cmVmX2NrIiwgInhoY2lfY2siIGFuZCB3b3VsZCBjYXVzZSBkdGJzX2NoZWNrIHdhcm5pbmdzLg0K
PiA+ID4gPiANCj4gPiA+ID4gQ2hhbmdlIHRoZSBjbG9jayBsaXN0IGluIGEgd2F5IHRoYXQgYWxs
b3dzIHRoZSBtaWRkbGUgb3B0aW9uYWwNCj4gPiA+ID4gY2xvY2tzIHRvDQo+ID4gPiA+IGJlIG1p
c3NpbmcsIHdoaWxlIHN0aWxsIGd1YXJhbnRlZWluZyBhIGZpeGVkIG9yZGVyLiBUaGUNCj4gPiA+
ID4gInJlZl9jayIgaXMNCj4gPiA+ID4ga2VwdA0KPiA+ID4gPiBhcyBhIGNvbnN0IGV2ZW4gdGhv
dWdoIGl0IGlzIG9wdGlvbmFsIGZvciBzaW1wbGljaXR5LCBzaW5jZSBpdA0KPiA+ID4gPiBpcw0K
PiA+ID4gPiBwcmVzZW50IGluIGFsbCBjdXJyZW50IGR0cyBmaWxlcy4NCj4gPiA+ID4gDQo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29s
bGFib3JhLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IA0KPiA+ID4gPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay14aGNpLnlhbWwgICAgICAgfCA5DQo+ID4gPiA+
ICsrKysrKystLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay0NCj4gPiA+ID4g
eGhjaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRl
ayxtdGstDQo+ID4gPiA+IHhoY2kueWFtbA0KPiA+ID4gPiBpbmRleCA2M2NiYzJiNjJkMTguLjk5
YTFiMjMzZWM5MCAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGstDQo+ID4gPiA+IHhoY2kueWFtbA0KPiA+ID4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay0N
Cj4gPiA+ID4geGhjaS55YW1sDQo+ID4gPiA+IEBAIC04MCw4ICs4MCwxMyBAQCBwcm9wZXJ0aWVz
Og0KPiA+ID4gPiAgICAgIGl0ZW1zOg0KPiA+ID4gPiAgICAgICAgLSBjb25zdDogc3lzX2NrICAj
IHJlcXVpcmVkLCB0aGUgZm9sbG93aW5nIG9uZXMgYXJlDQo+ID4gPiA+IG9wdGlvbmFsDQo+ID4g
PiA+ICAgICAgICAtIGNvbnN0OiByZWZfY2sNCj4gPiA+ID4gLSAgICAgIC0gY29uc3Q6IG1jdV9j
aw0KPiA+ID4gPiAtICAgICAgLSBjb25zdDogZG1hX2NrDQo+ID4gPiA+ICsgICAgICAtIGVudW06
DQo+ID4gPiA+ICsgICAgICAgICAgLSBtY3VfY2sNCj4gPiA+ID4gKyAgICAgICAgICAtIGRtYV9j
aw0KPiA+ID4gPiArICAgICAgICAgIC0geGhjaV9jaw0KPiA+ID4gPiArICAgICAgLSBlbnVtOg0K
PiA+ID4gPiArICAgICAgICAgIC0gZG1hX2NrDQo+ID4gPiA+ICsgICAgICAgICAgLSB4aGNpX2Nr
DQo+ID4gPiA+ICAgICAgICAtIGNvbnN0OiB4aGNpX2NrDQo+ID4gPiANCj4gPiA+IFlvdSBhbGxv
dyBub3cgYWxtb3N0IGFueSBvcmRlciBoZXJlLCBpbmNsdWRpbmcgaW5jb3JyZWN0IGxpa2UNCj4g
PiA+IHN5cyxyZWYseGhjaSx4aGNpLHhoY2kuDQo+ID4gPiANCj4gPiA+IFRoZSBvcmRlciBvZiBj
bG9ja3MgaGFzIHRvIGJlIGZpeGVkIGFuZCB3ZSBjYW5ub3QgYWxsb3cNCj4gPiA+IGZsZXhpYmls
aXR5Lg0KPiA+ID4gQXJlDQo+ID4gPiB5b3Ugc3VyZSB0aGF0IHRoZXNlIGNsb2NrcyBhcmUgYWN0
dWFsbHkgb3B0aW9uYWwgKG5vdCB3aXJlZCB0bw0KPiA+ID4gdGhlDQo+ID4gPiBkZXZpY2UpPw0K
PiA+IA0KPiA+IEluIGZhY3QsIHRoZXNlIG9wdGlvbmFsIGNsb2NrcyBhcmUgZml4ZWQsIGR1ZSB0
byBubyBnYXRlcyBhcmUNCj4gPiBwcm92aWRlZCwNCj4gPiBTVyBjYW4ndCBjb250cm9sIHRoZW0g
YnkgQ0NGOw0KPiA+IEluIHRoaXMgY2FzZSwgSSB1c3VhbGx5IHVzZSBhIGZpeGVkIGNsb2NrLCBv
ciBpZ25vcmUgaXQuDQo+IA0KPiBCdXQgaW4gc29tZSB2ZXJzaW9ucyB0aGVzZSBjbG9ja3MgYXJl
IGNvbnRyb2xsYWJsZSBvciBub3Q/DQpTb21lIFNvQ3MgYXJlIGNvbnRyb2xsYWJsZSwgc29tZSBv
bmVzIGFyZSBub3QgKGZpeGVkIGNsb2NrKS4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5
c3p0b2YNCg==


