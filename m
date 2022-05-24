Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0287FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mX7ZxCiUiU0m+NzeWS3mTCJe7kaFLK0M9YLvDTcI7Qs=; b=I+N8P4pcaks1U8
	5JAeKqsxx5829KMIVGBhFUsW0J90ih3y9Vcorpy1q2F3N2O1bVDcKrVyadva5zcnjZJ6dD6CjA49o
	Ehz9tAzT85vKVfuNxOvaK3UGZuzCcfJ2cTGndDAyLDfcHsxp5DR1pIo9qi/PZJB3D6uEKGqPR0yzE
	g2gZ9fWcU6IIb1g1lGFg4V9fiFthRRBjmN9H+LhdLBiK7ud5dG3c7kJ1kpTVu4MO+vRFybMW8IyQD
	ZSsfIa9QTbHZq5/TIYlD/XmrDj6G+ddaGlqcnYjeijX3Mr5I1nP4kV0JmswOKAlhn5hGlZuO0NZwG
	xPXV1jabCIvUjuAVPAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntTHt-007uQl-RY; Tue, 24 May 2022 12:05:21 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntTHn-007uNm-BD
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 12:05:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id z15so1563157wrg.11
 for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=wy4ZBZCaSdrsU5jRaIpcsRShq90JZ9rF2FAY+TUamBY=;
 b=pdOIf90iqOc5vCBASR+8KMfefSm4+3KhcjgvQr8O+xQKxZo6yK+0c8CdpvgNsA6rA4
 fuvpVBYr2Ll8/JCxCAqJFIbOGXSax+/0YgDrHdS2gsY3Gwle+9y2YDYAusvZtVMtsrP/
 wRxOWGh0hxrIg6cjCu5oNlhtOUo4xDPzDxrRHGPKpH57wDgYbOGRwwJFswDrDEsPAbp9
 jGKMqGScdAf4MZZLYppBbo/s2RZlOw3U23WaKSx71+rfg9FRuyHm5ntqI8JFLzzXmJJy
 kDimSt6qAtKKbPdGI/rABeuseTHvfs36B4QRQFa4Sj/rnMl0X1PPUQLFb4qscRJIWM+u
 altg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=wy4ZBZCaSdrsU5jRaIpcsRShq90JZ9rF2FAY+TUamBY=;
 b=RPcseXaYUNzhTbFXgQM85M0YnW94fdHhGCfWQ+z3p0O0b49U9sba+GzTtBq9Dm+WfR
 dPmEoViUPUYni02L+CKa2+3GM9ijctmoEb4SivIr0TJXUSCa2bauNNR9F3a8fxNodeFc
 vEr6JOKeHtBXdUGgsUXftIQjgitYqzsRf4NL23iCHRFYVRi2qCKH0m1r7dUBZ7nzIrTm
 SBV5/35LJW2Nf0DIFpO83vqhh/zMugEfhMABgyonyBwgsbUtUpKEQVQCGxw84B0liPM7
 gueRR98EzxR9e/v89H0K6tXxZKG70DsGmApF0NzUDjiPJSP8atdAV8R120xvmZD7rldW
 CqUg==
X-Gm-Message-State: AOAM531M/O/t6v8Cwo/e2UQtS0V6vbBuCQyNahIOjytcVqT6GpW6bh5G
 h2bAaPgkHQp8kO5R+f+CESI0VQ==
X-Google-Smtp-Source: ABdhPJy2An/d0qo4OXlYbmyJz+ZqHqkMDOvETSRBTXAjKN9NaaVOlLdg/CTVwij/FeBgqIM0WS4s2Q==
X-Received: by 2002:a05:6000:162b:b0:20f:fb06:ba97 with SMTP id
 v11-20020a056000162b00b0020ffb06ba97mr146654wrb.158.1653393912695; 
 Tue, 24 May 2022 05:05:12 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:d9b6:6217:ea92:4fe0])
 by smtp.gmail.com with ESMTPSA id
 az37-20020a05600c602500b0039746638d6esm1996761wmb.33.2022.05.24.05.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 05:05:12 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Input: mtk-pmic-keys - Transfer per-key bit in
 mtk_pmic_keys_regs
In-Reply-To: <20220524093505.85438-2-angelogioacchino.delregno@collabora.com>
References: <20220524093505.85438-1-angelogioacchino.delregno@collabora.com>
 <20220524093505.85438-2-angelogioacchino.delregno@collabora.com>
Date: Tue, 24 May 2022 14:05:11 +0200
Message-ID: <87leurdtl4.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_050515_591501_79323E81 
X-CRM114-Status: GOOD (  19.08  )
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

> Place the key bit in struct mtk_pmic_keys_regs to enhance this
> driver's flexibility, in preparation for adding support for more
> PMICs.
>
> While at it, remove the definition of MTK_PMIC_RST_KEY_MASK as
> we are now dynamically setting the keymask relatively to the keys
> that are defined in the newly added rst_en_mask variable, on a
> per-key basis.
>
> This commit brings no functional changes.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 30 ++++++++++++++++----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index d2f0db245ff6..2509a349a173 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -20,7 +20,6 @@
>  
>  #define MTK_PMIC_RST_DU_MASK	GENMASK(9, 8)
>  #define MTK_PMIC_RST_DU_SHIFT	8
> -#define MTK_PMIC_RST_KEY_MASK	GENMASK(6, 5)
>  #define MTK_PMIC_PWRKEY_RST	BIT(6)
>  #define MTK_PMIC_HOMEKEY_RST	BIT(5)
>  
> @@ -33,15 +32,17 @@ struct mtk_pmic_keys_regs {
>  	u32 deb_mask;
>  	u32 intsel_reg;
>  	u32 intsel_mask;
> +	u32 rst_en_mask;
>  };
>  
>  #define MTK_PMIC_KEYS_REGS(_deb_reg, _deb_mask,		\
> -	_intsel_reg, _intsel_mask)			\
> +	_intsel_reg, _intsel_mask, _rst_mask)		\
>  {							\
>  	.deb_reg		= _deb_reg,		\
>  	.deb_mask		= _deb_mask,		\
>  	.intsel_reg		= _intsel_reg,		\
>  	.intsel_mask		= _intsel_mask,		\
> +	.rst_en_mask		= _rst_mask,		\
>  }
>  
>  struct mtk_pmic_regs {
> @@ -52,30 +53,32 @@ struct mtk_pmic_regs {
>  static const struct mtk_pmic_regs mt6397_regs = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6397_CHRSTATUS,
> -		0x8, MT6397_INT_RSV, 0x10),
> +		0x8, MT6397_INT_RSV, 0x10, MTK_PMIC_PWRKEY_RST),
>  	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6397_OCSTATUS2,
> -		0x10, MT6397_INT_RSV, 0x8),
> +		0x10, MT6397_INT_RSV, 0x8, MTK_PMIC_HOMEKEY_RST),
>  	.pmic_rst_reg = MT6397_TOP_RST_MISC,
>  };
>  
>  static const struct mtk_pmic_regs mt6323_regs = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
> -		0x2, MT6323_INT_MISC_CON, 0x10),
> +		0x2, MT6323_INT_MISC_CON, 0x10, MTK_PMIC_PWRKEY_RST),
>  	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
> -		0x4, MT6323_INT_MISC_CON, 0x8),
> +		0x4, MT6323_INT_MISC_CON, 0x8, MTK_PMIC_HOMEKEY_RST),
>  	.pmic_rst_reg = MT6323_TOP_RST_MISC,
>  };
>  
>  static const struct mtk_pmic_regs mt6358_regs = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
> -				   0x2, MT6358_PSC_TOP_INT_CON0, 0x5),
> +				   0x2, MT6358_PSC_TOP_INT_CON0, 0x5,
> +				   MTK_PMIC_PWRKEY_RST),
>  	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
> -				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa),
> +				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa,
> +				   MTK_PMIC_HOMEKEY_RST),
>  	.pmic_rst_reg = MT6358_TOP_RST_MISC,
>  };
>  
> @@ -104,10 +107,14 @@ enum mtk_pmic_keys_lp_mode {
>  static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
>  					 u32 pmic_rst_reg)
>  {
> +	const struct mtk_pmic_keys_regs *kregs_home, *kregs_pwr;
>  	u32 long_press_mode, long_press_debounce;
>  	u32 value, mask;
>  	int error;
>  
> +	kregs_home = keys->keys[MTK_PMIC_HOMEKEY_INDEX].regs;
> +	kregs_pwr = keys->keys[MTK_PMIC_PWRKEY_INDEX].regs;
> +
>  	error = of_property_read_u32(keys->dev->of_node, "power-off-time-sec",
>  				     &long_press_debounce);
>  	if (error)
> @@ -124,15 +131,16 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
>  
>  	switch (long_press_mode) {
>  	case LP_TWOKEY:
> -		value |= MTK_PMIC_HOMEKEY_RST;
> +		value |= kregs_home->rst_en_mask;
>  		fallthrough;
>  
>  	case LP_ONEKEY:
> -		value |= MTK_PMIC_PWRKEY_RST;
> +		value |= kregs_pwr->rst_en_mask;
>  		fallthrough;
>  
>  	case LP_DISABLE:
> -		mask |= MTK_PMIC_RST_KEY_MASK;
> +		mask |= kregs_home->rst_en_mask;
> +		mask |= kregs_pwr->rst_en_mask;
>  		break;
>  
>  	default:
> -- 
> 2.35.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
