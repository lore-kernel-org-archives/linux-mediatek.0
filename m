Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A69C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 03:59:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2479120792
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 03:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tuMNQD9Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qF1jkM1w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2479120792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x5BltkPfBem17gjpCa+tnpinfZemQYRuGRZ+W2TnejU=; b=tuMNQD9QZ1rqImOxzKBmHzX9k
	ww6qPigTBjgNMOsN6GloZ3dbGfumJRCcjGIL8qupdsyLS8h+y6JtZWgUgS0r/NLaOvadtn6R4OYul
	yx0YFQ8eYIeZBCSRdrUPECn8Ir6e8ypP1GwJ1RwNANDV75f4SzWPPQQvdp2H0/L19fdP1mOczEPfl
	YhUWZo5pWHXjuhVL586HyZZbgUN1mN80bgP4wSmHmGC443TB4OEoFBnRvdvRxPQSB25QDzXbELvna
	/o4l7anrwAoaUKBgiB1iydSp3BOF5tZCDeSmOJkiniisnWcs4BoQn1/b2MgEJoH568XdEad+3cq7/
	n5ioTsIQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy5ut-00082Q-0O; Wed, 22 Jul 2020 03:59:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy5uo-00081l-RS; Wed, 22 Jul 2020 03:59:36 +0000
X-UUID: ef411a0c830a48fdacd2212097930c72-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cHPa7miAlaakjsnpeCyU5C6NdjxVAY3sMbtVxzf1Jq4=; 
 b=qF1jkM1w5fsam7ptJmjY97wCYjSLxld9P4dPvsR8ohYzAcWD1utFRHYV7Rhhiz9Mh5hX6caMOpXfEyfxujpg+yIoUnPwxG2dWksvUx22E2N5rlEJkr20i3G02bEGEp4u8F96grhpTGYZzfLNdpTzCic+3GXvIkNZ6mg6zM5u2VM=;
X-UUID: ef411a0c830a48fdacd2212097930c72-20200721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 332732447; Tue, 21 Jul 2020 19:51:13 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 20:49:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 11:49:15 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 11:49:13 +0800
Message-ID: <1595389756.20193.12.camel@mtkswgap22>
Subject: Re: [PATCH v3 2/2] soc: mediatek: add mtk-devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 22 Jul 2020 11:49:16 +0800
In-Reply-To: <CAAOTY_8T=DCntU8x5YEo+Pcs2J0Y4YvDaHUBdGiqEFRxghOd_Q@mail.gmail.com>
References: <1595303971-8793-1-git-send-email-neal.liu@mediatek.com>
 <1595303971-8793-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_8T=DCntU8x5YEo+Pcs2J0Y4YvDaHUBdGiqEFRxghOd_Q@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_235935_185571_1B73371B 
X-CRM114-Status: GOOD (  25.32  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neal Liu <neal.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywNCg0KT24gV2VkLCAyMDIwLTA3LTIyIGF0IDA3OjIxICswODAwLCBDaHVu
LUt1YW5nIEh1IHdyb3RlOg0KPiBIaSwgTmVhbDoNCj4gDQo+IE5lYWwgTGl1IDxuZWFsLmxpdUBt
ZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0N+aciDIx5pelIOmAseS6jCDkuIvljYgxMjowMOWvq+mB
k++8mg0KPiA+DQo+ID4gTWVkaWFUZWsgYnVzIGZhYnJpYyBwcm92aWRlcyBUcnVzdFpvbmUgc2Vj
dXJpdHkgc3VwcG9ydCBhbmQgZGF0YQ0KPiA+IHByb3RlY3Rpb24gdG8gcHJldmVudCBzbGF2ZXMg
ZnJvbSBiZWluZyBhY2Nlc3NlZCBieSB1bmV4cGVjdGVkDQo+ID4gbWFzdGVycy4NCj4gPiBUaGUg
c2VjdXJpdHkgdmlvbGF0aW9uIGlzIGxvZ2dlZCBhbmQgc2VudCB0byB0aGUgcHJvY2Vzc29yIGZv
cg0KPiA+IGZ1cnRoZXIgYW5hbHlzaXMgb3IgY291bnRlcm1lYXN1cmVzLg0KPiA+DQo+ID4gQW55
IG9jY3VycmVuY2Ugb2Ygc2VjdXJpdHkgdmlvbGF0aW9uIHdvdWxkIHJhaXNlIGFuIGludGVycnVw
dCwgYW5kDQo+ID4gaXQgd2lsbCBiZSBoYW5kbGVkIGJ5IG10ay1kZXZhcGMgZHJpdmVyLiBUaGUg
dmlvbGF0aW9uDQo+ID4gaW5mb3JtYXRpb24gaXMgcHJpbnRlZCBpbiBvcmRlciB0byBmaW5kIHRo
ZSBtdXJkZXJlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE5lYWwgTGl1IDxuZWFsLmxpdUBt
ZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+IA0KPiBbc25pcF0NCj4gDQo+ID4gKw0KPiA+ICtzdGF0
aWMgdTMyIGdldF9zaGlmdF9ncm91cChzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0ICpjdHgsIHUz
MiB2aW9faWR4KQ0KPiANCj4gdmlvX2lkeCBpcyB1c2VsZXNzLCBzbyByZW1vdmUgaXQuDQoNCk9r
YXksIEknbGwgcmVtb3ZlIGl0IGluIG5leHQgcGF0Y2guDQoNCj4gDQo+ID4gK3sNCj4gPiArICAg
ICAgIHUzMiB2aW9fc2hpZnRfc3RhOw0KPiA+ICsgICAgICAgdm9pZCBfX2lvbWVtICpyZWc7DQo+
ID4gKw0KPiA+ICsgICAgICAgcmVnID0gY3R4LT5kZXZhcGNfcGRfYmFzZSArIGN0eC0+b2Zmc2V0
LT52aW9fc2hpZnRfc3RhOw0KPiA+ICsgICAgICAgdmlvX3NoaWZ0X3N0YSA9IHJlYWRsKHJlZyk7
DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKHZpb19zaGlmdF9zdGEpDQo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybiBfX2Zmcyh2aW9fc2hpZnRfc3RhKTsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1
cm4gMzE7DQo+ID4gK30NCj4gPiArDQo+IA0KPiBbc25pcF0NCj4gDQo+ID4gKw0KPiA+ICsvKg0K
PiA+ICsgKiBtdGtfZGV2YXBjX2R1bXBfdmlvX2RiZyAtIGdldCB0aGUgdmlvbGF0aW9uIGluZGV4
IGFuZCBkdW1wIHRoZSBmdWxsIHZpb2xhdGlvbg0KPiA+ICsgKiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGRlYnVnIGluZm9ybWF0aW9uLg0KPiA+ICsgKi8NCj4gPiArc3RhdGljIGJvb2wgbXRr
X2RldmFwY19kdW1wX3Zpb19kYmcoc3RydWN0IG10a19kZXZhcGNfY29udGV4dCAqY3R4LCB1MzIg
dmlvX2lkeCkNCj4gPiArew0KPiA+ICsgICAgICAgdTMyIHNoaWZ0X2JpdDsNCj4gPiArDQo+ID4g
KyAgICAgICBpZiAoY2hlY2tfdmlvX21hc2soY3R4LCB2aW9faWR4KSkNCj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuIGZhbHNlOw0KPiA+ICsNCj4gPiArICAgICAgIGlmICghY2hlY2tfdmlvX3N0
YXR1cyhjdHgsIHZpb19pZHgpKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+
ID4gKw0KPiA+ICsgICAgICAgc2hpZnRfYml0ID0gZ2V0X3NoaWZ0X2dyb3VwKGN0eCwgdmlvX2lk
eCk7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKHN5bmNfdmlvX2RiZyhjdHgsIHNoaWZ0X2JpdCkp
DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gPiArDQo+ID4gKyAgICAgICBk
ZXZhcGNfZXh0cmFjdF92aW9fZGJnKGN0eCk7DQo+IA0KPiBJIHRoaW5rIGdldF9zaGlmdF9ncm91
cCgpLCBzeW5jX3Zpb19kYmcoKSwgYW5kDQo+IGRldmFwY19leHRyYWN0X3Zpb19kYmcoKSBzaG91
bGQgYmUgbW92ZWQgb3V0IG9mIHZpb19pZHggZm9yLWxvb3AgKHRoZQ0KPiBsb29wIGluIGRldmFw
Y192aW9sYXRpb25faXJxKCkpIGJlY2F1c2UgdGhlc2UgdGhyZWUgZnVuY3Rpb24gaXMgbm90DQo+
IHJlbGF0ZWQgdG8gdmlvX2lkeC4NCj4gQW5vdGhlciBxdWVzdGlvbjogd2hlbiBtdWx0aXBsZSB2
aW9faWR4IHZpb2xhdGlvbiBvY2N1ciwgdmlvX2FkZHIgaXMNCj4gcmVsYXRlZCB0byB3aGljaCBv
bmUgdmlvX2lkeD8gVGhlIGxhdGVzdCBoYXBwZW5lZCBvbmU/DQo+IA0KDQpBY3R1YWxseSwgaXQn
cyByZWxhdGVkIHRvIHZpb19pZHguIEJ1dCB3ZSBkb24ndCB1c2UgaXQgZGlyZWN0bHkgb24gdGhl
c2UNCmZ1bmN0aW9uLiBJIHRoaW5rIGJlbG93IHNuaXAgY29kZSBtaWdodCBiZSBiZXR0ZXIgd2F5
IHRvIHVuZGVyc3RhbmQgaXQuDQoNCmZvciAoLi4uKQ0Kew0KCWNoZWNrX3Zpb19tYXNrKCkNCglj
aGVja192aW9fc3RhdHVzKCkNCg0KCS8vIGlmIGdldCB2aW9faWR4LCBtYXNrIGl0IHRlbXBvcmFy
aWx5DQoJbWFza19tb2R1bGVfaXJxKHRydWUpDQoJY2xlYXJfdmlvX3N0YXR1cygpDQoNCgkvLyBk
dW1wIHZpb2xhdGlvbiBpbmZvDQoJZ2V0X3NoaWZ0X2dyb3VwKCkNCglzeW5jX3Zpb19kYmcoKQ0K
CWRldmFwY19leHRyYWN0X3Zpb19kYmcoKQ0KDQoJLy8gdW5tYXNrDQoJbWFza19tb2R1bGVfaXJx
KGZhbHNlKQ0KfQ0KDQpBYm91dCB5b3VyIHF1ZXN0aW9uLCB2aW9fYWRkciB3b3VsZCBiZSB0aGUg
Zmlyc3Qgb25lLg0KDQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIHRydWU7DQo+ID4gK30NCj4g
PiArDQo+ID4gKy8qDQo+ID4gKyAqIGRldmFwY192aW9sYXRpb25faXJxIC0gdGhlIGRldmFwYyBJ
bnRlcnJ1cHQgU2VydmljZSBSb3V0aW5lIChJU1IpIHdpbGwgZHVtcA0KPiA+ICsgKiAgICAgICAg
ICAgICAgICAgICAgICAgIHZpb2xhdGlvbiBpbmZvcm1hdGlvbiBpbmNsdWRpbmcgd2hpY2ggbWFz
dGVyIHZpb2xhdGVzDQo+ID4gKyAqICAgICAgICAgICAgICAgICAgICAgICAgYWNjZXNzIHNsYXZl
Lg0KPiA+ICsgKi8NCj4gPiArc3RhdGljIGlycXJldHVybl90IGRldmFwY192aW9sYXRpb25faXJx
KGludCBpcnFfbnVtYmVyLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0ICpjdHgpDQo+ID4gK3sNCj4gPiArICAgICAg
IHUzMiB2aW9faWR4Ow0KPiA+ICsNCj4gPiArICAgICAgIGZvciAodmlvX2lkeCA9IDA7IHZpb19p
ZHggPCBjdHgtPnZpb19pZHhfbnVtOyB2aW9faWR4KyspIHsNCj4gPiArICAgICAgICAgICAgICAg
aWYgKCFtdGtfZGV2YXBjX2R1bXBfdmlvX2RiZyhjdHgsIHZpb19pZHgpKQ0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgLyog
RW5zdXJlIHRoYXQgdmlvbGF0aW9uIGluZm8gYXJlIHdyaXR0ZW4gYmVmb3JlDQo+ID4gKyAgICAg
ICAgICAgICAgICAqIGZ1cnRoZXIgb3BlcmF0aW9ucw0KPiA+ICsgICAgICAgICAgICAgICAgKi8N
Cj4gPiArICAgICAgICAgICAgICAgc21wX21iKCk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg
ICAvKg0KPiA+ICsgICAgICAgICAgICAgICAgKiBNYXNrIHNsYXZlJ3MgaXJxIGJlZm9yZSBjbGVh
cmluZyB2aW8gc3RhdHVzLg0KPiA+ICsgICAgICAgICAgICAgICAgKiBNdXN0IGRvIGl0IHRvIGF2
b2lkIG5lc3RlZCBpbnRlcnJ1cHQgYW5kIHByZXZlbnQNCj4gPiArICAgICAgICAgICAgICAgICog
dW5leHBlY3RlZCBiZWhhdmlvci4NCj4gPiArICAgICAgICAgICAgICAgICovDQo+ID4gKyAgICAg
ICAgICAgICAgIG1hc2tfbW9kdWxlX2lycShjdHgsIHZpb19pZHgsIHRydWUpOw0KPiA+ICsNCj4g
PiArICAgICAgICAgICAgICAgY2xlYXJfdmlvX3N0YXR1cyhjdHgsIHZpb19pZHgpOw0KPiA+ICsN
Cj4gPiArICAgICAgICAgICAgICAgbWFza19tb2R1bGVfaXJxKGN0eCwgdmlvX2lkeCwgZmFsc2Up
Ow0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiBJUlFfSEFORExFRDsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiArLyoNCj4gPiArICogc3RhcnRfZGV2YXBjIC0gaW5pdGlhbGl6
ZSBkZXZhcGMgc3RhdHVzIGFuZCBzdGFydCByZWNlaXZpbmcgaW50ZXJydXB0DQo+ID4gKyAqICAg
ICAgICAgICAgICAgIHdoaWxlIGRldmFwYyB2aW9sYXRpb24gaXMgdHJpZ2dlcmVkLg0KPiA+ICsg
Ki8NCj4gPiArc3RhdGljIGludCBzdGFydF9kZXZhcGMoc3RydWN0IG10a19kZXZhcGNfY29udGV4
dCAqY3R4KQ0KPiA+ICt7DQo+ID4gKyAgICAgICB2b2lkIF9faW9tZW0gKnBkX3Zpb19zaGlmdF9z
dGFfcmVnOw0KPiA+ICsgICAgICAgdm9pZCBfX2lvbWVtICpwZF9hcGNfY29uX3JlZzsNCj4gPiAr
ICAgICAgIHUzMiB2aW9fc2hpZnRfc3RhOw0KPiA+ICsgICAgICAgdTMyIHZpb19pZHg7DQo+ID4g
Kw0KPiA+ICsgICAgICAgcGRfYXBjX2Nvbl9yZWcgPSBjdHgtPmRldmFwY19wZF9iYXNlICsgY3R4
LT5vZmZzZXQtPmFwY19jb247DQo+ID4gKyAgICAgICBwZF92aW9fc2hpZnRfc3RhX3JlZyA9IGN0
eC0+ZGV2YXBjX3BkX2Jhc2UgKyBjdHgtPm9mZnNldC0+dmlvX3NoaWZ0X3N0YTsNCj4gPiArICAg
ICAgIGlmICghcGRfYXBjX2Nvbl9yZWcgfHwgIXBkX3Zpb19zaGlmdF9zdGFfcmVnKQ0KPiA+ICsg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKyAgICAgICAvKiBDbGVh
ciBkZXZhcGMgdmlvbGF0aW9uIHN0YXR1cyAqLw0KPiA+ICsgICAgICAgd3JpdGVsKEJJVCgzMSks
IHBkX2FwY19jb25fcmVnKTsNCj4gPiArDQo+ID4gKyAgICAgICAvKiBDbGVhciB2aW9sYXRpb24g
c2hpZnQgc3RhdHVzICovDQo+ID4gKyAgICAgICB2aW9fc2hpZnRfc3RhID0gcmVhZGwocGRfdmlv
X3NoaWZ0X3N0YV9yZWcpOw0KPiA+ICsgICAgICAgaWYgKHZpb19zaGlmdF9zdGEpDQo+ID4gKyAg
ICAgICAgICAgICAgIHdyaXRlbCh2aW9fc2hpZnRfc3RhLCBwZF92aW9fc2hpZnRfc3RhX3JlZyk7
DQo+ID4gKw0KPiA+ICsgICAgICAgLyogQ2xlYXIgc2xhdmUgdmlvbGF0aW9uIHN0YXR1cyAqLw0K
PiA+ICsgICAgICAgZm9yICh2aW9faWR4ID0gMDsgdmlvX2lkeCA8IGN0eC0+dmlvX2lkeF9udW07
IHZpb19pZHgrKykgew0KPiA+ICsgICAgICAgICAgICAgICBjbGVhcl92aW9fc3RhdHVzKGN0eCwg
dmlvX2lkeCk7DQo+ID4gKyAgICAgICAgICAgICAgIG1hc2tfbW9kdWxlX2lycShjdHgsIHZpb19p
ZHgsIGZhbHNlKTsNCj4gPiArICAgICAgIH0NCj4gPiArDQo+IA0KPiBXaHkgZG8geW91IGNsZWFy
IHRoZXNlPyBBZnRlciBwb3dlciBvbiBoYXJkd2FyZSwgSSB0aGluayB0aGVzZQ0KPiByZWdpc3Rl
ciBzdGF0dXMgYXJlIGNvcnJlY3QuIElmIHRoZSBkZWZhdWx0IHZhbHVlIG9mIHRoZXNlIHJlZ2lz
dGVyDQo+IGFyZSBub3QgY29ycmVjdCwgYWRkIGEgY29tbWVudCBmb3IgdGhpcy4NCj4gDQoNClRo
ZSByZWdpc3RlciBkZWZhdWx0IHZhbHVlIHdvdWxkIGJlIGNvcnJlY3QgYWZ0ZXIgcG93ZXIgb24u
DQpCdXQgdGhlcmUgYXJlIG1hbnkgdGhpbmdzIGhhdmUgdG8gZG8gYmVmb3JlIGtlcm5lbCBkcml2
ZXIgcHJvYmUuDQpEdXJpbmcgdGhhdCB0aW1lLCBkZXZhcGMgcmVnaXN0ZXIgc3RhdHVzIG1pZ2h0
IGJlIGNoYW5nZWQuIEJ1dCB3ZSBhcmUNCmZvY3VzaW5nIG9uIGhhbmRsaW5nIHZpb2xhdGlvbiBh
ZnRlciBkcml2ZXIgcHJvYmUgaW5zdGVhZC4NClNvIGNsZWFyaW5nIGFsbCByZWcgc3RhdHVzIHRv
IG1ha2UgaXQgYXMgaW5pdGlhbCBzdGF0ZS4NCg0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0K
PiANCj4gPiArICAgICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
