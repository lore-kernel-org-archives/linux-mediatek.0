Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD413C43334
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Jul 2022 09:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7H/uljZRrOZ4i5eaqqzPuzYnlHDrbgTMGqHkx79pSzQ=; b=fISUjj8jYk3mOtoc5s7THwBHas
	Z5awGC2SE+kjnwcgkz9qg6vinbxwPZ7sRnt6lyW7PxB5+3ltVPVQlRAfIZ3Q3te9GW8iJTgY3WyCh
	BEtsWDKElAz0WEIRNOtF/xOjiNFi5vMkL+3RN2R45l+QRDuTtZK4d3PKYu9vomqiHt3EDnYAv2XNS
	uSQ2JUWuxKlM7G8VFZSCjPoyHo5v8vHTUVFeR+FAqghnPQD11OAo/LMur/gBXRFNJwY1mhu6BK4iy
	u2UAz562W4SeoByGhFNwNE9HpnhXU3TkvsTNX4NboN37NNkDNlmfA6cd0Fd1GAQdvfotBm6lth9ZR
	zVsUzwBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Zbs-008vHC-KY; Sat, 02 Jul 2022 09:40:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Zbp-008vGK-DM
	for linux-mediatek@lists.infradead.org; Sat, 02 Jul 2022 09:40:14 +0000
X-UUID: 84742a5058574e2b84e96fad61b46156-20220702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=7H/uljZRrOZ4i5eaqqzPuzYnlHDrbgTMGqHkx79pSzQ=;
	b=OQMqBm+4g4WJDux+P9a27hnvWyV7UwOjCKTGfYwvNV8tdDpcBW2TR73OrIJHXRR5aYDc69G4zSJokh2UcKYQVHX/xO++RRvS8pJYB1U4ZdmOQ/IHQ33+64WfOLXNQUu4VXQOsi3/7H78fOJ2yOVZtKb9xKAqLHotsiXUhePaBrI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:f16881c2-b72e-46d5-b629-d558cbaecd43,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:05023963-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 84742a5058574e2b84e96fad61b46156-20220702
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2129075416; Sat, 02 Jul 2022 02:40:07 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 2 Jul 2022 17:09:30 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 2 Jul 2022 17:09:30 +0800
Message-ID: <f6f308d2ffe9a40d3182a923308162d7c4d80a6b.camel@mediatek.com>
Subject: Re: support USB 3.2 function remote wake
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Felipe Balbi <balbi@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
	<linux-usb@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Sat, 2 Jul 2022 17:09:30 +0800
In-Reply-To: <Yrwn6Y7OMdPtN+g/@kroah.com>
References: <cd7169df640fe6dab85f6d94cb8f40c181e08d2b.camel@mediatek.com>
	 <Yrwn6Y7OMdPtN+g/@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_024013_501473_B0A5E4DE 
X-CRM114-Status: GOOD (  23.67  )
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

T24gV2VkLCAyMDIyLTA2LTI5IGF0IDEyOjIyICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE9uIFdlZCwgSnVuIDI5LCAyMDIyIGF0IDA1OjAyOjU0UE0gKzA4MDAsIENodW5mZW5n
IFl1biB3cm90ZToNCj4gPiBIaSwNCj4gPiANCj4gPiBJIHBsYW4gdG8gc3VwcG9ydCBmdW5jdGlv
biByZW1vdGUgd2FrZXVwIG9uIG91ciB1c2IzIGRldmljZQ0KPiA+IGNvbnRyb2xsZXINCj4gPiBk
cml2ZXIuDQo+IA0KPiBJcyB0aGlzIGJhc2VkIG9uIGR3YzMgb3Igc29tZSBuZXcgc2lsaWNvbj8N
CkJhc2VkIG9uIG10dTM7DQoNCj4gDQo+ID4gQSBmdW5jdGlvbiBtYXkgc2lnbmFsIHRoYXQgaXQg
d2FudHMgdG8gZXhpdCBmcm9tIEZ1bmN0aW9uIFN1c3BlbmQNCj4gPiBieQ0KPiA+IHNlbmRpbmcg
YSBGdW5jdGlvbiBXYWtlIE5vdGlmaWNhdGlvbiB0byB0aGUgaG9zdCwgYW5kIHRoZQ0KPiA+IG5v
dGlmaWNhdGlvbg0KPiA+IG5lZWQga25vd3MgdGhlIGZpcnN0IGludGVyZmFjZSBudW1iZXIgaW4g
dGhpcyBmdW5jdGlvbi4NCj4gPiBCdXQgdGhlIGN1cnJlbnQgZ2FkZ2V0IG9wczoNCj4gPiAgICAg
aW50ICgqd2FrZXVwKShzdHJ1Y3QgdXNiX2dhZGdldCAqKTsNCj4gPiBkb2VzIG5vdCBwcm92aWRl
IGluZm9ybWF0aW9uIGFib3V0IGludGVyZmFjZSBudW1iZXI7DQo+IA0KPiBXaHkgd291bGQgdGhl
IGludGVyZmFjZSBtYXR0ZXIgYXMgeW91IG5lZWQgdG8gZG8gdGhpcyBmb3IgdGhlIHdob2xlDQo+
IGRldmljZSwgbm90IGp1c3Qgb25lIGludGVyZmFjZSwgcmlnaHQ/DQpZZXMsIGl0IGlzLCBidXQg
dXNiMy4yIG9ubHkgc3VwcG9ydHMgZnVuY3Rpb24gcmVtb3RlIHdha2V1cC4NCg0KSSBsb29rIGF0
IHRoZSBjb2RlIG9mIGNvcmUvaHViLmMsIGFzIGRlc2NyaWJlZCBpbiBmdW5jdGlvbg0KdXNiX2Vu
YWJsZV9yZW1vdGVfd2FrZXVwKCk6DQoiIEZvciBVU0ItMyBkZXZpY2VzOiBBc3N1bWUgdGhlcmUn
cyBvbmx5IG9uZSBmdW5jdGlvbiBvbiB0aGUgZGV2aWNlIGFuZA0KZW5hYmxlIHJlbW90ZSB3YWtl
IGZvciB0aGUgZmlyc3QgaW50ZXJmYWNlLiAgRklYTUUgaWYgdGhlIGludGVyZmFjZQ0KYXNzb2Np
YXRpb24gZGVzY3JpcHRvciBzaG93cyB0aGVyZSdzIG1vcmUgdGhhbiBvbmUgZnVuY3Rpb24uDQoi
DQpJdCBhc3N1bWUgdGhlIGludGVyZmFjZSBudW1iZXIgaXMgMCwgYW5kIGRvbid0IHN1cHBvcnQg
bXVsdGktZnVuY3Rpb24NCmRldmljZXMgd2l0aCBJQUQuDQoNCj4gDQo+ID4gVGhlcmUgc2VlbXMg
dG8gYmUgdHdvIHdheXM6DQo+ID4gMS4gYWRkIGEgbmV3IHBhcmFtZXRlciBhcyBiZWxvdywNCj4g
PiAgICAgaW50ICgqd2FrZXVwKShzdHJ1Y3QgdXNiX2dhZGdldCAqLCB1OCBpbnRmKTsNCj4gPiAy
LiBhZGQgYSBuZXcgb3BzLCBzdWNoIGFzLA0KPiA+ICAgICBpbnQgKCpmdW5jdGlvbl93YWtldXAp
KHN0cnVjdCB1c2JfZ2FkZ2V0ICosIHU4IGludGYpOw0KPiA+IA0KPiA+IERvIHlvdSBoYXZlIGFu
eSBzdWdnZXN0aW9ucz8NCj4gDQo+IExvb2sgYXQgd2hhdCB0aGUgZXhpc3Rpbmcgb25lcyBkbywg
DQpZZXMsIEkgbG9va2VkIGF0IGFsbCBleGlzdGluZyBvbmVzIHRoYXQgc3VwcG9ydCByZW1vdGUg
d2FrZXVwLCBidXQNCnNlZW1zIG5vIG9uZSBzdXBwb3J0IGZ1bmN0aW9uIHdha2V1cCAobWF5YmUg
YWxzbyBhc3N1bWUgdGhlIGludGVyZmFjZQ0KbnVtYmVyIGlzIDAgaWYgaXQgZG9lcyk7DQoNCklm
IHdlIGFsc28gZm9sbG93IHRoZSB3YXlzIG9mIGhvc3QsIG5vIG5lZWQgY2hhbmdlIG9wcy4NCmJ1
dCB0aGVyZSBpcyBhbHNvIGxpbWl0YXRpb24gZm9yIGNvbXBvc2l0ZSBkZXZpY2Ugd2l0aCBJQUQ7
DQoNCg0KPiBJIGRvIG5vdCB0aGluayB5b3UgaGF2ZSBkaWZmZXJlbnQNCj4gc3VzcGVuZCBsZXZl
bHMgcGVyIFVTQiBpbnRlcmZhY2UsIGJ1dCByYXRoZXIgdGhlIHdob2xlIGRldmljZS4NCg0KPiAg
IFRyeSBpdA0KPiBhbmQgc2VlLg0KPiANCj4gdGhhbmtzLA0KPiANCj4gZ3JlZyBrLWgNCg==


