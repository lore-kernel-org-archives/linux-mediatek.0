Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B923C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vya44DEcftocFy0MswCnybxI14XXvzk/vc2t5JxIxk=; b=xJssTq8ppTj0f7f5yISzI1JrWJ
	/C8sYp/BRvXMDmiw1SQ8Z2pn/BVgLorJCUnudijBlRPmH7mSQsB9dEdLto2tATRXncDpBMIbpaJke
	EhfgWeVDRagNUanQQV/PALobPMV+NqICbrE9wrZ03+DsOFTK2NMWs3/A09gW3ZVrELrIjzxJ+cHgQ
	hm2eodIKV6F4QS6/faY4RUU/TLuNa/LGlBOjkvZuS52vdHX0vsQV5Q4K79wBPLKwnA/Ld4jAOJUCw
	sWjd839Jzhnu4aR2Dnqu2+JY2ZAbXJ/w5JSuyJJ2414SUh0ivrT1ZmXXa1D5uZsRL5YZk5+5QQVeF
	xjjJuTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLznk-005Kab-1E;
	Wed, 19 Jul 2023 05:32:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLznd-005KXU-2i;
	Wed, 19 Jul 2023 05:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3vya44DEcftocFy0MswCnybxI14XXvzk/vc2t5JxIxk=; b=GIXkSFCDrfmdHV8D3hw73+muo+
	XCUDwqfJyK7W8kpdLKOH0x0GC4n77PflrZqnxzxSMj5xNBTp9VEFka1HRGEbm1/sQb12JYRv2FBcz
	ELNeEK1KPXL7auW6Psrzvy//AuYtjijqcmhBC7yDTJS29gdXTNV9ZQaIeLQYhVsYDw93a75Z709+c
	MIU4Ne/nLMqLNyitUInD2DGmkbx36jhGH3xFp/lxO67052wMWBFciDdgIGjPTMYJtdMItttvNHGGb
	4l5rvgjY1lHUaWmQgQjxI9Ye406SpMBjM2o2GrV6/zS+o7a9wiZxEI9PZFKboIDR7yd+/JBGs6e78
	FI3K9inA==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhbc-00BOky-1j;
	Tue, 18 Jul 2023 10:06:58 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R4vf14xf2z67nbv;
	Tue, 18 Jul 2023 18:03:05 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 11:06:21 +0100
Date: Tue, 18 Jul 2023 11:06:20 +0100
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
Subject: Re: [PATCH v2 05/10] pinctrl: lynxpoint: Make use of pm_ptr()
Message-ID: <20230718110620.0000218e@Huawei.com>
In-Reply-To: <20230717172821.62827-6-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	<20230717172821.62827-6-andriy.shevchenko@linux.intel.com>
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
X-CRM114-CacheID: sfid-20230718_110657_176423_F92EAAE0 
X-CRM114-Status: GOOD (  18.30  )
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

On Mon, 17 Jul 2023 20:28:16 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Cleaning up the driver to use pm_ptr() and *_PM_OPS() macros that
> make it simpler and allows the compiler to remove those functions
> if built without CONFIG_PM and CONFIG_PM_SLEEP support.
> 

Those macros add a load more callbacks... Whilst that may well be fine,
you should definitely mention that in this patch description.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-lynxpoint.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
> index cdace55aaeac..50d92bf80e20 100644
> --- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
> +++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
> @@ -948,9 +948,8 @@ static int lp_gpio_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops lp_gpio_pm_ops = {
> -	.runtime_suspend = lp_gpio_runtime_suspend,
> -	.runtime_resume = lp_gpio_runtime_resume,
> -	.resume = lp_gpio_resume,
> +	SYSTEM_SLEEP_PM_OPS(NULL, lp_gpio_resume)
> +	RUNTIME_PM_OPS(lp_gpio_runtime_suspend, lp_gpio_runtime_resume, NULL)
>  };
>  
>  static const struct acpi_device_id lynxpoint_gpio_acpi_match[] = {
> @@ -965,7 +964,7 @@ static struct platform_driver lp_gpio_driver = {
>  	.remove         = lp_gpio_remove,
>  	.driver         = {
>  		.name   = "lp_gpio",
> -		.pm	= &lp_gpio_pm_ops,
> +		.pm	= pm_ptr(&lp_gpio_pm_ops),
>  		.acpi_match_table = lynxpoint_gpio_acpi_match,
>  	},
>  };


