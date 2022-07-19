Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C77C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 06:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uScBq4Yl1Ck56/d2fzEHwnBVQDk5UP+kPLu5A0qdGms=; b=5E+NEAuLX+//b/KtnRK3W187lH
	nV8bI+WryshoXQTHcWfRlMRwFHY4Vo0kecvESZ5gdmyToEG47RkDB7wLsk06l3iFOIsL9YTHT8J1f
	xgc6FYTMvesbGMoyR/6rjbwJQp7ztx6XftvMUhFQIzvJVK2Mvyop+vjzWtK61GUapohjSvcSG3Iy8
	/RVtfibjo/YqsiSXn37CYPX9onNE3EUK55C5BG1O0a2ocffX8VtTV+Vqcm1YJjfIn+CeIRQ6EIJEn
	Xb8oDdVgD5UlhgQidgkrz1ii0hp/onhp5SZ5d7UcmbWrJZS03HYesPx88OWZ8mJvXhr/5S4hl3RSo
	QG+wDQqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgQV-005cJb-AW; Tue, 19 Jul 2022 06:09:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgQS-005cIT-GS; Tue, 19 Jul 2022 06:09:45 +0000
X-UUID: 63f4317cbf1446cd93c71b210d183017-20220718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=uScBq4Yl1Ck56/d2fzEHwnBVQDk5UP+kPLu5A0qdGms=;
	b=owcFtSYX8OgUMDkOiQmM2GZGaUF5xJ2ZfyDGH6udYeo2exLU2q+nG0HG88KmB4zC7NNkpq9AauZHDUeY0nV1h3B8HfSOEwYSmG7HC0ivxlgC6wVijuJ3EqanzVG2d+4iDr1lkkEfkv8gPdnWOXrK5fttHTrVWeY8DgqxCKRriZc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:13a07f9e-b6dd-4173-a42d-54e7973818ce,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:f042aa64-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 63f4317cbf1446cd93c71b210d183017-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 661819556; Mon, 18 Jul 2022 23:09:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 19 Jul 2022 13:18:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 19 Jul 2022 13:18:54 +0800
Message-ID: <27fb716259fc88cba955691c246a6bdaf31b38d8.camel@mediatek.com>
Subject: Re: [for-next][PATCH 13/23] USB: mtu3: tracing: Use the new
 __vstring() helper
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 19 Jul 2022 13:18:54 +0800
In-Reply-To: <20220715172423.6b57b9eb@gandalf.local.home>
References: <20220714164256.403842845@goodmis.org>
	 <20220714164330.311734558@goodmis.org>
	 <962e59c25e981676014157cd111db9e16e237339.camel@mediatek.com>
	 <20220715172423.6b57b9eb@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_230944_575275_AFEA674F 
X-CRM114-Status: GOOD (  15.71  )
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

T24gRnJpLCAyMDIyLTA3LTE1IGF0IDE3OjI0IC0wNDAwLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToN
Cj4gT24gRnJpLCAxNSBKdWwgMjAyMiAxODowMTo0NCArMDgwMA0KPiBDaHVuZmVuZyBZdW4gPGNo
dW5mZW5nLnl1bkBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiANCj4gPiAgaXJxLzI1NC0xMTIwMTAw
LTEzNyAgICAgWzAwMF0gZC4uMS4gICAyNjYuNjI5NjYyOiBtdHUzX2xvZzoNCj4gPiAxMTIwMTAw
MC51c2I6IGVwMF9zdGF0ZSBTRVRVUHItc3BlZWQNCj4gPiANCj4gPiAici1zcGVlZCIgc2VlbXMg
dGhlIHJlbWFpbiBvZiBsYXN0IGxvZzsNCj4gDQo+IEkgZm91bmQgYW4gb2ZmLWJ5LW9uZSBidWcg
aW4gdGhlIHZzdHJpbmcgcGF0Y2guIEknbGwgcmViYXNlLCB0ZXN0IGFuZA0KPiB0cnkNCj4gYWdh
aW4uDQo+IA0KPiBJbiB0aGUgbWVhbiB0aW1lLCBjYXJlIHRvIGFkZCB0aGlzIG9uIHRvcCB0byBt
YWtlIHN1cmUgaXQncyBmaXhlZD8NCj4gDQo+IFRoYW5rcyENCj4gDQo+IC0tIFN0ZXZlDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC90cmFjZV9ldmVudHMuaA0KPiBiL2luY2x1ZGUv
bGludXgvdHJhY2VfZXZlbnRzLmgNCj4gaW5kZXggZTZmOGJhNTJhOTU4Li5iMTg3NTlhNjczYzYg
MTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvdHJhY2VfZXZlbnRzLmgNCj4gKysrIGIvaW5j
bHVkZS9saW51eC90cmFjZV9ldmVudHMuaA0KPiBAQCAtOTIyLDE2ICs5MjIsMTYgQEAgcGVyZl90
cmFjZV9idWZfc3VibWl0KHZvaWQgKnJhd19kYXRhLCBpbnQgc2l6ZSwNCj4gaW50IHJjdHgsIHUx
NiB0eXBlLA0KPiAgICogZ2NjIHdhcm5zIHRoYXQgeW91IGNhbiBub3QgdXNlIGEgdmFfbGlzdCBp
biBhbiBpbmxpbmVkDQo+ICAgKiBmdW5jdGlvbi4gQnV0IGxldHMgbWUgbWFrZSBpdCBpbnRvIGEg
bWFjcm8gOi0vDQo+ICAgKi8NCj4gLSNkZWZpbmUgX190cmFjZV9ldmVudF92c3RyX2xlbihmbXQs
IHZhKQkJXA0KPiAtKHsJCQkJCQlcDQo+IC0JdmFfbGlzdCBfX2FwOwkJCQlcDQo+IC0JaW50IF9f
cmV0OwkJCQlcDQo+IC0JCQkJCQlcDQo+IC0JdmFfY29weShfX2FwLCAqKHZhKSk7CQkJXA0KPiAt
CV9fcmV0ID0gdnNucHJpbnRmKE5VTEwsIDAsIGZtdCwgX19hcCk7CVwNCj4gLQl2YV9lbmQoX19h
cCk7CQkJCVwNCj4gLQkJCQkJCVwNCj4gLQltaW4oX19yZXQsIFRSQUNFX0VWRU5UX1NUUl9NQVgp
OwlcDQo+ICsjZGVmaW5lIF9fdHJhY2VfZXZlbnRfdnN0cl9sZW4oZm10LCB2YSkJCQlcDQo+ICso
ewkJCQkJCQlcDQo+ICsJdmFfbGlzdCBfX2FwOwkJCQkJXA0KPiArCWludCBfX3JldDsJCQkJCVwN
Cj4gKwkJCQkJCQlcDQo+ICsJdmFfY29weShfX2FwLCAqKHZhKSk7CQkJCVwNCj4gKwlfX3JldCA9
IHZzbnByaW50ZihOVUxMLCAwLCBmbXQsIF9fYXApICsgMTsJXA0KDQpJdCB3b3JrcyBmaW5lIG5v
dywgdGhhbmtzIGEgbG90DQoNCj4gKwl2YV9lbmQoX19hcCk7CQkJCQlcDQo+ICsJCQkJCQkJXA0K
PiArCW1pbihfX3JldCwgVFJBQ0VfRVZFTlRfU1RSX01BWCk7CQlcDQo+ICB9KQ0KPiAgDQo+ICAj
ZW5kaWYgLyogX0xJTlVYX1RSQUNFX0VWRU5UX0ggKi8NCg==


