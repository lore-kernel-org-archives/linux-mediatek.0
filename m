Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF179C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 08:29:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB04D20714
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 08:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kj3nBwXY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQZzuMkv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB04D20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dkMJikXn6N/rQiMvZAlcV494+xPDh6cmhz8Zuknz6SU=; b=Kj3nBwXY+C3o/a/SiadNavKf9
	stpaCSBEUlH+FmDlz/a//AsnHLwNTe0DJXno7FAXtf04kw9iD6nLmG6+tANj46eGkKsJ+ktsH/ISL
	RXBVNYOCzY98f6NKCL9DWox0lkgxM8pp6GJjblUh53o995e3QCYC2L+wMUcAfdr0TSNW786jOcf6q
	xp94ee9yAi6RP0NiWQqtGvo6MCNTLXOIoX4Cvuf8TboDsfCf64BJPgyVGZcdCpmHKNfhrGgIWR7Dm
	XBwc9dq/imrhJCLjFy4zsijgYQePmXaq6L422uihpPpRtB/IQ4iJs3TtpAm15iDI/iaXZaztNv0LJ
	7oUmF25Yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxneL-0006Lq-C2; Tue, 21 Jul 2020 08:29:21 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxneH-0006KR-PQ
 for linux-mediatek@lists.infradead.org; Tue, 21 Jul 2020 08:29:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id f2so20265066wrp.7
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2020 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BCc9lQHutdqUheCKRkROi161ZNJWwY3EPFExUcfdRiQ=;
 b=nQZzuMkvsmF8UEWlQ2eMje2ox6IxIQnvVbZvACyM99WUCNYR4mar5iAsEGOMOc1+kZ
 W47xjV3CaLmGqGyhv+1g8jpHCUH2OllbVfcJnsO2LuTUPFgblr8cB3VkvBPBU0eMoS8C
 bDpo4AnqD9Ze142VKWzYhpOd238YloVY6mGh99Pj3KHwXg4yPC5MPHjeWWDd2+cLLFE7
 VWXzcnWEMofCTSbJPcZGPf78ZW/wwbQR3UBjy0EiNgclwxf6YDw2IB5JTQ5l6nd72jFF
 NzSBCKQA6U6T6hQYX5gxJm4mO0jp49pX79cI2b8LyY7hj/iq16n93wrUPjZMA62YVHHw
 0F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BCc9lQHutdqUheCKRkROi161ZNJWwY3EPFExUcfdRiQ=;
 b=r8mruSJShHbzrnZ3SdQaRJ5dmfFiouhxEsifd8m7x8SpdqYsDU032pgfDYXslvX7aP
 cQKW6eOvn6vN8/qWgMgPfgyUdVAttbS3HgF7k7kzR+qNdx0DgAdcDexDdhTvg0V8rJwT
 V/RhekVGBbsumPqBff7s82hdBzs2kEcGOucwh1pNNhhF0PpAuO7GskSGFqgG4Olqv6Bs
 KP4LsfHyEcNAg1nBeKszkxIGAWGu5gueqBKxNv2AXM81svEzwo8VMi2y45QsUSOQzPgR
 JpDc871uSXnqFAzo6aTsXeHwhUYGLVjSArwKxem5yZN3Ri9x/6uN9LlcFKOWpNSRg2+x
 9etA==
X-Gm-Message-State: AOAM533+o8IjOcwp87X5z+CTEQS6IDqK1KjOT4WQeuwUZBeMW5cFwMBd
 AB83opWw7LEH/20g9jJEbmPdSXg2pS8=
X-Google-Smtp-Source: ABdhPJx7ILZH2KvjvBFVVZB5grxQumhwOHm/i3j36nylWvTrt1yjKSBvidlCH5i8FTEEGeIg8iA/PA==
X-Received: by 2002:adf:fb06:: with SMTP id c6mr810292wrr.261.1595320156360;
 Tue, 21 Jul 2020 01:29:16 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:3590:b402:869a:11fc?
 ([2a01:e34:ed2f:f020:3590:b402:869a:11fc])
 by smtp.googlemail.com with ESMTPSA id d10sm36006628wrx.66.2020.07.21.01.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 01:29:15 -0700 (PDT)
Subject: Re: [PATCH v2] dt-bindings: thermal: Get rid of thermal.txt and
 replace references
To: Amit Kucheria <amit.kucheria@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, lukasz.luba@arm.com,
 Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Talel Shenhar <talel@amazon.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Mans Rullgard <mans@mansr.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stefan Wahren <wahrenst@gmx.net>
References: <e9aacd33071a00568b67e110fa3bcc4d86d3e1e4.1595245166.git.amit.kucheria@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <8c7f5c41-746b-f26d-7b3e-4152c17c4812@linaro.org>
Date: Tue, 21 Jul 2020 10:29:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e9aacd33071a00568b67e110fa3bcc4d86d3e1e4.1595245166.git.amit.kucheria@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_042917_960619_0AF59737 
X-CRM114-Status: GOOD (  13.46  )
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
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjAvMDcvMjAyMCAxMzo1MywgQW1pdCBLdWNoZXJpYSB3cm90ZToKPiBOb3cgdGhhdCB3ZSBo
YXZlIHlhbWwgYmluZGluZ3MgZm9yIHRoZSB0aGVybWFsIHN1YnN5c3RlbSwgZ2V0IHJpZCBvZiB0
aGUKPiBvbGQgYmluZGluZ3MgKHRoZXJtYWwudHh0KS4KPiAKPiBSZXBsYWNlIGFsbCByZWZlcmVu
Y2VzIHRvIHRoZXJtYWwudHh0IGluIHRoZSBEb2N1bWVudGF0aW9uIHdpdGggYSBsaW5rCj4gdG8g
dGhlIGFwcHJvcHJpYXRlIFlBTUwgYmluZGluZ3MgdXNpbmcgdGhlIGZvbGxvd2luZyBzZWFyY2gg
YW5kIHJlcGxhY2UKPiBwYXR0ZXJuOgo+ICAtIElmIHRoZSByZWZlcmVuY2UgaXMgc3BlY2lmaWMg
dG8gdGhlIHRoZXJtYWwtc2Vuc29yLWNlbGxzIHByb3BlcnR5LAo+ICByZXBsYWNlIHdpdGggYSBw
b2ludGVyIHRvIHRoZXJtYWwtc2Vuc29yLnlhbWwKPiAgLSBJZiB0aGUgcmVmZXJlbmNlIGlzIHRv
IHRoZSBjb29saW5nLWNlbGxzIHByb3BlcnR5LCByZXBsYWNlIHdpdGggYQo+ICBwb2ludGVyIHRv
IHRoZXJtYWwtY29vbGluZy1kZXZpY2VzLnlhbWwKPiAgLSBJZiB0aGUgcmVmZXJlbmNlIGlzIGdl
bmVyaWMgdGhlcm1hbCBiaW5kaW5ncywgcmVwbGFjZSB3aXRoIGEKPiAgcmVmZXJlbmNlIHRvIHRo
ZXJtYWwqLnlhbWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW1pdCBLdWNoZXJpYSA8YW1pdC5rdWNo
ZXJpYUBsaW5hcm8ub3JnPgo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgoKQXBwbGllZCwgdGhhbmtzCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5h
cm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8Cjxo
dHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGlu
YXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
