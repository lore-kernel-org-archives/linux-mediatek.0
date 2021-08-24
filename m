Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA99C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 05:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0626561212
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 05:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0626561212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyXXdqloyXiD2CqVG6eH2gPvUM0WDBlqsBuaZsJGKys=; b=YRnHDn1S6pE8Ng
	kzyyGX1ju5xU/NSfHkjDcAwC0QOEoxUikkVc3kl+TKtoGudX+Tdijm+2vO864OstdyneT3HwCM3Jb
	z7+t2zq05LRYVRF0yKiw1OCBjjbMY4x+5HS/7ntOHPrJqXiDnoBPY0fTFHD24dfVBItcO7ksw9dej
	fBDjIlQXR8gO/6rWb+HTD8yJElEZYT63kKlazlEUmlopm+CasNikXvjcaoSLwuFnOEoLB5YLOTzXV
	l6scyW5+gva6JScmcbyKCIoZLkU22B1OTVs3IjmVouwzjNC6U8VU/1Y9hHVSHPyRpJFiJoxjIUcJi
	IxzGfGgauEF1cqFJb+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIOfI-001dfD-7w; Tue, 24 Aug 2021 05:08:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIOfC-001deD-KZ; Tue, 24 Aug 2021 05:07:58 +0000
X-UUID: 1099b9f2588048caa666cb74859cbaa1-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HXfD2dpVdefMeboFVp42P1mXdWpz9qejPwkSFWMGwjA=; 
 b=JURKRdQ/QmnFeUoYfJSsJyjJAS3xW1SY8GgI2AG1cuNMmR6eV6ZZP9DSF+Y4NxZHXebcjHJbunp+EqBYd1gcyo6MTRd5KZwOPgtZvXcVbdNDLclELl5ko5o6v0fgDFa7AuohoiX9BiUkzKOAI/5N9YLDsujujDL8wfx3FbxJB7s=;
X-UUID: 1099b9f2588048caa666cb74859cbaa1-20210823
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1126497846; Mon, 23 Aug 2021 22:07:53 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 22:07:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 13:07:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 13:07:50 +0800
Message-ID: <9ce23e77e8ea5706b1d52700d655958f49eb911e.camel@mediatek.com>
Subject: Re: [PATCH v3 02/15] dt-bindings: mediatek: add vdosys1 MERGE
 definition for mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Tue, 24 Aug 2021 13:07:50 +0800
In-Reply-To: <CAAOTY_-mJ0WHK0pXqASprrc7GW0R_ZTRmJ8Yo8pu9js-cQ5HAw@mail.gmail.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-3-nancy.lin@mediatek.com>
 <CAAOTY_-mJ0WHK0pXqASprrc7GW0R_ZTRmJ8Yo8pu9js-cQ5HAw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_220754_722350_6136EF28 
X-CRM114-Status: GOOD (  16.64  )
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

SGkgQ2h1bi1LdWFuZywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBGcmksIDIwMjEt
MDgtMjAgYXQgMDc6MjUgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6DQo+IEhpLCBOYW5jeToN
Cj4gDQo+IE5hbmN5LkxpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHlubQ45pyI
MTjml6Ug6YCx5LiJIOS4i+WNiDU6MTjlr6vpgZPvvJoNCj4gPiANCj4gPiBBZGQgdmRvc3lzMSBN
RVJHRSBkZWZpbml0aW9uLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hbmN5LkxpbiA8bmFu
Y3kubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZS55YW1sICAgIHwNCj4gPiAyICsrDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxtZXJnZQ0KPiA+IC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZQ0KPiA+IC55YW1sDQo+
ID4gaW5kZXggMWEyN2IwMzcwODZiLi5iYTFlMGM4Mzc5ODggMTAwNjQ0DQo+ID4gLS0tDQo+ID4g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRp
YXRlayxtZXJnZQ0KPiA+IC55YW1sDQo+ID4gKysrDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZXJnZQ0KPiA+IC55YW1s
DQo+ID4gQEAgLTIzLDYgKzIzLDggQEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgICAgIC0gY29u
c3Q6IG1lZGlhdGVrLG10ODE3My1kaXNwLW1lcmdlDQo+ID4gICAgICAgIC0gaXRlbXM6DQo+ID4g
ICAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtZGlzcC1tZXJnZQ0KPiA+ICsgICAg
ICAtIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ4MTk1LXZkbzEt
bWVyZ2UNCj4gDQo+IEkgZG9uJ3Qga25vdyB3aHkgY3JlYXRlIGEgbmV3IG1lcmdlIGZvciBtdDgx
OTUuIFByb3ZpZGUgbW9yZQ0KPiBpbmZvcm1hdGlvbiBhYm91dCB0aGUgZGlmZmVyZW5jZSBvZiB0
aGVzZSB0d28gbWVyZ2UuDQo+IA0KQ29tcGFyZWQgd2l0aCBNVDgxOTUgbWVyZ2UwIGFuZCBtZXJn
ZTUsIG1lcmdlMX40IGhhcyBtb3JlIG11dGUNCmZ1bmN0aW9uLiBJIHdpbGwgcmVtb3ZlIHRoaXMg
bmV3IGNvbXBhdGlibGUsIG1vdmUgb3ZsX2FkYXB0b3IgbWVyZ2UgdG8NCm1lcmdlIGNvbW1vbiBk
cml2ZXIsIGFuZCBhZGQgbmV3IG1lcmdlIGJpbmRpbmcgcHJvcGVydHkgdG8gaW5jcmVhc2UNCm11
dGUgZnVuY3Rpb24uDQoNCj4gUmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCj4gDQo+ID4gDQo+ID4g
ICAgcmVnOg0KPiA+ICAgICAgbWF4SXRlbXM6IDENCj4gPiAtLQ0KPiA+IDIuMTguMA0KPiA+IA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
