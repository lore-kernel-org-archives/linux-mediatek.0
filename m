Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4C7C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 10:11:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8346196C
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 10:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA8346196C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N/Sc1e7V6RRGTnUzGcjCmnTGDvQhEELOJQy4R/KWnR4=; b=UnddVRQhF5gmXzLjh3CIJ0EOd
	HHsrP1tVlCef30VvbIpb5xoFwLIH8CCPZAwiGZvOvI86UH9irUa64Bhvf5TN+jgporOX80dRsGk+r
	KsyEQ77mcmxt8wScKWskcN08VgX6YXgFHI4aHfAhPOTFTK6pTT7JPJPOU2GhB1SXFBfiyTNqkIHMd
	aFzBSlWMIRMY+/guViDWUQhvr/vDC8ZM/pwkxL3cdLmWiOfcZ+vFOmWfzI9xnffbLjmIWDcqoad6z
	Tlk8WTwe8DN2pntu4D/ZV9Dk9e/J4zU4HurPyjznRB2uATqKJ095/z4aQLWeG6QOQQ0gRWX01uCXE
	32HVf8gmA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOHWU-00BJQf-2e; Mon, 22 Mar 2021 10:10:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOHWQ-00BJPl-BO
 for linux-mediatek@lists.infradead.org; Mon, 22 Mar 2021 10:10:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so10902078wma.0
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Mar 2021 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pl/1x/dUibJwhZPPXqj++9a+GjOkKTPY4TtNftw5ACE=;
 b=fzQrW0MY/qPU0DyGvJ8PqjweP6lFpaYeQnb2kYMfUyF2dHpGZpsxKb1iPJ+KBz48bs
 nuHPcsBGejT/eGKmy7MV8vRuU4Q3KW/JqXzGARh0J9/OkihRjshIXhadGscapTMqjxx1
 kNXI6rhv6yo9JtEsXhyiZbi5ciQdliP02vux6EU9Yhgy/wB+XAODcPS85U2S6Jz0YY1V
 YfaAzE8MaA16j+Jmjf1ODzFJ5FZcQ8NyvgoPjZJ9kioZSMXtDHQJExfKCz/QxhFGXcdG
 vcqdLg8bByYPX1VjFKwiqnDubcGvWPbNuEHxp33CPyI5XtQW3C6U+lLY/6W8Q4e6I2Y4
 dFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pl/1x/dUibJwhZPPXqj++9a+GjOkKTPY4TtNftw5ACE=;
 b=Ea8acEeoY095Lt8z+YZsg5ZPhlmixHNjESfmcZnzirQ+IO54sqwCqJSwtpwNQfg19B
 HEwMLnM+k1OIR8V7IEvjLQAOUkMgbI3wGFiw23XibxVPHvOqn3DgAXfSFhOB6JnJfeNT
 t4Ens9PP7I0laUHcSekEvx7SJrreulpy/K0pk6sjm9d20gKBukLtgdSDKtkbzsq2+2nQ
 Om65jQcE+ZYh1flG+oOOlSuqWAOP6Rfm5LAE1znzwIPz/K+lR72Zuvv1PDvWl+onogH9
 E4SbVXkEt5BaQJErpvxXWtmiWIr+yEpgfhuEfhNsaVH/YrBmhbu4k6rX63bNYTqXT6I4
 NjPA==
X-Gm-Message-State: AOAM532h1oLUXpaB/pnDEzmtnvXu1nb2bPskvjo0ZULTPBD68pVJtWr/
 2qgxg9IOmFjHWwzVhFEZrSt4TA==
X-Google-Smtp-Source: ABdhPJw6hR/D3ntozds8E1xl58azewk89v8W83EuKkKgkv9xG2vtmsbj2U4laVkYvMRLrzNd2gHtVA==
X-Received: by 2002:a05:600c:358c:: with SMTP id
 p12mr15036765wmq.19.1616407852724; 
 Mon, 22 Mar 2021 03:10:52 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:d8b:d5f9:2138:169c?
 ([2a01:e34:ed2f:f020:d8b:d5f9:2138:169c])
 by smtp.googlemail.com with ESMTPSA id i11sm19455755wro.53.2021.03.22.03.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 03:10:52 -0700 (PDT)
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: optimize systimer irq
 clear flow on Mediatek Socs
To: Fengquan Chen <Fengquan.Chen@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: dehui.sun@mediatek.com
References: <1614670085-26229-1-git-send-email-Fengquan.Chen@mediatek.com>
 <1614670085-26229-2-git-send-email-Fengquan.Chen@mediatek.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c91e9afc-8b04-f35b-bcf9-1fcf9a6f425f@linaro.org>
Date: Mon, 22 Mar 2021 11:10:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1614670085-26229-2-git-send-email-Fengquan.Chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_101054_732197_ACA4F690 
X-CRM114-Status: GOOD (  21.03  )
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

T24gMDIvMDMvMjAyMSAwODoyOCwgRmVuZ3F1YW4gQ2hlbiB3cm90ZToKPiAxKWVuc3VyZSBzeXN0
aW1lciBpcyBlbmFibGVkIGJlZm9yZSBjbGVhciBhbmQgZGlzYWJsZSBpbnRlcnJ1cHQsIHdoaWNo
IG9ubHkKPiBmb3Igc3lzdGltZXIgaW4gTWVkaWF0ZWsgU29jcy4KPgo+IDIpY2xlYXIgYW55IHBl
bmRpbmcgdGltZXItaXJxIHdoZW4gc2h1dGRvd24gdG8ga2VlcCBzdXNwZW5kIGZsb3cgY2xlYW4s
Cj4gd2hlbiB1c2Ugc3lzdGltZXIgYXMgdGljay1icm9hZGNhc3QgdGltZXIKPiAKPiBDaGFuZ2Ut
SWQ6IElhM2VkYTgzMzI0YWYyZmRhZjVjYmIzNTY5YTliZjAyMGExMWY4MDA5CgpSZW1vdmUgdGhl
IGFib3ZlLgoKQWRkIGEgRml4ZXMgdGFnLgoKPiBTaWduZWQtb2ZmLWJ5OiBGZW5ncXVhbiBDaGVu
IDxmZW5ncXVhbi5jaGVuQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1tZWRpYXRlay5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1tZWRpYXRl
ay5jIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1tZWRpYXRlay5jCj4gaW5kZXggOTMxOGVk
Yy4uOWYxZjA5NWRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItbWVk
aWF0ZWsuYwo+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItbWVkaWF0ZWsuYwo+IEBA
IC03NSw2ICs3NSw3IEBACj4gIHN0YXRpYyB2b2lkIG10a19zeXN0X2Fja19pcnEoc3RydWN0IHRp
bWVyX29mICp0bykKPiAgewo+ICAJLyogQ2xlYXIgYW5kIGRpc2FibGUgaW50ZXJydXB0ICovCj4g
Kwl3cml0ZWwoU1lTVF9DT05fRU4sIFNZU1RfQ09OX1JFRyh0bykpOwoKCVNZU1RfQ09OX0VOIGlz
IHNldCBiZWxvdywgd2h5IGRvIHlvdSBoYXZlIHRvIGRvIGl0IGJlZm9yZT8KCklzIHRoYXQgYSBo
dyBidWcgPwoKSXQgaXMgY29uZnVzaW5nIHdoYXQgdGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBTWVNU
X0NPTl9FTiBzYXlzOgoKLyoKICogU1lTVF9DT05fRU46IENsb2NrIGVuYWJsZS4gU2hhbGwgYmUg
c2V0IHRvCiAqICAgLSBTdGFydCB0aW1lciBjb3VudGRvd24uCiAqICAgLSBBbGxvdyB0aW1lb3V0
IHRpY2tzIGJlaW5nIHVwZGF0ZWQuCiAqICAgLSBBbGxvdyBjaGFuZ2luZyBpbnRlcnJ1cHQgZnVu
Y3Rpb25zLgoKV2hhdCBtZWFucyAiaW50ZXJydXB0IGZ1bmN0aW9ucyIgPwoKRG9lcyB3cml0aW5n
IHdyaXRlbChTWVNUX0NPTl9FTiwgU1lTVF9DT05fUkVHKHRvKSkgYmVmb3JlClNZU1RfQ09OX0lS
UV9DTFIgYWxsb3dzIHRvIGNsZWFyIHRoZSBpbnRlcnJ1cHQgZmxhZz8KCkNhbiB5b3UgZXhwbGFp
biBob3cgdGhlIHRpbWVyIHdvcmtzIHJlZ2FyZGluZyB0aGlzIHBhcnQ/CgpJdCBzb3VuZHMgdG8g
bWUgYSBiaXQgc3RyYW5nZS4KCiAqCiAqIFNZU1RfQ09OX0lSUV9FTjogU2V0IHRvIGFsbG93IGlu
dGVycnVwdC4KICoKICogU1lTVF9DT05fSVJRX0NMUjogU2V0IHRvIGNsZWFyIGludGVycnVwdC4K
ICovCgoKPiAgCXdyaXRlbChTWVNUX0NPTl9JUlFfQ0xSIHwgU1lTVF9DT05fRU4sIFNZU1RfQ09O
X1JFRyh0bykpOwo+ICB9Cj4gIAo+IEBAIC0xMTEsNiArMTEyLDkgQEAgc3RhdGljIGludCBtdGtf
c3lzdF9jbGtldnRfbmV4dF9ldmVudCh1bnNpZ25lZCBsb25nIHRpY2tzLAo+ICAKPiAgc3RhdGlj
IGludCBtdGtfc3lzdF9jbGtldnRfc2h1dGRvd24oc3RydWN0IGNsb2NrX2V2ZW50X2RldmljZSAq
Y2xrZXZ0KQo+ICB7Cj4gKwkvKiBDbGVhciBhbnkgaXJxICovCj4gKwltdGtfc3lzdF9hY2tfaXJx
KHRvX3RpbWVyX29mKGNsa2V2dCkpOwo+ICsKPiAgCS8qIERpc2FibGUgdGltZXIgKi8KPiAgCXdy
aXRlbCgwLCBTWVNUX0NPTl9SRUcodG9fdGltZXJfb2YoY2xrZXZ0KSkpOwo+ICAKPiAKCgotLSAK
PGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNv
bS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9v
cmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
