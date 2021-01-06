Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A42AC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 13:31:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 957D52311A
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 13:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 957D52311A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LblX+Oovw3D27ig5l7CNQbRu0S1fbiawLz4ubUownhI=; b=S3YIHJVCXcvmPF8P87L9kkS2M
	aii8FlQZMH+bE/r3wu2ClgYpfr5pJc+IM0ibGgZlx4Fe0UdblfZRyQNoEBYrPiJcYFDhk9v+KFJLd
	wBE6B9RQ9XsPdT0yht27JSNpYsyZ/pZRneKZV+h+9PJfz9Aw9NKLQO3P53XsNnRSyT0PsElPEsdcm
	XxAEyXa4lwj21K5q6pe9UgSv9uQUL0vfawOx3QLJvF4mufisrWnvkEnjSLLwBdBO7MBh2eUGyznEt
	5LyH6XaddSEewLsb2HlaOnhZLC/AdJYrhOpLvZ+EjZtnvgEOz68HFyeAy48EXfMulLrD7JMJgZg7i
	wT5LtBAoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx8u5-0006vX-TN; Wed, 06 Jan 2021 13:31:09 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx8u0-0006un-Gq
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 13:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kLEk8p56/LKORuReiIiQpbhmzF1RSMKBphSSZjmMIBA=; b=eCykt8EcsLGRa6LPmX7wPupJ1c
 xDOy5ftJkco60H8gAXNGuy0AbMbcTPYJ8oLPDkzkpiSOTXjJRxfKV8TmhtrQ2j4ynEJVVtC9dz+tC
 6VNziLka48UYLWOB5I2biNhUoGKup8LP47QeYd/8Lvb1rMkBcUdXdk4vhI2UD+3NJF0Y=;
Received: from p54ae91f2.dip0.t-ipconnect.de ([84.174.145.242] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1kx8tu-0000EP-Ks; Wed, 06 Jan 2021 14:30:58 +0100
Subject: Re: [PATCH] mac80211: check ATF flag in ieee80211_next_txq()
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 Ryder Lee <ryder.lee@mediatek.com>
References: <d9aef825d186a91ff91f6a81045d49d375533b14.1609894402.git.ryder.lee@mediatek.com>
 <87r1my49us.fsf@toke.dk>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <68ab89bc-70f4-e822-3d96-21ba3bd6511f@nbd.name>
Date: Wed, 6 Jan 2021 14:30:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87r1my49us.fsf@toke.dk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_083105_590518_61B2AA25 
X-CRM114-Status: GOOD (  14.92  )
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

T24gMjAyMS0wMS0wNiAxMTo1MSwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+IFJ5
ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4gd3JpdGVzOgo+IAo+PiBUaGUgc2VsZWN0
ZWQgdHhxIHNob3VsZCBiZSBzY2hlZHVsZWQgdW5jb25kaXRpb25hbGx5IGlmCj4+IE5MODAyMTFf
RVhUX0ZFQVRVUkVfQUlSVElNRV9GQUlSTkVTUyBpcyBub3Qgc2V0IGJ5IGRyaXZlci4KPj4KPj4g
QWxzbyBwdXQgdGhlIHN0YSB0byB0aGUgZW5kIG9mIHRoZSBhY3RpdmVfdHhxcyBsaXN0IGlmCj4+
IGRlZmljaXQgaXMgbmVnYXRpdmUgdGhlbiBtb3ZlIG9uIHRvIHRoZSBuZXh0IHR4cS4KPiAKPiBX
aHkgaXMgdGhpcyBuZWVkZWQ/IElmIHRoZSBmZWF0dXJlIGlzIG5vdCBzZXQsIG5vIGFpcnRpbWUg
c2hvdWxkIGV2ZXIgYmUKPiBhY2NvdW50ZWQgdG8gdGhlIHN0YXRpb24sIGFuZCBzbyBzdGEtPmFp
cnRpbWVbdHhxaS0+dHhxLmFjXS5kZWZpY2l0IHdpbGwKPiBhbHdheXMgYmUgMCAtIHNvIHlvdSdy
ZSBqdXN0IGFkZGluZyBhbm90aGVyIGNoZWNrIHRoYXQgZG9lc24ndCBhY3R1YWxseQo+IGNoYW5n
ZSB0aGUgYmVoYXZpb3VyLCBhcmVuJ3QgeW91PwpJIHRoaW5rIGl0IG1pZ2h0IG1ha2Ugc2Vuc2Ug
dG8ga2VlcCBhaXJ0aW1lIHJlcG9ydGluZyBldmVuIHdoZW4gYWlydGltZQpmYWlybmVzcyBpcyBk
aXNhYmxlZCBhdCBydW4gdGltZSwgc28gdGhpcyBwYXRjaCBtYWtlcyBzZW5zZSB0byBtZS4KSW5z
dGVhZCBvZiB0aGlzIHBhdGNoLCB0aGUgcmlnaHQgcGxhY2UgdG8gZGVhbCB3aXRoIHRoaXMgd291
bGQgcHJvYmFibHkKYmUgaWVlZTgwMjExX3N0YV9yZWdpc3Rlcl9haXJ0aW1lLgoKLSBGZWxpeAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
