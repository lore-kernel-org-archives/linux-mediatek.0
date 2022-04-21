Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B70BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 15:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mphHx/K1sGgxk8UMGEILfhAkem/hYNjsqwZj1KJsg28=; b=oS+SzUVApYDwsI
	hJbJWmXcu3SWIsIPCZxC8RXbA8hYYXGkr/kGH+DDkkIaqUMXnEDL3xrCn6ll0YF0NZS5Py/F0+LLW
	XpvNTRnd2Q5rA7+o8A8wOLZP7eLWXDTR1YMZgPZ6Ayk95lp8CsUzxs50zXRUqvkd0iX54YAXDoszY
	SgkeGSRt4tSkz8VQe91rEq4UmBsgVxl2KLmr0hiEOqdRButm7UhIxtj/o8xYlud/lOJWElW+ZIzuB
	0ipyjiQQCrwfofdwN8O7PKLQGHD1h/VyBZtCieX1enRNkqXiDn3IzegnQgsmvkMbkrhoFDqAqYWYZ
	SKtYd9PxnJLOwBPL+iqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhZAf-00E7us-Kh; Thu, 21 Apr 2022 15:56:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhZAU-00E7rg-PC
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 15:56:32 +0000
Received: by mail-wm1-x329.google.com with SMTP id q20so3477693wmq.1
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 08:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=hg5+t1tI5/VExu379t4FoAPQBxLcwwkKr34fdizzuVw=;
 b=VzskJkCcDCQbeuv/k5llpkz4MigKpI5bifyH/1Z3VnG7fM1Qi3Ou/M3Okn85+05OnL
 u/Osp0MQGZ9KhfU4ZrfCJ8/FW9W0Vw3Erk41E5XcOvTxnVJ+x9zpAwYdG2kSveNKHp9V
 kuzIAQ1eRoGPj4JWwccHQ8SaL08bwgBtbCjkXbMI1UgaGxzL/SWoDwD6aUKJbBuQoD9v
 vMD/mUg8CoZse6tkH/vG4Z6vBFQfKnMzYC0PKbRFWV7sEO2jRDui1/VFxUv64SOzH8Mz
 KLKOzwHlJ3r4bGoxiPmXzH8lqqUZnq9Rsyp0Mh9mFDY0NHl+bB7IP/diNoHndg2LyY0w
 /zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hg5+t1tI5/VExu379t4FoAPQBxLcwwkKr34fdizzuVw=;
 b=paHasYlecc8oNC8JEWxUIozLVkwVNyZ/zPdt4DMG0M6kFeIhWtjQe5QSfNqZBBJf0R
 gw/MaV85b8fKUIg+yA4wuFYjxjt5XlExF+JLASIH80sBxu/Fp6ABxhhZlnpVr6ZaaNGU
 kyY9Jxupjq3sed9KA93SC55zPzTuQPhu8tvLmlVWH+yjxSg/WaXvYgnBpIDCNojauJKj
 hxPPrXNGfm6jGEWv7VfzODRWN/FuTx7FK8on9CoTnWdJI9V5eTyJJIoADHeT1GSMxRVS
 AWUoDtTjO6QQsrkIErr7WiaQ60mLK2D8vZiG2Yo9bpEgL3YeqiFiTmqkCdDUIJ2JgBN+
 /Phg==
X-Gm-Message-State: AOAM531aANuigvKlIDwZB6L4eGvmJ01XT1fa7iuMuhvGs7PKnPC6PAFb
 jKnaHNKwZHOv2xcWITKGedKZ8g==
X-Google-Smtp-Source: ABdhPJxfH6CtSqSm5CaL6PkezTdrkLgN3B7QyDME5WxDMEF1GYNxMeqXUldfWl7CVfsIIILdrWSOQQ==
X-Received: by 2002:a05:600c:1d08:b0:38f:fb9d:5758 with SMTP id
 l8-20020a05600c1d0800b0038ffb9d5758mr24852wms.89.1650556587103; 
 Thu, 21 Apr 2022 08:56:27 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:e19f:c42c:d783:89c1])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b0020a992ce354sm3020151wrc.76.2022.04.21.08.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:56:26 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Fabien Parent <fparent@baylibre.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] Input: mtk-pmic-keys: rename platform data struct
In-Reply-To: <20220415153629.1817202-5-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
 <20220415153629.1817202-5-fparent@baylibre.com>
Date: Thu, 21 Apr 2022 17:56:25 +0200
Message-ID: <87ilr2zaza.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_085630_844206_DF2ECF29 
X-CRM114-Status: GOOD (  17.89  )
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

On ven., avril 15, 2022 at 17:36, Fabien Parent <fparent@baylibre.com> wrote:

> Rename the struct that is given to the .data field of the of_device_id
> entries to reflect that this structure will not only contain register
> definitions but also other platform data.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Tested-by: Mattijs Korpershoek <mkorpershoek@baylibre.com> # on mt8183-pumpkin 

> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index c31ab4368388..a0da644fe93d 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -50,12 +50,12 @@ struct mtk_pmic_keys_regs {
>  	.intsel_mask		= _intsel_mask,		\
>  }
>  
> -struct mtk_pmic_regs {
> +struct mtk_pmic_keys_pdata {
>  	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
>  	u32 pmic_rst_reg;
>  };
>  
> -static const struct mtk_pmic_regs mt6397_regs = {
> +static const struct mtk_pmic_keys_pdata mt6397_pdata = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6397_CHRSTATUS,
>  		0x8, MT6397_INT_RSV, 0x10),
> @@ -65,7 +65,7 @@ static const struct mtk_pmic_regs mt6397_regs = {
>  	.pmic_rst_reg = MT6397_TOP_RST_MISC,
>  };
>  
> -static const struct mtk_pmic_regs mt6323_regs = {
> +static const struct mtk_pmic_keys_pdata mt6323_pdata = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
>  		0x2, MT6323_INT_MISC_CON, 0x10),
> @@ -75,7 +75,7 @@ static const struct mtk_pmic_regs mt6323_regs = {
>  	.pmic_rst_reg = MT6323_TOP_RST_MISC,
>  };
>  
> -static const struct mtk_pmic_regs mt6358_regs = {
> +static const struct mtk_pmic_keys_pdata mt6358_pdata = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
>  				   0x2, MT6358_PSC_TOP_INT_CON0, 0x5),
> @@ -255,13 +255,13 @@ static SIMPLE_DEV_PM_OPS(mtk_pmic_keys_pm_ops, mtk_pmic_keys_suspend,
>  static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
>  	{
>  		.compatible = "mediatek,mt6397-keys",
> -		.data = &mt6397_regs,
> +		.data = &mt6397_pdata,
>  	}, {
>  		.compatible = "mediatek,mt6323-keys",
> -		.data = &mt6323_regs,
> +		.data = &mt6323_pdata,
>  	}, {
>  		.compatible = "mediatek,mt6358-keys",
> -		.data = &mt6358_regs,
> +		.data = &mt6358_pdata,
>  	}, {
>  		/* sentinel */
>  	}
> @@ -277,7 +277,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  	static const char *const irqnames[] = { "powerkey", "homekey" };
>  	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
>  	struct mtk_pmic_keys *keys;
> -	const struct mtk_pmic_regs *mtk_pmic_regs;
> +	const struct mtk_pmic_keys_pdata *mtk_pmic_keys_pdata;
>  	struct input_dev *input_dev;
>  	const struct of_device_id *of_id =
>  		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
> @@ -288,7 +288,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  
>  	keys->dev = &pdev->dev;
>  	keys->regmap = pmic_chip->regmap;
> -	mtk_pmic_regs = of_id->data;
> +	mtk_pmic_keys_pdata = of_id->data;
>  
>  	keys->input_dev = input_dev = devm_input_allocate_device(keys->dev);
>  	if (!input_dev) {
> @@ -310,7 +310,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  	}
>  
>  	for_each_child_of_node(node, child) {
> -		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
> +		keys->keys[index].regs = &mtk_pmic_keys_pdata->keys_regs[index];
>  
>  		keys->keys[index].irq =
>  			platform_get_irq_byname(pdev, irqnames[index]);
> @@ -358,7 +358,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  		return error;
>  	}
>  
> -	mtk_pmic_keys_lp_reset_setup(keys, mtk_pmic_regs->pmic_rst_reg);
> +	mtk_pmic_keys_lp_reset_setup(keys, mtk_pmic_keys_pdata->pmic_rst_reg);
>  
>  	platform_set_drvdata(pdev, keys);
>  
> -- 
> 2.35.2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
