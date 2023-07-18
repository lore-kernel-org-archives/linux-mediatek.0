Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A21CC0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAUu6cjfwMXsoHvCmdIwowJOF3QPY5SDYBrCCXvaisE=; b=PNx7tI2dz4+MEhI4l6gOAxXs7S
	szoolkll7DmBidVaPMBFh1ns4nwshwQ8nvLY+KaJyiARaTrO+X/Gk/tGLOYJQMC5iV3INk03CiYCL
	ZbaZcf1GywQKoYLMqbUjj778dGA3CByb4G6/JdSQbjsSunwEonuZH0LOYvqii1UwLZqxyGiq8CBoz
	tA00F1fIJ8wKQpyIidpIbr+8XyYPK8HKhwRb8+KeoGqE6RjOMZarIU2Zy3v8nf8hF+xprp4A+KxHd
	QrOinobUyVVXsfRtk02e5VhPWM07tJxdFj4IgxzoAfZfBC+1f3NevkTIGmtWnZXkMvmnd0mxY0FEC
	oO+vNscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM22q-006A5w-1N;
	Wed, 19 Jul 2023 07:56:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM22g-006A2C-1a;
	Wed, 19 Jul 2023 07:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hAUu6cjfwMXsoHvCmdIwowJOF3QPY5SDYBrCCXvaisE=; b=ExwiYO5/qaWlz5aFYYb0RRLOOq
	UendujtMFSzhuVDITRlGjbGYYv0ubEDqPQes6XrP3nv/LNJfS4Ouv46vJwhH1cjlD/9CprVzyJzO7
	6PmvJtS4UxSOQEUUTeBkf4TuM2cnfSP4Hq4mhxIiWjBcXwq5re+df6AEH7yQJvGnoC7nikXYA9nFx
	VtRm5/XgdZmBzldO3IXmNcbG7aGYPJ7Ow8euFMI/YTULZk7Gt1bJibChBkX8Aeugw6yn6/KkEYPY/
	NuB+1sfn2QKwphW4EPI1EZi4xIByI5g6kH3bDsAu/yFItuoi+w6118OauXOloQev6a4od0qgN7Tfj
	7ulLIIEQ==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhP4-00BNAD-25;
	Tue, 18 Jul 2023 09:54:00 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R4vMx5rg8z6J6ts;
	Tue, 18 Jul 2023 17:50:53 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 10:53:23 +0100
Date: Tue, 18 Jul 2023 10:53:22 +0100
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
Subject: Re: [PATCH v2 02/10] pinctrl: baytrail: Make use of pm_ptr()
Message-ID: <20230718105322.000074ca@Huawei.com>
In-Reply-To: <20230717172821.62827-3-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	<20230717172821.62827-3-andriy.shevchenko@linux.intel.com>
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
X-CRM114-CacheID: sfid-20230718_105358_903479_4992EA05 
X-CRM114-Status: GOOD (  18.85  )
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

On Mon, 17 Jul 2023 20:28:13 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Cleaning up the driver to use pm_ptr() and *_PM_OPS() macros that
> make it simpler and allows the compiler to remove those functions
> if built without CONFIG_PM and CONFIG_PM_SLEEP support.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

LGTM but why is it in a set that claims to be about NOIRQ PM helper?

FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/pinctrl/intel/pinctrl-baytrail.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
> index 27aef62fc7c0..66aabac6be9c 100644
> --- a/drivers/pinctrl/intel/pinctrl-baytrail.c
> +++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
> @@ -1733,7 +1733,6 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int byt_gpio_suspend(struct device *dev)
>  {
>  	struct intel_pinctrl *vg = dev_get_drvdata(dev);
> @@ -1817,9 +1816,7 @@ static int byt_gpio_resume(struct device *dev)
>  	raw_spin_unlock_irqrestore(&byt_lock, flags);
>  	return 0;
>  }
> -#endif
>  
> -#ifdef CONFIG_PM
>  static int byt_gpio_runtime_suspend(struct device *dev)
>  {
>  	return 0;
> @@ -1829,19 +1826,17 @@ static int byt_gpio_runtime_resume(struct device *dev)
>  {
>  	return 0;
>  }
> -#endif
>  
>  static const struct dev_pm_ops byt_gpio_pm_ops = {
> -	SET_LATE_SYSTEM_SLEEP_PM_OPS(byt_gpio_suspend, byt_gpio_resume)
> -	SET_RUNTIME_PM_OPS(byt_gpio_runtime_suspend, byt_gpio_runtime_resume,
> -			   NULL)
> +	LATE_SYSTEM_SLEEP_PM_OPS(byt_gpio_suspend, byt_gpio_resume)
> +	RUNTIME_PM_OPS(byt_gpio_runtime_suspend, byt_gpio_runtime_resume, NULL)
>  };
>  
>  static struct platform_driver byt_gpio_driver = {
>  	.probe          = byt_pinctrl_probe,
>  	.driver         = {
>  		.name			= "byt_gpio",
> -		.pm			= &byt_gpio_pm_ops,
> +		.pm			= pm_ptr(&byt_gpio_pm_ops),
>  		.acpi_match_table	= byt_gpio_acpi_match,
>  		.suppress_bind_attrs	= true,
>  	},


