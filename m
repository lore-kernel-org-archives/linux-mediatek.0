Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2DAC021B8
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 22:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eq8gRk4XBu+/hRpz+bqnE1JgXk2J9JWrinMC3/G5BEY=; b=NZkVg5UwRCT6sXKWt49MX6hh0X
	6AK6akpzAvzFTZfnWKubUutlDGnBDIzXBVcW2ykiupFOU4xb0j9KV3wu+DD4Xk4ZjVdFbxNXLdjEi
	k/ePht4fH9fk9SraItYleO7o18tz+Q1OGvBPZqAUkVGc9WlUJP3bzJNDajdANBQ7bsDwny0lVTHIJ
	oNMDzLj6XyqJrGdSH5F/2nuOKcpYtheFxtP3HiipqSkt/z4rVqby/m+JRnNqG46qYYaGnsdztkF3B
	Nx7+azJRZhO9Kaf2SStPLmKw+FLJi0mGSAxo2wB4uBEf9Q7/IXk1Phbi7DliKrKqZNg8EPGMAsJGz
	MLvHf94w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPSH-00000005Xcu-0iX7;
	Wed, 26 Feb 2025 22:00:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPMh-00000005X4d-2Gdf
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Feb 2025 21:54:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43948021a45so2679825e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Feb 2025 13:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740606889; x=1741211689; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eq8gRk4XBu+/hRpz+bqnE1JgXk2J9JWrinMC3/G5BEY=;
        b=qjggtQ5YA+TseqFbqY+J7/cMC7qkDNJNRNeW3u2IIhJvsW2avMDAD75Trugo1AI/PC
         ByQ9aluvMPt+cZ2XYyaYcwArZt5MxJYcoBn7RduZQQGPo6udwoZ/IPGHNAZW1LDpdZHj
         1T1vNbbcl/gKQPL4haEcMF06Zpl3E5ZEVv+ivz3cvqbBgRkMkVEVkcZlGcz98ZjrrtJy
         X8F+fnvBmfWqMD7oqxyLi80ZltSABp7DG1SDGljQ36Nmfen/JB7t+WjXQiKbtxG2ioHI
         2eQhRhmZSq5tZlZ+yyWmc9COFQWC28PCTKB+wesA6ouhg72CbYOyXIOAo0RdbsfR+elM
         mkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606889; x=1741211689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eq8gRk4XBu+/hRpz+bqnE1JgXk2J9JWrinMC3/G5BEY=;
        b=Qk4CISq1sDwXp5f/ojcP9jeVy1xYhLhRID1/nsxSYdX6HTRI5R3f7ZY8+US/HdlUPp
         8cZzbhOD2umavy05u6POebPFfV+J6SMr1hCHEQr90tRJB1Qj+6NM6Xc/YOTtIEIj5/xJ
         KjwNRmQBIO4ejXNgCPUEpTJZaQP041DcZZPwgDYvOPr1/KeYa/WUJcvnfpct8ZjR6Fj+
         CkA/9/xD5v2A3AjNKzx1OiuccqAixgVA/q9RfuKCmjKOQa4oLIVxyFQcZPZ+Cf09CO/l
         UUAxg/auwE01gO1KgvuLAbqhlRjXcRJuVHGWA73P4d7sgQtFkK/kMDKdrgmEb9UzUhxg
         qTPw==
X-Forwarded-Encrypted: i=1; AJvYcCWvp7YAboRot2h26J6MYGNQ1jQX2aFeoTPQrWhExRDZSFgb1UVB+xHw8Ubr9vM7GbhKCORO8QjEMSapV2Q71A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYg4TZBwucX6QBNcMAOs4+4ljV4u0Vh9zMBwCtPKF9fQTh/fiX
	hfTF+YuUBzgrayQFjGxVvkaSuYoKEK0mwp2vDzflQ1zyNqeMmkXkxSJx9dv6U/g=
X-Gm-Gg: ASbGnctKB4uOkwWuZ6JbhjGQUrHyqRUbstTLG51MtrCUqCl5O8aj+gXfYsKV4GZn7Yt
	rJL4OCqpR57evrCep0nD7U5f1goX5XDLn0PgUP9zSTcuApOPE135z1JxbgA/kAtTOQHR/E585OG
	soMoShmlX/zw9FjI0Jm/hSMYpImK69TFu3s0i7HJ/KZ0yQS4vvFOmNMY3NXxeMxLMC3H97ocFCd
	70bEQz7QMyA7+ud0eEzfwcaEk3DH8O4VJRV/4lXqkjUgmR5vBp7a8mUSOiqw/YsfbyVAi6stNVh
	i8YIevsIF9idBFaD9WmqSdosxJQ49oVpNUZAcj6eS9uAf5gfLGWVwPxIA+eImqsEpg==
X-Google-Smtp-Source: AGHT+IHhsFL+pj6OMWN3D2F6NIOmEF1QIihEQmaH+QhUH5bAqp8gOxbsoe/yEiSSRrYlfkmP/mngBQ==
X-Received: by 2002:a5d:5886:0:b0:390:d62c:ecd8 with SMTP id ffacd0b85a97d-390d62cf1d8mr3926088f8f.29.1740606889502;
        Wed, 26 Feb 2025 13:54:49 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e47a6a5esm93410f8f.35.2025.02.26.13.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 13:54:49 -0800 (PST)
Message-ID: <5e75ed4a-4aeb-45ab-a41b-4498f364a57f@linaro.org>
Date: Wed, 26 Feb 2025 22:54:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dts: arm64: mediatek: mt8188: add more thermal trip
 points
To: Nicolas Pitre <nico@fluxnic.net>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <696pn9r7-63r9-r2pp-rq18-471269pss1nr@syhkavp.arg>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <696pn9r7-63r9-r2pp-rq18-471269pss1nr@syhkavp.arg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_135451_586840_B55DD903 
X-CRM114-Status: GOOD (  11.54  )
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


Hi Matthias, Angelo,

I noticed Nicolas sent this patch but you were not in the recipients.


On 07/02/2025 21:31, Nicolas Pitre wrote:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Provide the "switch on" thermal trip point to be used by the power
> allocator governor.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 338120930b..262eab8fd3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -472,6 +472,12 @@ cpu-little0-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
>   
>   			trips {
> +				cpu_little0_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_little0_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -510,6 +516,12 @@ cpu-little1-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
>   
>   			trips {
> +				cpu_little1_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_little1_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -548,6 +560,12 @@ cpu-little2-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
>   
>   			trips {
> +				cpu_little2_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_little2_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -586,6 +604,12 @@ cpu-little3-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
>   
>   			trips {
> +				cpu_little3_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_little3_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -624,6 +648,12 @@ cpu-big0-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
>   
>   			trips {
> +				cpu_big0_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_big0_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;
> @@ -658,6 +688,12 @@ cpu-big1-thermal {
>   			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
>   
>   			trips {
> +				cpu_big1_switch_on: trip-switch-on {
> +					temperature = <68000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
>   				cpu_big1_alert0: trip-alert0 {
>   					temperature = <85000>;
>   					hysteresis = <2000>;


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

