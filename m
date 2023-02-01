Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7504C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iI9O3y3GOPuZw5pUpJ25NN8bjF6uZzoYxuqkKYGUnus=; b=NWEoMqXkX9IzYtPMDz4nMDfMqu
	a6ZzsII7WK20IGvMOxEVEEMpeItmvxIWrnfo+VeSOk47HqW4rKnEdQEJsKWLNLtCtjWgwbGc+i2ZA
	qIyOyJWHZzI4L2H8zCXYlbz0LeWCfVYdjFIqxr3cTGO3jM+chI8Q99S4AJEVUPGbxUwLINXUwtr7t
	GJKbSoHsu2Lr99SRaNNhrnzm7vRpnAwsgnAoLTPn9X3v4WFu8JMSYRumuqV+/23DLgn36ZqVksIyU
	uVoJJJrMX6Hshpr4aABDl6enuo7dahrR343m3UFoxi5a358R7URxAMcVMKE3731k5VrXlcoUrmR0I
	D4ACWU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9ct-00B47J-UX; Wed, 01 Feb 2023 09:41:59 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9cj-00B43t-0m; Wed, 01 Feb 2023 09:41:51 +0000
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 01 Feb 2023 18:41:43 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
	by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 341DD2058B4F;
	Wed,  1 Feb 2023 18:41:43 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Wed, 1 Feb 2023 18:41:50 +0900
Received: from [10.212.157.12] (unknown [10.212.157.12])
	by kinkan2.css.socionext.com (Postfix) with ESMTP id 954C27366;
	Wed,  1 Feb 2023 18:41:42 +0900 (JST)
Message-ID: <bed0a57c-a880-0b6f-f97d-d2b40c7cb17f@socionext.com>
Date: Wed, 1 Feb 2023 18:41:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] nvmem: add generic driver for devices with MMIO
 access
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20230201064717.18410-1-zajec5@gmail.com>
 <20230201064717.18410-3-zajec5@gmail.com>
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20230201064717.18410-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_014149_208596_62D27D3D 
X-CRM114-Status: GOOD (  31.98  )
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

Hi,

On 2023/02/01 15:47, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> With nvmem layouts in place we should now work on plain content access
> NVMEM drivers (e.g. MMIO one). Actual NVMEM content handling should go
> to layout drivers.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   drivers/nvmem/Kconfig  | 10 ++++++
>   drivers/nvmem/Makefile |  2 ++
>   drivers/nvmem/mmio.c   | 80 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 92 insertions(+)
>   create mode 100644 drivers/nvmem/mmio.c
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 789729ff7e50..9eb5e93f0455 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -170,6 +170,16 @@ config NVMEM_MICROCHIP_OTPC
>   	  This driver enable the OTP controller available on Microchip SAMA7G5
>   	  SoCs. It controls the access to the OTP memory connected to it.
> 
> +config NVMEM_MMIO
> +	tristate "MMIO access based NVMEM support"
> +	depends on HAS_IOMEM
> +	help
> +	  This driver provides support for NVMEM devices that can be accessed
> +	  using MMIO.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nvmem-mmio.
> +
>   config NVMEM_MTK_EFUSE
>   	tristate "Mediatek SoCs EFUSE support"
>   	depends on ARCH_MEDIATEK || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 442f9a4876a5..2f2bed7cdf24 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -36,6 +36,8 @@ obj-$(CONFIG_NVMEM_MESON_MX_EFUSE)	+=
> nvmem_meson_mx_efuse.o
>   nvmem_meson_mx_efuse-y			:= meson-mx-efuse.o
>   obj-$(CONFIG_NVMEM_MICROCHIP_OTPC)	+= nvmem-microchip-otpc.o
>   nvmem-microchip-otpc-y			:= microchip-otpc.o
> +obj-$(CONFIG_NVMEM_MMIO)		+= nvmem-mmio.o
> +nvmem-mmio-y				:= mmio.o
>   obj-$(CONFIG_NVMEM_MTK_EFUSE)		+= nvmem_mtk-efuse.o
>   nvmem_mtk-efuse-y			:= mtk-efuse.o
>   obj-$(CONFIG_NVMEM_MXS_OCOTP)		+= nvmem-mxs-ocotp.o
> diff --git a/drivers/nvmem/mmio.c b/drivers/nvmem/mmio.c
> new file mode 100644
> index 000000000000..19c8880dc675
> --- /dev/null
> +++ b/drivers/nvmem/mmio.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Rafał Miłecki <rafal@milecki.pl>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
> +
> +struct mmio_nvmem {
> +	void __iomem *base;
> +};
> +
> +static int mmio_nvmem_read(void *context, unsigned int offset, void *val,
> size_t bytes)
> +{
> +	struct mmio_nvmem *priv = context;
> +
> +	memcpy_fromio(val, priv->base, bytes);
> +
> +	return 0;
> +}
> +
> +static int mmio_nvmem_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_config config = {
> +		.name = "mmio-nvmem",

The fixed name breaks sysfs for multiple nvmem instances.

     sysfs: cannot create duplicate filename '/bus/nvmem/devices/mmio-nvmem0'

> +		.read_only = true,

As Michael said in the mediatek patch,
I also think it's hard to make read-only fixed in the generic driver.

> +		.reg_read = mmio_nvmem_read,
> +	};
> +	struct device *dev = &pdev->dev;
> +	struct mmio_nvmem *priv;
> +	struct resource *res;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	config.dev = dev;
> +	config.size = resource_size(res);
> +	config.word_size = sizeof(u8);
> +	config.stride = sizeof(u8);
> +	config.priv = priv;
> +
> +	if (!device_property_present(dev, "read-only"))
> +		dev_warn(dev, "Writing is not supported yet");

Isn't the logic opposite?
Anyway, the driver doesn't use "read-only" properties for selection.

> +
> +	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
> +}
> +
> +static const struct of_device_id mmio_nvmem_of_match_table[] = {
> +	{ .compatible = "mmio-nvmem", },
> +	{},
> +};
> +
> +static struct platform_driver mmio_nvmem_driver = {
> +	.probe = mmio_nvmem_probe,
> +	.driver = {
> +		.name = "mmio_nvmem",
> +		.of_match_table = mmio_nvmem_of_match_table,
> +	},
> +};
> +
> +static int __init mmio_nvmem_init(void)
> +{
> +	return platform_driver_register(&mmio_nvmem_driver);
> +}
> +
> +subsys_initcall_sync(mmio_nvmem_init);
> +
> +MODULE_AUTHOR("Rafał Miłecki");
> +MODULE_LICENSE("GPL");
> +MODULE_DEVICE_TABLE(of, mmio_nvmem_of_match_table);

Thank you,

---
Best Regards
Kunihiko Hayashi

