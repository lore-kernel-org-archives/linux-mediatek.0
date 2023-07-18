Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40453C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeKj/GTIhW3XqcMjKYKgq233JDGzlX9fdLoBptj5fFI=; b=r58SV3MI4ZEBjk2kXfNNKghvwT
	C2dBUo7isDL4mElOKcyLznYi3oBfauBI4twmTKiMDzTnddXIifGcPt0+tAsLiaQr29rqOUieBdInz
	xnDqqepwOYPMUgua7m0g3999MkVJpCuMfy6azv+lB7uCN3WETrmRpdMPVow6X1s+BGN7coIcxKeSP
	NLC6BJWVmWTWv1mP9X3QsKwpEmWOGR3vhSebO1EdqAIBNZvWZEIhTWnv94tNbpbxOOX8I01/3WEWj
	jqIJt44yU7BOKTA2EffOsuwzj8uYxLJjhSBDwGkN7RBPnI4G6XoSLLCb960Y1KQeocqEd3K9j9V0I
	A6l/1hrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM13x-005x1T-0m;
	Wed, 19 Jul 2023 06:53:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM13r-005wyf-3C;
	Wed, 19 Jul 2023 06:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WeKj/GTIhW3XqcMjKYKgq233JDGzlX9fdLoBptj5fFI=; b=VhHy3HL9CqoEsgVp8ooUDQdN2i
	VDTNlhbk9AaiIFfRcnVpejqRGy5gGAQPG4q/cttvKu7N+atyINarsW3l4IRToxjt7jwd+1JTEV1zf
	rSGDY59HyD5bSvbEyKj4SdoPepLACRBa88FFd96c5lh5j2xcBrntItZcgNciOrwO28BogeLGACCpG
	RgfWcjUgWj3pkIx7VfyccR8aO/TdxT5zVjQsjkTh0RQkKlbP0HTcVEmuXCemV+jeFVn4bwdWQ9DJO
	qgE3jNnt0qMm1KOjnHnuKmLcdXAx1n/ZTaFmVMVqZ1cSP6tw6TfBI85Yc98SbSk3Aa+izUPvTkkZj
	AKOmQalg==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhca-00BOn6-0e;
	Tue, 18 Jul 2023 10:07:58 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4R4vft5t8Fz6D8X6;
	Tue, 18 Jul 2023 18:03:50 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 18 Jul
 2023 11:07:48 +0100
Date: Tue, 18 Jul 2023 11:07:46 +0100
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
Subject: Re: [PATCH v2 07/10] pinctrl: mediatek: Switch to use
 DEFINE_NOIRQ_DEV_PM_OPS() helper
Message-ID: <20230718110746.00001bdb@Huawei.com>
In-Reply-To: <20230717172821.62827-8-andriy.shevchenko@linux.intel.com>
References: <20230717172821.62827-1-andriy.shevchenko@linux.intel.com>
	<20230717172821.62827-8-andriy.shevchenko@linux.intel.com>
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
X-CRM114-CacheID: sfid-20230718_110756_766367_BFFF1D48 
X-CRM114-Status: GOOD (  13.89  )
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

On Mon, 17 Jul 2023 20:28:18 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Since pm.h provides a helper for system no-IRQ PM callbacks,
> switch the driver to use it instead of open coded variant.

Good to mention the renames as well.

> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 5 +----
>  drivers/pinctrl/mediatek/pinctrl-paris.c      | 9 +++------
>  2 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 665dec419e7c..2bf5082d3aa9 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -922,10 +922,7 @@ static int mtk_eint_resume(struct device *device)
>  	return mtk_eint_do_resume(pctl->eint);
>  }
>  
> -const struct dev_pm_ops mtk_eint_pm_ops = {
> -	.suspend_noirq = mtk_eint_suspend,
> -	.resume_noirq = mtk_eint_resume,
> -};
> +DEFINE_NOIRQ_DEV_PM_OPS(mtk_eint_pm_ops, mtk_eint_suspend, mtk_eint_resume);
>  
>  static int mtk_pctrl_build_state(struct platform_device *pdev)
>  {
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 33d6c3fb7908..b1cbd5bafa2e 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -1119,24 +1119,21 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe);
>  
> -static int mtk_paris_pinctrl_suspend(struct device *device)
> +static int mtk_paris_suspend(struct device *device)
>  {
>  	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
>  
>  	return mtk_eint_do_suspend(pctl->eint);
>  }
>  
> -static int mtk_paris_pinctrl_resume(struct device *device)
> +static int mtk_paris_resume(struct device *device)
>  {
>  	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
>  
>  	return mtk_eint_do_resume(pctl->eint);
>  }
>  
> -const struct dev_pm_ops mtk_paris_pinctrl_pm_ops = {
> -	.suspend_noirq = mtk_paris_pinctrl_suspend,
> -	.resume_noirq = mtk_paris_pinctrl_resume,
> -};
> +DEFINE_NOIRQ_DEV_PM_OPS(mtk_paris_pinctrl_pm_ops, mtk_paris_suspend, mtk_paris_resume);
>  
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Paris");


