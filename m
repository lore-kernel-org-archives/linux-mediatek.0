Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432FFC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 08:45:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7F5861159
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 08:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7F5861159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nh/coU+laHu6Pf7x2v0mLW17l6Bfd845ui8NiDw4+54=; b=EzQ7Npd39Xmjt/TUCwQOgQwhu
	CMljDm/hj+qd58lIGb0bLUd4EBbD6D1xjZzNssYnNwwO81UToExjYmHESWBp9c6K0tcYiRN6jbvwD
	m3bowP5+sYnYyvu4lumBZd71c6G+o311HMmv7kndy2PkqP+reNh5V+3jLAp1Gt0nxQEW3icWtVRYm
	Qvz1tbkLW//Lz1/L0x2joY0gB13ra90hdSBkTyHWpTkNgOHDMVKcgxGIZvOvpdVNK6EwlsZs+IhRd
	a/0RApo5UpRlKquHtBvLWslBi7HWXTMNvtpG/fXF7R688mC+aL+v/4CLDiV9yzt8cqzDPJwZthZRc
	QbWa3XLQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYPWY-009TxQ-Ho; Mon, 19 Apr 2021 08:44:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPWN-009Tw7-RA
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 08:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=WTUicYn2ZPNcfjliuOy4sPKfu2P1IFAME69ExWOzQFU=; b=ZGIiZqzhYFLl1D/nBJ/raBqbso
 klEJPAU7UvUe1uVn3C4GQOvD90ffeo1YSoJDMxXMYRFJkDxXQajLWaALWp3RhFt9Xn+1qoZwty5hw
 /DXEuPXkWKgZG1h++7AzF541YICX26bI2HnAHryDGUdyL1tojVuImhuanNAupuWJs3IRuotVjwQWt
 Snzr90Pkjd1/vDbHq/5SdrftHpR328j0we+Fy9cVj33L4HaYljwMvwhhMCIcbg2mBiCtjH42hEmRg
 V5ISC2ujDJTd/XCIXOX+ZUW0CZw6gmST5XX6eEOHMBcsxixZ4wxARhiNELmw94Rw07yhtfpPn7wKL
 de8218cg==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPWI-00BCes-50
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 08:44:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id x7so33047665wrw.10
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WTUicYn2ZPNcfjliuOy4sPKfu2P1IFAME69ExWOzQFU=;
 b=zGvLLCwASa/kobu7RHCgl7wBZKFpMqcCJRufnfk8f/6fp+9P+8qO3UhXpogbyPseUW
 g7TwuxKH/3p2IEcg09BPdxnuoY8dGLRIUL0yl2bOjXU1+o3/luQo3sb5mUQhAeLOOq2m
 puZCuv2XIqz+6E6LUTa4+chF5F0jKIzUkQbJWwPG2uUEfb3WuflcJ/vn8MeBxN6PI9n/
 EbP6tBM3ssjvyB7P9sRLvZQADteggAc7XsflDg9tGYnHmtpSJtHBI3cSJCa95JTPYwwp
 69Dr+3EbA1synqCnZSvr7F8oiQGhUmZ8n+6C9HIC0MY4yDk2Xt/5AIKUjV7B6a0dIRXX
 dOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WTUicYn2ZPNcfjliuOy4sPKfu2P1IFAME69ExWOzQFU=;
 b=VxC+f+wj4qc6z3WYa1LnF4oi4wacdy3ChS7go8EKCDoi29MD5+KmAVfXMo0Bl/eDmq
 YhqonXC0AWAgBZPh5W1myHjb+2xdOrUZXGUiz47OOvHb9RoE4wBGxELCttpIb8mRmFCS
 1BhOamXlbEeRhflRnzxJILuFnhuuTFaONAtge5CG9q6ZBPEVZm4H3/qz3GpEz8FiA5Ce
 kBCJNEknBWU3jVdi0EFzjaGTUErlnM5Hb/w8TiEZBrsBAfPzrY7ZA9r5LoimeIh+Kd4R
 eMYdV+qfyRvYVq0F/iJVgoq2lBv+cgQ+HTSmtquhM26qMePrPSxBzHku3637Aa7R/q5x
 2RKQ==
X-Gm-Message-State: AOAM530sBtJdS6+sXazR2yxGOCwqbGaWnSN6BbHoVxyatVLdpAgd2Osg
 /J8UixQ6N3YoQ6e+m65yqgVdVw==
X-Google-Smtp-Source: ABdhPJx5D7lFlk4bYnmVatrdb6C9VwXdtuKYfFdSCdhFeMhpry0kZfvdOfbAYm1RBT/wBm2fQGzjdA==
X-Received: by 2002:a5d:6ace:: with SMTP id u14mr13075902wrw.322.1618821876115; 
 Mon, 19 Apr 2021 01:44:36 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:796f:a096:3809:6fc5?
 ([2a01:e34:ed2f:f020:796f:a096:3809:6fc5])
 by smtp.googlemail.com with ESMTPSA id h5sm3245015wmq.23.2021.04.19.01.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 01:44:35 -0700 (PDT)
Subject: Re: [PATCH] [v4, 1/1] clocksource/drivers/timer-mediatek: optimize
 systimer irq clear flow on shutdown
To: Fengquan Chen <Fengquan.Chen@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: dehui.sun@mediatek.com, Evan Benn <evanbenn@chromium.org>
References: <1617960162-1988-1-git-send-email-Fengquan.Chen@mediatek.com>
 <1617960162-1988-2-git-send-email-Fengquan.Chen@mediatek.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <4d3b342c-a14f-f4ac-6860-9f6a88a24501@linaro.org>
Date: Mon, 19 Apr 2021 10:44:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617960162-1988-2-git-send-email-Fengquan.Chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_014438_218271_FE44F9F6 
X-CRM114-Status: GOOD (  22.51  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDkvMDQvMjAyMSAxMToyMiwgRmVuZ3F1YW4gQ2hlbiB3cm90ZToKPiBtdGtfc3lzdF9jbGtl
dnRfc2h1dGRvd24gaXMgY2FsbGVkIGFmdGVyIGlycSBkaXNhYmxlZCBpbiBzdXNwZW5kIGZsb3cs
Cj4gY2xlYXIgYW55IHBlbmRpbmcgc3lzdGltZXIgaXJxIHdoZW4gc2h1dGRvd24gdG8gYXZvaWQg
c3VzcGVuZCBhYm9ydGVkCj4gZHVlIHRvIHRpbWVyIGlycSBwZW5kaW5nCj4gCj4gQWxzbyBhcyBm
b3Igc3lzdGltZXIgaW4gbWVkaWF0ZWsgc29jcywgdGhlcmUgbXVzdCBiZSBmaXJzdGx5IGVuYWJs
ZQo+IHRpbWVyIGJlZm9yZSBjbGVhciBzeXN0aW1lciBpcnEKPiAKPiBGaXhlczogZTNhZjY3NzYw
N2Q5KCJjbG9ja3NvdXJjZS9kcml2ZXJzL3RpbWVyLW1lZGlhdGVrOiBBZGQgc3VwcG9ydCBmb3Ig
c3lzdGVtIHRpbWVyIikKPiBTaWduZWQtb2ZmLWJ5OiBGZW5ncXVhbiBDaGVuIDxmZW5ncXVhbi5j
aGVuQG1lZGlhdGVrLmNvbT4KPiAKPiAtLS0KPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1t
ZWRpYXRlay5jIHwgOCArKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3Rp
bWVyLW1lZGlhdGVrLmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLW1lZGlhdGVrLmMKPiBp
bmRleCA5MzE4ZWRjLi42NDYxZmQzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2Uv
dGltZXItbWVkaWF0ZWsuYwo+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItbWVkaWF0
ZWsuYwo+IEBAIC02MCw5ICs2MCw5IEBACj4gICAqIFNZU1RfQ09OX0VOOiBDbG9jayBlbmFibGUu
IFNoYWxsIGJlIHNldCB0bwo+ICAgKiAgIC0gU3RhcnQgdGltZXIgY291bnRkb3duLgo+ICAgKiAg
IC0gQWxsb3cgdGltZW91dCB0aWNrcyBiZWluZyB1cGRhdGVkLgo+IC0gKiAgIC0gQWxsb3cgY2hh
bmdpbmcgaW50ZXJydXB0IGZ1bmN0aW9ucy4KPiArICogICAtIEFsbG93IGNoYW5naW5nIGludGVy
cnVwdCBzdGF0dXMsbGlrZSBjbGVhciBpcnEgcGVuZGluZy4KPiAgICoKPiAtICogU1lTVF9DT05f
SVJRX0VOOiBTZXQgdG8gYWxsb3cgaW50ZXJydXB0Lgo+ICsgKiBTWVNUX0NPTl9JUlFfRU46IFNl
dCB0byBlbmFibGUgaW50ZXJydXB0Lgo+ICAgKgo+ICAgKiBTWVNUX0NPTl9JUlFfQ0xSOiBTZXQg
dG8gY2xlYXIgaW50ZXJydXB0Lgo+ICAgKi8KPiBAQCAtNzUsNiArNzUsNyBAQAo+ICBzdGF0aWMg
dm9pZCBtdGtfc3lzdF9hY2tfaXJxKHN0cnVjdCB0aW1lcl9vZiAqdG8pCj4gIHsKPiAgCS8qIENs
ZWFyIGFuZCBkaXNhYmxlIGludGVycnVwdCAqLwo+ICsJd3JpdGVsKFNZU1RfQ09OX0VOLCBTWVNU
X0NPTl9SRUcodG8pKTsKPiAgCXdyaXRlbChTWVNUX0NPTl9JUlFfQ0xSIHwgU1lTVF9DT05fRU4s
IFNZU1RfQ09OX1JFRyh0bykpOwo+ICB9CgpJSVJDLCB0aGVyZSBpcyBhIGhhcmR3YXJlIGlzc3Vl
IGhlcmUuIElmIGl0IGlzIHRoZSBjYXNlLCBwbGVhc2UgZGVzY3JpYmUKaXQgYW5kIHJlZmVyIHRv
IGFuIGVycmF0YSBpZiBhbnkuCgpBbHNvIEV2YW4gQmVubiBjb21tZW50ZWQgeW91ciBjb2RlIGFu
ZCBhc2tlZCBhIGNvdXBsZSBvZiBxdWVzdGlvbnMgWzFdLApwbGVhc2UgYW5zd2VyIGJlZm9yZSBy
ZXBvc3RpbmcgYSBuZXcgdmVyc2lvbi4KCkNvbW1lbnRzIGlnbm9yZWQgPT0gcGF0Y2ggaWdub3Jl
ZAoKPiBAQCAtMTExLDYgKzExMiw5IEBAIHN0YXRpYyBpbnQgbXRrX3N5c3RfY2xrZXZ0X25leHRf
ZXZlbnQodW5zaWduZWQgbG9uZyB0aWNrcywKPiAgCj4gIHN0YXRpYyBpbnQgbXRrX3N5c3RfY2xr
ZXZ0X3NodXRkb3duKHN0cnVjdCBjbG9ja19ldmVudF9kZXZpY2UgKmNsa2V2dCkKPiAgewo+ICsJ
LyogQ2xlYXIgYW55IGlycSAqLwo+ICsJbXRrX3N5c3RfYWNrX2lycSh0b190aW1lcl9vZihjbGtl
dnQpKTsKPiArCj4gIAkvKiBEaXNhYmxlIHRpbWVyICovCj4gIAl3cml0ZWwoMCwgU1lTVF9DT05f
UkVHKHRvX3RpbWVyX29mKGNsa2V2dCkpKTsKClBsZWFzZSBjaGVjayBvdXQgdGhlIHBhdGNoIHNl
bnQgYnkgRXZhbiBCZW5uIFsyXSwgaWYgeW91IGFncmVlLCBhY2sgaXQuCgpUaGFua3MKCiAgLS0g
RGFuaWVsCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb21tZW50LzI0MDU5Mjc3
LwpbMl0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5lbC8yMDIxMDQxMjEz
MjIwMC52My4xLkkxZDk5MTcwNDdkZTA2NzE1ZGExNmUxNjIwNzU5ZjcwM2ZjZmRjYmNiQGNoYW5n
ZWlkLwoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5m
YWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20v
IyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxv
Zy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
