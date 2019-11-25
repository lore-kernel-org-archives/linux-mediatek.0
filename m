Return-Path: <SRS0=x9ei=ZR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA345C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 09:40:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90638207FD
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 09:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XTcsWV2Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fj9HaZFO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90638207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KqLtqCF8wJgZkXgpTRy7jZ5FNwTaoiCit98yxw8SFQg=; b=XTcsWV2Q/Bx6qc
	zJEedIC/vlMgMekFK+tynoIVfW5yL23a5ehwiYtk56TVOCzZQ3maB39VFNBk+k9ZmsHLJVd1mn54+
	dXu4yxgxZOqAn7Ico2fIGvN50bZxQwFQlnAQpD6pEMa1ezeWvpS3ob7adDPUI31i7OXLx06W3su44
	nsPBw4zVCMz2mHLTd70Pa3Q3LDrF6tc63E7y4hiy/KT5lFmUIujbmGTA9T3rbqFALU2wxOywviPb3
	hqf8pEJ7bfXPIL6zI7lZoKmxs9iVc9sf/DBb/dCkbEsljCh/pK1xUYLXv/lB6h+yr1xXtYA4/ljju
	Nnh1ApJ9ZUq+b1a0R9Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZArE-0007iW-5G; Mon, 25 Nov 2019 09:40:36 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZ7fk-0002Sf-TO; Mon, 25 Nov 2019 06:16:35 +0000
Received: by mail-oi1-x243.google.com with SMTP id o12so12034754oic.9;
 Sun, 24 Nov 2019 22:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=NJpCr4R+3WAviM6SLTFzHWBfwjLNKZd7X8haWCV9GGo=;
 b=Fj9HaZFO/ioVEu7CN+ICTXq3cx8z6tPa5p49DKGQplUHKhsiDMoVlAuw9Ur7/7Zg71
 j5ysfoV4qmYlrCoK48AT2tExVSD7cg5YeEbPi3zPXvlaqiEGEV6tPGKeNbs7/FHMBGx6
 JJbxuQ/AIzJinJxFlEg0f7bbVz0xq3WhoNyqt40izHSVuvdvY7O8xwYuM8Xt4gCYdB12
 sAVXF4vaurV+9fJew7sfWyxEwPjVdc0ycOYPEAXwxxwO825ciVQ21t06cmgSBPej1cpb
 d2xG+ZA8dJNUeGzfs7wm3AoEIBKlwmdz06EGsQe0ZdpNTte70pPHbrDGX0oRHuU8EykR
 ummQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition:user-agent;
 bh=NJpCr4R+3WAviM6SLTFzHWBfwjLNKZd7X8haWCV9GGo=;
 b=fz9ZivTOww77es7MjKu4ExTFN+5VCRO+kYwG852FiFmncIr3em1rKpBpFL5uuGvFgJ
 hl42zycOjLQs3TDuSdIWFvYa8y692n/S7ZoSlf4t8B3HcsI5xjHutAcjSoOMl5zfHy6Z
 6H4BbNU+yOsDQUlOXmRKrjtWuivFnT+IJ4esnNdNpGMmVvd8TkQ80i501lHCit7z+xOo
 PxXy1MdEqYuHgDyNog+NaAm6PLGObzRmy7+C0vTU1ksYj0+11zryCmuH7c6ZQS3/7Gl6
 O4oEeM09DdPnOk/8uqVWRTRZrAcTuoapz3tI6HwI1hN3sF8+ugigex7YiGkohw+1oJAc
 hScQ==
X-Gm-Message-State: APjAAAWHtO5WWnQkcFyJOtsQL/WxGgGeSi7P6gI817zD6erIpAWEDqBT
 fXLt8SjMtYOdzaD39LX5fVE=
X-Google-Smtp-Source: APXvYqyEa9YLh7eHkAthmKMtOoTEUu01iwoOqoASwt+6SYp3Biv4O6+q/c71MxSRFOvOQmoPm6v0WQ==
X-Received: by 2002:aca:5a08:: with SMTP id o8mr20541735oib.104.1574662588984; 
 Sun, 24 Nov 2019 22:16:28 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c1sm2112384otn.44.2019.11.24.22.16.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 24 Nov 2019 22:16:28 -0800 (PST)
Date: Sun, 24 Nov 2019 22:16:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v5 2/2] watchdog: mtk_wdt: mt8183: Add reset controller
Message-ID: <20191125061627.GA7313@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191124_221632_975168_754A4845 
X-CRM114-Status: GOOD (  23.11  )
X-Mailman-Approved-At: Mon, 25 Nov 2019 01:40:34 -0800
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, yong.liang@mediatek.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 eason.yen@mediatek.com, yingjoe.chen@mediatek.com, wim@linux-watchdog.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 25, 2019 at 11:03:50AM +0800, Jiaxin Yu wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Add reset controller API in watchdog driver.
> Besides watchdog, MTK toprgu module also provide sub-system (eg, audio,
> camera, codec and connectivity) software reset functionality.
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: jiaxin.yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---
>  drivers/watchdog/Kconfig   |   1 +
>  drivers/watchdog/mtk_wdt.c | 111 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 111 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 2e07caab9db2..629249fe5305 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -717,6 +717,7 @@ config MEDIATEK_WATCHDOG
>  	tristate "Mediatek SoCs watchdog support"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	select WATCHDOG_CORE
> +	select RESET_CONTROLLER
>  	help
>  	  Say Y here to include support for the watchdog timer
>  	  in Mediatek SoCs.
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 9c3d0033260d..d29484c7940a 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,6 +9,9 @@
>   * Based on sunxi_wdt.c
>   */
>  
> +#include <dt-bindings/reset-controller/mt2712-resets.h>
> +#include <dt-bindings/reset-controller/mt8183-resets.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> @@ -16,10 +19,12 @@
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/watchdog.h>
> -#include <linux/delay.h>
>  
>  #define WDT_MAX_TIMEOUT		31
>  #define WDT_MIN_TIMEOUT		1
> @@ -44,6 +49,9 @@
>  #define WDT_SWRST		0x14
>  #define WDT_SWRST_KEY		0x1209
>  
> +#define WDT_SWSYSRST		0x18U
> +#define WDT_SWSYS_RST_KEY	0x88000000
> +
>  #define DRV_NAME		"mtk-wdt"
>  #define DRV_VERSION		"1.0"
>  
> @@ -53,8 +61,99 @@ static unsigned int timeout;
>  struct mtk_wdt_dev {
>  	struct watchdog_device wdt_dev;
>  	void __iomem *wdt_base;
> +	spinlock_t lock; /* protects WDT_SWSYSRST reg */
> +	struct reset_controller_dev rcdev;
> +};
> +
> +struct mtk_wdt_data {
> +	int sw_rst_num;
>  };
>  
> +static const struct mtk_wdt_data mt2712_data = {
> +	.sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> +};
> +
> +static const struct mtk_wdt_data mt8183_data = {
> +	.sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
> +};

The number of resets can be set in .data directly; there is no need
for the structures.

> +
> +static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	unsigned int tmp;
> +	unsigned long flags;
> +	struct mtk_wdt_dev *data =
> +		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	tmp = __raw_readl(data->wdt_base + WDT_SWSYSRST);
> +	tmp |= BIT(id);
> +	tmp |= WDT_SWSYS_RST_KEY;
> +	writel(tmp, data->wdt_base + WDT_SWSYSRST);
> +
> +	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	unsigned int tmp;
> +	unsigned long flags;
> +	struct mtk_wdt_dev *data =
> +		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	tmp = __raw_readl(data->wdt_base + WDT_SWSYSRST);
> +	tmp &= ~BIT(id);
> +	tmp |= WDT_SWSYS_RST_KEY;
> +	writel(tmp, data->wdt_base + WDT_SWSYSRST);
> +
> +	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	return 0;
> +}

There is a lot of duplication in those functions. Only one line
is different. I think this is a good example where a helper function
with an additional argument indicating set or reset would be helpful.

> +
> +static int toprgu_reset(struct reset_controller_dev *rcdev,
> +			unsigned long id)
> +{
> +	int ret;
> +
> +	ret = toprgu_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	return toprgu_reset_deassert(rcdev, id);
> +}
> +
> +static const struct reset_control_ops toprgu_reset_ops = {
> +	.assert = toprgu_reset_assert,
> +	.deassert = toprgu_reset_deassert,
> +	.reset = toprgu_reset,
> +};
> +
> +static int toprgu_register_reset_controller(struct platform_device *pdev,
> +					    int rst_num)
> +{
> +	int ret;
> +	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
> +
> +	spin_lock_init(&mtk_wdt->lock);
> +
> +	mtk_wdt->rcdev.owner = THIS_MODULE;
> +	mtk_wdt->rcdev.nr_resets = rst_num;
> +	mtk_wdt->rcdev.ops = &toprgu_reset_ops;
> +	mtk_wdt->rcdev.of_node = pdev->dev.of_node;
> +	ret = reset_controller_register(&mtk_wdt->rcdev);
> +	if (ret != 0)
> +		dev_err(&pdev->dev,
> +			"couldn't register wdt reset controller: %d\n", ret);
> +	return ret;
> +}
> +
>  static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>  			   unsigned long action, void *data)
>  {
> @@ -155,6 +254,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct mtk_wdt_dev *mtk_wdt;
> +	struct mtk_wdt_data *wdt_data;
>  	int err;
>  
>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
> @@ -190,6 +290,13 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
>  		 mtk_wdt->wdt_dev.timeout, nowayout);
>  
> +	wdt_data = (struct mtk_wdt_data *)of_device_get_match_data(dev);
> +	if (wdt_data) {
> +		err = toprgu_register_reset_controller(pdev,
> +						       wdt_data->sw_rst_num);
> +		if (err)
> +			return err;

If this happens, the user will wonder why there was a message "Watchdog
enabled", but there is no watchdog. It would be better to call this
function before the dev_info() above.

Guenter

> +	}
>  	return 0;
>  }
>  
> @@ -218,7 +325,9 @@ static int mtk_wdt_resume(struct device *dev)
>  #endif
>  
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
> +	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
>  	{ .compatible = "mediatek,mt6589-wdt" },
> +	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
