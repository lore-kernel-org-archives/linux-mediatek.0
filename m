Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BAAC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 02:06:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52AAC2313E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 02:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52AAC2313E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=miOGxOr9DkbQrDvhMCgMEpjt0Vc2wkoD0HumRqQuQT8=; b=lAKGXRhslVEDv5YxDirf9CLG5
	OHgmtD8j37H9Znly4KbR1S4zezbLJ0wL1k/DMdg1x+F+2cmXrNPBeOgFzdVlB73i+cJO3oH+TALwM
	aGFmBsZYPOKVbKz+US+Txx8Wx9fMzf39VOkQ8hnDoN1xa3SBVLPKBDinPpBH3oR2vsJyvpHwwmHLx
	r1LPdO4RMBF+Hoz5BxGztlRicSb53uoMx49k4YKHmiyzPGWievGaJYjoFuuOA6qInI1DAWRjjplI5
	sn+VS2BoU04ZqOpSUAPkntJfhOKf81yutJYcFvGaTGDDYteW6JDTQglpSVW45yU31H0vwMriEQN4R
	AygfVy9Kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knBLw-0004ud-43; Thu, 10 Dec 2020 02:06:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knBLr-0004tn-NS; Thu, 10 Dec 2020 02:06:41 +0000
X-UUID: 821b3eede4c4468da30fd7b2ee047c81-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EEesHQ/nDLeSCU1U8Vi+Hs8TW6LPtGx+JbBwudhIS4A=; 
 b=bJKchFDxrD5xXER0Xc4WRo7YNKWHN7RZ/i7Sh8c7QiHrEQOBiIv1aBs2uGiTTodQ/cADhYcdpb2mHEOOYxxOsGM+8t0OLbByw+mIFUcua7mco9Fd7juBhViyqF2240cwNu0dsAJWq/Cz8/69tXlknoqCpj5usYHWB5KxJ8EMtmU=;
X-UUID: 821b3eede4c4468da30fd7b2ee047c81-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1516073163; Wed, 09 Dec 2020 18:06:33 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 17:56:30 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Dec 2020 09:56:28 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Dec 2020 09:56:28 +0800
Message-ID: <1607565387.25719.43.camel@mhfsdcap03>
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
From: Qii Wang <qii.wang@mediatek.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Date: Thu, 10 Dec 2020 09:56:27 +0800
In-Reply-To: <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
 <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
 <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
 <1607326431.25719.33.camel@mhfsdcap03>
 <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D5CC06C8C52DF99D9DD1A87BD89711539F70665F1A7AD3104CF2DF15F1E603BC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_210640_171249_7DA1BB5E 
X-CRM114-Status: GOOD (  20.73  )
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
Cc: srv_heupstream@mediatek.com, Wolfram Sang <wsa@the-dreams.de>,
 leilk.liu@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTEyLTA3IGF0IDE4OjM1ICswMjAwLCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90
ZToNCj4gDQo+ID4gDQo+ID4gT24gVGh1LCAyMDIwLTEyLTAzIGF0IDEwOjAxICswMjAwLCBHcnln
b3JpaSBTdHJhc2hrbyB3cm90ZToNCj4gPj4NCj4gPj4gT24gMDMvMTIvMjAyMCAwMzoyNSwgUWlp
IFdhbmcgd3JvdGU6DQo+ID4+PiBPbiBXZWQsIDIwMjAtMTItMDIgYXQgMTY6MzUgKzAxMDAsIFdv
bGZyYW0gU2FuZyB3cm90ZToNCj4gPj4+PiBIaSwNCj4gPj4+Pg0KPiA+Pj4+PiBTb21lIGkyYyBk
ZXZpY2UgZHJpdmVyIGluZGlyZWN0bHkgdXNlcyBJMkMgZHJpdmVyIHdoZW4gaXQgaXMgbm93DQo+
ID4+Pj4+IGJlaW5nIHN1c3BlbmRlZC4gVGhlIGkyYyBkZXZpY2VzIGRyaXZlciBpcyBzdXNwZW5k
ZWQgZHVyaW5nIHRoZQ0KPiA+Pj4+PiBOT0lSUSBwaGFzZSBhbmQgdGhpcyBjYW5ub3QgYmUgY2hh
bmdlZCBkdWUgdG8gb3RoZXIgZGVwZW5kZW5jaWVzLg0KPiA+Pj4+PiBUaGVyZWZvcmUsIHdlIGFs
c28gbmVlZCB0byBtb3ZlIHRoZSBzdXNwZW5kIGhhbmRsaW5nIGZvciB0aGUgSTJDDQo+ID4+Pj4+
IGNvbnRyb2xsZXIgZHJpdmVyIHRvIHRoZSBOT0lSUSBwaGFzZSBhcyB3ZWxsLg0KPiA+Pj4+Pg0K
PiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29tPg0K
PiA+Pj4+DQo+ID4+Pj4gSXMgdGhpcyBhIGJ1Z2ZpeCBhbmQgc2hvdWxkIGdvIGludG8gNS4xMD8g
T3IgY2FuIGl0IHdhaXQgZm9yIDUuMTE/DQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiBZZXMsIENhbiB5
b3UgaGVscCB0byBhcHBseSBpdCBpbnRvIDUuMTA/IFRoYW5rcw0KPiA+Pg0KPiA+PiBUbyBiZSBo
b25lc3QgaWYgeW91IHN0aWxsIGRvIGhhdmUgYW55IGkyYyBkZXZpY2Ugd2hpY2ggYWNjZXNzaW5n
IGkyYyBidXNzIGFmdGVyIF9ub2lycQ0KPiA+PiBzdGFnZSBhbmQgeW91ciBkcml2ZXIgZG9lcyBu
b3QgaW1wbGVtZW50IC5tYXN0ZXJfeGZlcl9hdG9taWMoKSAtIHlvdSBkZWZpbml0ZWx5IGhhdmUg
YSBiaWdnZXIgcHJvYmxlbS4NCj4gPj4gU28gYWRkaW5nIElSUUZfTk9fU1VTUEVORCBzb3VuZCBs
aWtlIGEgaGFjayBhbmQgcHJvYmFibHkgd29ya3MganVzdCBieSBsdWNrLg0KPiA+Pg0KPiA+IA0K
PiA+IEF0IHByZXNlbnQsIGl0IGlzIG9ubHkgYSBwcm9ibGVtIGNhdXNlZCBieSBtaXNzaW5nIGlu
dGVycnVwdHMsDQo+ID4gYW5kIC5tYXN0ZXJfeGZlcl9hdG9taWMoKSBqdXN0IGEgaW1wbGVtZW50
IGluIHBvbGxpbmcgbW9kZS4gV2h5IG5vdCBzZXQNCj4gPiB0aGUgaW50ZXJydXB0IHRvIGEgc3Rh
dGUgdGhhdCBjYW4gYWx3YXlzIGJlIHRyaWdnZXJlZD8NCj4gPiANCj4gPiANCj4gDQo+IEJlY2F1
c2UgeW91IG11c3Qgbm90IHVzZSBhbnkgSVJRIGRyaXZlbiBvcGVyYXRpb25zIGFmdGVyIF9ub2ly
cSBzdXNwZW5kIHN0YXRlIGFzIGl0IG1pZ2h0IChhbmQgbW9zdCBwcm9iYWJseSB3aWxsKQ0KPiBj
YXVzZSB1bnByZWRpY3RhYmxlIGJlaGF2aW9yIGxhdGVyICBpbiBzdXNwZW5kX2VudGVyKCk6DQo+
IA0KPiAJYXJjaF9zdXNwZW5kX2Rpc2FibGVfaXJxcygpOw0KPiAJQlVHX09OKCFpcnFzX2Rpc2Fi
bGVkKCkpOw0KPiBeYWZ0ZXIgdGhpcyBwb2ludCBhbnkgSVJRIGRyaXZlbiBJMkMgdHJhbnNmZXIg
d2lsbCBjYXVzZSBJUlEgdG8gYmUgcmUtZW5hYmxlZA0KPiANCj4gaWYgeW91IG5lZWQgIHR1cm4g
b2ZmIGRldmljZSBmcm9tIHBsYXRmb3JtIGNhbGxiYWNrcyAtICAubWFzdGVyX3hmZXJfYXRvbWlj
KCkgaGFzIHRvIGJlIGltcGxlbWVudGVkIGFuZCB1c2VkLg0KPiAgIA0KTWF5YmUgbXkgY29tbWVu
dCBpcyBhIGJpdCBkaXN0dXJiaW5nLk91ciBwdXJwb3NlIGlzIG5vdCB0byBjYWxsIGkyYyBhbmQN
CnVzZSBpbnRlcnJ1cHRzIGFmdGVyIF9ub2lycSBwYXVzZXMuU28gV2UgdXNlDQppMmNfbWFya19h
ZGFwdGVyX3N1c3BlbmRlZCZpMmNfbWFya19hZGFwdGVyX3Jlc3VtZWQgdG8gYmxvY2sgdGhlc2Ug
aTJjDQp0cmFuc2ZlcnPvvIwgVGhlcmUgd2lsbCBub3QgaGF2ZSBhbnkgSVJRIGRyaXZlbiBJMkMg
dHJhbnNmZXIgYWZ0ZXIgdGhpcw0KcG9pbnQ6DQogICAgICAgIGFyY2hfc3VzcGVuZF9kaXNhYmxl
X2lycXMoKTsNCiAgICAgICAgQlVHX09OKCFpcnFzX2Rpc2FibGVkKCkpOw0KQnV0IHNvbWUgZGV2
aWNlIGRyaXZlciB3aWxsIGRvIGkyYyB0cmFuc2ZlciBhZnRlcg0KZHBtX25vaXJxX3Jlc3VtZV9k
ZXZpY2VzIGluIGRwbV9yZXN1bWVfbm9pcnEoUE1TR19SRVNVTUUpIHdoZW4gb3VyDQpkcml2ZXIg
aXJxIGhhc24ndCByZXN1bWUuDQoJdm9pZCBkcG1fcmVzdW1lX25vaXJxKHBtX21lc3NhZ2VfdCBz
dGF0ZSkNCgl7DQogICAgICAgIAlkcG1fbm9pcnFfcmVzdW1lX2RldmljZXMoc3RhdGUpOw0KICAg
ICAgICAJcmVzdW1lX2RldmljZV9pcnFzKCk7DQogICAgICAgIAlkZXZpY2Vfd2FrZXVwX2Rpc2Fy
bV93YWtlX2lycXMoKTsNCiAgICAgICAgCWNwdWlkbGVfcmVzdW1lKCk7DQoJfQ0KLm1hc3Rlcl94
ZmVyX2F0b21pYygpIHNlZW1zIHRvIGJlIGludmFsaWQgZm9yIHRoaXMgcXVlc3Rpb24gYXQgdGhp
cw0KdGltZT8NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
