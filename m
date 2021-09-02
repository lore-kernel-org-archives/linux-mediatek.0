Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3814C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 09:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8939361059
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 09:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8939361059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CHlsxFM4lMuqqIAb7CzFYrgwzeJdJ12WEWVBBJJXbc=; b=yS2annjrws1mgn
	FWXpEPuLJTNO/U/0xWEuiPzf56lusQR+6dgRVFQYIyRiUeSVqvNnsn64IMOkfMOtf/Aa3W9f+mGFF
	BBXIcC1/9UpS+u56rjqxHSx+DqII6104xSEb9Qxi091HvGacYBf29+dnDiN0bFII6VHfWo2t5EaCw
	7/v4a8BscUkkduW4CQuOGaKVTPRwl5XcMxnb7UdSk3xpkHpbBe0OYwr/henlH7eZ5k6ZZBQ8V4CUv
	9bW9H+4ALOv/Hl4yjglQcv4cS14599D8cVPVl40eTcjAe9buCioxlFHyWgTKY+M9I5AUHFbVG0lUB
	QfKpTwZ9WnrYUIkpytxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLjBO-0098Rr-Fm; Thu, 02 Sep 2021 09:38:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLjBK-0098Qt-0J; Thu, 02 Sep 2021 09:38:53 +0000
X-UUID: 368ee2fbc5f34de7bbdc9476532ed5b3-20210902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7BMKZ9QUqaKkuTBeVs3pjQYEnvqKsI6RkIvddChwTF0=; 
 b=IhIvjz1RArKyF8VAlT7K6H08pIKZ8z7NgBN7UAU8zDESRIr6PjY4Rd6YNilPffz8FLe4zb5cMtPVTmJkQtVwjLC/JJH7oQ3/qHX9OexEHm8VhdZvGSEJzwYOMQ6pj2yeVKlo4ZCagCYJpCg5An1YaT3TxyvyDwuvTAMKg6NELXs=;
X-UUID: 368ee2fbc5f34de7bbdc9476532ed5b3-20210902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 273044904; Thu, 02 Sep 2021 02:38:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 02:28:45 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 2 Sep 2021 17:28:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 17:28:43 +0800
Message-ID: <93f44e07917e6e194fdf62bee98f7041e9f2d546.camel@mediatek.com>
Subject: Re: [PATCH v12 3/6] PCI: mediatek: Add new method to get irq number
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>,
 <lorenzo.pieralisi@arm.com>, <ryder.lee@mediatek.com>,
 <jianjun.wang@mediatek.com>, <yong.wu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Thu, 2 Sep 2021 17:28:44 +0800
In-Reply-To: <20210831183022.GA120514@bjorn-Precision-5520>
References: <20210831183022.GA120514@bjorn-Precision-5520>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_023850_100554_BAC06D1D 
X-CRM114-Status: GOOD (  31.36  )
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

T24gVHVlLCAyMDIxLTA4LTMxIGF0IDEzOjMwIC0wNTAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOg0K
PiBPbiBNb24sIEF1ZyAyMywgMjAyMSBhdCAxMToyNzo1N0FNICswODAwLCBDaHVhbmppYSBMaXUg
d3JvdGU6DQo+ID4gVXNlIHBsYXRmb3JtX2dldF9pcnFfYnluYW1lKCkgdG8gZ2V0IHRoZSBpcnEg
bnVtYmVyDQo+ID4gaWYgdGhlIHByb3BlcnR5IG9mICJpbnRlcnJ1cHQtbmFtZXMiIGlzIGRlZmlu
ZWQuDQo+IA0KPiBGcm9tIHBhdGNoIDEvNiwgSSBoYXZlIHRoZSBpbXByZXNzaW9uIHRoYXQgdGhp
cyBwYXRjaCBpcyBwYXJ0IG9mDQo+IGZpeGluZyBhbiBNU0kgaXNzdWUuICBJZiBzbywgdGhpcyBj
b21taXQgbG9nIHNob3VsZCBtZW50aW9uIHRoYXQgYXMNCj4gd2VsbC4NCg0KSGkgLEJqb3JuDQpZ
ZXPvvIxJIHdpbGwgY2hhbmdlIHRoZSBjb21taXQgbWVzc2FnZSBhcyBmb2xsb3cNCiANCkluIG9y
ZGVyIHRvIHBhcnNlIHRoZSBuZXcgZHRzIGZvcm1hdCB0aGF0IGNvbmZvcm1zIHRvIHRoZSBoYXJk
d2FyZQ0KZGVzaWduIGFuZCBmaXhlcyB0aGUgTVNJIGlzc3Vl77yMYWRkDQpwbGF0Zm9ybV9nZXRf
aXJxX2J5bmFtZV9vcHRpb25hbCB0byBnZXQgdGhlIGlycSBudW1iZXIuDQogDQo+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IENodWFuamlhIExpdSA8Y2h1YW5qaWEubGl1QG1lZGlhdGVrLmNvbT4NCj4g
PiBBY2tlZC1ieTogUnlkZXIgTGVlIDxyeWRlci5sZWVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0K
PiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWVkaWF0ZWsuYyB8IDYgKysrKystDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVrLmMN
Cj4gPiBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay5jDQo+ID4gaW5kZXgg
NDI5NmQ5ZTA0MjQwLi4xOWUzNWFjNjJkNDMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9wY2llLW1lZGlhdGVrLmMNCj4gPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL3BjaWUtbWVkaWF0ZWsuYw0KPiA+IEBAIC02NTQsNyArNjU0LDExIEBAIHN0YXRpYyBpbnQg
bXRrX3BjaWVfc2V0dXBfaXJxKHN0cnVjdA0KPiA+IG10a19wY2llX3BvcnQgKnBvcnQsDQo+ID4g
IAkJcmV0dXJuIGVycjsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gLQlwb3J0LT5pcnEgPSBwbGF0Zm9y
bV9nZXRfaXJxKHBkZXYsIHBvcnQtPnNsb3QpOw0KPiA+ICsJaWYgKG9mX2ZpbmRfcHJvcGVydHko
ZGV2LT5vZl9ub2RlLCAiaW50ZXJydXB0LW5hbWVzIiwgTlVMTCkpDQo+ID4gKwkJcG9ydC0+aXJx
ID0gcGxhdGZvcm1fZ2V0X2lycV9ieW5hbWUocGRldiwgInBjaWVfaXJxIik7DQo+ID4gKwllbHNl
DQo+ID4gKwkJcG9ydC0+aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCBwb3J0LT5zbG90KTsN
Cj4gDQo+IFRoaXMgd291bGQgYmUgdGhlIG9ubHkgaW5zdGFuY2Ugb2YgdGhpcyBwYXR0ZXJuLCB3
aGVyZSB3ZSBsb29rIGZvciBhDQo+IHByb3BlcnR5IGFuZCB1c2UgdGhlIHJlc3VsdCB0byBkZWNp
ZGUgaG93IHRvIGxvb2sgZm9yIHRoZSBJUlEuDQo+IA0KPiBkd19wY2llX2hvc3RfaW5pdCgpIGRv
ZXMgc29tZXRoaW5nIGxpa2UgdGhpczoNCj4gDQo+ICAgcG9ydC0+aXJxID0gcGxhdGZvcm1fZ2V0
X2lycV9ieW5hbWVfb3B0aW9uYWwocGRldiwgInBjaWVfaXJxIik7DQo+ICAgaWYgKHBvcnQtPmly
cSA8IDApIHsNCj4gICAgIHBvcnQtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgcG9ydC0+
c2xvdCk7DQo+ICAgICBpZiAocG9ydC0+aXJxIDwgMCkNCj4gICAgICAgcmV0dXJuIHBvcnQtPmly
cTsNCj4gICB9DQo+IA0KPiBXb3VsZCB0aGF0IHdvcmsgZm9yIHlvdT8gIElmIG5vdCwgdGhlIGNv
bW1pdCBsb2cgc2hvdWxkIGV4cGxhaW4gd2h5DQo+IHlvdSBjYW4ndCB1c2UgdGhlIHN0YW5kYXJk
IHBhdHRlcm4uDQo+IA0KPiBJZiB5b3UgZG8gdGhpbmdzIGRpZmZlcmVudGx5IHRoYW4gb3RoZXIg
ZHJpdmVycywgaXQgbWFrZXMgdGhpbmdzDQo+IGhhcmRlciB0byByZXZpZXcgYW5kIHNsb3dzIHRo
aW5ncyBkb3duLiAgSWYgeW91ICpoYXZlKiB0byBkbw0KPiBzb21ldGhpbmcNCj4gZGlmZmVyZW50
bHkgYW5kIGl0IGFkZHMgcmVhbCB2YWx1ZSB0byBiZSBkaWZmZXJlbnQsIHRoYXQncyBmaW5lLiAg
QnV0DQo+IHdlIHNob3VsZCBhdm9pZCB1bm5lY2Vzc2FyeSBkaWZmZXJlbmNlcy4NCg0KVGhhbmtz
IGZvciB5b3VyIGFkdmljZe+8jGl0IGlzIHZlcnkgaGVscGZ1bCB0byBtZSwgSSB3aWxsIHVzZSBz
dGFuZGFyZA0KcGF0dGVybiB0byBhdm9pZCB1bm5lY2Vzc2FyeSBkaWZmZXJlbmNlcw0KDQpUaGFu
a3MgYWdhaW4hDQpDaHVhbmppYQ0KDQo+IA0KPiA+ICAJaWYgKHBvcnQtPmlycSA8IDApDQo+ID4g
IAkJcmV0dXJuIHBvcnQtPmlycTsNCj4gPiAgDQo+ID4gLS0gDQo+ID4gMi4xOC4wDQo+ID4gDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
