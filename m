Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45D6CD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JadJf1yHiM3agA//2OvneRIfLrToVBQS2kX3ZvyjY2U=; b=YoyGvms1sZyd3TZnPqP6OZKOdY
	coRmQ6N+4kh5sjJmWG9u8DUgnPtNSuByAGKCufYe94P6p8FuTswN+MBDcU2Mx+fnr63FwBb7oejsv
	cEiuGFoQhf6ccwovJPAkBndR4LPUg448kNxKAUr7AFBBL7TN8KojF9UJrVvMamOAXE1Lz4kVuh+P9
	O1/NwShEfUHZjrGBF5GHzrTNUXz/VYTwCzwrexID7gxpejQ+U1ebQttfTuhXLggA/fBM4f+reU/44
	SsFj2bRlHO8m+kuIcXOy/xEQkh4ZCX0ScfNZoD8Hi5rVHHjLCY4IZ6EKOmQlbRF639UKdtjCtwP0t
	j4HFEbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOpT-00000003CFc-135o;
	Thu, 04 Apr 2024 15:16:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsOpQ-00000003CEh-0BIh
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Apr 2024 15:16:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4162bdec40aso3403145e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Apr 2024 08:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712243793; x=1712848593; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JadJf1yHiM3agA//2OvneRIfLrToVBQS2kX3ZvyjY2U=;
        b=rBm7N23mwqC0XLyWIFdmQzFfnPbVshKiZ0BP79BTCK7+wFs/ij6sl8ut8vSk7EZX8y
         IS7NMGs6+MsrBtFGVDTReHxMQpfRVRPVGejNbrmc6m4YolnWJed5Ln3uS6b3//SX5ezE
         FaJbYA7WQfcv2p1byrNbLVG00qmIxj985tQjw25ALUmhAjvqVAEvhLhFx6vYuWqHvhy2
         OpcgzjFX/5qy61z1fZhlKkyiIlemWU194S6awZskuRV93GPAG8Jneh3uELgZ0FSS9O3w
         416Xhe7hGZnvJ9Iv4wdW2GgwY4EHpx6/pF8PKbh7CGywttwLC/ESkBrsiBO6iVsJpiM1
         CH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712243793; x=1712848593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JadJf1yHiM3agA//2OvneRIfLrToVBQS2kX3ZvyjY2U=;
        b=auVi9WsyvXuGPj2Ht2jgmcOPGtk1YRRsO3Xlj6QqgPq947bxdxQ8qkov2bOZOt60GZ
         OvmC8WL8Y9oJNSvfzw/zu4THjDr+ieAZpJRaagH83UitZCyP/Gtix2RrxogEYq9Sv3uu
         wdXE5UKpeYAbLVn+uRxZsKbbDaJGuXktmMy/1CnwRL2osqT/cWU0qWhO5x/231xq44jS
         sSFZWQFtV/xXrDdM1qLzz6NF3lm/HrIez0oKR25+jkdss4lLYVR1qOx7bisMo2Oj/YY/
         QM7jh1W0zP+wkQQZem12AlJjqgKDZVqSRZGxIejzV+giQlTz3oZo2UusEbEFpytGvO2X
         Jxvw==
X-Forwarded-Encrypted: i=1; AJvYcCWbq+DVJATyRxGNJNPkgtVrWfRu7v80c0RTzE1MYJVvYjTZKb1AGxRMvjnPVjpYPi4K51qGZ06djLtZxpcOfjQN/P6TTons8dzLgfVId1nDczVJ
X-Gm-Message-State: AOJu0Yz7FDQNzNREylpYYAu4gP5wCge3jSdLuCvBxn8KHIAi6qneE9wD
	FSmu6dBeliO0WPXrMSeKB4YHB7yvirw5ADJ+I6Jd1ZIT55AUrOPui1ulpQ8QkKQ=
X-Google-Smtp-Source: AGHT+IHGzZnEGQ65V0RqdcQeBjbSGhJ1sZ8RB12ktW1XRjg9KxwbStdZLcCDqoNbiATje9p9j5Hj4w==
X-Received: by 2002:a05:600c:3016:b0:415:67ac:3245 with SMTP id j22-20020a05600c301600b0041567ac3245mr52794wmh.28.1712243793225;
        Thu, 04 Apr 2024 08:16:33 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id j10-20020a05600c488a00b004161ea7ed6dsm2914260wmp.38.2024.04.04.08.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 08:16:32 -0700 (PDT)
Message-ID: <aab10d22-b1a1-45e9-85bc-a4334aa6c497@linaro.org>
Date: Thu, 4 Apr 2024 17:16:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] arm64: dts: mediatek: mt8188: add default
 thermal zones
Content-Language: en-US
To: Nicolas Pitre <nico@fluxnic.net>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240402032729.2736685-1-nico@fluxnic.net>
 <20240402032729.2736685-16-nico@fluxnic.net>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240402032729.2736685-16-nico@fluxnic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_081636_122999_F2FB010C 
X-CRM114-Status: GOOD (  14.32  )
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

a few comments about this description.

On 02/04/2024 05:25, Nicolas Pitre wrote:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Inspired by the vendor kernel but adapted to the upstream thermal
> driver version.

[ ... ]

> +	thermal_zones: thermal-zones {
> +		cpu-little0-thermal {
> +			polling-delay = <1000>;

Except if I'm wrong, the driver supports the interrupt mode, so it not 
necessary to poll constantly when there is no mitigation. You can remove 
the line and everywhere else.

> +			polling-delay-passive = <250>;

As little CPU, 200ms or 150ms may be more adequate.

> +			thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
> +
> +			trips {
> +				cpu_little0_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};

You may want to add a 'hot' trip point in between, so the userspace can 
be notified and take an action before reaching 'critical' (like 
unplugging a CPU)

> +				cpu_little0_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;

critical is a point of no return. Hysteresis does not make sense.

These comments apply to all thermal zones.

[ .. ]

> +		cpu_big0-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;

Same comments as the little but may be an even lower value. eg. 100ms.

> +			thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
> +
> +			trips {
> +				cpu_big0_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu_big0_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu_big0_alert>;
> +					cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};

[ ... ]

> +		gpu1-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8188_AP_GPU1>;
> +
> +			trips {
> +				gpu1_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				gpu1_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		gpu2-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8188_AP_GPU2>;
> +
> +			trips {
> +				gpu2_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				gpu2_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};

You can add a devfreq cooling device for the GPU here.

[ ... ]

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


