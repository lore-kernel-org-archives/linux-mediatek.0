Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11E9C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 03:05:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F9BB206C0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 03:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZsqQSfWc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sI9UiaMF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F9BB206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nzjV6mLjTYr9k6lwgFRziZDBn0zlSDebO7GyrFoEX9M=; b=ZsqQSfWcIKkBrnryp74Qh/6Xd
	HvrVB9H7pbjc+UTyfK9MgPxn1IH0QAC0xOIBG80WevCibJNgTYLkjI5+irjjJJ6p4gotZQvcdIhP9
	Vlw2Y9b+mTLMryHYVdDeIYIjWeobe+S6XKaKe4uIpVvnp8FLr+zOhw46+Yq6i2QiESOGozEhcyqPR
	V7kUvEMfPOYmqnrguxpTz5246OvNwCPq6v60HqYQOXVjyuqs0E5aOhVa3x38wPiBBbQ47cq7/yWac
	DgOM2qUXIjfG7XxKENRzPchWUhYjqjsvYVBrnj+Yi9rQ9vADC0QM0hDqFz67l9TerldQHn0fB2pK4
	p+qDFLw3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDJ5j-0005e9-IG; Wed, 02 Sep 2020 03:05:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDJ5c-0005d5-F1; Wed, 02 Sep 2020 03:05:39 +0000
X-UUID: fef633b4728442bd8320be9ecd8b45db-20200901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jfIIm6tENvdGpct6biW2eJvqIKrDoiDyyQ/L8G7febQ=; 
 b=sI9UiaMFAQPk/hDkzx6OoBhhmTyvH3FkyKIfJlhYYx0raHtlUOHOHSE1avsyeK2uxM9fyGDrnA8gz37fJtT9mIjxNiJ+wm0HOCRnNO0+okMvZaB7y0+zP70sgwAnfb4GndH5e3b4Uid+a8g1GmORs3g8DsIbKvJ49921yPxRKno=;
X-UUID: fef633b4728442bd8320be9ecd8b45db-20200901
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1177145889; Tue, 01 Sep 2020 19:05:29 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Sep 2020 20:05:26 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 2 Sep 2020 11:05:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Sep 2020 11:05:24 +0800
Message-ID: <1599015827.30048.22.camel@mhfsdcap03>
Subject: Re: [v4,0/4] introduce TI reset controller for MT8192 SoC
From: Crystal Guo <crystal.guo@mediatek.com>
To: Rob Herring <robh@kernel.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "s-anna@ti.com" <s-anna@ti.com>, "afd@ti.com" <afd@ti.com>
Date: Wed, 2 Sep 2020 11:03:47 +0800
In-Reply-To: <5065a23627a34212aa62df646dbf00ee@mtkmbs05n1.mediatek.inc>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <5065a23627a34212aa62df646dbf00ee@mtkmbs05n1.mediatek.inc>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8812CB25358BC3F220BEE59098E36044C2C506DE8C77D12AA6E5A2061D7E66462000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_230536_635699_E1A27058 
X-CRM114-Status: GOOD (  12.63  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yong
 Liang =?UTF-8?Q?=28=E6=A2=81=E5=8B=87=29?= <Yong.Liang@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgUm9iLCBQaGlsaXBwLCBNYXR0aGlhcyBhbmQgYWxsDQoNCkdlbnRsZSBwaW5nIGZvciB0aGlz
IHBhdGNoIHNldC4NCg0KVGhhbmtzDQpDcnlzdGFsDQoNCj4gDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IENyeXN0YWwgR3VvIFttYWlsdG86Y3J5c3RhbC5ndW9AbWVkaWF0
ZWsuY29tXQ0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAxNywgMjAyMCAxMTowMyBBTQ0KPiBUbzog
cC56YWJlbEBwZW5ndXRyb25peC5kZTsgcm9iaCtkdEBrZXJuZWwub3JnOyBtYXR0aGlhcy5iZ2dA
Z21haWwuY29tDQo+IENjOiBzcnZfaGV1cHN0cmVhbTsgbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgcy1hbm5h
QHRpLmNvbTsgYWZkQHRpLmNvbTsgU2VpeWEgV2FuZyAo546L6L+65ZCbKTsgU3RhbmxleSBDaHUg
KOacseWOn+mZnik7IFlpbmdqb2UgQ2hlbiAo6Zmz6Iux5rSyKTsgRmFuIENoZW4gKOmZs+WHoSk7
IFlvbmcgTGlhbmcgKOaigeWLhykNCj4gU3ViamVjdDogW3Y0LDAvNF0gaW50cm9kdWNlIFRJIHJl
c2V0IGNvbnRyb2xsZXIgZm9yIE1UODE5MiBTb0MNCj4gDQo+IHY0Og0KPiBmaXggdHlwb3Mgb24g
djMgY29tbWl0IG1lc3NhZ2UuDQo+IA0KPiB2MzoNCj4gMS4gcmV2ZXJ0IHYyIGNoYW5nZXMuDQo+
IDIuIGFkZCAncmVzZXQtZHVyYXRpb24tdXMnIHByb3BlcnR5IHRvIGRlY2xhcmUgYSBtaW5pbXVt
IGRlbGF5LCB3aGljaCBuZWVkcyB0byBiZSB3YWl0ZWQgYmV0d2VlbiBhc3NlcnQgYW5kIGRlYXNz
ZXJ0Lg0KPiAzLiBhZGQgJ21lZGlhdGVrLGluZnJhLXJlc2V0JyB0byBjb21wYXRpYmxlLg0KPiAN
Cj4gDQo+IHYyIGNoYW5nZXM6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gv
MTE2OTczNzEvDQo+IDEuIGFkZCAnYXNzZXJ0LWRlYXNzZXJ0LXRvZ2V0aGVyJyBwcm9wZXJ0eSB0
byBpbnRyb2R1Y2UgYSBuZXcgcmVzZXQgaGFuZGxlciwgd2hpY2ggYWxsb3dzIGRldmljZSB0byBk
byBzZXJpYWxpemVkIGFzc2VydCBhbmQgZGVhc3NlcnQgb3BlcmF0aW9ucyBpbiBhIHNpbmdsZSBz
dGVwIGJ5ICdyZXNldCcgbWV0aG9kLg0KPiAyLiBhZGQgJ3VwZGF0ZS1mb3JjZScgcHJvcGVydHkg
dG8gaW50cm9kdWNlIGZvcmNlLXVwZGF0ZSBtZXRob2QsIHdoaWNoIGZvcmNlcyB0aGUgd3JpdGUg
b3BlcmF0aW9uIGluIGNhc2UgdGhlIHJlYWQgYWxyZWFkeSBoYXBwZW5zIHRvIHJldHVybiB0aGUg
Y29ycmVjdCB2YWx1ZS4NCj4gMy4gYWRkICdnZW5lcmljLXJlc2V0JyB0byBjb21wYXRpYmxlDQo+
IA0KPiB2MSBjaGFuZ2VzOg0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEx
NjkwNTIzLw0KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNjkwNTI3Lw0K
PiANCj4gQ3J5c3RhbCBHdW8gKDQpOg0KPiAgIGR0LWJpbmRpbmc6IHJlc2V0LWNvbnRyb2xsZXI6
IHRpOiBhZGQgcmVzZXQtZHVyYXRpb24tdXMgcHJvcGVydHkNCj4gICBkdC1iaW5kaW5nOiByZXNl
dC1jb250cm9sbGVyOiB0aTogYWRkICdtZWRpYXRlayxpbmZyYS1yZXNldCcgdG8NCj4gICAgIGNv
bXBhdGlibGUNCj4gICByZXNldC1jb250cm9sbGVyOiB0aTogaW50cm9kdWNlIGEgbmV3IHJlc2V0
IGhhbmRsZXINCj4gICBhcm02NDogZHRzOiBtdDgxOTI6IGFkZCBpbmZyYWNmZ19yc3Qgbm9kZQ0K
PiANCj4gIC4uLi9iaW5kaW5ncy9yZXNldC90aS1zeXNjb24tcmVzZXQudHh0ICAgICAgICB8ICA2
ICsrKysrDQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpICAgICAg
fCAxMSArKysrKysrLQ0KPiAgZHJpdmVycy9yZXNldC9yZXNldC10aS1zeXNjb24uYyAgICAgICAg
ICAgICAgIHwgMjYgKysrKysrKysrKysrKysrKystLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0MCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gDQo+ICoqKioqKioqKioqKioqKioq
KioqKk1FRElBVEVLIENvbmZpZGVudGlhbC9JbnRlcm5hbCBVc2UqKioqKioqKioqKioqKioqKioq
KioNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
