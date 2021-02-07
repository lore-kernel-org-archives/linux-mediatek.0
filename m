Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C290CC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 02:41:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ACE664E3C
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 02:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ACE664E3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vKeNNarBS5KpQSvgjjvIbP/VzTKfG3rdiubQSSjlLKM=; b=2RvKzTR3sLLcq0kjClq3xje/7
	vNioeNBttqFpgY4JFv4wj89xH1JXvYPHdnCAEfFXjmm9KqgZt+8QgZePWBaCSbJ/a1MwH4llpRuDy
	o/owfcj1qinEDgT6KSc3vVwyHkJXTs4BDzzmyqt0onXArN/FfJnWM7uaum7rhWx2NhXAT9tg1q626
	kuCtfsJJgAVvo1b5dcmM+0K+tpyr1pX0xZTOiGWZzIniY0ifdeIPnS1ZO8wqHYJ8YSvq5ihRroQ60
	djgy8LLsoba1r7cC3gtoz40DxBW1/qh43jMtWzlxy6CXshHz2Zg6/aV091YI3emqfxXskLKl7LV1O
	36c9D5sxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8a0x-0007ZW-OK; Sun, 07 Feb 2021 02:41:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8a0u-0007Yf-Ou
 for linux-mediatek@lists.infradead.org; Sun, 07 Feb 2021 02:41:29 +0000
X-UUID: 4c147dba5a7c49208fbf97dd5d205920-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KylhczPDQmJm8aTlE4/r72AkBA70MMaHxDqLsCazpho=; 
 b=HBEVlQL9CDlorHHrIGPjmYLefXyDLfcPVpx2i91F/gvwCKIjBF9/V98x0WkL+MyB6PJYntMpfOmTelFp6HK8HIaMPKBDW8zu0E1/XgTUW283T85fUFuEuyQxteOVgaC02Ea/4S9GMGSUEKIYyDSTQtQ/BPZz3Jo6q+x+0Yxrg90=;
X-UUID: 4c147dba5a7c49208fbf97dd5d205920-20210206
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2134713873; Sat, 06 Feb 2021 18:41:19 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 18:41:17 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 10:41:15 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 7 Feb 2021 10:41:15 +0800
Message-ID: <1612665675.2364.43.camel@mtkswgap22>
Subject: Re: [PATCH] mac80211: only schedule TXQ when reasonable airtime
 reporting
From: Ryder Lee <ryder.lee@mediatek.com>
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Date: Sun, 7 Feb 2021 10:41:15 +0800
In-Reply-To: <878s82ve1c.fsf@toke.dk>
References: <c48c3555ab2261d6b6674ac7de8203359b80b127.1612529311.git.ryder.lee@mediatek.com>
 <878s82ve1c.fsf@toke.dk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E0EB679D95937FD5FF6A6DA529D0893AF452B04BCD6066E3141017E110FB02092000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_214129_028027_0A6B3B94 
X-CRM114-Status: GOOD (  19.58  )
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

T24gRnJpLCAyMDIxLTAyLTA1IGF0IDE0OjI5ICswMTAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6DQo+IFJ5ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4gd3JpdGVzOg0K
PiANCj4gPiBGb3Igc29tZSBkcml2ZXJzIGFuZCBoYXJkd2FyZSBtYXkgcmVwb3J0IGZhdWx0eSBh
aXJ0aW1lLCB3aGljaCBlbmRzIHVwDQo+ID4gd2l0aCBleGNlc3NpdmUgaG9sZCB0aW1lICh+MC45
cyBvbiBtdDc5MTUgbXVsdGljbGVudCB0ZXN0cykgaW1wYWN0aW5nDQo+ID4gc3lzdGVtIHBlcmZv
cm1hbmNlLg0KPiA+DQo+ID4gQWx0aG91Z2ggaXNzdWUgaGFzIGJlZW4gZml4ZWQgaW4gZHJpdmVy
LCBidXQgaXQgbWFrZSBzZW5zZSB0byBzZWxlY3QgdHhxaQ0KPiA+IGRlcGVuZHMgb24gYSByZWFz
b25hYmxlIGFpcnRpbWUgcmVwb3J0aW5nIHRvIHByZXZlbnQgc3VjaCBhIGNhc2UgZnJvbQ0KPiA+
IGhhcHBlbmluZyBhZ2Fpbi4NCj4gDQo+IEkgdGhpbmsgSSBzZWUgd2hhdCB5b3UncmUgdHJ5aW5n
IHRvIGRvIHdpdGggdGhlIHBhdGNoLCBidXQgdGhpcyBjb21taXQNCj4gbWVzc2FnZSBtYWtlcyBu
byBzZW5zZS4gV2hhdCwgZXhhY3RseSwgd2FzIHRoZSBlcnJvciB5b3Ugd2VyZSBzZWVpbmcNCj4g
dGhhdCB0aGlzIGlzIHN1cHBvc2VkIHRvIGZpeD8NCg0KSSB3aWxsIG1ha2UgY29tbWl0IG1lc3Nh
Z2UgbW9yZSBzdHJhaWdodGZvcndhcmQgLSBpZiBhIHN0YXRpb24gdGFrZXMNCmxhcmdlIGFtb3Vu
dCBvZiBhaXJ0aW1lIGFuZCBmYWlscyB0aGUgY2hlY2sgdGhhdCB3aWxsIGtlZXAgZ2V0dGluZw0K
cmVjeWNsZWQgdGhyb3VnaCB0aGUgbGlzdCBhbG9uZyB3aXRoIGV4Y2Vzc2l2ZSBsb2NrIGhvbGQg
dGltZS4gQWRkIHRoaXMNCnBhdGNoIHRvIGF2b2lkIGJyZWFraW5nIGZhaXJuZXNzLg0KDQo+ID4g
VGVzdGVkLWJ5OiBKaWFvIEJvIDxqaWFvLmJhb0BtZWRpYXRlay5jb20+DQo+ID4gVGVzdGVkLWJ5
OiBTdWp1YW4gQ2hlbiA8c3VqdWFuLmNoZW5AbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFJ5ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgbmV0
L21hYzgwMjExL3R4LmMgfCA0ICsrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL25ldC9tYWM4MDIxMS90eC5jIGIvbmV0L21hYzgw
MjExL3R4LmMNCj4gPiBpbmRleCA2NDIyZGE2NjkwZjcuLjBiOGE4YzM2MDBmNCAxMDA2NDQNCj4g
PiAtLS0gYS9uZXQvbWFjODAyMTEvdHguYw0KPiA+ICsrKyBiL25ldC9tYWM4MDIxMS90eC5jDQo+
ID4gQEAgLTM3NzAsNiArMzc3MCwxMCBAQCBzdHJ1Y3QgaWVlZTgwMjExX3R4cSAqaWVlZTgwMjEx
X25leHRfdHhxKHN0cnVjdCBpZWVlODAyMTFfaHcgKmh3LCB1OCBhYykNCj4gPiAgCQkJCXN0YS0+
YWlydGltZV93ZWlnaHQ7DQo+ID4gIA0KPiA+ICAJCWlmIChkZWZpY2l0IDwgMCB8fCAhYXFsX2No
ZWNrKSB7DQo+ID4gKwkJCWlmICh0eHFpLT5zY2hlZHVsZV9yb3VuZCA9PSBsb2NhbC0+c2NoZWR1
bGVfcm91bmRbYWNdKQ0KPiA+ICsJCQkJZ290byBvdXQ7DQo+ID4gKw0KPiA+ICsJCQl0eHFpLT5z
Y2hlZHVsZV9yb3VuZCA9IGxvY2FsLT5zY2hlZHVsZV9yb3VuZFthY107DQo+IA0KPiBJIHRoaW5r
IHRoaXMgY2hhbmdlIG1heSBiZSB3b3J0aCBtYWtpbmcgYW55d2F5LCBidXQgZm9yIGEgZGlmZmVy
ZW50DQo+IHJlYXNvbjogV2l0aG91dCBpdCwgYSBzdGF0aW9uIHRoYXQgZmFpbHMgYXFsX2NoZWNr
IHdpbGwga2VlcCBnZXR0aW5nDQo+IHJlY3ljbGVkIHRocm91Z2ggdGhlIGxpc3QsIGFkdmFuY2lu
ZyBpdHMgZGVmaWNpdC4gV2hpY2ggY291bGQgYWN0dWFsbHkNCj4gYmUgdGhlIHJlYXNvbiBBUUwg
YnJlYWtzIGFpcnRpbWUgZmFpcm5lc3M7IGRpZCB5b3Ugb2JzZXJ2ZSBhbnkNCj4gZGlmZmVyZW5j
ZSBpbiBmYWlybmVzcyB3aXRoIHRoaXMgY2hhbmdlPw0KDQpPdXIgY2FzZSBpczogbXQ3OTE1IHBy
b3ZpZGVzIHBlci1wZWVyIGFpcnRpbWUgY291bnRlcnMuIEhvd2V2ZXIsIHNvbWUgb2YNCnRoZW0g
d2VyZSBub3QgcHJvcGVybHkgY29uZmlndXJlZCwgc28gY2VydGFpbiBzdGF0aW9ucyByZXBvcnRl
ZCBsYXJnZQ0KYW1vdW50IG9mIGFpcnRpbWUgd2hpY2ggbGVkIHRvIGRlZmljaXQgPCAwLCBhbmQg
YXMgeW91IHNhaWQsIGVuZGluZyB1cA0Kd2l0aCByZWN5Y2xlICsgdmVyeSBsb25nZXIgbG9jayBo
b2xkIHRpbWUgKDAuOXMgaW4gb3VyIHRlc3RzKSBhbmQNCmJyZWFraW5nIGZhaXJuZXNzLg0KDQoN
ClJ5ZGVyDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
