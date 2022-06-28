Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CC5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 05:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCGJb4yc8/YCLjVum59uE2aZJUU+uLQYwcz8gXJNods=; b=18zSXH7WKy9kJi+JihNFumQy53
	m7APLa8kTMljNsK9+PebgeDqzGidk3qmQ9NuL1vSndD5jUrNtrHggcKfOeadZPIRA5Va1Slq2uJ63
	0mTwKbuEYJNKTQCl1nasVW6VpW36fxZOF6GrPzStj06KRcTnV8/uVoC3gOuryYKcahljrvkLo2Qno
	8hqqwIgJ5f0cYtYZ6VB8OuwI5GQZ5KHqMytSOHf4ouCHNa0UxNJI4lkXysrEP+z4WtczANUySw61X
	MGR2Gmc+wCepSVL7QWyDe/riGXyZ2wLPUreJWBRu9MwEfLN72jJfVUQzmHYuEO5JYnLgSliOpPYDa
	UW4i19QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o648P-004Sm2-EY; Tue, 28 Jun 2022 05:51:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o647L-004SG3-3n; Tue, 28 Jun 2022 05:50:32 +0000
X-UUID: 882be7c76cd448ba931887d2ffe013d3-20220627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=XCGJb4yc8/YCLjVum59uE2aZJUU+uLQYwcz8gXJNods=;
	b=k+GJNzNJQot6uZBFdGTMqXfDcw4GD0NoRiaL47ytEN09pHKl7b4icOLKdEstsZdJQD2pfi34BkoLx3DMg3WhJuIhymUgpj4mRq1p3jWwH+lFmm/2b/7NDQ1+0suaSX8HPf/nQUQ1/nB+56op8HWcVes/J7Cx6qAKPC7eacwxfPY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:8a1d7901-8d52-42e9-aacb-400d0393d551,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:ce7f04d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 882be7c76cd448ba931887d2ffe013d3-20220627
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 666422464; Mon, 27 Jun 2022 22:50:23 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 28 Jun 2022 08:57:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 08:57:45 +0800
Message-ID: <93c6b7201533325cf7758637dd194a372f3c00c6.camel@mediatek.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: mtk-xhci: Make all clocks
 required
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<kernel@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-usb@vger.kernel.org>
Date: Tue, 28 Jun 2022 08:57:45 +0800
In-Reply-To: <20220623193702.817996-3-nfraprado@collabora.com>
References: <20220623193702.817996-1-nfraprado@collabora.com>
	 <20220623193702.817996-3-nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_225031_224802_843DF4D3 
X-CRM114-Status: GOOD (  20.00  )
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

SGkgTsOtY29sYXMsDQoNCk9uIFRodSwgMjAyMi0wNi0yMyBhdCAxNTozNyAtMDQwMCwgTsOtY29s
YXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+IEFsbCBvZiB0aGUgY2xvY2tzIGxpc3RlZCBpbiB0
aGUgYmluZGluZyBhcmUgYWx3YXlzIHdpcmVkIHRvIHRoZSBYSENJDQo+IGNvbnRyb2xsZXIgaGFy
ZHdhcmUgYmxvY2tzIG9uIGFsbCBTb0NzLiBUaGUgcmVhc29uIHNvbWUgY2xvY2tzIHdlcmUNCj4g
bWFkZQ0KPiBvcHRpb25hbCBpbiB0aGUgYmluZGluZyB3YXMgdG8gYWNjb3VudCBmb3IgdGhlIGZh
Y3QgdGhhdCBkZXBlbmRpbmcgb24NCj4gdGhlIFNvQywgc29tZSBvZiB0aGUgY2xvY2tzIG1pZ2h0
IGJlIGZpeGVkIChpZSBub3QgY29udHJvbGxlZCBieQ0KPiBzb2Z0d2FyZSkuDQo+IA0KPiBHaXZl
biB0aGF0IHRoZSBkZXZpY2V0cmVlIHNob3VsZCByZXByZXNlbnQgdGhlIGhhcmR3YXJlLCBtYWtl
IGFsbA0KPiBjbG9ja3MNCj4gcmVxdWlyZWQgaW4gdGhlIGJpbmRpbmcuIFN1YnNlcXVlbnQgcGF0
Y2hlcyB3aWxsIG1ha2UgdGhlIERUUyBjaGFuZ2VzDQo+IHRvDQo+IHNwZWNpZnkgZml4ZWQtY2xv
Y2tzIGZvciB0aGUgY2xvY2tzIHRoYXQgYXJlbid0IGNvbnRyb2xsYWJsZS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNv
bT4NCj4gDQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBVbmRpZCBjbG9jayBsaXN0
IGNoYW5nZXMgdGhhdCBhbGxvd2VkIG1pZGRsZSBjbG9ja3MgdG8gYmUgbWlzc2luZw0KPiBmcm9t
DQo+ICAgdjEgYW5kIG1hZGUgYWxsIGNsb2NrcyByZXF1aXJlZCBpbnN0ZWFkDQo+IC0gUmV3cm90
ZSBjb21taXQgbWVzc2FnZSBhbmQgdGl0bGUNCj4gDQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay14aGNpLnlhbWwgfCA0ICsNCj4gLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxt
dGstDQo+IHhoY2kueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
bWVkaWF0ZWssbXRrLQ0KPiB4aGNpLnlhbWwNCj4gaW5kZXggNjNjYmMyYjYyZDE4Li4xNDQ0ZDE4
ZWY5YmMgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2IvbWVkaWF0ZWssbXRrLXhoY2kueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay14aGNpLnlhbWwNCj4gQEAgLTY3LDcgKzY3LDYg
QEAgcHJvcGVydGllczoNCj4gICAgICBtYXhJdGVtczogMQ0KPiAgDQo+ICAgIGNsb2NrczoNCj4g
LSAgICBtaW5JdGVtczogMQ0KPiAgICAgIGl0ZW1zOg0KPiAgICAgICAgLSBkZXNjcmlwdGlvbjog
Q29udHJvbGxlciBjbG9jayB1c2VkIGJ5IG5vcm1hbCBtb2RlDQo+ICAgICAgICAtIGRlc2NyaXB0
aW9uOiBSZWZlcmVuY2UgY2xvY2sgdXNlZCBieSBsb3cgcG93ZXIgbW9kZSBldGMNCj4gQEAgLTc2
LDkgKzc1LDggQEAgcHJvcGVydGllczoNCj4gICAgICAgIC0gZGVzY3JpcHRpb246IGNvbnRyb2xs
ZXIgY2xvY2sNCj4gIA0KPiAgICBjbG9jay1uYW1lczoNCj4gLSAgICBtaW5JdGVtczogMQ0KPiAg
ICAgIGl0ZW1zOg0KPiAtICAgICAgLSBjb25zdDogc3lzX2NrICAjIHJlcXVpcmVkLCB0aGUgZm9s
bG93aW5nIG9uZXMgYXJlIG9wdGlvbmFsDQo+ICsgICAgICAtIGNvbnN0OiBzeXNfY2sNCj4gICAg
ICAgIC0gY29uc3Q6IHJlZl9jaw0KPiAgICAgICAgLSBjb25zdDogbWN1X2NrDQo+ICAgICAgICAt
IGNvbnN0OiBkbWFfY2sNCg0KVGhpcyBwYXRjaCBjYXVzZXMgbW9yZSBjaGVjayB3YXJuaW5nLCBJ
IHByZWZlciB0byBsZWF2ZSBkdC1iaW5kaW5ncw0KdW5jaGFuZ2VkLCBidXQganVzdCBmaXggbXQ4
MTk1J3MgZHRzIHdhcm5pbmcgaW5zdGVhZCwgdGhhbmtzIGEgbG90DQoNCg0K


