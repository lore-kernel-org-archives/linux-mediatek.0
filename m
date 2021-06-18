Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A64AC48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 13:57:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E49AB6117A
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 13:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E49AB6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d/xqyLYNleq5ZLaJ0cWDoDxXrRtVk7VOn+azYLMyI5c=; b=COMo99SmSAk9oc+QYukd8DzXP9
	3PPkscxsEOCOIU+rDH/8R/4QXv6qgtbvfMqL1t9YAz8Dsa6hgs0KOVP70mokPgFRtMqDtihdU6zoI
	FErXDYPt/U00wD01Jj4AjMTn6Wlug8f1AQnfmaYcTzp6FLFTMROJJtKAF/QqW4yAY62XBWQr1F4sZ
	5/UgjqTwq3yzhTZ5T3u1X/xq5RS54WJ60899fpRNhdYTD6wj8gsU+aP4vsRHx+5BlCAV6resmzwTC
	7/UnGXcOT3Aj8meECwYZi3toPQbnALZbGQyJ22glQQTyexiMjn70hOJ5F1OyuTboGSQ8kn1zIX2UV
	XkSV+WiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luEzL-00ENHF-6w; Fri, 18 Jun 2021 13:56:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luEzI-00ENFy-7T; Fri, 18 Jun 2021 13:56:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id y7so10837347wrh.7;
 Fri, 18 Jun 2021 06:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xizm99JD150ezeQOoH2mePCgmp/xdHQI0Sa2KlLfCYE=;
 b=kKFnimk0jGW0TVeqyZvO9ZxJpyRHln7vCrqNXdpfwxdm8HeoiDdp/JWycfazuaTE1U
 x5lpZep/wsAds82Qeb4HKQaRLfhJffWrBjo8emSMoJzVcwNRDusWywVVQY/j+0AYEpKu
 9086iEZngkzZucesNWjpGG0b1PMX3y4Mty6oLJoD1OhD6LHowCJgg078feaYjxe4n93o
 UahRsBdHGDkfKL43kzVygIvtwyoi/j1PEp9lIvWiDgTjUeJfYme4VRO0EY+4/mmU4R5+
 Tjy4WQLsKY2TaL17SaH7xLLjwVX4iQuW8IlhgtOHKkXdBAI/HR9WIERg36qaCPtrHIRz
 YUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xizm99JD150ezeQOoH2mePCgmp/xdHQI0Sa2KlLfCYE=;
 b=Gmz7aD5d2DRfDrr61AnCPcw7jvaHiNlq3lu++fCLs3d+GQbUmi36Kphs0n9ocJsvYC
 qpXL6umeTy8RL+XVna/Drif2Y2DkE80PEd7uDiATnZMBcDR+yVrNpww0M5g0EV1OPP0D
 zLw+FvGGLbHqBpjcg3W9kutLZgD1Wec7fkuup7bI61cgzHb4ZM8SBx3QjSp+qVkh18uu
 Z6R1AGTBCiHZqVlNE3NKjtzUCD8A5DXfNefCXcFiJSKM1bawzDYbw3fnjz02J87envYm
 1o/UDI9NyBQu3BB/3umJOo52YOJN4ZVUThNUNSBNw8wRvdzw2q5ZvzKT5WZrwbyGYkpz
 Cszw==
X-Gm-Message-State: AOAM531/UpciqqWzE+tfEVpRrtZJqfGnq1YhBZ9sq5H6BN/L1Svgzsy4
 +8K+EiLuy/wwP8XxhFQMjQI=
X-Google-Smtp-Source: ABdhPJxtJtd1fV658X/G1BMWPx4eA+Rrv6VLMcP9tTD5u5EkkXdWvbtyc3bnVU4B3m2vKa2M3xBHyQ==
X-Received: by 2002:a05:6000:1091:: with SMTP id
 y17mr4741964wrw.100.1624024606740; 
 Fri, 18 Jun 2021 06:56:46 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id 61sm9202800wrp.4.2021.06.18.06.56.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 06:56:46 -0700 (PDT)
Subject: Re: [PATCH v5 1/3] thermal: mediatek: Relocate driver to mediatek
 folder
To: Ben Tseng <ben.tseng@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-pm@vger.kernel.org, srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Michael Kao <michael.kao@mediatek.com>,
 Michael Kao <michael.kao@mediatek.comi>
References: <20210617114707.10618-1-ben.tseng@mediatek.com>
 <20210617114707.10618-2-ben.tseng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <372c579c-5cdc-e66a-af99-ea8ee8533ded@gmail.com>
Date: Fri, 18 Jun 2021 15:56:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210617114707.10618-2-ben.tseng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_065648_358840_C4F1BAE1 
X-CRM114-Status: GOOD (  25.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 17/06/2021 13:47, Ben Tseng wrote:
> From: Michael Kao <michael.kao@mediatek.com>
> 
> Add Mediatek proprietary folder to upstream more thermal zone and cooler
> drivers. Relocate the original thermal controller driver to it and rename
> as soc_temp.c to show its purpose more clearly.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.comi>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/thermal/Kconfig                       | 14 ++++-------
>  drivers/thermal/Makefile                      |  2 +-
>  drivers/thermal/mediatek/Kconfig              | 23 +++++++++++++++++++
>  drivers/thermal/mediatek/Makefile             |  1 +
>  .../{mtk_thermal.c => mediatek/soc_temp.c}    |  0
>  5 files changed, 29 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/thermal/mediatek/Kconfig
>  create mode 100644 drivers/thermal/mediatek/Makefile
>  rename drivers/thermal/{mtk_thermal.c => mediatek/soc_temp.c} (100%)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index d7f44deab5b1..7a4ba50ba97d 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -401,16 +401,10 @@ config DA9062_THERMAL
>  	  zone.
>  	  Compatible with the DA9062 and DA9061 PMICs.
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
>  config AMLOGIC_THERMAL
>  	tristate "Amlogic Thermal Support"
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index 82fc3e616e54..9729a2b08991 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -54,7 +54,7 @@ obj-y				+= st/
>  obj-$(CONFIG_QCOM_TSENS)	+= qcom/
>  obj-y				+= tegra/
>  obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
> -obj-$(CONFIG_MTK_THERMAL)	+= mtk_thermal.o
> +obj-$(CONFIG_MTK_THERMAL)	+= mediatek/
>  obj-$(CONFIG_GENERIC_ADC_THERMAL)	+= thermal-generic-adc.o
>  obj-$(CONFIG_UNIPHIER_THERMAL)	+= uniphier_thermal.o
>  obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
> diff --git a/drivers/thermal/mediatek/Kconfig b/drivers/thermal/mediatek/Kconfig
> new file mode 100644
> index 000000000000..0351e73170b7
> --- /dev/null
> +++ b/drivers/thermal/mediatek/Kconfig
> @@ -0,0 +1,23 @@
> +config MTK_THERMAL
> +	tristate "Mediatek thermal drivers"
> +	depends on THERMAL_OF
> +	help
> +	  This is the option for Mediatek thermal software
> +	  solutions. Please enable corresponding options to
> +	  get temperature information from thermal sensors or
> +	  turn on throttle mechaisms for thermal mitigation.
> +
> +if MTK_THERMAL
> +
> +config MTK_SOC_THERMAL
> +	tristate "Temperature sensor driver for mediatek SoCs"
> +	depends on HAS_IOMEM
> +	depends on NVMEM
> +	depends on RESET_CONTROLLER
> +	help
> +	  Enable this option if you want to get SoC temperature
> +	  information for Mediatek platforms. This driver
> +	  configures thermal controllers to collect temperature
> +	  via AUXADC interface.
> +
> +endif
> diff --git a/drivers/thermal/mediatek/Makefile b/drivers/thermal/mediatek/Makefile
> new file mode 100644
> index 000000000000..f75313ddce5e
> --- /dev/null
> +++ b/drivers/thermal/mediatek/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_MTK_SOC_THERMAL)	+= soc_temp.o
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mediatek/soc_temp.c
> similarity index 100%
> rename from drivers/thermal/mtk_thermal.c
> rename to drivers/thermal/mediatek/soc_temp.c
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
