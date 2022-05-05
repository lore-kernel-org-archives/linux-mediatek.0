Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55822C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rBLy7kkiAm+DHXAYe0d7guGLb+JAi4mlkF826RQs1o=; b=inv8jcJSsujPxG
	3gdM1eHFOEfwjZgxZCyteBgHroC3+Q3kKTDD+DV5GsyDlPXY2lzqqM8zXyumC16XEOOIdNkHQUFHW
	hrPB9NBzjycHxtbU/x4ZK/SANcwCC/HuogCIEiyn1BhVw6wKShN6FqJnbdGsNfjfQOXVCc5Lbzh5Y
	ATeykdbeN+o/JjEQbQpj3BODfSD6n3uu+vwKQNejyZo2Mxc9ydlk2q4rBViJO3X4HkbdY4WEkG5Z3
	PQu369Uv4OSqAfgJuETq9SBL2ZxMcWGB3b0RQo5A3Hmt2ZyIFZUVMoiJ9SWwaJgmHMOn+UT++XUtz
	2mvvk0/I8AY3wWbNDbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmXH9-00EsGE-RF; Thu, 05 May 2022 08:55:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmXGx-00Es9g-82; Thu, 05 May 2022 08:55:44 +0000
X-UUID: 48aff3e158de4a6b8ba534d40a15e9f8-20220505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=afr5MfrTc3qYPdyQ9wc+DX7n5KFDq6kRR9KCPokSo1o=; 
 b=M/rFHfdXZXXuNjnjwpr8bzyctIEcdGxj2UykNSQ2mYBZCTt0VRhf2lli1hoKwBohQH6+ZUpmdwbBciManSIlVUGPSZJZUdjZIextXxRADWUIppTxdtJ7lGPDfitmIxzqGh7Frl/6lYo2kHN8jD+brru3rlOutUQ8bRcxrjnzNMc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a302aae3-ef5c-480e-bb60-f6fd6c225e3f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:deb54c16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 48aff3e158de4a6b8ba534d40a15e9f8-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1388769521; Thu, 05 May 2022 01:55:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 01:48:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 May 2022 16:48:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 5 May 2022 16:48:31 +0800
Message-ID: <cbf2fcbae25408b95875278eb37e829bf4671430.camel@mediatek.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>, "Mark
 Brown" <broonie@kernel.org>
CC: <kernel@collabora.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Shane Chien <shane.chien@mediatek.com>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 5 May 2022 16:48:31 +0800
In-Reply-To: <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
 <20220429203039.2207848-2-nfraprado@collabora.com>
 <4826c824-40ce-5726-ed95-5be069233ca7@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_015543_371365_308459C7 
X-CRM114-Status: GOOD (  26.45  )
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

T24gVGh1LCAyMDIyLTA1LTA1IGF0IDEwOjA4ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMjkvMDQvMjIgMjI6MzAsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IGhhIHNjcml0dG86DQo+ID4gVGhlIE1lZGlhdGVrIEFGRSBQQ00gY29udHJvbGxlciBmb3IgTVQ4
MTkyIGFsbG93cyBzaGFyaW5nIG9mIGFuIEkyUw0KPiA+IGJ1cw0KPiA+IGJldHdlZW4gdHdvIGJ1
c3Nlcy4gQWRkIGEgcGF0dGVybiBmb3IgdGhlc2UgcHJvcGVydGllcyBpbiB0aGUNCj4gPiBkdC1i
aW5kaW5nLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NCj4gPiAtLS0NCj4gPiANCj4gPiAgIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sIHwgNQ0K
PiA+ICsrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9t
dDgxOTItYWZlLQ0KPiA+IHBjbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3NvdW5kL210ODE5Mi1hZmUtDQo+ID4gcGNtLnlhbWwNCj4gPiBpbmRleCA3YTI1YmM5Yjgw
NjAuLjViMDNjOGRiZjMxOCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20ueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sDQo+ID4g
QEAgLTU0LDYgKzU0LDExIEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAtIGNvbnN0OiBhdWRf
aW5mcmFfY2xrDQo+ID4gICAgICAgICAtIGNvbnN0OiBhdWRfaW5mcmFfMjZtX2Nsaw0KPiA+ICAg
DQo+ID4gK3BhdHRlcm5Qcm9wZXJ0aWVzOg0KPiA+ICsgICJeaTJzWzAtMzUtOV0tc2hhcmUkIjoN
Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBOYW1lIG9mIHRoZSBJMlMgYnVzIHRoYXQgaXMgc2hhcmVk
IHdpdGggdGhpcyBidXMNCj4gPiArICAgIHBhdHRlcm46ICJeSTJTWzAtMzUtOV0kIg0KPiA+ICsN
Cj4gPiAgIHJlcXVpcmVkOg0KPiA+ICAgICAtIGNvbXBhdGlibGUNCj4gPiAgICAgLSBpbnRlcnJ1
cHRzDQo+ID4gDQo+IA0KPiBUaGUgb25seSBvdGhlciB3YXkgb2YgZG9pbmcgdGhpcyB3b3VsZCBi
ZSB0byBjb21wbGljYXRlIHRoaXMgaW4gdGhlDQo+IGRyaXZlcg0KPiBzbyB0aGF0IHdlIGNhbiBk
byBzb21ldGhpbmcgbGlrZQ0KPiANCj4gImkycy1zaGFyZSA9IDwwIDI+IjsgIGluc3RlYWQgb2Yg
IGkyczAtc2hhcmUgPSAiSTJTMiI7DQo+IA0KPiAuLi5hbmQgSSBkb24ndCB0aGluayB0aGF0IHRo
aXMgd291bGQgYmUgYW55IG1vcmUgc3RyYWlnaHRmb3J3YXJkIHRoYW4NCj4gdGhlDQo+IHByb3Zp
ZGVkIHdheS4NCj4gDQo+IFRoZXJlJ3MgYW4gaW1wcm92ZW1lbnQgdGhhdCB3ZSBjYW4gZG8gdG8g
dGhhdCBwYXR0ZXJuIGRlc2NyaXB0aW9uDQo+IHRob3VnaCwNCj4gd2hpY2ggd291bGQgYmUgZXhw
bGFpbmluZyB0aGF0IGRlY2xhcmluZyAnaTJzMC1zaGFyZSA9ICJJMlMyIicgbWVhbnMNCj4gdGhh
dA0KPiBJMlMyJ3MgZGF0YSBwaW4gd2lsbCBiZSB1c2VkIGFzIERBVEEtT1VULCB3aGlsZSBpMnMw
IGlzIERBVEEtSU4uDQo+IA0KPiBBbm90aGVyIHRoaW5nIHRoYXQgY29tZXMgdG8gbWluZCBoZXJl
IGlzIHRoYXQgdGhpcyBpcyBhIE1lZGlhVGVrDQo+IHNwZWNpZmljDQo+IHByb3BlcnR5IGFuZCAq
bm90KiBhIGdlbmVyaWMgb25lLCB3aGljaCBtZWFucyB0aGF0IGJvdGggdGhlIGRyaXZlcg0KPiBh
bmQNCj4gdGhpcyBiaW5kaW5nIHNob3VsZCBiZSBmaXhlZCB0byBnZXQgYSAibWVkaWF0ZWssIiBw
cmVmaXgsIHNvLCB0aGlzDQo+IHByb3BlcnR5DQo+IHNob3VsZCAtIGluIHJlYWxpdHkgLSBiZSAi
bWVkaWF0ZWssaTJzWzAtMzUtOV0tc2hhcmUiIGluc3RlYWQuDQo+IA0KPiBJIHRoaW5rIHRoYXQg
ZXZlcnlvbmUgYWdyZWVzIGFib3V0IHRoYXQsIGJ1dCBsZXQncyBzZWUgd2hhdCB0aGUNCj4gb3Ro
ZXJzIHNheS4NCj4gDQo+IENoZWVycywNCj4gQW5nZWxvDQoNCkhpIEFuZ2VsbywNCg0KJ2kyczAt
c2hhcmUgPSAiSTJTMiInIG1lYW5zIHRoYXQgaWYgd2Ugd2FudCB1c2UgSTJTMCwgdGhlcmUgbmVl
ZCBvcGVuDQpJMlMyIHRvIHByb3ZpZGUgY2xvY2suIENvbnZlcnNlbHksIGlmIHdlIHdhbnQgdG8g
dXNlIEkyUzIsIHdlIGRvbid0DQpuZWVkIHRvIG9wZW4gSTJTMC4gSG93ZXZlciwgTWVkaWFUZWsg
STJTMCBhbmQgSTJTMiBoYXJkd2FyZSBhcmUNCmdlbmVyYWxseSBkZXNpZ25lZCBhcyBpbnB1dC4g
U28gdXN1YWxseSB3ZSB1c2UgJ2kyczAtc2hhcmUgPSAiSTJTMSInLg0KRXZlbiBudW1iZXJzIHJl
cHJlc2VudCBpbnB1dCwgb2RkIG51bWJlcnMgcmVwcmVzZW50IG91dHB1dC4NCg0KWWVzLCBJIHRo
aW5rIGFkZGluZyB0aGUgIm1lZGlhdGVrLCIgcHJlZml4IGlzIHRoZSByaWdodCB3YXkgdG8gZGVm
aW5lIGENCm5vbi1nZW5lcmljIHByb3BlcnR5Lg0KDQpCZXN0IFJlZ2FyZHMsDQpKaWF4aW4gWXUN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
