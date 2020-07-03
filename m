Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E31C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 01:43:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4649C20A8B
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 01:43:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aj+c9VA4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gTpT5exU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4649C20A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mzfW2r+Y2JbXX5MY81CWcWDMHYfT5XrcfnSTq/Zla9g=; b=aj+c9VA4sVhe9ULInaBQkpUjN
	FneXsGNBngUtFUoVWdCtOWf0nj/40ZBz+wbVcS0LAXNLoTPmXYQpcd7G24PFoMsNaELhmzWrASVQ5
	RHV6a5YeedWzuvb/a69gnURnXB4NFT5nv44bcxlAYNe4osS3Nw2a470VBY3Aa9Ih4QpIVzCr2FlHZ
	NUUfcSJYNaPu0+8QNLHhs+UADoEo34g0VQr7WC/W3sB731YoTh2BmsE9QqxENy2La3uVHIS61ahVa
	5qnOk336pUhPHCbShJYGXU75VgeBuq42PuYi7Lkr96DK5TDtlhnntKvwPbx37u/LoP0Qll3AxYwFH
	8HVWoDpCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrAjC-0005Il-Jz; Fri, 03 Jul 2020 01:42:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrAj9-0005IG-3y; Fri, 03 Jul 2020 01:42:56 +0000
X-UUID: 1a958e7710604058904eccbc8c128715-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sUHdggt26F3MOMSAq41fK1KG/YmQcbQ9D5Hb4j4vHwE=; 
 b=gTpT5exURc8zkpN1I2YB09E+U1WngkCfzhZbBniWYXIIouonZMOUHgZv1apcRyPZx4fI1x7Mx9tvlA8vXU3qn7JJ20luTSuI2eVOHEFpcDkoL5uc5qw9dKZkhpb5ZyH5w40FmtHW0aaoTLiAOtBiC+l3mMAHulyZHqXFrW0jpjI=;
X-UUID: 1a958e7710604058904eccbc8c128715-20200702
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1477517878; Thu, 02 Jul 2020 17:42:49 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 18:41:36 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 3 Jul 2020 09:41:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jul 2020 09:41:30 +0800
Message-ID: <1593740465.23885.19.camel@mhfsdcap03>
Subject: Re: [PATCH 16/30] usb: mtu3: mtu3_trace: Function headers are not
 suitable for kerneldoc
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Fri, 3 Jul 2020 09:41:05 +0800
In-Reply-To: <20200702144625.2533530-17-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
 <20200702144625.2533530-17-lee.jones@linaro.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6C16EDA848D1FBDB58785863678FD0E8CB02C388F192B15DB8BCAD8D1E917B032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_214255_388452_F1916D1D 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIwLTA3LTAyIGF0IDE1OjQ2ICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6DQo+IEZp
eGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nczoNCj4gDQo+ICBkcml2
ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuYzoxMzo2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmG10dTNfZGJnX3RyYWNl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10NCj4g
IDEzIHwgdm9pZCBtdHUzX2RiZ190cmFjZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIg
KmZtdCwgLi4uKQ0KPiAgfCBefn5+fn5+fn5+fn5+fg0KVGhlIGRlc2NyaXB0aW9uIGRvZXNuJ3Qg
bWF0Y2ggd2l0aCB0aGUgdGl0bGUgYW5kIGNvZGUgY2hhbmdlcw0KDQo+IA0KPiBDYzogQ2h1bmZl
bmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KPiBDYzogbGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL210dTMvbXR1M190cmFjZS5jIHwg
MiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvbXR1My9tdHUzX3RyYWNlLmMgYi9kcml2ZXJz
L3VzYi9tdHUzL210dTNfdHJhY2UuYw0KPiBpbmRleCA0ZjVlNzg1N2VjMzEyLi4xNTVlYWUxMjZl
NWUyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuYw0KPiArKysg
Yi9kcml2ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuYw0KPiBAQCAtMSw1ICsxLDUgQEANCj4gIC8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+IC0vKioNCj4gKy8qDQo+ICAgKiBt
dHUzX3RyYWNlLmMgLSB0cmFjZSBzdXBwb3J0DQo+ICAgKg0KPiAgICogQ29weXJpZ2h0IChDKSAy
MDE5IE1lZGlhVGVrIEluYy4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
