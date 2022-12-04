Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3957C4321E
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Dec 2022 17:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyVxjv62ICSdTmYSJi3Pk6d9R9ZML1anTEBMQvI7O98=; b=wmG87YLe3SOCcbbgV3LJ5TJfBv
	033R/UeAeR+AatBY5bDz4x0XtSDrfbEIgk8ftEoQvgch40bqOBB7hwD6zxxNRK2y5STpjKmXwnzOL
	AzZECk2xadqPxcCAiKarx9B6vGPAwx7KvhNQqkyoWWWm7pOrAicI8favuZiw6ItnA8NcLrOltCEjG
	ubVmx7pY+DREiv4TBSB5v5AZyphb52cg9TZivfyeTw+b+7xOGKgYsKFkuymSf1bD4QEVOQgI6xGUS
	10OamlUeDqN3z1YzoSo1jPaD6b9iY+9y+Qg5d7qpOsPh4IrAZJDEG2lDjJfQUwZXaps1BJh1N1coV
	PlqMVXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1sny-00A1Oc-UB; Sun, 04 Dec 2022 17:29:30 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1skl-009zct-U0
	for linux-mediatek@lists.infradead.org; Sun, 04 Dec 2022 17:26:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so3640633wms.4
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Dec 2022 09:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IyVxjv62ICSdTmYSJi3Pk6d9R9ZML1anTEBMQvI7O98=;
        b=ZchEcdQe+WoS+hV2IegjeHkiuZJHTsYsZQBliOfBF7yCt8VaH5piuSwzb+ecMWiq9D
         YI4UTS3680++QmeX3hvanqiK3/eBiucfVgE50qKCn4/tTNgqQCnfcWMSYBeU8LDugw/E
         HvVjQ4mLSv03zy6Xcqyeb0I+cNyYWXKIyAu84px63RDwvCIBVfNx3rxvCq1SS8h6CsGQ
         utp6zgTKgOhQsFl+x99BhMkDLK4N63DVM4pCSUL+Elmg0mAbTP7VXP0JkOPFqMGm+E2v
         XNzcHTh1ZWS6kVvMbimUVE5YWFHL2o14A54fpOj409LZ75qRPIl/8IWwWmjaStZY4hEv
         dF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IyVxjv62ICSdTmYSJi3Pk6d9R9ZML1anTEBMQvI7O98=;
        b=LYMo+vSePGuxf8UtiCr5cc0nxG+7w7SHx7uAHHDM9HLsS3cNnZ6U1oiQwjNnIjPzGN
         bgQ/TpvNAnRZsnzDFot9f/1EUjjlSrpgJsNHhFRBRHDllIxZSI5xFuacs5+7EJrBV4xK
         S9/lW6He4Yw/K2uWpQnaCDMLUk8dQs+43QsvV4ZMkS3RmqypMF17WuQRAxCgqQyXk+Tz
         D/NYmMFssMByn8Q2yXAtOEuzQt2w10X8zg6yS9dS13amqrKOH/8agcHAfVck/hTiy2wL
         R0sAIuPZMKrb0NZsJ2QewEY+SAg1T+/BxGdo8DiY8cm9Vlcu4aYekzfCtDyH1mzDS+DN
         V+9Q==
X-Gm-Message-State: ANoB5pkUzHsX88UkyGY/qXyqftfrAU/GnATD07Odpv+/ruHjlxIrIgjl
	ZWhksr1xc6tDNFxLkKxk0znDmw==
X-Google-Smtp-Source: AA0mqf4Dmk6Xhul/0QDQbwXSSkgcxM2Nco1IWbx4FTjdbxA83oGpudrXdh2T3PP9My4vswF6zfR4Uw==
X-Received: by 2002:a05:600c:4386:b0:3cf:a4a6:a048 with SMTP id e6-20020a05600c438600b003cfa4a6a048mr43362304wmn.202.1670174769498;
        Sun, 04 Dec 2022 09:26:09 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id l28-20020a05600c1d1c00b003c6b7f5567csm24874714wms.0.2022.12.04.09.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Dec 2022 09:26:09 -0800 (PST)
Message-ID: <4121bb6b-30db-7a23-f4c8-40afdda7a0b5@linaro.org>
Date: Sun, 4 Dec 2022 18:26:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 4/4] thermal: mediatek: add another get_temp ops for
 thermal sensors
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Michael Kao <michael.kao@mediatek.com>,
 linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com>
 <20221018-up-i350-thermal-bringup-v7-4-ebf08ff2eddb@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221018-up-i350-thermal-bringup-v7-4-ebf08ff2eddb@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_092612_114048_F9D4B66D 
X-CRM114-Status: GOOD (  29.45  )
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

On 18/11/2022 12:04, Amjad Ouled-Ameur wrote:
> Provide thermal zone to read thermal sensor in the SoC. We can read all the
> thermal sensors value in the SoC by the node /sys/class/thermal/
> 
> In mtk_thermal_bank_temperature, return -EAGAIN instead of -EACCESS
> on the first read of sensor that often are bogus values.
> This can avoid following warning on boot:
> 
>    thermal thermal_zone6: failed to read out thermal zone (-13)
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/thermal/mtk_thermal.c | 99 ++++++++++++++++++++++++++++++++-----------
>   1 file changed, 74 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 3a5df1440822..b1f4d19edd4f 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -259,6 +259,11 @@ enum mtk_thermal_version {
>   
>   struct mtk_thermal;
>   
> +struct mtk_thermal_zone {
> +	struct mtk_thermal *mt;
> +	int id;
> +};
> +
>   struct thermal_bank_cfg {
>   	unsigned int num_sensors;
>   	const int *sensors;
> @@ -307,6 +312,8 @@ struct mtk_thermal {
>   
>   	const struct mtk_thermal_data *conf;
>   	struct mtk_thermal_bank banks[MAX_NUM_ZONES];
> +
> +	int (*raw_to_mcelsius)(struct mtk_thermal *mt, int sensno, s32 raw);
>   };
>   
>   /* MT8183 thermal sensor data */
> @@ -709,6 +716,29 @@ static void mtk_thermal_put_bank(struct mtk_thermal_bank *bank)
>   		mutex_unlock(&mt->lock);
>   }
>   
> +static int _get_sensor_temp(struct mtk_thermal *mt, int id)
> +{
> +	u32 raw;
> +	int temp;
> +
> +	const struct mtk_thermal_data *conf = mt->conf;
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
> +	if (temp > 200000)
> +		return -EAGAIN;
> +	else
> +		return temp;
> +}
> +
>   /**
>    * mtk_thermal_bank_temperature - get the temperature of a bank
>    * @bank:	The bank
> @@ -721,26 +751,9 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>   	struct mtk_thermal *mt = bank->mt;
>   	const struct mtk_thermal_data *conf = mt->conf;
>   	int i, temp = INT_MIN, max = INT_MIN;
> -	u32 raw;
>   
>   	for (i = 0; i < conf->bank_data[bank->id].num_sensors; i++) {
> -		raw = readl(mt->thermal_base + conf->msr[i]);
> -
> -		if (mt->conf->version == MTK_THERMAL_V1) {
> -			temp = raw_to_mcelsius_v1(
> -				mt, conf->bank_data[bank->id].sensors[i], raw);
> -		} else {
> -			temp = raw_to_mcelsius_v2(
> -				mt, conf->bank_data[bank->id].sensors[i], raw);
> -		}
> -
> -		/*
> -		 * The first read of a sensor often contains very high bogus
> -		 * temperature value. Filter these out so that the system does
> -		 * not immediately shut down.
> -		 */
> -		if (temp > 200000)
> -			temp = 0;
> +		temp = _get_sensor_temp(mt, i);
>   
>   		if (temp > max)
>   			max = temp;
> @@ -749,9 +762,10 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>   	return max;
>   }
>   
> -static int mtk_read_temp(struct thermal_zone_device *tz, int *temperature)
> +static int mtk_read_temp(struct thermal_zone_device *tzdev, int *temperature)
>   {
> -	struct mtk_thermal *mt = tz->devdata;
> +	struct mtk_thermal_zone *tz = tzdev->devdata;
> +	struct mtk_thermal *mt = tz->mt;
>   	int i;
>   	int tempmax = INT_MIN;
>   
> @@ -770,10 +784,28 @@ static int mtk_read_temp(struct thermal_zone_device *tz, int *temperature)
>   	return 0;
>   }
>   
> +static int mtk_read_sensor_temp(struct thermal_zone_device *tzdev, int *temperature)
> +{
> +	struct mtk_thermal_zone *tz = tzdev->devdata;
> +	struct mtk_thermal *mt = tz->mt;
> +	int id = tz->id - 1;
> +
> +	if (id < 0)
> +		return -EACCES;
> +
> +	*temperature = _get_sensor_temp(mt, id);
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
> @@ -1072,6 +1104,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   	u64 auxadc_phys_base, apmixed_phys_base;
>   	struct thermal_zone_device *tzdev;
>   	void __iomem *apmixed_base, *auxadc_base;
> +	struct mtk_thermal_zone *tz;
>   
>   	mt = devm_kzalloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
>   	if (!mt)
> @@ -1150,6 +1183,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   
>   	mtk_thermal_turn_on_buffer(mt, apmixed_base);
>   
> +	mt->raw_to_mcelsius = (mt->conf->version == MTK_THERMAL_V1) ?
> +				raw_to_mcelsius_v1 : raw_to_mcelsius_v2;
> +
>   	if (mt->conf->version == MTK_THERMAL_V2) {
>   		mtk_thermal_release_periodic_ts(mt, auxadc_base);
>   	}
> @@ -1161,11 +1197,24 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, mt);
>   
> -	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
> -					      &mtk_thermal_ops);
> -	if (IS_ERR(tzdev)) {
> -		ret = PTR_ERR(tzdev);
> -		goto err_disable_clk_peri_therm;
> +	for (i = 0; i < mt->conf->num_sensors + 1; i++) {
> +		tz = devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
> +		if (!tz)
> +			return -ENOMEM;
> +
> +		tz->mt = mt;
> +		tz->id = i;
> +
> +		tzdev = devm_thermal_of_zone_register(&pdev->dev, i, tz, (i == 0) ?
> +							     &mtk_thermal_ops :
> +							     &mtk_thermal_sensor_ops);

Here you use again the aggregation

> +
> +		if (IS_ERR(tzdev)) {
> +			ret = PTR_ERR(tzdev);
> +			if (ret == -ENODEV)
> +				continue;
> +			goto err_disable_clk_peri_therm;
> +		}
>   	}
>   
>   	ret = devm_thermal_add_hwmon_sysfs(tzdev);
> 

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


