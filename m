Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050BBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81hdMaGsncxlP09A91jAnx9ysR60NLC7XpVYRbn/Wtw=; b=n1YTnK2xYyfr/5
	VJH556rzw286q4qsuLDnHPuly49WhdiSeDc9q6Ictj1uF90+jrTSPXXES+EI8RbUGQVpoB6FvRIRX
	tbZttXFhhSfra95KDc8IaebVoj+QjM2YhqZJHTj+9+2rtLvo/bwUZel/qZJgYkFT16p7BHnLmDr/Y
	szjZncM+ewr1cphTowIG+wtwtDOAhossHf6EDQYoZXZns2s52I4veGZ9j/MjigaJagqeASIP4J6wc
	NKbEMETlKvSYeef2DFo03agXMfjSlEfTmPj9qoDi3Uw7OAuvcxXY+DLuvi518JHkY3tFFqD4Eb4ua
	oRLcW/OcxxwtG0CkDnaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4j2-00DHJP-9a; Fri, 20 May 2022 15:39:36 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4i8-00DGr9-AM
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 15:38:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id h14so12013423wrc.6
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=0P/8s/fnquYrCgMbfh1fWaQZ42tpgsmUmRUnAJPSmHg=;
 b=KZ5P97q2qbLL7U/7vG48uFvMF+4zuU8A3EoCS1T+AuCLRTLrwPq5BL+PYqujTsyK7T
 wWeYgj/3x4buPwJWEuH+AEE6YOLuA7M5/t5icXP4JpPBGjLdjy2JvmwSBCrBtqxP5W4c
 VTC+gI9erFyC8/9TzgAw5ojYL5d+lTZ06LFEEmITg7e60MS5jBLa1wEH7IzjavSPI33R
 zEHpRDD0hSuWy5LmoKW65nKS0aKRIabXy+dY54jtDKFEbw8hZBq6uE3LQDTeNHA4s0+L
 6uvSK+u46lez7x4Gp9ToepgUIgF+UIBnCyWm//lCKQ2wds9igT0SO0glR0fS7ECJKxHm
 GPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=0P/8s/fnquYrCgMbfh1fWaQZ42tpgsmUmRUnAJPSmHg=;
 b=byhpi+SK+5ooqBkX9ZgjLrCNDYvt/WB4MisDwUWc6wTnsci3HwJjJKKmaeCdFXpHqS
 ivMQa4/+Mo9mHPK4kMkgWhFyXEcrGqPszyUOlXoSg5faA8HFXuee2ni5eN/Fll/d4nzL
 cYHFFecGdaA/bisnDTpVEYlInkW3Qm1NdpM5XCLEMj4ZG+uGGtrrxYNWvKrWz+mORZqj
 FenZP3CzPnJi1x7m5wg+73mKDyLNnFqJgCN4i8+ZzuKkaq3x394iMY5eVWQR0bgkbW8+
 mCGLFjPeTb4PNSeNXF4jtdKhF9egOFi7zJ6xw6X7ZTUDl+H2oFtKXi+Wn6kyD+Zh0SvI
 faKA==
X-Gm-Message-State: AOAM530sdgM5VF/VQTz+wBGuxymA2evDxBsP4caEx1ao16D20+08hXfe
 mIEGlsJRy7+e7RBAbcUGIYcpCA==
X-Google-Smtp-Source: ABdhPJyr5f9yvgfb4L6pqhK59EzL6jv+MJ3P41uNYdBPn2XprO5csnWJ28908wYiFL2D7eKWGsd3/A==
X-Received: by 2002:a5d:5984:0:b0:20f:c37b:d2d4 with SMTP id
 n4-20020a5d5984000000b0020fc37bd2d4mr1043605wri.169.1653061115823; 
 Fri, 20 May 2022 08:38:35 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:41e3:1219:c56c:30b8])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a1cf306000000b00397243d3dbcsm2319750wmq.31.2022.05.20.08.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:38:35 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] Input: mtk-pmic-keys - Move long press debounce
 mask to mtk_pmic_regs
In-Reply-To: <20220520125132.229191-5-angelogioacchino.delregno@collabora.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
 <20220520125132.229191-5-angelogioacchino.delregno@collabora.com>
Date: Fri, 20 May 2022 17:38:34 +0200
Message-ID: <8735h4kydh.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_083840_409593_FECC0D1A 
X-CRM114-Status: GOOD (  26.47  )
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

On ven., mai 20, 2022 at 14:51, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> As the second and last step of preparation to add support for more
> PMICs in this driver, move the long press debounce mask to struct
> mtk_pmic_regs and use that in mtk_pmic_keys_lp_reset_setup() instead
> of directly using the definition.
>
> While at it, remove the MTK_PMIC_RST_DU_{MASK,SHIFT} definitions, as
> these can be expressed with the GENMASK macro and a new name was
> chosen for that, as to uniform the definition names with the others
> found in this driver.
>
> Lastly, it was necessary to change the function signature of
> mtk_pmic_keys_lp_reset_setup() to now pass a pointer to the main
> mtk_pmic_regs structure, since that's what contains the reset
> debounce mask now and, for readability purposes, for this function,
> all of the references to keys->regmap were changed to use a local
> 'rmap' pointer, or the calls to regmap_{set,clear}_bits would be
> ~94 columns long.
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 33 +++++++++++++++-----------
>  1 file changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index d8285612265f..acd5aefac5f9 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -18,11 +18,9 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> -#define MTK_PMIC_RST_DU_MASK		0x3
> -#define MTK_PMIC_RST_DU_SHIFT		8
> -
>  #define MTK_PMIC_MT6397_HOMEKEY_RST_EN	BIT(5)
>  #define MTK_PMIC_MT6397_PWRKEY_RST_EN	BIT(6)
> +#define MTK_PMIC_MT6397_RST_DU_MASK	GENMASK(9, 8)
>  
>  #define MTK_PMIC_PWRKEY_INDEX	0
>  #define MTK_PMIC_HOMEKEY_INDEX	1
> @@ -58,10 +56,12 @@ struct mtk_pmic_keys_regs {
>   * struct mtk_pmic_regs - PMIC Keys registers
>   * @keys_regs:           Specific key registers
>   * @pmic_rst_reg:        PMIC Keys reset register
> + * @rst_lprst_mask:      Long-press reset timeout bitmask
>   */
>  struct mtk_pmic_regs {
>  	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
>  	u32 pmic_rst_reg;
> +	u32 rst_lprst_mask;
>  };
>  
>  static const struct mtk_pmic_regs mt6397_regs = {
> @@ -72,6 +72,7 @@ static const struct mtk_pmic_regs mt6397_regs = {
>  		MTK_PMIC_KEYS_REGS(MT6397_OCSTATUS2,
>  		0x10, MT6397_INT_RSV, 0x8, MTK_PMIC_MT6397_HOMEKEY_RST_EN),
>  	.pmic_rst_reg = MT6397_TOP_RST_MISC,
> +	.rst_lprst_mask = MTK_PMIC_MT6397_RST_DU_MASK,
>  };
>  
>  static const struct mtk_pmic_regs mt6323_regs = {
> @@ -82,6 +83,7 @@ static const struct mtk_pmic_regs mt6323_regs = {
>  		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
>  		0x4, MT6323_INT_MISC_CON, 0x8, MTK_PMIC_MT6397_HOMEKEY_RST_EN),
>  	.pmic_rst_reg = MT6323_TOP_RST_MISC,
> +	.rst_lprst_mask = MTK_PMIC_MT6397_RST_DU_MASK,
>  };
>  
>  static const struct mtk_pmic_regs mt6358_regs = {
> @@ -94,6 +96,7 @@ static const struct mtk_pmic_regs mt6358_regs = {
>  				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa,
>  				   MTK_PMIC_MT6397_HOMEKEY_RST_EN),
>  	.pmic_rst_reg = MT6358_TOP_RST_MISC,
> +	.rst_lprst_mask = MTK_PMIC_MT6397_RST_DU_MASK,
>  };
>  
>  /**
> @@ -135,24 +138,26 @@ enum mtk_pmic_keys_lp_mode {
>  };
>  
>  static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
> -		u32 pmic_rst_reg)
> +					 const struct mtk_pmic_regs *regs)
>  {
>  	int ret;
> +	struct regmap *rmap;
>  	u32 long_press_mode, long_press_debounce;
>  	const struct mtk_pmic_keys_regs *kregs_pwr;
>  	const struct mtk_pmic_keys_regs *kregs_home;
>  
>  	kregs_pwr = keys->keys[MTK_PMIC_PWRKEY_INDEX].regs;
>  	kregs_home = keys->keys[MTK_PMIC_HOMEKEY_INDEX].regs;
> +	rmap = keys->regmap;
>  
>  	ret = of_property_read_u32(keys->dev->of_node,
>  		"power-off-time-sec", &long_press_debounce);
>  	if (ret)
>  		long_press_debounce = 0;
>  
> -	regmap_update_bits(keys->regmap, pmic_rst_reg,
> -			   MTK_PMIC_RST_DU_MASK << MTK_PMIC_RST_DU_SHIFT,
> -			   long_press_debounce << MTK_PMIC_RST_DU_SHIFT);
> +	regmap_update_bits(rmap, regs->pmic_rst_reg,
> +			   regs->rst_lprst_mask,
> +			   long_press_debounce << ffs(regs->rst_lprst_mask));
>  
>  	ret = of_property_read_u32(keys->dev->of_node,
>  		"mediatek,long-press-mode", &long_press_mode);
> @@ -161,16 +166,16 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
>  
>  	switch (long_press_mode) {
>  	case LP_ONEKEY:
> -		regmap_set_bits(keys->regmap, pmic_rst_reg, kregs_pwr->rst_en_mask);
> -		regmap_clear_bits(keys->regmap, pmic_rst_reg, kregs_home->rst_en_mask);
> +		regmap_set_bits(rmap, regs->pmic_rst_reg, kregs_pwr->rst_en_mask);
> +		regmap_clear_bits(rmap, regs->pmic_rst_reg, kregs_home->rst_en_mask);
>  		break;
>  	case LP_TWOKEY:
> -		regmap_set_bits(keys->regmap, pmic_rst_reg, kregs_pwr->rst_en_mask);
> -		regmap_set_bits(keys->regmap, pmic_rst_reg, kregs_home->rst_en_mask);
> +		regmap_set_bits(rmap, regs->pmic_rst_reg, kregs_pwr->rst_en_mask);
> +		regmap_set_bits(rmap, regs->pmic_rst_reg, kregs_home->rst_en_mask);
>  		break;
>  	case LP_DISABLE:
> -		regmap_clear_bits(keys->regmap, pmic_rst_reg, kregs_pwr->rst_en_mask);
> -		regmap_clear_bits(keys->regmap, pmic_rst_reg, kregs_home->rst_en_mask);
> +		regmap_clear_bits(rmap, regs->pmic_rst_reg, kregs_pwr->rst_en_mask);
> +		regmap_clear_bits(rmap, regs->pmic_rst_reg, kregs_home->rst_en_mask);
>  		break;
>  	default:
>  		break;
> @@ -378,7 +383,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
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
