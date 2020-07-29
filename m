Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE99C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:50:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08BFB206D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:50:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y6OsisqQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KBQhBILB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08BFB206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X6roWaKf5OgJ63yVfzno8tIDoReL2wURAzFsr1VzA7A=; b=Y6OsisqQOjwNyvl40Gfr6ivyT
	LxglYgkuDXOt7gnZFyh2Vi6MDundgCptCiiVoElk7HxI2bsm/rS1HEaBgbTWoncL6F5HIPnW4MxhJ
	61vf/5DvFPoxIoMt5S0ctfLMRSAHxEr/nV5oaD3DEkfz7RTjFcj5v8rUufGcSbZkqfy+k4UR8ZQRN
	DX/wI6fIDaFtIvKNJovGo9OIDT5nyMAMBvqvxMr2+cVkdYBpmQ666lcw89dGIzkK/59wNDFCNJ1pz
	0pVZ/kvz8LThTfuqPQnFflhYn45WEZPPXRSz93vu5pqBEmt7ME9HPYKpJaYNHG5gaNZ8cY3RDjuY2
	VVhb+g7tA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0gqc-0004EZ-CS; Wed, 29 Jul 2020 07:49:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0gqY-0004CH-Ix; Wed, 29 Jul 2020 07:49:55 +0000
X-UUID: b5efcc9fab95426bb1588095f64ae0ec-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PLS803tvjxppBUkg87cILtTBEuzNXhpjoLU3sd43MOw=; 
 b=KBQhBILBY4thJZnHoetRGaauIVadATRUvBfrACdmCdC7nljM3qKcKQLFYABxlMiTb29rNn4Qh2wAQxJC2XE1ogKlmqDG/eV/csmqZLulrl/kVbNwKJGVFqTXz9V43sXypbjugqEQorK3i4Av73MgOoUs3NiQ4oZB4g8dg5hGWSc=;
X-UUID: b5efcc9fab95426bb1588095f64ae0ec-20200728
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1572013184; Tue, 28 Jul 2020 23:49:32 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 00:49:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 15:49:29 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 15:49:31 +0800
Message-ID: <1596008970.20318.19.camel@mtksdccf07>
Subject: Re: [PATCH v3] net: ethernet: mtk_eth_soc: fix mtu warning
From: Landen Chao <landen.chao@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 29 Jul 2020 15:49:30 +0800
In-Reply-To: <20200728085355.7de7c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <20200728122743.78489-1-frank-w@public-files.de>
 <20200728085355.7de7c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_034955_003887_00814CC8 
X-CRM114-Status: GOOD (  15.20  )
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
Cc: Frank Wunderlich <frank-w@public-files.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 =?ISO-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mark-MC Lee =?UTF-8?Q?=28=E6=9D=8E=E6=98=8E=E6=98=8C=29?=
 <Mark-MC.Lee@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgRnJhbmssDQoNCklmIHlvdSBzZW5kIG5leHQgdmVyc2lvbiBvZiBwYXRjaCwgeW91IGNhbiBo
ZWxwIHRvIGFkZCB0aGUgU2lnbmVkLW9mZg0KbGluZS4gVGhhbmtzLg0KU2lnbmVkLW9mZi1ieTog
TGFuZGVuIENoYW8gPGxhbmRlbi5jaGFvQG1lZGlhdGVrLmNvbT4NCg0KT24gVHVlLCAyMDIwLTA3
LTI4IGF0IDIzOjUzICswODAwLCBKYWt1YiBLaWNpbnNraSB3cm90ZToNCj4gT24gVHVlLCAyOCBK
dWwgMjAyMCAxNDoyNzo0MyArMDIwMCBGcmFuayBXdW5kZXJsaWNoIHdyb3RlOg0KPiA+IEZyb206
IExhbmRlbiBDaGFvIDxsYW5kZW4uY2hhb0BtZWRpYXRlay5jb20+DQo+IA0KPiBIaSBnZW50cywN
Cj4gDQo+IGlmIHRoZSBwYXRjaCBpcyBmcm9tIExhbmRlbiB3ZSBuZWVkIGhpcyBzaWduLW9mZiBv
biBpdC4NCj4gDQo+ID4gaW4gcmVjZW50IEtlcm5lbC1WZXJzaW9ucyB0aGVyZSBhcmUgd2Fybmlu
Z3MgYWJvdXQgaW5jb3JyZWN0IE1UVS1TaXplDQo+ID4gbGlrZSB0aGVzZToNCj4gPiANCj4gPiBl
dGgwOiBtdHUgZ3JlYXRlciB0aGFuIGRldmljZSBtYXhpbXVtDQo+ID4gbXRrX3NvY19ldGggMWIx
MDAwMDAuZXRoZXJuZXQgZXRoMDogZXJyb3IgLTIyIHNldHRpbmcgTVRVIHRvIGluY2x1ZGUgRFNB
IG92ZXJoZWFkDQo+ID4gDQo+ID4gRml4ZXM6IGJmY2I4MTMyMDNlNiAoIm5ldDogZHNhOiBjb25m
aWd1cmUgdGhlIE1UVSBmb3Igc3dpdGNoIHBvcnRzIikNCj4gPiBGaXhlczogNzI1NzllMTRhMWQz
ICgibmV0OiBkc2E6IGRvbid0IGZhaWwgdG8gcHJvYmUgaWYgd2UgY291bGRuJ3Qgc2V0IHRoZSBN
VFUiKQ0KPiA+IEZpeGVzOiA3YTRjNTNiZWUzMzIgKCJuZXQ6IHJlcG9ydCBpbnZhbGlkIG10dSB2
YWx1ZSB2aWEgbmV0bGluayBleHRhY2siKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFJlbsOpIHZhbiBE
b3JzdCA8b3BlbnNvdXJjZUB2ZG9yc3QuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIFd1
bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPg0KPiANCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
