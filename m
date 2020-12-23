Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35612C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:20:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED6C422287
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED6C422287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtG6wfeACIEo+mG+2Ma2E2ZXEsKIhTGdd/gGJw4HBCw=; b=2vkD9R2DXd5ybL8eV7nKZfY8BZ
	GgIiy9YA8YEg5j6//dyFIUc6idK6j9MqjRJMe9y8pHO3PRVJiTegsbRz4HHvrQqsAKm10G9sOt5VN
	/OW/C7RQ3ugzcnXUhFaGDAMdZpPldKFQ1z4EqYq7MMTAwWCJFOvr/KcRvsBN/9yK8WvFacMa3ASQu
	lvivuGJP7G2nYIH1ZhVHcoJgjHRln3y6sxdWNvLX2/BTTI14rXWJqfoVH/s1/6z4uXBBIANSFUe9O
	Vsw4s3Us5spCrTEb3nuXySV47H/hZ0NCVrjn0Ri5+fwY5LxdF4XTEaP4BTEXZnS7TBd05JcSzkhaR
	m5M8xXVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krsor-0000UK-IR; Wed, 23 Dec 2020 01:20:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krson-0000S1-BB; Wed, 23 Dec 2020 01:19:58 +0000
X-UUID: e30a1f32dad24dbeaba82d205cd23ff0-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=CTTiUQ0OgzISxmTNGbo4qKF1FUv27uRYg9CNv2nwUSQ=; 
 b=SYRur8qNBrvHgw+rf89zpSU93rfRHMP01FWn3w9D5RW2mm7TOv4ya+3IEyABBM+tK+KjOlb2+eqmy26mfb+RcSkccPEV9T5Ph0K422LqD/5eNSUE07PgSc9R6DowhbPDOQlLpC0XD+MJOAK2ulrAMn/7GdzFeGDLyWhhPSD/1oc=;
X-UUID: e30a1f32dad24dbeaba82d205cd23ff0-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 82843198; Tue, 22 Dec 2020 17:19:50 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 17:19:47 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:19:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:19:40 +0800
Message-ID: <1608686383.18252.6.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 02/17] dt-bindings: mediatek: add CLK_MM_DISP_CONFIG
 control description for mt8192 display
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 09:19:43 +0800
In-Reply-To: <CAAOTY_-YjP50QrBKfoCqVnMWp41efbs9wdon4gts5QhUfZO8OA@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-3-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-YjP50QrBKfoCqVnMWp41efbs9wdon4gts5QhUfZO8OA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_201957_588901_3FB14188 
X-CRM114-Status: GOOD (  22.74  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIwLTEyLTE2IGF0IDIzOjE3ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MTLlr6vpgZPv
vJoNCj4gPg0KPiA+IGFkZCBDTEtfTU1fRElTUF9DT05GSUcgY29udHJvbCBkZXNjcmlwdGlvbiBm
b3IgbXQ4MTkyIGRpc3BsYQ0KPiANCj4gZGlzcGxheQ0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0K
PiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9t
ZWRpYXRlayxkaXNwLnR4dCB8IDMgKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0DQo+
ID4gaW5kZXggMTk3MmZhNy4uZGZiZWM3NiAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dA0K
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLGRpc3AudHh0DQo+ID4gQEAgLTU0LDYgKzU0LDkgQEAgUmVxdWlyZWQgcHJv
cGVydGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nrcyk6DQo+ID4gICAgRFBJIGNvbnRyb2xsZXIgbm9k
ZXMgaGF2ZSBtdWx0aXBsZSBjbG9jayBpbnB1dHMuIFRoZXNlIGFyZSBkb2N1bWVudGVkIGluDQo+
ID4gICAgbWVkaWF0ZWssZHNpLnR4dCBhbmQgbWVkaWF0ZWssZHBpLnR4dCwgcmVzcGVjdGl2ZWx5
Lg0KPiA+ICAgIEFuIGV4Y2VwdGlvbiBpcyB0aGF0IHRoZSBtdDgxODMgbXV0ZXggaXMgYWx3YXlz
IGZyZWUgcnVubmluZyB3aXRoIG5vIGNsb2NrcyBwcm9wZXJ0eS4NCj4gPiArICBBbiBleGNlcHRp
b24gaXMgdGhhdCB0aGUgbXQ4MTkyIGRpc3BsYXkgYWRkIDIgbW9yZSBjbG9ja3MoQ0xLX01NX0RJ
U1BfQ09ORklHLCBDTEtfTU1fMjZNSFopLA0KPiA+ICsgIGFuZCB0aGVzZSAyIGNsb2NrcyBuZWVk
IGVuYWJsZWQgYmVmb3JlIGRpc3BsYXkgbW9kdWxlIHdvcmsgbGlrZSBtdXRleCBjbG9jaywgc28g
d2UgYWRkIHRoZXNlDQo+ID4gKyAgMiBjbG9ja3MgY29udHJvbGVkIHNhbWUgd2l0aCBtdXRleCBj
bG9jay4NCj4gDQo+IElmIGV2ZXJ5IGRpc3BsYXkgbW9kdWxlIG5lZWRzIHRoZXNlIHR3byBjbG9j
aywgYWRkIHRoZXNlIHR3byBjbG9jayB0bw0KPiBhbGwgdGhlIGRpc3BsYXkgbW9kdWxlIHdoaWNo
IG5lZWQgdGhlbS4NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQoNCmFsbCBkaXNwbGF5
IG1vZHVsZSB3b3JrIG5lZWQgbXV0ZXggY2xvY2sgd29yayBvbiwgYnV0IG5vdCBhZGQgbXV0ZXgN
CmNsb2NrIGludG8gYWxsIGRpc3BsYXkgbW9kdWxlDQo+IA0KPiA+DQo+ID4gIFJlcXVpcmVkIHBy
b3BlcnRpZXMgKERNQSBmdW5jdGlvbiBibG9ja3MpOg0KPiA+ICAtIGNvbXBhdGlibGU6IFNob3Vs
ZCBiZSBvbmUgb2YNCj4gPiAtLQ0KPiA+IDEuOC4xLjEuZGlydHkNCj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IExpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdA0KPiA+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
