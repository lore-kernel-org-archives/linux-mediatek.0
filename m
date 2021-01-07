Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE07C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 13:11:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5D2022D01
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 13:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5D2022D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hc8azUt08DCkVFN1BFiGweun5R1+blfn62+i3LQbpCg=; b=b5rNjRD4Su+nvMcomcmH1hidr
	KPi4c7EtHTicGhXmbzGwFlQvi4vSXG7BXlImwdzhQX88ZjutXGVa6GIJ1TVPJEKINPN8FSGu3jkb/
	auJ293ylSSOTF3xHer2zMuS47GrgPS2ZVlorO2GTFVAFegi2aNO9FefQ7k4Hj1D04No3LfeFIKRAS
	gGje7T8JZsFlprcTgZKlMFtTCkkh3T7O6/lbWQdU4DjYHM787CUG5LhVUUQ5pliFgnQKN3mUoZ8Bq
	5qHzYLF4uUjBr6pzmBfdanaOmAvaSblxLsTEWn63GRtl8f1z1ZY7TvtcQP1QOwieYb9mJb/uxyT4u
	915FNIf9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxV43-0000YB-4r; Thu, 07 Jan 2021 13:10:55 +0000
Received: from mail.toke.dk ([45.145.95.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxV3x-0000Fz-0d
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 13:10:53 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1610024910; bh=8yBcqqCmZGf1LeuXCDPXBC4WzK4eLeRC8bvHGxgx/V4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eLt3/bBWv0ZVvbQDuiVkKm5piHVZJ3mAHQ5EB+HNdlUi4QC04I7rVyQhy+4Uz7vHH
 bHhlyHna6jxyUrBgwJtzVKSua3O2G8i9riMF0zXMgB3ouM+a90T9CXwnF/Vcv7q9tp
 qHtuO1+tPOUDeIgz4/20Fif1skolHkEMWfSeakABWjoH6j9FEQZoRTPFi4XlubTWOU
 RsWdyi8P4kmpu3N5s9QyzUthgZ+zApuNwibZJzhSAyuKDBrgeyAUXXQfOSV8+Ltn7+
 AfDwbfPWqd3CrJQ3kFFvufLfCTIrV3MNrh+ZPXU/ZaC3lHBo7452TnSIZkhme5tIZ9
 4uIqBHMlqHFJQ==
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH] mac80211: check ATF flag in ieee80211_next_txq()
In-Reply-To: <1609985461.9743.2.camel@mtkswgap22>
References: <d9aef825d186a91ff91f6a81045d49d375533b14.1609894402.git.ryder.lee@mediatek.com>
 <87r1my49us.fsf@toke.dk> <68ab89bc-70f4-e822-3d96-21ba3bd6511f@nbd.name>
 <87k0sq3wfl.fsf@toke.dk> <1609985461.9743.2.camel@mtkswgap22>
Date: Thu, 07 Jan 2021 14:08:29 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87a6tkki7m.fsf@toke.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_081049_275040_CB627BB7 
X-CRM114-Status: GOOD (  15.79  )
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

UnlkZXIgTGVlIDxyeWRlci5sZWVAbWVkaWF0ZWsuY29tPiB3cml0ZXM6Cgo+IE9uIFdlZCwgMjAy
MS0wMS0wNiBhdCAxNjo0MSArMDEwMCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+
PiBGZWxpeCBGaWV0a2F1IDxuYmRAbmJkLm5hbWU+IHdyaXRlczoKPj4gCj4+ID4gT24gMjAyMS0w
MS0wNiAxMTo1MSwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+PiA+PiBSeWRlciBM
ZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+IHdyaXRlczoKPj4gPj4gCj4+ID4+PiBUaGUgc2Vs
ZWN0ZWQgdHhxIHNob3VsZCBiZSBzY2hlZHVsZWQgdW5jb25kaXRpb25hbGx5IGlmCj4+ID4+PiBO
TDgwMjExX0VYVF9GRUFUVVJFX0FJUlRJTUVfRkFJUk5FU1MgaXMgbm90IHNldCBieSBkcml2ZXIu
Cj4+ID4+Pgo+PiA+Pj4gQWxzbyBwdXQgdGhlIHN0YSB0byB0aGUgZW5kIG9mIHRoZSBhY3RpdmVf
dHhxcyBsaXN0IGlmCj4+ID4+PiBkZWZpY2l0IGlzIG5lZ2F0aXZlIHRoZW4gbW92ZSBvbiB0byB0
aGUgbmV4dCB0eHEuCj4+ID4+IAo+PiA+PiBXaHkgaXMgdGhpcyBuZWVkZWQ/IElmIHRoZSBmZWF0
dXJlIGlzIG5vdCBzZXQsIG5vIGFpcnRpbWUgc2hvdWxkIGV2ZXIgYmUKPj4gPj4gYWNjb3VudGVk
IHRvIHRoZSBzdGF0aW9uLCBhbmQgc28gc3RhLT5haXJ0aW1lW3R4cWktPnR4cS5hY10uZGVmaWNp
dCB3aWxsCj4+ID4+IGFsd2F5cyBiZSAwIC0gc28geW91J3JlIGp1c3QgYWRkaW5nIGFub3RoZXIg
Y2hlY2sgdGhhdCBkb2Vzbid0IGFjdHVhbGx5Cj4+ID4+IGNoYW5nZSB0aGUgYmVoYXZpb3VyLCBh
cmVuJ3QgeW91Pwo+PiA+Cj4+ID4gSSB0aGluayBpdCBtaWdodCBtYWtlIHNlbnNlIHRvIGtlZXAg
YWlydGltZSByZXBvcnRpbmcgZXZlbiB3aGVuIGFpcnRpbWUKPj4gPiBmYWlybmVzcyBpcyBkaXNh
YmxlZCBhdCBydW4gdGltZSwgc28gdGhpcyBwYXRjaCBtYWtlcyBzZW5zZSB0byBtZS4KPj4gPiBJ
bnN0ZWFkIG9mIHRoaXMgcGF0Y2gsIHRoZSByaWdodCBwbGFjZSB0byBkZWFsIHdpdGggdGhpcyB3
b3VsZCBwcm9iYWJseQo+PiA+IGJlIGllZWU4MDIxMV9zdGFfcmVnaXN0ZXJfYWlydGltZS4KPj4g
Cj4+IFdoZW4gdGhlIGZhaXJuZXNzIG1lY2hhbmlzbSBpcyB1c2VyLWRpc2FibGVkIEkgYWdyZWUg
aXQgbWFrZXMgc2Vuc2UgdG8KPj4gc3RpbGwga2VlcCB0aGUgYWNjb3VudGluZzsgYW5kIGluIGZh
Y3QgdGhhdCdzIHdoYXQKPj4gaWVlZTgwMjExX3N0YV9yZWdpc3Rlcl9haXJ0aW1lKCkgYWxyZWFk
eSBkb2VzIHdoZW4gdGhlIGFjY291bnRpbmcgaXMKPj4gdHVybmVkIG9mZiBieSB3YXkgb2YgdGhl
IGFpcnRpbWVfZmxhZ3MgZmllbGQuLi4gU28gZG9uJ3QgdGhpbmsgYW55dGhpbmcKPj4gZWxzZSBp
cyBuZWVkZWQgdGhlcmUgZWl0aGVyPwo+PiAKPj4gLVRva2UKPgo+IE5vdCBzdXJlIEkgZ2V0IHRo
aXMgcmlnaHQuIEFyZSB5b3UgdGFsa2luZyBhYm91dCBsb2NhbC0+YWlydGltZV9mbGFncyA9Cj4g
QUlSVElNRV9VU0VfVFggfCBBSVJUSU1FX1VTRV9SWCA/IEkgdGhpbmsgdGhhdCdzIGRpZmZlcmVu
dCBhbmQgd2Ugc3RpbGwKPiBuZWVkIHRvIHRha2UgTkw4MDIxMV9FWFRfRkVBVFVSRV9BSVJUSU1F
X0ZBSVJORVNTIGludG8gYWNjb3VudCwgcmlnaHQ/CgpJIGp1c3QgbWVhbnQgdGhhdCB3aGF0IEZl
bGl4IHdhcyBhc2tpbmcgZm9yIChhIHdheSAqZm9yIHRoZSB1c2VyKiB0bwpkaXNhYmxlIGFpcnRp
bWUgZmFpcm5lc3Mgd2hpbGUgc3RpbGwgZ2V0dGluZyB0aGUgYWlydGltZSB1c2FnZQphY2NvdW50
ZWQpIGlzIHBvc3NpYmxlIGJ5IHNldHRpbmcgdGhvc2UgZmxhZ3MuIFRoZSBFWFRfRkVBVFVSRSBm
bGFnIGlzCm1lYW50IGFzIGEgd2F5IGZvciB0aGUgZHJpdmVyIHRvIHNpZ25hbCB0byBtYWM4MDIx
MSB0aGF0IGl0IHN1cHBvcnRzCnJlcG9ydGluZyBhaXJ0aW1lIGF0IGFsbDsgc28gaWRlYWxseSBp
dCBzaG91bGQgYmUgYSBmbGFnIHRoYXQgaXMgb25seQpzZXQgb25jZS4KCkdvaW5nIGJhY2sgYW5k
IHJlYWRpbmcgeW91ciBpbml0aWFsIHJlc3BvbnNlIGl0IHNlZW1zIGxpa2UgeW91IG1heSBiZQp0
b2dnbGluZyB0aGUgZmxhZyBkeW5hbWljYWxseSBpbiB0aGUgZHJpdmVyLCB0aG91Z2g/IElzIHRo
aXMgYWNjdXJhdGU/CkFuZCBpZiBzbywgd2h5PyBJcyBpdCBub3QgZW5vdWdoIGZvciB5b3UgdG8g
ZmlkZGxlIHdpdGggdGhlClVTRV9UWC9VU0VfUlggZmxhZ3M/IDopCgotVG9rZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
