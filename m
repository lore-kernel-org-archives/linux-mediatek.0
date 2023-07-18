Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4618BC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PVi3gsLsfOIeG0kVAwkLxybFNuC6TLt4NV70WYy4JI=; b=03rwFmryAAYQiNyuM6byoAg7Wl
	ZDGfd+S2jcTnkN7qwtUh48OvPlW/ax/uR2etyUmvynodALRv7PoGra2Tt4xpmWDjUAVxiGlxW4r90
	6tRd6v10RDR7pUYmNsh40U8ykrHDYuPfLk9ZwIz63nbZOk+ZaBvzqgzT6qy1VaMQ4uAztQk8FwrzQ
	xKsxYZqJaMY1PU5lnqk43kT0zbYJASkp/VCkTdT8FEMKiXzNZxyPuy7+Z4QQK0LGls6I39qkXG3WO
	iNHWArdnkz+G+/3iIXaCraw00m2LcjJWgg3OSSefRUIt5aU0BJV4A/x8hdA6iN6q+Ev0ErfSuZ+vN
	y5tB1AeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2d7-006Nnr-00;
	Wed, 19 Jul 2023 08:33:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2d2-006Nll-1O;
	Wed, 19 Jul 2023 08:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9PVi3gsLsfOIeG0kVAwkLxybFNuC6TLt4NV70WYy4JI=; b=WRH0meG7IT+uuBz+GjcnXQb7dd
	iayvBhVX0U/Fw6XST+i9mW0CCw4VlqHA46EdtlNfkdaFjDBQQyrtVNiTVPKeMhtN2UM0vdsJbTa+b
	W0lfXg4ANW1yqY9Bw/N2Z3IYiXVPqGT/6Ifb4iu0a5vqmVzZfXk5RyrE9Gd3VprHypjdrdiRffz/4
	J1YLQY0RI4wVXQqt1ScFrwKPXPra8F8Aj/a5eKRmH5+VXb9Zq8rHwTP+uIUA9Fq5V6uqbbWV6//fX
	2PxT9mVmtUsidHU36yKK7uh3LmINb8OICGC1kVHEI+06d67AL6UKWD60LKHfs3cY7dm+yv1LemrtA
	+1IXq8vQ==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhZz-00BOhS-2a;
	Tue, 18 Jul 2023 10:05:18 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R4vcJ6xtBz6D94M;
	Tue, 18 Jul 2023 18:01:36 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 11:04:52 +0100
Date: Tue, 18 Jul 2023 11:04:51 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij
	<linus.walleij@linaro.org>, Balsam CHIHI <bchihi@baylibre.com>, "Claudiu
 Beznea" <claudiu.beznea@microchip.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Reding <thierry.reding@gmail.com>, Paul Cercueil
	<paul@crapouillou.net>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-pm@vger.kernel.org>, Andy Shevchenko
	<andy@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Len Brown <len.brown@intel.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>,
	Sean Wang <sean.wang@kernel.org>, "Jonathan Hunter" <jonathanh@nvidia.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>, Pavel Machek
	<pavel@ucw.cz>, "Matthias Brugger" <matthias.bgg@gmail.com>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 04/10] pinctrl: intel: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
Message-ID: <20230718110451.00001227@Huawei.com>
In-Reply-To: <20230717172821.62827-5-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	<20230717172821.62827-5-andriy.shevchenko@linux.intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_110516_141814_7B36BCE1 
X-CRM114-Status: GOOD (  20.69  )
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

On Mon, 17 Jul 2023 20:28:15 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-intel.c | 5 +----
>  drivers/pinctrl/intel/pinctrl-intel.h | 9 ++-------
>  2 files changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
> index 64c3e62b4348..40e45c4889ee 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.c
> +++ b/drivers/pinctrl/intel/pinctrl-intel.c
> @@ -929,7 +929,7 @@ static int intel_gpio_to_pin(struct intel_pinctrl *pctrl, unsigned int offset,
>   *
>   * Return: a GPIO offset, or negative error code if translation can't be done.
>   */
> -static __maybe_unused int intel_pin_to_gpio(struct intel_pinctrl *pctrl, int pin)
> +static int intel_pin_to_gpio(struct intel_pinctrl *pctrl, int pin)
>  {
>  	const struct intel_community *community;
>  	const struct intel_padgroup *padgrp;
> @@ -1488,7 +1488,6 @@ static int intel_pinctrl_pm_init(struct intel_pinctrl *pctrl)
>  	if (!communities)
>  		return -ENOMEM;
>  
> -
>  	for (i = 0; i < pctrl->ncommunities; i++) {
>  		struct intel_community *community = &pctrl->communities[i];
>  		u32 *intmask, *hostown;
> @@ -1712,7 +1711,6 @@ const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_
>  }
>  EXPORT_SYMBOL_GPL(intel_pinctrl_get_soc_data);
>  
> -#ifdef CONFIG_PM_SLEEP
>  static bool __intel_gpio_is_direct_irq(u32 value)
>  {
>  	return (value & PADCFG0_GPIROUTIOXAPIC) && (value & PADCFG0_GPIOTXDIS) &&
> @@ -1913,7 +1911,6 @@ int intel_pinctrl_resume_noirq(struct device *dev)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(intel_pinctrl_resume_noirq);
> -#endif

Can you check if this is successfully removed?  I think it won't be.
Not immediately obvious how to tidy that up given these are used
in a macro called from lots of drivers.

Maybe just leaving the ifdef is best we can do here.



>  
>  MODULE_AUTHOR("Mathias Nyman <mathias.nyman@linux.intel.com>");
>  MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
> diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
> index 1faf2ada480a..65b1699a2ed5 100644
> --- a/drivers/pinctrl/intel/pinctrl-intel.h
> +++ b/drivers/pinctrl/intel/pinctrl-intel.h
> @@ -255,15 +255,10 @@ struct intel_pinctrl {
>  int intel_pinctrl_probe_by_hid(struct platform_device *pdev);
>  int intel_pinctrl_probe_by_uid(struct platform_device *pdev);
>  
> -#ifdef CONFIG_PM_SLEEP
>  int intel_pinctrl_suspend_noirq(struct device *dev);
>  int intel_pinctrl_resume_noirq(struct device *dev);
> -#endif
>  
> -#define INTEL_PINCTRL_PM_OPS(_name)					\
> -const struct dev_pm_ops _name = {					\
> -	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(intel_pinctrl_suspend_noirq,	\
> -				      intel_pinctrl_resume_noirq)	\
> -}
> +#define INTEL_PINCTRL_PM_OPS(_name)								\
> +	DEFINE_NOIRQ_DEV_PM_OPS(_name, intel_pinctrl_suspend_noirq, intel_pinctrl_resume_noirq)
>  
>  #endif /* PINCTRL_INTEL_H */


