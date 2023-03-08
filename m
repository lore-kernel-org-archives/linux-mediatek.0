Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B3DC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcs+oZ8Ti0MefEj+f00/ORib4j1MEGcYHaRo1YTx8vQ=; b=hI6K8k05gkCvv+wWL6iWKwBV5I
	WcM2KfFBGY7vMzE2rogSKVsZrz5uTKcIuNrvg+rZFjRvkRReTtVGXlGYO60gZwG12I3qzQGXxcHh6
	Lnih/hIHxQzL5rnTuPZDFJAjy5paDt86MQE4SVr0ki2oQ8pIqx0cQjMLv/98TA9XiVDhp1Hnp6rfr
	NxFZzuhIlGKCXNUmCo5vprKcVOoSyzSruD5z7sjgPn3mmoCVb8cv3fXQCWt+80vNsbnEii0oTwMY0
	zYNxFq9ZfnejznkdZOx/f5MKBMghMkPlqfj3NpPLSFb12o4wHPU8OEYOMAVyR3z4fQVwNwEkuuCyu
	Na84+PHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZttB-005DCD-1o; Wed, 08 Mar 2023 13:31:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtsz-005D8F-M1
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 13:31:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id bx12so15348065wrb.11
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 05:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678282275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tcs+oZ8Ti0MefEj+f00/ORib4j1MEGcYHaRo1YTx8vQ=;
        b=uMORQYJTqb7eF+TS+OXUnvGZtemx2Gmei0dGIW+WS7sSdQNWx6CYu2YSur7gZ7UUZe
         dgjVvgHIe9wrTxtDLDc87XXjrUs1sTFvERIYaF4dSP7NUP4E97AHGTBwAzcrfmyLR28x
         2DUIcUYsYAc6Aj+QB3hsJtzAbv0Ex92QNRvv/HF3jbZEmjyFb0TarmYJmU7Aha/zIgK9
         NJBVEM9oCehdwPcTzxCQTxWJPUDv3ULDAwf+YcJMh54Z+ZWVteE+lD7Ccrp+J+aORgkE
         HlKq/dJBsiNxkFXfbCay2W2Et5VX6jHi0G0DlFT2cfabz5kg8G0PEApfuqh9ggVtunB3
         hrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678282275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tcs+oZ8Ti0MefEj+f00/ORib4j1MEGcYHaRo1YTx8vQ=;
        b=K2gq4io7jkulZ1zet/yDFSrgkV2LGJBCaC3gLgJUEff3pANHt6rOQGuEqjW9vXURy4
         N9w1zVc0YjB+La5IKUjriV1Lle6dsPp13Yy1NvCFPO9trOqY+j1hYl7H9ynw5rn+icwe
         qNJ2LjTWaZwZXcBSP0TZzIv78OFRIqYw0uIybxExko1CtK86N1ytNiew5e+oLZQf7xQY
         IhD0r5eOZ/OV9QRXNIeDp6qBGEj7eUZi5XqhJZ5FQUQ/s66qoERLdWowc/zQeabK1uqR
         enU3j1MwYGZh1kYKQ0FDWAooV0R2PEmqrGNWlwA2QG9O6WVgXT8PmemIQMdEXOSMRMpH
         oSeA==
X-Gm-Message-State: AO0yUKWgw14MD3N9pxvzoh+qZFU/4XL8rEsGcflg4Rqf6PUEp0xs8qBb
	25hRWtDoZnFej/frmwdLvgWz4A==
X-Google-Smtp-Source: AK7set/NX5HlxdOngMNTFnb0EPlr+0JwIwMOaiZ9ppB69TodBmpVecSoCUT3wDixITtN85Dj4zLXfg==
X-Received: by 2002:a5d:6b10:0:b0:2cc:4e58:f6d0 with SMTP id v16-20020a5d6b10000000b002cc4e58f6d0mr10220801wrw.54.1678282275334;
        Wed, 08 Mar 2023 05:31:15 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id m16-20020a056000009000b002be099f78c0sm15313823wrx.69.2023.03.08.05.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 05:31:14 -0800 (PST)
Message-ID: <7853ff04-02cf-9430-d84a-c8fe8b1d6725@linaro.org>
Date: Wed, 8 Mar 2023 13:31:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V4 2/2] nvmem: add generic driver for devices with MMIO
 access
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20230228072936.1108-1-zajec5@gmail.com>
 <20230228072936.1108-3-zajec5@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230228072936.1108-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_053117_757363_BF9B23B2 
X-CRM114-Status: GOOD (  42.25  )
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

Hi Rafał,


Thanks for doing this,

On 28/02/2023 07:29, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Some NVMEM devices can be accessed by simply mapping memory and reading
> from / writing to it. This driver adds support for a generic
> "mmio-nvmem" DT binding used by such devices.
> 
> One of such devices is Broadcom's NVRAM. It's already supported (see
> NVMEM_BRCM_NVRAM) but existing driver covers both:

What will happen to the old "brcm,nvram" compatible and the dt firmware 
that already have this node?


If there is only one user for this then one would object that why do we 
need this DT level of abstraction to start with?
If this is not the case please consider adding those patches to this series.


> 1. NVMEM device access
> 2. NVMEM content parsing
> 
> Once we get support for NVMEM layouts then existing NVRAM driver will
> get converted into a layout and generic driver will take over
> responsibility for data access.
>

Even though this series is simple, but it is really confusing for two 
reasons.

1> Generic mmio nvmem bindings are incomplete and potentially 
change/evolve on every new user. Ex clks, regulators, endianess ... So 
it looks really fragile and incomplete to me as a generic bindings.
Is this want you are expecting?


2> As you mentioned that this will replace broadcom NVMRAM, but this 
patch does nothing in relation to updating that driver, so the code is 
dead as it is. If you are considering to use it for Broadcom NVMRAM, 
please add those patches to this series so that we could see the real 
user for this code.

--srini

> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V3: Support "reg-io-width", basic writing & "brcm,nvram" string
> V3: Don't duplicate core checks, add 64 b support, complete writing
>      support, don't add confusing conditional "brcm,nvram" support (it
>      will be handled with layouts migration)
> ---
>   drivers/nvmem/Kconfig  |  10 +++
>   drivers/nvmem/Makefile |   2 +
>   drivers/nvmem/mmio.c   | 148 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 160 insertions(+)
>   create mode 100644 drivers/nvmem/mmio.c
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 6dec38805041..189ea85bd67d 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -166,6 +166,16 @@ config NVMEM_MICROCHIP_OTPC
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
> index 6a1efffa88f0..767a9db2bfc1 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -35,6 +35,8 @@ obj-$(CONFIG_NVMEM_MESON_MX_EFUSE)	+= nvmem_meson_mx_efuse.o
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
> index 000000000000..ce51648bb321
> --- /dev/null
> +++ b/drivers/nvmem/mmio.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Rafał Miłecki <rafal@milecki.pl>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
> +
> +struct mmio_nvmem {
> +	void __iomem *base;
> +	u32 io_width;
> +};
> +
> +static int mmio_nvmem_read(void *context, unsigned int offset, void *val, size_t bytes)
> +{
> +	struct mmio_nvmem *priv = context;
> +	u64 __maybe_unused *dst64;
> +	u32 *dst32;
> +	u16 *dst16;
> +	u8 *dst8;
> +
> +	switch (priv->io_width) {
> +	case 0:
> +		memcpy_fromio(val, priv->base + offset, bytes);
> +		break;
> +	case 1:
> +		for (dst8 = val; bytes; bytes -= 1, offset += 1)
> +			*dst8++ = readb(priv->base + offset);
> +		break;
> +	case 2:
> +		for (dst16 = val; bytes; bytes -= 2, offset += 2)
> +			*dst16++ = readw(priv->base + offset);
> +		break;
> +	case 4:
> +		for (dst32 = val; bytes; bytes -= 4, offset += 4)
> +			*dst32++ = readl(priv->base + offset);
> +		break;
> +#ifdef CONFIG_64BIT
> +	case 8:
> +		for (dst64 = val; bytes; bytes -= 8, offset += 8)
> +			*dst64++ = readq(priv->base + offset);
> +		break;
> +#endif
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mmio_nvmem_write(void *context, unsigned int offset, void *val, size_t bytes)
> +{
> +	struct mmio_nvmem *priv = context;
> +	u64 __maybe_unused *dst64;
> +	u32 *dst32;
> +	u16 *dst16;
> +	u8 *dst8;
> +
> +	switch (priv->io_width) {
> +	case 0:
> +		memcpy_toio(priv->base + offset, val, bytes);
> +		break;
> +	case 1:
> +		for (dst8 = val; bytes; bytes -= 1, offset += 1)
> +			writeb(*dst8++, priv->base + offset);
> +		break;
> +	case 2:
> +		for (dst16 = val; bytes; bytes -= 2, offset += 2)
> +			writew(*dst16++, priv->base + offset);
> +		break;
> +	case 4:
> +		for (dst32 = val; bytes; bytes -= 4, offset += 4)
> +			writel(*dst32++, priv->base + offset);
> +		break;
> +#ifdef CONFIG_64BIT
> +	case 8:
> +		for (dst64 = val; bytes; bytes -= 8, offset += 8)
> +			writeq(*dst64++, priv->base + offset);
> +		break;
> +#endif
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mmio_nvmem_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_config config = {
> +		.name = "mmio-nvmem",
> +		.id = NVMEM_DEVID_AUTO,
> +		.read_only = true,
> +		.reg_read = mmio_nvmem_read,
> +		.reg_write = mmio_nvmem_write,
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
> +	of_property_read_u32(dev->of_node, "reg-io-width", &priv->io_width);
> +
> +	config.dev = dev;
> +	config.size = resource_size(res);
> +	config.word_size = priv->io_width;
> +	config.stride = priv->io_width;
> +	config.priv = priv;
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

