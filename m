Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48CFC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 06:28:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B97D206B7
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 06:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B97D206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M+U2G2nd56pUlurmxORdenKikPJbGdfACF5U+x8lwjo=; b=sSc/J/rAnniZtS2QCGJa/2wkk
	kDexHL3X7wLO7S102VoebXBbaOLg4hSnL/F1WfyvKyK86AZ21RbcSjeRHBKGOm/aWqQqIZlkxN/Rh
	AS+fkULKlHlAi1e9EhKESPTzCX2qeFnyanHhJrcqMrx7EWEAk/G7Cys6gdyJ2aGO6CU5J/VRGeV6j
	/GijxJnzmcspzINO4LpDMdHXidTdzlHTawEcGlp57BqpGWGD5Mx+qbZTUQqy0/NdO1Un/a6iMXcXk
	FYBYQaADT/BiGVBDuzg05qFANKSu+C7XNQk3WrVJvpxmp0z6U+L/Kp6maOOR7lWB66IvScsS7Jdiu
	bv6+8gvVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3vM7-0001L3-Er; Mon, 25 Jan 2021 06:28:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3vM2-0001KH-K2; Mon, 25 Jan 2021 06:28:03 +0000
X-UUID: 8927c62826224bc8bb406cc62884146c-20210124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BTFnfX9tvYF+UTisfH0CClcEuPKpZzWlTghgpfHyzAE=; 
 b=WcJYyQ1C9QghVaMAGv3CgBsyHvJI8ysSc6dw/T/gx6d/RnT9gfFHMCDjpelP1apwY8Bwx+8YereNI1KjqMfQ3FpeuzUusAe5uJROyxahquX9g+g/YWoX0XaeUI6YzUKVPV8GaQdp+GzUPMrab9H0VWikNmXWFbdGpooGrE3G9Yo=;
X-UUID: 8927c62826224bc8bb406cc62884146c-20210124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 933113031; Sun, 24 Jan 2021 22:27:56 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Jan 2021 22:19:30 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Jan 2021 14:19:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Jan 2021 14:19:18 +0800
Message-ID: <1611555559.3905.2.camel@mhfsdcap03>
Subject: Re: [PATCH next v2 04/17] dt-bindings: phy: mediatek: dsi-phy: add
 optional clock-names
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 25 Jan 2021 14:19:19 +0800
In-Reply-To: <CAAOTY_84OF71QK6M5JT1M5YAFKED_xWVpx8B8t859OsVxE0cfQ@mail.gmail.com>
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
 <20210122120323.4337-4-chunfeng.yun@mediatek.com>
 <CAAOTY_84OF71QK6M5JT1M5YAFKED_xWVpx8B8t859OsVxE0cfQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3A0FC78E41D0B8BD472C347915E9404CB40430474059A1083A147199EE7783B72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_012802_887992_510753A5 
X-CRM114-Status: GOOD (  20.09  )
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
Cc: DTML <devicetree@vger.kernel.org>, Min Guo <min.guo@mediatek.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Linux
 ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAyMDIxLTAxLTIzIGF0IDA4OjE4ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgQ2h1bmZlbmc6DQo+IA0KPiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRl
ay5jb20+IOaWvCAyMDIx5bm0MeaciDIy5pelIOmAseS6lCDkuIvljYg4OjA05a+r6YGT77yaDQo+
ID4NCj4gPiBBZGQgYW4gb3B0aW9uYWwgImNsb2NrLW5hbWVzIiBwcm9wZXJ0eSwgaXQncyBub3Qg
dXNlZCB0byBnZXQgdGhlIGNsb2NrLA0KPiA+IGJ1dCBzb21lIERUUyBmaWxlcyAoZS5nLiBtdDgx
ODMpIHByb3ZpZGUgaXQuDQo+IA0KPiBJIHRoaW5rIHRoZSBsb2dpYyBpcyB0aGF0IHdlIGRlZmlu
ZSBwcm9wZXJ0eSBpbiBiaW5kaW5nIGRvY3VtZW50DQo+IGZpcnN0LCBhbmQgdGhlbiB3cml0ZSBp
dCBpbiBkZXZpY2UgdHJlZS4gSWYgYSBwcm9wZXJ0eSBkb2VzIG5vdCBleGlzdA0KPiBpbiBiaW5k
aW5nIGRvY3VtZW50LCB3ZSBzaG91bGQgbm90IHdyaXRlIGl0IGluIGRldmljZSB0cmVlLiBTbyBs
ZXQncw0KPiBkcm9wIHRoaXMgcGF0Y2ggYW5kIHJlbW92ZSBjbG9jay1uYW1lcyBpbiBtdDgxODMu
ZHRzaS4NCk9rLCBJdCdzIGJldHRlciB0byByZW1vdmUgdW5uZWNlc3NhcnkgcHJvcGVydHkuDQoN
Cj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0KPiA+DQo+ID4gQ2M6IENodW4tS3Vh
bmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPg0KPiA+IENjOiBQaGlsaXBwIFphYmVsIDxw
LnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8
Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjogbmV3IHBhdGNoIHNl
cGFyYXRlZCBmcm9tIFszLzE1XSBzdWdnZXN0ZWQgYnkgQ0sNCj4gPiAtLS0NCj4gPiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwgfCA0
ICsrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWss
ZHNpLXBoeS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRp
YXRlayxkc2ktcGh5LnlhbWwNCj4gPiBpbmRleCA2ZTRkNzk1ZjliMDIuLmFmNmU1NTRjNWI2OSAx
MDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21l
ZGlhdGVrLGRzaS1waHkueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sDQo+ID4gQEAgLTM1LDYgKzM1LDEwIEBA
IHByb3BlcnRpZXM6DQo+ID4gICAgICBpdGVtczoNCj4gPiAgICAgICAgLSBkZXNjcmlwdGlvbjog
UExMIHJlZmVyZW5jZSBjbG9jaw0KPiA+DQo+ID4gKyAgY2xvY2stbmFtZXM6DQo+ID4gKyAgICBp
dGVtczoNCj4gPiArICAgICAgLSBjb25zdDogcmVmDQo+ID4gKw0KPiA+ICAgIGNsb2NrLW91dHB1
dC1uYW1lczoNCj4gPiAgICAgIG1heEl0ZW1zOiAxDQo+ID4NCj4gPiAtLQ0KPiA+IDIuMTguMA0K
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4g
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0DQo+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
