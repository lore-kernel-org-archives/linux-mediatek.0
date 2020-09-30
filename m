Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB47DC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:23:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53E532075F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h4QS7PVi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oiDx8cqR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VxLi47jx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53E532075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-Reply-To:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=zbptCb+6m9ta5ZqNa/dgKFOaH02L/gCPjljT0rTZv4Y=; b=h4QS7PViH0tRDe+ekdM7wbSj7
	Y3d8mxR8cidOL1XpzyDuzh53/RLivoquqafTk4DNkP8P1fv2SBmaKZBT5rTwj4XR771+S5f1SiJvF
	6uJmmak4WRdRj3tIc0ZlhIqP9tufUpEc64vh4wHoOkRAJeeMmsYRSQWNbk3Qr5P1aZ/CHlMuqvI3R
	XdkHcxAVjQTDL7CmIqjlo0rQD7IIh/x2HVt3eDkVHOL8IQ8dJ0Z8nXsru5vCzVUc6wErPowpCeD2A
	UviM1RaKqFJs9aFXcJw+CO/mZt2O4gGB4NJXHy5yguhjvD0pz5mWN41v9jf/YuJfcD77ZPtc9GyST
	G+Nqf0skw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWSX-0004IV-A5; Wed, 30 Sep 2020 07:23:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWNu-0002Gi-Qx; Wed, 30 Sep 2020 07:18:53 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601450320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=qszLRp610KM1evPqkHZZ4TULFEPMDDCHrKhOHL9Calg=;
 b=oiDx8cqR1gH1cdVjlJen0MXBF5n8GWSksV5LbQFnVNUFTDAVQ5203uT+YL7zNshQD4TQDs
 aKH9y+x9be8PyF3THnjZdJlSsCxeYT3XilhNQoZvmntlzvJy4sKP8nyT2emK+f/Epte8RZ
 0YGtL/lotU0E4Qb6IerdeyKMVrxYslKZxSO3r0ZLAy8drw6mQfXJeZpHILvxAQ/rKNclxh
 rbMHzuHgZTJfKn2Z36yQsU4LCS+4tSkT0BoqLbxHHJMqndM3V+rQmyZt/WU5wIvSZ38aBj
 cSmKdHSyPQOGnVc4mM+MGVEMqCOKdC41fknNGgSVaE09nW5KEDjtPqZmEUdZAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601450320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=qszLRp610KM1evPqkHZZ4TULFEPMDDCHrKhOHL9Calg=;
 b=VxLi47jxjLMA/8KfOfQluB5H9tdiNpLA5xhADYI/Ahx5Yeo3d9xZB/suOR+oCyxtAJYNp3
 kzZ8RbirgaX6ugDA==
To: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v4 1/6] timer: kasan: record timer stack
In-Reply-To: <1601140312.15228.12.camel@mtksdccf07>
Date: Wed, 30 Sep 2020 09:18:40 +0200
Message-ID: <87pn63ivfz.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_031843_833322_10553EE6 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: Marco Elver <elver@google.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Alexander Potapenko <glider@google.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 John Stultz <john.stultz@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

V2FsdGVyLAoKT24gU3VuLCBTZXAgMjcgMjAyMCBhdCAwMToxMSwgV2FsdGVyIFd1IHdyb3RlOgo+
IEZpcnN0LCBJIHRoaW5rIHRoZSBjb21taXQgbG9nIOKAnEJlY2F1c2UgaWYgdGhlIFVBRiByb290
IGNhdXNlIGlzIGluIHRpbWVyCj4gaW5pdCDigKbigJ0gbmVlZHMgdG8gYmUgcmVtb3ZlZCwgdGhp
cyBwYXRjaCBob3BlcyB0byBoZWxwIHByb2dyYW1tZXIgZ2V0cwo+IHRpbWVyIGNhbGxiYWNrIGlz
IHdoZXJlIGlzIHJlZ2lzdGVyZWQuIEl0IGlzIHVzZWZ1bCBvbmx5IGlmIGZyZWUgc3RhY2sKPiBp
cyBjYWxsZWQgZnJvbSB0aW1lciBjYWxsYmFjaywgYmVjYXVzZSBwcm9ncmFtbWVyIGNhbiBzZWUg
d2h5ICYgd2hlcmUKPiByZWdpc3RlciB0aGlzIGZ1bmN0aW9uLgo+Cj4gU2Vjb25kLCBzZWUgWzFd
LCBpdCBzaG91bGQgc2F0aXNmaWVzIGZpcnN0IHBvaW50LiBUaGUgZnJlZSBzdGFjayBpcyBmcm9t
Cj4gdGltZXIgY2FsbGJhY2ssIGlmIHdlIGtub3cgd2hlcmUgcmVnaXN0ZXIgdGhpcyBmdW5jdGlv
biwgdGhlbiBpdCBzaG91bGQKPiBiZSB1c2VmdWwgdG8gc29sdmUgVUFGLgoKTm8uIEl0J3MgY29t
cGxldGVseSB1c2VsZXNzLgoKVGhlIHByb2JsZW0gaGFzIGFic29sdXRlbHkgbm90aGluZyB0byBk
byB3aXRoIHRoZSB0aW1lciBjYWxsYmFjayBhbmQgdGhlCnRpbWVyX2luaXQoKSBpbnZvY2F0aW9u
IHdoaWNoIHNldCB0aGUgdGltZXIncyBjYWxsYmFjayB0byAnZHVtbXlfdGltZXInLgoKVGhlIHRp
bWVyIGNhbGxiYWNrIGhhcHBlbnMgdG8gZnJlZSB0aGUgb2JqZWN0LCBidXQgdGhlIHdvcmtlciB0
aHJlYWQgaGFzCnN0aWxsIGEgcmVmZXJlbmNlIG9mIHNvbWUgc29ydC4KClNvIHRoZSBwcm9ibGVt
IGlzIGVpdGhlciBtaXNzaW5nIHJlZmNvdW50aW5nIHdoaWNoIGFsbG93cyB0aGUgdGltZXIKY2Fs
bGJhY2sgdG8gZnJlZSB0aGUgb2JqZWN0IG9yIHNvbWUgbWlzc2luZyBzZXJpYWxpemF0aW9uLgoK
S25vd2luZyB0aGUgcGxhY2Ugd2hpY2ggaW5pdGlhbGl6ZWQgdGhlIHRpbWVyIGlzIGFic29sdXRl
bHkgbm90IGhlbHBpbmcKdG8gZmlndXJlIG91dCB3aGF0J3MgbWlzc2luZyBoZXJlLgoKQXNpZGUg
b2YgdGhhdCBpdCdzIHRyaXZpYWwgZW5vdWdoIHRvIGRvOgoKICBnaXQgZ3JlcCBkdW1teV90aW1l
ciBkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2R1bW15X2hjZC5jCgppZiB5b3UgcmVhbGx5IHdhbnQg
dG8ga25vdyB3aGF0IGluaXRpYWxpemVkIGl0OgoKIGR1bW15X3RpbWVyKzB4MTI1OC8weDMyYWUg
ZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9kdW1teV9oY2QuYzoxOTY2CiBjYWxsX3RpbWVyX2ZuKzB4
MTk1LzB4NmYwIGtlcm5lbC90aW1lL3RpbWVyLmM6MTQwNAogZXhwaXJlX3RpbWVycyBrZXJuZWwv
dGltZS90aW1lci5jOjE0NDkgW2lubGluZV0KClRoYXQgc2FpZCwgSSdtIGFsbCBmb3IgYWRkaW5n
IHVzZWZ1bCBpbmZvcm1hdGlvbiB0byBLQVNBTiBvciB3aGF0ZXZlcgpyZXBvcnRzLCBidXQgSSdt
IG5vdCBhZ3JlZWluZyB3aXRoIHRoZSBhcHByb2FjaCBvZiAnTGV0J3Mgc3ByaW5rbGUKa2FzYW5f
Zm9vKCkgYWxsIG92ZXIgdGhhIHBsYWNlIGFuZCBjbGFpbSBpdCBpcyB1c2VmdWwgdG8gZGVjb2Rl
IGFuIFVBRicuCkFkZGluZyBpcnJlbGV2YW50IGluZm9ybWF0aW9uIHRvIGEgcmVwb3J0IGlzIGFj
dHVhbGx5IGNvdW50ZXIgcHJvZHVjdGl2ZQpiZWNhdXNlIGl0IG1ha2VzIHBlb3BsZSBsb29rIGF0
IHRoZSB3cm9uZyBwbGFjZS4KCkFnYWluOiBQcm92aWRlIGFuIGFuYWx5c2lzIG9mIHN1Y2ggYSBk
dW1wIHdoZXJlIHRoZSB0aW1lcl9pbml0KCkKZnVuY3Rpb24gaXMgYSBrZXkgZWxlbWVudCBvZiBz
b2x2aW5nIHRoZSBwcm9ibGVtLgoKVGhhbmtzLAoKICAgICAgICB0Z2x4CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
