Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BEAC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 09:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bKZyBugS1rovpm3mHr8DMWTlLwcOWnSobNyJMULR9A=; b=NlThrzVe1+rTpH1jXb0Wrw4tVD
	Pttd6H9Q+G4VvzQRCpU4OziBevWi3m9HZ8viuTdxccilHNRroIUXT6mIKgY9GohTgEujyNrbIksFi
	aaAr7JOB8Jq0VN9w4Noud1+v9j+nsXEeIeCmHkS0kZ2QcscUN9bDYrZGk+n1cMvRa3v8VQiXNRbqK
	DHSeKvLqx5zSCFZ4CXfB7k0sbZHCVcg4NMDHVXv+3WhKPQ0vz6d1pMEUdi9xvJffDr9iVDq44llN2
	Ui1tCgBNU092X8lCz/YaIGfgnVLxTMyEFsf1fRYDqva61GQ2BUw30+KbvK+1e1TquZ/WqbK1DLyA8
	5yUemb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvbP-00D75k-8e; Thu, 14 Jul 2022 09:57:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvbC-00D6xw-Ns; Thu, 14 Jul 2022 09:57:37 +0000
X-UUID: e32fcc3d078a4e68992f76cff0dab9b7-20220714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=+bKZyBugS1rovpm3mHr8DMWTlLwcOWnSobNyJMULR9A=;
	b=KaMK0lMmZ65L23sI6okSBOXfs9FXOhOTEfyGVFgSB+xL+559GoKBCWzob5DGg/oG3umJOB/2aVPmLP2AbU0TqWEE1Jqs8Lr0nIX/p+HxkuE40nnbdFFosBhpPXE+pIveQEYYubhF+ExmSDhVx24XjQ+xz3n4neH9np+OHzNCrt0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:dc4f9409-b80d-4bd0-ae82-178c20e4c25b,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:0f94e32,CLOUDID:39a1fa32-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e32fcc3d078a4e68992f76cff0dab9b7-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 92979474; Thu, 14 Jul 2022 02:57:31 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 14 Jul 2022 16:56:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Jul 2022 16:56:55 +0800
Message-ID: <2509c7dcdfe4c618cc077b8afc639400104a0ed5.camel@mediatek.com>
Subject: Re: [V4,1/8] dt-bindings: mediatek: Add mediatek,mt8195-jpgdec
 compatible
From: kyrie.wu <kyrie.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Irui Wang" <irui.wang@mediatek.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, "Mauro Carvalho Chehab" <mchehab@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Tzung-Bi Shih <tzungbi@chromium.org>, <nicolas.dufresne@collabora.com>,
	<wenst@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
	<xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
	<srv_heupstream@mediatek.com>
Date: Thu, 14 Jul 2022 16:56:55 +0800
In-Reply-To: <7d5986ad-40a4-f15b-8d14-aad5248379b3@collabora.com>
References: <20220627025540.8901-1-irui.wang@mediatek.com>
	 <20220627025540.8901-2-irui.wang@mediatek.com>
	 <7d5986ad-40a4-f15b-8d14-aad5248379b3@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_025734_840392_E67FF2D7 
X-CRM114-Status: GOOD (  17.87  )
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

T24gVHVlLCAyMDIyLTA3LTA1IGF0IDE1OjAwICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMjcvMDYvMjIgMDQ6NTUsIElydWkgV2FuZyBoYSBzY3JpdHRvOg0K
PiA+IEZyb206IGt5cmllIHd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gQWRk
IG1lZGlhdGVrLG10ODE5NS1qcGdkZWMgY29tcGF0aWJsZSB0byBiaW5kaW5nIGRvY3VtZW50Lg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IGt5cmllIHd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+
DQo+ID4gLS0tDQo+ID4gICAuLi4vbWVkaWEvbWVkaWF0ZWssbXQ4MTk1LWpwZWdkZWMueWFtbCAg
ICAgICAgfCAxNzYNCj4gPiArKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxNzYgaW5zZXJ0aW9ucygrKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4gPiBq
cGVnZGVjLnlhbWwNCj4gPiANCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbXQ4MTk1LQ0KPiA+IGpwZWdkZWMueWFt
bA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVr
LG10ODE5NS0NCj4gPiBqcGVnZGVjLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uOGEyNTVlOGUyZTA5DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxt
dDgxOTUtDQo+ID4ganBlZ2RlYy55YW1sDQo+ID4gQEAgLTAsMCArMSwxNzYgQEANCj4gPiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ICsl
WUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogDQo+ID4gaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvbWVkaWEvbWVkaWF0ZWssbXQ4MTk1LWpwZWdkZWMueWFtbCMNCj4gPiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0K
PiANCj4gLi4uc25pcC4uLg0KPiANCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0K
PiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1n
aWMuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9tZW1vcnkvbXQ4MTk1LW1lbW9y
eS1wb3J0Lmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRy
b2xsZXIvaXJxLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTk1
LWNsay5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL210ODE5NS1wb3dl
ci5oPg0KPiA+ICsNCj4gPiArICAgIHNvYyB7DQo+ID4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8Mj47DQo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47DQo+ID4gKw0KPiA+ICsgICAg
ICAgIGpwZ2RlY19tYXN0ZXIgew0KPiANCj4gQWRkaXRpb25hbGx5IHRvIFJvYidzIHJldmlldywg
d2hpY2ggSSBvZiBjb3Vyc2UgZnVsbHkgYWdyZWUgb24sIHRoaXMNCj4gZXhhbXBsZQ0KPiBkZXZp
Y2V0cmVlIGRvZXMgKm5vdCogd29yayBvbiBNVDgxOTUuDQo+IA0KPiBbICAgMTMuMDE1NzE2XSBt
dGstanBlZ2RlYy1odyAxYTA0MDAwMC5qcGdkZWM6IEFkZGluZyB0byBpb21tdSBncm91cA0KPiAx
DQo+IA0KPiBbICAgMTMuMDI1MzgzXSBtdGstanBlZ2RlYy1odyAxYTA1MDAwMC5qcGdkZWM6IEFk
ZGluZyB0byBpb21tdSBncm91cA0KPiAxDQo+IA0KPiBbICAgMTMuMDM0ODE0XSBtdGstanBlZ2Rl
Yy1odyAxYjA0MDAwMC5qcGdkZWM6IEFkZGluZyB0byBpb21tdSBncm91cA0KPiAxDQo+IA0KPiBb
ICAgMTMuMDQxNjcyXSBtdGstanBlZyBzb2M6anBnZGVjX21hc3RlcjogaW52YWxpZCByZXNvdXJj
ZQ0KPiANCj4gWyAgIDEzLjA0OTc1OF0gbXRrLWpwZWc6IHByb2JlIG9mIHNvYzpqcGdkZWNfbWFz
dGVyIGZhaWxlZCB3aXRoIGVycm9yDQo+IC0yMg0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+IEFuZ2Vs
bw0KDQpUaGlzIGVycm9yIHdpbGwgYmUgZml4ZWQuDQpUaGFua3MuDQo+IA0KPiA+ICsgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtanBnZGVjIjsNCj4gPiArICAg
ICAgICAgICAgICAgIG1lZGlhdGVrLGpwZWdkZWMtbXVsdGktY29yZTsNCj4gPiArICAgICAgICAg
ICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxOTVfUE9XRVJfRE9NQUlOX1ZERUMxPjsN
Cj4gPiArICAgICAgICAgICAgICAgIGlvbW11cyA9IDwmaW9tbXVfdnBwIE00VV9QT1JUX0wxOV9K
UEdERUNfV0RNQTA+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICA8JmlvbW11X3ZwcCBNNFVf
UE9SVF9MMTlfSlBHREVDX0JTRE1BMD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIDwmaW9t
bXVfdnBwIE00VV9QT1JUX0wxOV9KUEdERUNfV0RNQTE+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICA8JmlvbW11X3ZwcCBNNFVfUE9SVF9MMTlfSlBHREVDX0JTRE1BMT4sDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIDwmaW9tbXVfdnBwDQo+ID4gTTRVX1BPUlRfTDE5X0pQR0RFQ19CVUZG
X09GRlNFVDE+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICA8JmlvbW11X3ZwcA0KPiA+IE00
VV9QT1JUX0wxOV9KUEdERUNfQlVGRl9PRkZTRVQwPjsNCj4gPiArICAgICAgICAgICAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiA+ICsgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8
Mj47DQo+ID4gKyAgICAgICAgICAgICAgICByYW5nZXM7DQo+ID4gKw0KPiA+ICsgICAgICAgICAg
ICAgICAganBnZGVjQDFhMDQwMDAwIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE5NS1qcGdkZWMtaHciOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgIHJlZyA9IDwwIDB4MWEwNDAwMDAgMCAweDEwMDAwPjsvKiBKUEdERUNfQzAgKi8NCj4gPiAr
ICAgICAgICAgICAgICAgICAgICBod19pZCA9IDwwPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICBpb21tdXMgPSA8JmlvbW11X3Zkbw0KPiA+IE00VV9QT1JUX0wxOV9KUEdERUNfV0RNQTA+LA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8JmlvbW11X3ZkbyBNNFVfUE9SVF9MMTlfSlBH
REVDX0JTRE1BMD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDwmaW9tbXVfdmRvIE00
VV9QT1JUX0wxOV9KUEdERUNfV0RNQTE+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8
JmlvbW11X3ZkbyBNNFVfUE9SVF9MMTlfSlBHREVDX0JTRE1BMT4sDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIDwmaW9tbXVfdmRvDQo+ID4gTTRVX1BPUlRfTDE5X0pQR0RFQ19CVUZGX09G
RlNFVDE+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8JmlvbW11X3Zkbw0KPiA+IE00
VV9QT1JUX0wxOV9KUEdERUNfQlVGRl9PRkZTRVQwPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzQzIElSUV9UWVBFX0xFVkVMX0hJR0gNCj4gPiAwPjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnZlbmNzeXMgQ0xLX1ZFTkNfSlBH
REVDPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJqcGdkZWMiOw0K
PiA+ICsgICAgICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNwbQ0KPiA+IE1UODE5
NV9QT1dFUl9ET01BSU5fVkRFQzA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgfTsNCj4gPiArDQo+
ID4gKyAgICAgICAgICAgICAgICBqcGdkZWNAMWEwNTAwMDAgew0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LWpwZ2RlYy1odyI7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxYTA1MDAwMCAwIDB4MTAwMDA+Oy8qIEpQR0RF
Q19DMSAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGh3X2lkID0gPDE+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgIGlvbW11cyA9IDwmaW9tbXVfdmRvDQo+ID4gTTRVX1BPUlRfTDE5X0pQ
R0RFQ19XRE1BMD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDwmaW9tbXVfdmRvIE00
VV9QT1JUX0wxOV9KUEdERUNfQlNETUEwPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
PCZpb21tdV92ZG8gTTRVX1BPUlRfTDE5X0pQR0RFQ19XRE1BMT4sDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIDwmaW9tbXVfdmRvIE00VV9QT1JUX0wxOV9KUEdERUNfQlNETUExPiwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgPCZpb21tdV92ZG8NCj4gPiBNNFVfUE9SVF9MMTlf
SlBHREVDX0JVRkZfT0ZGU0VUMT4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIDwmaW9t
bXVfdmRvDQo+ID4gTTRVX1BPUlRfTDE5X0pQR0RFQ19CVUZGX09GRlNFVDA+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzNDQgSVJRX1RZUEVfTEVWRUxf
SElHSA0KPiA+IDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwmdmVuY3N5
cyBDTEtfVkVOQ19KUEdERUNfQzE+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5h
bWVzID0gImpwZ2RlYyI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9
IDwmc3BtDQo+ID4gTVQ4MTk1X1BPV0VSX0RPTUFJTl9WREVDMT47DQo+ID4gKyAgICAgICAgICAg
ICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgIGpwZ2RlY0AxYjA0MDAwMCB7DQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtanBn
ZGVjLWh3IjsNCj4gPiArICAgICAgICAgICAgICAgICAgICByZWcgPSA8MCAweDFiMDQwMDAwIDAg
MHgxMDAwMD47LyogSlBHREVDX0MyICovDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgaHdfaWQg
PSA8Mj47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgaW9tbXVzID0gPCZpb21tdV92cHANCj4g
PiBNNFVfUE9SVF9MMjBfSlBHREVDX1dETUEwPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgPCZpb21tdV92cHAgTTRVX1BPUlRfTDIwX0pQR0RFQ19CU0RNQTA+LA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICA8JmlvbW11X3ZwcCBNNFVfUE9SVF9MMjBfSlBHREVDX1dETUExPiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPCZpb21tdV92cHAgTTRVX1BPUlRfTDIwX0pQ
R0RFQ19CU0RNQTE+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8JmlvbW11X3ZwcA0K
PiA+IE00VV9QT1JUX0wyMF9KUEdERUNfQlVGRl9PRkZTRVQxPiwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgPCZpb21tdV92cHANCj4gPiBNNFVfUE9SVF9MMjBfSlBHREVDX0JVRkZfT0ZG
U0VUMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM0
OCBJUlFfVFlQRV9MRVZFTF9ISUdIDQo+ID4gMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
Y2xvY2tzID0gPCZ2ZW5jc3lzX2NvcmUxDQo+ID4gQ0xLX1ZFTkNfQ09SRTFfSlBHREVDPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJqcGdkZWMiOw0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNwbQ0KPiA+IE1UODE5NV9QT1dFUl9E
T01BSU5fVkRFQzI+Ow0KPiA+ICsgICAgICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICB9Ow0K
PiA+ICsgICAgfTsNCj4gDQo+IA0KPiANCg==


