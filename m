Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F86C636D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXmJjnvo/FFiDzkfMcuSjrP2rIaxNKinvpLHDM3lDcI=; b=vuXxTVBE3Dxc9q8nsJGqhvuXsa
	+YxW7jHQPa3pTQHU4RtdwTQFfBafXZgx95nmJbS68EdCVtBgrNaWUUloCaGPvYUVz3E6r58rMSd69
	cG9OXnVVmOT3HxL4JlfSuYI95XUNyUpWWLtkAYyAZnzi0tDh7K0RMHQa+wkeD6g9+BkNYun5UmhYs
	8DtHQ0rx7hNR3UhYI3WcG0ZsPLwA7ibdwkTCKpitG7K7j++gyocA6N7IXh0TcZdp8A8blN6z2/cCa
	i040J4rMli60eIYc+AVZha7/p7E6tvz0/fU8Un6Xf+qEAhD0eHPedRKuNuEWjpxwjViVyLIlwBI8h
	xb7g0E/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBff-00BbRD-BK; Wed, 01 Feb 2023 11:52:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBfc-00BbPX-5N
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 11:52:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id q8so12454788wmo.5
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 03:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qXmJjnvo/FFiDzkfMcuSjrP2rIaxNKinvpLHDM3lDcI=;
        b=N0elckNXjFQvKZibhvSoRRoSC9/x4UVe0mh+gY0BT4kJJKugTLMh0K6VMgpok4HIJg
         Dh9YfRRKj7G+JSsy0KsMy9mVNhtsD5/IPKOB6anI8Se14qS79D09V4hamsOW7W/t/OUw
         DC4NVKRG/X2iPQPw1qftU7ruSEcTu/xupnbN9rS5TwGTCnWbdXDL8UC1/XZ6ZarZhv0Y
         NAXjvCIzkb4IXy/wYCE72TXZxoLBlSHjOlFmscy9bN8R5F8/s6W6eXSQo31vDJ1lN7aA
         fOFXkQ9DVgjvVJ26zKfatj74owxN6YmXerbOrPEx09gofYTkwo0ldQGHGiSvH5BkWhcS
         a8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXmJjnvo/FFiDzkfMcuSjrP2rIaxNKinvpLHDM3lDcI=;
        b=uZ0/Hu5Lp8YUXKVa1UNG1mQNSylzDwb8OWC8catLucqPE+D0Inj4mWWMmDgGmhg98+
         l3f9xgKM1my966vDxciHcoGFZytDT7Bhu9Wnmva0T4dxdWHqbHvLAuosnqRZ4GxnLsuP
         gb4h1cD1bxcF2nBkiLD9L92gNEOuPn05nG605rfy0IcdmWrSeq6EClcyOaMznVVoRML5
         8eP7uYx7LLcuOsuCBS3g8I7xxIIK3VW4XfqFbbrUctQdHkuGHqADRWu8HpvXsC8saF1K
         KTBE2MzwBaoEDaAUC5G6p21oWZrzHAemBPKDXXZhRElHm6GKZMjGXulpFefCnrmkAY2x
         eFCw==
X-Gm-Message-State: AO0yUKVHyM/jUyefBJgksh+fP4ZKse8TcMqEoLnaQQoCtOppbNQAL/cg
	4/yfL8LNulC2NLN7UbQr2fMoYA==
X-Google-Smtp-Source: AK7set/dRg45qD9OzdP33C522mFyZvo9JvWq76eRC7vcFbhRZPDOFP+Yn/7YzjHOSNSVsebueHhhAA==
X-Received: by 2002:a1c:7906:0:b0:3da:db4:6105 with SMTP id l6-20020a1c7906000000b003da0db46105mr1733058wme.37.1675252374488;
        Wed, 01 Feb 2023 03:52:54 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id j25-20020a05600c1c1900b003daf6e3bc2fsm2977865wms.1.2023.02.01.03.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 03:52:53 -0800 (PST)
Message-ID: <88a8c2ef-8478-84b3-e4c9-6d3760313241@linaro.org>
Date: Wed, 1 Feb 2023 11:52:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/4] nvmem: add generic driver for devices with MMIO
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
References: <20230201064717.18410-1-zajec5@gmail.com>
 <20230201064717.18410-3-zajec5@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230201064717.18410-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_035256_281959_1544E77F 
X-CRM114-Status: GOOD (  32.44  )
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



On 01/02/2023 06:47, Rafał Miłecki wrote:
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
> @@ -36,6 +36,8 @@ obj-$(CONFIG_NVMEM_MESON_MX_EFUSE)	+= nvmem_meson_mx_efuse.o
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
> +static int mmio_nvmem_read(void *context, unsigned int offset, void *val, size_t bytes)
> +{
> +	struct mmio_nvmem *priv = context;
> +
> +	memcpy_fromio(val, priv->base, bytes);

How does this work with different register strides?

> +
> +	return 0;
> +}
> +
> +static int mmio_nvmem_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_config config = {
> +		.name = "mmio-nvmem",


you could use NVMEM_DEVID_AUTO.


But this is not great, this is going to break the existing abi for 
converted drivers. Either we find a way to pass compatible specific data 
and override the default values.

Also there are going to be cases where access to registers will require 
additional resources like clks or pd.


--srini

> +		.read_only = true,
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

