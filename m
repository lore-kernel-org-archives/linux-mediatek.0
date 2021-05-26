Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DB8C4708A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 883B5613E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 883B5613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:CC:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZ+sRONgOZpduZAWbCpKSNgoi0pK2l7qc7XObyFkPGY=; b=m6uG5cDECM7hjK
	ROeKYuGJ2fBKZ9eUTSX0MUm91OKwtreweZ8uzu49hMMqXP/tS1k+wjYSdzDjQ64iBLjD2W9orUgcn
	bsXeosnOhlDvjAvmOkCXEt86SozKKBStMCzRG2wQhSRhwGlopk/UDqDw1iL+sm83GNp1FLqerU4J1
	G9Q/i+SSvKzNwY0bE9NsJ61xAOZgQNHRnIwa2ZMhVwmuKoBXBiALTL8quzmdVU1yaHb9qXJ//hbkD
	MjgylfESOQHIU0/EtNm3VO1biqSAOT4vCIaei1QsHA7vZqte8W9w4SJvdFppgO+akMILpUv3Qz1W6
	EqY1/DZZ7CfD/MkO4G+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llnOn-00BllY-MV; Wed, 26 May 2021 06:52:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llnOg-00BlhH-Rk; Wed, 26 May 2021 06:52:08 +0000
X-UUID: 60c562fcc5564d5599a581cce9db9da8-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=fOje9OZFiImcE3BGskmjJsEOQQBUQvPVEJpqIvWd+ls=; 
 b=Err0wCOYmEXo4NTlhmaNQpqmjX5kJRvK7uHzR4JNI9poCGiav/KNc/aNJR6WF0VrQTvKk6Bdv7DwSZ2ECDI4dwdSnX8aS/z+hWDXUnLukWWKI1EuV77rodS4pgr023Xiu9HZWnT+2sfVmTjCy+WnO3nd4w2FjsvOCC2Irmx56Ic=;
X-UUID: 60c562fcc5564d5599a581cce9db9da8-20210525
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 542388290; Tue, 25 May 2021 23:52:05 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 23:52:03 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 May 2021 14:51:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 May 2021 14:51:56 +0800
Message-ID: <1622011916.21671.4.camel@mhfsdcap03>
Subject: Re: [PATCH 3/3] mailbox: mtk-cmdq: Add struct cmdq_pkt in struct
 cmdq_cb_data
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, "Bibby
 Hsieh" <bibby.hsieh@mediatek.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Date: Wed, 26 May 2021 14:51:56 +0800
In-Reply-To: <CAAOTY_-L1URHwkiCQv5Z0sF_caWTkU7_2+jw=9DLfCyPyhfT+Q@mail.gmail.com>
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
 <20210314233323.23377-4-chunkuang.hu@kernel.org>
 <CAAOTY_-L1URHwkiCQv5Z0sF_caWTkU7_2+jw=9DLfCyPyhfT+Q@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6ACF487A3AE7F2CF0FFA081C9DE4B9F74EFFCE96870C60AD6FC6483A49FB227C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_235206_934341_A52BB26C 
X-CRM114-Status: GOOD (  16.46  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UmV2aWV3ZWQtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPg0K
DQpPbiBXZWQsIDIwMjEtMDUtMjYgYXQgMTQ6MTggKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6
DQo+ICsgWW9uZ3FpYW5nDQo+IA0KPiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVs
Lm9yZz4g5pa8IDIwMjHlubQz5pyIMTXml6Ug6YCx5LiAIOS4iuWNiDc6MzPlr6vpgZPvvJoNCj4g
Pg0KPiA+IEN1cnJlbnQgY2xpZW50IHVzZSAnc3RydWN0IGNtZHFfcGt0JyBhcyBjYWxsYmFjayBk
YXRhLCBzbw0KPiA+IGNoYW5nZSAndm9pZCAqZGF0YScgdG8gJ3N0cnVjdCBjbWRxX3BrdCAqcGt0
Jy4gS2VlcCBkYXRhDQo+ID4gdW50aWwgY2xpZW50IHVzZSBwa3QgaW5zdGVhZCBvZiBkYXRhLg0K
PiA+DQo+ID4gQ2M6IEphc3NpIEJyYXIgPGphc3Npc2luZ2hicmFyQGdtYWlsLmNvbT4NCj4gPiBD
YzogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4NCj4gPiBDYzogSG91
bG9uZyBXZWkgPGhvdWxvbmcud2VpQG1lZGlhdGVrLmNvbT4NCj4gPiBDYzogQmliYnkgSHNpZWgg
PGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4NCj4gPiBDYzogRGVubmlzIFlDIEhzaWVoIDxkZW5u
aXMteWMuaHNpZWhAbWVkaWF0ZWsuY29tPg0KPiA+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnDQo+ID4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+
IENjOiBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gU2lnbmVkLW9mZi1i
eTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgICAgICAgfCAyICsrDQo+ID4gIGlu
Y2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmggfCAxICsNCj4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jIGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1h
aWxib3guYw0KPiA+IGluZGV4IGVmNTllMjIzNGYyMi4uOTlhOWUwNzg3NTAxIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gPiArKysgYi9kcml2
ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4gQEAgLTE4OCw2ICsxODgsNyBAQCBz
dGF0aWMgdm9pZCBjbWRxX3Rhc2tfZXhlY19kb25lKHN0cnVjdCBjbWRxX3Rhc2sgKnRhc2ssIGlu
dCBzdGEpDQo+ID4gICAgICAgICBXQVJOX09OKGNiLT5jYiA9PSAoY21kcV9hc3luY19mbHVzaF9j
YilOVUxMKTsNCj4gPiAgICAgICAgIGRhdGEuc3RhID0gc3RhOw0KPiA+ICAgICAgICAgZGF0YS5k
YXRhID0gY2ItPmRhdGE7DQo+ID4gKyAgICAgICBkYXRhLnBrdCA9IHRhc2stPnBrdDsNCj4gPiAg
ICAgICAgIGlmIChjYi0+Y2IpDQo+ID4gICAgICAgICAgICAgICAgIGNiLT5jYihkYXRhKTsNCj4g
Pg0KPiA+IEBAIC00NTYsNiArNDU3LDcgQEAgc3RhdGljIGludCBjbWRxX21ib3hfZmx1c2goc3Ry
dWN0IG1ib3hfY2hhbiAqY2hhbiwgdW5zaWduZWQgbG9uZyB0aW1lb3V0KQ0KPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxpc3RfZW50cnkpIHsNCj4gPiAgICAgICAgICAgICAg
ICAgZGF0YS5zdGEgPSAtRUNPTk5BQk9SVEVEOw0KPiA+ICAgICAgICAgICAgICAgICBkYXRhLmRh
dGEgPSBjYi0+ZGF0YTsNCj4gPiArICAgICAgICAgICAgICAgZGF0YS5wa3QgPSB0YXNrLT5wa3Q7
DQo+ID4gICAgICAgICAgICAgICAgIGNiID0gJnRhc2stPnBrdC0+YXN5bmNfY2I7DQo+ID4gICAg
ICAgICAgICAgICAgIGlmIChjYi0+Y2IpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY2It
PmNiKGRhdGEpOw0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNt
ZHEtbWFpbGJveC5oIGIvaW5jbHVkZS9saW51eC9tYWlsYm94L210ay1jbWRxLW1haWxib3guaA0K
PiA+IGluZGV4IDJmN2Q5YTM3ZDYxMS4uNDQzNjVhYWIwNDNjIDEwMDY0NA0KPiA+IC0tLSBhL2lu
Y2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmgNCj4gPiArKysgYi9pbmNsdWRl
L2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oDQo+ID4gQEAgLTY4LDYgKzY4LDcgQEAg
ZW51bSBjbWRxX2NvZGUgew0KPiA+ICBzdHJ1Y3QgY21kcV9jYl9kYXRhIHsNCj4gPiAgICAgICAg
IGludCAgICAgICAgICAgICAgICAgICAgIHN0YTsNCj4gPiAgICAgICAgIHZvaWQgICAgICAgICAg
ICAgICAgICAgICpkYXRhOw0KPiA+ICsgICAgICAgc3RydWN0IGNtZHFfcGt0ICAgICAgICAgKnBr
dDsNCj4gPiAgfTsNCj4gPg0KPiA+ICB0eXBlZGVmIHZvaWQgKCpjbWRxX2FzeW5jX2ZsdXNoX2Ni
KShzdHJ1Y3QgY21kcV9jYl9kYXRhIGRhdGEpOw0KPiA+IC0tDQo+ID4gMi4xNy4xDQo+ID4NCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
