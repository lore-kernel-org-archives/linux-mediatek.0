Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5071ED72A11
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Nov 2024 20:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXMhlKyNUyXAehCvYmXtBGlWlyuXZ6rNCKB5eusJ9ok=; b=HJN40GbPvkG3hNEbCxpI6oG/mM
	qVFc1IBvU4eAX/ftAZkdpITTOYkZUn8mBuOYH08rmTZnJw92hY15EXjGSSxIf4+9RaxkD1bbJVrA/
	QpM3PJA11Gr+zr6SXiOFwL+Ns3UCn1IdSSRR5q7IUFrgXPIcsFWmGrTlkv7OPwELelNcCYOyA7+zp
	in4rjdBwJrnBYA54VvZ15eaC7rBMp8N85AAsVJU+tj5IiIu378P39/pAd2HXafVByEl/XiSTnA9ue
	1LGY4ty5ZiArvDrfPcei0LZuj9G2ca1/1GlnnT40FV9JfQnC2x3shUwUBeV6RAmx+1WnoEni37Pta
	pAVdPuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH7AV-00000000sce-0qNE;
	Fri, 29 Nov 2024 20:00:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH7AR-00000000sb3-3VuE
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Nov 2024 20:00:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so13947305e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Nov 2024 12:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732910441; x=1733515241; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXMhlKyNUyXAehCvYmXtBGlWlyuXZ6rNCKB5eusJ9ok=;
        b=MNpuko6/8Tw16jCgkyfKj6joFlKzTcRMFBqVy6VKEL7w2Z/pYTiMlY481nF0anK/4l
         ySRQVKIq4bT5WWAALXEH7MOSR169toEqKyxY/str+54A9nJasc3gZH8iFqL5eAdUoZKm
         UpqehLM5/0ytHCWU6D6n3weaTXPbInjzjTSErWm5R2pLnFa2hA7XQphnHYLdSsTD99S4
         rCYRjYegmzCesEcnq6qfoak3HpKWUZU9fjS7yZw5HGyt5XS8OB0RTYtBTx6zHy6hezr0
         GItbn9Ab0q5+qQdAJKrCtABg/aOV2KmxWJpX8YDgwLujFunIZ8toV2X1YMhpQhmWME7K
         Yr4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732910441; x=1733515241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXMhlKyNUyXAehCvYmXtBGlWlyuXZ6rNCKB5eusJ9ok=;
        b=pgXaR8HcLiEdd+mVUNqeWY1iZ06FIJb8TaF7cpyRRznASkDsFD0x4lQVwKttBerwEp
         QAoohw8pn11IiDODc+pyL0cCnjI5V4fAO1S6fzVc+kAt6uGgrx6dw1I6qgG4ZDMhFbU5
         1sbpLu24ewc0XCDJrPeWcz6B4EdtbvTRpzRdqzJBliIMdnEBooPYt84IANkM4hme94HS
         6UVz/8RoKQ+jwHX6vJERj9wFA9SpHzOt9e0On48L2iVRqGU43HAYT14leoVZI5dIaV3q
         VZXW+T9nK9Qf3hYNlRe1JrovofMhXTD08kdcYDLHv20ZWIWCygrp4YZaqHBb+2QWacgW
         NmdA==
X-Forwarded-Encrypted: i=1; AJvYcCWRytH+YtOvH6luCFUmfTA012lCD69CSjxkwHx2ZNN/1VkMxloSFzsunv7YohoDuU/pQP3Mwj1llM3TAJA9iA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkZ8tgxPQR8ZHMcCrOyDQwyxureDFK5n36iVaLvmPkfCN4JgKF
	YC5OKRRgAZPRMoWdHiuQLF2n35d7Wbhek1fp0+HbLDfy4bgZQ0dKap2KAxhifs4=
X-Gm-Gg: ASbGncuYPATOa6gENBu9IMMILD6YYHcsIUjoLJtU/ebNsYYvzWskIEPsOto4xg9pxqY
	EJbWjTq/IykgsFVQFVJaa3NouH52K8qSqMDIZLvCBUaaGqafrz1xbcymIfvabUGb69u40DJFw/f
	hutgJ7rV5dc5PeLhuV9jA8xSTuIcK6ggBRw8E2mxcqlGoOVUnk7DGjSIuwqXW8QRVwbDE2k+hVr
	ujOvYbIKc7WVwXxqwzNRapDDVa8OPEJ2p3e0ZgjxdfdtsuxkUsIS0a5+hr9ToDfkPbeeN3OwXwm
	FjMcD/AoRLokKA==
X-Google-Smtp-Source: AGHT+IERDYwDGnHxt4PkrEbc7nYmk1O9LCWEyDw4b8b+mn5ibUuFnpDyTpQ+9yD3eVcYFhLRJEKXzA==
X-Received: by 2002:a05:600c:3b16:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-434afb29148mr77259745e9.0.1732910441500;
        Fri, 29 Nov 2024 12:00:41 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434b0f325fdsm63936945e9.30.2024.11.29.12.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 12:00:40 -0800 (PST)
Message-ID: <20d3a0be-ba5f-439f-80ff-2e2bda3bb144@linaro.org>
Date: Fri, 29 Nov 2024 21:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] thermal: multi-sensor aggregation support
To: Nicolas Pitre <nico@fluxnic.net>, "Rafael J . Wysocki"
 <rafael@kernel.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Nicolas Pitre <npitre@baylibre.com>,
 Alexandre Bailon <abailon@baylibre.com>
References: <20241112052211.3087348-1-nico@fluxnic.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241112052211.3087348-1-nico@fluxnic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_120044_695391_DE9CFE48 
X-CRM114-Status: GOOD (  10.36  )
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

On 12/11/2024 06:19, Nicolas Pitre wrote:
> This series provides support for thermal aggregation of multiple sensors.
> The "one sensor per zone" model is preserved for all its advantages.
> Aggregation is performed via the creation of a special zone whose purpose
> consists in aggregating its associated primary zones using a weighted
> average.
> 
> Motivation for this work stems from use cases where multiple sensors are
> contained within the same performance domain. In such case it is preferable
> to apply thermal mitigation while considering all such sensors as a whole.

Do we have a real use case where we can compare the per sensor vs 
aggregated sensors approach ?



> Previous incarnation by Alexandre Bailon can be found here:
> https://patchwork.kernel.org/project/linux-pm/cover/20240613132410.161663-1-abailon@baylibre.com/
> 
> diffstat:
>   .../bindings/thermal/thermal-zones.yaml       |   5 +-
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 210 +-----
>   drivers/thermal/Kconfig                       |  27 +
>   drivers/thermal/thermal_core.c                | 643 ++++++++++++++++++
>   drivers/thermal/thermal_core.h                |  14 +
>   drivers/thermal/thermal_of.c                  |  86 ++-
>   6 files changed, 780 insertions(+), 205 deletions(-)


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

