Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E254C25B08
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 13:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CJDRi50hvZoe9bMnaKU/zoPzaOzTerxYahH02ibxAU=; b=qIiC7dPiehWm7MMOyn2rEWycbl
	jq+EUUUCN9j2eII6JYvEDwaZkH407tFtN+A4jtv4hH3BM0rmf9dcEQVFo14mUxibGO+CamFOEX1Qu
	7919fr393DFAePu0QqKmvWadaSLfaJvVErD9I3c4rb0o14mvzP0svRH/sTSJEHzjXmAjjBg/F/iAz
	2eB1Ipzzzag9V5eIaIsitT6EqZcJLqskYqQZohIXJUE8DWjovB0bT+TmYj6QfAu6IchnepljQ8Apz
	NvSTZqkPf5ycNZuawRK6oyGdwTH8CPwpH/zTQ0V7z8dg/enp9AYT1y6rkyhBv3SmuU1qLr7KXIiQb
	FZgjzC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKol-00HRqP-UG; Tue, 26 Jul 2022 13:41:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKoh-00HRkT-R5
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 13:41:46 +0000
X-UUID: 9ef3e578c35f4cfca4f26e5772e6530b-20220726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6CJDRi50hvZoe9bMnaKU/zoPzaOzTerxYahH02ibxAU=;
	b=dl3jd1Y5uKwEnzPZ8ORx6dxCfFMIllCAbYItWHmAmHVCi8UmkhYu/2ICzmg9jttiC6DmzODlQKqh2U03zDnRE97okvuuq4tqTqf8D4HxTO+Jkex/vuRn2oFAAuFYWIZEil0zxDoyKH9IwTL8Dh+eCi6FMeyszkX32yRkpWiUBvc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ea36af6a-d679-4c3f-9554-955c7337a0b0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:d6358cb3-06d2-48ef-b2dd-540836705165,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9ef3e578c35f4cfca4f26e5772e6530b-20220726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <hui.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1681447777; Tue, 26 Jul 2022 06:41:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 26 Jul 2022 20:41:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jul 2022 20:41:28 +0800
Message-ID: <7f00e2d4dd036a26482a16779dca5f6605496462.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: add pinctrl definition for
 mt8188
From: hui.liu <hui.liu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linus.walleij@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>
CC: <johnson.wang@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<sean.wang@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 26 Jul 2022 20:41:28 +0800
In-Reply-To: <5cd79059-e858-3c6d-8ef2-6d8b12367830@linaro.org>
References: <20220718113813.23787-1-hui.liu@mediatek.com>
	 <20220718113813.23787-2-hui.liu@mediatek.com>
	 <b28dcbe5-d15f-1c4f-9b3d-650d5c39de6b@linaro.org>
	 <08a7209fe198839093b3ef729fc97c1a950e1fbc.camel@mediatek.com>
	 <35639a59-4a3d-5aa7-946c-22fbd2f25e89@linaro.org>
	 <ea7755e599ad8c06bc04b6249c2a6d0ab3b920f3.camel@mediatek.com>
	 <53d432e9-6715-05c4-d258-896ec38afa4f@linaro.org>
	 <9dbcee74667cdc77ad80c043bb7725c63ff1cbd2.camel@mediatek.com>
	 <5cd79059-e858-3c6d-8ef2-6d8b12367830@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_064143_945226_EE632BBC 
X-CRM114-Status: GOOD (  21.52  )
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

T24gVHVlLCAyMDIyLTA3LTI2IGF0IDExOjQ1ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiAyNS8wNy8yMDIyIDEyOjEwLCBodWkubGl1IHdyb3RlOg0KPiA+IE9uIEZyaSwg
MjAyMi0wNy0yMiBhdCAyMDoxOSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4g
PiA+IE9uIDIyLzA3LzIwMjIgMDM6NDAsIGh1aS5saXUgd3JvdGU6DQo+ID4gPiA+IEhpLCBLcnp5
c3p0b2YNCj4gPiA+ID4gDQo+ID4gPiA+IFRoYXQncyB0aGUgY29tbWVudCBhYm91dCByZWcgYW5k
IHJlZy1uYW1lcyBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gPiA+ICsgIHJlZzoNCj4gPiA+ID4gPiA+
ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiA+ID4gPiA+ICsgICAgICBQaHlzaWNhbCBhZGRyZXNz
IGJhc2UgZm9yIGdwaW8gYmFzZSByZWdpc3RlcnMuIFRoZXJlDQo+ID4gPiA+ID4gPiBhcmUNCj4g
PiA+ID4gPiA+IDgNCj4gPiA+ID4gPiA+IEdQSU8NCj4gPiA+ID4gPiA+ICsgICAgICBwaHlzaWNh
bCBhZGRyZXNzIGJhc2UgaW4gbXQ4MTg4Lg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFJlZHVuZGFu
dCBkZXNjcmlwdGlvbiwgc2tpcCBpdC4gWW91IHNob3VsZCBsaXN0IHRoZSBpbnN0ZWFkDQo+ID4g
PiA+ID4gYW5kDQo+ID4gPiA+ID4gZGVzY3JpYmUNCj4gPiA+ID4gPiBlYWNoIG9mIGl0Lg0KPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gKyAgICBtYXhJdGVtczogOA0KPiA+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ID4gKyAgcmVnLW5hbWVzOg0KPiA+ID4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogfA0K
PiA+ID4gPiA+ID4gKyAgICAgIEdwaW8gYmFzZSByZWdpc3RlciBuYW1lcy4NCj4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiBSZWR1bmRhbnQgZGVzY3JpcHRpb24sIHNraXAgaXQuDQo+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiArICAgIG1heEl0ZW1zOiA4DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gWW91IG5l
ZWQgdG8gbGlzdCB0aGUgaXRlbXMgaW5zdGVhZC4NCj4gPiA+ID4gDQo+ID4gPiA+IEkgcGxhbiB0
byB1cGRhdGUgcmVnIGFuZCByZWctbmFtZXMgYXMgdGhlIGZvbGxvd2luZzoNCj4gPiA+ID4gICBy
ZWc6DQo+ID4gPiA+ICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ID4gPiAgICAgICBQaHlzaWNhbCBh
ZGRyZXNzIGJhc2UgZm9yIGdwaW8gYmFzZSByZWdpc3RlcnMuIFRoZXJlIGFyZQ0KPiA+ID4gPiA2
DQo+ID4gPiA+IGRpZmZlcmVudCBHUElPIHBoeXNpY2FsIGFkZHJlc3MgYmFzZXMgaW4gbXQ4MTg4
Lg0KPiA+ID4gPiAgICAgbWluSXRlbXM6IDYNCj4gPiA+ID4gICAgIG1heEl0ZW1zOiA2DQo+ID4g
PiANCj4gPiA+IFlvdSBzaG91bGQgcmF0aGVyIGhhdmUgaGVyZSBpdGVtcyB3aXRoIGRlc2NyaXB0
aW9uOg0KPiA+ID4gaXRlbXM6DQo+ID4gPiAgLSBkZXNjcmlwdGlvbjogd2hhdCBpcyBpdA0KPiA+
ID4gIC0gZGVzY3JpcHRpb246IHdoYXQgaXMgaXQNCj4gPiA+ICAuLi4uDQo+ID4gPiANCj4gPiAN
Cj4gPiBIaSBLcnp5c3p0b2YsDQo+ID4gDQo+ID4gSSB3aWxsIGxpc3QgZWFjaCBpdGVtcyB3aXRo
IGRlc2NyaXB0aW9uIGFzIGZvbGxvd3MsIGlzIGl0IHJpZ2h0Pw0KPiA+ICAgcmVnOg0KPiA+ICAg
ICBkZXNjcmlwdGlvbjogfA0KPiA+ICAgICAgIFBoeXNpY2FsIGFkZHJlc3MgYmFzZSBmb3IgcGlu
Y3RybCBiYXNlIHJlZ2lzdGVycy4gVGhlcmUgYXJlIDYNCj4gPiBkaWZmZXJlbnQgcGh5c2ljYWwg
YWRkcmVzcyBiYXNlcyBpbiBtdDgxODguDQo+ID4gICAgICAgaW9jZmcwIGlzIGdwaW8gYmFzZSBh
ZGRyZXNzOw0KPiA+ICAgICAgIGlvY2ZnX3JtIGlzIGlvIGNvbmZpZ3VyYXRpb24NCj4gPiBhZGRy
ZXNzIGZvciBybSBncm91cDsNCj4gPiAgICAgICBpb2NmZ19sdCBpcyBpbyBjb25maWd1cmF0aW9u
IGFkZHJlc3MgZm9yIGx0IGdyb3VwOw0KPiA+ICAgICAgIGlvY2ZnX2xtDQo+ID4gaXMgaW8gY29u
ZmlndXJhdGlvbiBhZGRyZXNzIGZvciBtbSBncm91cDsNCj4gPiAgICAgICBpb2NmZ19ydCBpcyBp
bw0KPiA+IGNvbmZpZ3VyYXRpb24gYWRkcmVzcyBmb3IgcnQgZ3JvdXA7DQo+ID4gICAgICAgZWlu
dCBpcyBlaW50IGJhc2UgYWRkcmVzcy4NCj4gPiAgICAgbWluSXRlbXM6IDYNCj4gPiAgICAgbWF4
SXRlbXM6IDYNCj4gDQo+IE5vLCBiZWNhdXNlIGl0IGlzIG5vdCBzY2hlbWEgYW5kIHlvdSBzdGls
bCBrZWVwIGhlcmUgbWluL21heEl0ZW1zDQo+IHdoaWNoDQo+IGFyZSBwb2ludGxlc3MgaW4gdGhh
dCBjYXNlLiBKdXN0IHJlYWQgZXhhbXBsZS1zY2hlbWEuDQo+IA0KPiANCmh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xOS1yYzgv
c291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9leGFtcGxlLXNjaGVtYS55
YW1sKkw2M19fO0l3ISFDVFJOS0E5d01nMEFSYnchM1VBTDNCNEpCblJwbkdFSG0zb3VYaWtzOC13
ZmRuM0h2QWJOVXl0eVRlbkdRaW5BU242blIzNUhjOEFKRVljJA0KPiAgDQo+IA0KSGkgS3J6eXN6
dG9mLA0KDQpUaGFua3MgZm9yIHlvdSBjb21tZW50LCBJIHdpbGwgcmVmZXJlbmNlIHRoZSBleGFt
cGxlLXNjaGVtYSBhbmQgdXBkYXRlDQp0aGUgZGVzY3JpcHRpb24gaW4gcGF0Y2ggdjIuDQoNCg0K


