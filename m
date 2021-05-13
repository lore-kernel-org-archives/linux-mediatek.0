Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE6CC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 15:23:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2307613B5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 15:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2307613B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ix2t17QtDf3TkrNUbnsyZ6ozsvO4mjVtKLXFITfsfHw=; b=eUOxzdEgmg8M8S4SXGPictKe8
	j07n3s739JYoBR7Se5Q0VOXFHbiQE/nYEgic3MxKH4p1tULGy2jb/nL1dknOsk7Kuc0AVStXDldqB
	AJQ2mA23MPBPZ2ZlLcYPXvNAOJBbmjHmUBT/I6heZJnjTrTxMVl/NuN6VT2mo8UP/uQuyP6ZVU3Du
	/AMt/AxT+j+TX31EDQpWnWNnWBS09q/z8O/y9Z+8yqg7I2y5ovNg9k1u5NoRKL1K0EJ9tExL4Ue58
	u+YUvwvrT8UdUS7VeRFuZe0Himvf27fehkRiNDB7DA4It8qdI40MDi3c7wwVD+Alkdkn8wTXo1woB
	OdBDEKpBw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhDAp-005rC9-Bt; Thu, 13 May 2021 15:22:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhDAl-005rBQ-4a
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 15:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ddgw19J7nFgqd+PxxIl26anEYyCgVAbr8jwklmvRTts=; b=DqxpWVOvvq+MEbEbCRDZlerQaL
 udM/ciiIuK86MvsdnOHezMUTQ61klqK3lsmh+XOSy5Psh2tLl7mmvdzzVDDvUWF/wiWPcvacdd/AG
 OxbAfNv0GOj6D8vERoEekHECkJpWN6gRhqkKZKNbS3ToUoig9g/oagIHbzndj6GErPdX10wMcz6En
 w/YShLQPz8FmDh24iLiDcGcjZfQq9OhZe6oGBILB7DIJs1BNaSxpAQrlrYEKAyOmZzBHYK5c1Lza7
 9A8RZL0GHFnbEZqlhJge+T+NQ92+GlYQxnGutrRA0MAkoLtzSvPeXwz1iYh7Ttnmu26C8An6loDZl
 dvNDeS0w==;
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhDAh-00BLxt-Uj
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 15:22:45 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id t1so837177qvz.12
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 08:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ddgw19J7nFgqd+PxxIl26anEYyCgVAbr8jwklmvRTts=;
 b=u9BWv26ecEYgsZJQLTPQ1fDY1+vuQeNeY0P2/lB8SltF6nnydy5F7N3p9zZ1W+l+iO
 KokpvNAzEnGh/gyQJ65uHN672BvxnR1/MMSHEqZtMb28j8FqWSmqwgR9qAknK//hl8k/
 A/0SpFQrtvB4DWfJfkjXpIiMzBbmdJ1OJsPFjAgm/Mi8LEn6GTzse8ltHwAk/+ooL+ec
 nQP1+JAlHW6tdtvp8E7QQMGRakR9bSJpQtbbZqxcScU25N2aYXc/9SeFmeq+NAgZ9pdK
 ql5T/ob4aaVy1aiOL6OB1l9Q603dJ7rHhgUSVm0TpkVSDsSxUFD6lb7GEUHoJqZNGsPW
 VZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=ddgw19J7nFgqd+PxxIl26anEYyCgVAbr8jwklmvRTts=;
 b=Jz5+9gNJia9yoO1scTfGD7Qh1RRVo4RhWZwemrvNYAvBjlsrV2dAuqKQKlXcMqphFB
 DboJslNs2ernl1ymvVF/o8/wMn61PFL7dj0MwM9PPJxGX8nQtFmTXD9wH31+je2EZElf
 /5KRQMDxUu+Q5sr37tBJ1Mv4uxOwO8J0CuCgLi0Vu7v1BAOePSQ4mCyg4LXLwGMmxh5i
 nwnsN5JSf5fOmMowrTSqGanGdfLHVCrB+6roxOzDl92UGLDVCDwkhXUSW1RrEJ42PVuZ
 5r1mHA32v/s2yfrcH0A9wptaLVvDNlGJ8Bt1qZ4JgwdIRGXTPgmXbNIDq2tkwQwJCsp3
 E5Cg==
X-Gm-Message-State: AOAM533zCs/WghNBK+pqDecQ1ahjqu35azzFX42jmkV700muYARX6ctQ
 UrOX3Vb6JLRhZHYL86uUY5I=
X-Google-Smtp-Source: ABdhPJxsVZIQ0+sJFNGOD7aUHAYP87dC8j8TCB9c/ZE837YHlRVrsmCnUpdBim5ZPMrh6zdQmNUw2Q==
X-Received: by 2002:a0c:db03:: with SMTP id d3mr3917279qvk.6.1620919362195;
 Thu, 13 May 2021 08:22:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id s5sm2652763qkg.88.2021.05.13.08.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 08:22:41 -0700 (PDT)
Date: Thu, 13 May 2021 08:22:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Boris Lysov <arzamas-16@mail.ee>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] watchdog: mtk_wdt: Refactor code to support more
 SoCs
Message-ID: <20210513152240.GA3452915@roeck-us.net>
References: <20210513013515.31329-1-arzamas-16@mail.ee>
 <20210513013515.31329-2-arzamas-16@mail.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513013515.31329-2-arzamas-16@mail.ee>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_082244_023279_5C087D1E 
X-CRM114-Status: GOOD (  28.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 13, 2021 at 04:35:13AM +0300, Boris Lysov wrote:
> This patch makes some constants SoC-dependent to support more watchdogs
> in the future. It adds shifts of WDT_MODE_KEY and SWSYSRST_KEY to
> mtk_wdt_data struct. This is done to bring support for various Mediatek
> watchdogs which use same register structure but slightly different field
> offsets in the UNLOCK_KEY registers. For example, mt6577 watchdog has
> WDT_MODE_KEY and SWSYSRST_KEY at [15:8] instead of currently (and only)
> supported [31:24].
> Moreover, this patch adds SWSYSRST_KEY value to mtk_wdt_data because this
> value also depends on specific SoC watchdog, for example mt6577 uses 0x15
> instead of 0x88.
> 
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes since v2 [3]:
> - rename the newly introduced structure element ('data' -> 'config') to
>   avoid changing the names of already existing variables; suggested [4]
>   by Guenter Roeck.
> 
> Changes since v1 [1]:
> - a complete rewrite to get rid of the configuration flags which made
>   the watchdog not support other SoCs; suggested [2] by Guenter Roeck.
> 
> [1] https://lore.kernel.org/linux-mediatek/20210131234425.9773-3-arzamas-16@mail.ee/
> [2] https://lore.kernel.org/linux-mediatek/050f2f8e-9c3c-10e3-05ef-cd84e949b98f@roeck-us.net/
> [3] https://lore.kernel.org/linux-mediatek/20210509211702.549-2-arzamas-16@mail.ee/
> [4] https://lore.kernel.org/linux-mediatek/efdce3a5-e5b4-19a8-35f1-8a536220bb3f@roeck-us.net/
> 
>  drivers/watchdog/mtk_wdt.c | 66 ++++++++++++++++++++++++++++++--------
>  1 file changed, 52 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 97ca993bd009..0878fa33dffe 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -44,13 +44,27 @@
>  #define WDT_MODE_IRQ_EN		(1 << 3)
>  #define WDT_MODE_AUTO_START	(1 << 4)
>  #define WDT_MODE_DUAL_EN	(1 << 6)
> -#define WDT_MODE_KEY		0x22000000
> +#define WDT_MODE_KEY		0x22
>  
>  #define WDT_SWRST		0x14
>  #define WDT_SWRST_KEY		0x1209
> -
>  #define WDT_SWSYSRST		0x18U
> -#define WDT_SWSYS_RST_KEY	0x88000000
> +
> +#define MT2712_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT2712_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT2712_SWSYSRST_KEY		0x88
> +
> +#define MT6589_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT6589_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT6589_SWSYSRST_KEY		0x88
> +
> +#define MT8183_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT8183_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT8183_SWSYSRST_KEY		0x88
> +
> +#define MT8192_WDT_MODE_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT8192_SWSYSRST_KEY_SHIFT	24		// unlock_key [31:24]
> +#define MT8192_SWSYSRST_KEY		0x88
>  
>  #define DRV_NAME		"mtk-wdt"
>  #define DRV_VERSION		"1.0"
> @@ -60,6 +74,7 @@ static unsigned int timeout;
>  
>  struct mtk_wdt_dev {
>  	struct watchdog_device wdt_dev;
> +	const struct mtk_wdt_data *config;
>  	void __iomem *wdt_base;
>  	spinlock_t lock; /* protects WDT_SWSYSRST reg */
>  	struct reset_controller_dev rcdev;
> @@ -67,18 +82,37 @@ struct mtk_wdt_dev {
>  
>  struct mtk_wdt_data {
>  	int toprgu_sw_rst_num;
> +	u8 wdt_mode_key_shift;
> +	u8 wdt_swsys_rst_key;
> +	u8 wdt_swsys_rst_key_shift;
>  };
>  
>  static const struct mtk_wdt_data mt2712_data = {
> -	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
> +	.toprgu_sw_rst_num =		MT2712_TOPRGU_SW_RST_NUM,
> +	.wdt_mode_key_shift =		MT2712_WDT_MODE_KEY_SHIFT,
> +	.wdt_swsys_rst_key_shift =	MT2712_SWSYSRST_KEY_SHIFT,
> +	.wdt_swsys_rst_key =		MT2712_SWSYSRST_KEY,
> +};
> +
> +static const struct mtk_wdt_data mt6589_data = {
> +	.toprgu_sw_rst_num =		-1,
> +	.wdt_mode_key_shift =		MT6589_WDT_MODE_KEY_SHIFT,
> +	.wdt_swsys_rst_key_shift =	MT6589_SWSYSRST_KEY_SHIFT,
> +	.wdt_swsys_rst_key =		MT6589_SWSYSRST_KEY,
>  };
>  
>  static const struct mtk_wdt_data mt8183_data = {
> -	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
> +	.toprgu_sw_rst_num =		MT8183_TOPRGU_SW_RST_NUM,
> +	.wdt_mode_key_shift =		MT8183_WDT_MODE_KEY_SHIFT,
> +	.wdt_swsys_rst_key_shift =	MT8183_SWSYSRST_KEY_SHIFT,
> +	.wdt_swsys_rst_key =		MT8183_SWSYSRST_KEY,
>  };
>  
>  static const struct mtk_wdt_data mt8192_data = {
> -	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
> +	.toprgu_sw_rst_num =		MT8192_TOPRGU_SW_RST_NUM,
> +	.wdt_mode_key_shift =		MT8192_WDT_MODE_KEY_SHIFT,
> +	.wdt_swsys_rst_key_shift =	MT8192_SWSYSRST_KEY_SHIFT,
> +	.wdt_swsys_rst_key =		MT8192_SWSYSRST_KEY,
>  };
>  
>  static int toprgu_reset_update(struct reset_controller_dev *rcdev,
> @@ -96,7 +130,7 @@ static int toprgu_reset_update(struct reset_controller_dev *rcdev,
>  		tmp |= BIT(id);
>  	else
>  		tmp &= ~BIT(id);
> -	tmp |= WDT_SWSYS_RST_KEY;
> +	tmp |= data->config->wdt_swsys_rst_key << data->config->wdt_swsys_rst_key_shift;
>  	writel(tmp, data->wdt_base + WDT_SWSYSRST);
>  
>  	spin_unlock_irqrestore(&data->lock, flags);
> @@ -221,7 +255,7 @@ static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
>  
>  	reg = readl(wdt_base + WDT_MODE);
>  	reg &= ~WDT_MODE_EN;
> -	reg |= WDT_MODE_KEY;
> +	reg |= WDT_MODE_KEY << mtk_wdt->config->wdt_mode_key_shift;
>  	iowrite32(reg, wdt_base + WDT_MODE);
>  
>  	return 0;
> @@ -240,7 +274,7 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>  
>  	reg = ioread32(wdt_base + WDT_MODE);
>  	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> -	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
> +	reg |= (WDT_MODE_EN | (WDT_MODE_KEY << mtk_wdt->config->wdt_mode_key_shift));
>  	iowrite32(reg, wdt_base + WDT_MODE);
>  
>  	return 0;
> @@ -266,7 +300,6 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct mtk_wdt_dev *mtk_wdt;
> -	const struct mtk_wdt_data *wdt_data;
>  	int err;
>  
>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
> @@ -279,6 +312,12 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	if (IS_ERR(mtk_wdt->wdt_base))
>  		return PTR_ERR(mtk_wdt->wdt_base);
>  
> +	mtk_wdt->config = of_device_get_match_data(dev);
> +	if (!mtk_wdt->config) {
> +		dev_err(dev, "watchdog data is not defined\n");
> +		return -EINVAL;
> +	}
> +
>  	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
>  	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
> @@ -302,10 +341,9 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
>  		 mtk_wdt->wdt_dev.timeout, nowayout);
>  
> -	wdt_data = of_device_get_match_data(dev);
> -	if (wdt_data) {
> +	if (mtk_wdt->config->toprgu_sw_rst_num > -1) {
>  		err = toprgu_register_reset_controller(pdev,
> -						       wdt_data->toprgu_sw_rst_num);
> +						       mtk_wdt->config->toprgu_sw_rst_num);
>  		if (err)
>  			return err;
>  	}
> @@ -338,7 +376,7 @@ static int mtk_wdt_resume(struct device *dev)
>  
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
>  	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
> -	{ .compatible = "mediatek,mt6589-wdt" },
> +	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
>  	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>  	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
>  	{ /* sentinel */ }
> -- 
> 2.20.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
