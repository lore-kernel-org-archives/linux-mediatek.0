Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB5CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAcdG7P+4/Q9v0LiuIJGwae1+brO+jv3hzW82EjqJLk=; b=DO3nF0wZae3Ucj
	1HoaOPHoTs3W3Jnog9LViCJoNpBxG4u/04IWpLEhM+Sq6851DFBvRtkDsom51l9Ph3DE7rgvkdlnd
	w99mFGwFNpUdTgV7Sj+mpGn3YHj10+XPc8NMRZU2pMVje1iFjt1qCLbiZ1KVzbWTRi2HokAr7GYlJ
	x061efCKEbal/ZRLTJ8gdsEhJY77M4wFZa1BR8+SPBfjetzVFawG5f7daoN/kzICJZH8ZkivuUXat
	WNQju1ntu/dfk7Q9LkEeVok17/YsTlg5GRl4uhltaVKA+JoDHqyhp/aEg/q6HwqX0g97ydLQj+vdi
	GQSO8NqqvtZXNvBDtSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmzLU-003uT3-K4; Fri, 06 May 2022 14:54:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmzLI-003uQT-Et; Fri, 06 May 2022 14:54:07 +0000
X-UUID: 1ef667830f144c19b8fc7b863a4da235-20220506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nAtrq9RSotWo2dSQ357pYzaGdCyyqj4s+vz9Ff3CNC0=; 
 b=hm6GG9AaRH0AE2pNt2W1jA64JeWDELOXqG9nYvvle+ftLz28LaIXCtVdia07vhlMwLljlHHZVGl89iZexYavRECCPjA1uzypP48zeBHufyswaG1VJjRxxoG09IK5rY7uI0dx8RD+WrkV1VRdzm6PE5ChUk4B6LPtBelJBTzIR24=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:d26d0fe3-168a-4fde-80c1-a32fb6f26cad, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:36c07c16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 1ef667830f144c19b8fc7b863a4da235-20220506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1517220424; Fri, 06 May 2022 07:53:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 07:44:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 6 May 2022 22:44:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 6 May 2022 22:44:23 +0800
Message-ID: <21a51ce08e44d325e0682409e181f178b2689517.camel@mediatek.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Mark Brown" <broonie@kernel.org>, <kernel@collabora.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Shane Chien <shane.chien@mediatek.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Fri, 6 May 2022 22:44:23 +0800
In-Reply-To: <20220506140959.ldy32lyf5jbkkqj2@notapiano>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
 <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
 <cbf2fcbae25408b95875278eb37e829bf4671430.camel@mediatek.com>
 <d1c548bb-8a36-79bf-498d-c909bf7e7679@collabora.com>
 <20220505162537.byiwfe2ghomxhezl@notapiano>
 <559a1e189613484b8528dc4eaf19099e9162fcc6.camel@mediatek.com>
 <20220506140959.ldy32lyf5jbkkqj2@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_075404_552998_C8F8389E 
X-CRM114-Status: GOOD (  59.75  )
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

T24gRnJpLCAyMDIyLTA1LTA2IGF0IDEwOjA5IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gT24gRnJpLCBNYXkgMDYsIDIwMjIgYXQgMDE6NDU6MjRQTSArMDgwMCwgSmlh
eGluIFl1IHdyb3RlOg0KPiA+IE9uIFRodSwgMjAyMi0wNS0wNSBhdCAxMjoyNSAtMDQwMCwgTsOt
Y29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gT24gVGh1LCBNYXkg
MDUsIDIwMjIgYXQgMTA6NTI6NDVBTSArMDIwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwNCj4gPiA+
IFJlZ25vDQo+ID4gPiB3cm90ZToNCj4gPiA+ID4gSWwgMDUvMDUvMjIgMTA6NDgsIEppYXhpbiBZ
dSBoYSBzY3JpdHRvOg0KPiA+ID4gPiA+IE9uIFRodSwgMjAyMi0wNS0wNSBhdCAxMDowOCArMDIw
MCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8NCj4gPiA+ID4gPiB3cm90ZToNCj4gPiA+ID4g
PiA+IElsIDI5LzA0LzIyIDIyOjMwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyBoYSBzY3JpdHRv
Og0KPiA+ID4gPiA+ID4gPiBUaGUgTWVkaWF0ZWsgQUZFIFBDTSBjb250cm9sbGVyIGZvciBNVDgx
OTIgYWxsb3dzIHNoYXJpbmcNCj4gPiA+ID4gPiA+ID4gb2YNCj4gPiA+ID4gPiA+ID4gYW4gSTJT
DQo+ID4gPiA+ID4gPiA+IGJ1cw0KPiA+ID4gPiA+ID4gPiBiZXR3ZWVuIHR3byBidXNzZXMuIEFk
ZCBhIHBhdHRlcm4gZm9yIHRoZXNlIHByb3BlcnRpZXMgaW4NCj4gPiA+ID4gPiA+ID4gdGhlDQo+
ID4gPiA+ID4gPiA+IGR0LWJpbmRpbmcuDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8DQo+ID4gPiA+ID4gPiA+IG5m
cmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiA+ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3Vu
ZC9tdDgxOTItYWZlLQ0KPiA+ID4gPiA+ID4gPiBwY20ueWFtbCB8IDUNCj4gPiA+ID4gPiA+ID4g
KysrKysNCj4gPiA+ID4gPiA+ID4gICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0K
PiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiA+ID4gPiBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItDQo+ID4gPiA+
ID4gPiA+IGFmZS0NCj4gPiA+ID4gPiA+ID4gcGNtLnlhbWwNCj4gPiA+ID4gPiA+ID4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLQ0KPiA+ID4gPiA+ID4g
PiBhZmUtDQo+ID4gPiA+ID4gPiA+IHBjbS55YW1sDQo+ID4gPiA+ID4gPiA+IGluZGV4IDdhMjVi
YzliODA2MC4uNWIwM2M4ZGJmMzE4IDEwMDY0NA0KPiA+ID4gPiA+ID4gPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS0NCj4gPiA+ID4gPiA+
ID4gcGNtLnlhbWwNCj4gPiA+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtDQo+ID4gPiA+ID4gPiA+IHBjbS55YW1sDQo+ID4g
PiA+ID4gPiA+IEBAIC01NCw2ICs1NCwxMSBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAtIGNvbnN0OiBhdWRfaW5mcmFfY2xrDQo+ID4gPiA+ID4gPiA+ICAgICAgICAgIC0g
Y29uc3Q6IGF1ZF9pbmZyYV8yNm1fY2xrDQo+ID4gPiA+ID4gPiA+ICtwYXR0ZXJuUHJvcGVydGll
czoNCj4gPiA+ID4gPiA+ID4gKyAgIl5pMnNbMC0zNS05XS1zaGFyZSQiOg0KPiA+ID4gPiA+ID4g
PiArICAgIGRlc2NyaXB0aW9uOiBOYW1lIG9mIHRoZSBJMlMgYnVzIHRoYXQgaXMgc2hhcmVkIHdp
dGgNCj4gPiA+ID4gPiA+ID4gdGhpcyBidXMNCj4gPiA+ID4gPiA+ID4gKyAgICBwYXR0ZXJuOiAi
XkkyU1swLTM1LTldJCINCj4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiAgICByZXF1aXJl
ZDoNCj4gPiA+ID4gPiA+ID4gICAgICAtIGNvbXBhdGlibGUNCj4gPiA+ID4gPiA+ID4gICAgICAt
IGludGVycnVwdHMNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFRo
ZSBvbmx5IG90aGVyIHdheSBvZiBkb2luZyB0aGlzIHdvdWxkIGJlIHRvIGNvbXBsaWNhdGUNCj4g
PiA+ID4gPiA+IHRoaXMgaW4NCj4gPiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+ID4gZHJpdmVyDQo+
ID4gPiA+ID4gPiBzbyB0aGF0IHdlIGNhbiBkbyBzb21ldGhpbmcgbGlrZQ0KPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiAiaTJzLXNoYXJlID0gPDAgMj4iOyAgaW5zdGVhZCBvZiAgaTJzMC1zaGFy
ZSA9ICJJMlMyIjsNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gLi4uYW5kIEkgZG9uJ3QgdGhp
bmsgdGhhdCB0aGlzIHdvdWxkIGJlIGFueSBtb3JlDQo+ID4gPiA+ID4gPiBzdHJhaWdodGZvcndh
cmQgdGhhbg0KPiA+ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4gPiBwcm92aWRlZCB3YXkuDQo+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+IFRoZXJlJ3MgYW4gaW1wcm92ZW1lbnQgdGhhdCB3ZSBjYW4g
ZG8gdG8gdGhhdCBwYXR0ZXJuDQo+ID4gPiA+ID4gPiBkZXNjcmlwdGlvbg0KPiA+ID4gPiA+ID4g
dGhvdWdoLA0KPiA+ID4gPiA+ID4gd2hpY2ggd291bGQgYmUgZXhwbGFpbmluZyB0aGF0IGRlY2xh
cmluZyAnaTJzMC1zaGFyZSA9DQo+ID4gPiA+ID4gPiAiSTJTMiInDQo+ID4gPiA+ID4gPiBtZWFu
cw0KPiA+ID4gPiA+ID4gdGhhdA0KPiA+ID4gPiA+ID4gSTJTMidzIGRhdGEgcGluIHdpbGwgYmUg
dXNlZCBhcyBEQVRBLU9VVCwgd2hpbGUgaTJzMCBpcw0KPiA+ID4gPiA+ID4gREFUQS0NCj4gPiA+
ID4gPiA+IElOLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBBbm90aGVyIHRoaW5nIHRoYXQg
Y29tZXMgdG8gbWluZCBoZXJlIGlzIHRoYXQgdGhpcyBpcyBhDQo+ID4gPiA+ID4gPiBNZWRpYVRl
aw0KPiA+ID4gPiA+ID4gc3BlY2lmaWMNCj4gPiA+ID4gPiA+IHByb3BlcnR5IGFuZCAqbm90KiBh
IGdlbmVyaWMgb25lLCB3aGljaCBtZWFucyB0aGF0IGJvdGggdGhlDQo+ID4gPiA+ID4gPiBkcml2
ZXINCj4gPiA+ID4gPiA+IGFuZA0KPiA+ID4gPiA+ID4gdGhpcyBiaW5kaW5nIHNob3VsZCBiZSBm
aXhlZCB0byBnZXQgYSAibWVkaWF0ZWssIiBwcmVmaXgsDQo+ID4gPiA+ID4gPiBzbywNCj4gPiA+
ID4gPiA+IHRoaXMNCj4gPiA+ID4gPiA+IHByb3BlcnR5DQo+ID4gPiA+ID4gPiBzaG91bGQgLSBp
biByZWFsaXR5IC0gYmUgIm1lZGlhdGVrLGkyc1swLTM1LTldLXNoYXJlIg0KPiA+ID4gPiA+ID4g
aW5zdGVhZC4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gSSB0aGluayB0aGF0IGV2ZXJ5b25l
IGFncmVlcyBhYm91dCB0aGF0LCBidXQgbGV0J3Mgc2VlIHdoYXQNCj4gPiA+ID4gPiA+IHRoZQ0K
PiA+ID4gPiA+ID4gb3RoZXJzIHNheS4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gQ2hlZXJz
LA0KPiA+ID4gPiA+ID4gQW5nZWxvDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gSGkgQW5nZWxvLA0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ICdpMnMwLXNoYXJlID0gIkkyUzIiJyBtZWFucyB0aGF0IGlm
IHdlIHdhbnQgdXNlIEkyUzAsIHRoZXJlDQo+ID4gPiA+ID4gbmVlZA0KPiA+ID4gPiA+IG9wZW4N
Cj4gPiA+ID4gPiBJMlMyIHRvIHByb3ZpZGUgY2xvY2suIENvbnZlcnNlbHksIGlmIHdlIHdhbnQg
dG8gdXNlIEkyUzIsIHdlDQo+ID4gPiA+ID4gZG9uJ3QNCj4gPiA+ID4gPiBuZWVkIHRvIG9wZW4g
STJTMC4gSG93ZXZlciwgTWVkaWFUZWsgSTJTMCBhbmQgSTJTMiBoYXJkd2FyZQ0KPiA+ID4gPiA+
IGFyZQ0KPiA+ID4gPiA+IGdlbmVyYWxseSBkZXNpZ25lZCBhcyBpbnB1dC4gU28gdXN1YWxseSB3
ZSB1c2UgJ2kyczAtc2hhcmUgPQ0KPiA+ID4gPiA+ICJJMlMxIicuDQo+ID4gPiA+ID4gRXZlbiBu
dW1iZXJzIHJlcHJlc2VudCBpbnB1dCwgb2RkIG51bWJlcnMgcmVwcmVzZW50IG91dHB1dC4NCj4g
PiA+ID4gPiANCj4gPiA+ID4gPiBZZXMsIEkgdGhpbmsgYWRkaW5nIHRoZSAibWVkaWF0ZWssIiBw
cmVmaXggaXMgdGhlIHJpZ2h0IHdheQ0KPiA+ID4gPiA+IHRvDQo+ID4gPiA+ID4gZGVmaW5lIGEN
Cj4gPiA+ID4gPiBub24tZ2VuZXJpYyBwcm9wZXJ0eS4NCj4gPiA+ID4gPiANCj4gPiA+IA0KPiA+
ID4gSGkgSmlheGluLA0KPiA+ID4gDQo+ID4gPiB0aGFuayB5b3UgZm9yIHRoZSBpbnNpZ2h0cy4N
Cj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gSGVsbG8gSmlheGluLA0KPiA+ID4gPiANCj4gPiA+
ID4gaWYgSSBnZXQgdGhpcyBjb3JyZWN0bHksIGkyczAtc2hhcmUgPSAiSTJTMiIgd291bGQgYmUN
Cj4gPiA+ID4gKmludmFsaWQqLi4uDQo+ID4gPiA+IGFzIHlvdQ0KPiA+ID4gPiBqdXN0IGV4cGxh
aW5lZCwgaTJzWCwgd2hlcmU6DQo+ID4gPiA+IA0KPiA+ID4gPiBYID0gZXZlbiBudW1iZXIgLT4g
YWx3YXlzIERBVEEgSU4NCj4gPiA+ID4gWCA9IG9kZCBudW1iZXIgIC0+IGFsd2F5cyBEQVRBIE9V
VA0KPiA+ID4gPiANCj4gPiA+ID4gLi4udGhpcyBtZWFucyB0aGF0IHRoZSBkdC1iaW5kaW5nIG5l
ZWRzIGEgcGF0dGVybiB0byBzcGVjaWZ5DQo+ID4gPiA+IHRoYXQNCj4gPiA+ID4gb25seSBvZGQN
Cj4gPiA+ID4gY2FuIGJlIGFzc2lnbmVkIHRvIG9ubHkgZXZlbi4NCj4gPiA+IA0KPiA+ID4gU28s
IHRoZSBzaXR1YXRpb24gc2VlbXMgZGlmZmVyZW50IGF0IGxlYXN0IG9uIG10ODE5Mi1hc3VyYWRh
LQ0KPiA+ID4gc3BoZXJpb24uDQo+ID4gPiBIZXJlLCBJMlM4IGlzIHVzZWQgZm9yIHRoZSBoZWFk
c2V0IG1pY3JvcGhvbmUgYW5kIEkyUzkgZm9yIHRoZQ0KPiA+ID4gaGVhZHNldCBhdWRpby4NCj4g
PiA+IEV2ZW4gZm9yIGlucHV0IGFuZCBvZGQgZm9yIG91dHB1dCBhZ3JlZSB3aXRoIEppYXhpbidz
DQo+ID4gPiBkZXNjcmlwdGlvbi4NCj4gPiA+IEhvd2V2ZXIsIHRoZQ0KPiA+ID4gaW5wdXQgYnVz
IHNlZW1zIHRvIGJlIHRoZSBtYWluIG9uZSwgdGhhdCBpcywgZGlzYWJsaW5nIEkyUzg6DQo+ID4g
PiANCj4gPiA+IAlhbWl4ZXIgY3NldCBuYW1lPSdVTDJfQ0gxIEkyUzhfQ0gxJyAwDQo+ID4gPiAJ
YW1peGVyIGNzZXQgbmFtZT0nVUwyX0NIMiBJMlM4X0NIMicgMA0KPiA+ID4gDQo+ID4gPiBub3Qg
b25seSBkaXNhYmxlcyB0aGUgbWljcm9waG9uZSBidXQgYWxzbyB0aGUgYXVkaW8gb24gdGhlDQo+
ID4gPiBoZWFkc2V0Lg0KPiA+ID4gSWYgSSBhZGQgDQo+ID4gPiANCj4gPiA+IAlpMnM5LXNoYXJl
ID0gIkkyUzgiOw0KPiA+ID4gDQo+ID4gPiBvbiB0aGUgRFQsIHRoZW4gZXZlcnl0aGluZyB3b3Jr
cywgSSBjYW4gZGlzYWJsZSBJMlM4IHdpdGhvdXQNCj4gPiA+IGltcGFjdGluZyB0aGUNCj4gPiA+
IGhlYWRzZXQgYXVkaW8uIFNvIHRoZSBwYXR0ZXJuIGZvciB0aGUgcHJvcGVydHkgb24gdGhpcyBw
bGF0Zm9ybQ0KPiA+ID4gaXMNCj4gPiA+IHRoZSBvcHBvc2l0ZQ0KPiA+ID4gdGhhdCBKaWF4aW4g
bWVudGlvbmVkLiBUaGlzIHRlbGxzIG1lIHRoYXQgd2Ugc2hvdWxkIGtlZXAgdGhlDQo+ID4gPiBi
aW5kaW5nDQo+ID4gPiBtb3JlDQo+ID4gPiBnZW5lcmljIChub3QgYXNzdW1lIHdoZXJlIG9kZHMg
YW5kIGV2ZW5zIGdvKS4gSSB3aWxsIHN0aWxsIGFwcGx5DQo+ID4gPiB0aGUNCj4gPiA+IG90aGVy
DQo+ID4gPiBzdWdnZXN0aW9ucyBtZW50aW9uZWQgdGhvdWdoLg0KPiA+ID4gDQo+ID4gPiBUaGFu
a3MsDQo+ID4gPiBOw61jb2xhcw0KPiA+ID4gDQo+ID4gDQo+ID4gSGkgTsOtY29sYXMsDQo+ID4g
DQo+ID4gRnJvbSBzb2Z0d2FyZSBwb2ludCwgSTJTOCBhbmQgSTJTOSBiZWxvbmcgdG8gZGlmZmVy
ZW50IGhhcmR3YXJlLCBzbw0KPiA+IGlmDQo+ID4geW91IHR1cm4gb2ZmIEkyUzggd2l0aCBDTUQx
LCBvZiBjb3Vyc2UgaXQgd2lsbCBub3QgYWZmZWN0IEkyUzkuDQo+ID4gDQo+ID4gQ01EMToNCj4g
PiBhbWl4ZXIgY3NldCBuYW1lPSdVTDJfQ0gxIEkyUzhfQ0gxJyAwDQo+ID4gYW1peGVyIGNzZXQg
bmFtZT0nVUwyX0NIMiBJMlM4X0NIMicgMA0KPiA+IA0KPiA+IEZyb21lIGhhcmR3YXJlIHBvaW50
LCBJMlM5IHdpbGwgdXNlKHNoYXJlKSBJMlM4J3MgY2xvY2suIElmIHdlDQo+ID4gZG9uJ3QNCj4g
PiB3YW50IHRoZSB1c2VyIHRvIHBlcmNlaXZlIHRoaXMsIHRoZSBkcml2ZXIgbmVlZCB0byBoZWxw
IGRvDQo+ID4gc29tZXRoaW5nLg0KPiA+IFNvIHRoaXMgcHJvcGVydHkgJ2kyczktc2hhcmUgPSAi
STJTOCI7JyB3aWxsIGJlIGFkZGVkIHRvIGluZm9ybSB0aGUNCj4gPiBkcml2ZXIuDQo+IA0KPiBI
aSBKaWF4aW4sDQo+IA0KPiB5ZXMsIHRoYXQncyB3aGF0IEkgZmlndXJlZC4gV2hhdCBJIHdhcyBz
YXlpbmcgaXMgdGhhdCBmb3IgdGhlDQo+IGJpbmRpbmcsIHlvdXINCj4gZXhhbXBsZSB3YXMNCj4g
DQo+IGkyczAtc2hhcmUgPSAiSTJTMSINCj4gICAgXiBldmVuLGlucHV0ICBeIG9kZCxvdXRwdXQN
Cj4gDQo+IHdoaWxlIG9uIG10ODE5Mi1hc3VyYWRhLXNwaGVyaW9uIHRoZSB1c2UgY2FzZSBpcw0K
PiANCj4gaTJzOS1zaGFyZSA9ICJJMlM4IjsNCj4gICAgXiBvZGQsb3V0cHV0ICBeIGV2ZW4saW5w
dXQNCj4gDQo+IFNvIEFuZ2VsbydzIGlkZWEgdG8gcmVxdWlyZSBpbiB0aGUgZHQtYmluZGluZyB0
aGF0IHRoZSBsZWZ0IHNpZGUgaXMNCj4gYWx3YXlzIGV2ZW4NCj4gKGlucHV0KSBhbmQgdGhlIHJp
Z2h0IHNpZGUgYWx3YXlzIG9kZCAoYmFzZWQgb24geW91ciBleGFtcGxlKSwNCj4gd291bGRuJ3Qg
d29yayBmb3INCj4gbXkgdXNlIGNhc2UuDQo+IA0KPiBCYXNpY2FsbHkgaXQncyBhIHF1ZXN0aW9u
IG9mIHdoZXRoZXIgdGhlIGlucHV0IGFsd2F5cyBzaGFyZXMgdGhlDQo+IGNsb2NrIGZyb20gYW4N
Cj4gb3V0cHV0ICh5b3VyIGV4YW1wbGUpLCBvciBpZiBvdXRwdXQgYWx3YXlzIHNoYXJlcyB0aGUg
Y2xvY2sgZnJvbSBhbg0KPiBpbnB1dCAobXkNCj4gdXNlIGNhc2UpLCBvciBpZiBib3RoIGFyZSB2
YWxpZC4gSSdtIHRha2luZyBmcm9tIHRoaXMgdGhhdCBib3RoIGFyZQ0KPiB2YWxpZCwgc28gSQ0K
PiB3b24ndCBhZGQgYW55IHN1Y2ggcmVzdHJpY3Rpb24gaW4gdGhlIGR0LWJpbmRpbmcgaW4gdGhl
IGZvbGxvd2luZw0KPiB2ZXJzaW9uLCBidXQNCj4gZG8gbGV0IG1lIGtub3cgaWYgdGhpcyBpcyBu
b3QgdGhlIGNhc2UuDQo+IA0KPiBUaGFua3MsDQo+IE7DrWNvbGFzDQoNCkhpIE7DrWNvbGFzLA0K
DQpZZXMsIHlvdSBhcmUgcmlnaHQuIFRoZXkgY29tcGxldGVseSBkZXBlbmQgb24gd2hpY2ggc2V0
IG9mIEkyUyBjbG9jaw0KYXJlIHVzZWQgb24gdGhlIHBsYXRmb3JtIGhhcmR3YXJlLg0KDQogaTJz
OS1zaGFyZSA9ICJJMlM4Ig0KID09PiBUaGUgSTJTOCBhbmQgdGhlIEkyUzkgY29tYmluZSBpbnRv
IG9uZSBzZXQgb2Ygc3RhbmRhcmQgSTJTLCBhbmQNCnVzZSBJMlM4J3MgY2xvY2suDQoNCiBpMnM4
LXNoYXJlID0gIkkyUzkiDQogPT0+IFRoZSBJMlM4IGFuZCB0aGUgSTJTOSBjb21iaW5lIGludG8g
b25lIHNldCBvZiBzdGFuZGFyZCBJMlMsIGFuZA0KdXNlIEkyUzkncyBjbG9jay4NCg0KQmVzdCBS
ZWdhcmRzLA0KSmlheGluIFl1DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
