Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39978C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 01:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CAnckUVLIdpcVI3XtboSOYe70XuxxbVOevI1nrW1TE=; b=xCKayL4LJRTHL4H4u+1+9eVsdw
	PeEJyZ/38TZ8fPAFSRHI5irzSsIqrdRCmIoHBoRrHuVCb7mNzQSIH7wa9s5bb4rUFcbOCPag04Vwe
	L29gC2a0/nnbVDPOSdgPPfkeF5Umi3b1NmVm1CmD7UfR1f8RceW62XUrx2z7TMvG37JG7g/Xhq7ZS
	vzMLV7/TzqqFEzZnwzNc1ipvQIkMvp86xnG4j61QTA+CtbGXDTSuitjutsGhTfxkblqSIzuF7rGmm
	zgIsnPOBdJy8x1MY5DiBoBbI7IxbHTZXULCAl6aEB10TAYZw/rlI2pkibP0TIB6nUeWgnjuHGJvhQ
	LF53IHjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9G39-00Cw2b-Km; Thu, 07 Jul 2022 01:11:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9G37-00Cw1o-1l; Thu, 07 Jul 2022 01:11:22 +0000
X-UUID: 2e1e92041c6c48fdb50bc0ea63c0155c-20220706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=4CAnckUVLIdpcVI3XtboSOYe70XuxxbVOevI1nrW1TE=;
	b=pkUjsFIdvAJp2aY3cM0i7poC1tza8KUmkQUP5skqPPkwiJwVHdtVsdX/tjOPK43owUY0vuffjMTAVtJNnrD2fzlqU/UQsnkL8BaJaGPFuy1kE8jWJGAcwAl1/xpygiOYeqMSMfKFqEZQNavgbuyx1/0ltexf45RSRbC3HqnNjAQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:9836ae45-8352-469b-b1c3-dfa93b31b275,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:47f6be86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 2e1e92041c6c48fdb50bc0ea63c0155c-20220706
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1111012623; Wed, 06 Jul 2022 18:11:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 7 Jul 2022 09:10:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jul 2022 09:10:38 +0800
Message-ID: <ed72abf85a7c167dfd2abd64a79422a19fc53d06.camel@mediatek.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: mtk-xhci: Make all clocks
 required
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<kernel@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-usb@vger.kernel.org>
Date: Thu, 7 Jul 2022 09:10:38 +0800
In-Reply-To: <20220705203621.hunczzwfhiwpcrhy@notapiano>
References: <20220623193702.817996-1-nfraprado@collabora.com>
	 <20220623193702.817996-3-nfraprado@collabora.com>
	 <93c6b7201533325cf7758637dd194a372f3c00c6.camel@mediatek.com>
	 <20220629185546.z6rn7xp3ejpmaupi@notapiano>
	 <20220701213702.GA1591697-robh@kernel.org>
	 <5f85280ea5fd0d4b445307a13a70c3e3fe552ccf.camel@mediatek.com>
	 <20220705203621.hunczzwfhiwpcrhy@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_181121_144793_FEF20CBF 
X-CRM114-Status: GOOD (  42.10  )
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

T24gVHVlLCAyMDIyLTA3LTA1IGF0IDE2OjM2IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gT24gU2F0LCBKdWwgMDIsIDIwMjIgYXQgMDQ6MjQ6MTJQTSArMDgwMCwgQ2h1
bmZlbmcgWXVuIHdyb3RlOg0KPiA+IE9uIEZyaSwgMjAyMi0wNy0wMSBhdCAxNTozNyAtMDYwMCwg
Um9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIEp1biAyOSwgMjAyMiBhdCAwMjo1NTo0
NlBNIC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbw0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+
IE9uIFR1ZSwgSnVuIDI4LCAyMDIyIGF0IDA4OjU3OjQ1QU0gKzA4MDAsIENodW5mZW5nIFl1biB3
cm90ZToNCj4gPiA+ID4gPiBIaSBOw61jb2xhcywNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBPbiBU
aHUsIDIwMjItMDYtMjMgYXQgMTU6MzcgLTA0MDAsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvDQo+
ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiBBbGwgb2YgdGhlIGNsb2NrcyBsaXN0ZWQgaW4g
dGhlIGJpbmRpbmcgYXJlIGFsd2F5cyB3aXJlZCB0bw0KPiA+ID4gPiA+ID4gdGhlDQo+ID4gPiA+
ID4gPiBYSENJDQo+ID4gPiA+ID4gPiBjb250cm9sbGVyIGhhcmR3YXJlIGJsb2NrcyBvbiBhbGwg
U29Dcy4gVGhlIHJlYXNvbiBzb21lDQo+ID4gPiA+ID4gPiBjbG9ja3MNCj4gPiA+ID4gPiA+IHdl
cmUNCj4gPiA+ID4gPiA+IG1hZGUNCj4gPiA+ID4gPiA+IG9wdGlvbmFsIGluIHRoZSBiaW5kaW5n
IHdhcyB0byBhY2NvdW50IGZvciB0aGUgZmFjdCB0aGF0DQo+ID4gPiA+ID4gPiBkZXBlbmRpbmcg
b24NCj4gPiA+ID4gPiA+IHRoZSBTb0MsIHNvbWUgb2YgdGhlIGNsb2NrcyBtaWdodCBiZSBmaXhl
ZCAoaWUgbm90DQo+ID4gPiA+ID4gPiBjb250cm9sbGVkDQo+ID4gPiA+ID4gPiBieQ0KPiA+ID4g
PiA+ID4gc29mdHdhcmUpLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBHaXZlbiB0aGF0IHRo
ZSBkZXZpY2V0cmVlIHNob3VsZCByZXByZXNlbnQgdGhlIGhhcmR3YXJlLA0KPiA+ID4gPiA+ID4g
bWFrZQ0KPiA+ID4gPiA+ID4gYWxsDQo+ID4gPiA+ID4gPiBjbG9ja3MNCj4gPiA+ID4gPiA+IHJl
cXVpcmVkIGluIHRoZSBiaW5kaW5nLiBTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCBtYWtlIHRoZQ0K
PiA+ID4gPiA+ID4gRFRTDQo+ID4gPiA+ID4gPiBjaGFuZ2VzDQo+ID4gPiA+ID4gPiB0bw0KPiA+
ID4gPiA+ID4gc3BlY2lmeSBmaXhlZC1jbG9ja3MgZm9yIHRoZSBjbG9ja3MgdGhhdCBhcmVuJ3QN
Cj4gPiA+ID4gPiA+IGNvbnRyb2xsYWJsZS4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPA0KPiA+ID4gPiA+ID4gbmZyYXBy
YWRvQGNvbGxhYm9yYS5jb20+DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+ID4gPiA+ID4gLSBVbmRpZCBj
bG9jayBsaXN0IGNoYW5nZXMgdGhhdCBhbGxvd2VkIG1pZGRsZSBjbG9ja3MgdG8gYmUNCj4gPiA+
ID4gPiA+IG1pc3NpbmcNCj4gPiA+ID4gPiA+IGZyb20NCj4gPiA+ID4gPiA+ICAgdjEgYW5kIG1h
ZGUgYWxsIGNsb2NrcyByZXF1aXJlZCBpbnN0ZWFkDQo+ID4gPiA+ID4gPiAtIFJld3JvdGUgY29t
bWl0IG1lc3NhZ2UgYW5kIHRpdGxlDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay0NCj4gPiA+ID4gPiA+
IHhoY2kueWFtbCB8DQo+ID4gPiA+ID4gPiA0ICsNCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiA+ID4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay0NCj4gPiA+ID4gPiA+IHho
Y2kueWFtbA0KPiA+ID4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dXNiL21lZGlhdGVrLG10ay0NCj4gPiA+ID4gPiA+IHhoY2kueWFtbA0KPiA+ID4gPiA+ID4gaW5k
ZXggNjNjYmMyYjYyZDE4Li4xNDQ0ZDE4ZWY5YmMgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay0NCj4gPiA+
ID4gPiA+IHhoY2kueWFtbA0KPiA+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdGstDQo+ID4gPiA+ID4gPiB4aGNpLnlhbWwNCj4g
PiA+ID4gPiA+IEBAIC02Nyw3ICs2Nyw2IEBAIHByb3BlcnRpZXM6DQo+ID4gPiA+ID4gPiAgICAg
IG1heEl0ZW1zOiAxDQo+ID4gPiA+ID4gPiAgDQo+ID4gPiA+ID4gPiAgICBjbG9ja3M6DQo+ID4g
PiA+ID4gPiAtICAgIG1pbkl0ZW1zOiAxDQo+ID4gPiA+ID4gPiAgICAgIGl0ZW1zOg0KPiA+ID4g
PiA+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IENvbnRyb2xsZXIgY2xvY2sgdXNlZCBieSBub3Jt
YWwgbW9kZQ0KPiA+ID4gPiA+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IFJlZmVyZW5jZSBjbG9j
ayB1c2VkIGJ5IGxvdyBwb3dlcg0KPiA+ID4gPiA+ID4gbW9kZQ0KPiA+ID4gPiA+ID4gZXRjDQo+
ID4gPiA+ID4gPiBAQCAtNzYsOSArNzUsOCBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiA+ID4gICAg
ICAgIC0gZGVzY3JpcHRpb246IGNvbnRyb2xsZXIgY2xvY2sNCj4gPiA+ID4gPiA+ICANCj4gPiA+
ID4gPiA+ICAgIGNsb2NrLW5hbWVzOg0KPiA+ID4gPiA+ID4gLSAgICBtaW5JdGVtczogMQ0KPiA+
ID4gPiA+ID4gICAgICBpdGVtczoNCj4gPiA+ID4gPiA+IC0gICAgICAtIGNvbnN0OiBzeXNfY2sg
ICMgcmVxdWlyZWQsIHRoZSBmb2xsb3dpbmcgb25lcyBhcmUNCj4gPiA+ID4gPiA+IG9wdGlvbmFs
DQo+ID4gPiA+ID4gPiArICAgICAgLSBjb25zdDogc3lzX2NrDQo+ID4gPiA+ID4gPiAgICAgICAg
LSBjb25zdDogcmVmX2NrDQo+ID4gPiA+ID4gPiAgICAgICAgLSBjb25zdDogbWN1X2NrDQo+ID4g
PiA+ID4gPiAgICAgICAgLSBjb25zdDogZG1hX2NrDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhp
cyBwYXRjaCBjYXVzZXMgbW9yZSBjaGVjayB3YXJuaW5nLCBJIHByZWZlciB0byBsZWF2ZSBkdC0N
Cj4gPiA+ID4gPiBiaW5kaW5ncw0KPiA+ID4gPiA+IHVuY2hhbmdlZCwgYnV0IGp1c3QgZml4IG10
ODE5NSdzIGR0cyB3YXJuaW5nIGluc3RlYWQsIHRoYW5rcw0KPiA+ID4gPiA+IGENCj4gPiA+ID4g
PiBsb3QNCj4gPiA+ID4gDQo+ID4gPiA+IEhpIENodW5mZW5nLA0KPiA+ID4gPiANCj4gPiA+ID4g
dGhlIHdhcm5pbmdzIHJlcG9ydGVkIGJ5IFJvYidzIGJvdCBvbmx5IGhhcHBlbiBpZiBwYXRjaGVz
IDMgYW5kDQo+ID4gPiA+IDQNCj4gPiA+ID4gYXJlbid0IGFwcGxpZWQNCj4gPiA+ID4gdG8gYWRh
cHQgdGhlIGRldmljZXRyZWVzLiBUaGV5IGFyZSBBQkkgYnJlYWtpbmcgY2hhbmdlcywgYnV0IEkN
Cj4gPiA+ID4gdW5kZXJzdG9vZCB0aGlzDQo+ID4gPiA+IGFzIHRoZSBkZXNpcmVkIHNvbHV0aW9u
IGZyb20gdGhlIGRpc2N1c3Npb24gd2UgaGFkIHdpdGgNCj4gPiA+ID4gS3J6eXN6dG9mDQo+ID4g
PiA+IG9uIHYxIFsxXS4NCj4gPiA+IA0KPiA+ID4gVGhlIHdhcm5pbmdzIGhhdmUgbm90aGluZyB0
byBkbyB3aXRoIHBhdGNoZXMgMyBhbmQgNCBhcyB0aG9zZSBhcmUNCj4gPiA+IGZvciANCj4gPiA+
IGR0cyBmaWxlcy4gSXQncyBleGFtcGxlcyBpbiBiaW5kaW5ncyB0aGF0IGFyZSB0aGUgcHJvYmxl
bS4NCj4gDQo+IFNvcnJ5LCB5b3UncmUgcmlnaHQsIEkgbWlzcmVhZCB0aGUgZXJyb3JzLg0KPiAN
Cj4gPiBZZXMsIEkgbWVhbiBhbG1vc3QgYWxsIGV4aXN0aW5nIGR0cyBzdXBwb3J0aW5nIG10ay14
aGNpIHdpbGwgYWxzbw0KPiA+IGNhdXNlDQo+ID4gc2ltaWxhciB3YXJuaW5ncywgYXMgY2hhbmdl
cyBpbiBwYXRjaGVzIDMsIDQ7DQo+ID4gDQo+ID4gSXQgc2VlbXMgbGVzcyBmbGV4aWJsZSB0byBt
YWtlIGFsbCBjbG9jayByZXF1aXJlZCwgbm90IG9ubHkgY2hhbmdlcw0KPiA+IGFsbA0KPiA+IGV4
aXN0aW5nIG9uZXMgYnV0IGFsc28gbmVlZCBtb3JlIGNoYW5nZXMgaWYgYWRkaXRpb25hbCBjbG9j
ayBpcw0KPiA+IGFkZGVkLg0KPiANCj4gWWVzLCB0aGF0J3MgYSB2YWxpZCBjb25jZXJuLiBJIG11
c3QgaGF2ZSBtaXN1bmRlcnN0b29kIHRoZSBkaXNjdXNzaW9uDQo+IGluIHYxDQo+IHRoZW4uDQo+
IA0KPiBTbywgSSdtIGdvaW5nIHRvIHNlbmQgYSByZXZlcnQgZm9yIHRoaXMgY2hhbmdlIGFuZCBz
ZW5kIGEgbmV3IHBhdGNoDQo+IGFkZGluZyBmaXhlZA0KPiBjbG9ja3Mgb24gdGhlIGR0cyBmb3Ig
anVzdCBtdDgxOTIgYW5kIG10ODE5NSB0byBmaXggdGhlIGR0YnNfY2hlY2sNCj4gd2FybmluZ3Mu
DQo+IERvZXMgdGhhdCBzb3VuZCBnb29kPw0KWWVzLCBzb3VuZCBnb29kLCB0aGFua3MgYSBsb3QN
Cg0KPiANCj4gVGhhbmtzLA0KPiBOw61jb2xhcw0K


