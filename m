Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E67C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 12:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0U+xdFSZtLp6T4CTjXhODF5a0LGlUCkiC5+Zoa5+V5w=; b=ko39GEtS5rUS29
	/g7Be/UfTxoMMu2IUXAo28SV1iujak90PhO7v9eJVsyIM4PZwfZxeoRGT/IUFNRmGunra13kysb2d
	JL7Yk7Oe19HTULGcDKNGmrffWpFvmDAI9Yvg5DslqVq53zLzg13SLTlTsug6Ld30m6hgjEMTmRZEz
	MuyHOwfYlCR2jipHDdabKtymXssrPkKiKoBmPg2S7XT6R9nV3h955M2HsMr8OpnHx5SEAxPmlcmKs
	DCmqjQEd/KJcTYoUsc5UMAS1jJRnh9S2u3wMgmmJM1s+bHvFZUSe5IvSUtSEKACak8TCbComiqfn/
	799HBS8c0o3ZPbfjg5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntTI4-007uUx-Df; Tue, 24 May 2022 12:05:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntTHq-007uP1-TS
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 12:05:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id m20so14270317wrb.13
 for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=YHbf01JoDsojhLj2/S6FKhSPRlY6LzPLJ9ENwzyOdpo=;
 b=rioiPkD7x119qEICbx6yUaJLCZg+w8s7FAfTSMngo4hzEia3J5zdwt+Ig98NCm2HF7
 TD5rs7+gdL00jvmlB37lmdUqwsCBwlppYpX9pIMP9Ubj/bD9PhS5zgQHauPwZDUfhhqx
 yPIpRSnmW7cU5E8gJUaTcKC4O9x9kbpW+uttrATZAzu6gfKXt9vxNd4Drbt+jorQ3LmP
 lvLfGb+zw/LkSDhcYa3b/1RYXTGvlhlmmNweQEL3Lngp5YWQ/aRvTTwib3iRWSEMc+Mc
 7YQNnOw6u8AEAyIOgkQMHOG19AT6pRbMTc9grrZPYXXdma6As+H1xofPaTuduSpmRfB+
 +0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=YHbf01JoDsojhLj2/S6FKhSPRlY6LzPLJ9ENwzyOdpo=;
 b=F5T007tjXiqKx5DMps6eimj5v9e+PrWSAqoJAzCV6pQLE/gBJmOrnnHt/IRfGAFUJH
 /4kdhw0gMyGlVrwgShbs+UF3z69gswoctlld0eI8E/IjtcE5fm9kF5m936/MRLY469rD
 QVvi6EqJTTfDi+x/Ni/CBF70+43o2L2CNriq04S3LHXNCeXlLCFU3UaGr0g/yhxVTPGq
 s9LV4fZpoVH+OLrt9HcE3plmIPjW3nLM6eauV5IB1308LLOA4fsDrztwPwmCINb8yWzV
 BVXo//i3+y+s3xiHMIM4WFCrtwWb8qTz/whEA9PrbfLCY4S//sycaN1oCgAwACFzERhV
 kPdA==
X-Gm-Message-State: AOAM532PJnjrkyz+aWG7PHNdjV9KDie9AzoY/AZtV5StfHPo4PXfJDZ2
 hmT0h1c1yGHyeECuBEHGz8rlvA==
X-Google-Smtp-Source: ABdhPJyYWIdU0PzySYlNPn09EsDClOuvRe1mdcxB0/PdjPGc3cKgvpmKJiKf9uMzWzv9joNnsPC0RQ==
X-Received: by 2002:adf:e58e:0:b0:20e:640d:494c with SMTP id
 l14-20020adfe58e000000b0020e640d494cmr23511528wrm.68.1653393916202; 
 Tue, 24 May 2022 05:05:16 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:d9b6:6217:ea92:4fe0])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adfa3c7000000b0020d0cdbf7eesm12818548wrb.111.2022.05.24.05.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 05:05:15 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Input: mtk-pmic-keys - Move long press debounce
 mask to mtk_pmic_regs
In-Reply-To: <20220524093505.85438-3-angelogioacchino.delregno@collabora.com>
References: <20220524093505.85438-1-angelogioacchino.delregno@collabora.com>
 <20220524093505.85438-3-angelogioacchino.delregno@collabora.com>
Date: Tue, 24 May 2022 14:05:14 +0200
Message-ID: <87k0abdtl1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_050519_011321_B9BCDDF7 
X-CRM114-Status: GOOD (  24.49  )
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

On mar., mai 24, 2022 at 11:35, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> As the second and last step of preparation to add support for more
> PMICs in this driver, move the long press debounce mask to struct
> mtk_pmic_regs and use that in mtk_pmic_keys_lp_reset_setup() instead
> of directly using the definition.
>
> While at it, remove the definition for MTK_PMIC_RST_DU_SHIFT as we
> are able to calculate it dynamically and spares us some unnecessary
> new definitions around for future per-PMIC variations of RST_DU_MASK.
>
> Lastly, it was necessary to change the function signature of
> mtk_pmic_keys_lp_reset_setup() to now pass a pointer to the main
> mtk_pmic_regs structure, since that's where the reset debounce
> mask now resides.
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index 2509a349a173..6404081253ea 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -19,7 +19,6 @@
>  #include <linux/regmap.h>
>  
>  #define MTK_PMIC_RST_DU_MASK	GENMASK(9, 8)
> -#define MTK_PMIC_RST_DU_SHIFT	8
>  #define MTK_PMIC_PWRKEY_RST	BIT(6)
>  #define MTK_PMIC_HOMEKEY_RST	BIT(5)
>  
> @@ -48,6 +47,7 @@ struct mtk_pmic_keys_regs {
>  struct mtk_pmic_regs {
>  	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
>  	u32 pmic_rst_reg;
> +	u32 rst_lprst_mask; /* Long-press reset timeout bitmask */
>  };
>  
>  static const struct mtk_pmic_regs mt6397_regs = {
> @@ -58,6 +58,7 @@ static const struct mtk_pmic_regs mt6397_regs = {
>  		MTK_PMIC_KEYS_REGS(MT6397_OCSTATUS2,
>  		0x10, MT6397_INT_RSV, 0x8, MTK_PMIC_HOMEKEY_RST),
>  	.pmic_rst_reg = MT6397_TOP_RST_MISC,
> +	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
>  };
>  
>  static const struct mtk_pmic_regs mt6323_regs = {
> @@ -68,6 +69,7 @@ static const struct mtk_pmic_regs mt6323_regs = {
>  		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
>  		0x4, MT6323_INT_MISC_CON, 0x8, MTK_PMIC_HOMEKEY_RST),
>  	.pmic_rst_reg = MT6323_TOP_RST_MISC,
> +	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
>  };
>  
>  static const struct mtk_pmic_regs mt6358_regs = {
> @@ -80,6 +82,7 @@ static const struct mtk_pmic_regs mt6358_regs = {
>  				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa,
>  				   MTK_PMIC_HOMEKEY_RST),
>  	.pmic_rst_reg = MT6358_TOP_RST_MISC,
> +	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
>  };
>  
>  struct mtk_pmic_keys_info {
> @@ -105,7 +108,7 @@ enum mtk_pmic_keys_lp_mode {
>  };
>  
>  static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
> -					 u32 pmic_rst_reg)
> +					 const struct mtk_pmic_regs *regs)
>  {
>  	const struct mtk_pmic_keys_regs *kregs_home, *kregs_pwr;
>  	u32 long_press_mode, long_press_debounce;
> @@ -120,8 +123,8 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
>  	if (error)
>  		long_press_debounce = 0;
>  
> -	mask = MTK_PMIC_RST_DU_MASK;
> -	value = long_press_debounce << MTK_PMIC_RST_DU_SHIFT;
> +	mask = regs->rst_lprst_mask;
> +	value = long_press_debounce << (ffs(regs->rst_lprst_mask) - 1);
>  
>  	error  = of_property_read_u32(keys->dev->of_node,
>  				      "mediatek,long-press-mode",
> @@ -147,7 +150,7 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
>  		break;
>  	}
>  
> -	regmap_update_bits(keys->regmap, pmic_rst_reg, mask, value);
> +	regmap_update_bits(keys->regmap, regs->pmic_rst_reg, mask, value);
>  }
>  
>  static irqreturn_t mtk_pmic_keys_irq_handler_thread(int irq, void *data)
> @@ -351,7 +354,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  		return error;
>  	}
>  
> -	mtk_pmic_keys_lp_reset_setup(keys, mtk_pmic_regs->pmic_rst_reg);
> +	mtk_pmic_keys_lp_reset_setup(keys, mtk_pmic_regs);
>  
>  	platform_set_drvdata(pdev, keys);
>  
> -- 
> 2.35.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
