Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D7FC19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 18:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OauzY5NPoVxR96fxdrgvniM7lN8jaUTrviVvH2IM4yU=; b=X1DgmAkiaK+2DuNNOaCpZMWOTL
	zZSIIuqoFLwwBKMedEObFzhYwk6wlaIVr3+gmHvT6h+auTT6cZSxYQ30CaTfnvSfG2yGpXnbW7HQ2
	TWRyM/lFlE7q1oDoCZutTmFYIqF4660pTjnOStAUHPOZvNJTX3WmCaV4MN9J49ExODsDzmVR4OMRv
	zBSMcCXmq8iUSsQGGEQRUdoOoRni45Q3VtV6BUZ67n1j7D9v4kvtuRoUfEWTe3blNkLVxXmL/fqp+
	eAff+T5sjeJ0V20NPwEIySB+tyAEqKCbyKBIWo9FQ/kEJN2C2Es6Zixq2EZdP8lTOe60Z69EP6vRp
	cDZTX+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJfOY-0088A8-AP; Thu, 04 Aug 2022 18:16:30 +0000
Received: from [2601:1c0:6280:3f0::a6b3]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJfNm-0087nh-M4; Thu, 04 Aug 2022 18:15:42 +0000
Message-ID: <30e4c6a0-cd8e-5a86-ac25-ac2af5ec53dd@infradead.org>
Date: Thu, 4 Aug 2022 11:15:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8.1, 4/7] thermal: mediatek: Add LVTS driver for mt8192
 thermal zones
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
References: <20220804130912.676043-1-bchihi@baylibre.com>
 <20220804130912.676043-5-bchihi@baylibre.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220804130912.676043-5-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi--

On 8/4/22 06:09, bchihi@baylibre.com wrote:
> diff --git a/drivers/thermal/mediatek/Kconfig b/drivers/thermal/mediatek/Kconfig
> index 592c849b9fed..afef43a0e7ca 100644
> --- a/drivers/thermal/mediatek/Kconfig
> +++ b/drivers/thermal/mediatek/Kconfig
> @@ -20,4 +20,28 @@ config MTK_SOC_THERMAL
>  	  configures thermal controllers to collect temperature
>  	  via AUXADC interface.
>  
> +config MTK_LVTS_THERMAL
> +	tristate "LVTS (Low Voltage Thermal Sensor) driver for MediaTek SoCs"
> +	depends on HAS_IOMEM
> +	depends on NVMEM
> +	depends on RESET_CONTROLLER
> +	help
> +	  Enable this option if you want to get SoC temperature
> +	  information for MediaTek platforms. This driver configures
> +	  LVTS (Low Voltage Thermal Sensor) thermal controllers to
> +	  collect temperatures via ASIF (Analog Serial Interface).
> +
> +if MTK_LVTS_THERMAL
> +
> +config MTK_LVTS_V4
> +	tristate "LVTS V4 Thermal Driver for MediaTek SoCs"
> +	depends on HAS_IOMEM
> +	depends on NVMEM
> +	depends on RESET_CONTROLLER

You shouldn't need to repeat all of these "depends on" lines since this
Kconfig symbol depends on MTK_LVTS_THERMAL, which already depends on these
3 items.

Have you seen any issue that this is supposed to fix?

> +	help
> +	  Enable this option if you want to get SoC temperature
> +	  information for LVTS V4.
> +
> +endif

thanks.
-- 
~Randy

