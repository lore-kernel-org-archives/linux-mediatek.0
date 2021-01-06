Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0D0C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 11:50:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D4123105
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 11:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D4123105
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2CNzN4SIBL0iOzTVX7OBYH718Oil60PFqShokJrOn7I=; b=Hpv1OlkB+TfIkxeo3kG8HIxwu
	HCIP1sGrNRDC1uJo3MU0fnN6ACrO48nxDYgnSpQ0/n1BxlulgNvWjIb0Ag3Fs61iOUuy+nx0mbhPL
	tfMQHp4as/K5hKG6KKuSFKc0hO0JnrDT7nvWEOjO16P7yfuF3lNoLlugaXNJPh+BfRMHUAJ/Xlzhe
	226nDNPyEnCkkZ7wBj/IF6DeK0QYFVSNgIJSs4IfcKVxdk2QFbWRaTimGPUZH4VzrdmATd/L4c2O+
	/ulQh0F9XaJewisZDggIDUEIxnb2IMvoYkY/vTFJIDMTV8T0tAgYMoGyoksfDtL3B7C4oSnPRyJNN
	FFSnsjqFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx7KW-0002ru-T7; Wed, 06 Jan 2021 11:50:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx7KU-0002rX-Gu
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 11:50:19 +0000
X-UUID: a2dc6d1942594dbe8e30ea7e5954d325-20210106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NihNZqEfwG1aa8bZzu9bqcHanSugnqCQ6/bD5Qvfqxc=; 
 b=toIF0Xsd6o0oYVtTeQi9hD0Y0ZiJPhpC9RvJeMgqtR0YoSRk5gECZ7/TK/EQTRzeHYPyHxLjBD8gGisGdYkbFjKZJGs5EUzHNH2StSLDkQfhA9VeID45Jioa2UhPOX6NWnjnzQCv9kQDNTe41rxinYBJe1ASJzXXbl1BNXNeF5o=;
X-UUID: a2dc6d1942594dbe8e30ea7e5954d325-20210106
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 534212409; Wed, 06 Jan 2021 03:50:14 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 03:50:13 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 19:50:11 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Jan 2021 19:50:11 +0800
Message-ID: <1609933811.10416.1.camel@mtkswgap22>
Subject: Re: [PATCH] mac80211: check ATF flag in ieee80211_next_txq()
From: Ryder Lee <ryder.lee@mediatek.com>
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Date: Wed, 6 Jan 2021 19:50:11 +0800
In-Reply-To: <87r1my49us.fsf@toke.dk>
References: <d9aef825d186a91ff91f6a81045d49d375533b14.1609894402.git.ryder.lee@mediatek.com>
 <87r1my49us.fsf@toke.dk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_065018_789737_4C4696E1 
X-CRM114-Status: GOOD (  12.68  )
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

T24gV2VkLCAyMDIxLTAxLTA2IGF0IDExOjUxICswMTAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6DQo+IFJ5ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4gd3JpdGVzOg0K
PiANCj4gPiBUaGUgc2VsZWN0ZWQgdHhxIHNob3VsZCBiZSBzY2hlZHVsZWQgdW5jb25kaXRpb25h
bGx5IGlmDQo+ID4gTkw4MDIxMV9FWFRfRkVBVFVSRV9BSVJUSU1FX0ZBSVJORVNTIGlzIG5vdCBz
ZXQgYnkgZHJpdmVyLg0KPiA+DQo+ID4gQWxzbyBwdXQgdGhlIHN0YSB0byB0aGUgZW5kIG9mIHRo
ZSBhY3RpdmVfdHhxcyBsaXN0IGlmDQo+ID4gZGVmaWNpdCBpcyBuZWdhdGl2ZSB0aGVuIG1vdmUg
b24gdG8gdGhlIG5leHQgdHhxLg0KPiANCj4gV2h5IGlzIHRoaXMgbmVlZGVkPyBJZiB0aGUgZmVh
dHVyZSBpcyBub3Qgc2V0LCBubyBhaXJ0aW1lIHNob3VsZCBldmVyIGJlDQo+IGFjY291bnRlZCB0
byB0aGUgc3RhdGlvbiwgYW5kIHNvIHN0YS0+YWlydGltZVt0eHFpLT50eHEuYWNdLmRlZmljaXQg
d2lsbA0KPiBhbHdheXMgYmUgMCAtIHNvIHlvdSdyZSBqdXN0IGFkZGluZyBhbm90aGVyIGNoZWNr
IHRoYXQgZG9lc24ndCBhY3R1YWxseQ0KPiBjaGFuZ2UgdGhlIGJlaGF2aW91ciwgYXJlbid0IHlv
dT8NCj4gDQo+IC1Ub2tlDQoNCllvdSdyZSByaWdodC4gSSB0aGluayB0aGUgcHJvYmxlbSBpcyB3
ZSBzdGlsbCBjYWxsDQppZWVlODAyMTFfc3RhX3JlZ2lzdGVyX2FpcnRpbWUoKSBpbiBkcml2ZXIg
ZXZlbiBpZiBmZWF0dXJlIGlzIG5vdCBzZXQsDQphbmQgdGhhdCBtYWtlcyBkZWZpY2l0IDwgMC4g
V2lsbCBmaXggaXQgaW4gZHJpdmVyLg0KDQpSeWRlcg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
