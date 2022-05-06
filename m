Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB77C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 09:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BF7VweDhSQawq2jLwYHeQPqaq3hi1dnt8xmfPNXSIs=; b=g0Y4wrhXEWrYMl
	bFPJI2X4sPARzkYpBa8vUNk8WC4lBFPnUxQt9OAgFhvLYZt9/i15QetbM4vJX5micaXClfv/vKNzv
	Fj46YV8PGQmtGSstPH3g4wcCF3wAUAlpKvWPAMAgfOOwkkyYpkd83jaxtzpW1bYg15uH1MFw/O3LD
	uDclNTOgJ+8qFXdYVYtGtVbeKy/+ERIaQaWAouWXpGo+N7MS+ZZhyRmJlHtCeo9BlX5ERzu0NK6mg
	DXMu738kLDGlBxf+hRtu+Xp1fG5EkVFD1vD9XXbkWTN4kdRqQrokUXGntFkC4u82pwTqRz5IaN63F
	rod9b5G5tbZvXxiOP7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmuW0-002TrR-KA; Fri, 06 May 2022 09:44:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmuMx-002Oi1-BZ; Fri, 06 May 2022 09:35:30 +0000
X-UUID: 6484dd769f514d77a22796e30220a08f-20220506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=C6X/5UnFAMnbFhYpAmeaR8YkFNuHEyX4hjYc9zMyZvk=; 
 b=Jli32r+yPl0lRVtopZWQRGevM99MTCLsMCID7yUnXX6u7GrCj/VhOAeVVUfWh6ucHw3hhY/8aukkcZEz2ZLbr6j7Bdh2QPyKtsICN8ZXeG5b6iT74MaSQnfgvrPpx+IXfBelcz9al/7LYYVctsixgvmImQvqal/Jk4VoWdIA7tg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c99d6e5b-90c4-498d-9b15-2b83fcb6ba08, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:05c67416-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6484dd769f514d77a22796e30220a08f-20220506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1385907860; Fri, 06 May 2022 02:35:22 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 02:25:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 17:25:18 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 17:25:17 +0800
Message-ID: <18560bd9efbcf77bc6b2dc6d2956d7993fcdde85.camel@mediatek.com>
Subject: Re: [PATCH v10, 16/17] media: mediatek: vcodec: support stateless
 VP9 decoding
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Alexandre Courbot <acourbot@chromium.org>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 6 May 2022 17:25:17 +0800
In-Reply-To: <20220505222034.fxw6y7wdf7wy3qi4@notapiano>
References: <20220426100828.13429-1-yunfei.dong@mediatek.com>
 <20220426100828.13429-17-yunfei.dong@mediatek.com>
 <20220505222034.fxw6y7wdf7wy3qi4@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_023527_546150_8A360D11 
X-CRM114-Status: GOOD (  18.66  )
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

SGkgTmljb2xhcywNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uDQoNCk9uIFRodSwgMjAy
Mi0wNS0wNSBhdCAxODoyMCAtMDQwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+
IE9uIFR1ZSwgQXByIDI2LCAyMDIyIGF0IDA2OjA4OjI3UE0gKzA4MDAsIFl1bmZlaSBEb25nIHdy
b3RlOg0KPiA+IEFkZCBzdXBwb3J0IGZvciBWUDkgZGVjb2RpbmcgdXNpbmcgdGhlIHN0YXRlbGVz
cyBBUEksDQo+ID4gYXMgc3VwcG9ydGVkIGJ5IE1UODE5Mi4gQW5kIHRoZSBkcml2ZXJzIGlzIGxh
dCBhbmQgY29yZQ0KPiA+IGFyY2hpdGVjdHVyZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
dW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEdlb3JnZSBTdW4gPGdlb3JnZS5zdW5AbWVkaWF0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBB
bmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8DQo+ID4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdu
b0Bjb2xsYWJvcmEuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvdmNvZGVjL01ha2VmaWxlICAgfCAgICAxICsNCj4gPiAgLi4uL3Zjb2RlYy9tdGtfdmNvZGVj
X2RlY19zdGF0ZWxlc3MuYyAgICAgICAgIHwgICAyNiArLQ0KPiA+ICAuLi4vcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL210a192Y29kZWNfZHJ2LmggfCAgICAxICsNCj4gPiAgLi4uL3Zjb2RlYy92
ZGVjL3ZkZWNfdnA5X3JlcV9sYXRfaWYuYyAgICAgICAgIHwgMjAzMQ0KPiA+ICsrKysrKysrKysr
KysrKysrDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvdmRlY19kcnZfaWYuYyAg
ICB8ICAgIDQgKw0KPiA+ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL3ZkZWNfZHJ2X2lm
LmggICAgfCAgICAxICsNCj4gPiAgNiBmaWxlcyBjaGFuZ2VkLCAyMDYxIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL3ZkZWMvdmRlY192cDlfcmVxX2xhdF9pZi5jDQo+
ID4gDQo+IA0KPiAuLi4NCj4gDQo+ID4gKwkJdXNlXzEyOCA9ICFmcmFtZV9pc19pbnRyYSAmJiAh
dnNpLQ0KPiA+ID5mcmFtZS51aC5sYXN0X2ZyYW1lX3R5cGU7DQo+ID4gKwkJdjRsMl92cDlfYWRh
cHRfY29lZl9wcm9icyhwcmVfZnJhbWVfY3R4X2hlbHBlciwNCj4gPiArCQkJCQkgIGNvdW50c19o
ZWxwZXIsDQo+ID4gKwkJCQkJICB1c2VfMTI4LA0KPiA+ICsJCQkJCSAgZnJhbWVfaXNfaW50cmEp
Ow0KPiANCj4gSGkgWXVuZmVpLA0KPiANCj4gSSdtIGdldHRpbmcNCj4gDQo+IEVSUk9SOiBtb2Rw
b3N0OiAidjRsMl92cDlfYWRhcHRfbm9uY29lZl9wcm9icyINCj4gW2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvdmNvZGVjL210ay12Y29kZWMtZGVjLmtvXSB1bmRlZmluZWQhDQo+IEVS
Uk9SOiBtb2Rwb3N0OiAidjRsMl92cDlfYWRhcHRfY29lZl9wcm9icyINCj4gW2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL210ay12Y29kZWMtZGVjLmtvXSB1bmRlZmluZWQh
DQo+IA0KPiB3aGVuIGJ1aWxkaW5nIHRoaXMgc2VyaWVzLg0KPiANCj4gQWRkaW5nDQo+IAlzZWxl
Y3QgVjRMMl9WUDkNCj4gdG8NCj4gCWNvbmZpZyBWSURFT19NRURJQVRFS19WQ09ERUMNCj4gc29s
dmVkIHRoZSBpc3N1ZS4NCj4gDQo+IFRoYW5rcywNCj4gTsOtY29sYXMNCkkgd2lsbCBmaXggaXQg
aW4gbmV4dCBwYXRjaA0KDQpCZXN0IFJlZ2FyZHMsDQpZdW5mZWkgRG9uZw0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
