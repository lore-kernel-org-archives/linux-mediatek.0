Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAB0C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 12:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3nObdLpfYANG/+Xt1TfqBgWxkMYvlfh62U5+qiIlC+E=; b=QzwsQtkUtM2u+r
	yvbYJakWU1pzZXmcoqLq5ceavKzaZF+QFuhhxMJg844QCCewJCCh4F6U+NEwrJsKBD9KuLWrogdM6
	dZpic4IIwpEoJsKCD/OjQQlYpN8qHeQ+7z927+PlZvIyY6kOk4HbQDwXtiSp2KW5Ub/mvjg2kjxZv
	VEzoBj/AE7NaVAqubWdyK9+XWKe0XgVRWnU+eAQ436LK7BndXVOSjLAoZ/Cx1L2BVFPY/BRiFNYxv
	zShfgoGEUMyhOTICDhojhpEUvXkdwd1wd0S8FJBpqYmqw0+X113BtYBj4LFpffccJt883v0U3QWsr
	/cywxmVcBZARSTGIee0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc4yT-0064DJ-2d; Wed, 06 Apr 2022 12:41:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc4yP-0064Bp-IW
 for linux-mediatek@lists.infradead.org; Wed, 06 Apr 2022 12:41:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id w4so2980741wrg.12
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Apr 2022 05:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=sp1pvHf/9GF7gJYZD0BVuhj9+/tx5WJjCJQ53j0Lu7s=;
 b=CNVpTJbhqsEeENw5+USf7Rl0d5mTwNAvQDQNL9QQi15IQlxfRFAz+ft+7SEV2AIrhv
 bmNLIuREdym2cduh84Ur8R2uCV7YH/AVP9SxvWhSpXWV5YCNfo21+DFYhh46eQ0y+GmD
 3NYXDTDTY3ujiRAEUSoa4MT1OBQM3MJ2eDHanHM6mS45FrXsF+pS3wN5s8tLBHhRN3+W
 XJu/raMsMszzEJeQTgm2CPz4+djxlqqc8a8rYHhB80ZDvoCCLRegd7joKLdoUMA8v4wO
 e434PzIyWHxfsl/PPcGL2JUD4kKUtMsJN7cXhb2JD7KtE8BynBkLX2K9KPKM6wEydwtP
 4xIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=sp1pvHf/9GF7gJYZD0BVuhj9+/tx5WJjCJQ53j0Lu7s=;
 b=0ZyQCfiLNhqfi7Q4stcdUpOt9s2WE2Vszq1WAetusL1j+XMYHaSDud50HHXmPqY4/r
 l9mPf71ZFWpJJXdxz3IQdPBN2g6uZAAb8NG8WN17G+RNGCpbBxDputEqVOCwJYJHgB3E
 +T82DwDNJNM0KcHXWNIJSpEitOkgQ271fgsfRUIJ+bcm0W/xqVU/7C2QtQY5b8hkebFF
 J0pxAt7fuPD7mff+9+tmwRbfktE+GEICj+/E3NYYkX/40IAoQGGF1028ngyF+3mC09eY
 ibvnXJ0ZEtMxXQVobaBfz8jbxWNVl04X3uepwhzH8hqsJv8HEkU1VyEt9gJ37gp+KMt1
 Tcqg==
X-Gm-Message-State: AOAM530i+XQkI674vzFYVmCQtd5o6Ibl/hcULS2FjWS22l+Sf21A9D1w
 nF2EllHg26nA1e6g1esG8KEMOg==
X-Google-Smtp-Source: ABdhPJzFvjsdL3HC5zlQzmL/PVvEFPrNgN95+P6H/z2UKiAeU+m2PSi7y0zSFSeoqHGV+qL8vEhVEg==
X-Received: by 2002:adf:d214:0:b0:204:2a98:a166 with SMTP id
 j20-20020adfd214000000b002042a98a166mr6564739wrh.406.1649248877966; 
 Wed, 06 Apr 2022 05:41:17 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:6c64:eb3a:6739:d25])
 by smtp.gmail.com with ESMTPSA id
 3-20020a5d47a3000000b0020412ba45f6sm17475132wrb.8.2022.04.06.05.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 05:41:17 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, lv.ruyi@zte.com.cn, m.felsch@pengutronix.de,
 angelogioacchino.delregno@collabora.com, fengping.yu@mediatek.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: mt6779-keypad: Move iomem pointer to probe function
In-Reply-To: <20220406115654.115093-1-angelogioacchino.delregno@collabora.com>
References: <20220406115654.115093-1-angelogioacchino.delregno@collabora.com>
Date: Wed, 06 Apr 2022 14:41:16 +0200
Message-ID: <87czhu2xlf.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_054121_872022_6888A8CE 
X-CRM114-Status: GOOD (  18.98  )
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

On mer., avril 06, 2022 at 13:56, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> The mmio base address is used for the only purpose of initializing
> regmap for this driver, hence it's not necessary to have it in the
> main driver structure, as it is used only in the probe() callback.
> Move it local to function mt6779_keypad_pdrv_probe().
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thank you Angelo,

I planned to do this myself but I've been too slow :)

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/keyboard/mt6779-keypad.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
> index 0dbbddc7f298..2e7c9187c10f 100644
> --- a/drivers/input/keyboard/mt6779-keypad.c
> +++ b/drivers/input/keyboard/mt6779-keypad.c
> @@ -24,7 +24,6 @@ struct mt6779_keypad {
>  	struct regmap *regmap;
>  	struct input_dev *input_dev;
>  	struct clk *clk;
> -	void __iomem *base;
>  	u32 n_rows;
>  	u32 n_cols;
>  	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
> @@ -91,6 +90,7 @@ static void mt6779_keypad_clk_disable(void *data)
>  static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>  {
>  	struct mt6779_keypad *keypad;
> +	void __iomem *base;
>  	int irq;
>  	u32 debounce;
>  	bool wakeup;
> @@ -100,11 +100,11 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
>  	if (!keypad)
>  		return -ENOMEM;
>  
> -	keypad->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(keypad->base))
> -		return PTR_ERR(keypad->base);
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
>  
> -	keypad->regmap = devm_regmap_init_mmio(&pdev->dev, keypad->base,
> +	keypad->regmap = devm_regmap_init_mmio(&pdev->dev, base,
>  					       &mt6779_keypad_regmap_cfg);
>  	if (IS_ERR(keypad->regmap)) {
>  		dev_err(&pdev->dev,
> -- 
> 2.35.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
