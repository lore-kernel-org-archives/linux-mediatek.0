Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2103C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 14:06:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A88610FA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 14:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7A88610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cHDHpfpHgnfWpHdSi4L6Au9v4twxwL7UHEAYAZjCJ5k=; b=n50HVd50wDW9v/dk2PCf1vhJO
	y899Tyzm8VC7p2ydPcfMZSUusRttaTH3HZrJOy6yzINEA8BZjxBZ+b5sGwv69yP8lW6gBIBY/5+dT
	hd1My1JOslYOZDo4w2FLtjgBXSKoFulVbQdGy5IMNhN1+3VX1EVGVrkYxDq64HPiac7IuiSaOF8KJ
	sQG5Yke+NfxM+18jwd7sqeNB8sgn0Hj2OGE+ttU3mO+CnGwxGy90xjkA19Fnr5gv1m+cxj/8lKbs/
	+jKap7lYjdf0NWD/wEGcgzEpt6knZNcWIrdzGbTHrCzq7rx6GoZQ/ty1QnAKrL7V5MABazXW8GveV
	QvBooj0FQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldvgL-00GKe4-MM; Tue, 04 May 2021 14:05:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvgK-00GKdz-1y
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 14:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=d1Bg21TA2Y/XVBe2Xz6NvEf8Q9YHqIlZi+voDC9dIkU=; b=oP8xoxbPpbXx2P/Yglt1XwzMDl
 cNnZIUXhN5/S1VwIXuOR2ZeXhFJJzSVGuj/l+Saeu0z67PfW7qAeehX0tWS/7TS1fe5e9B8j8UJ2G
 lK0bjMakbX7ngbt010j1MFlfInj0fdRne3YmudH7qPibUMZCr7kZ6PqmKLu6eP8HHngeShOrDKQIm
 5Au192NIs1CFNkZfbRZrfWUAElSebUtWl2ARrbTsN7NFcFMZ8XiQ+0yeMU9ByRspaUfKbYvBuOXl1
 iPqzO1nLUz3j15aCCjM+xLPVVtXtx3JEk4KPYEnaZrjRsZHMyd7fLEIrl2v198VXvCXCzuTqUBlCj
 FYi9PY+A==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvgH-0041Xj-6e
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 14:05:46 +0000
Received: from mail-qt1-f200.google.com ([209.85.160.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1ldvgF-0002j6-M5
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 14:05:43 +0000
Received: by mail-qt1-f200.google.com with SMTP id
 d16-20020ac811900000b02901bbebf64663so3605327qtj.14
 for <linux-mediatek@lists.infradead.org>; Tue, 04 May 2021 07:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d1Bg21TA2Y/XVBe2Xz6NvEf8Q9YHqIlZi+voDC9dIkU=;
 b=eig7/5IAhg4LwLhQPpzeajd5yyLZgIZzhJfKX/DScmqk3ZbnDtt/8y4cM+yTyzWnje
 pGAsdBZqVAxC+rhakKSoNS4xIsuOGudE3prLwkl0uqID9Ub/f4hWNVudGLlY47erE5ig
 kRFo32f3jl6F/IsQF8fQOUAq1H0wA7S9J3k/U5Yi/0ImWRbNXw/B2uGP1eYwf2bzo1oi
 J2n2xi0Xm0c7mW/3Qc0uDTCgLI31pAO9x4fLmM9y+iCNfKhuVWQzp0Sytznx+4pYqURe
 Qioo9pwCSKneZkeaixTnGfiPlQSt30q5R2oXeZsGVnopHTCgy3Y16/EEXbHUK5+SnS54
 p3LQ==
X-Gm-Message-State: AOAM531YGPV4bVt20G8aEqHcnTEU92vpUiISaMeS1lvZUaELtj5C5axi
 g/PmtEBJaJcjAQL9MVBiYHrgmnWBiFytQ+lcmXBQn27cgvYp1gX791k6MlJBQlGy1WuPHLa2dUK
 yxkg/9I7KdwAtxcbJytx3BuszlamZdCzNQ91ouIzVJ/J7HfefbA==
X-Received: by 2002:a05:620a:12f3:: with SMTP id
 f19mr24609803qkl.214.1620137142628; 
 Tue, 04 May 2021 07:05:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV4MzmdYFEJ07rYueLywhsQ0lTRCYL70XhmxTt9vr5KUOS3gbBkBykA4ex5zwtjWF0SpRwvg==
X-Received: by 2002:a05:620a:12f3:: with SMTP id
 f19mr24609778qkl.214.1620137142398; 
 Tue, 04 May 2021 07:05:42 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.49.3])
 by smtp.gmail.com with ESMTPSA id h65sm11173774qkd.112.2021.05.04.07.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 07:05:41 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] memory: mediatek: add DRAM controller driver
To: Po-Kai Chi <pk.chi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 CC Hwang <cc.hwang@mediatek.com>
References: <1618565538-6972-1-git-send-email-pk.chi@mediatek.com>
 <1618565538-6972-3-git-send-email-pk.chi@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6f7472a2-3be2-e1dc-8e0f-83f6b1cdf61f@canonical.com>
Date: Tue, 4 May 2021 10:05:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1618565538-6972-3-git-send-email-pk.chi@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_070545_411312_51358351 
X-CRM114-Status: GOOD (  26.93  )
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

On 16/04/2021 05:32, Po-Kai Chi wrote:
> MediaTek DRAM controller (DRAMC) driver provides cross-platform features
> as below:
> 
> 1. provide APIs for low power feature queries
> 2. create sysfs to pass the DRAM information to user-space
> 
> Signed-off-by: Po-Kai Chi <pk.chi@mediatek.com>
> ---
>  drivers/memory/Kconfig              |    1 +
>  drivers/memory/Makefile             |    1 +
>  drivers/memory/mediatek/Kconfig     |    9 +
>  drivers/memory/mediatek/Makefile    |    3 +
>  drivers/memory/mediatek/mtk-dramc.c |  711 +++++++++++++++++++++++++++++++++++
>  include/memory/mediatek/dramc.h     |   18 +
>  6 files changed, 743 insertions(+)
>  create mode 100644 drivers/memory/mediatek/Kconfig
>  create mode 100644 drivers/memory/mediatek/Makefile
>  create mode 100644 drivers/memory/mediatek/mtk-dramc.c
>  create mode 100644 include/memory/mediatek/dramc.h
> 
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index 72c0df1..056e906 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -225,6 +225,7 @@ config STM32_FMC2_EBI
>  	  devices (like SRAM, ethernet adapters, FPGAs, LCD displays, ...) on
>  	  SOCs containing the FMC2 External Bus Interface.
>  
> +source "drivers/memory/mediatek/Kconfig"

Please first group existing Mediatek driver there. It's messy.

>  source "drivers/memory/samsung/Kconfig"
>  source "drivers/memory/tegra/Kconfig"
>  
> diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
> index bc7663e..cd4f8cf 100644
> --- a/drivers/memory/Makefile
> +++ b/drivers/memory/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_PL353_SMC)		+= pl353-smc.o
>  obj-$(CONFIG_RENESAS_RPCIF)	+= renesas-rpc-if.o
>  obj-$(CONFIG_STM32_FMC2_EBI)	+= stm32-fmc2-ebi.o
>  
> +obj-$(CONFIG_MTK_DRAMC)		+= mediatek/
>  obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
>  obj-$(CONFIG_TEGRA_MC)		+= tegra/
>  obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
> diff --git a/drivers/memory/mediatek/Kconfig b/drivers/memory/mediatek/Kconfig
> new file mode 100644
> index 0000000..a1618b0
> --- /dev/null
> +++ b/drivers/memory/mediatek/Kconfig
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config MTK_DRAMC
> +	tristate "MediaTek DRAMC driver"
> +	help
> +	  This selects the MediaTek(R) DRAMC driver.
> +	  Provide the API for DRAMC low power scenario, and the interface
> +	  for reporting DRAM information, e.g. DRAM mode register (MR) for
> +	  DRAM vendor ID, temperature, and density.
> diff --git a/drivers/memory/mediatek/Makefile b/drivers/memory/mediatek/Makefile
> new file mode 100644
> index 0000000..632be48
> --- /dev/null
> +++ b/drivers/memory/mediatek/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_MTK_DRAMC)	+= mtk-dramc.o
> diff --git a/drivers/memory/mediatek/mtk-dramc.c b/drivers/memory/mediatek/mtk-dramc.c
> new file mode 100644
> index 0000000..155b3b7
> --- /dev/null
> +++ b/drivers/memory/mediatek/mtk-dramc.c
> @@ -0,0 +1,711 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/printk.h>
> +#include <linux/slab.h>
> +#include <linux/io.h>
> +#include <memory/mediatek/dramc.h>
> +
> +#define DRAMC_DRV_NAME	"mtk-dramc"

What does this define bring? What's the benefit?

> +
> +struct mr_info_t {
> +	unsigned int mr_index;
> +	unsigned int mr_value;
> +};
> +
> +/*

(...)

> +
> +static struct platform_driver dramc_drv = {
> +	.probe = dramc_probe,
> +	.remove = dramc_remove,
> +	.driver = {
> +		.name = DRAMC_DRV_NAME,
> +		.owner = THIS_MODULE,

NAK, this is so old mistake... No point to review - run Smatch, sparse,
checkpatch and coccinelle. Fix all the errors and then resubmit.

> +		.of_match_table = mtk_dramc_of_ids,
> +	},
> +};
> +
> +static int __init dramc_drv_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&dramc_drv);
> +	if (ret) {
> +		pr_info("%s: init fail, ret 0x%x\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void __exit dramc_drv_exit(void)
> +{
> +	platform_driver_unregister(&dramc_drv);
> +}
> +
> +module_init(dramc_drv_init);
> +module_exit(dramc_drv_exit);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MediaTek DRAMC Driver");
> +MODULE_AUTHOR("Po-Kai Chi <pk.chi@mediatek.com>");
> diff --git a/include/memory/mediatek/dramc.h b/include/memory/mediatek/dramc.h
> new file mode 100644
> index 0000000..c8d200f
> --- /dev/null
> +++ b/include/memory/mediatek/dramc.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef __DRAMC_H__

Extend the header guard - MEMORY_MEDIATEK_DRAMC

> +#define __DRAMC_H__



Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
