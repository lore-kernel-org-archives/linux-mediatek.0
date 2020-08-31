Return-Path: <SRS0=LMMB=CJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A22CC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 03:00:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 384A9206FA
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2020 03:00:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k3CrfYAh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LUoYkR/W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 384A9206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IdGwLv+nxJC7esAwYgkHgirciVRleWPPGhhjotDi+pM=; b=k3CrfYAhK3JFqeDt2x6NYGOFP
	cWCUMu0DuuIr0asZ76vNOcQ91a28V2qsO+jXNKyi30q/BbDcbC1hmDp1DIbMVh2Kh8IXsIoYtu4AN
	0nxv8kv+WODcvIPxOpr73HoTVhx1X65a1l5V5svpTr+iZng6fj4bL6P4rxoe3PHz9wnWVI1aTNLxM
	7GNLX/fOzH/GBzJ+AXl1h9kguCF30A9FWdlUe4BSMi0pMzox2mAX/c+DqYpJZJ2NBeOHDuqCOuzJk
	uf6LChJ8F4Xl2WS2Md50y8s0Uf8lmIpGtg084m47nUVqKqC/1+opZ+N325HkCVwUg4SAyctgXi6De
	l7TaqxGOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCa3G-00070H-A7; Mon, 31 Aug 2020 03:00:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCa3A-0006xb-54; Mon, 31 Aug 2020 03:00:07 +0000
X-UUID: 76492ebfa7514132b44d2d2f7e3f5b88-20200830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sxA4q5kZv1gPdhXKXWhBUtYma0O+/4Q3ZgXNHmoU+Js=; 
 b=LUoYkR/WmFRSKppCxbv+gLdg84HG68hd7KB0bX/USBtwBP4y5+3M8tj7OUsFNaMdnUfuf672LOkhWUfXQZ+zRt+epT2Pr0h7p5lFwVkprMOf7Cff6jXbAHgIf657s6LzRewB5fFXEiediSKgv05UeD2waUnRPwoRss2PlNlh+Ys=;
X-UUID: 76492ebfa7514132b44d2d2f7e3f5b88-20200830
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1477494496; Sun, 30 Aug 2020 18:59:56 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 30 Aug 2020 19:59:54 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 31 Aug 2020 10:59:51 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 31 Aug 2020 10:59:50 +0800
Message-ID: <1598842698.11403.2.camel@mhfsdcap03>
Subject: Re: [PATCH v4 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: ChiYuan Huang <u0084500@gmail.com>
Date: Mon, 31 Aug 2020 10:58:18 +0800
In-Reply-To: <CADiBU39P7jeSOV2_GcXh6A=b8SCViURCsS8SZFmy+oY2hS74tg@mail.gmail.com>
References: <1598610636-4939-1-git-send-email-u0084500@gmail.com>
 <1598610636-4939-2-git-send-email-u0084500@gmail.com>
 <20200828220520.GA3482472@bogus>
 <CADiBU3-pd7nvtf2_1ssYVLQc4HOHX6PUyyx6GiJ_gH-4DaGmog@mail.gmail.com>
 <CADiBU39P7jeSOV2_GcXh6A=b8SCViURCsS8SZFmy+oY2hS74tg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2140C069E5EBD92A1DA8B8FF4EC85146537652C50164FEE7A5993EA1D23FCBB42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_230005_578491_248EA34F 
X-CRM114-Status: GOOD (  27.92  )
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
Cc: gene_chen@richtek.com, Rob Herring <robh@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, devicetree@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAyMDIwLTA4LTI5IGF0IDEwOjQ5ICswODAwLCBDaGlZdWFuIEh1YW5nIHdyb3RlOg0K
PiBDaGlZdWFuIEh1YW5nIDx1MDA4NDUwMEBnbWFpbC5jb20+IOaWvCAyMDIw5bm0OOaciDI55pel
IOmAseWFrSDkuIrljYg4OjMy5a+r6YGT77yaDQo+ID4NCj4gPiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPiDmlrwgMjAyMOW5tDjmnIgyOeaXpSDpgLHlha0g5LiK5Y2INjowNeWvq+mBk++8
mg0KPiA+ID4NCj4gPiA+IE9uIEZyaSwgQXVnIDI4LCAyMDIwIGF0IDA2OjMwOjM2UE0gKzA4MDAs
IGN5X2h1YW5nIHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBDaGlZdWFuIEh1YW5nIDxjeV9odWFuZ0By
aWNodGVrLmNvbT4NCj4gPiA+ID4NCj4gPiA+ID4gQWRkIGEgZGV2aWNldHJlZSBiaW5kaW5nIGRv
Y3VtZW50YXRpb24gZm9yIHRoZSBNVDYzNjAgVHlwZS1DIGRyaXZlci4NCj4gPiA+ID4NCj4gPiA+
ID4gdXNiIHR5cGVjOiBtdDYzNjA6IFJlbmFtZSBEVCBiaW5kaW5nIGRvdW1lbnQgZnJvbSBtdDYz
NjAgdG8gbXQ2MzZ4DQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENoaVl1YW4gSHVh
bmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIC4uLi9iaW5k
aW5ncy91c2IvbWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbCAgICAgICAgIHwgNzMgKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKykN
Cj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvdXNiL21lZGlhdGVrLG10NjM2MC10Y3BjLnlhbWwNCj4gPiA+ID4NCj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0ZWss
bXQ2MzYwLXRjcGMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
bWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbA0KPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiA+ID4gPiBpbmRleCAwMDAwMDAwMC4uOWU4YWIwZA0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+
ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0
ZWssbXQ2MzYwLXRjcGMueWFtbA0KPiA+ID4gPiBAQCAtMCwwICsxLDczIEBADQo+ID4gPiA+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkN
Cj4gPiA+ID4gKyVZQU1MIDEuMg0KPiA+ID4gPiArLS0tDQo+ID4gPiA+ICskaWQ6ICJodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy91c2IvbWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbCMiDQo+
ID4gPiA+ICskc2NoZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjIg0KPiA+ID4gPiArDQo+ID4gPiA+ICt0aXRsZTogTWVkaWF0ZWsgTVQ2MzYwIFR5cGUt
QyBQb3J0IFN3aXRjaCBhbmQgUG93ZXIgRGVsaXZlcnkgY29udHJvbGxlciBEVCBiaW5kaW5ncw0K
PiA+ID4gPiArDQo+ID4gPiA+ICttYWludGFpbmVyczoNCj4gPiA+ID4gKyAgLSBDaGlZdWFuIEh1
YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNvbT4NCj4gPiA+ID4gKw0KPiA+ID4gPiArZGVzY3JpcHRp
b246IHwNCj4gPiA+ID4gKyAgTWVkaWF0ZWsgTVQ2MzYwIGlzIGEgbXVsdGktZnVuY3Rpb25hbCBk
ZXZpY2UuIEl0IGludGVncmF0ZXMgY2hhcmdlciwgQURDLCBmbGFzaCwgUkdCIGluZGljYXRvcnMs
DQo+ID4gPiA+ICsgIHJlZ3VsYXRvcnMgKEJVQ0tzL0xET3MpLCBhbmQgVHlwZUMgUG9ydCBTd2l0
Y2ggd2l0aCBQb3dlciBEZWxpdmVyeSBjb250cm9sbGVyLg0KPiA+ID4gPiArICBUaGlzIGRvY3Vt
ZW50IG9ubHkgZGVzY3JpYmVzIE1UNjM2MCBUeXBlLUMgUG9ydCBTd2l0Y2ggYW5kIFBvd2VyIERl
bGl2ZXJ5IGNvbnRyb2xsZXIuDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3Byb3BlcnRpZXM6DQo+ID4g
PiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gPiA+ICsgICAgZW51bToNCj4gPiA+ID4gKyAgICAgIC0g
bWVkaWF0ZWssbXQ2MzYwLXRjcGMNCj4gPiA+ID4gKw0KPiA+ID4gPiArICBpbnRlcnJ1cHRzLWV4
dGVuZGVkOg0KPiA+ID4NCj4gPiA+IFVzZSAnaW50ZXJydXB0cycuIFRoZSB0b29saW5nIHdpbGwg
YXV0b21hdGljYWxseSBzdXBwb3J0DQo+ID4gPiAnaW50ZXJydXB0cy1leHRlbmRlZCcuDQo+ID4g
T2theS4NCj4gPiA+DQo+ID4gPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+ID4gKw0KPiA+ID4g
PiArICBpbnRlcnJ1cHQtbmFtZXM6DQo+ID4gPiA+ICsgICAgaXRlbXM6DQo+ID4gPiA+ICsgICAg
ICAtIGNvbnN0OiBQRF9JUlFCDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3BhdHRlcm5Qcm9wZXJ0aWVz
Og0KPiA+ID4gPiArICAiY29ubmVjdG9yIjoNCj4gPiA+ID4gKyAgICB0eXBlOiBvYmplY3QNCj4g
PiA+ID4gKyAgICAkcmVmOiAuLi9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sIw0KPiA+ID4g
PiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4gPiArICAgICAgUHJvcGVydGllcyBmb3IgdXNiIGMg
Y29ubmVjdG9yLg0KPiA+ID4gPiArDQo+ID4gPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UNCj4gPiA+ID4gKw0KPiA+ID4gPiArcmVxdWlyZWQ6DQo+ID4gPiA+ICsgIC0gY29tcGF0aWJs
ZQ0KPiA+ID4gPiArICAtIGludGVycnVwdHMtZXh0ZW5kZWQNCj4gPiA+ID4gKyAgLSBpbnRlcnJ1
cHQtbmFtZXMNCj4gPiA+ID4gKw0KPiA+ID4gPiArZXhhbXBsZXM6DQo+ID4gPiA+ICsgIC0gfA0K
PiA+ID4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9p
cnEuaD4NCj4gPiA+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvdXNiL3BkLmg+DQo+ID4g
PiA+ICsgICAgaTJjMCB7DQo+ID4gPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
PiA+ID4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiA+ID4gKw0KPiA+ID4gPiAr
ICAgICAgICBtdDYzNjBAMzQgew0KPiA+ID4gPiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDYzNjAiOw0KPiA+ID4gPiArICAgICAgICAgICAgcmVnID0gPDB4MzQ+Ow0KPiA+
ID4gPiArDQo+ID4gPiA+ICsgICAgICAgICAgICB0Y3BjIHsNCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjM2MC10Y3BjIjsNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZncGlvMjYgMyBJUlFfVFlQRV9MRVZF
TF9MT1c+Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJQRF9J
UlFCIjsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICAgICAgICAgIGNvbm5lY3RvciB7DQo+
ID4gPg0KPiA+ID4gV2hlcmUncyB0aGUgZGF0YSBjb25uZWN0aW9ucz8gVGhlIGFzc3VtcHRpb24g
b2YgdGhlIGJpbmRpbmcgaXMgdGhlIFVTQg0KPiA+ID4gKDIgYW5kIDMpIGNvbm5lY3Rpb25zIGNv
bWUgZnJvbSB0aGUgcGFyZW50IGlmIHRoZXJlJ3Mgbm8gZ3JhcGggdG8gdGhlDQo+ID4gPiBVU0Ig
Y29udHJvbGxlcihzKS4NCj4gPiBNVDYzNjAgaXMgb25seSBhIHN1YnBtaWMuIFR5cGVDIHBhcnQg
b25seSBoYW5kbGUgdGhlIENDIGxvZ2ljIHRvIHN1cHBvcnQgVVNCUEQuDQo+ID4gRm9yIHRoZSB1
c2IgY29ubmVjdGlvbiBsaWtlIGFzIHVzYmhzL3VzYnNzLCAgaXQgbmVlZCB0byBiZSBoYW5kbGVk
DQo+ID4gYnkvY29ubmVjdCB0byBhcHBsaWNhdGlvbiBwcm9jZXNzb3Igc2lkZS4NCj4gPiBMSWtl
IGFzIGNvbm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwgZGVjcmliZWQsIGl0ICBzcGVjaWZ5IHRo
ZSBwb3J0DQo+ID4gcHJvcGVydHkgdG8gYmluZCBVU0IgSFMvU1MuDQo+ID4NCj4gRG8gaSBuZWVk
IHRvIGFkZCB0aGUgcG9ydHMgaW50byB0aGUgY29ubmVjdG9yIG5vZGUgZm9yIGV4YW1wbGU/DQo+
IExpa2UgYXMgaHMvc3MvYXV4LCB0byBtYWtlIHRoZSB1c2VyIGtub3cgdG8gdXNlIDYzNjAncyB0
Y3BjPw0KPiANCj4gSSBjaGVjayB0aGUgIHN0eWxlIGluIGNvbm5lY3Rvci91c2ItY29ubmVjdC55
YW1sDQo+IERvIEkgYWxzbyBuZWVkIHRvIHJlcGxhY2UgdHdvIHNwYWNlIGluc3RlYWQgb2Ygb25l
IHRhYiBpbiB0aGUgYmluZGluZyBleGFtcGxlPw0KDQpzZWUgd3JpdGluZy1zY2hlbWEucnN0IGFi
b3V0IGV4YW1wbGVzOg0KDQoiTm90ZTogWUFNTCBkb2Vzbid0IGFsbG93IGxlYWRpbmcgdGFicywg
c28gc3BhY2VzIG11c3QgYmUgdXNlZCBpbnN0ZWFkLiINCj4gDQo+ID4gPg0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ1c2ItYy1jb25uZWN0b3IiOw0KPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiVVNCLUMiOw0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgZGF0YS1yb2xlID0gImR1YWwiOw0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgcG93ZXItcm9sZSA9ICJkdWFsIjsNCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgIHRyeS1wb3dlci1yb2xlID0gInNpbmsiOw0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgc291cmNlLXBkb3MgPSA8UERPX0ZJWEVEKDUwMDAsIDEwMDAs
IFBET19GSVhFRF9EVUFMX1JPTEUgfCBQRE9fRklYRURfREFUQV9TV0FQKT47DQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICBzaW5rLXBkb3MgPSA8UERPX0ZJWEVEKDUwMDAsIDIwMDAs
IFBET19GSVhFRF9EVUFMX1JPTEUgfCBQRE9fRklYRURfREFUQV9TV0FQKT47DQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICBvcC1zaW5rLW1pY3Jvd2F0dCA9IDwxMDAwMDAwMD47DQo+
ID4gPiA+ICsgICAgICAgICAgICAgICAgfTsNCj4gPiA+ID4gKyAgICAgICAgICAgIH07DQo+ID4g
PiA+ICsgICAgICAgIH07DQo+ID4gPiA+ICsgICAgfTsNCj4gPiA+ID4gKy4uLg0KPiA+ID4gPiAt
LQ0KPiA+ID4gPiAyLjcuNA0KPiA+ID4gPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
