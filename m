Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10158C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 07:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NC+t45ZiszLf1WFeGmw+sjLVPcZCZ6/6NeR9/a7GNyU=; b=GPLjsZNOnu4C8K
	QiDSHg0VA1isils3T5pk+7RYQ9JQtseSKr6bwkA420YS78XoshnMxCACIi7Oh0U39GEWgGp0C08wK
	jJhPTIk8IK+kE4084XgsBfNO2KJCMeu5Ydlgrj1qsaUI5lXoQqFtKM/YDLjfJ6iJf2ztyKqUonnvA
	Jm2YJtNrqzLDpPcPB/LWk+PIUEVpf5sxNmHzdLjnqKD6g3vbWBd9MJoHdnh0CqcPcI52U2V1Po+kt
	L3A8Yn4dxoYJWQC4Qsnfue7RgoaLLdqDdLzZEHhA1sVGGbP07qfvrdQj9kmz0gTo1K5guNLywq8Kx
	FrfxktJ251yBxypvzzug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntOuN-0074Bu-Pr; Tue, 24 May 2022 07:24:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntOuJ-0074Ax-1Q
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 07:24:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 bd25-20020a05600c1f1900b0039485220e16so867254wmb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 00:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=AjWSodLOo8ZPJy6O0FlUERSrMcBBp3JgmwXgCuABWKY=;
 b=2GrWBC208uKvWnarte0fbHotpeC/ayk+QVlBl9wQwBF+g9AeVdwpxvmmu1Jjkq2qmM
 xiCLo3QJBM0YGlMcr15fhl6yuiPI/7TomlDhysJCJ93CUQM9SKY3P1oOAZExz1nxjNLZ
 1vLG22aAt9PcxivPCvdMPJW/yVq7l1OCFzFILLT7wJajIO6Ngf3hfC/BZij7SC42PoXV
 3rE2HF0a/brq6fP/m89FtcRyMSgs3nmMuoHnxI9mir9z11Pk9h2mqciu2JWC09v79gZ/
 rrwF23yFKqpJvVfmILrQ6HxEz9NHkK+fv+x6dJW6oLZcvAWrh4B0hqsVSz3Pu8aMNZB1
 yHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=AjWSodLOo8ZPJy6O0FlUERSrMcBBp3JgmwXgCuABWKY=;
 b=EudexWpA97LBdTyVHcyv/aYNUVgs1sgnFYK6+mmM28zJ1IZ96ywMAwYC4Ui7XmlrHs
 lo5XWrNU2S9rVrB1vCkVzifd+VyAnQre/P9sHFjxSiMzntq5DCH2SAO13bUjx1ak4EEx
 BJH3wmyBbHQAeAHtqQ7E+GwLPZwQ8c6qsVONECj0oQeeEpZYp/ywR7x9TTzYatxDmU20
 3bDDvQiYEXsF9asLAy4z8I/4CANJyimQJtpvNHHi/t3K32EAiNFPkL+1j9NG07oF/Zef
 uphHEAnGpmYRT1E0cIuCOQmxScFLU+Am37ZJkw1mtg6ASkn1Srt0yCX+EfU7/9J/idIp
 NYow==
X-Gm-Message-State: AOAM533ibgggM/vRVxh9G2fGPjEASiCtIQg/YbgQ2yTwUSahNqnvU6KO
 0vXTpoAS0oj4dxCltcaXv4XNrA==
X-Google-Smtp-Source: ABdhPJzE9aWITFtiFFRNGY2dX+P743fTQhoFoU891iRxPYgTeFrPs9sSk/w06Y2GmZkZCVOi+Z+2Eg==
X-Received: by 2002:a05:600c:acb:b0:397:bdb:ffea with SMTP id
 c11-20020a05600c0acb00b003970bdbffeamr2441172wmr.56.1653377079785; 
 Tue, 24 May 2022 00:24:39 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:de85:21d6:6f2:c7e3])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adfa3c7000000b0020d0cdbf7eesm12131452wrb.111.2022.05.24.00.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 00:24:39 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: mtk-pmic-keys - use single update when
 configuring long press behavior
In-Reply-To: <YowH0Q5HAGU7Grx2@google.com>
References: <YowH0Q5HAGU7Grx2@google.com>
Date: Tue, 24 May 2022 09:24:38 +0200
Message-ID: <87wnebe6kp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_002443_123134_88C9B01B 
X-CRM114-Status: GOOD (  17.72  )
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

On lun., mai 23, 2022 at 15:16, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> Instead of doing 3 read-modify-write operations when configuring behavior
> of long-press, consolidate everything into one.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi Dmitry,

Thank you for improving the driver.

I've tested this with evtest on mt8183-pumpkin on input/next
(fabcf4d8696839a8da8a3f90d1fd30ae923ddde7).
Note that I needed to add [1] on top as well for the driver to be
loaded, since [1] is not part of input/next

[1] https://lore.kernel.org/r/20220121140323.4080640-5-mkorpershoek@baylibre.com/

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Tested-by: Mattijs Korpershoek <mkorpershoek@baylibre.com> # on mt8183-pumpkin
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 71 ++++++++++----------------
>  1 file changed, 28 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index c31ab4368388..d2f0db245ff6 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -18,17 +18,11 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> -#define MTK_PMIC_PWRKEY_RST_EN_MASK	0x1
> -#define MTK_PMIC_PWRKEY_RST_EN_SHIFT	6
> -#define MTK_PMIC_HOMEKEY_RST_EN_MASK	0x1
> -#define MTK_PMIC_HOMEKEY_RST_EN_SHIFT	5
> -#define MTK_PMIC_RST_DU_MASK		0x3
> -#define MTK_PMIC_RST_DU_SHIFT		8
> -
> -#define MTK_PMIC_PWRKEY_RST		\
> -	(MTK_PMIC_PWRKEY_RST_EN_MASK << MTK_PMIC_PWRKEY_RST_EN_SHIFT)
> -#define MTK_PMIC_HOMEKEY_RST		\
> -	(MTK_PMIC_HOMEKEY_RST_EN_MASK << MTK_PMIC_HOMEKEY_RST_EN_SHIFT)
> +#define MTK_PMIC_RST_DU_MASK	GENMASK(9, 8)
> +#define MTK_PMIC_RST_DU_SHIFT	8
> +#define MTK_PMIC_RST_KEY_MASK	GENMASK(6, 5)
> +#define MTK_PMIC_PWRKEY_RST	BIT(6)
> +#define MTK_PMIC_HOMEKEY_RST	BIT(5)
>  
>  #define MTK_PMIC_PWRKEY_INDEX	0
>  #define MTK_PMIC_HOMEKEY_INDEX	1
> @@ -108,53 +102,44 @@ enum mtk_pmic_keys_lp_mode {
>  };
>  
>  static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
> -		u32 pmic_rst_reg)
> +					 u32 pmic_rst_reg)
>  {
> -	int ret;
>  	u32 long_press_mode, long_press_debounce;
> +	u32 value, mask;
> +	int error;
>  
> -	ret = of_property_read_u32(keys->dev->of_node,
> -		"power-off-time-sec", &long_press_debounce);
> -	if (ret)
> +	error = of_property_read_u32(keys->dev->of_node, "power-off-time-sec",
> +				     &long_press_debounce);
> +	if (error)
>  		long_press_debounce = 0;
>  
> -	regmap_update_bits(keys->regmap, pmic_rst_reg,
> -			   MTK_PMIC_RST_DU_MASK << MTK_PMIC_RST_DU_SHIFT,
> -			   long_press_debounce << MTK_PMIC_RST_DU_SHIFT);
> +	mask = MTK_PMIC_RST_DU_MASK;
> +	value = long_press_debounce << MTK_PMIC_RST_DU_SHIFT;
>  
> -	ret = of_property_read_u32(keys->dev->of_node,
> -		"mediatek,long-press-mode", &long_press_mode);
> -	if (ret)
> +	error  = of_property_read_u32(keys->dev->of_node,
> +				      "mediatek,long-press-mode",
> +				      &long_press_mode);
> +	if (error)
>  		long_press_mode = LP_DISABLE;
>  
>  	switch (long_press_mode) {
> -	case LP_ONEKEY:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   MTK_PMIC_PWRKEY_RST);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   0);
> -		break;
>  	case LP_TWOKEY:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   MTK_PMIC_PWRKEY_RST);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   MTK_PMIC_HOMEKEY_RST);
> -		break;
> +		value |= MTK_PMIC_HOMEKEY_RST;
> +		fallthrough;
> +
> +	case LP_ONEKEY:
> +		value |= MTK_PMIC_PWRKEY_RST;
> +		fallthrough;
> +
>  	case LP_DISABLE:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   0);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   0);
> +		mask |= MTK_PMIC_RST_KEY_MASK;
>  		break;
> +
>  	default:
>  		break;
>  	}
> +
> +	regmap_update_bits(keys->regmap, pmic_rst_reg, mask, value);
>  }
>  
>  static irqreturn_t mtk_pmic_keys_irq_handler_thread(int irq, void *data)
> -- 
> 2.36.1.124.g0e6072fb45-goog
>
>
> -- 
> Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
