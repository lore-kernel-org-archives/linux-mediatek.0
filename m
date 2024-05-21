Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A44C25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 11:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yekSUgU6gW9c7daSNKDfWsfCSZwLmZNtbFfvqtYv9ko=; b=yy8elWk+Q0I4SWjF77HZzUonMb
	lX/suQB453J23VTYR4g4WHhdZybKIlXdJsdnrmuOYsiSigseO67HgoRM5Np6qnJ0f4eit0B82npoC
	pgwpQ3ybjkOyrwXITAlVk7JPMah8vwcd5/1EYUaX2EJ7aEgyAfSPnUhp5pubnGniFzyyn8m59GlfO
	PPyVXfuKXF9toRecKEezDq/NLXC6+tyDKSYycM7Wy3PV5ScH7HTij2d+8ZMRoAv780szAuFCr64gW
	DmwoVEFD7Jk4JT9JtqigGZO2sqFemwOi1F/bfzSyPDjGYyseMfl6WD9u2enXYK+Zyhth2YQoYtBDc
	EUTQpxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NNl-0000000HFG9-2erF;
	Tue, 21 May 2024 11:10:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NNh-0000000HFE4-411O
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 11:10:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4202ca70289so29026665e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 04:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716289807; x=1716894607; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yekSUgU6gW9c7daSNKDfWsfCSZwLmZNtbFfvqtYv9ko=;
        b=wTS5mqSpwEYo5lXy3IHaXorkWQo6mEsPLJa9sj5Zti8lkON8wdeAfEKJBSDqh8tzsu
         IpCuIpGPWm/oU19prtbtEjyrpWBHkqACBWMEzQ3mMQpRPWeCmtmVuvjWZiQ/2u/9toaB
         h4P/27hhG5QQ920kPZbwi2fBQwCu8bpnQ3TBys3IGEOPtEaarC+FbeiccIJ7LuHzyCcB
         dU8QrYqpqLTFeN8tn2A3/xhZuTfIE2nB/+xEaVuEX0X8QKGkqHbUTtru1qZ2MY7CKO3y
         nxy0l4GWodt6bCSE24xzhlIFkoBBWa83joIHcjjbRQz1weAx9+QRR5JCeLxUMEInUABp
         UlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716289807; x=1716894607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yekSUgU6gW9c7daSNKDfWsfCSZwLmZNtbFfvqtYv9ko=;
        b=u+7kXzvoSU9S7jge9wTClC2APun3CR4ESPqg7Ix5Djmw5V/cGN1koYzZENjrX1Rzvg
         GECDE3BqGcz6UEH54/bWJfYi8IXz94VPsopoX+Gh4qcOX7iI+jBYSePThxHsnevGYmvs
         8stfbKwLwGOXiVukbmMiMeykeTa7eiHqVm/T1ax0LjIVH2ni0+dDxPNbM3qorVpSHiZ5
         f9f48g8zB6z26sgjIu4z8Mr3f/2UXhegwsAm0OSZzuymXjuEmzSzfjsq7tkK/RWMfvpr
         8DFgkQTBEf1TYMd5AoPhhuA/zxycGGJEKU/PGRPRfHT7jd+4lSGTMVVMBVaDoXMYUCec
         xBHA==
X-Forwarded-Encrypted: i=1; AJvYcCWESfSW+bNyQKWjMSB45J4BBur7sTBvkJ+a2yI2LsfXu7r6hoaiz+qNn4geCYBgDbZcrwqwuG1G1MFcRbQt25AifV4P+beZ3VffmyJEG24ui8Go
X-Gm-Message-State: AOJu0Yz70+/tvAd1LL4815wchwDJaaAWtwBaC2C2VBSxssnYXPHvxJR2
	atXCcd5fsOPYu7TxPNghEVxHFqMW67nJ5Ef4yFc9dHsPekm1uH4uvKKHiVa7ZBI=
X-Google-Smtp-Source: AGHT+IEH0V+1FeX72CKXMBZiES4IfoQK/48eH4j+2M88Xp9MgFb8mIijZezThw5L5R7NhVyxPd4jAQ==
X-Received: by 2002:a05:600c:5116:b0:41f:afa6:3d85 with SMTP id 5b1f17b1804b1-41feac55f95mr280887895e9.31.1716289806826;
        Tue, 21 May 2024 04:10:06 -0700 (PDT)
Received: from [10.2.5.115] (abordeaux-651-1-78-161.w90-5.abo.wanadoo.fr. [90.5.97.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f87c235b4sm492430445e9.11.2024.05.21.04.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 04:10:06 -0700 (PDT)
Message-ID: <02ac5b07-08fe-4abd-8db8-141f4e47f68a@baylibre.com>
Date: Tue, 21 May 2024 13:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] arm64: dts: mediatek: mt8188: add default
 thermal zones
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <nico@fluxnic.net>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240402032729.2736685-1-nico@fluxnic.net>
 <20240402032729.2736685-16-nico@fluxnic.net>
 <aab10d22-b1a1-45e9-85bc-a4334aa6c497@linaro.org>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <aab10d22-b1a1-45e9-85bc-a4334aa6c497@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_041010_167728_562FE8F9 
X-CRM114-Status: GOOD (  21.16  )
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

Hello Daniel,

On 4/4/24 17:16, Daniel Lezcano wrote:
>
> Hi Nico,
>
> a few comments about this description.
>
> On 02/04/2024 05:25, Nicolas Pitre wrote:
>> From: Nicolas Pitre <npitre@baylibre.com>
>>
>> Inspired by the vendor kernel but adapted to the upstream thermal
>> driver version.
>
> [ ... ]
>
>> +    thermal_zones: thermal-zones {
>> +        cpu-little0-thermal {
>> +            polling-delay = <1000>;
>
> Except if I'm wrong, the driver supports the interrupt mode, so it not necessary to poll 
> constantly when there is no mitigation. You can remove the line and everywhere else.
>
>> +            polling-delay-passive = <250>;
>
> As little CPU, 200ms or 150ms may be more adequate.
>
>> +            thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
>> +
>> +            trips {
>> +                cpu_little0_alert: trip-alert {
>> +                    temperature = <85000>;
>> +                    hysteresis = <2000>;
>> +                    type = "passive";
>> +                };
>
> You may want to add a 'hot' trip point in between, so the userspace can be notified and take an 
> action before reaching 'critical' (like unplugging a CPU)

There's no "notify" function in the driver.
Do you think it's worth adding such 'hot' trip point, though ?

>
>> +                cpu_little0_crit: trip-crit {
>> +                    temperature = <100000>;
>> +                    hysteresis = <2000>;
>
> critical is a point of no return. Hysteresis does not make sense.
>
> These comments apply to all thermal zones.
>
> [ .. ]
>
>> +        cpu_big0-thermal {
>> +            polling-delay = <1000>;
>> +            polling-delay-passive = <250>;
>
> Same comments as the little but may be an even lower value. eg. 100ms.
>
>> +            thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
>> +
>> +            trips {
>> +                cpu_big0_alert: trip-alert {
>> +                    temperature = <85000>;
>> +                    hysteresis = <2000>;
>> +                    type = "passive";
>> +                };
>> +
>> +                cpu_big0_crit: trip-crit {
>> +                    temperature = <100000>;
>> +                    hysteresis = <2000>;
>> +                    type = "critical";
>> +                };
>> +            };
>> +
>> +            cooling-maps {
>> +                map0 {
>> +                    trip = <&cpu_big0_alert>;
>> +                    cooling-device = <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +                             <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +                };
>> +            };
>> +        };
>
> [ ... ]
>
>> +        gpu1-thermal {
>> +            polling-delay = <1000>;
>> +            polling-delay-passive = <250>;
>> +            thermal-sensors = <&lvts_ap MT8188_AP_GPU1>;
>> +
>> +            trips {
>> +                gpu1_alert: trip-alert {
>> +                    temperature = <85000>;
>> +                    hysteresis = <2000>;
>> +                    type = "passive";
>> +                };
>> +
>> +                gpu1_crit: trip-crit {
>> +                    temperature = <100000>;
>> +                    hysteresis = <2000>;
>> +                    type = "critical";
>> +                };
>> +            };
>> +        };
>> +
>> +        gpu2-thermal {
>> +            polling-delay = <1000>;
>> +            polling-delay-passive = <250>;
>> +            thermal-sensors = <&lvts_ap MT8188_AP_GPU2>;
>> +
>> +            trips {
>> +                gpu2_alert: trip-alert {
>> +                    temperature = <85000>;
>> +                    hysteresis = <2000>;
>> +                    type = "passive";
>> +                };
>> +
>> +                gpu2_crit: trip-crit {
>> +                    temperature = <100000>;
>> +                    hysteresis = <2000>;
>> +                    type = "critical";
>> +                };
>> +            };
>
> You can add a devfreq cooling device for the GPU here.

I tried but realized then that GPU support has not been added in the DT yet.
So, I added the gpu node (from vendor's kernel), but there are many missing
dependencies. I guess it should be part of another series.
As a result, I can't add such cooling device here.

Julien

