Return-Path: <SRS0=56RK=F5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC6DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 02:50:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4BC32225E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 02:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4BC32225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cBgrnm+aQxyV+xdh7LLGQo+shdW4Z05S9T0MjwUUL4=; b=Hb4p4w6lvCSouq+1rcAxPU5JVX
	RgHuFO6cUB9htg31Csasj/P+DT4qVjUMH5mzcBCVr12DO6j0+lFo1Ybd6L4LB0SwJvl9uz+wli4A0
	cwHdXOBCY9nq7hsGpKFmFtHHet/CLp+4viF7RxWzoz9tAhecaXZSr+UeFrYw1ZXQ1KOLhhORKeYcf
	HR5nO2VMPCct6PfSVG37uFhVJzilkTHWb/uH5J7lYd+2l6icYis3M5h167RWA0U6eTaQoW1bYnFzS
	X8ptza8BFgENJHoLi61kqNzZoEc4QGmF2gzlVo/zP/CywMSUXotMMFgHMws2yATWtxjdYAfJOfjl2
	rvWvRkBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksdAz-0003IQ-KS; Fri, 25 Dec 2020 02:49:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksdAt-0003HQ-2J; Fri, 25 Dec 2020 02:49:52 +0000
X-UUID: 0e13a4aa0e324a08a2a784fcb46e8209-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=w7Kq6z7M/4vEr5amD6OGAHxikHzwv5FfbNXNsef5hpU=; 
 b=nFih2Ur7//UW34vYThiJAnY8mfpvXXu4kL6Lt9h45yRH2V3KmUBGpFA8jY3WafeD6HBah1czIc6tHzxlKyCNDP8j017L9XQIhltFrLn3tHDeQcnIDc2StHm08USLc+RH1TZQsqwct4uFkF6ls/3Al0XUsDdPPQc3pPC35YaU3+U=;
X-UUID: 0e13a4aa0e324a08a2a784fcb46e8209-20201224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1834702152; Thu, 24 Dec 2020 18:49:45 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 18:39:42 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Dec 2020 10:39:42 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Dec 2020 10:39:40 +0800
Message-ID: <1608863980.18252.15.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 3/3] mailbox: cmdq: add mt8192 support
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 25 Dec 2020 10:39:40 +0800
In-Reply-To: <CAAOTY_9e9qadeO9k7zQnvSLZAAJFxjWwYSBz-XXEUUh16jsptA@mail.gmail.com>
References: <1608770889-9403-1-git-send-email-yongqiang.niu@mediatek.com>
 <1608770889-9403-4-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9e9qadeO9k7zQnvSLZAAJFxjWwYSBz-XXEUUh16jsptA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_214951_308024_4C1ECDE8 
X-CRM114-Status: GOOD (  19.94  )
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIwLTEyLTI0IGF0IDIyOjI4ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgyNOaXpSDpgLHlm5sg5LiK5Y2IODo1NeWvq+mBk++8
mg0KPiA+DQo+ID4gYWRkIG10ODE5MiBzdXBwb3J0DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
b25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyB8IDEgKw0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21haWxi
b3gvbXRrLWNtZHEtbWFpbGJveC5jIGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3gu
Yw0KPiA+IGluZGV4IDc1Mzc4ZTMuLjdmMjQzZTEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9t
YWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGst
Y21kcS1tYWlsYm94LmMNCj4gPiBAQCAtNjA3LDYgKzYwNyw3IEBAIHN0YXRpYyBpbnQgY21kcV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgey5jb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10ODE3My1nY2UiLCAuZGF0YSA9ICh2b2lkICopJmdjZV9wbGF0X3Yy
fSwNCj4gPiAgICAgICAgIHsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtZ2NlIiwgLmRh
dGEgPSAodm9pZCAqKSZnY2VfcGxhdF92M30sDQo+ID4gICAgICAgICB7LmNvbXBhdGlibGUgPSAi
bWVkaWF0ZWssbXQ2Nzc5LWdjZSIsIC5kYXRhID0gKHZvaWQgKikmZ2NlX3BsYXRfdjR9LA0KPiA+
ICsgICAgICAgey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1nY2UiLCAuZGF0YSA9ICh2
b2lkICopJmdjZV9wbGF0X3Y0fSwNCj4gDQo+IEluIHRoZSB2aWV3IG9mIGhhcmR3YXJlIGZ1bmN0
aW9uLCBpcyBtdDgxOTItZ2NlIGlkZW50aWNhbCB0bw0KPiBtdDY3NzktZ2NlPyBJZiB0aGVzZSB0
d28gYXJlIGlkZW50aWNhbCwgeW91IG5lZWQgbm90IHRvIG1vZGlmeSBkcml2ZXIsDQo+IGFuZCB0
aGUgY29tcGF0aWJsZSBzaG91bGQgYmUNCj4gDQo+IGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTkyLWdjZSIsICJtZWRpYXRlayxtdDY3NzktZ2NlIjsNCj4gDQo+IElmIHRoZXkgYXJlIG5vdCBp
ZGVudGljYWwsIHdoYXQncyB0aGUgZGlmZmVyZW50Pw0KPiANCj4gUmVnYXJkcywNCj4gQ2h1bi1L
dWFuZy4NCg0KaXJxIGlkIGlzIGRpZmZlcmVudCANCm10ODE5MiBkdHMNCmh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8xNjA4NzcwODg5LTk0
MDMtMy1naXQtc2VuZC1lbWFpbC15b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbS8NCg0KbXQ2Nzc5
IGR0cw0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVr
L3BhdGNoLzE1NzQzMjc1NTItMTE4MDYtNi1naXQtc2VuZC1lbWFpbC1kZW5uaXMteWMuaHNpZWhA
bWVkaWF0ZWsuY29tLw0KDQphbmQgZ2NlIGV2ZW50IGlkIGFsc28gZGlmZmVyZW50DQpodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMTYwODc3
MDg4OS05NDAzLTItZ2l0LXNlbmQtZW1haWwteW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20vDQoN
Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRj
aC8xNTc0MzI3NTUyLTExODA2LTItZ2l0LXNlbmQtZW1haWwtZGVubmlzLXljLmhzaWVoQG1lZGlh
dGVrLmNvbS8NCg0KDQo+IA0KPiA+ICAgICAgICAge30NCj4gPiAgfTsNCj4gPg0KPiA+IC0tDQo+
ID4gMS44LjEuMS5kaXJ0eQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0DQo+ID4gTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
