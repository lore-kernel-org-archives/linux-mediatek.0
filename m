Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E46C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 14:54:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1BD864E27
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 14:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1BD864E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eQRVS0M+pDxYN4Z2GJnO7Ji5IDNyGVRNYgXdhq9qVKk=; b=yc6IOLG7IgyWyW29mWNooET/s
	0VrrP0yMgL+e8qeV075IzU05IgG6geST9JwH12JI4qiAATgeiWdScR5fP/CxhcX6L4gfAB1oT/fEu
	FZ8ayIRcSNSj+CNAGJjyF3FgA1/Q//ob6ScWmZFkbJOdv1FuJtUJC4GKC9T7a5WWiZ7pvUnp6wBq+
	8ocI0CxxSUUt6vKkbaCDgkpWqZ7Hgg5htbqmvw7bpUiBK2YABzEc+P97PIjzH2+2lLahhz9EBqD75
	BCnsE36uZET7LffNM+CiqqfO9MaGRyeZ4V5zkjtPVaE44lzLJiY6H79iuZ5nhVHvfUTIQDDlGns0h
	ShMtJSttA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l97vU-0001le-4J; Mon, 08 Feb 2021 14:54:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l97vQ-0001kb-S3
 for linux-mediatek@lists.infradead.org; Mon, 08 Feb 2021 14:54:06 +0000
X-UUID: e0c29b3339c749e1b4c5ad2899a03bfa-20210208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=X2CdT3h2aCEflLRIVjhcK/OFaSLMOm98PChkcfUCSBM=; 
 b=hHvQOgXXdmp+EG1ncFJywVbS/t8VZptU6odvOckC/PcTO4C/feWpIb9EFPcKsn6MvnbChf8bqjppMd6kQVcWwxOarx48gaThLHBNNy4uhWuexYmtNJmZq2DZTZoe0qobDf/tD85TzwgRIv1cp5cnBSmRBPw/WZmusIM1qtmiBjQ=;
X-UUID: e0c29b3339c749e1b4c5ad2899a03bfa-20210208
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1408105755; Mon, 08 Feb 2021 06:53:56 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Feb 2021 06:53:55 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Feb 2021 22:53:53 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Feb 2021 22:53:53 +0800
Message-ID: <1612796033.13185.5.camel@mtkswgap22>
Subject: Re: [PATCH] mac80211: only schedule TXQ when reasonable airtime
 reporting
From: Ryder Lee <ryder.lee@mediatek.com>
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Date: Mon, 8 Feb 2021 22:53:53 +0800
In-Reply-To: <1612665675.2364.43.camel@mtkswgap22>
References: <c48c3555ab2261d6b6674ac7de8203359b80b127.1612529311.git.ryder.lee@mediatek.com>
 <878s82ve1c.fsf@toke.dk> <1612665675.2364.43.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0BE62A6312E758FAC2090BBE2C4777B0A1A76458C17EF0742AC248A3F99B8CC42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_095405_692895_24A7845C 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyMDIxLTAyLTA3IGF0IDEwOjQxICswODAwLCBSeWRlciBMZWUgd3JvdGU6DQo+IE9u
IEZyaSwgMjAyMS0wMi0wNSBhdCAxNDoyOSArMDEwMCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu
IHdyb3RlOg0KDQo+ID4gPiBAQCAtMzc3MCw2ICszNzcwLDEwIEBAIHN0cnVjdCBpZWVlODAyMTFf
dHhxICppZWVlODAyMTFfbmV4dF90eHEoc3RydWN0IGllZWU4MDIxMV9odyAqaHcsIHU4IGFjKQ0K
PiA+ID4gIAkJCQlzdGEtPmFpcnRpbWVfd2VpZ2h0Ow0KPiA+ID4gIA0KPiA+ID4gIAkJaWYgKGRl
ZmljaXQgPCAwIHx8ICFhcWxfY2hlY2spIHsNCj4gPiA+ICsJCQlpZiAodHhxaS0+c2NoZWR1bGVf
cm91bmQgPT0gbG9jYWwtPnNjaGVkdWxlX3JvdW5kW2FjXSkNCj4gPiA+ICsJCQkJZ290byBvdXQ7
DQo+ID4gPiArDQo+ID4gPiArCQkJdHhxaS0+c2NoZWR1bGVfcm91bmQgPSBsb2NhbC0+c2NoZWR1
bGVfcm91bmRbYWNdOw0KPiA+IA0KPiA+IEkgdGhpbmsgdGhpcyBjaGFuZ2UgbWF5IGJlIHdvcnRo
IG1ha2luZyBhbnl3YXksIGJ1dCBmb3IgYSBkaWZmZXJlbnQNCj4gPiByZWFzb246IFdpdGhvdXQg
aXQsIGEgc3RhdGlvbiB0aGF0IGZhaWxzIGFxbF9jaGVjayB3aWxsIGtlZXAgZ2V0dGluZw0KPiA+
IHJlY3ljbGVkIHRocm91Z2ggdGhlIGxpc3QsIGFkdmFuY2luZyBpdHMgZGVmaWNpdC4gV2hpY2gg
Y291bGQgYWN0dWFsbHkNCj4gPiBiZSB0aGUgcmVhc29uIEFRTCBicmVha3MgYWlydGltZSBmYWly
bmVzczsgZGlkIHlvdSBvYnNlcnZlIGFueQ0KPiA+IGRpZmZlcmVuY2UgaW4gZmFpcm5lc3Mgd2l0
aCB0aGlzIGNoYW5nZT8NCj4gDQo+IE91ciBjYXNlIGlzOiBtdDc5MTUgcHJvdmlkZXMgcGVyLXBl
ZXIgYWlydGltZSBjb3VudGVycy4gSG93ZXZlciwgc29tZSBvZg0KPiB0aGVtIHdlcmUgbm90IHBy
b3Blcmx5IGNvbmZpZ3VyZWQsIHNvIGNlcnRhaW4gc3RhdGlvbnMgcmVwb3J0ZWQgbGFyZ2UNCj4g
YW1vdW50IG9mIGFpcnRpbWUgd2hpY2ggbGVkIHRvIGRlZmljaXQgPCAwLCBhbmQgYXMgeW91IHNh
aWQsIGVuZGluZyB1cA0KPiB3aXRoIHJlY3ljbGUgKyB2ZXJ5IGxvbmdlciBsb2NrIGhvbGQgdGlt
ZSAoMC45cyBpbiBvdXIgdGVzdHMpIGFuZA0KPiBicmVha2luZyBmYWlybmVzcy4NCj4gDQo+IA0K
Rm91bmQgYSBwcm9ibGVtIHdoZW4gd2UgYXJlIGluIGxvdyB0cmFmZmljIHdpdGggdGhpcyBwYXRj
aC5UaGlzIHdpbGwNCmluY3JlYXNlIGxhdGVuY3kgKGkuZSBwaW5nKQ0KDQoNClNvLCB3ZSBoYXZl
IHRvDQoNCglpZiAoZGVmaWNpdCA8IDAgfHwgIWFxbF9jaGVjaykgew0KCQlpZiAodHhxaS0+c2No
ZWR1bGVfcm91bmQgPT0gbG9jYWwtPnNjaGVkdWxlX3JvdW5kW2FjXSkNCgkJCS8vIHJlLXNjaGVk
dWxlDQoJCQlnb3RvIG91dDsNCgkJCS4uLi4NCgl9DQp9DQoNCmlmICh0eHFpLT5zY2hlZHVsZV9y
b3VuZCA9PSBsb2NhbC0+c2NoZWR1bGVfcm91bmRbYWNdKQ0KCS8vIHJlLXNjaGVkdWxlDQoJZ290
byBvdXQ7DQoNClJ5ZGVyDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
