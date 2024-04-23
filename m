Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09B8C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZvKemPhdZXx1a5wAZJqa8euX8d+AR9YE7+2VTNoqyA=; b=Fp89JIayEUiZGYhkQHPKbsWvgv
	PaW9NknZju/WSJw+/yEIMchI2hztSa+PscviZZkDYYtqoCoIRZq/kRC1NeYPN0Bj5Y5eExLGpQdRE
	cB8zOgKRO2fxOtMxLAx/w9WVzl5KuT7ffVOq3GP3kfYlrAka6ren7WWRTpZEP/le58KLYt69lwInV
	0EuFbgoYPeXOOz+xb0pTRR4Wv749fQHCwMuCbLRTNkt9BGh74a+VE5Kz57RH0vHld3UZ/Z14oyn1H
	n5kZcISOoAQOmLmqVknGBzqhX1v9QB6kfPmgXdOXL8ZiRwQuARJsMXyJgvYvgHiq1v+/77LEh+ZiW
	A/7VhaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzC6U-0000000Gat5-10Oe;
	Tue, 23 Apr 2024 09:06:18 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzC6N-0000000Garp-1iHq
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 09:06:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-34665dd7744so4070057f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 02:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713863168; x=1714467968; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZvKemPhdZXx1a5wAZJqa8euX8d+AR9YE7+2VTNoqyA=;
        b=FHv/kvrLD6KixP1dT2cr2TAU2LOLEfHXhAyrIWVJfjauXAxCWKtWA+YgY5g2PBau+w
         +Ab0m9zGxVBvIiZil9PpgapGX9R5husSmhnGgrUeh7hcThRpJWNf6LWIOcBJJkZ06oOu
         6XQre0s3Dnem49J66qU8JQ/sfHnL9lZfUTWvG5v7Db2FRp0VPsBcHnhy7hncgn9Oxjo2
         mXN8EPcJ1J+eOTPlbuJp967iyfEaArO/2cpNgdwB/0IV4Ro9DXu8G232R1t0ugpoCi5Q
         Kwg6aHh8ttnjbkRg6B22lphQGLgvMxq0cJbElFZMNXC2uZTV0+X7GLv0q07lT/U8pYTC
         JkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713863168; x=1714467968;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZvKemPhdZXx1a5wAZJqa8euX8d+AR9YE7+2VTNoqyA=;
        b=iV4uVU6XCNA9PG0KULIMFwntOOYWZrDqyVo3lXL/G/ZOGRxVfQCe3yxe1lPQDLN3Rf
         iiLcxFzNZUcpMOAYnvD8N032kLemDsy1u4uFPwN+7PsWVRjFsq9mIZyZ7eEO541BQ9EC
         kdNvJLpN1sDDG0WBCvuhw5d72eF76h75V+ReAtDMS640oxPqOoS1n/z99405cU6GdXj/
         Pf9W8psgp+PFOQNM2RHGb5SJJ9sgir9u9Mon6mrtIfIbK73pGnXRlEnVK0eNw7RSJ9QJ
         WOnPYynBVoguUb/xk54sWWtG4EzEN6AQkgdhXUYLK1XvroWXWYzoYe//09YMt6iyfNI2
         rZvg==
X-Forwarded-Encrypted: i=1; AJvYcCU00zjOuNBiiOiYxMDgPQd0TEgqqszEbjufq9Pl7acbYrJilQWx2F8NaFKxK72VlqJfi+aeREl24kW2UNz33kCxLHF7peuu+kFBJIOkkiW6Ltg5
X-Gm-Message-State: AOJu0Yw7lzExngrnI/+IvJ4m5ep4grwDtngZfdmwlHorcpKHIYEEXqxL
	sdlvJFj0vUrGQeOEXEu424ZyQVjySh29J4qvjpj8rVoj+vzNBks7o9SXZT0NQIo=
X-Google-Smtp-Source: AGHT+IHG4sDArZk8hnzhxx9ggspr37j2e30TIdiJYyOlEmHIcaoKuInnRHqczfjjQmlkFqUJcqEnXA==
X-Received: by 2002:a05:6000:12c4:b0:34a:e6aa:bc01 with SMTP id l4-20020a05600012c400b0034ae6aabc01mr4790936wrx.5.1713863167966;
        Tue, 23 Apr 2024 02:06:07 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id o12-20020a5d62cc000000b00349c42f2559sm14036551wrv.11.2024.04.23.02.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 02:06:07 -0700 (PDT)
Message-ID: <3fabe40f-2353-48c5-a29c-fa0ae9ddf3ce@linaro.org>
Date: Tue, 23 Apr 2024 11:06:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] Mediatek thermal sensor driver support for
 MT8186 and MT8188
Content-Language: en-US
To: Nicolas Pitre <nico@fluxnic.net>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240402032729.2736685-1-nico@fluxnic.net>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240402032729.2736685-1-nico@fluxnic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_020611_593656_6F320D27 
X-CRM114-Status: GOOD (  15.73  )
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


Hi Nico,

applied the series, except the DT changes

Thanks

   -- Daniel

On 02/04/2024 05:25, Nicolas Pitre wrote:
> This is a bunch of patches to support the MT8186 and MT8188 thermal
> sensor configurations. Several changes are needed to cope with oddities
> these SOCs implement.
> 
> All values (calibration data offsets, etc.) were lifted and adapted from
> the vendor driver source code.
> 
> Changes from v2:
> 
>   - use meaningful name for binding index definitions
>   - reuse LVTS_COEFF_*_MT7988 on MT8186 per reviewer request
>   - do similarly for MT8188 that now reuses LVTS_COEFF_*_MT8195
>   - use thermal zone names the svs driver wants
>   - adjust some DT node names and iospace length
>   - remove variable .hw_tshut_temp as it is constant across all SOCs
> 
> Version 2 can be found here:
> 
>   https://lore.kernel.org/all/20240318212428.3843952-1-nico@fluxnic.net/
> 
> Changes from v1:
> 
>   - renamed CPU cluster thermal zones in DT
>   - fixed logic to cope with empty controller slots at the beginning
>   - isolated bindings to their own patches
>   - added MT8188 default thermal zones
> 
> Version 1 can be found here:
> 
>   https://lore.kernel.org/all/20240111223020.3593558-1-nico@fluxnic.net/T/
> 
> diffstat:
> 
>   .../thermal/mediatek,lvts-thermal.yaml        |   6 +
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 256 +++++++++++
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 383 ++++++++++++++++
>   drivers/thermal/mediatek/lvts_thermal.c       | 434 +++++++++++++-----
>   .../thermal/mediatek,lvts-thermal.h           |  26 ++
>   5 files changed, 987 insertions(+), 118 deletions(-)



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


