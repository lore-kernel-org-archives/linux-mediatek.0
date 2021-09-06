Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A9EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 02:08:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF15660E94
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 02:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF15660E94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eOg3hYI3ftRDYEH/Bo73Ke7hyUtfr+uftH3touDhwBY=; b=prbU0r6SV5v1Ms
	H21cu/ZjbcPM2rpfkxb02y1VBHvVJduNWFgaa3TclaLHcIH3yop9nYXEZ6eOwHevMS7DvM7mgHQSK
	fkB4cu8D5EJ+9EGkFRh0W8lB9tAKibOXsYeTXhDfHimmHXqthhYLPV0ZXFQSgjBwozkEP7H5bRmzo
	UxUBK9An/3Uo9f25VHglgD2CyNhPA4LNJwq9EMrauL40FFYp4XSO3sTigs/udUT++ux/VQDs7jKsB
	iP0PEREVViv40esYZ9Y1FfxO9X+qWxWl6nlhIfPv4TbqsyOwVgU3b+FcVwYXknTBglm4h/fUioc2i
	QeZf4kTBSHJyvtGvAaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mN436-00H4wd-AC; Mon, 06 Sep 2021 02:07:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mN431-00H4vx-NP; Mon, 06 Sep 2021 02:07:50 +0000
X-UUID: 633f3435c32745bc93a660a1db647231-20210905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MZwitWcPlZ52AcQZdvg2ZK9T0rjff8QaNG34iwL8okg=; 
 b=DJe4UjWWpT43AeDzabr2N5ZG6SZA7NSBAHZ/82QMvjSvCPEflWUBXfOd4rtgpJy0eW8d3y8zvzzGYgxyqYqEWmcw2ifWVrA3+vWcDsSEGct2uVU00fS7mJy37bakZ8OKGcVQz/J4URTjpVG6k/MbOLNmwKmh+jpsYTTBsVFYkgo=;
X-UUID: 633f3435c32745bc93a660a1db647231-20210905
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1701170710; Sun, 05 Sep 2021 19:07:42 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Sep 2021 18:57:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Sep 2021 09:57:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Sep 2021 09:57:38 +0800
Message-ID: <161c4baecbee6cadbe5bc3e12b811a71a7bc7603.camel@mediatek.com>
Subject: Re: [PATCH v3 6/7] soc: mediatek: mmsys: Add reset controller support
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-kernel <linux-kernel@vger.kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "Jitao
 Shi" <jitao.shi@mediatek.com>, Eizan Miyamoto <eizan@chromium.org>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Collabora Kernel ML <kernel@collabora.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Date: Mon, 6 Sep 2021 09:57:38 +0800
In-Reply-To: <fbca20f5-9e16-c302-0111-1d57f2a496b9@collabora.com>
References: <20210825102632.601614-1-enric.balletbo@collabora.com>
 <20210825122613.v3.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid>
 <ebbe37cb0188a7ea23608569ab083e65e0f95df6.camel@pengutronix.de>
 <CAAOTY__wg+dWi-4v4evyuWp1EVfj2bap3xtsHZdGET4Jf-MgEw@mail.gmail.com>
 <fbca20f5-9e16-c302-0111-1d57f2a496b9@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_190749_212610_7863F545 
X-CRM114-Status: GOOD (  17.11  )
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

SGkgRW5yaWMsDQoNCg0KT24gRnJpLCAyMDIxLTA5LTAzIGF0IDE2OjEwICswMjAwLCBFbnJpYyBC
YWxsZXRibyBpIFNlcnJhIHdyb3RlOg0KPiBIaSBOYW5jeSwNCj4gDQo+IChhZ2FpbiBpbiBwbGFp
biB0ZXh0LCBzb3JyeSBmb3IgdGhlIG5vaXNlKQ0KPiANCj4gT24gMjYvOC8yMSAyOjMzLCBDaHVu
LUt1YW5nIEh1IHdyb3RlOg0KPiA+IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXgu
ZGU+IOaWvCAyMDIx5bm0OOaciDI15pelIOmAseS4iSDkuIvljYg2OjQ25a+r6YGT77yaDQo+ID4g
PiANCj4gPiA+IE9uIFdlZCwgMjAyMS0wOC0yNSBhdCAxMjoyNiArMDIwMCwgRW5yaWMgQmFsbGV0
Ym8gaSBTZXJyYSB3cm90ZToNCj4gPiA+ID4gQW1vbmcgb3RoZXIgZmVhdHVyZXMgdGhlIG1tc3lz
IGRyaXZlciBzaG91bGQgaW1wbGVtZW50IGEgcmVzZXQNCj4gPiA+ID4gY29udHJvbGxlciB0byBi
ZSBhYmxlIHRvIHJlc2V0IGRpZmZlcmVudCBiaXRzIGZyb20gdGhlaXIgc3BhY2UuDQo+ID4gPiA+
IA0KPiA+ID4gPiBDYzogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPg0KPiA+ID4g
PiBTdWdnZXN0ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPg0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDwNCj4gPiA+ID4g
ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4NCj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAN
Cj4gPiA+ID4gKG5vIGNoYW5nZXMgc2luY2UgdjEpDQo+ID4gPiA+IA0KPiA+ID4gPiAgZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMgfCA2OQ0KPiA+ID4gPiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
LmggfCAgMiArDQo+ID4gPiANCj4gPiA+IENjOiBOYW5jeSAtIHRoaXMgcGF0Y2ggY2xhc2hlcyB3
aXRoIFsxXSwgcGxlYXNlIGNvb3JkaW5hdGUuDQo+ID4gPiANCj4gPiA+IFsxXSANCj4gPiA+IGh0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1h
cm0ta2VybmVsLzIwMjEwODI1MTAwNTMxLjU2NTMtMTEtbmFuY3kubGluQG1lZGlhdGVrLmNvbS9f
XzshIUNUUk5LQTl3TWcwQVJidyExYWpFS1dOTnZteVNYdFpnQmdWaDdhY1ozVG44d0dHYm4wSzk3
MHlkTkNuMF9idmFTYUlEd1A3ZXdzc0pOaUExJA0KPiA+ID4gIA0KPiA+IA0KPiA+IEVucmljJ3Mg
c2VyaWVzIGlzIGFsbCByZXZpZXdlZCBvciBhY2tlZCwgc28gSSB0aGluayBOYW5jeSdzIHNlcmll
cw0KPiA+IHNob3VsZCBiYXNlIG9uIEVucmljJ3Mgc2VyaWVzLg0KPiA+IA0KPiANCj4gSXMgaXQg
ZmluZSB3aXRoIHlvdSB0byBiYXNlIHlvdSBwYXRjaGVzIG9uIHRvcCBvZiB0aGlzIHBhdGNoc2V0
Pw0KPiANCj4gVGhhbmtzLA0KPiAgIEVucmljDQo+IA0KT0ssIEkgd2lsbCBiYXNlIG9uIHRoaXMg
cGF0Y2hzZXQgaW4gbXkgbmV4dCByZXZpc2lvbi4gVGhhbmsgeW91Lg0KDQpSZWdhcmRzLA0KTmFu
Y3kNCj4gDQo+ID4gUmVnYXJkcywNCj4gPiBDaHVuLUt1YW5nLg0KPiA+IA0KPiA+ID4gDQo+ID4g
PiByZWdhcmRzDQo+ID4gPiBQaGlsaXBwDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
