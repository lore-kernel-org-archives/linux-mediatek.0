Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F11C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 21:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03i7qT/bOEhlhB476GbreCqcdErHUJCrrgWy4C2d7cc=; b=227yNUKAeh/1PARFmaOXfM09em
	6MB+FL/jjy/Cv2UE9GRpH8ZaeRsmS7o/A33Q6EcD/oZxwxL26KX8Y4HnbSEt4V9Xm+flzh42nbbMU
	Tm/CbWMyIs/zRmnsfykEGj5Vn//RTcnSc0lYqmFmrYqDxHLOHmStn1gSBXbOY2jA52+gk8XJ3BgGK
	y1Pfh3FwgjxN+LTXPS6RoMoAOAOXldXT8hbErES2DOyy4q9vnbEnw71pQB6O5kOB0HdDQ1okRfGrY
	M+VFVCAXuBf07XqxhdKD1JWFKMSojujm+/fPraDJ2jNG6sZes0qiHjgVwzriy+JoyjQcKWMY80HCT
	hjJZE8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWaG-00Gago-M7; Fri, 27 Jan 2023 21:48:32 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLWa4-00Gaeq-SB
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 21:48:22 +0000
Received: by mail-wm1-x330.google.com with SMTP id fl24so4378070wmb.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 13:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=03i7qT/bOEhlhB476GbreCqcdErHUJCrrgWy4C2d7cc=;
        b=qwtgCYUpV5Fv3GJ7CPN54R+GV1pSzXNmg118RZuZ5+V3wmeMdFLMx9orn748vKn4CU
         KqcNpqTsyr2vf+FumPwdV3wdGqnGrov6/G7bLj401OU4xYhVF8K5Zn5yTqBd5qI/mVOW
         9K+FGBQqgqMVIU8I71TOqSii8D1tfUvp+aN+N/bYncKoZrDGJWM61KDzTx43Fj3NKKsu
         fQZyvteJuyS1QMjO+/5TYhjrvcYhW9fM6tkWGtj1dgSPqPjtmsVzBvTPAHrYbLpGqqbT
         3IDa5O4Dw7objupsG0ztBjjhH2l55NM68MtRqpRxCuHTzuUNBS2YWs5XS/S16Ae/TEaI
         1y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03i7qT/bOEhlhB476GbreCqcdErHUJCrrgWy4C2d7cc=;
        b=kU684J9CajPgCd8hF8KdW9ZeFtJrQLsQreCJW5gToKUZ0+j6Jl7eYqWPiSCEAl2h8m
         lK+GfZXYw3vjNnAExSmESFP/ySpSTcy7stNG7XFkMM0+OsSAyfcdrY8q25JS6DuSxN5n
         Hhrv+2Zopt9NPva+XXUnSb77E/B6CIqED34f2/NqnORMHRugmImOBRve112+6XjaUdy7
         xnecPMXSsGqVaAyhReWT4CKqoTTsxn0l2wYoMCXUvstFK1j685Ls1HX0lu3u7VkqszPr
         nJnGd5qipQS3CkvKy/+uzKD4TANZUMBuHHQOhPzwXm4/itdGL9ruj0p6uVlgRzpqsezb
         fvsw==
X-Gm-Message-State: AFqh2kr74zEo9R8WdWKeJEoCL4uj6+PUWdrSKnSS7+hJ6XHmOfnNE6Iz
	s57+8a+LRxgzK9l1f9kuhAcDSQ==
X-Google-Smtp-Source: AMrXdXttD4LDn8SoPtg9fpxJbj18KNz1xRiz0VNsCXe6vbbssiJrZtQlVrv7yNq86Xr/VbufC7OnxQ==
X-Received: by 2002:a05:600c:1d05:b0:3d2:3be4:2d9a with SMTP id l5-20020a05600c1d0500b003d23be42d9amr39759623wms.20.1674856099257;
        Fri, 27 Jan 2023 13:48:19 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm5403705wmn.19.2023.01.27.13.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 13:48:18 -0800 (PST)
Message-ID: <eb3b9439-172b-daea-8f0f-53c8fe7648f9@linaro.org>
Date: Fri, 27 Jan 2023 22:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 2/5] thermal: mediatek: control buffer enablement
 tweaks
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Michael Kao <michael.kao@mediatek.com>
References: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
 <20221018-up-i350-thermal-bringup-v9-2-55a1ae14af74@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221018-up-i350-thermal-bringup-v9-2-55a1ae14af74@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_134820_956806_970AB27D 
X-CRM114-Status: GOOD (  23.42  )
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

On 27/01/2023 16:44, Amjad Ouled-Ameur wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> Add logic in order to be able to turn on the control buffer on MT8365.
> This change now allows to have control buffer support for MTK_THERMAL_V1,
> and it allows to define the register offset, and mask used to enable it.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/thermal/mtk_thermal.c | 25 ++++++++++++++++++-------
>   1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 8440692e3890..d8ddceb75372 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -271,6 +271,9 @@ struct mtk_thermal_data {
>   	bool need_switch_bank;
>   	struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
>   	enum mtk_thermal_version version;
> +	u32 apmixed_buffer_ctl_reg;
> +	u32 apmixed_buffer_ctl_mask;
> +	u32 apmixed_buffer_ctl_set;
>   };
>   
>   struct mtk_thermal {
> @@ -514,6 +517,9 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
>   	.adcpnp = mt7622_adcpnp,
>   	.sensor_mux_values = mt7622_mux_values,
>   	.version = MTK_THERMAL_V2,
> +	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
> +	.apmixed_buffer_ctl_mask = GENMASK(31, 6) | BIT(3),
> +	.apmixed_buffer_ctl_set = BIT(0),
>   };
>   
>   /*
> @@ -963,14 +969,18 @@ static const struct of_device_id mtk_thermal_of_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, mtk_thermal_of_match);
>   
> -static void mtk_thermal_turn_on_buffer(void __iomem *apmixed_base)
> +static void mtk_thermal_turn_on_buffer(struct mtk_thermal *mt,
> +				       void __iomem *apmixed_base)
>   {
> -	int tmp;
> +	u32 tmp;
> +
> +	if (!mt->conf->apmixed_buffer_ctl_reg)
> +		return;
>   
> -	tmp = readl(apmixed_base + APMIXED_SYS_TS_CON1);
> -	tmp &= ~(0x37);
> -	tmp |= 0x1;
> -	writel(tmp, apmixed_base + APMIXED_SYS_TS_CON1);
> +	tmp = readl(apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
> +	tmp &= mt->conf->apmixed_buffer_ctl_mask;
> +	tmp |= mt->conf->apmixed_buffer_ctl_set;
> +	writel(tmp, apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
>   	udelay(200);
>   }
>   
> @@ -1070,8 +1080,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   		goto err_disable_clk_auxadc;
>   	}
>   
> +	mtk_thermal_turn_on_buffer(mt, apmixed_base);
> +
>   	if (mt->conf->version == MTK_THERMAL_V2) {
> -		mtk_thermal_turn_on_buffer(apmixed_base);
>   		mtk_thermal_release_periodic_ts(mt, auxadc_base);
>   	}

This change conflicts with commit 4f2ee0aa2e706

I fixed it with:

-       if (mt->conf->version != MTK_THERMAL_V1) {
-               mtk_thermal_turn_on_buffer(apmixed_base);
+       mtk_thermal_turn_on_buffer(apmixed_base);
+
+       if (mt->conf->version != MTK_THERMAL_V1)
                 mtk_thermal_release_periodic_ts(mt, auxadc_base);
-       }

Let me know if there is something wrong.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


