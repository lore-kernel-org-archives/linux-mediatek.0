Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170C3C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 09:09:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5B6361205
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 09:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5B6361205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GFwk8Fphd9YRO8VQcpPcZ3DhdaCWbRJ84NrvPK5N36w=; b=RNuRxhNgO4IcX6vX+ZjkpO2i9
	d7c6SlCQwgnQXT382pDvQJcm11fz3Dcn6YtMhflQy/k5qQL95hBS87Q4dbWFBnpiO6HowiDSq0PQO
	CD7J0xYAbygHWRjFqWhWz+BqomLBqpOxwdFNNqk2fckJX76ud/0EHy6OYybOErqoOMuppYcaesRp0
	cVBr4O7sU8kK+25cIwgNaOyQXk64AMCH9jx/JUmJDDtIL/zg4JSKNEZXWFB3bfxZsRkmDZJ1Ndpsb
	qPVftHgf7fGOYGusc8Xo+5D9AJ9OSbHLVvAo5IV/4punCTT4XK+cqZGsn6Uqe+RX7fAKwqQQRFaFK
	FhD6avfVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU4Bq-004YaA-62; Wed, 07 Apr 2021 09:09:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU4Ar-004YNy-Ur; Wed, 07 Apr 2021 09:08:39 +0000
X-UUID: 8cb3173d2284401c824c862476add013-20210407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CehQ1sk8BCXcCJ53lKdFrH9flH/8762tp79jx+0lkaY=; 
 b=D05ELInCO4uG26YWu36NqXn/dPSVQd1bewW4lJ5iGTjldw75TIEgKjwCTUYnfb8vm486NRDSZpmoisJrDhG+ZxmnqWFU81niLyyXWWjzqrpnOaUY4PLiEMsAel/6VfmQMyl/N2Yi28fdhGUA0BnPFSCJCrKbmCQD/5sHsJrRyew=;
X-UUID: 8cb3173d2284401c824c862476add013-20210407
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 18320696; Wed, 07 Apr 2021 02:08:29 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 02:08:26 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 17:08:25 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Apr 2021 17:08:25 +0800
Message-ID: <1617786505.12846.1.camel@mtksdccf07>
Subject: Re: [v3,1/3] thermal: mediatek: Relocate driver to mediatek folder
From: Michael Kao <michael.kao@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
CC: <linux-pm@vger.kernel.org>, <srv_heupstream@mediatek.com>, "Eduardo
 Valentin" <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <hsinyi@chromium.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Date: Wed, 7 Apr 2021 17:08:25 +0800
In-Reply-To: <20210312034018.17437-2-michael.kao@mediatek.com>
References: <20210312034018.17437-1-michael.kao@mediatek.com>
 <20210312034018.17437-2-michael.kao@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_100834_904654_20E11274 
X-CRM114-Status: GOOD (  23.14  )
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

Hi Maintainers,
 
Gentle pin for this patch.
 
Thanks


On Fri, 2021-03-12 at 11:40 +0800, Michael Kao wrote:
> Add Mediatek proprietary folder to upstream more thermal zone and cooler
> drivers. Relocate the original thermal controller driver to it and rename
> as soc_temp.c to show its purpose more clearly.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
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
> index 7edc8dc6bbab..b2da0a1bda34 100644
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
> index b64dd50a6629..f9e07c3f529e 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -55,7 +55,7 @@ obj-y				+= st/
>  obj-$(CONFIG_QCOM_TSENS)	+= qcom/
>  obj-y				+= tegra/
>  obj-$(CONFIG_HISI_THERMAL)     += hisi_thermal.o
> -obj-$(CONFIG_MTK_THERMAL)	+= mtk_thermal.o
> +obj-$(CONFIG_MTK_THERMAL)	+= mediatek/
>  obj-$(CONFIG_GENERIC_ADC_THERMAL)	+= thermal-generic-adc.o
>  obj-$(CONFIG_ZX2967_THERMAL)	+= zx2967_thermal.o
>  obj-$(CONFIG_UNIPHIER_THERMAL)	+= uniphier_thermal.o
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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
