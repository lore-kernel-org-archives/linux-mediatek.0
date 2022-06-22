Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0660C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 06:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tytjuHRemZUAJPIbFyRNhEwsGKs013FMW+5kyV0ceU=; b=YyY2B7e5oD+GrhU0Pv8dhmJ46U
	Db7P25a6yBURX+2UZp+9EInx6VmTLcc523/40grGnyk8cHbtDeQo5yaQ5qqO9fAlFLWw2WQBh9T14
	HkSdPb5GzS2jRmuWcTbnEWo0uHPlAKqQL9kFeyC9Vjm65GsIoqfD4c/3G/vq8Te/gG1RvgqF1YTgr
	vhAxnH6haWUNElPwRE+pD6gOwCdqGgQZd33+nSplcZbcXL0ykxHdUX/SwSVo88nMbjrtqL87xzNdn
	K+AdT3IBFIdOAFBQWV0iPdhdICRx64mLSDLgMlNYH5aUEasft0soancLkEV6nGYWmqmvZOy8mqnI6
	IojKAHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3teN-008jEx-Kq; Wed, 22 Jun 2022 06:15:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3tc1-008iFW-S3; Wed, 22 Jun 2022 06:13:16 +0000
X-UUID: 167624d3cb924e58a198d17414d5e8f7-20220621
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=7tytjuHRemZUAJPIbFyRNhEwsGKs013FMW+5kyV0ceU=;
	b=Y+6xGjf5dW3XPnj4KgDIxDIgjfM2jIoiLS+1r9/4WUQauAi4/pqlVvzd+wDMkJZCYngTn+8bmpIHzVGl64i/6cfanvw2Dqcfs+uiDXCdy/80rkUqVBoStvQ1qgNzMa0DBtk0kOQVyBQLtcC9oNxMx9lJ697eICcgq4FzXJmtvEE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:2d5c1f48-3d00-42e8-9f24-0a638a9781c4,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:287d2fea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 167624d3cb924e58a198d17414d5e8f7-20220621
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <wenbin.mei@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1666535167; Tue, 21 Jun 2022 23:13:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 23:10:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 14:10:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 14:10:55 +0800
Message-ID: <2705069844be7b3152a810e21b9f737a88d0302d.camel@mediatek.com>
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado"
	<nfraprado@collabora.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <kernel@collabora.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-usb@vger.kernel.org>
Date: Wed, 22 Jun 2022 14:10:55 +0800
In-Reply-To: <ba6cccfa05aed087d14f5adc6db06496547a5094.camel@mediatek.com>
References: <20220617222916.2435618-1-nfraprado@collabora.com>
	 <20220617222916.2435618-3-nfraprado@collabora.com>
	 <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
	 <bb460aa483cc888ffa36709d9e9c1f2e3be0e000.camel@mediatek.com>
	 <bc5458fe-083c-d679-9fcb-95810a290da8@linaro.org>
	 <af50210b95d0cd8b2e3103b3d4a9702aeeba9452.camel@mediatek.com>
	 <a24c24e6-fdee-df79-fd2f-6a71540bd9b3@linaro.org>
	 <20220620155057.a6qilnhm7snzhapa@notapiano>
	 <afae6179-3681-f5c6-4615-3228f16f1271@linaro.org>
	 <ba6cccfa05aed087d14f5adc6db06496547a5094.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_231314_302207_19CBE872 
X-CRM114-Status: GOOD (  57.21  )
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

T24gV2VkLCAyMDIyLTA2LTIyIGF0IDA5OjU3ICswODAwLCBDaHVuZmVuZyBZdW4gd3JvdGU6DQo+
IE9uIFR1ZSwgMjAyMi0wNi0yMSBhdCAwOToxNCArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToNCj4gPiBPbiAyMC8wNi8yMDIyIDE3OjUwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3
cm90ZToNCj4gPiA+IE9uIE1vbiwgSnVuIDIwLCAyMDIyIGF0IDEwOjUwOjU3QU0gKzAyMDAsIEty
enlzenRvZiBLb3psb3dza2kNCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBPbiAyMC8wNi8yMDIyIDA4
OjU5LCBDaHVuZmVuZyBZdW4gd3JvdGU6DQo+ID4gPiA+ID4gT24gU3VuLCAyMDIyLTA2LTE5IGF0
IDE0OjA1ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+ID4gPiA+ID4gT24g
MTkvMDYvMjAyMiAwOTo0NiwgQ2h1bmZlbmcgWXVuIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiBPbiBG
cmksIDIwMjItMDYtMTcgYXQgMTg6MjUgLTA3MDAsIEtyenlzenRvZiBLb3psb3dza2kNCj4gPiA+
ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gT24gMTcvMDYvMjAyMiAxNToyOSwgTsOt
Y29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiBUaGUgY3VycmVu
dCBjbG9jayBsaXN0IGluIHRoZSBiaW5kaW5nIGRvZXNuJ3QgYWxsb3cNCj4gPiA+ID4gPiA+ID4g
PiA+IGZvcg0KPiA+ID4gPiA+ID4gPiA+ID4gb25lIG9mDQo+ID4gPiA+ID4gPiA+ID4gPiB0aGUN
Cj4gPiA+ID4gPiA+ID4gPiA+IG9wdGlvbmFsIGNsb2NrcyB0byBiZSBtaXNzaW5nIGFuZCBhIHN1
YnNlcXVlbnQgY2xvY2sNCj4gPiA+ID4gPiA+ID4gPiA+IHRvDQo+ID4gPiA+ID4gPiA+ID4gPiBi
ZQ0KPiA+ID4gPiA+ID4gPiA+ID4gcHJlc2VudC4NCj4gPiA+ID4gPiA+ID4gPiA+IEFuDQo+ID4g
PiA+ID4gPiA+ID4gPiBleGFtcGxlIHdoZXJlIHRoaXMgaXMgYW4gaXNzdWUgaXMgaW4gbXQ4MTky
LmR0c2ksDQo+ID4gPiA+ID4gPiA+ID4gPiB3aGljaA0KPiA+ID4gPiA+ID4gPiA+ID4gaGFzDQo+
ID4gPiA+ID4gPiA+ID4gPiAic3lzX2NrIiwNCj4gPiA+ID4gPiA+ID4gPiA+ICJyZWZfY2siLCAi
eGhjaV9jayIgYW5kIHdvdWxkIGNhdXNlIGR0YnNfY2hlY2sNCj4gPiA+ID4gPiA+ID4gPiA+IHdh
cm5pbmdzLg0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiBDaGFuZ2UgdGhl
IGNsb2NrIGxpc3QgaW4gYSB3YXkgdGhhdCBhbGxvd3MgdGhlIG1pZGRsZQ0KPiA+ID4gPiA+ID4g
PiA+ID4gb3B0aW9uYWwNCj4gPiA+ID4gPiA+ID4gPiA+IGNsb2NrcyB0bw0KPiA+ID4gPiA+ID4g
PiA+ID4gYmUgbWlzc2luZywgd2hpbGUgc3RpbGwgZ3VhcmFudGVlaW5nIGEgZml4ZWQgb3JkZXIu
DQo+ID4gPiA+ID4gPiA+ID4gPiBUaGUNCj4gPiA+ID4gPiA+ID4gPiA+ICJyZWZfY2siIGlzDQo+
ID4gPiA+ID4gPiA+ID4gPiBrZXB0DQo+ID4gPiA+ID4gPiA+ID4gPiBhcyBhIGNvbnN0IGV2ZW4g
dGhvdWdoIGl0IGlzIG9wdGlvbmFsIGZvciBzaW1wbGljaXR5LA0KPiA+ID4gPiA+ID4gPiA+ID4g
c2luY2UgaXQNCj4gPiA+ID4gPiA+ID4gPiA+IGlzDQo+ID4gPiA+ID4gPiA+ID4gPiBwcmVzZW50
IGluIGFsbCBjdXJyZW50IGR0cyBmaWxlcy4NCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPA0KPiA+ID4g
PiA+ID4gPiA+ID4gbmZyYXByYWRvQGNvbGxhYm9yYS5jb20+DQo+ID4gPiA+ID4gPiA+ID4gPiAt
LS0NCj4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ID4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGstDQo+ID4gPiA+ID4gPiA+ID4gPiB4aGNpLnlhbWwg
ICAgICAgfCA5DQo+ID4gPiA+ID4gPiA+ID4gPiArKysrKysrLS0NCj4gPiA+ID4gPiA+ID4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+ID4g
PiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiA+ID4gPiA+
ID4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXRr
LQ0KPiA+ID4gPiA+ID4gPiA+ID4geGhjaS55YW1sDQo+ID4gPiA+ID4gPiA+ID4gPiBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXRrLQ0KPiA+ID4gPiA+
ID4gPiA+ID4geGhjaS55YW1sDQo+ID4gPiA+ID4gPiA+ID4gPiBpbmRleCA2M2NiYzJiNjJkMTgu
Ljk5YTFiMjMzZWM5MCAxMDA2NDQNCj4gPiA+ID4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4g
PiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10
ay0NCj4gPiA+ID4gPiA+ID4gPiA+IHhoY2kueWFtbA0KPiA+ID4gPiA+ID4gPiA+ID4gKysrDQo+
ID4gPiA+ID4gPiA+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
bWVkaWF0ZWssbXRrLQ0KPiA+ID4gPiA+ID4gPiA+ID4geGhjaS55YW1sDQo+ID4gPiA+ID4gPiA+
ID4gPiBAQCAtODAsOCArODAsMTMgQEAgcHJvcGVydGllczoNCj4gPiA+ID4gPiA+ID4gPiA+ICAg
ICAgaXRlbXM6DQo+ID4gPiA+ID4gPiA+ID4gPiAgICAgICAgLSBjb25zdDogc3lzX2NrICAjIHJl
cXVpcmVkLCB0aGUgZm9sbG93aW5nDQo+ID4gPiA+ID4gPiA+ID4gPiBvbmVzDQo+ID4gPiA+ID4g
PiA+ID4gPiBhcmUNCj4gPiA+ID4gPiA+ID4gPiA+IG9wdGlvbmFsDQo+ID4gPiA+ID4gPiA+ID4g
PiAgICAgICAgLSBjb25zdDogcmVmX2NrDQo+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgLSBjb25z
dDogbWN1X2NrDQo+ID4gPiA+ID4gPiA+ID4gPiAtICAgICAgLSBjb25zdDogZG1hX2NrDQo+ID4g
PiA+ID4gPiA+ID4gPiArICAgICAgLSBlbnVtOg0KPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAtIG1jdV9jaw0KPiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAtIGRtYV9jaw0KPiA+ID4g
PiA+ID4gPiA+ID4gKyAgICAgICAgICAtIHhoY2lfY2sNCj4gPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICAtIGVudW06DQo+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgIC0gZG1hX2NrDQo+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAgICAgIC0geGhjaV9jaw0KPiA+ID4gPiA+ID4gPiA+ID4gICAgICAg
IC0gY29uc3Q6IHhoY2lfY2sNCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBZb3Ug
YWxsb3cgbm93IGFsbW9zdCBhbnkgb3JkZXIgaGVyZSwgaW5jbHVkaW5nDQo+ID4gPiA+ID4gPiA+
ID4gaW5jb3JyZWN0DQo+ID4gPiA+ID4gPiA+ID4gbGlrZQ0KPiA+ID4gPiA+ID4gPiA+IHN5cyxy
ZWYseGhjaSx4aGNpLHhoY2kuDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gVGhl
IG9yZGVyIG9mIGNsb2NrcyBoYXMgdG8gYmUgZml4ZWQgYW5kIHdlIGNhbm5vdCBhbGxvdw0KPiA+
ID4gPiA+ID4gPiA+IGZsZXhpYmlsaXR5Lg0KPiA+ID4gPiA+ID4gPiA+IEFyZQ0KPiA+ID4gPiA+
ID4gPiA+IHlvdSBzdXJlIHRoYXQgdGhlc2UgY2xvY2tzIGFyZSBhY3R1YWxseSBvcHRpb25hbCAo
bm90DQo+ID4gPiA+ID4gPiA+ID4gd2lyZWQgdG8NCj4gPiA+ID4gPiA+ID4gPiB0aGUNCj4gPiA+
ID4gPiA+ID4gPiBkZXZpY2UpPw0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gSW4gZmFj
dCwgdGhlc2Ugb3B0aW9uYWwgY2xvY2tzIGFyZSBmaXhlZCwgZHVlIHRvIG5vIGdhdGVzDQo+ID4g
PiA+ID4gPiA+IGFyZQ0KPiA+ID4gPiA+ID4gPiBwcm92aWRlZCwNCj4gPiA+ID4gPiA+ID4gU1cg
Y2FuJ3QgY29udHJvbCB0aGVtIGJ5IENDRjsNCj4gPiA+ID4gPiA+ID4gSW4gdGhpcyBjYXNlLCBJ
IHVzdWFsbHkgdXNlIGEgZml4ZWQgY2xvY2ssIG9yIGlnbm9yZSBpdC4NCj4gPiA+ID4gPiA+IA0K
PiA+ID4gPiA+ID4gQnV0IGluIHNvbWUgdmVyc2lvbnMgdGhlc2UgY2xvY2tzIGFyZSBjb250cm9s
bGFibGUgb3Igbm90Pw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNvbWUgU29DcyBhcmUgY29udHJv
bGxhYmxlLCBzb21lIG9uZXMgYXJlIG5vdCAoZml4ZWQgY2xvY2spLg0KPiA+ID4gPiANCj4gPiA+
ID4gVGhhbmtzIGZvciBjb25maXJtaW5nLiBUaGVuIEkgd291bGQgcHJlZmVyIHRvIG1ha2UgdGhl
c2UgY2xvY2tzDQo+ID4gPiA+IHJlcXVpcmVkDQo+ID4gPiA+IChub3Qgb3B0aW9uYWwpIGFuZCBh
bHdheXMgcHJvdmlkZSB0aGVtIC0gdmlhIGNvbW1vbiBjbG9jaw0KPiA+ID4gPiBmcmFtZXdvcmsg
b3INCj4gPiA+ID4gZml4ZWQtY2xvY2suDQo+ID4gPiANCj4gPiA+IEhpIEtyenlzenRvZiBhbmQg
Q2h1bmZlbmcsDQo+ID4gPiANCj4gPiA+IHRoYW5rIHlvdSBib3RoIGZvciB0aGUgZmVlZGJhY2su
DQo+ID4gPiANCj4gPiA+IFNpbmNlIHRoZSBzb2x1dGlvbiBJIHByb3Bvc2VkIGluIHRoaXMgcGF0
Y2ggaXMgbm90IGFjY2VwdGFibGUgSQ0KPiA+ID4gc2VlDQo+ID4gPiB0d28gb3B0aW9uczoNCj4g
PiA+IDEuIFNwbGl0IHRoZSBjbG9ja3MgaW4gc2V2ZXJhbCBpZiBibG9ja3MgbWF0Y2hlZCBieSBj
b21wYXRpYmxlcw0KPiA+ID4gMi4gTWFrZSB0aGUgY2xvY2tzIHJlcXVpcmVkIGFuZCB1c2UgZml4
ZWQtY2xvY2sgbm9kZXMgZm9yIHRoZQ0KPiA+ID4gbWlzc2luZyBjbG9ja3MgaW4NCj4gPiA+ICAg
IHRoZSBEVA0KPiA+ID4gDQo+ID4gPiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgMSBpcyB0aGUg
ZGVzaXJhYmxlIHNvbHV0aW9uIGlmIHRoZSBjbG9jaw0KPiA+ID4gaXMgcmVhbGx5DQo+ID4gPiBt
aXNzaW5nIGluIHNvbWUgaGFyZHdhcmUgdmFyaWFudHMsIHdoaWxlIDIgaXMgZGVzaXJhYmxlIGlm
IGFsbA0KPiA+ID4gaGFyZHdhcmUgdmFyaWFudHMNCj4gPiA+IHJlYWxseSByZWNlaXZlIGFsbCB0
aGUgY2xvY2tzLCBvbmx5IHRoYXQgb24gc29tZSB2YXJpYW50cyB0aGV5J3JlDQo+ID4gPiBmaXhl
ZCBhbmQgbm90DQo+ID4gPiBjb250cm9sYWJsZSBieSBTVy4NCj4gPiA+IA0KPiA+ID4gRnJvbSB3
aGF0IEknbSByZWFkaW5nIG9mIHRoaXMgZGlzY3Vzc2lvbiBpdCBzZWVtcyB0aGF0IHRoZSBsYXR0
ZXINCj4gPiA+IGlzIHRoZSBjYXNlDQo+ID4gPiBoZXJlIGFuZCB0aHVzIHdlIHNob3VsZCBnbyBm
b3IgMi4gSXMgdGhpcyBjb3JyZWN0Pw0KPiA+IA0KPiA+IFRoaXMgaXMgaG93IEkgdW5kZXJzdG9v
ZCBpdCBhcyB3ZWxsLCBzbyBjb3JyZWN0IGZyb20gbXkgc2lkZS4NCj4gDQo+IEFsc28gcmlnaHQg
Zm9yIG1lLg0KPiANCj4gPiANCj4gPiA+IA0KPiA+ID4gQWxzbyBDaHVuZmVuZywgZG8geW91IGhh
dmUgaW5mb3JtYXRpb24gb24gd2hldGhlciB0aGUgc2FtZSBpcw0KPiA+ID4gdHJ1ZQ0KPiA+ID4g
Zm9yIHRoZSBNTUMNCj4gPiA+IEhXIGJsb2NrPyBJIHJlY2VudGx5IHN1Ym1pdHRlZCBzb21lIGNo
YW5nZXMgdG8gdGhhdCBiaW5kaW5nIFsxXQ0KPiA+ID4gYnV0DQo+ID4gPiBJIGZvbGxvd2VkDQo+
ID4gPiBhcHByb2FjaCAxIHRoZXJlIGluc3RlYWQuIEhvd2V2ZXIgaWYgYWxsIHRoZSBjbG9ja3Mg
YXJlIHByZXNlbnQNCj4gPiA+IGluDQo+ID4gPiB0aGUgSFcgbGV2ZWwNCj4gPiA+IHRoZXJlIGFz
IHdlbGwgaXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIGZvciBtZSB0byBjaGFuZ2UgaXQgdG8NCj4g
PiA+IGZvbGxvdyBhcHByb2FjaCAyLg0KPiANCj4gSSBkaXNjdXNzZWQgaXQgd2l0aCBXZW5iaW4s
IE1NQyBzZWVtcyBhIGxpdHRsZSBkaWZmZXJlbnQgd2l0aCBVU0IsDQo+IA0KPiBIaSBXZW5iaW4s
DQo+IA0KPiAgICBQbGVhc2UgZ2l2ZSBzb21lIGNvbW1lbnRzIGFib3V0IE1NQywgdGhhbmtzDQo+
IA0KSGkgQ2h1bmZlbmcsDQoNCkFzIHdlIGRpc2N1c3NlZCwgdGhlIGZvbGxvd2luZyBjaGFuZ2Ug
aXMgdGhlIGRlc2lyYWJsZSBzb2x1dGlvbiBmb3IgdGhlDQpNZWRpYXRlayBNTUMgSFcuDQoNCmh0
dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtbWVkaWF0ZWsvMjAyMi1K
dW5lLzA0MzY5MS5odG1sDQoNClRoYW5rcy4NCj4gPiA+IA0KPiA+ID4gVGhhbmtzLA0KPiA+ID4g
TsOtY29sYXMNCj4gPiA+IA0KPiA+ID4gWzFdIA0KPiA+ID4gDQpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyMjA2MTcyMzAxMTQuMjQzODg3NS0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29t
DQo+ID4gDQo+ID4gDQo+ID4gQmVzdCByZWdhcmRzLA0KPiA+IEtyenlzenRvZg0KPiANCj4gDQo=


