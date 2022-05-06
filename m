Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26191C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 05:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gBwYGIipBmXRHCyeuZvGcYXQq/aG3OiE+S0Nu9KfkI=; b=N+JCC3bJxOFQDy
	EwFk6Qe1JjtnH23pXl2iCeR3XIpTtrwzYrv63BP/lunEh9GQuqG5cpmRjTWiT97NdkNxucsK9TPeC
	NxaDMzWJo/2pt+5h25fMwKr0ER0DvS0v91OzD0w1yEAfi3jp4hCei1WQ14llUypdfLrwL9r5vKz6A
	z1BWWTTfu8EE+vZK7vFXWNIJ/hmHI0sP7h5Z3gs0fXFONaA1GmfMyH+GWJOT6XH+pifu5XJvYrFrj
	CuR+ENm3KLmOsfGZ0q5RRkBav9T/+pvoF/0mhBTCnUbwbOWRchhqg4oOB0R7Yck36E3vgEfpkCOzv
	WFsrnrcsHAGQjctNmjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmqmZ-001Uaw-Rx; Fri, 06 May 2022 05:45:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmqmX-001UZ9-4d; Fri, 06 May 2022 05:45:39 +0000
X-UUID: 744703d6146d40f5abb8b95d35d3ef9a-20220505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=0t/d4xKzbLqWBo8fo4A2wa87nAVsbsb8DRPvhY9Phfs=; 
 b=VqZi9BsGXmQDv/9Vqh9d3fkWWSo4woNB0P+Txt/p2UnSmq9ljYaQSYh/TjqLVjEYtdvQzaJqnP5RZNYj2EcSELF6XuU0/gZgamwWk0CaGjEcXQArcLP8DDEROAGba6XP/8ME8s505YTSV64vB1xsWnep9YlEnDJrRGegJaZ5OAo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:dc6602c0-c07d-4926-a4b0-7e5c39f8aad9, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:990ac9b2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 744703d6146d40f5abb8b95d35d3ef9a-20220505
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 572341178; Thu, 05 May 2022 22:45:30 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 22:45:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 13:45:27 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 13:45:24 +0800
Message-ID: <559a1e189613484b8528dc4eaf19099e9162fcc6.camel@mediatek.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Mark Brown <broonie@kernel.org>, <kernel@collabora.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Rob
 Herring" <robh+dt@kernel.org>, Shane Chien <shane.chien@mediatek.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Fri, 6 May 2022 13:45:24 +0800
In-Reply-To: <20220505162537.byiwfe2ghomxhezl@notapiano>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
 <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
 <cbf2fcbae25408b95875278eb37e829bf4671430.camel@mediatek.com>
 <d1c548bb-8a36-79bf-498d-c909bf7e7679@collabora.com>
 <20220505162537.byiwfe2ghomxhezl@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_224537_414492_DADCED0F 
X-CRM114-Status: GOOD (  48.37  )
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

T24gVGh1LCAyMDIyLTA1LTA1IGF0IDEyOjI1IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gPiANCg0KPiBPbiBUaHUsIE1heSAwNSwgMjAyMiBhdCAxMDo1Mjo0NUFNICsw
MjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubw0KPiB3cm90ZToNCj4gPiBJbCAwNS8wNS8y
MiAxMDo0OCwgSmlheGluIFl1IGhhIHNjcml0dG86DQo+ID4gPiBPbiBUaHUsIDIwMjItMDUtMDUg
YXQgMTA6MDggKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vDQo+ID4gPiB3cm90ZToN
Cj4gPiA+ID4gSWwgMjkvMDQvMjIgMjI6MzAsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNj
cml0dG86DQo+ID4gPiA+ID4gVGhlIE1lZGlhdGVrIEFGRSBQQ00gY29udHJvbGxlciBmb3IgTVQ4
MTkyIGFsbG93cyBzaGFyaW5nIG9mDQo+ID4gPiA+ID4gYW4gSTJTDQo+ID4gPiA+ID4gYnVzDQo+
ID4gPiA+ID4gYmV0d2VlbiB0d28gYnVzc2VzLiBBZGQgYSBwYXR0ZXJuIGZvciB0aGVzZSBwcm9w
ZXJ0aWVzIGluIHRoZQ0KPiA+ID4gPiA+IGR0LWJpbmRpbmcuDQo+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPA0KPiA+ID4gPiA+IG5m
cmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZl
LQ0KPiA+ID4gPiA+IHBjbS55YW1sIHwgNQ0KPiA+ID4gPiA+ICsrKysrDQo+ID4gPiA+ID4gICAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTky
LQ0KPiA+ID4gPiA+IGFmZS0NCj4gPiA+ID4gPiBwY20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItDQo+ID4gPiA+ID4gYWZlLQ0KPiA+ID4gPiA+
IHBjbS55YW1sDQo+ID4gPiA+ID4gaW5kZXggN2EyNWJjOWI4MDYwLi41YjAzYzhkYmYzMTggMTAw
NjQ0DQo+ID4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
dW5kL210ODE5Mi1hZmUtDQo+ID4gPiA+ID4gcGNtLnlhbWwNCj4gPiA+ID4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS0NCj4gPiA+ID4g
PiBwY20ueWFtbA0KPiA+ID4gPiA+IEBAIC01NCw2ICs1NCwxMSBAQCBwcm9wZXJ0aWVzOg0KPiA+
ID4gPiA+ICAgICAgICAgIC0gY29uc3Q6IGF1ZF9pbmZyYV9jbGsNCj4gPiA+ID4gPiAgICAgICAg
ICAtIGNvbnN0OiBhdWRfaW5mcmFfMjZtX2Nsaw0KPiA+ID4gPiA+ICtwYXR0ZXJuUHJvcGVydGll
czoNCj4gPiA+ID4gPiArICAiXmkyc1swLTM1LTldLXNoYXJlJCI6DQo+ID4gPiA+ID4gKyAgICBk
ZXNjcmlwdGlvbjogTmFtZSBvZiB0aGUgSTJTIGJ1cyB0aGF0IGlzIHNoYXJlZCB3aXRoDQo+ID4g
PiA+ID4gdGhpcyBidXMNCj4gPiA+ID4gPiArICAgIHBhdHRlcm46ICJeSTJTWzAtMzUtOV0kIg0K
PiA+ID4gPiA+ICsNCj4gPiA+ID4gPiAgICByZXF1aXJlZDoNCj4gPiA+ID4gPiAgICAgIC0gY29t
cGF0aWJsZQ0KPiA+ID4gPiA+ICAgICAgLSBpbnRlcnJ1cHRzDQo+ID4gPiA+ID4gDQo+ID4gPiA+
IA0KPiA+ID4gPiBUaGUgb25seSBvdGhlciB3YXkgb2YgZG9pbmcgdGhpcyB3b3VsZCBiZSB0byBj
b21wbGljYXRlIHRoaXMgaW4NCj4gPiA+ID4gdGhlDQo+ID4gPiA+IGRyaXZlcg0KPiA+ID4gPiBz
byB0aGF0IHdlIGNhbiBkbyBzb21ldGhpbmcgbGlrZQ0KPiA+ID4gPiANCj4gPiA+ID4gImkycy1z
aGFyZSA9IDwwIDI+IjsgIGluc3RlYWQgb2YgIGkyczAtc2hhcmUgPSAiSTJTMiI7DQo+ID4gPiA+
IA0KPiA+ID4gPiAuLi5hbmQgSSBkb24ndCB0aGluayB0aGF0IHRoaXMgd291bGQgYmUgYW55IG1v
cmUNCj4gPiA+ID4gc3RyYWlnaHRmb3J3YXJkIHRoYW4NCj4gPiA+ID4gdGhlDQo+ID4gPiA+IHBy
b3ZpZGVkIHdheS4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoZXJlJ3MgYW4gaW1wcm92ZW1lbnQgdGhh
dCB3ZSBjYW4gZG8gdG8gdGhhdCBwYXR0ZXJuDQo+ID4gPiA+IGRlc2NyaXB0aW9uDQo+ID4gPiA+
IHRob3VnaCwNCj4gPiA+ID4gd2hpY2ggd291bGQgYmUgZXhwbGFpbmluZyB0aGF0IGRlY2xhcmlu
ZyAnaTJzMC1zaGFyZSA9ICJJMlMyIicNCj4gPiA+ID4gbWVhbnMNCj4gPiA+ID4gdGhhdA0KPiA+
ID4gPiBJMlMyJ3MgZGF0YSBwaW4gd2lsbCBiZSB1c2VkIGFzIERBVEEtT1VULCB3aGlsZSBpMnMw
IGlzIERBVEEtDQo+ID4gPiA+IElOLg0KPiA+ID4gPiANCj4gPiA+ID4gQW5vdGhlciB0aGluZyB0
aGF0IGNvbWVzIHRvIG1pbmQgaGVyZSBpcyB0aGF0IHRoaXMgaXMgYQ0KPiA+ID4gPiBNZWRpYVRl
aw0KPiA+ID4gPiBzcGVjaWZpYw0KPiA+ID4gPiBwcm9wZXJ0eSBhbmQgKm5vdCogYSBnZW5lcmlj
IG9uZSwgd2hpY2ggbWVhbnMgdGhhdCBib3RoIHRoZQ0KPiA+ID4gPiBkcml2ZXINCj4gPiA+ID4g
YW5kDQo+ID4gPiA+IHRoaXMgYmluZGluZyBzaG91bGQgYmUgZml4ZWQgdG8gZ2V0IGEgIm1lZGlh
dGVrLCIgcHJlZml4LCBzbywNCj4gPiA+ID4gdGhpcw0KPiA+ID4gPiBwcm9wZXJ0eQ0KPiA+ID4g
PiBzaG91bGQgLSBpbiByZWFsaXR5IC0gYmUgIm1lZGlhdGVrLGkyc1swLTM1LTldLXNoYXJlIiBp
bnN0ZWFkLg0KPiA+ID4gPiANCj4gPiA+ID4gSSB0aGluayB0aGF0IGV2ZXJ5b25lIGFncmVlcyBh
Ym91dCB0aGF0LCBidXQgbGV0J3Mgc2VlIHdoYXQgdGhlDQo+ID4gPiA+IG90aGVycyBzYXkuDQo+
ID4gPiA+IA0KPiA+ID4gPiBDaGVlcnMsDQo+ID4gPiA+IEFuZ2Vsbw0KPiA+ID4gDQo+ID4gPiBI
aSBBbmdlbG8sDQo+ID4gPiANCj4gPiA+ICdpMnMwLXNoYXJlID0gIkkyUzIiJyBtZWFucyB0aGF0
IGlmIHdlIHdhbnQgdXNlIEkyUzAsIHRoZXJlIG5lZWQNCj4gPiA+IG9wZW4NCj4gPiA+IEkyUzIg
dG8gcHJvdmlkZSBjbG9jay4gQ29udmVyc2VseSwgaWYgd2Ugd2FudCB0byB1c2UgSTJTMiwgd2UN
Cj4gPiA+IGRvbid0DQo+ID4gPiBuZWVkIHRvIG9wZW4gSTJTMC4gSG93ZXZlciwgTWVkaWFUZWsg
STJTMCBhbmQgSTJTMiBoYXJkd2FyZSBhcmUNCj4gPiA+IGdlbmVyYWxseSBkZXNpZ25lZCBhcyBp
bnB1dC4gU28gdXN1YWxseSB3ZSB1c2UgJ2kyczAtc2hhcmUgPQ0KPiA+ID4gIkkyUzEiJy4NCj4g
PiA+IEV2ZW4gbnVtYmVycyByZXByZXNlbnQgaW5wdXQsIG9kZCBudW1iZXJzIHJlcHJlc2VudCBv
dXRwdXQuDQo+ID4gPiANCj4gPiA+IFllcywgSSB0aGluayBhZGRpbmcgdGhlICJtZWRpYXRlaywi
IHByZWZpeCBpcyB0aGUgcmlnaHQgd2F5IHRvDQo+ID4gPiBkZWZpbmUgYQ0KPiA+ID4gbm9uLWdl
bmVyaWMgcHJvcGVydHkuDQo+ID4gPiANCj4gDQo+IEhpIEppYXhpbiwNCj4gDQo+IHRoYW5rIHlv
dSBmb3IgdGhlIGluc2lnaHRzLg0KPiANCj4gPiANCj4gPiBIZWxsbyBKaWF4aW4sDQo+ID4gDQo+
ID4gaWYgSSBnZXQgdGhpcyBjb3JyZWN0bHksIGkyczAtc2hhcmUgPSAiSTJTMiIgd291bGQgYmUg
KmludmFsaWQqLi4uDQo+ID4gYXMgeW91DQo+ID4ganVzdCBleHBsYWluZWQsIGkyc1gsIHdoZXJl
Og0KPiA+IA0KPiA+IFggPSBldmVuIG51bWJlciAtPiBhbHdheXMgREFUQSBJTg0KPiA+IFggPSBv
ZGQgbnVtYmVyICAtPiBhbHdheXMgREFUQSBPVVQNCj4gPiANCj4gPiAuLi50aGlzIG1lYW5zIHRo
YXQgdGhlIGR0LWJpbmRpbmcgbmVlZHMgYSBwYXR0ZXJuIHRvIHNwZWNpZnkgdGhhdA0KPiA+IG9u
bHkgb2RkDQo+ID4gY2FuIGJlIGFzc2lnbmVkIHRvIG9ubHkgZXZlbi4NCj4gDQo+IFNvLCB0aGUg
c2l0dWF0aW9uIHNlZW1zIGRpZmZlcmVudCBhdCBsZWFzdCBvbiBtdDgxOTItYXN1cmFkYS0NCj4g
c3BoZXJpb24uDQo+IEhlcmUsIEkyUzggaXMgdXNlZCBmb3IgdGhlIGhlYWRzZXQgbWljcm9waG9u
ZSBhbmQgSTJTOSBmb3IgdGhlDQo+IGhlYWRzZXQgYXVkaW8uDQo+IEV2ZW4gZm9yIGlucHV0IGFu
ZCBvZGQgZm9yIG91dHB1dCBhZ3JlZSB3aXRoIEppYXhpbidzIGRlc2NyaXB0aW9uLg0KPiBIb3dl
dmVyLCB0aGUNCj4gaW5wdXQgYnVzIHNlZW1zIHRvIGJlIHRoZSBtYWluIG9uZSwgdGhhdCBpcywg
ZGlzYWJsaW5nIEkyUzg6DQo+IA0KPiAJYW1peGVyIGNzZXQgbmFtZT0nVUwyX0NIMSBJMlM4X0NI
MScgMA0KPiAJYW1peGVyIGNzZXQgbmFtZT0nVUwyX0NIMiBJMlM4X0NIMicgMA0KPiANCj4gbm90
IG9ubHkgZGlzYWJsZXMgdGhlIG1pY3JvcGhvbmUgYnV0IGFsc28gdGhlIGF1ZGlvIG9uIHRoZSBo
ZWFkc2V0Lg0KPiBJZiBJIGFkZCANCj4gDQo+IAlpMnM5LXNoYXJlID0gIkkyUzgiOw0KPiANCj4g
b24gdGhlIERULCB0aGVuIGV2ZXJ5dGhpbmcgd29ya3MsIEkgY2FuIGRpc2FibGUgSTJTOCB3aXRo
b3V0DQo+IGltcGFjdGluZyB0aGUNCj4gaGVhZHNldCBhdWRpby4gU28gdGhlIHBhdHRlcm4gZm9y
IHRoZSBwcm9wZXJ0eSBvbiB0aGlzIHBsYXRmb3JtIGlzDQo+IHRoZSBvcHBvc2l0ZQ0KPiB0aGF0
IEppYXhpbiBtZW50aW9uZWQuIFRoaXMgdGVsbHMgbWUgdGhhdCB3ZSBzaG91bGQga2VlcCB0aGUg
YmluZGluZw0KPiBtb3JlDQo+IGdlbmVyaWMgKG5vdCBhc3N1bWUgd2hlcmUgb2RkcyBhbmQgZXZl
bnMgZ28pLiBJIHdpbGwgc3RpbGwgYXBwbHkgdGhlDQo+IG90aGVyDQo+IHN1Z2dlc3Rpb25zIG1l
bnRpb25lZCB0aG91Z2guDQo+IA0KPiBUaGFua3MsDQo+IE7DrWNvbGFzDQo+IA0KSGkgTsOtY29s
YXMsDQoNCkZyb20gc29mdHdhcmUgcG9pbnQsIEkyUzggYW5kIEkyUzkgYmVsb25nIHRvIGRpZmZl
cmVudCBoYXJkd2FyZSwgc28gaWYNCnlvdSB0dXJuIG9mZiBJMlM4IHdpdGggQ01EMSwgb2YgY291
cnNlIGl0IHdpbGwgbm90IGFmZmVjdCBJMlM5Lg0KDQpDTUQxOg0KYW1peGVyIGNzZXQgbmFtZT0n
VUwyX0NIMSBJMlM4X0NIMScgMA0KYW1peGVyIGNzZXQgbmFtZT0nVUwyX0NIMiBJMlM4X0NIMicg
MA0KDQpGcm9tZSBoYXJkd2FyZSBwb2ludCwgSTJTOSB3aWxsIHVzZShzaGFyZSkgSTJTOCdzIGNs
b2NrLiBJZiB3ZSBkb24ndA0Kd2FudCB0aGUgdXNlciB0byBwZXJjZWl2ZSB0aGlzLCB0aGUgZHJp
dmVyIG5lZWQgdG8gaGVscCBkbyBzb21ldGhpbmcuDQpTbyB0aGlzIHByb3BlcnR5ICdpMnM5LXNo
YXJlID0gIkkyUzgiOycgd2lsbCBiZSBhZGRlZCB0byBpbmZvcm0gdGhlDQpkcml2ZXIuDQoNCkJl
c3QgUmVnYXJkcywNCkppYXhpbiBZdQ0KDQo+ID4gTmljb2xhcywgdGFrZSBub3RlISA6LSkgOi0p
DQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IEFuZ2Vsbw0KPiA+IA0KPiA+IFRvIHVuc3Vic2NyaWJl
LCBzZW5kIG1haWwgdG8gDQo+ID4ga2VybmVsLXVuc3Vic2NyaWJlQGxpc3RzLmNvbGxhYm9yYS5j
by51ay4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
