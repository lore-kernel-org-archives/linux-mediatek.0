Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22557C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eP/e6gNCjdrxPMD7QuyApb/x/j4sdbLTZeekH8EfUtE=; b=mjPEnDR3odknNEoSNqzpphZnbC
	R9Y1fB/lode7kn4CN7wJdS3Prk77UmT+r5NrSkq9zhOfEzD6j44OpAdYODUsn5XrXSQYgf/m5+g2N
	eWOZy3FzzWpkkGnUMM+LiAqrr6LfIhTY6aY3NeETKSzDukaLJueqlAf9NS+elK1hrFp/3kLv92zuU
	zlSaPLgia8B4OjOqQ3s6Q6cxAOs+G4g5740WDOd127AJQpU5i0wm62VtQgz7mkpX3A9g5zNlfWUWn
	G05luEW7r+sElXURxg9cGWf/qooDsKgtDRAezXMKb2qvQI7WcWPFK6RQ71Usnmg8pGirxTF+QI618
	1XsWcS0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0y6-005tbz-2b;
	Wed, 19 Jul 2023 06:47:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0xr-005tSq-1G;
	Wed, 19 Jul 2023 06:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eP/e6gNCjdrxPMD7QuyApb/x/j4sdbLTZeekH8EfUtE=; b=C+685dFNWRUZQ2Lcwf7UGPDTYS
	t0R1WfUbX7lFazcNBmUDcNHZXv2MNHk+5izvKEBWin5euImIq00bf2/+t79meBJgudbmanJ0RbmXc
	/z9lPwMzyPPNoqvfs/G/7S6ieqEkzqy27go5TUg98A61JrJfH9JfRRlfTrdOyXBKHv21jnGWwBIQT
	vr2qn0YuZd5LqmmiEblMZqk0eNTgBU4AFjZj1cdBSzEMIaNp9jFozxt5rKlAsomoryNUEIBqaE8KP
	oTqUx+fU31TfT1TQ7Fk8TborKEvC2z0CkNT5hflqNgMK8tijSmia7bxS9YTfZEhOdz/L2xkEJMBh1
	ZbClr+lQ==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhQX-00BNej-0R;
	Tue, 18 Jul 2023 09:55:33 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R4vN051Rxz67f4J;
	Tue, 18 Jul 2023 17:50:56 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 10:54:54 +0100
Date: Tue, 18 Jul 2023 10:54:53 +0100
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
Subject: Re: [PATCH v2 03/10] pinctrl: cherryview: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
Message-ID: <20230718105453.00004dc3@Huawei.com>
In-Reply-To: <20230717172821.62827-4-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	<20230717172821.62827-4-andriy.shevchenko@linux.intel.com>
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
X-CRM114-CacheID: sfid-20230718_105531_083328_B208FA77 
X-CRM114-Status: GOOD (  17.40  )
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

On Mon, 17 Jul 2023 20:28:14 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Formatting comment inline. Otherwise LGTM

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index eee0f9bc3d32..7a2fc9fe175d 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1793,7 +1793,6 @@ static int chv_pinctrl_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int chv_pinctrl_suspend_noirq(struct device *dev)
>  {
>  	struct intel_pinctrl *pctrl = dev_get_drvdata(dev);
> @@ -1877,12 +1876,8 @@ static int chv_pinctrl_resume_noirq(struct device *dev)
>  
>  	return 0;
>  }
> -#endif
>  
> -static const struct dev_pm_ops chv_pinctrl_pm_ops = {
> -	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(chv_pinctrl_suspend_noirq,
> -				      chv_pinctrl_resume_noirq)
> -};
> + static DEFINE_NOIRQ_DEV_PM_OPS(chv_pinctrl_pm_ops, chv_pinctrl_suspend_noirq, chv_pinctrl_resume_noirq);

Very long line and readability not hurt by breaking it.

>  
>  static const struct acpi_device_id chv_pinctrl_acpi_match[] = {
>  	{ "INT33FF", (kernel_ulong_t)chv_soc_data },
> @@ -1895,7 +1890,7 @@ static struct platform_driver chv_pinctrl_driver = {
>  	.remove = chv_pinctrl_remove,
>  	.driver = {
>  		.name = "cherryview-pinctrl",
> -		.pm = &chv_pinctrl_pm_ops,
> +		.pm = pm_sleep_ptr(&chv_pinctrl_pm_ops),
>  		.acpi_match_table = chv_pinctrl_acpi_match,
>  	},
>  };


