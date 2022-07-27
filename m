Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2336C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HysjlYsjJysZq6LqAV/+SlcyahiTlz2g4ir099gJxbw=; b=jA72myJEHY5yPvhNMzMAdIQTbF
	+KPtkdKqcQSfmVBmfxliz2gKmVYtLDKi1vXpXMWPZZq5MVO3ZeF5ThKiD+zn/CF4CwP0qtNvbB8px
	gv9cPWOGAV/WRg6pJTiO61wjvjPcm7XrYHBEIfRb26xFuSMtXU0MNKKAiwSBMqopxdbm7P6PvvQSk
	xtJAFV6Knv9g7XGzKwn72+TAJ/eu0qKq/sSHCkXJeW2lwEPdoXtmfM0DpY+RSfPLY13kuSx1VUnWM
	3W3aYe4ZEoTBjldWcFOj3aEtBtChhEYK+Vnc/x5Fs7F/qKFMoXsrsJkyGhX6BDdq4Co7cwDnGKCgI
	620k7gFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcLr-00B7Fe-Pc; Wed, 27 Jul 2022 08:25:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcLY-00B70b-Lm; Wed, 27 Jul 2022 08:24:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 22B476601B12;
	Wed, 27 Jul 2022 09:24:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658910287;
	bh=8b3gB2PEEzP1TsEwR0L1dzW3+hdJVSaWwUA09H63Z24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WEgQcI3Ilp323F8vWcBDY+Uaz6wE6HfeMlV4T85u/Ccbfmd4BL3mRvSN3T4654JwN
	 MLoMJfi+Alskj6prf8IMPW0W3HptSXUdR24MaiY4VqfkQTXRisC1JOqSO3sAv4fjpZ
	 ETEWiBciryZWXLN0d7vEMdIpu3kcW9KxMTaQls6NKr7rL6lOQgageWQa68USWhV2Xg
	 e1IfbSHBK890D+e1mCQ43wyD8+hcDO5HdkONAVouFnZxR5s26zjjxCHGLmsgR8lt/W
	 VBfaA0Sdze9GvlCVgum9zv33uAozJCoPkA+c40jJkWt4+FKKuCOn+3e043Jdgir2Yk
	 p4U11EHNPu0UQ==
Message-ID: <3cb97e73-d60a-086d-83c2-1711c70057a2@collabora.com>
Date: Wed, 27 Jul 2022 10:24:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 1/6] thermal: mediatek: Relocate driver to mediatek
 folder
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>, rafael@kernel.org,
 rui.zhang@intel.com, daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220726135506.485108-1-bchihi@baylibre.com>
 <20220726135506.485108-2-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726135506.485108-2-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_012448_877608_D325CEB6 
X-CRM114-Status: GOOD (  20.58  )
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

Il 26/07/22 15:55, Balsam CHIHI ha scritto:
> Add Mediatek proprietary folder to upstream more thermal zone and cooler
> drivers. Relocate the original thermal controller driver to it and rename
> as soc_temp.c to show its purpose more clearly.
> 
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

Sorry, I just noticed that the indentation must be fixed.

	help
	  This is the option .....

Thanks,
Angelo

