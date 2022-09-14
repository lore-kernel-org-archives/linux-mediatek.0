Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5B0C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 11:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVBCdgLWX5qT0Ly3b6+ZvBOoJA38Kr8cbw1231lSIPE=; b=081sX8pJsWX7PcOmSXrnCntKR0
	/QAq0BXZBBL2Kiuqnf4OvQhYkN6cHUiG9ZRWVVTJ0YEhRn1m3cSO+PjzTkZmp31ES4Rw422/SEZiv
	3OIFG1uJlZPayh65G7eYxPh7CpH6a+mk5lPBgZYp91M89ZznhQ5BQtqlSHkNpPgYO3e1mfK/v616t
	enLN4OH+KgRW83cYGo9Lf8ZMxe7WsgQRP5v31Cl+zJ7+9vW5rJFCiIwkdbTR/S2RtxxPSQC6IWCOc
	/guA1FSB+6+Cg45o6Xu4ordNC0y+AKuj7606t3lpwDSkuHSmRRZmLd8l4FBLwBQp2VzERqolNcbnr
	bMkvcjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYR38-00GcPS-2x; Wed, 14 Sep 2022 11:59:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYR2P-00GbSn-5d; Wed, 14 Sep 2022 11:58:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4CCC36601D9B;
	Wed, 14 Sep 2022 12:58:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663156716;
	bh=shSymtIAxGsCHrnbATpRaFoRfpKmWQ0G2qmKifjEWQ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OI18wQE+hAXB+BPsNMLhS4Fcg4vEbzpxLY8CRUGvYkZvTJaoBhrl4dXnYv0gE5Pvu
	 QNQRUikenrDUMNPBAQzn1IG4je905fA2B4PbGiq/TXXcEdcBZyliFcRmF1ODAExZx9
	 /8XIb1AGQYWphZG3+GBUBbSkBI2/qRTY3xwoV3i6qCj/iHq+M68KIMyTXHwLrjo96E
	 LCNyrFANVNsZvA8uJJ3IKWJNiYtCmqTjHj87LLe5Cb5FA3OFJE0aaRwzS/l4T6qRJu
	 L96oOwx7leewIwSEm1pgcUuxb46OafzKoDwwlyZsHlQZEsvmjLPfgywFriphG8jXyi
	 OcgcdTp/hpzKw==
Message-ID: <48cb4f47-754c-9994-2489-7ffabfc1b3b9@collabora.com>
Date: Wed, 14 Sep 2022 13:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9,1/7] thermal: mediatek: Relocate driver to mediatek
 folder
Content-Language: en-US
To: bchihi@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
 daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220817080757.352021-1-bchihi@baylibre.com>
 <20220817080757.352021-2-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220817080757.352021-2-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_045841_619165_DDF508EC 
X-CRM114-Status: GOOD (  23.34  )
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

Il 17/08/22 10:07, bchihi@baylibre.com ha scritto:
> From: Michael Kao <michael.kao@mediatek.com>
> 
> Add MediaTek proprietary folder to upstream more thermal zone and cooler
> drivers, relocate the original thermal controller driver to it, and rename it
> as "auxadc_thermal.c" to show its purpose more clearly.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Co-developed-by: Ben Tseng <ben.tseng@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Co-developed-by: Balsam CHIHI <bchihi@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>   drivers/thermal/Kconfig                       | 14 ++++--------
>   drivers/thermal/Makefile                      |  2 +-
>   drivers/thermal/mediatek/Kconfig              | 22 +++++++++++++++++++
>   drivers/thermal/mediatek/Makefile             |  1 +
>   .../auxadc_thermal.c}                         |  2 +-
>   5 files changed, 29 insertions(+), 12 deletions(-)
>   create mode 100644 drivers/thermal/mediatek/Kconfig
>   create mode 100644 drivers/thermal/mediatek/Makefile
>   rename drivers/thermal/{mtk_thermal.c => mediatek/auxadc_thermal.c} (99%)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index e052dae614eb..d35f63daca3b 100644
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
> index def8e1a0399c..f7daeb8056c4 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -55,7 +55,7 @@ obj-y				+= st/
>   obj-$(CONFIG_QCOM_TSENS)	+= qcom/
>   obj-y				+= tegra/
>   obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
> -obj-$(CONFIG_MTK_THERMAL)	+= mtk_thermal.o
> +obj-y				+= mediatek/
>   obj-$(CONFIG_GENERIC_ADC_THERMAL)	+= thermal-generic-adc.o
>   obj-$(CONFIG_UNIPHIER_THERMAL)	+= uniphier_thermal.o
>   obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
> diff --git a/drivers/thermal/mediatek/Kconfig b/drivers/thermal/mediatek/Kconfig
> new file mode 100644
> index 000000000000..8ff32370b591
> --- /dev/null
> +++ b/drivers/thermal/mediatek/Kconfig
> @@ -0,0 +1,22 @@
> +config MTK_THERMAL
> +	tristate "MediaTek thermal drivers"
> +	depends on THERMAL_OF
> +	help
> +	  This is the option for MediaTek thermal software solutions.
> +	  Please enable corresponding options to get temperature
> +	  information from thermal sensors or turn on throttle
> +	  mechaisms for thermal mitigation.
> +
> +if MTK_THERMAL
> +
> +config MTK_SOC_THERMAL
> +	tristate "AUXADC temperature sensor driver for MediaTek SoCs"
> +	depends on HAS_IOMEM
> +	depends on NVMEM

That's not true. This driver doesn't depend on NVMEM, as in function
mtk_thermal_get_calibration_data(), the calibration params are initialized
with default values and if no "calibration-data" cell was found, it will
return 0 and simply go on with probing... and this is because not all SoCs
need calibration data from eFuses.
If you check carefully, the original entry says "NVMEM || NVMEM=n".

Please drop the NVMEM dependency from this config entirely.

> +	depends on RESET_CONTROLLER

While at it, can you please also drop the dependency for RESET_CONTROLLER?
I know it was present on the original config entry, but that's wrong, as
the driver doesn't strictly require resets, as it uses device_reset_optional().


Regards,
Angelo


