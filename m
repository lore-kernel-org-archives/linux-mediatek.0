Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FBCCC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 02:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhH9L8obwVzMTy+MS8TAJkOwThNapLVErh0qD2cyQ/A=; b=qgr6dMbLDBXNI9
	g9LpY7Ulc25QOaBRu/rKIB8YxAngpbxwVSDA1FmB4j8vpi9sC2mldSsFV+K0bKqgxIFgSRHE1yB31
	ZV5w0dzAhfIO+UDdGjBIghpglIkogHyudwi4HS5c37rS4YMNWWk+dBwxLC8a4jtCctGD51YhDaEb7
	wijUbh3lhrRlYx4/ewulC/vScSOIXKbhXpPOLmUxkwWHbX/XLV7X5uiFhGv2kwihrO0IwAr7BXLi8
	KLRtcJ3faTrcyJfQNeXqyEdTH5srDCOiv0ppdewYCA8SiHz+ydPH87YX63l+H1ibD7JSXiO+4ZWyl
	WjG7SdSBQCQEJLlTjoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmR9v-00Dc7a-Ic; Thu, 05 May 2022 02:24:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmR9j-00Dc4U-Ee; Thu, 05 May 2022 02:23:54 +0000
X-UUID: 353e05bf081242708837031234ec688b-20220504
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GB6OL9fD2d3+MWPGrjbJVHaDVGrKZnA0c2UsFTbxmSo=; 
 b=uOMn9x0NcOKQG9zz7QtHrh0dHlf8dxpNkHCeOYvdlUIWZFXhgWyKf/i6V5w1I61uHbXxabvb5FvRnIiLo3WOnKOCDZkO/UctpO3O6KpBDVsTC4/qAse0nAbFT3xWptsw5P1V7kERTI7nrPMVBs4Z9XjWt3sqai0tEXw2eSwgZuw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:64d9c5c0-dadf-4486-b98d-30ff775b6c9f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:e1509bb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 353e05bf081242708837031234ec688b-20220504
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 86357422; Wed, 04 May 2022 19:23:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 19:13:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 5 May 2022 10:13:43 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 5 May 2022 10:13:41 +0800
Message-ID: <97d295bf950ea3dbccbcaa7f5a60ccc7bc0b1cab.camel@mediatek.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>, "=?ISO-8859-1?Q?N=EDcolas?= F. R. A.	Prado"
 <nfraprado@collabora.com>
CC: Mark Brown <broonie@kernel.org>, <kernel@collabora.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Shane Chien
 <shane.chien@mediatek.com>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 5 May 2022 10:13:42 +0800
In-Reply-To: <YnLkYKmJ0TJ8uyjC@robh.at.kernel.org>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
 <YnLkYKmJ0TJ8uyjC@robh.at.kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_192351_573218_EF7D1F84 
X-CRM114-Status: GOOD (  20.67  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIyLTA1LTA0IGF0IDE1OjM4IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gRnJpLCBBcHIgMjksIDIwMjIgYXQgMDQ6MzA6MzdQTSAtMDQwMCwgTsOtY29sYXMgRi4gUi4g
QS4gUHJhZG8NCj4gd3JvdGU6DQo+ID4gVGhlIE1lZGlhdGVrIEFGRSBQQ00gY29udHJvbGxlciBm
b3IgTVQ4MTkyIGFsbG93cyBzaGFyaW5nIG9mIGFuIEkyUw0KPiA+IGJ1cw0KPiA+IGJldHdlZW4g
dHdvIGJ1c3Nlcy4gQWRkIGEgcGF0dGVybiBmb3IgdGhlc2UgcHJvcGVydGllcyBpbiB0aGUNCj4g
PiBkdC1iaW5kaW5nLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEu
IFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NCj4gPiANCj4gPiAtLS0NCj4gPiANCj4g
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNt
LnlhbWwgfCA1DQo+ID4gKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvbXQ4MTkyLWFmZS0NCj4gPiBwY20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLQ0KPiA+IHBjbS55YW1sDQo+ID4gaW5kZXgg
N2EyNWJjOWI4MDYwLi41YjAzYzhkYmYzMTggMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwNCj4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20u
eWFtbA0KPiA+IEBAIC01NCw2ICs1NCwxMSBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAtIGNv
bnN0OiBhdWRfaW5mcmFfY2xrDQo+ID4gICAgICAgIC0gY29uc3Q6IGF1ZF9pbmZyYV8yNm1fY2xr
DQo+ID4gIA0KPiA+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gPiArICAiXmkyc1swLTM1LTldLXNo
YXJlJCI6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogTmFtZSBvZiB0aGUgSTJTIGJ1cyB0aGF0IGlz
IHNoYXJlZCB3aXRoIHRoaXMgYnVzDQo+ID4gKyAgICBwYXR0ZXJuOiAiXkkyU1swLTM1LTldJCIN
Cj4gDQo+IFdoeSBub3QgYSBwaGFuZGxlIHRvIHRoZSB0aGUgb3RoZXIgYnVzPyBUaGF0IHdvdWxk
IGJlIHRoZSBEVCB3YXkgdG8NCj4gZG8gDQo+IGl0LiBCdXQgSSdtIG5vdCBzdXJlIEkgcmVhbGx5
IHVuZGVyc3RhbmQgd2hvIGlzIHNoYXJpbmcgd2hhdCBoZXJlLg0KPiANCkkgY2FuIGV4cGxhaW4g
dGhlIHVzYWdlIG9mIHRoaXMgcHJvcGVydHkuIFRoZSBJMlMgaW50ZXJmYWNlIG9mIE1UODE5Mg0K
b25seSBoYXZlIDMgcGlucyBbYml0IGNsb2NrLyBmcmFtZSBjbG9jay8gZGF0YSBpbihvciBvdXQp
XS4gU28gaWYgd2UNCndhbnQgdXNlIHRoZW0gYXMgbm9ybWFsIEkyUyB0aGF0IGhhcyA0IHBpbnMg
W2JpdCBjbG9jay8gZnJhbWUgY2xvY2svDQpkYXRhIGluLyBkYXRhIG91dF0sIHdlIG5lZWQgdG8g
Y29tYmluZSB0d28gTVQ4MTkyIEkyUyBpbnRlcmZhY2UgdG8gdXNlLg0KQnV0IHdlIG5lZWQgdG8g
c3BlY2lmeSB3aG9zZSBjbG9jayB0aGV5IHVzZS4gRS5nLiAiaTJzOS1zaGFyZSA9DQoiSTJTOCIi
Lg0KDQo+ID4gKw0KPiA+ICByZXF1aXJlZDoNCj4gPiAgICAtIGNvbXBhdGlibGUNCj4gPiAgICAt
IGludGVycnVwdHMNCj4gPiAtLSANCj4gPiAyLjM2LjANCj4gPiANCj4gPiANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
