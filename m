Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AD5D70DE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Nov 2024 17:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10gOONKYd0Gk3rZPYV0aoJyh1TGfB9PFutKnizLk6Y4=; b=FKY0HpgRU5Apw5kve0YYd7jAOt
	v5z/Dy8yC+2tppwUaZv4B14NDUrgZ4ZFMLBzyBzWUF3YhF9MzqnHLQW0u9/jyZm3vAumUluP4boDy
	iAxRZJ0UwkFqBA/EaiZOCre2UYafzzQ9TCgu31qVWj8rIbTe2bIJs1pNH9SNPrWFzAcEcMgfQ56VI
	fzdXzoF6kRyNwEWOlcc6Ry7+2sj78w3GWnAMk2u/HtqhTPmCxL4cLOj7nizLMEaFaIR2k/OGo02VI
	KWDcMsMkGM77TArbf45/em/OAoAFhRo9Httqs52fOFjR02eFDuprJ2vmMbuhrMrjYzQuR4qdoO5rQ
	4ehibeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiTg-0000000G5lL-0dzE;
	Thu, 28 Nov 2024 17:38:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiT2-0000000G5fe-0SJM
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Nov 2024 17:38:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4349cc45219so9494775e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Nov 2024 09:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732815494; x=1733420294; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10gOONKYd0Gk3rZPYV0aoJyh1TGfB9PFutKnizLk6Y4=;
        b=PSWNK+xARBn22w3HLGIeDb+sEwe+K6z6Iv2f/4XNOv4qWQxGyfk9nmPIwCaYG+fg2b
         xkClrdD9wAoJRrXjBGu5mWab5rW36lm+msnjZ+JrypMI2PZDFlvg7mTeHtv5dlm2lx1O
         /Uw+H9ChkXHLNE1tiQXUCE3Revzyjxp2w3HKX6Xkw51B/ybO/kHf8+8qDDqW0+HJuMkh
         PXkACN05w6fftIHnNTfYw02fdnzLR+2+5GyKk4dC5WDCX7brtVLQTi7JK2YIHRo9Yq68
         zRwA78h0+NY6EkKfDZLv9MEsNj5Lj9SAKPmaRrfQb3J9QfQhTq5UzyBXLLe5Jy+uTES0
         EjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732815494; x=1733420294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10gOONKYd0Gk3rZPYV0aoJyh1TGfB9PFutKnizLk6Y4=;
        b=pxQnUpG/rO/YUSy4yboq6PGC/2XiVyk1tq2OdaZf1/Dg1jhz83GYwGpykXSyjixC2G
         jPTzr1Rll2BqCG4K/Bpri7pdUZrxYVEr5Pxwa3VZrfdGErClI1mVWwVpEWseemlX+9//
         KUS3dLfdPg2c0w1hwMyLdCjtoptRKRuXUOh9jX93Qotkh7H30PAoLmI+FMO8n5U77aS/
         bqZfz4r0Z0NYPl6vKP3zFJ/BJIJjIMa0mGiZXBdr9FtZVyFTE7056Pcm/+RPMor5bjqx
         OGDopWnKDHlM2khTzSmBPo2uKw0Uf2IAl2YGHSig8WFLDpz3nF+tGNaiw8chkYDoMF8j
         p7ow==
X-Forwarded-Encrypted: i=1; AJvYcCU9oX+qFcJPlGNg7SglTAAWmOftBaMVS37lf1oxqElMWkfNhBzd2v8anBjKYUNC9JEZpBxhmqmRHtCNZPScgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YziVwtXgojH50+fpkCICPDIxFH1QkydyWRBnidOMIk95WSn+8I4
	f8LrThmkG+OjBzBevplPYHYSKZPSOeUxmwv4VnI86kSJHp2jjx7ZY1ITyRdbhIE=
X-Gm-Gg: ASbGncse2/C6KjPGuABiYRUI3nTzHNtCEYN3HlxjY/kR45q9JfLCCZ7ee3WuSmXwgNR
	ydDDju7wWRL4sH7PBvb6PK80cuRZnhFqduHNq64FhuNLmcPJI0HADTOo/6LRziT/8upgGgceDYj
	L6GbflgFEoc3c/HkwdafwqMScwV9zry8+4+aKInUFI7RHhQnbJ4WdfxeN8k6/Ro/740b+sxU3aJ
	Bz2BmPtmNXB/aR+3Ra1BrD7ByGd0vYrFV1HzMKmEyoUZCkmNPKJ2ZzCXC4gotwRo+dCscH7a/4n
	dbCg1VeiCKdn2g==
X-Google-Smtp-Source: AGHT+IGyiJDbepmBMbDSY4970QLlGU0+MdW25rYKAMlGZRbsCkkVDjf5WuEnqq8LxT5+l+e+vpF+ww==
X-Received: by 2002:a05:600c:4447:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-434a9dbaed6mr78728755e9.4.1732815494001;
        Thu, 28 Nov 2024 09:38:14 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434b0dbf95fsm28022775e9.15.2024.11.28.09.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 09:38:13 -0800 (PST)
Message-ID: <c1c14ada-c0bf-4353-a8ba-7b3a2fb6d971@linaro.org>
Date: Thu, 28 Nov 2024 18:38:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] thermal: multi-sensor aggregation support
To: Nicolas Pitre <nico@fluxnic.net>, "Rafael J . Wysocki"
 <rafael@kernel.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>
References: <20241112052211.3087348-1-nico@fluxnic.net>
 <s120q967-4r69-pps2-1qo3-9952r9173125@syhkavp.arg>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <s120q967-4r69-pps2-1qo3-9952r9173125@syhkavp.arg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_093816_955273_5479DDB0 
X-CRM114-Status: GOOD (  11.29  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Hi Nicolas,

On 27/11/2024 23:05, Nicolas Pitre wrote:
> Gentle ping, feedback appreciated.

I'm currently reviewing the series.

We have been discussing this feature since a long time and multiple 
times at different plumbers without any progress since then. So thank 
you for proposing an implementation of this feature.

I have some concerns regarding the approach I will raise tomorrow.

Thanks

   -- Daniel

> On Tue, 12 Nov 2024, Nicolas Pitre wrote:
> 
>> This series provides support for thermal aggregation of multiple sensors.
>> The "one sensor per zone" model is preserved for all its advantages.
>> Aggregation is performed via the creation of a special zone whose purpose
>> consists in aggregating its associated primary zones using a weighted
>> average.
>>
>> Motivation for this work stems from use cases where multiple sensors are
>> contained within the same performance domain. In such case it is preferable
>> to apply thermal mitigation while considering all such sensors as a whole.
>>
>> Previous incarnation by Alexandre Bailon can be found here:
>> https://patchwork.kernel.org/project/linux-pm/cover/20240613132410.161663-1-abailon@baylibre.com/
>>
>> diffstat:
>>   .../bindings/thermal/thermal-zones.yaml       |   5 +-
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 210 +-----
>>   drivers/thermal/Kconfig                       |  27 +
>>   drivers/thermal/thermal_core.c                | 643 ++++++++++++++++++
>>   drivers/thermal/thermal_core.h                |  14 +
>>   drivers/thermal/thermal_of.c                  |  86 ++-
>>   6 files changed, 780 insertions(+), 205 deletions(-)
>>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

