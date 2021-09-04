Return-Path: <SRS0=vCgL=N2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576C9C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 15:11:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0927460F56
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 15:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0927460F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peex+U/yu8o2nYOg2uqxJuC6FtIBhabvKWtUgIJVBvo=; b=JPcCPVoxEMy5/w
	lxXT9KxLrxumZblivjHQrF/ylhGZJTlw5Xolc5Ec4LTVFO0uVPn9LBcqD4xT9ZwTS7+avC+9cw7GM
	/b4Snc6mEdzCMipbT6m0tUl4sjmw2R1I8H/9U+T4J1CBodmUsQ9EJm1dj4l32TxX+Fytph3yo+bwB
	iTGdeDXXqF78BsgH1UhHLoXI7mQtQVm/WTqrnZ7ebadNSNBOTD8Fu3rUoTUU1QLV98jAmQsyXOMFm
	trz2egXHnRy7oZuf3sB2Q+sFVpoJ3Uhzp67KaIni0vMOszPsCumDy3bm7Ma0ktmTheqdTQUy3VFlq
	sY/0V5d0oapwrtCSiLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMXK8-00ELWr-52; Sat, 04 Sep 2021 15:11:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMXJm-00ELLg-Rs; Sat, 04 Sep 2021 15:10:56 +0000
X-UUID: 4441652067f74c2497b10267b39d70bf-20210904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RyIAY0T/rYq+im92ZCaJuNgcDI6T0FxoLAPeoBZwg3U=; 
 b=U6PR2L8xM1YAxnhz0JVtId+gYJJbzY2jpp0NbchcRVISHGiwXMKY6TR2ytyCTZaGdcJgws2iU5RTgh9lsUnxJHX8hxuNc8prkJH6cPwxFA+Yud8m72G1yDqiRgqMVpmgXT4ctvieqDJqq/9RFCGOAuM+AHL3FSQ30dHYFWPhTY4=;
X-UUID: 4441652067f74c2497b10267b39d70bf-20210904
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1479662321; Sat, 04 Sep 2021 08:10:52 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Sep 2021 08:00:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Sep 2021 23:00:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 4 Sep 2021 23:00:48 +0800
Message-ID: <42a32455186e5deb476cca74e64de18e8cc1a34c.camel@mediatek.com>
Subject: Re: [PATCH] clk: rockchip: use module_platform_driver_probe
From: Miles Chen <miles.chen@mediatek.com>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>
Date: Sat, 4 Sep 2021 23:00:48 +0800
In-Reply-To: <1764446.vrLGdHa7mH@diego>
References: <20210902075713.7563-1-miles.chen@mediatek.com>
 <1764446.vrLGdHa7mH@diego>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_081054_955940_7C8E4C55 
X-CRM114-Status: GOOD (  16.78  )
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

T24gRnJpLCAyMDIxLTA5LTAzIGF0IDIyOjU5ICswMjAwLCBIZWlrbyBTdMO8Ym5lciB3cm90ZToN
Cj4gQW0gRG9ubmVyc3RhZywgMi4gU2VwdGVtYmVyIDIwMjEsIDA5OjU3OjEzIENFU1Qgc2Nocmll
YiBNaWxlcyBDaGVuOg0KPiA+IFJlcGxhY2UgYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUg
d2l0aA0KPiA+IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUNCj4gPiBiZWNhdXNlIHRoYXQg
cmszMzk5IGFuZCByazM1NjggY2FuIGJlIGJ1aWx0IGFzIGtlcm5lbCBtb2R1bGVzLg0KPiA+IA0K
PiA+IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+ID4gU2lnbmVkLW9mZi1i
eTogTWlsZXMgQ2hlbiA8bWlsZXMuY2hlbkBtZWRpYXRlay5jb20+DQo+IA0KPiBvbiBib3RoIHJr
MzM5OSBhbmQgcmszNTY4Og0KPiBUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRl
Y2guZGU+DQo+IA0KPiBhbmQgYWxzbw0KPiBSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhl
aWtvQHNudGVjaC5kZT4NCj4gDQoNCnRoYW5rcyBmb3IgZG9pbmcgdGhlIHRlc3QuIEkgd2lsbCBh
ZGQgeW91ciB0YWdzIGluIG15IG5leHQgcGF0Y2guDQo+IA0KPiBIZWlrbw0KPiANCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9jbGsvcm9ja2NoaXAvY2xrLXJrMzM5OS5jIHwgMiArLQ0KPiA+ICBkcml2
ZXJzL2Nsay9yb2NrY2hpcC9jbGstcmszNTY4LmMgfCAyICstDQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2Nsay9yb2NrY2hpcC9jbGstcmszMzk5LmMNCj4gPiBiL2RyaXZlcnMvY2xrL3Jv
Y2tjaGlwL2Nsay1yazMzOTkuYw0KPiA+IGluZGV4IDYyYTRmMjU0Mzk2MC4uYTUxNjkxNTZmMWQy
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JvY2tjaGlwL2Nsay1yazMzOTkuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvY2xrL3JvY2tjaGlwL2Nsay1yazMzOTkuYw0KPiA+IEBAIC0xNjUzLDcg
KzE2NTMsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlcg0KPiA+IGNsa19yazMzOTlf
ZHJpdmVyID0gew0KPiA+ICAJCS5zdXBwcmVzc19iaW5kX2F0dHJzID0gdHJ1ZSwNCj4gPiAgCX0s
DQo+ID4gIH07DQo+ID4gLWJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyX3Byb2JlKGNsa19yazMzOTlf
ZHJpdmVyLA0KPiA+IGNsa19yazMzOTlfcHJvYmUpOw0KPiA+ICttb2R1bGVfcGxhdGZvcm1fZHJp
dmVyX3Byb2JlKGNsa19yazMzOTlfZHJpdmVyLCBjbGtfcmszMzk5X3Byb2JlKTsNCj4gPiAgDQo+
ID4gIE1PRFVMRV9ERVNDUklQVElPTigiUm9ja2NoaXAgUkszMzk5IENsb2NrIERyaXZlciIpOw0K
PiA+ICBNT0RVTEVfTElDRU5TRSgiR1BMIik7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L3JvY2tjaGlwL2Nsay1yazM1NjguYw0KPiA+IGIvZHJpdmVycy9jbGsvcm9ja2NoaXAvY2xrLXJr
MzU2OC5jDQo+ID4gaW5kZXggNzVjYTg1NWU3MjBkLi45MzllNzA3OWMzMzQgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9jbGsvcm9ja2NoaXAvY2xrLXJrMzU2OC5jDQo+ID4gKysrIGIvZHJpdmVy
cy9jbGsvcm9ja2NoaXAvY2xrLXJrMzU2OC5jDQo+ID4gQEAgLTE3MTksNyArMTcxOSw3IEBAIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyDQo+ID4gY2xrX3JrMzU2OF9kcml2ZXIgPSB7DQo+
ID4gIAkJLnN1cHByZXNzX2JpbmRfYXR0cnMgPSB0cnVlLA0KPiA+ICAJfSwNCj4gPiAgfTsNCj4g
PiAtYnVpbHRpbl9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUoY2xrX3JrMzU2OF9kcml2ZXIsDQo+ID4g
Y2xrX3JrMzU2OF9wcm9iZSk7DQo+ID4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUoY2xr
X3JrMzU2OF9kcml2ZXIsIGNsa19yazM1NjhfcHJvYmUpOw0KPiA+ICANCj4gPiAgTU9EVUxFX0RF
U0NSSVBUSU9OKCJSb2NrY2hpcCBSSzM1NjggQ2xvY2sgRHJpdmVyIik7DQo+ID4gIE1PRFVMRV9M
SUNFTlNFKCJHUEwiKTsNCj4gPiANCj4gDQo+IA0KPiANCj4gDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
