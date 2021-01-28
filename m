Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45236C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 00:44:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E552A64DCE
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 00:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E552A64DCE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpifOywhRDIe6Ke/+dm9c+1k9kOtUHXTi0d8/3lgCd4=; b=sNB/Z+tHxygVlKasobwBZOq85D
	sypvu1BwNxLfWGHOYEUwzvz0P0TRrBWCwxVNSle4KT0IJqU1x79itqmOAyyc2+lz92C5Cgyac+iqQ
	qYo9qPYD1o7+goRuHMOA1mrWUhn4DoW9nYxgTuHcVliqfUeywb3yq42UVM6jHrPfghH5iJ57IU8uR
	CIsfOsoEpV4sXYUELSs+ez+fvofeYByxp9eMhC74kM3hc4KfgnsqzCUCb1Xsaybx4dzRLGwo+WWFz
	iQ1IDXtqg61tumESZVEjMi2wBWekfqdgUd2zwaaw/bSlxV8y5h+7XdTfgcbRSHpkNITsd645EdXfA
	r+q8LKaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4vPz-00074U-0f; Thu, 28 Jan 2021 00:44:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4vPu-00072x-Oi; Thu, 28 Jan 2021 00:44:13 +0000
X-UUID: 071e4d0719f5408e92f7d0433e911012-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=Moaf8HVdiYJmhrqmKzTtI0+ZWpCyJb1HWG+7EkTaLdo=; 
 b=rAjJRV+5bBJTftxPQ9FkxdbH0nxDPpWDhfa0COMe57uH1zneAzwAy0/14CS+EDtyFEE0Ln0owkbZ3vRrqMu/RYCYwZk62WyBA9zP3leKPvyZtcuHHQDtMDub/0xFqOmzWP7dzei3Ag50el6j5EjA/HkZGr337PT89HIGbztY3CY=;
X-UUID: 071e4d0719f5408e92f7d0433e911012-20210127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 731350736; Wed, 27 Jan 2021 16:44:05 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 16:43:43 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 28 Jan 2021 08:43:41 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 08:43:39 +0800
Message-ID: <1611794619.1947.0.camel@mhfsdcap03>
Subject: Re: [PATCH v3, 07/15] drm/mediatek: enable OVL_LAYER_SMI_ID_EN for
 multi-layer usecase
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 28 Jan 2021 08:43:39 +0800
In-Reply-To: <CAAOTY_9_LN8nYSmg42gpR5dLqTe+ABt61WzM8S5cp2D6-rWKyw@mail.gmail.com>
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-8-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9_LN8nYSmg42gpR5dLqTe+ABt61WzM8S5cp2D6-rWKyw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_194411_571583_3E835359 
X-CRM114-Status: GOOD (  22.04  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIxLTAxLTEyIGF0IDA3OjU5ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIx5bm0MeaciDEx5pelIOmAseS4gCDkuIvljYgzOjQ05a+r6YGT77ya
DQo+ID4NCj4gPiBlbmFibGUgT1ZMX0xBWUVSX1NNSV9JRF9FTiBmb3IgbXVsdGktbGF5ZXIgdXNl
Y2FzZQ0KPiANCj4gQ291bGQgeW91IGRlc2NyaWJlIG1vcmUgaW5mb3JtYXRpb24/IFdpdGhvdXQg
dGhpcyBwYXRjaCwgd2hhdCB3b3VsZCBoYXBwZW4/DQo+IA0KDQp3aXRob3V0IHRoaXMgcGF0Y2gs
IG92bCB3aWxsIGhhbmcgdXAgd2hlbiBtb3JlIHRoYW4gMSBsYXllciBlbmFibGVkDQoNCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
LmMgfCAxMiArKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gPiBp
bmRleCBiNDdjMjM4Li40OTM0YmVlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9vdmwuYw0KPiA+IEBAIC0yMyw2ICsyMyw3IEBADQo+ID4gICNkZWZpbmUgRElT
UF9SRUdfT1ZMX1JTVCAgICAgICAgICAgICAgICAgICAgICAgMHgwMDE0DQo+ID4gICNkZWZpbmUg
RElTUF9SRUdfT1ZMX1JPSV9TSVpFICAgICAgICAgICAgICAgICAgMHgwMDIwDQo+ID4gICNkZWZp
bmUgRElTUF9SRUdfT1ZMX0RBVEFQQVRIX0NPTiAgICAgICAgICAgICAgMHgwMDI0DQo+ID4gKyNk
ZWZpbmUgT1ZMX0xBWUVSX1NNSV9JRF9FTiAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQo
MCkNCj4gPiAgI2RlZmluZSBPVkxfQkdDTFJfU0VMX0lOICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEJJVCgyKQ0KPiA+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9ST0lfQkdDTFIgICAgICAg
ICAgICAgICAgIDB4MDAyOA0KPiA+ICAjZGVmaW5lIERJU1BfUkVHX09WTF9TUkNfQ09OICAgICAg
ICAgICAgICAgICAgIDB4MDAyYw0KPiA+IEBAIC02MSw2ICs2Miw3IEBAIHN0cnVjdCBtdGtfZGlz
cF9vdmxfZGF0YSB7DQo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgZ21jX2JpdHM7DQo+ID4gICAg
ICAgICB1bnNpZ25lZCBpbnQgbGF5ZXJfbnI7DQo+ID4gICAgICAgICBib29sIGZtdF9yZ2I1NjVf
aXNfMDsNCj4gPiArICAgICAgIGJvb2wgc21pX2lkX2VuOw0KPiA+ICB9Ow0KPiA+DQo+ID4gIC8q
Kg0KPiA+IEBAIC0xMTYsNyArMTE4LDE3IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfZGlzYWJsZV92
Ymxhbmsoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkNCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCBt
dGtfb3ZsX3N0YXJ0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApDQo+ID4gIHsNCj4gPiArICAg
ICAgIHN0cnVjdCBtdGtfZGlzcF9vdmwgKm92bCA9IGNvbXBfdG9fb3ZsKGNvbXApOw0KPiA+ICsN
Cj4gPiAgICAgICAgIHdyaXRlbF9yZWxheGVkKDB4MSwgY29tcC0+cmVncyArIERJU1BfUkVHX09W
TF9FTik7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYob3ZsLT5kYXRhLT5zbWlfaWRfZW4pIHsNCj4g
PiArICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHJlZzsNCj4gPiArDQo+ID4gKyAgICAgICAg
ICAgICAgIHJlZyA9IHJlYWRsKGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfREFUQVBBVEhfQ09O
KTsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gcmVnIHwgT1ZMX0xBWUVSX1NNSV9JRF9FTjsN
Cj4gPiArICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBjb21wLT5yZWdzICsgRElT
UF9SRUdfT1ZMX0RBVEFQQVRIX0NPTik7DQo+IA0KPiBJIHRoaW5rIHRoaXMgc2V0dGluZyBzaG91
bGQgYmVmb3JlIHdyaXRlIDEgdG8gRElTUF9SRUdfT1ZMX0VOLg0KPiANCj4gPiArICAgICAgIH0N
Cj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyB2b2lkIG10a19vdmxfc3RvcChzdHJ1Y3QgbXRrX2Rk
cF9jb21wICpjb21wKQ0KPiANCj4gU2hvdWxkIGNsZWFyIERJU1BfUkVHX09WTF9EQVRBUEFUSF9D
T04gd2hlbiBzdG9wPw0KPiANCj4gUmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCj4gDQo+ID4gLS0N
Cj4gPiAxLjguMS4xLmRpcnR5DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gPiBMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlaw0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
