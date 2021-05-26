Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A846BC2B9F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:35:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6457A613C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6457A613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:CC:To:From:Subject:Message-ID:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9qIG9Upd1pVs8K3zv0Igd21SqIx1Y7q8lMGTU9X22A=; b=XNLRk7Rns7L2ZY
	+l3hZHH/4aoqCJULPiNBT29F73FclU8HGLd6NBP2T5K6XMX+ReNkpX0HRUuyghlkRN8CjMZx9f9oO
	OwTt+a4dLGGLvg0r03+cHfCxqIhJmgoXdX6yQDgVPRzUHJcOdlWgeF7F1xPa5UsGviddC3bs1SCT7
	RUzvzYprdFDXnx0k6nvVQ9N/Q25oQMSlyXe3cB2YdXcQZ1TZhe+jEHietzwwVCyRlZlQ00NeGYDII
	DF5iTCPIcwkxcVcx2M15xmirNpWU/UfFvO62QVsKzzdOTBJp03hRCzAYEyMHmKlHEI2IUFuRqp7+a
	NEZDtJGE4dE1bPF6jrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lln8G-00Bf7e-4z; Wed, 26 May 2021 06:35:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lln7z-00Bf05-65; Wed, 26 May 2021 06:34:54 +0000
X-UUID: ab2c438fb0514fd8926ff8ab06233608-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=A2lWbDjEYuO5XXptG2fKQLFE2+iVC6CpUYAnqdCBNzo=; 
 b=MpHZDsufl7B60oxFpH2TLD+YC2K87ARNvJt2Y1BkrLUQv/macjubSempAcFfVirrLv2Spido7lAUyQLeNo1/nX9WoS9OD9r6leiHhjOOimWrEeo6kKSiHqglvjNVbotJsoy3w098Y3LcpnVZ7v/qcHguK43cgUHmkD6UPbIFeAY=;
X-UUID: ab2c438fb0514fd8926ff8ab06233608-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 898265996; Tue, 25 May 2021 23:34:41 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 23:34:33 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 May 2021 14:34:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 May 2021 14:34:22 +0800
Message-ID: <1622010863.21671.1.camel@mhfsdcap03>
Subject: Re: [PATCH 0/3] Refine mtk-cmdq-mailbox callback mechanism
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Houlong Wei <houlong.wei@mediatek.com>, "Bibby
 Hsieh" <bibby.hsieh@mediatek.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 26 May 2021 14:34:23 +0800
In-Reply-To: <CAAOTY_9fksAnZc2pqmbHtBiPQgQhX9iX0349K8T9zCG8mH3ZSQ@mail.gmail.com>
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
 <CAAOTY_9fksAnZc2pqmbHtBiPQgQhX9iX0349K8T9zCG8mH3ZSQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 98A81E8371B96EDF55C74FFB14F7F97F2789D73EBB01CE7FB6C19F490DD91A0D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_233451_253439_DC7E977D 
X-CRM114-Status: GOOD (  13.28  )
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

DQpSZXZpZXdlZC1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+
DQoNCk9uIFdlZCwgMjAyMS0wNS0yNiBhdCAxNDoxMyArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90
ZToNCj4gKyBZb25ncWlhbmcuDQo+IA0KPiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2Vy
bmVsLm9yZz4g5pa8IDIwMjHlubQz5pyIMTXml6Ug6YCx5LiAIOS4iuWNiDc6MzPlr6vpgZPvvJoN
Cj4gPg0KPiA+IG10ay1jbWRxLW1haWxib3ggdXNlIHByb3ByaWV0YXJ5IGNhbGxiYWNrIG1lY2hh
bmlzbSBhbmQgcHJvcHJpZXRhcnkNCj4gPiBlcnJvciBudW1iZXIsIGJ1dCB0aGVzZSBjb3VsZCBi
ZSByZXBsYWNlZCBieSBzdGFuZGFyZCBjYWxsYmFjaw0KPiA+IG1lY2hhbmlzbSBhbmQgc3RhbmRh
cmQgZXJyb3IgbnVtYmVyLiBJbiBhZGRpdGlvbiwgdXNlIGNtZHFfcGt0IGFzDQo+ID4gY2FsbGJh
Y2sgZGF0YSB0byBwcmV2ZW50IHJlZHVuZG5hdCBhc3NpZ25tZW50Lg0KPiA+DQo+ID4gQmVjYXVz
ZSBjbGllbnQgZHJpdmVyIHN0aWxsIHVzZSBwcm9wcmlldGFyeSBtZWNoYW5pc20sIHNvIGtlZXAN
Cj4gPiBwcm9wcmlldGFyeSBtZWNoYW5pc20gdW50aWwgY2xpZW50IGRyaXZlciB1c2UgdGhlIHN0
YW5kYXJkIG9uZS4NCj4gPg0KPiA+IENodW4tS3VhbmcgSHUgKDMpOg0KPiA+ICAgbWFpbGJveDog
bXRrLWNtZHE6IFJlbW92ZSBjbWRxX2NiX3N0YXR1cw0KPiA+ICAgbWFpbGJveDogbXRrLWNtZHE6
IFVzZSBtYWlsYm94IHJ4X2NhbGxiYWNrDQo+ID4gICBtYWlsYm94OiBtdGstY21kcTogQWRkIHN0
cnVjdCBjbWRxX3BrdCBpbiBzdHJ1Y3QgY21kcV9jYl9kYXRhDQo+ID4NCj4gPiAgZHJpdmVycy9t
YWlsYm94L210ay1jbWRxLW1haWxib3guYyAgICAgICB8IDI0ICsrKysrKysrKysrKysrKy0tLS0t
LS0tLQ0KPiA+ICBpbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oIHwgIDgg
KystLS0tLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNSBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+IC0tDQo+ID4gMi4xNy4xDQo+ID4NCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
