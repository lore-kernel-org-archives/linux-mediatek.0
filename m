Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F791C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 02:21:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 303B422EBF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 02:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 303B422EBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oGRWLP2asM7EEH6zvumW6FMn1OaHD6I9fNmIJpn84jc=; b=b3iN6b/K4JYqQJKKTEd8x0AbJ
	yV4gP/SrZ6LXQMq9RoE65z/VZgsiCE3Ix5bDPZ0T1QSN4kuWTjHfJ1Ovr3PAlQn+aIFkOLdW6vTa0
	5UUJjyxySPTX99XHQ1hozfJ5OtBMsyXwf27o7Ux3KSGu5wQ+foYUpQwfNChcP7uY0YugsLcVKA+MT
	NH8w7CLLzN9mKxijV2I1VYJdfY1HWvz0UKJkDPj4YZ/PoMZkjk3mmKGbBTl9ekuWd4cB80QWS2yz7
	uApgz1iChFUlFKQodt3B4FjvXiK9FiYjAr/YvjdjIPji6MYAdKKQzZhTbdt7lftDZnmQ0VQnstcHJ
	/BCCGJHdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxKvK-0006TS-SF; Thu, 07 Jan 2021 02:21:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxKvG-0006SR-Gd
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 02:21:13 +0000
X-UUID: 22c9c3b8937c48989b4058165425f19a-20210106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=420/pGT6oi1QByXc0WjNI2/geb+r0//1H8JLV8NvGug=; 
 b=s4tlDEXgzv5SgfNwWdGEJJA4g+lIxrSs0tulW9ERkIwM7PL2+RAwAVKT4cskI2A10oaK6Py27LYvj77kYc+g4R9ppKvxAKqvpJ1YhvrbrlelUe3VekVuymXIW6Ph4O4nvgbkL9/GtzFK6xuLzDiTdH1mCQO9j2BIVIO2HOAGS8s=;
X-UUID: 22c9c3b8937c48989b4058165425f19a-20210106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 445811085; Wed, 06 Jan 2021 18:21:04 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 18:11:02 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 10:11:01 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jan 2021 10:11:01 +0800
Message-ID: <1609985461.9743.2.camel@mtkswgap22>
Subject: Re: [PATCH] mac80211: check ATF flag in ieee80211_next_txq()
From: Ryder Lee <ryder.lee@mediatek.com>
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Date: Thu, 7 Jan 2021 10:11:01 +0800
In-Reply-To: <87k0sq3wfl.fsf@toke.dk>
References: <d9aef825d186a91ff91f6a81045d49d375533b14.1609894402.git.ryder.lee@mediatek.com>
 <87r1my49us.fsf@toke.dk> <68ab89bc-70f4-e822-3d96-21ba3bd6511f@nbd.name>
 <87k0sq3wfl.fsf@toke.dk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_212111_363468_EF45349C 
X-CRM114-Status: GOOD (  19.26  )
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

T24gV2VkLCAyMDIxLTAxLTA2IGF0IDE2OjQxICswMTAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6DQo+IEZlbGl4IEZpZXRrYXUgPG5iZEBuYmQubmFtZT4gd3JpdGVzOg0KPiANCj4g
PiBPbiAyMDIxLTAxLTA2IDExOjUxLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6DQo+
ID4+IFJ5ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4gd3JpdGVzOg0KPiA+PiANCj4g
Pj4+IFRoZSBzZWxlY3RlZCB0eHEgc2hvdWxkIGJlIHNjaGVkdWxlZCB1bmNvbmRpdGlvbmFsbHkg
aWYNCj4gPj4+IE5MODAyMTFfRVhUX0ZFQVRVUkVfQUlSVElNRV9GQUlSTkVTUyBpcyBub3Qgc2V0
IGJ5IGRyaXZlci4NCj4gPj4+DQo+ID4+PiBBbHNvIHB1dCB0aGUgc3RhIHRvIHRoZSBlbmQgb2Yg
dGhlIGFjdGl2ZV90eHFzIGxpc3QgaWYNCj4gPj4+IGRlZmljaXQgaXMgbmVnYXRpdmUgdGhlbiBt
b3ZlIG9uIHRvIHRoZSBuZXh0IHR4cS4NCj4gPj4gDQo+ID4+IFdoeSBpcyB0aGlzIG5lZWRlZD8g
SWYgdGhlIGZlYXR1cmUgaXMgbm90IHNldCwgbm8gYWlydGltZSBzaG91bGQgZXZlciBiZQ0KPiA+
PiBhY2NvdW50ZWQgdG8gdGhlIHN0YXRpb24sIGFuZCBzbyBzdGEtPmFpcnRpbWVbdHhxaS0+dHhx
LmFjXS5kZWZpY2l0IHdpbGwNCj4gPj4gYWx3YXlzIGJlIDAgLSBzbyB5b3UncmUganVzdCBhZGRp
bmcgYW5vdGhlciBjaGVjayB0aGF0IGRvZXNuJ3QgYWN0dWFsbHkNCj4gPj4gY2hhbmdlIHRoZSBi
ZWhhdmlvdXIsIGFyZW4ndCB5b3U/DQo+ID4NCj4gPiBJIHRoaW5rIGl0IG1pZ2h0IG1ha2Ugc2Vu
c2UgdG8ga2VlcCBhaXJ0aW1lIHJlcG9ydGluZyBldmVuIHdoZW4gYWlydGltZQ0KPiA+IGZhaXJu
ZXNzIGlzIGRpc2FibGVkIGF0IHJ1biB0aW1lLCBzbyB0aGlzIHBhdGNoIG1ha2VzIHNlbnNlIHRv
IG1lLg0KPiA+IEluc3RlYWQgb2YgdGhpcyBwYXRjaCwgdGhlIHJpZ2h0IHBsYWNlIHRvIGRlYWwg
d2l0aCB0aGlzIHdvdWxkIHByb2JhYmx5DQo+ID4gYmUgaWVlZTgwMjExX3N0YV9yZWdpc3Rlcl9h
aXJ0aW1lLg0KPiANCj4gV2hlbiB0aGUgZmFpcm5lc3MgbWVjaGFuaXNtIGlzIHVzZXItZGlzYWJs
ZWQgSSBhZ3JlZSBpdCBtYWtlcyBzZW5zZSB0bw0KPiBzdGlsbCBrZWVwIHRoZSBhY2NvdW50aW5n
OyBhbmQgaW4gZmFjdCB0aGF0J3Mgd2hhdA0KPiBpZWVlODAyMTFfc3RhX3JlZ2lzdGVyX2FpcnRp
bWUoKSBhbHJlYWR5IGRvZXMgd2hlbiB0aGUgYWNjb3VudGluZyBpcw0KPiB0dXJuZWQgb2ZmIGJ5
IHdheSBvZiB0aGUgYWlydGltZV9mbGFncyBmaWVsZC4uLiBTbyBkb24ndCB0aGluayBhbnl0aGlu
Zw0KPiBlbHNlIGlzIG5lZWRlZCB0aGVyZSBlaXRoZXI/DQo+IA0KPiAtVG9rZQ0KDQpOb3Qgc3Vy
ZSBJIGdldCB0aGlzIHJpZ2h0LiBBcmUgeW91IHRhbGtpbmcgYWJvdXQgbG9jYWwtPmFpcnRpbWVf
ZmxhZ3MgPQ0KQUlSVElNRV9VU0VfVFggfCBBSVJUSU1FX1VTRV9SWCA/IEkgdGhpbmsgdGhhdCdz
IGRpZmZlcmVudCBhbmQgd2Ugc3RpbGwNCm5lZWQgdG8gdGFrZSBOTDgwMjExX0VYVF9GRUFUVVJF
X0FJUlRJTUVfRkFJUk5FU1MgaW50byBhY2NvdW50LCByaWdodD8NCg0KUnlkZXINCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
