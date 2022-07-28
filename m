Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE2BC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 08:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AF0C8l8seSrzx2WmUBIWSdZqGWfFBtfpdLun9U6Kz8=; b=Xk6aAxpdntXy7jrVr+oHiIaBoM
	uziYmSya0LI3akAJaY8gpfFdQaA9CKHIr+Joouo2a1Q9reZoyWTIrSX1A3RV/EHTCctD3o7Fqx/Nl
	yuwxwwuSpt6PYW5rZbhK7MtOZJl5ESqT6H/Toj5InTG8kDxQfSEs+XjQ1y4ehVJyLRXM7ERhbRQkJ
	8b969X6n/wsVywGkHhK4Lzim1gxksAJSoQxs4H4umn+EhgPl7irVHb7h8OKT7/4D0hYwf4D3tYtI8
	075SPO2VyGT/4kuPYkftENigxpOdoEJBhCfwiy1lVP7+bsc9iXz4fFVtzpYO9ApoqwwUJoGwOCo7e
	Phbft7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGzHL-005yd8-Hi; Thu, 28 Jul 2022 08:53:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGzHB-005yW8-9s
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 08:53:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id l4so1283973wrm.13
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 01:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=9AF0C8l8seSrzx2WmUBIWSdZqGWfFBtfpdLun9U6Kz8=;
        b=mP/mmTrHM6/k6VQpQzfSYKo6wM/3/z+WB1b8AnfbQRmYSGYo2t1YFLoEixZuoBhuPa
         UvwY/bfbiI1uveHGmETaK6nuicHscsF/pNv7VhlbF+eeKKvhO2fJwzdDDcLkTsaAWf97
         /JUhjOFMU/gtHAeg84LBUq0TGc3iMe7bxaxkY6gVCzMumA1b6dkhX+4a5BdRjWSDQj8z
         LTmPqw6LTmwqIYYlHgTuQdE0ynLn2ouVfuDmtpzyXT+qDxveLv1U8r7ZXkOn6EC3Rloz
         fVgoWX3H2vNK2SGhXDa5k0WcYY9uXbdoAopMfF9+T77xzkIk5fZc99Fpi9boaQ1IL9fE
         5ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=9AF0C8l8seSrzx2WmUBIWSdZqGWfFBtfpdLun9U6Kz8=;
        b=yJO4pudBoLR6kME/kW+k06E21exwj9+8sCrfAI0IR7yUMpxQWxz3GaR8ySDyRpMZrx
         JrlNJRHuFxjlot5HTsp87u6zw0ucvTzFFvJ+XjSfWdYaut+YgxJc3P5o68mYTfxtm6NM
         enR1XeraIAPMN0jhgjlwrV56hPyh7oxyO0ovUqla2zSUYdoN0Gaq4pnLgZG3idHgr3ic
         rHWNQaCvipGV5uTKSsruODrAzKQdIJbwKnMx6HFojoXp9SlPTDzbihEBZEG5q/BmGjvO
         iMDbPezDR5YgQfFoIVh1aaVG2O+C//vkGv4/0VGqildNYDKxwq6lPCxyK6qJ2wAkt3bH
         Y3Gw==
X-Gm-Message-State: AJIora87kNJNJBkxuFHA3O3szZaU8LaSBDceqL+ZboQl5E4VIIyWf/h8
	5As38V91KWKgCE8VuUPQnZd1QA==
X-Google-Smtp-Source: AGRyM1tjAGtsAciOHE5CsBzVumOndSP4m4ERcdH7oyhmbdFq+OGEyGoruEpjxxeh3gBxCpR4A3Ahdw==
X-Received: by 2002:a05:6000:1789:b0:21e:87cd:beba with SMTP id e9-20020a056000178900b0021e87cdbebamr13229704wrg.252.1658998425382;
        Thu, 28 Jul 2022 01:53:45 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:65a8:ebd8:4098:d9d0? ([2a05:6e02:1041:c10:65a8:ebd8:4098:d9d0])
        by smtp.googlemail.com with ESMTPSA id n18-20020a5d67d2000000b0020fff0ea0a3sm293465wrw.116.2022.07.28.01.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 01:53:45 -0700 (PDT)
Message-ID: <24250d03-b25f-e521-5abd-f36109885c36@linaro.org>
Date: Thu, 28 Jul 2022 10:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 1/6] thermal: mediatek: Relocate driver to mediatek
 folder
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>, rafael@kernel.org,
 rui.zhang@intel.com, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220726135506.485108-1-bchihi@baylibre.com>
 <20220726135506.485108-2-bchihi@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220726135506.485108-2-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_015349_458090_2C13EE42 
X-CRM114-Status: GOOD (  22.32  )
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


Hi Balsam,

On 26/07/2022 15:55, Balsam CHIHI wrote:
> Add Mediatek proprietary folder to upstream more thermal zone and cooler
> drivers. Relocate the original thermal controller driver to it and rename
> as soc_temp.c to show its purpose more clearly.

I realize the Kconfig, Makefiles format are not consistent across the 
boards. Before I fix this, you can comply to the format:

drivers/thermal/Kconfig:

menu "Mediatek thermal drivers"
depends on ARCH_MEDIATEK || COMPILE_TEST
source "drivers/thermal/mediatek/Kconfig"
endmenu

drivers/thermal/Makefile:

-obj-$(CONFIG_MTK_THERMAL)      += mtk_thermal.o
+obj-y                          += mediatek

drivers/thermal/mediatek/Kconfig:

config MTK_SOC_THERMAL
	tristate "Temperature sensor driver for MediaTek SoCs"
	depends on HAS_IOMEM
	depends on NVMEM
	depends on RESET_CONTROLLER
	help
		Enable this option if you want to get SoC temperature
		information for MediaTek platforms. This driver
		configures thermal controllers to collect temperature
		via AUXADC interface.

drivers/thermal/mediatek/Makefile:

obj-$(MTK_SOC_THERMAL)	+= soc_temp.o

However, rename 'soc_temp' to something more SoC explicit, eg. 
mtxxx_thermal.c

Thanks

   -- Daniel


> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>

> ---
>   drivers/thermal/Kconfig                       | 14 ++++-------
>   drivers/thermal/Makefile                      |  2 +-
>   drivers/thermal/mediatek/Kconfig              | 23 +++++++++++++++++++
>   drivers/thermal/mediatek/Makefile             |  1 +
>   .../{mtk_thermal.c => mediatek/soc_temp.c}    |  0
>   5 files changed, 29 insertions(+), 11 deletions(-)
>   create mode 100644 drivers/thermal/mediatek/Kconfig
>   create mode 100644 drivers/thermal/mediatek/Makefile
>   rename drivers/thermal/{mtk_thermal.c => mediatek/soc_temp.c} (100%)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 0e5cc948373c..ecba8d6e313b 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -412,16 +412,10 @@ config DA9062_THERMAL
>   	  zone.
>   	  Compatible with the DA9062 and DA9061 PMICs.
>   
> -config MTK_THERMAL
> -	tristate "Temperature sensor driver for mediatek SoCs"
> -	depends on ARCH_MEDIATEK || COMPILE_TEST
> -	depends on HAS_IOMEM
> -	depends on NVMEM || NVMEM=n
> -	depends on RESET_CONTROLLER
> -	default y
> -	help
> -	  Enable this option if you want to have support for thermal management
> -	  controller present in Mediatek SoCs
> +menu "Mediatek thermal drivers"
> +depends on ARCH_MEDIATEK || COMPILE_TEST
> +source "drivers/thermal/mediatek/Kconfig"
> +endmenu
>   
>   config AMLOGIC_THERMAL
>   	tristate "Amlogic Thermal Support"
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index def8e1a0399c..3c00e864ad55 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -55,7 +55,7 @@ obj-y				+= st/
>   obj-$(CONFIG_QCOM_TSENS)	+= qcom/
>   obj-y				+= tegra/
>   obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
> -obj-$(CONFIG_MTK_THERMAL)	+= mtk_thermal.o
> +obj-$(CONFIG_MTK_THERMAL)	+= mediatek/
>   obj-$(CONFIG_GENERIC_ADC_THERMAL)	+= thermal-generic-adc.o
>   obj-$(CONFIG_UNIPHIER_THERMAL)	+= uniphier_thermal.o
>   obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
> diff --git a/drivers/thermal/mediatek/Kconfig b/drivers/thermal/mediatek/Kconfig
> new file mode 100644
> index 000000000000..9c41e9079fc3
> --- /dev/null
> +++ b/drivers/thermal/mediatek/Kconfig
> @@ -0,0 +1,23 @@
> +config MTK_THERMAL
> +	tristate "MediaTek thermal drivers"
> +	depends on THERMAL_OF
> +	help
> +		This is the option for MediaTek thermal software
> +		solutions. Please enable corresponding options to
> +		get temperature information from thermal sensors or
> +		turn on throttle mechaisms for thermal mitigation.
> +
> +if MTK_THERMAL
> +
> +config MTK_SOC_THERMAL
> +	tristate "Temperature sensor driver for MediaTek SoCs"
> +	depends on HAS_IOMEM
> +	depends on NVMEM
> +	depends on RESET_CONTROLLER
> +	help
> +		Enable this option if you want to get SoC temperature
> +		information for MediaTek platforms. This driver
> +		configures thermal controllers to collect temperature
> +		via AUXADC interface.
> +
> +endif
> diff --git a/drivers/thermal/mediatek/Makefile b/drivers/thermal/mediatek/Makefile
> new file mode 100644
> index 000000000000..4b4cb04a358f
> --- /dev/null
> +++ b/drivers/thermal/mediatek/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_MTK_SOC_THERMAL)		+= soc_temp.o
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mediatek/soc_temp.c
> similarity index 100%
> rename from drivers/thermal/mtk_thermal.c
> rename to drivers/thermal/mediatek/soc_temp.c


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

