Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF860C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 04:52:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB6626044F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 04:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB6626044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mcUrDqAouKDwnIO3zFu5rZsalwc1S1WvVdhiO673ww=; b=BCNIGlWxHwFFdt
	CRVtbGSDBOtplwlOkdzIo1HykdbZyLI6RwWUkxUnbXSU/VzuWCBYs8vAJWyt1JNHeW4v7DZURLAOo
	wVxwlbXQNtW3iMSRctjVqfq6fZm4UKRidElpk0HvlKeT7iA0nKA/zEtFhRX819MtULhEx477AIZ0t
	Qw2L70QjajOA5ooev0H1rNTYNoQQrUXaw1FkNEBPLHngMn87gNuZeQm6bg624uHlme/Zy//3qEoba
	JmLBsi01qFhq2WhScCOJFC/b8mq08+JiEZThONVwPl9pjupaOer8o+x+8LTvIXQAHd+4OcBa850Xi
	rjyH0mXtDlRUN7pODIfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIOQ9-001abx-2D; Tue, 24 Aug 2021 04:52:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIOQ1-001aa3-Og; Tue, 24 Aug 2021 04:52:19 +0000
X-UUID: b060e7d7c157445ab1b2af911a6cae3b-20210823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cxDUzdJauAEJfC5ccx4EbSYMfVOiu+2+l7gt7ZpWgV4=; 
 b=a6G28KY41NUJJgTTvjszsqT7fo6+Vh32GVTQH1j1wMSXMVoXhtSR0kuOJoEmwaXqiH8j0JHSn5Wr5y8a9saJoMiRF54Coz/vHQ7KUiPeA4dR8Q9OEaS0Rm6TWNmENjjklF0l1SzvvtwlJjnBgYaN8eG/sYhFDQM2PSyjiciG6X4=;
X-UUID: b060e7d7c157445ab1b2af911a6cae3b-20210823
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1621286277; Mon, 23 Aug 2021 21:52:09 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 21:52:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 12:52:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 12:52:05 +0800
Message-ID: <b19a2f09b44b4664182720a6bdb526d338f8db37.camel@mediatek.com>
Subject: Re: [PATCH v3 15/15] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
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
Date: Tue, 24 Aug 2021 12:52:06 +0800
In-Reply-To: <CAAOTY_99QLpRHLei2PzD8vsuoOaZae++NqczPCM+r9YMZ01btw@mail.gmail.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
 <20210818091847.8060-16-nancy.lin@mediatek.com>
 <CAAOTY_99QLpRHLei2PzD8vsuoOaZae++NqczPCM+r9YMZ01btw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_215215_261661_2E522DE9 
X-CRM114-Status: GOOD (  17.28  )
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

SGkgQ2h1bi1LdWFuZywNCglUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFN1biwgMjAyMS0w
OC0yMiBhdCAwOToxNCArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToNCj4gSGksIE5hbmN5Og0K
PiANCj4gTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDjmnIgx
OOaXpSDpgLHkuIkg5LiL5Y2INToxOOWvq+mBk++8mg0KPiA+IA0KPiA+IEFkZCBkcml2ZXIgZGF0
YSBvZiBtdDgxOTUgdmRvc3lzMSB0byBtZWRpYXRlay1kcm0gYW5kIG1vZGlmeSBkcm0NCj4gPiBm
b3INCj4gPiBtdWx0aS1tbXN5cyBzdXBwb3J0LiBUaGUgdHdvIG1tc3lzICh2ZG9zeXMwIGFuZCB2
ZG9zeXMxKSB3aWxsIGJyaW5nDQo+ID4gdXAgdHdvIGRybSBkcml2ZXJzLCBvbmx5IG9uZSBkcm0g
ZHJpdmVyIHJlZ2lzdGVyIGFzIHRoZSBkcm0gZGV2aWNlLg0KPiA+IEVhY2ggZHJtIGRyaXZlciBi
aW5kcyBpdHMgb3duIGNvbXBvbmVudC4gVGhlIGZpcnN0IGJpbmQgZHJtIGRyaXZlcg0KPiA+IHdp
bGwgYWxsb2NhdGUgdGhlIGRybSBkZXZpY2UsIGFuZCB0aGUgbGFzdCBiaW5kIGRybSBkcml2ZXIN
Cj4gPiByZWdpc3RlcnMNCj4gPiB0aGUgZHJtIGRldmljZSB0byBkcm0gY29yZS4gRWFjaCBjcnRj
IHBhdGggaXMgY3JlYXRlZCB3aXRoIHRoZQ0KPiA+IGNvcnJlc3BvbmRpbmcgZHJtIGRyaXZlciBk
YXRhLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE5hbmN5LkxpbiA8bmFuY3kubGluQG1lZGlh
dGVrLmNvbT4NCj4gPiANCj4gPiANCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2Nv
bXBfZnVuY3MgZGRwX292bF9hZGFwdG9yID0gew0KPiA+ICsgICAgICAgLmNsa19lbmFibGUgPSBt
dGtfZXRoZHJfY2xrX2VuYWJsZSwNCj4gPiArICAgICAgIC5jbGtfZGlzYWJsZSA9IG10a19ldGhk
cl9jbGtfZGlzYWJsZSwNCj4gPiArICAgICAgIC5jb25maWcgPSBtdGtfZXRoZHJfY29uZmlnLA0K
PiA+ICsgICAgICAgLnN0YXJ0ID0gbXRrX2V0aGRyX3N0YXJ0LA0KPiA+ICsgICAgICAgLnN0b3Ag
PSBtdGtfZXRoZHJfc3RvcCwNCj4gPiArICAgICAgIC5sYXllcl9uciA9IG10a19ldGhkcl9sYXll
cl9uciwNCj4gPiArICAgICAgIC5sYXllcl9jb25maWcgPSBtdGtfZXRoZHJfbGF5ZXJfY29uZmln
LA0KPiA+ICsgICAgICAgLmVuYWJsZV92YmxhbmsgPSBtdGtfZXRoZHJfZW5hYmxlX3ZibGFuaywN
Cj4gPiArICAgICAgIC5kaXNhYmxlX3ZibGFuayA9IG10a19ldGhkcl9kaXNhYmxlX3ZibGFuaywN
Cj4gPiArfTsNCj4gDQo+IEkgdGhpbmsgZXRoZHIgaXMgaW5zaWRlIHRoZSBncm91cCBvZiBvdmxf
YWRwYXRvci4gSSBwcmV0ZXIgdGhpcw0KPiBmdW5jdGlvbiBpcyBpbXBsZW1lbnRlZCBieSBvdmxf
YWRhcHRvciwgYW5kIG92bF9hZGFwdG9yIGNvbnRyb2wgcmRtYSwNCj4gbWVyZ2UsIGV0aGRyLg0K
PiANCj4gUmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCj4gDQpPSywgSSB3aWxsIGNoYW5nZSBpdCB0
byB0aGUgb3ZsX2FkYXB0b3IgZnVuY3Rpb24uDQoNCj4gPiArDQo+ID4gDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
