Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A5FC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eZipzj07GzNWdtg8hKnzIybeawRK/Zart5hRuTPhrs=; b=F/OXYXn4jEU9TDm/3HkYhaHoAc
	TZ7UQTK4Cwz0p1hqpOLOJpG7hEicczaKJoUSwACcsUSaR9BNF4orY6eh/Z/nQaU6+6cZ9MV6N3VMR
	pBjgpxMTs/WTFNXVzGqMTHlgf0UyLPzUzGIdl489s0x4bfZyvDbOoHA7akEOhgCba2de3/cSEsxLV
	EMpHXdi/yoqjHAQQBJtQL+a+/StOYGx6TmbZ2FT+QJoe/p8m5gUVrDSUi2zFUAWETkG8d6oO/hblQ
	7YlJzQgfzWMJYTn+5q3ZaOYFmbb/IS1vzci4Ff3UUIfkW9uo95P3YwgGw1qNqOAZoi13SkV7jPQcr
	GcedY1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfzi8-000000017Vr-3Ncz;
	Mon, 19 Aug 2024 10:34:04 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfzhD-000000017NW-0jdQ
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Aug 2024 10:33:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-429e29933aaso31188365e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Aug 2024 03:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724063585; x=1724668385; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1eZipzj07GzNWdtg8hKnzIybeawRK/Zart5hRuTPhrs=;
        b=mc84GQI9jWBiDekt2+0Ba72H0ZVkiqxO6yEwr0HZSigFPpuAdOXdwjzhNemDSNv7Yn
         UkIK3MRed19TIullqBi5cW2LRpEvrAYM7EZj0ZguBFm0uv5aBi1WQy4W4H0/MX6dzGz1
         xGvIA9XupplrUPUiNaTU6R3yeqXPiu+XjfJqgJ8sWDz2te3NzcpKrFEm34m+ArEG+A44
         TjgMHvA8ElC3WNHWprXIy46rfQMEBOoKe7G0FiRL2/5Mqyx/qdU/mnFlIbKtWETDN4LG
         IiQXAOpz+cayVkbbU/az8tu+vBM27fQmqG5TD/r20f3HVhFC0RYqNUhXOlb70z6sgTW+
         +G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724063585; x=1724668385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eZipzj07GzNWdtg8hKnzIybeawRK/Zart5hRuTPhrs=;
        b=wBZ8BWEXN5bo8wDWw1MHMTGhWQoxKh/X7fYUaErgjZp4zq0YbANyg5dIzAf873km2C
         sJbq9DpU81qya/KrLJs3Pw8UHcRWYCilHYZEf0G6yl6P+rIUZD80xU6pnB8T0Q26oUCg
         CwrxAuOzhFzvL6IzVK0iOkVB+9J7+0EUSDqWEtJGcIsg8ASUpSqVGzIdfkS9Nu6TjqVz
         FQ7vbcJHiHCbk/LqtQq31+7wNky1tTQOJDNrKVOarkogdWgB2uGDI6Hm72HDkWWOqIin
         tgA0eirBEE5PnPr3mbLWbFSt9nD+f4Vx/mCYpvKTzd/e+dVhVNJ+X9Lswa+t8W2xc4JI
         F+FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDAw80ADu7NVIPfiLUgQirw497rvkiHatAX30gzIB+o4ccBbu2671rCofBOWLeTw72/IG2pc2WuxKQ+ETuXUkgU75JabiJl1hHJxQp2HmPmv97
X-Gm-Message-State: AOJu0YxiDqlCiMuszWCEEGG2Mwxvi6673itvCO7Fx9/hER5O4/V6ucFV
	2Luhgwvy8qxWYweHYDz0i+PaFM+BDB749t1NzHT4mkkHXGs35hlI1n4GG1vlSCs=
X-Google-Smtp-Source: AGHT+IExoZjz8aVKSxb4A/yodmwISVWDZie6lXaITvz4XBbczkl3kuP0YehMESEgRBdiWHoMBZTO1Q==
X-Received: by 2002:a05:600c:4ed3:b0:426:6000:565a with SMTP id 5b1f17b1804b1-429ed7bb030mr62815185e9.16.1724063584418;
        Mon, 19 Aug 2024 03:33:04 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-429ed794739sm103913605e9.43.2024.08.19.03.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 03:33:03 -0700 (PDT)
Message-ID: <66f3361b-00f8-4527-aaa8-d1c302c8ea26@linaro.org>
Date: Mon, 19 Aug 2024 12:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] thermal/drivers/mediatek: add another get_temp ops
 for thermal sensors
To: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 James Lo <james.lo@mediatek.com>, Michael Kao <michael.kao@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Ben Tseng <ben.tseng@mediatek.com>
References: <20240809-auxadc_thermal-v11-1-af36cc74f3a3@chromium.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240809-auxadc_thermal-v11-1-af36cc74f3a3@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_033307_228817_6479FCD5 
X-CRM114-Status: GOOD (  43.49  )
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

On 09/08/2024 10:44, Hsin-Te Yuan wrote:
> From: James Lo <james.lo@mediatek.com>
> 
> Provide thermal zone to read thermal sensor
> in the SoC. We can read all the thermal sensors
> value in the SoC by the node /sys/class/thermal/

Please elaborate a bit more the description to stick to the changes.

What is the difference between MT8183 Kukui devices and older ones, for 
instance ?

> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Signed-off-by: James Lo <james.lo@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Resurrecting this patch specifically for MediaTek MT8183 Kukui devices.
> 
> Changes in V11:
>      - Rebase on kernel v6.11-rc2
>      - Use mtk_thermal_temp_is_valid in mtk_read_sensor_temp just like
>        mtk_thermal_bank_temperature
>      - Change the error handling of devm_thermal_of_zone_register return
>        value
>      - link to V10: https://lore.kernel.org/lkml/20220519101044.16765-1-james.lo@mediatek.com/
> 
> Changes in V10:
>      - Rebase to kernel-v5.18-rc7
>      - Resend
> 
> Changes in V9:
>      - Rebase to kernel-v5.14-rc1
>      - Bind raw_to_mcelsius_v1 or raw_to_mcelsius_v2 to compatible
>        data of struct mtk_thermal_data
>      - Remove duplicate struct 'mtk_thermal_bank'
>      - Remove unnecessary if condition check
>      - Return error if any thermal zone fail to register
> 
> Changes in V8:
>      - Rebase to kernel-v5.13-rc1
>      - Resend
> 
> Changes in v7:
>      - Fix build error in v6.
> 
> Changes in v6:
>      - Rebase to kernel-5.11-rc1.
>      - [1/3]
>          - add interrupts property.
>      - [2/3]
>          - add the Tested-by in the commit message.
>      - [3/3]
>          - use the mt->conf->msr[id] instead of conf->msr[id] in the
>            _get_sensor_temp and mtk_thermal_bank_temperature.
>          - remove the redundant space in _get_sensor_temp and
>            mtk_read_sensor_temp.
>          - change kmalloc to dev_kmalloc in mtk_thermal_probe.
> 
> Changes in v5:
>      - Rebase to kernel-5.9-rc1.
>      - Revise the title of cover letter.
>      - Drop "[v4,7/7] thermal: mediatek: use spinlock to protect PTPCORESEL"
>      - [2/2]
>          -  Add the judgement to the version of raw_to_mcelsius.
> 
> Changes in v4:
>      - Rebase to kernel-5.6-rc1.
>      - [1/7]
>          - Squash thermal zone settings in the dtsi from [v3,5/8]
>            arm64: dts: mt8183: Increase polling frequency for CPU thermal zone.
>          - Remove the property of interrupts and mediatek,hw-reset-temp.
>      - [2/7]
>          - Correct commit message.
>      - [4/7]
>          - Change the target temperature to the 80C and change the commit message.
>      - [6/7]
>          - Adjust newline alignment.
>          - Fix the judgement on the return value of registering thermal zone.
> 
> Changes in v3:
>      - Rebase to kernel-5.5-rc1.
>      - [1/8]
>          - Update sustainable power of cpu, tzts1~5 and tztsABB.
>      - [7/8]
>          - Bypass the failure that non cpu_thermal sensor is not find in thermal-zones
>            in dts, which is normal for mt8173, so prompt a warning here instead of
>            failing.
> 
>      Return -EAGAIN instead of -EACCESS on the first read of sensor that
>          often are bogus values. This can avoid following warning on boot:
> 
>            thermal thermal_zone6: failed to read out thermal zone (-13)
> 
> Changes in v2:
>      - [1/8]
>          - Add the sustainable-power,trips,cooling-maps to the tzts1~tztsABB.
>      - [4/8]
>          - Add the min opp of cpu throttle.
> ---
> 
> ---
>   drivers/thermal/mediatek/auxadc_thermal.c | 71 +++++++++++++++++++++++++++----
>   1 file changed, 63 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> index 9ee2e7283435..8b50d560bbf9 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -847,7 +847,8 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>   
>   static int mtk_read_temp(struct thermal_zone_device *tz, int *temperature)
>   {
> -	struct mtk_thermal *mt = thermal_zone_device_priv(tz);
> +	struct mtk_thermal_bank *bank = thermal_zone_device_priv(tz);
> +	struct mtk_thermal *mt = bank->mt;

Where is used this variable ?

>   	int i;
>   	int tempmax = INT_MIN;
>   
> @@ -866,10 +867,46 @@ static int mtk_read_temp(struct thermal_zone_device *tz, int *temperature)
>   	return 0;
>   }
>   
> +static int mtk_read_sensor_temp(struct thermal_zone_device *tz, int *temperature)
> +{
> +	struct mtk_thermal_bank *bank = thermal_zone_device_priv(tz);
> +	struct mtk_thermal *mt = bank->mt;
> +	const struct mtk_thermal_data *conf = mt->conf;
> +	int id = bank->id - 1;
> +	int temp = INT_MIN;
> +	u32 raw;
> +
> +	if (id < 0)
> +		return  -EACCES;

This test should not be done here:

1. EACCES is permission denied

2. The bank id should be checked at init time

> +
> +	raw = readl(mt->thermal_base + conf->msr[id]);
> +
> +	temp = mt->raw_to_mcelsius(mt, id, raw);
> +
> +	/*
> +	 * The first read of a sensor often contains very high bogus
> +	 * temperature value. Filter these out so that the system does
> +	 * not immediately shut down.
> +	 */
> +
> +	if (!mtk_thermal_temp_is_valid(temp)) {

unlikely(!mtk_thermal_temp_is_valid(temp)) ?

> +		temp = THERMAL_TEMP_INVALID;

What is the point of assigning this value and return just after ?

> +		return -EAGAIN;
> +	}
> +
> +	*temperature = temp;
> +
> +	return 0;
> +}
> +
>   static const struct thermal_zone_device_ops mtk_thermal_ops = {
>   	.get_temp = mtk_read_temp,
>   };
>   
> +static const struct thermal_zone_device_ops mtk_thermal_sensor_ops = {
> +	.get_temp = mtk_read_sensor_temp,
> +};
> +
>   static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
>   				  u32 apmixed_phys_base, u32 auxadc_phys_base,
>   				  int ctrl_id)
> @@ -1199,6 +1236,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   	u64 auxadc_phys_base, apmixed_phys_base;
>   	struct thermal_zone_device *tzdev;
>   	void __iomem *apmixed_base, *auxadc_base;
> +	struct mtk_thermal_bank *tz;
>   
>   	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
>   	if (!mt)
> @@ -1285,14 +1323,31 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   			mtk_thermal_init_bank(mt, i, apmixed_phys_base,
>   					      auxadc_phys_base, ctrl_id);
>   
> -	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
> -					      &mtk_thermal_ops);
> -	if (IS_ERR(tzdev))
> -		return PTR_ERR(tzdev);
> +	for (i = 0; i < mt->conf->num_sensors + 1; i++) {

Why "num_sensors + 1" ?

> +		tz = devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
> +		if (!tz)
> +			return -ENOMEM;
> +
> +		tz->mt = mt;
> +		tz->id = i;
> +
> +		tzdev = devm_thermal_of_zone_register(&pdev->dev, i,
> +				tz, (i == 0) ?
> +				&mtk_thermal_ops : &mtk_thermal_sensor_ops);

Don't you want to keep the init routine and depending on the platform 
add the loop with the extra sensors ? That may help to make the code 
cleaner instead of doing tests like (i == 0) ? &mtk_thermal_ops : 
&mtk_thermal_sensor_ops

> +		if (IS_ERR(tzdev)) {
> +			if (PTR_ERR(tzdev) == -ENODEV) {
> +				dev_warn(&pdev->dev, "can't find thermal sensor %d\n", i);
> +				continue;
> +			}
> +			if (PTR_ERR(tzdev) != -EACCES)

The id correctness should be checked in this loop, not rely on a EACCES 
returned by a implicit call to thermal_zone_get_temp()

> +				return PTR_ERR(tzdev);
> +		}
>   
> -	ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
> -	if (ret)
> -		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
> +		ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
> +		if (ret)
> +			dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs: %d\n", ret);
> +	}
>   
>   	return 0;
>   }
> 
> ---
> base-commit: ee9a43b7cfe2d8a3520335fea7d8ce71b8cabd9d
> change-id: 20240809-auxadc_thermal-9be338ec8b1c
> 
> Best regards,


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

