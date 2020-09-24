Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21B1C4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:11:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B95223772
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:11:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zivk7dPs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="amEBg3Sa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B95223772
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JYm4YnIu01KYSQiwX/j55WUEyhzWL/5aeSQarAqeDAk=; b=Zivk7dPs2J41yjbvYnWQwPAe5
	y7yeyhkJQ3FALI5CnQz6LIrCfADew60gHIQuqQ632bahwdS46yQsBP3DirCTuBZLlwL3O2TZSgGDQ
	Cc9LSH0UUzRFgR/kLaAH/qJopKON0tTAGI213Jqj/V+qlHng6KJ6XxKCLNTSNgEf/WfEdS8uYxt+L
	xsqRRlXNQ5oBou++Fb5fZaz+fnABT2zA/5d8tHo7b6UqGC/87kXbmDULZyblNiZOdd0vsKkNn+StA
	LB6ItJPC4hDHn/Zf9DfaMIfIqyYVtz8ZOh898r4eLfYJTOsn4dOC1oQx5uKiA4BRkTk6NEhENTbPE
	NVDC2jLOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLQ5o-0005ZI-Od; Thu, 24 Sep 2020 12:11:20 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLQ5j-0005XX-KB
 for linux-mediatek@lists.infradead.org; Thu, 24 Sep 2020 12:11:16 +0000
Received: by mail-wm1-x344.google.com with SMTP id e11so6670346wme.0
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 05:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TiwIu7mMni6DjsCfBHchRdA5CVaKLnFCdFVAp2ZYt6o=;
 b=amEBg3SanzowDpC8L92uFg1ii7jV8LSSaNhWsKDtzwGtMovPxnbrJScIct8Zbyhr2j
 kVBzfZ1zinNcK2dFmMHRf/ZxGy8tk+l35+9s3Uee/2IBwq4maZ23K/xb0ucg2z+iF60D
 VghPJMbTFUiJD+BIm7Nv3yVp2i7LNIpCLXwubebZovuHDOf2Acf+yDInfa4mWBU33TE5
 7fC3orT+PJq01qgwR5RkcyWUqfyOYcRFBM/qaGrU+CbDHlXhbBPIRFnaT/k5g/pkYtxF
 eXrzgC4Id9nqF9Ru+y4M0nZkR/y2/OVG2b0BDLmj6kIxX1AUlejcBHQ2SQjR0CT1z60c
 KInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TiwIu7mMni6DjsCfBHchRdA5CVaKLnFCdFVAp2ZYt6o=;
 b=PiwsiQvF7ZvuKKmh2aYEau1fRHNAaG/oT7mEsChjhwQ/gUkYDzy9cW6I4VrzdtdI7r
 JZUILZdtAuenRNG5yDWI8qp6H3NogZTt1jSZrVkQwgA/fa1J0DSLXrJkrnhNHM4ijWxa
 gKYluMiAtqtZqxPPGk1UtX1QdC8yXQsYXY6NODO9+DZVO1ckD4WkX/Xcfh+OhjEMJs/y
 KXd6xSJPi/svAqrYAGAmdcare3+LejeHQ1ysSN3n0+7fEbgeDq5oG9upZ1uiqIwBs3QQ
 UEwI7hJEdliHVDWIt5Ir/G2OL3nSERh22XiN9moEp7bq3Bg4wZvDDfUiEqEyipxDXl0I
 7TcQ==
X-Gm-Message-State: AOAM530ByZje6x4KMgLcwBUF7rABUpnL2rJlYRCNuE97nvqdAs+ZtgEh
 B3qYiiF7YQUAp2hhorjU4fSN+1rU/+CC0kRoxlRG0w==
X-Google-Smtp-Source: ABdhPJzqXJqvh9i9Yw6uLQNsbhwEBrflRLruFC3gZHk6n9wh9Uk8sJJvov5IlWMP+9EB36a75P1Ve+qHwO/igHHpvVw=
X-Received: by 2002:a7b:c182:: with SMTP id y2mr4671696wmi.21.1600949474250;
 Thu, 24 Sep 2020 05:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200924040513.31051-1-walter-zh.wu@mediatek.com>
 <CAG_fn=W2dcGKFKHpDXzNvbPUp3USYyWi2DEpEewboqYBodnSsQ@mail.gmail.com>
 <CANpmjNNmeqfMLZ0aFC49fHTYS5k7BqTZHP4FmDc=sfZe+j6bOg@mail.gmail.com>
In-Reply-To: <CANpmjNNmeqfMLZ0aFC49fHTYS5k7BqTZHP4FmDc=sfZe+j6bOg@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 24 Sep 2020 14:11:03 +0200
Message-ID: <CAG_fn=UFnju7qBw2FC8nGxTKQ5VB2QeG-DKik_t=eWzu6p+H6A@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] kasan: print timer and workqueue stack
To: Marco Elver <elver@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_081115_708236_3C66B47B 
X-CRM114-Status: GOOD (  25.29  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Andrey Konovalov <andreyknvl@google.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mediatek@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBTZXAgMjQsIDIwMjAgYXQgMTo1NSBQTSBNYXJjbyBFbHZlciA8ZWx2ZXJAZ29vZ2xl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDI0IFNlcCAyMDIwIGF0IDEzOjQ3LCBBbGV4YW5kZXIg
UG90YXBlbmtvIDxnbGlkZXJAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBTZXAg
MjQsIDIwMjAgYXQgNjowNSBBTSBXYWx0ZXIgV3UgPHdhbHRlci16aC53dUBtZWRpYXRlay5jb20+
IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGUgYXV4X3N0YWNrWzJdIGlzIHJldXNlZCB0byByZWNvcmQg
dGhlIGNhbGxfcmN1KCkgY2FsbCBzdGFjaywKPiA+ID4gdGltZXIgaW5pdCBjYWxsIHN0YWNrLCBh
bmQgZW5xdWV1aW5nIHdvcmsgY2FsbCBzdGFja3MuIFNvIHRoYXQKPiA+ID4gd2UgbmVlZCB0byBj
aGFuZ2UgdGhlIGF1eGlsaWFyeSBzdGFjayB0aXRsZSBmb3IgY29tbW9uIHRpdGxlLAo+ID4gPiBw
cmludCB0aGVtIGluIEtBU0FOIHJlcG9ydC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogV2Fs
dGVyIFd1IDx3YWx0ZXItemgud3VAbWVkaWF0ZWsuY29tPgo+ID4gPiBTdWdnZXN0ZWQtYnk6IE1h
cmNvIEVsdmVyIDxlbHZlckBnb29nbGUuY29tPgo+ID4gPiBBY2tlZC1ieTogTWFyY28gRWx2ZXIg
PGVsdmVyQGdvb2dsZS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBEbWl0cnkgVnl1a292IDxkdnl1
a292QGdvb2dsZS5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRy
ZXlrbnZsQGdvb2dsZS5jb20+Cj4gPiA+IENjOiBBbmRyZXkgUnlhYmluaW4gPGFyeWFiaW5pbkB2
aXJ0dW96em8uY29tPgo+ID4gPiBDYzogQWxleGFuZGVyIFBvdGFwZW5rbyA8Z2xpZGVyQGdvb2ds
ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPgo+ID4gPiB2MjoKPiA+ID4gLSBUaGFua3MgZm9yIE1hcmNv
IHN1Z2dlc3Rpb24uCj4gPiA+IC0gV2UgbW9kaWZ5IGF1eCBzdGFjayB0aXRsZSBuYW1lIGluIEtB
U0FOIHJlcG9ydAo+ID4gPiAgIGluIG9yZGVyIHRvIHByaW50IGNhbGxfcmN1KCkvdGltZXIvd29y
a3F1ZXVlIHN0YWNrLgo+ID4gPgo+ID4gPiAtLS0KPiA+ID4gIG1tL2thc2FuL3JlcG9ydC5jIHwg
NCArKy0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvbW0va2FzYW4vcmVwb3J0LmMgYi9tbS9rYXNh
bi9yZXBvcnQuYwo+ID4gPiBpbmRleCA0ZjQ5ZmE2Y2QxYWEuLjg4NjgwOWQwYThkZCAxMDA2NDQK
PiA+ID4gLS0tIGEvbW0va2FzYW4vcmVwb3J0LmMKPiA+ID4gKysrIGIvbW0va2FzYW4vcmVwb3J0
LmMKPiA+ID4gQEAgLTE4MywxMiArMTgzLDEyIEBAIHN0YXRpYyB2b2lkIGRlc2NyaWJlX29iamVj
dChzdHJ1Y3Qga21lbV9jYWNoZSAqY2FjaGUsIHZvaWQgKm9iamVjdCwKPiA+ID4KPiA+ID4gICNp
ZmRlZiBDT05GSUdfS0FTQU5fR0VORVJJQwo+ID4gPiAgICAgICAgICAgICAgICAgaWYgKGFsbG9j
X2luZm8tPmF1eF9zdGFja1swXSkgewo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICBwcl9l
cnIoIkxhc3QgY2FsbF9yY3UoKTpcbiIpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBw
cl9lcnIoIkxhc3QgcG90ZW50aWFsbHkgcmVsYXRlZCB3b3JrIGNyZWF0aW9uOlxuIik7Cj4gPgo+
ID4gVGhpcyBkb2Vzbid0IGhhdmUgdG8gYmUgYSB3b3JrIGNyZWF0aW9uIChleHBlY3QgbW9yZSBj
YWxsZXJzIG9mCj4gPiBrYXNhbl9yZWNvcmRfYXV4X3N0YWNrKCkgaW4gdGhlIGZ1dHVyZSksIHNv
IG1heWJlIGNoYW5nZSB0aGUgd29yZGluZwo+ID4gaGVyZSB0byAiTGFzdCBwb3RlbnRpYWxseSBy
ZWxhdGVkIGF1eGlsaWFyeSBzdGFjayI/Cj4KPiBJIHN1Z2dlc3RlZCAid29yayBjcmVhdGlvbiIg
YXMgaXQncyB0aGUgbW9zdCBwcmVjaXNlIGZvciB3aGF0IGl0IGlzCj4gdXNlZCBmb3Igbm93LgoK
SSBzZWUsIHRoZW4gbWF5YmUgbXkgc3VnZ2VzdGlvbiBpcyBwcmVtYXR1cmUuCgo+IFdoYXQgb3Ro
ZXIgdXNlcnMgZG8geW91IGhhdmUgaW4gbWluZCBpbiBmdXR1cmUgdGhhdCBhcmUgbm90IHdvcmsg
Y3JlYXRpb24/CgpJIHRoaW5rIHNhdmluZyBzdGFja3MgbWF5IGhlbHAgaW4gYW55IGNhc2Ugd2hl
cmUgYW4gb2JqZWN0IGlzIHJldXNlZApmb3IgYSBkaWZmZXJlbnQgcHVycG9zZSB3aXRob3V0IHJl
YWxsb2NhdGlvbi4KU0tCcywgbWF5YmU/CgoKLS0KQWxleGFuZGVyIFBvdGFwZW5rbwpTb2Z0d2Fy
ZSBFbmdpbmVlcgoKR29vZ2xlIEdlcm1hbnkgR21iSApFcmlrYS1NYW5uLVN0cmHDn2UsIDMzCjgw
NjM2IE3DvG5jaGVuCgpHZXNjaMOkZnRzZsO8aHJlcjogUGF1bCBNYW5pY2xlLCBIYWxpbWFoIERl
TGFpbmUgUHJhZG8KUmVnaXN0ZXJnZXJpY2h0IHVuZCAtbnVtbWVyOiBIYW1idXJnLCBIUkIgODY4
OTEKU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBIYW1idXJnCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
