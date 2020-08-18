Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABC3C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 02:51:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 882862075E
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 02:51:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y2404ezn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HG8DOknO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 882862075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=34mJ3dKWJ8Dr9m6x1pwXsAGPAAtYh27MAJyNI9MB5dQ=; b=Y2404ezngLUQ670OWg9lB+jUM
	IdctC7JbnGw6mq6p0TCxljZ6o9BY1qDFuicn8eSt8ebI8RPCgQPDzAk7ICr+HWthteCRm3zn4t7IY
	YueF9MXSu3NBeJ0c+rbo6kONVJsncyW8nyIxPBjARFeld96YERhzoqGCAfll8ziM2OmaezR+vlRFd
	rXVUtMK9PAb49aCLA7C1ztbeOOdDahT/tTPTQ2nxo7KkoKYtoEKwD/NBc8fuIMORrnDM47NLaYbmg
	OZhQK0gbiemgdAUsrzk2+TEzcV2X0yKVCIIQRBbsUPyOrvSiQlbzS6zyO+C5pmUKLfqX37wjn01tG
	oEbNkTuTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7rix-0004fc-Vb; Tue, 18 Aug 2020 02:51:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7riu-0004ee-G6; Tue, 18 Aug 2020 02:51:42 +0000
X-UUID: bc7c090c0e124a699e933599c1b726ec-20200817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=j56Gt4pCxYB+XONCMAUzqjSxYqX2Nyr1p1m6xZJHWhg=; 
 b=HG8DOknOg/9IEBIZCA6qhoz7uyKI8NnxMV77LsWEeRI+X8OaxL9Xfx6Y2fwr8oCGxM+EdBxyjU3ekOLm3wPORDfjenWuc3q4WvRMqCQjMX6XWQ/VjoYmEPgYiXwhV1aL/lAbPUR1K9IY5rDa9Vcz2GLJl5390/Sm7Ldx1FmVAWw=;
X-UUID: bc7c090c0e124a699e933599c1b726ec-20200817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1285450346; Mon, 17 Aug 2020 18:51:35 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 19:41:32 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 18 Aug 2020 10:41:25 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Aug 2020 10:41:24 +0800
Message-ID: <1597718492.6381.6.camel@mszsdaap41>
Subject: Re: [PATCH v2] drm/mediatek: dsi: fix scrolling of panel with small
 hfp or hbp
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 18 Aug 2020 10:41:32 +0800
In-Reply-To: <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
References: <20200817130640.18021-1-jitao.shi@mediatek.com>
 <CAAOTY_9ggDUdDD9KoOaWBx3XaK+=Q=5qxahG7SJ5uYBQZ4aadw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B2EDE1793418E9C320064DD32C4D7E50B37FF645537BA7075AAD17680B2B1B742000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_225140_774092_69240CC2 
X-CRM114-Status: GOOD (  22.11  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIwLTA4LTE4IGF0IDA3OjQyICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgSml0YW86DQo+IA0KPiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+IOaW
vCAyMDIw5bm0OOaciDE35pelIOmAseS4gCDkuIvljYg5OjA35a+r6YGT77yaDQo+ID4NCj4gPiBo
b3Jpem9udGFsX2JhY2twb3JjaF9ieXRlIHNob3VsZCBiZSBoYnAgKiBicHAgLSBoYnAgZXh0cmEg
Ynl0ZXMuDQo+ID4gU28gcmVtb3ZlIHRoZSB3cm9uZyBzdWJ0cmFjdGlvbiAxMC4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4NCj4gPiAt
LS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDkgKysrKy0tLS0t
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gPiBpbmRleCAyNzBiZjIyYzk4
ZmUuLjVkMDMxZTYzNDU3MSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
Yw0KPiA+IEBAIC00NzMsMTQgKzQ3MywxMyBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX2NvbmZpZ192
ZG9fdGltaW5nKHN0cnVjdCBtdGtfZHNpICpkc2kpDQo+ID4gICAgICAgICBob3Jpem9udGFsX3N5
bmNfYWN0aXZlX2J5dGUgPSAodm0tPmhzeW5jX2xlbiAqIGRzaV90bXBfYnVmX2JwcCAtIDEwKTsN
Cj4gDQo+IFNvIHRoaXMgc3VidHJhY3Rpb24gMTAgaXMgY29ycmVjdD8NCj4gDQo+IFJlZ2FyZHMs
DQo+IENodW4tS3VhbmcuDQo+IA0KDQpZZXMsIEl0IGlzIHJpZ2h0Lg0KDQpJbiB0aGUgY2VhODYx
IGFuZCBkbXQgc3BlYyB0aGUgbWluaSBoc3luYyBpcyA0MCBwaXhlbHMuDQpTbyB0aGUgdm0tPmhz
eW5jX2xlbiAqIGRzaV90bXBfYnVmX2JwcCA+PSAxMjAgPiAxMA0KDQpCZXN0IFJlZ2FyZHMNCmpp
dGFvDQo+ID4NCj4gPiAgICAgICAgIGlmIChkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RF
X1ZJREVPX1NZTkNfUFVMU0UpDQo+ID4gLSAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3Bv
cmNoX2J5dGUgPQ0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICh2bS0+aGJhY2tfcG9yY2gg
KiBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7DQo+ID4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxf
YmFja3BvcmNoX2J5dGUgPSB2bS0+aGJhY2tfcG9yY2ggKiBkc2lfdG1wX2J1Zl9icHA7DQo+ID4g
ICAgICAgICBlbHNlDQo+ID4gLSAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5
dGUgPSAoKHZtLT5oYmFja19wb3JjaCArIHZtLT5oc3luY19sZW4pICoNCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7DQo+ID4gKyAgICAgICAgICAgICAg
IGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPSAodm0tPmhiYWNrX3BvcmNoICsgdm0tPmhzeW5j
X2xlbikgKg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZHNpX3RtcF9idWZfYnBwOw0KPiA+DQo+ID4gICAgICAgICBkYXRhX3BoeV9jeWNsZXMgPSB0aW1p
bmctPmxweCArIHRpbWluZy0+ZGFfaHNfcHJlcGFyZSArDQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICB0aW1pbmctPmRhX2hzX3plcm8gKyB0aW1pbmctPmRhX2hzX2V4aXQgKyAzOw0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgdGltaW5nLT5kYV9oc196ZXJvICsgdGltaW5nLT5k
YV9oc19leGl0Ow0KPiA+DQo+ID4gICAgICAgICBpZiAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9E
U0lfTU9ERV9WSURFT19CVVJTVCkgew0KPiA+ICAgICAgICAgICAgICAgICBpZiAoKHZtLT5oZnJv
bnRfcG9yY2ggKyB2bS0+aGJhY2tfcG9yY2gpICogZHNpX3RtcF9idWZfYnBwID4NCj4gPiAtLQ0K
PiA+IDIuMTIuNQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0DQo+ID4gTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
