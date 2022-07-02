Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B8EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Jul 2022 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7H5R2TV1GT+v9OpNFSEf6zlJsaWwFJ9tMcXdIm3LDEA=; b=yCMWPXplD/h8tIwQMdugr6XkPH
	FGtXj76ELpt7JKdFBVkwylo6MkHmZCjebWLN8gLaGlymZsiBB2q5KDvfKGJETZree89fiAAaZzFpn
	UdX3404ti+JQUGF+WwUpJ4Ol/NmvnpLoYzo0H0o5AUoN/B+QFqzdECch3lXuU66yziDICaDX3BxH4
	GFYQ1aIVCsNoj+9kdMUkDfGxghZQ+xM5333EW/YNCWK/sKrhUglICtZl823wnN7jyXIbB7K/jAETl
	K8GTI36mPQDo/RiZyqQL0shGYOCC7UBvIx4VT3g5iiGBk0YVIa57nJzHx39pFpJZ60BDGxRbX2vyu
	rlZecngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7YQe-008eAh-7x; Sat, 02 Jul 2022 08:24:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7YQa-008e6r-Ep; Sat, 02 Jul 2022 08:24:33 +0000
X-UUID: 639b50740611474d96c4e117d35aaff5-20220702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=7H5R2TV1GT+v9OpNFSEf6zlJsaWwFJ9tMcXdIm3LDEA=;
	b=HZmHJnNVjuZdKGniMwTxmWH0GeWK41vrzE3T6luxykDYqUIcfwff2VCnNJ0Uvy7xCuySG8H20/fle0vn83+xFgn+6A0AqLatqULyVvh3EeuSVSXZJXL4uR+00SpoRb2PctUbczeZUsxwrkwcY0gMAUlUyTUz5T5nsJHM6PTX5hk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:c74353d1-debf-4d2f-a88f-c37f373a9786,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:f5986ad6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 639b50740611474d96c4e117d35aaff5-20220702
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 807059943; Sat, 02 Jul 2022 01:24:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 2 Jul 2022 16:24:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 2 Jul 2022 16:24:12 +0800
Message-ID: <5f85280ea5fd0d4b445307a13a70c3e3fe552ccf.camel@mediatek.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: mtk-xhci: Make all clocks
 required
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>, "=?ISO-8859-1?Q?N=EDcolas?= F. R. A.	Prado"
	<nfraprado@collabora.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <kernel@collabora.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-usb@vger.kernel.org>
Date: Sat, 2 Jul 2022 16:24:12 +0800
In-Reply-To: <20220701213702.GA1591697-robh@kernel.org>
References: <20220623193702.817996-1-nfraprado@collabora.com>
	 <20220623193702.817996-3-nfraprado@collabora.com>
	 <93c6b7201533325cf7758637dd194a372f3c00c6.camel@mediatek.com>
	 <20220629185546.z6rn7xp3ejpmaupi@notapiano>
	 <20220701213702.GA1591697-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_012432_529662_EE7B247C 
X-CRM114-Status: GOOD (  34.18  )
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

T24gRnJpLCAyMDIyLTA3LTAxIGF0IDE1OjM3IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gV2VkLCBKdW4gMjksIDIwMjIgYXQgMDI6NTU6NDZQTSAtMDQwMCwgTsOtY29sYXMgRi4gUi4g
QS4gUHJhZG8NCj4gd3JvdGU6DQo+ID4gT24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgMDg6NTc6NDVB
TSArMDgwMCwgQ2h1bmZlbmcgWXVuIHdyb3RlOg0KPiA+ID4gSGkgTsOtY29sYXMsDQo+ID4gPiAN
Cj4gPiA+IE9uIFRodSwgMjAyMi0wNi0yMyBhdCAxNTozNyAtMDQwMCwgTsOtY29sYXMgRi4gUi4g
QS4gUHJhZG8gd3JvdGU6DQo+ID4gPiA+IEFsbCBvZiB0aGUgY2xvY2tzIGxpc3RlZCBpbiB0aGUg
YmluZGluZyBhcmUgYWx3YXlzIHdpcmVkIHRvIHRoZQ0KPiA+ID4gPiBYSENJDQo+ID4gPiA+IGNv
bnRyb2xsZXIgaGFyZHdhcmUgYmxvY2tzIG9uIGFsbCBTb0NzLiBUaGUgcmVhc29uIHNvbWUgY2xv
Y2tzDQo+ID4gPiA+IHdlcmUNCj4gPiA+ID4gbWFkZQ0KPiA+ID4gPiBvcHRpb25hbCBpbiB0aGUg
YmluZGluZyB3YXMgdG8gYWNjb3VudCBmb3IgdGhlIGZhY3QgdGhhdA0KPiA+ID4gPiBkZXBlbmRp
bmcgb24NCj4gPiA+ID4gdGhlIFNvQywgc29tZSBvZiB0aGUgY2xvY2tzIG1pZ2h0IGJlIGZpeGVk
IChpZSBub3QgY29udHJvbGxlZA0KPiA+ID4gPiBieQ0KPiA+ID4gPiBzb2Z0d2FyZSkuDQo+ID4g
PiA+IA0KPiA+ID4gPiBHaXZlbiB0aGF0IHRoZSBkZXZpY2V0cmVlIHNob3VsZCByZXByZXNlbnQg
dGhlIGhhcmR3YXJlLCBtYWtlDQo+ID4gPiA+IGFsbA0KPiA+ID4gPiBjbG9ja3MNCj4gPiA+ID4g
cmVxdWlyZWQgaW4gdGhlIGJpbmRpbmcuIFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIG1ha2UgdGhl
IERUUw0KPiA+ID4gPiBjaGFuZ2VzDQo+ID4gPiA+IHRvDQo+ID4gPiA+IHNwZWNpZnkgZml4ZWQt
Y2xvY2tzIGZvciB0aGUgY2xvY2tzIHRoYXQgYXJlbid0IGNvbnRyb2xsYWJsZS4NCj4gPiA+ID4g
DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJh
ZG9AY29sbGFib3JhLmNvbT4NCj4gPiA+ID4gDQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiANCj4gPiA+
ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiA+ID4gLSBVbmRpZCBjbG9jayBsaXN0IGNoYW5nZXMgdGhh
dCBhbGxvd2VkIG1pZGRsZSBjbG9ja3MgdG8gYmUNCj4gPiA+ID4gbWlzc2luZw0KPiA+ID4gPiBm
cm9tDQo+ID4gPiA+ICAgdjEgYW5kIG1hZGUgYWxsIGNsb2NrcyByZXF1aXJlZCBpbnN0ZWFkDQo+
ID4gPiA+IC0gUmV3cm90ZSBjb21taXQgbWVzc2FnZSBhbmQgdGl0bGUNCj4gPiA+ID4gDQo+ID4g
PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay14
aGNpLnlhbWwgfA0KPiA+ID4gPiA0ICsNCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gPiA+IA0KPiA+ID4gPiBk
aWZmIC0tZ2l0DQo+ID4gPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Vz
Yi9tZWRpYXRlayxtdGstDQo+ID4gPiA+IHhoY2kueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXRrLQ0KPiA+ID4gPiB4aGNpLnlhbWwNCj4gPiA+
ID4gaW5kZXggNjNjYmMyYjYyZDE4Li4xNDQ0ZDE4ZWY5YmMgMTAwNjQ0DQo+ID4gPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXRrLQ0KPiA+
ID4gPiB4aGNpLnlhbWwNCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9tZWRpYXRlayxtdGstDQo+ID4gPiA+IHhoY2kueWFtbA0KPiA+ID4gPiBAQCAt
NjcsNyArNjcsNiBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiAgICAgIG1heEl0ZW1zOiAxDQo+ID4g
PiA+ICANCj4gPiA+ID4gICAgY2xvY2tzOg0KPiA+ID4gPiAtICAgIG1pbkl0ZW1zOiAxDQo+ID4g
PiA+ICAgICAgaXRlbXM6DQo+ID4gPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBDb250cm9sbGVy
IGNsb2NrIHVzZWQgYnkgbm9ybWFsIG1vZGUNCj4gPiA+ID4gICAgICAgIC0gZGVzY3JpcHRpb246
IFJlZmVyZW5jZSBjbG9jayB1c2VkIGJ5IGxvdyBwb3dlciBtb2RlDQo+ID4gPiA+IGV0Yw0KPiA+
ID4gPiBAQCAtNzYsOSArNzUsOCBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiAgICAgICAgLSBkZXNj
cmlwdGlvbjogY29udHJvbGxlciBjbG9jaw0KPiA+ID4gPiAgDQo+ID4gPiA+ICAgIGNsb2NrLW5h
bWVzOg0KPiA+ID4gPiAtICAgIG1pbkl0ZW1zOiAxDQo+ID4gPiA+ICAgICAgaXRlbXM6DQo+ID4g
PiA+IC0gICAgICAtIGNvbnN0OiBzeXNfY2sgICMgcmVxdWlyZWQsIHRoZSBmb2xsb3dpbmcgb25l
cyBhcmUNCj4gPiA+ID4gb3B0aW9uYWwNCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IHN5c19jaw0K
PiA+ID4gPiAgICAgICAgLSBjb25zdDogcmVmX2NrDQo+ID4gPiA+ICAgICAgICAtIGNvbnN0OiBt
Y3VfY2sNCj4gPiA+ID4gICAgICAgIC0gY29uc3Q6IGRtYV9jaw0KPiA+ID4gDQo+ID4gPiBUaGlz
IHBhdGNoIGNhdXNlcyBtb3JlIGNoZWNrIHdhcm5pbmcsIEkgcHJlZmVyIHRvIGxlYXZlIGR0LQ0K
PiA+ID4gYmluZGluZ3MNCj4gPiA+IHVuY2hhbmdlZCwgYnV0IGp1c3QgZml4IG10ODE5NSdzIGR0
cyB3YXJuaW5nIGluc3RlYWQsIHRoYW5rcyBhDQo+ID4gPiBsb3QNCj4gPiANCj4gPiBIaSBDaHVu
ZmVuZywNCj4gPiANCj4gPiB0aGUgd2FybmluZ3MgcmVwb3J0ZWQgYnkgUm9iJ3MgYm90IG9ubHkg
aGFwcGVuIGlmIHBhdGNoZXMgMyBhbmQgNA0KPiA+IGFyZW4ndCBhcHBsaWVkDQo+ID4gdG8gYWRh
cHQgdGhlIGRldmljZXRyZWVzLiBUaGV5IGFyZSBBQkkgYnJlYWtpbmcgY2hhbmdlcywgYnV0IEkN
Cj4gPiB1bmRlcnN0b29kIHRoaXMNCj4gPiBhcyB0aGUgZGVzaXJlZCBzb2x1dGlvbiBmcm9tIHRo
ZSBkaXNjdXNzaW9uIHdlIGhhZCB3aXRoIEtyenlzenRvZg0KPiA+IG9uIHYxIFsxXS4NCj4gDQo+
IFRoZSB3YXJuaW5ncyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCBwYXRjaGVzIDMgYW5kIDQgYXMg
dGhvc2UgYXJlDQo+IGZvciANCj4gZHRzIGZpbGVzLiBJdCdzIGV4YW1wbGVzIGluIGJpbmRpbmdz
IHRoYXQgYXJlIHRoZSBwcm9ibGVtLg0KWWVzLCBJIG1lYW4gYWxtb3N0IGFsbCBleGlzdGluZyBk
dHMgc3VwcG9ydGluZyBtdGsteGhjaSB3aWxsIGFsc28gY2F1c2UNCnNpbWlsYXIgd2FybmluZ3Ms
IGFzIGNoYW5nZXMgaW4gcGF0Y2hlcyAzLCA0Ow0KDQpJdCBzZWVtcyBsZXNzIGZsZXhpYmxlIHRv
IG1ha2UgYWxsIGNsb2NrIHJlcXVpcmVkLCBub3Qgb25seSBjaGFuZ2VzIGFsbA0KZXhpc3Rpbmcg
b25lcyBidXQgYWxzbyBuZWVkIG1vcmUgY2hhbmdlcyBpZiBhZGRpdGlvbmFsIGNsb2NrIGlzIGFk
ZGVkLg0KDQo+IA0KPiBSb2INCg==


