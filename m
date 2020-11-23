Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41FCC388F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 21:07:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A22D206B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 21:07:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tzNs8gkC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRVIARoj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A22D206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/P5g9e9/QNCwbWf22PtgUe2UeBYH259kQyYsgLg0PHs=; b=tzNs8gkCL7hR8Toc3HRyZqjE6
	wTWWGVbSD0O4vUd8I8NydkicKOJT0VLhAZ+RNx6E0FqhPXAlxc8XaqWud844wV50aSmbh4BD24mps
	dTfP+iViNMOOMOCSB7qqneTzfwaqU3N7OH55A3N1wYKAwhntPXKsfuuA8VPYfTobnhpzy5ZJY+W8s
	mE3NKTPm7vLFmqs3ZtXG4vmMlE61ha9xN5eAu58egI5iutTB0WfsFw5bQfn9Odo7AlKweCm6FAWA4
	lWPTQGMhKhkjSmQ7afn8lqmqxjSFjOE8vjmdTM0WojsWqkPrs6h75CJEqOuZaJlcbigKtWBsCgKPm
	E7deXf8ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khJ3A-0001ru-8y; Mon, 23 Nov 2020 21:07:04 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khJ37-0001rV-U7; Mon, 23 Nov 2020 21:07:02 +0000
Received: by mail-ed1-x542.google.com with SMTP id k1so5654210eds.13;
 Mon, 23 Nov 2020 13:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eCKQHOm6yrNlbYBkTUcKRxSyfXODx3SiT7JXRbFTfOs=;
 b=oRVIARoj6Npne1uHahzkvz6Iqk4N8tWjy2k64IeeSHtjUbR4yhzBpFbv+vHgt0pydK
 9vHFoChzqhHamWgIwWS30goFKdlRtHYiIzi9FhBMv79qwtnIgqDTuoqcPjXwclyFJCuD
 adVcwzpdR7pqc+qI6Je3aNEZvgD/H6BSmoa5xKIJ2KUF78k7KB5AtOUvbmLQ47gfb6UX
 3qPJWbGKaAMCmcoM6X96KLdoNG5aTj/6MLIXqILy+m1PrMNwkqfvdSLzWADkQwMPnfCI
 oOGEkFfFtVWerj44JSXV5/mGRVi7VYJ8QZTLcGyQDxeexrO8cLhkU060Wj4OYkP7L+4E
 jUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eCKQHOm6yrNlbYBkTUcKRxSyfXODx3SiT7JXRbFTfOs=;
 b=EGC8OBe+nbeQ/biVCkcYQoeFyJwwVlqVvxNWoD/VLLbhVu3H57vSiz5OB0z1l7Q32I
 IZTWMH+G9TiZJI1QSA4yNPqmwgexxNABSAbMcgWdD/H+kV703uV2H+e0AcvHuv/XKBbe
 ep8e/LbtJ5VscFaX+hiZn3dOGJTUFX8PJOtzZTTO01UReanrd0IYJn3zyEMmIyoLmbN6
 Civt52DhZqdYTfB2GMjuLOoYal69HdM5a8FYo48XNXEimJShkX06QXuDnROrT2+Ym/lf
 G8PwViHsJFYUzBSqIlOS/B41R02Cb1CNNxqts0dQtLoCnnfWrPqrYyAPWnSYZ7CJuA83
 AhwQ==
X-Gm-Message-State: AOAM531j29HHlnUD9z0UxxHqTS20obP6x+tLi8zzrJwOcQLsBCgQsXry
 SleEvB7RQVQ8PSsMWIgFWPc=
X-Google-Smtp-Source: ABdhPJzGgxkRXgJEslQ81aBHIfM30EdAKpVjc9uhBXXm+OQBmE34napFZKPTbU4TtGZ1lx+t0iDsrQ==
X-Received: by 2002:a05:6402:1358:: with SMTP id
 y24mr994373edw.291.1606165620724; 
 Mon, 23 Nov 2020 13:07:00 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:7836:e682:dddf:6361?
 ([2a01:110f:b59:fd00:7836:e682:dddf:6361])
 by smtp.gmail.com with ESMTPSA id lz27sm5586999ejb.39.2020.11.23.13.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 13:07:00 -0800 (PST)
Subject: Re: [PATCH v7 1/5] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
To: Gene Chen <gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
 <3164b1ed-9e47-88cd-d492-ff5a9243e5ef@gmail.com>
 <CAE+NS350vuY1qNwn4_7ow8Z22_DfHrJAnKX1dsFM_WbaHziZiw@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5c4a5780-afec-fa7f-307e-b969192ec677@gmail.com>
Date: Mon, 23 Nov 2020 22:06:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS350vuY1qNwn4_7ow8Z22_DfHrJAnKX1dsFM_WbaHziZiw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_160702_013853_391A77F1 
X-CRM114-Status: GOOD (  19.43  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTEvMjMvMjAgNDoyMCBBTSwgR2VuZSBDaGVuIHdyb3RlOgo+IEphY2VrIEFuYXN6ZXdza2kg
PGphY2VrLmFuYXN6ZXdza2lAZ21haWwuY29tPiDmlrwgMjAyMOW5tDEx5pyIMjDml6Ug6YCx5LqU
IOS4iuWNiDY6Mjnlr6vpgZPvvJoKPj4KPj4gSGkgR2VuZSwKPj4KPj4gT24gMTEvMTgvMjAgMTE6
NDcgQU0sIEdlbmUgQ2hlbiB3cm90ZToKPj4+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJp
Y2h0ZWsuY29tPgo+Pj4KPj4+IEFkZCBmbGFzaCByZWdpc3RyYXRpb24gd2l0aCB1bmRlZmluZWQg
Q09ORklHX0xFRFNfQ0xBU1NfRkxBU0gKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPj4+IC0tLQo+Pj4gICAgaW5jbHVkZS9saW51eC9sZWQt
Y2xhc3MtZmxhc2guaCB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9sZWQtY2xhc3MtZmxhc2guaCBiL2luY2x1ZGUvbGludXgvbGVkLWNs
YXNzLWZsYXNoLmgKPj4+IGluZGV4IDIxYTMzNTguLjRmNTZjMjggMTAwNjQ0Cj4+PiAtLS0gYS9p
bmNsdWRlL2xpbnV4L2xlZC1jbGFzcy1mbGFzaC5oCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L2xl
ZC1jbGFzcy1mbGFzaC5oCj4+PiBAQCAtODUsNiArODUsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVj
dCBsZWRfY2xhc3NkZXZfZmxhc2ggKmxjZGV2X3RvX2ZsY2RldigKPj4+ICAgICAgICByZXR1cm4g
Y29udGFpbmVyX29mKGxjZGV2LCBzdHJ1Y3QgbGVkX2NsYXNzZGV2X2ZsYXNoLCBsZWRfY2Rldik7
Cj4+PiAgICB9Cj4+Pgo+Pj4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19MRURTX0NMQVNTX0ZMQVNI
KQo+Pj4gICAgLyoqCj4+PiAgICAgKiBsZWRfY2xhc3NkZXZfZmxhc2hfcmVnaXN0ZXJfZXh0IC0g
cmVnaXN0ZXIgYSBuZXcgb2JqZWN0IG9mIExFRCBjbGFzcyB3aXRoCj4+PiAgICAgKiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbml0IGRhdGEgYW5kIHdpdGggc3VwcG9ydCBmb3IgZmxh
c2ggTEVEcwo+Pj4gQEAgLTEyNyw2ICsxMjgsNDEgQEAgc3RhdGljIGlubGluZSBpbnQgZGV2bV9s
ZWRfY2xhc3NkZXZfZmxhc2hfcmVnaXN0ZXIoc3RydWN0IGRldmljZSAqcGFyZW50LAo+Pj4gICAg
dm9pZCBkZXZtX2xlZF9jbGFzc2Rldl9mbGFzaF91bnJlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKnBh
cmVudCwKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBs
ZWRfY2xhc3NkZXZfZmxhc2ggKmZsZWRfY2Rldik7Cj4+Pgo+Pj4gKyNlbHNlCj4+PiArCj4+PiAr
c3RhdGljIGlubGluZSBpbnQgbGVkX2NsYXNzZGV2X2ZsYXNoX3JlZ2lzdGVyX2V4dChzdHJ1Y3Qg
ZGV2aWNlICpwYXJlbnQsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGxlZF9jbGFzc2Rldl9mbGFzaCAqZmxlZF9jZGV2LAo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBsZWRfaW5pdF9kYXRhICppbml0X2RhdGEpCj4+PiArewo+
Pj4gKyAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Cj4+IHMvLUVJTlZBTC8wLwo+Pgo+PiBUaGUgZ29h
bCBoZXJlIGlzIHRvIGFzc3VyZSB0aGF0IGNsaWVudCB3aWxsIG5vdCBmYWlsIHdoZW4gdXNpbmcg
bm8tb3AuCj4+Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBpbmxpbmUgaW50IGxlZF9jbGFzc2Rl
dl9mbGFzaF9yZWdpc3RlcihzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsCj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBsZWRfY2xhc3NkZXZfZmxhc2ggKmZs
ZWRfY2RldikKPj4+ICt7Cj4+PiArICAgICByZXR1cm4gbGVkX2NsYXNzZGV2X2ZsYXNoX3JlZ2lz
dGVyX2V4dChwYXJlbnQsIGZsZWRfY2RldiwgTlVMTCk7Cj4+PiArfQo+Pgo+PiBUaGlzIGZ1bmN0
aW9uIHNob3VsZCBiZSBwbGFjZWQgYWZ0ZXIgI2lmZGVmIGJsb2NrIGJlY2F1c2UgaXRzCj4+IHNo
YXBlIGlzIHRoZSBzYW1lIGZvciBib3RoIGNhc2VzLgo+Pgo+Pj4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBsZWRfY2xhc3NkZXZfZmxhc2hfdW5yZWdpc3RlcihzdHJ1Y3QgbGVkX2NsYXNzZGV2X2ZsYXNo
ICpmbGVkX2NkZXYpIHt9Owo+Pj4gK3N0YXRpYyBpbmxpbmUgaW50IGRldm1fbGVkX2NsYXNzZGV2
X2ZsYXNoX3JlZ2lzdGVyX2V4dChzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsCj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBsZWRfY2xhc3NkZXZfZmxhc2ggKmZsZWRf
Y2RldiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGxlZF9p
bml0X2RhdGEgKmluaXRfZGF0YSkKPj4+ICt7Cj4+PiArICAgICByZXR1cm4gLUVJTlZBTDsKPj4K
Pj4gLy1FSU5WQUwvMC8KPj4KPj4gUGxlYXNlIGRvIHRoZSBzYW1lIGZpeCBpbiBhbGwgbm8tb3Bz
IGluIHRoZSBsZWQtY2xhc3MtbXVsdGljb2xvci5oLAo+PiBhcyB3ZSd2ZSBkaXNjdXNzZWQuCj4+
Cj4gCj4gSSB0aGluayByZXR1cm4gLUVJTlZBTCBpcyBjb3JyZWN0LCBiZWNhdXNlIEkgc2hvdWxk
IHJlZ2lzdGVyIGZsYXNoCj4gbGlnaHQgZGV2aWNlIGlmIEkgZGVmaW5lIEZMRUQgaW4gRFRTIG5v
ZGUuCgpJIGRvbid0IHF1aXRlIGZvbGxvdyB5b3VyIGxvZ2ljIGhlcmUuCgpOby1vcCBmdW5jdGlv
bidzIHB1cnBvc2UgaXMgdG8gc2ltcGxpZnkgdGhlIGNvZGUgb24gdGhlIGNhbGxlcidzIHNpZGUu
ClRoZXJlZm9yZSBpdCBzaG91bGQgcmVwb3J0IHN1Y2Nlc3MuCgpQbGVhc2UgcmV0dXJuIDAgZnJv
bSBpdC4KCi0tIApCZXN0IHJlZ2FyZHMsCkphY2VrIEFuYXN6ZXdza2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
