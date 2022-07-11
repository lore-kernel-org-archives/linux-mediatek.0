Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9025DC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSmrJnMV+4sgDE5XGFnE7yquvK/qpl6EePh4DLNE+88=; b=qT56n/yvt/o6tR+2xED4yOvrIS
	2nWxB11LYYtjq9rThclLPAs6jXQAJuKwlL0RI0uc9G5ANdsxQ/EzUgSRTLFqO3p1O/R8nibPtTwFT
	t6k2x9nh+BAL7h+4LruUa/i3a+VlItcXZMnFu0XS7OqA9Taw2QFMDM4uRTe0oiFlCnZ2t7lnz1o42
	vccGlydJ9yNNGtlq5HlrnA5jnJoCiMvP1XLUmacL/VnFVoTPjSMvqxaJN2H7aETTn4lGB4ie7NMuk
	9/oHUTaQrDMf0Vm1Cdd7Wq7tmMQ4FQSS2hoawjJrg+p6b3RPN3v5yOjyfFO7cYS87KvzwalUt1vVy
	m97eRGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnjg-00GlVA-6C; Mon, 11 Jul 2022 07:21:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnZw-00Gees-C9; Mon, 11 Jul 2022 07:11:38 +0000
X-UUID: 1b660d200e6d4412be4540ccc817c011-20220711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=HSmrJnMV+4sgDE5XGFnE7yquvK/qpl6EePh4DLNE+88=;
	b=oQKs+7rc/nDD2tiDpRwQ5dMJrbdB/4m1Sn+EaXBTwQpmTM1pR4gMThUgnIz1y8ZWVigZm4QZ0JOCzZIE4HWci644p68U2IxJHUnYH1GbsCzqTgAVy5HvXNm8t+go/mQj1Z/2XtCUVQlSDuBHKSOjm76axiKAETF+NaFrlUAz1YM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:141fa438-e12e-4eb8-bbe5-512f8d9210b9,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:8f1b23d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1b660d200e6d4412be4540ccc817c011-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1560395541; Mon, 11 Jul 2022 00:11:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 11 Jul 2022 14:40:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jul 2022 14:40:45 +0800
Message-ID: <a5d9c16254b155180ef7e45af69de44257593284.camel@mediatek.com>
Subject: Re: [PATCH] Revert "dt-bindings: usb: mtk-xhci: Make all clocks
 required"
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <kernel@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-usb@vger.kernel.org>
Date: Mon, 11 Jul 2022 14:40:44 +0800
In-Reply-To: <20220708192605.43351-1-nfraprado@collabora.com>
References: <20220708192605.43351-1-nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_001136_465151_4EE46289 
X-CRM114-Status: GOOD (  18.61  )
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

T24gRnJpLCAyMDIyLTA3LTA4IGF0IDE1OjI2IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gVGhpcyByZXZlcnRzIGNvbW1pdCBlYmM0OTY5YWUxMjVlNjVmZGI1NjNmNjZm
NGJmYTdhZWM5NWY3ZWI0LiBUaGF0DQo+IGNvbW1pdCB3YXMgc3VwcG9zZWQgdG8gbWFrZSB0aGUg
YmluZGluZyBiZXR0ZXIgcmVmbGVjdCB0aGUgTWVkaWFUZWsNCj4gWEhDSQ0KPiBoYXJkd2FyZSBi
bG9jayBieSByZXF1aXJpbmcgYWxsIGNsb2NrcyB0byBiZSBwcmVzZW50LiBCdXQgZG9pbmcgdGhh
dA0KPiBhbHNvIGNhdXNlcyB0b28gbXVjaCBub2lzZSBpbiB0aGUgZGV2aWNldHJlZXMsIHNpbmNl
IGl0IHJlcXVpcmVzDQo+IHVwZGF0aW5nIG9sZCBNZWRpYVRlayBEVHMgdG8gYWRkIGNsb2NrIGhh
bmRsZXMgZm9yIHRoZSBmaXhlZCBjbG9ja3MsDQo+IGFuZA0KPiBnb2luZyBmb3J3YXJkIGV2ZXJ5
IG5ldyBjbG9jayBhZGRlZCB0byB0aGUgYmluZGluZyB3b3VsZCByZXF1aXJlIGV2ZW4NCj4gbW9y
ZSB1cGRhdGVzLg0KPiANCj4gVGhlIGNvbW1pdCBhbHNvIGRpZG4ndCB1cGRhdGUgdGhlIGV4YW1w
bGUgdG8gbWF0Y2ggdGhlIGNoYW5nZXMsDQo+IGNhdXNpbmcNCj4gYWRkaXRpb25hbCB3YXJuaW5n
cy4NCj4gDQo+IEluc3RlYWQgbGV0J3Mga2VlcCB0aGUgY2xvY2tzIG9wdGlvbmFsIHNvIHRoYXQg
b2xkIGRldmljZXRyZWVzIGNhbg0KPiBrZWVwDQo+IG9taXR0aW5nIHRoZSBmaXhlZCBjbG9ja3Ms
IGFuZCB3ZSdsbCBqdXN0IGFkZCB0aGUgY2xvY2tzIGFzIHJlcXVpcmVkDQo+IG9uDQo+IG5ldyBE
VHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXBy
YWRvQGNvbGxhYm9yYS5jb20+DQo+IA0KPiAtLS0NCj4gDQo+ICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay14aGNpLnlhbWwgfCA0DQo+ICsrKy0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVr
LG10ay0NCj4geGhjaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Vz
Yi9tZWRpYXRlayxtdGstDQo+IHhoY2kueWFtbA0KPiBpbmRleCAxNDQ0ZDE4ZWY5YmMuLjYzY2Jj
MmI2MmQxOCAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9tZWRpYXRlayxtdGsteGhjaS55YW1sDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWssbXRrLXhoY2kueWFtbA0KPiBAQCAtNjcsNiArNjcs
NyBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgIG1heEl0ZW1zOiAxDQo+ICANCj4gICAgY2xvY2tzOg0K
PiArICAgIG1pbkl0ZW1zOiAxDQo+ICAgICAgaXRlbXM6DQo+ICAgICAgICAtIGRlc2NyaXB0aW9u
OiBDb250cm9sbGVyIGNsb2NrIHVzZWQgYnkgbm9ybWFsIG1vZGUNCj4gICAgICAgIC0gZGVzY3Jp
cHRpb246IFJlZmVyZW5jZSBjbG9jayB1c2VkIGJ5IGxvdyBwb3dlciBtb2RlIGV0Yw0KPiBAQCAt
NzUsOCArNzYsOSBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgICAgLSBkZXNjcmlwdGlvbjogY29udHJv
bGxlciBjbG9jaw0KPiAgDQo+ICAgIGNsb2NrLW5hbWVzOg0KPiArICAgIG1pbkl0ZW1zOiAxDQo+
ICAgICAgaXRlbXM6DQo+IC0gICAgICAtIGNvbnN0OiBzeXNfY2sNCj4gKyAgICAgIC0gY29uc3Q6
IHN5c19jayAgIyByZXF1aXJlZCwgdGhlIGZvbGxvd2luZyBvbmVzIGFyZSBvcHRpb25hbA0KPiAg
ICAgICAgLSBjb25zdDogcmVmX2NrDQo+ICAgICAgICAtIGNvbnN0OiBtY3VfY2sNCj4gICAgICAg
IC0gY29uc3Q6IGRtYV9jaw0KDQpSZXZpZXdlZC1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55
dW5AbWVkaWF0ZWsuY29tPg0KDQpUaGFua3MgYSBsb3QNCg0KDQo=


