Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409C1C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 15:41:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47CCE23125
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 15:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47CCE23125
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jDi5fIgFZHC0MsatkhnhQ7bsMzhFuGf0UoOH4ZbwQIM=; b=IX12x0DkyjVMoh1zCphh6EpOy
	NqQX+rqQTnU0+pw+aupCLxGGEaZWrkGc42yU4jQCY8NWnPblvJMY613dR01wkpeQKVAukN+MYzN07
	nd9CBzl1dvIXf+N/qXKSZlQeTVbYgLR8QFZvFuw9PpdkBtY9yix7W7mGLGBsTYE81ZSa4bVwqvkU6
	Tlf0qEDTMSpkkXkjXYePH3X4hOrhIaiCbLCneZXgtLO3l+w3Cb+OqfQMUXhvggfiebqm58hkayGG5
	jleQgkpPgikxQ8s2upmDZNdpj5Dq0f6w/ATCdFSOkKtGNEWlJ2nhVTCwl1Q4H9mCSDDovQGL6c8yL
	9DnTt9JlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxAw5-0002HF-5e; Wed, 06 Jan 2021 15:41:21 +0000
Received: from mail.toke.dk ([45.145.95.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxAw0-0002F4-NP
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 15:41:20 +0000
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1609947662; bh=KDGE0W8yzFBpgLufLewOmSfqW6XhZh/N+JY/uG+SGxs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jchxXj9pRUgpAbrQVb3bTyisE35esffYoIx+XszbaOMk6pmMmPlbFoBJORBNQOdKO
 3EsEMYfioracL3mnHogf/kfdxdDNN9FN1Lb9p6jnZXqV2K9ucPOPayLjD+aBbX4OGr
 SsZ4b8dPFyDQeZSqJZGORG62ZpEoeyHFmBbCMriAKn1iZsMWbP1GAZVxEgFd5F/GkQ
 F0XYEh+PkorUxe0SzEsyURKWLCjHukxsAS/hktOWthvbuFWKid5eFnbUxDYJ93evb9
 p1y423XJkWXo9Zd+fXG40bqz+fkSBS7Sg6/whNqRKkDtk3fIbYrj2wWPXN64+iq4S0
 xeBM+hSgCQ0zQ==
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH] mac80211: check ATF flag in ieee80211_next_txq()
In-Reply-To: <68ab89bc-70f4-e822-3d96-21ba3bd6511f@nbd.name>
References: <d9aef825d186a91ff91f6a81045d49d375533b14.1609894402.git.ryder.lee@mediatek.com>
 <87r1my49us.fsf@toke.dk> <68ab89bc-70f4-e822-3d96-21ba3bd6511f@nbd.name>
Date: Wed, 06 Jan 2021 16:41:02 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87k0sq3wfl.fsf@toke.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_104116_910049_9DFABF17 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, linux-wireless@vger.kernel.org,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RmVsaXggRmlldGthdSA8bmJkQG5iZC5uYW1lPiB3cml0ZXM6Cgo+IE9uIDIwMjEtMDEtMDYgMTE6
NTEsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3cm90ZToKPj4gUnlkZXIgTGVlIDxyeWRlci5s
ZWVAbWVkaWF0ZWsuY29tPiB3cml0ZXM6Cj4+IAo+Pj4gVGhlIHNlbGVjdGVkIHR4cSBzaG91bGQg
YmUgc2NoZWR1bGVkIHVuY29uZGl0aW9uYWxseSBpZgo+Pj4gTkw4MDIxMV9FWFRfRkVBVFVSRV9B
SVJUSU1FX0ZBSVJORVNTIGlzIG5vdCBzZXQgYnkgZHJpdmVyLgo+Pj4KPj4+IEFsc28gcHV0IHRo
ZSBzdGEgdG8gdGhlIGVuZCBvZiB0aGUgYWN0aXZlX3R4cXMgbGlzdCBpZgo+Pj4gZGVmaWNpdCBp
cyBuZWdhdGl2ZSB0aGVuIG1vdmUgb24gdG8gdGhlIG5leHQgdHhxLgo+PiAKPj4gV2h5IGlzIHRo
aXMgbmVlZGVkPyBJZiB0aGUgZmVhdHVyZSBpcyBub3Qgc2V0LCBubyBhaXJ0aW1lIHNob3VsZCBl
dmVyIGJlCj4+IGFjY291bnRlZCB0byB0aGUgc3RhdGlvbiwgYW5kIHNvIHN0YS0+YWlydGltZVt0
eHFpLT50eHEuYWNdLmRlZmljaXQgd2lsbAo+PiBhbHdheXMgYmUgMCAtIHNvIHlvdSdyZSBqdXN0
IGFkZGluZyBhbm90aGVyIGNoZWNrIHRoYXQgZG9lc24ndCBhY3R1YWxseQo+PiBjaGFuZ2UgdGhl
IGJlaGF2aW91ciwgYXJlbid0IHlvdT8KPgo+IEkgdGhpbmsgaXQgbWlnaHQgbWFrZSBzZW5zZSB0
byBrZWVwIGFpcnRpbWUgcmVwb3J0aW5nIGV2ZW4gd2hlbiBhaXJ0aW1lCj4gZmFpcm5lc3MgaXMg
ZGlzYWJsZWQgYXQgcnVuIHRpbWUsIHNvIHRoaXMgcGF0Y2ggbWFrZXMgc2Vuc2UgdG8gbWUuCj4g
SW5zdGVhZCBvZiB0aGlzIHBhdGNoLCB0aGUgcmlnaHQgcGxhY2UgdG8gZGVhbCB3aXRoIHRoaXMg
d291bGQgcHJvYmFibHkKPiBiZSBpZWVlODAyMTFfc3RhX3JlZ2lzdGVyX2FpcnRpbWUuCgpXaGVu
IHRoZSBmYWlybmVzcyBtZWNoYW5pc20gaXMgdXNlci1kaXNhYmxlZCBJIGFncmVlIGl0IG1ha2Vz
IHNlbnNlIHRvCnN0aWxsIGtlZXAgdGhlIGFjY291bnRpbmc7IGFuZCBpbiBmYWN0IHRoYXQncyB3
aGF0CmllZWU4MDIxMV9zdGFfcmVnaXN0ZXJfYWlydGltZSgpIGFscmVhZHkgZG9lcyB3aGVuIHRo
ZSBhY2NvdW50aW5nIGlzCnR1cm5lZCBvZmYgYnkgd2F5IG9mIHRoZSBhaXJ0aW1lX2ZsYWdzIGZp
ZWxkLi4uIFNvIGRvbid0IHRoaW5rIGFueXRoaW5nCmVsc2UgaXMgbmVlZGVkIHRoZXJlIGVpdGhl
cj8KCi1Ub2tlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
