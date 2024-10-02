Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F228CF6D24
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 13:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tq/IcjxnqevHQ1pJJAdNyjhvtmKc8PHpqnWCYCuZtbY=; b=yrpkjBeMrt8MqXpJEAAKkBaEzp
	Zo8IzRx9+lHt9WukUZ0L3G8cj2FYYo3Btexpcra+o8jV5bLeIMo7Y4tQaDprdJYKgnKI8nPVR0VbO
	OsBFoQ5BKkpB25Cers6PTAXjQ6EkKQroLNgrznDmGUjGL5ux73ep3o7wBRYLQpXxwcv7c2hnDLfvA
	H26UXsN60pHHIg+0CheBBgxlgyWYW+0R+kvNSSmsPmqPvnmiN3dQXu8tVBg8SArGFpLg/iXivfTdQ
	dXKOl1C1Op1Pqrhh1kiOa2HRdGncDyR+fWOru7yK8aLhG80B/O3yblnoLz7xi/fO1NgrJZXjMFj0p
	396UPHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svzOP-000000067kO-27T7;
	Wed, 02 Oct 2024 13:27:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svzM5-00000006794-3vfb;
	Wed, 02 Oct 2024 13:25:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D6D5E5C4AA8;
	Wed,  2 Oct 2024 13:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5ACC4CECF;
	Wed,  2 Oct 2024 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727875524;
	bh=t2xGM0n6vLNavXXQOnciDAXLytPrgVcYlQAYYF1hRgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSTUlm5co/SiLPHSg6yOj/iz0uAL2OzcmiV/OsCsmh9ioHTCJU8X9ZIOdn66nWuhG
	 BF723ZbeakpPHUHgIoku8K0FCTaRGBFaPlgfLI6z/ezHvYT85kr0eNRlbdRhq0Mj/+
	 2wYkbzcEEh+JFVhgjJf6+V6RSlbr+J8zwoFCmGBpFidp+HsVUagDoSPE6ovppTQ+Ft
	 Ll9A4elZeVJxaWhpIN8R3PeeW9N3YediPmikV/gGT/s9nYbS812oQiGZohlqgfyc2F
	 jKhUBv1zf36R6+KqdogmrmBa6Ij9H10a9uuDE097yXB+Aflc2pRvevSH5ICrlEXVn+
	 7PS9BS4vKB4Tg==
Date: Wed, 2 Oct 2024 14:25:18 +0100
From: Lee Jones <lee@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v5 3/5] mfd: airoha: Add support for Airoha EN7581 MFD
Message-ID: <20241002132518.GD7504@google.com>
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
 <20241001-en7581-pinctrl-v5-3-dc1ce542b6c6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241001-en7581-pinctrl-v5-3-dc1ce542b6c6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_062526_094144_38EFDD14 
X-CRM114-Status: GOOD (  28.22  )
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

On Tue, 01 Oct 2024, Lorenzo Bianconi wrote:

> From: Christian Marangi <ansuelsmth@gmail.com>
> 
> Support for Airoha EN7581 Multi Function Device that
> expose PINCTRL functionality and PWM functionality.

The device is a jumble of pinctrl registers, some of which can oscillate.

This is *still* not an MFD.

If you wish to spread this functionality over 2 drivers, use syscon to
obtain the registers and simple-mfd to automatically probe the drivers.

> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/mfd/Kconfig                   |  8 ++++
>  drivers/mfd/Makefile                  |  2 +
>  drivers/mfd/airoha-en7581-gpio-mfd.c  | 72 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/airoha-en7581-mfd.h |  9 +++++
>  4 files changed, 91 insertions(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index f9325bcce1b9..eca221351ab7 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -32,6 +32,14 @@ config MFD_ADP5585
>  	  the core APIs _only_, you have to select individual components like
>  	  the GPIO and PWM functions under the corresponding menus.
>  
> +config MFD_AIROHA_EN7581
> +	bool "Airoha EN7581 Multi Function Device"
> +	depends on (ARCH_AIROHA || COMPILE_TEST) && OF
> +	select MFD_CORE
> +	help
> +	  Support for Airoha EN7581 Multi Function Device that
> +	  expose PINCTRL functionality and PWM functionality.
> +
>  config MFD_ALTERA_A10SR
>  	bool "Altera Arria10 DevKit System Resource chip"
>  	depends on ARCH_INTEL_SOCFPGA && SPI_MASTER=y && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 2a9f91e81af8..be8448e81a5b 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -257,6 +257,8 @@ obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)	+= intel_soc_pmic_chtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)	+= intel_soc_pmic_chtdc_ti.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)	+= intel_soc_pmic_mrfld.o
>  
> +obj-$(CONFIG_MFD_AIROHA_EN7581)	+= airoha-en7581-gpio-mfd.o
> +
>  obj-$(CONFIG_MFD_ALTERA_A10SR)	+= altera-a10sr.o
>  obj-$(CONFIG_MFD_ALTERA_SYSMGR) += altera-sysmgr.o
>  obj-$(CONFIG_MFD_STPMIC1)	+= stpmic1.o
> diff --git a/drivers/mfd/airoha-en7581-gpio-mfd.c b/drivers/mfd/airoha-en7581-gpio-mfd.c
> new file mode 100644
> index 000000000000..88407ce5747e
> --- /dev/null
> +++ b/drivers/mfd/airoha-en7581-gpio-mfd.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * MFD driver for Airoha EN7581
> + */
> +
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/mfd/airoha-en7581-mfd.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +
> +static struct resource airoha_mfd_pinctrl_intr[] = {
> +	{
> +		.flags = IORESOURCE_IRQ,
> +	},
> +};
> +
> +static const struct mfd_cell airoha_mfd_devs[] = {
> +	{
> +		.name = "pinctrl-airoha",
> +		.resources = airoha_mfd_pinctrl_intr,
> +		.num_resources = ARRAY_SIZE(airoha_mfd_pinctrl_intr),
> +	}, {
> +		.name = "pwm-airoha",
> +	},
> +};
> +
> +static int airoha_mfd_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct airoha_mfd *mfd;
> +	int irq;
> +
> +	mfd = devm_kzalloc(dev, sizeof(*mfd), GFP_KERNEL);
> +	if (!mfd)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, mfd);
> +
> +	mfd->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mfd->base))
> +		return PTR_ERR(mfd->base);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	airoha_mfd_pinctrl_intr[0].start = irq;
> +	airoha_mfd_pinctrl_intr[0].end = irq;
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, airoha_mfd_devs,
> +				    ARRAY_SIZE(airoha_mfd_devs), NULL, 0,
> +				    NULL);
> +}
> +
> +static const struct of_device_id airoha_mfd_of_match[] = {
> +	{ .compatible = "airoha,en7581-gpio-sysctl" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, airoha_mfd_of_match);
> +
> +static struct platform_driver airoha_mfd_driver = {
> +	.probe = airoha_mfd_probe,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = airoha_mfd_of_match,
> +	},
> +};
> +module_platform_driver(airoha_mfd_driver);
> +
> +MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
> +MODULE_DESCRIPTION("Driver for Airoha EN7581 MFD");
> diff --git a/include/linux/mfd/airoha-en7581-mfd.h b/include/linux/mfd/airoha-en7581-mfd.h
> new file mode 100644
> index 000000000000..25e73952a777
> --- /dev/null
> +++ b/include/linux/mfd/airoha-en7581-mfd.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_INCLUDE_MFD_AIROHA_EN7581_MFD_H_
> +#define _LINUX_INCLUDE_MFD_AIROHA_EN7581_MFD_H_
> +
> +struct airoha_mfd {
> +	void __iomem *base;
> +};
> +
> +#endif  /* _LINUX_INCLUDE_MFD_AIROHA_EN7581_MFD_H_ */
> 
> -- 
> 2.46.2
> 

-- 
Lee Jones [李琼斯]

