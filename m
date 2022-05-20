Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A080C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzAp7qEs+Xui8/vauOUe0sWAdt1w6NDpYgKEpCn3sfQ=; b=YEJtGvrtMCWgXL
	WU8LRKAw921a9D8H0n0MhzDOe0Hpzjm7LnM9BhCZulduHrLv8h5Z2DOI9SFTHLaq1ENv3hJyJSeFs
	VdpuTaelkJh7T8EEF02DAwvQ/Dk0wvaltn1RLj83CLutbEVhx8HrtdX7tHY2LAEFg8POIePj+J4Gz
	1sXG+W9poP0LzF41Rhbzn8gz7qCf9ndNJInyOs8L6cK3AF+ifoZ6Mzfolpndquu+Ht3b3atkl67GB
	csEegfO0Fl0BPvqzLpyoSZYjbOo2rRmZQy1JjBq7hrjIjKZMWaFV+6J7zxtq/BjjaOQv7PwuAAr89
	zu7yUhn9RfbfEk7eeMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4i2-00DGqI-O1; Fri, 20 May 2022 15:38:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4hy-00DGne-5G
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 15:38:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id k126so4721128wme.2
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 08:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=KlTBSZCWETh0qqX3A/oaLoFw8iSftzDLWzA01akJKxg=;
 b=YKQx/qpV28LqgncJMSUr4z1xp9nkwl2mmdiicFVWyHjq92MnczTC/9mXrmsn93wyCy
 wFCR0QsE+x7Esb45znQTf84kFvBGBHoN0ilIJYwu/2trDcd7udMjYtAJDrA4YX/smL+F
 rBRJ3v2mnr+4wMuXjedjiXUKGWacQuP/F+H4met3+hNYDdLaKudMdXAFuPqGTli7O0rJ
 8+NsmNyH7PI4U/QVjRUxcZ80FxF+A7BXpAmyA6cwmw6+LRg+UcGyEQfyAN+0yzos67Ib
 DpPB333O6TzICix4LxHyO3zc8/Di6Qqpqfc4DjvfdwI0L1GZIl60I9fgHUkrw4ctsbtx
 aNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=KlTBSZCWETh0qqX3A/oaLoFw8iSftzDLWzA01akJKxg=;
 b=vjV9f1gnjrxH7e6QRD1TpAJsFVBH+STJUgouzb7SEdSx3Lx0izZNBNOxzaXhubRV5D
 VEeflavlrGhmliVglBhGXfPIbRnogs/OGkLOpog6Al8+IG5hO5F+2MtkLZe0g04xkKHJ
 DMHhYo6ZwLHhlUQfZafrNsjjvnxS2rOHsdobIv8ObDkHHgaFIF30tsXwjG74gH7Vett6
 ssnaFwVyEgg8RiGkQjFdwldPcBrwips62D8NJ+yb4TpPOSSW7AT6ffATstQ9neKoTB/Q
 CIsHWgHLMECBgiJJhze0pFJVBJZYt7mFMw9P218Bn4x+a4zNEQt3g/tf76ObPv/Xjs82
 btbQ==
X-Gm-Message-State: AOAM5319EGDKd8dC95ukZ3mHIe0ahdodTAoT0SOqR+IV8Fh7DhqXLsT0
 orc3wTCkbsgN3QVHN+q1yYH9Jw==
X-Google-Smtp-Source: ABdhPJwvNeH+3EcmO9Gjw9QylbVZH6UgN/87pGUvZeHn8yPRnsZtjsWDiANEQFEqqO5/56LsMdfETw==
X-Received: by 2002:a7b:c20d:0:b0:397:335e:dc7b with SMTP id
 x13-20020a7bc20d000000b00397335edc7bmr6556391wmi.93.1653061106496; 
 Fri, 20 May 2022 08:38:26 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:41e3:1219:c56c:30b8])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a05600c338400b00394708a3d7dsm2266641wmp.15.2022.05.20.08.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:38:25 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] Input: mtk-pmic-keys - Add kerneldoc to driver
 structures
In-Reply-To: <20220520125132.229191-2-angelogioacchino.delregno@collabora.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
 <20220520125132.229191-2-angelogioacchino.delregno@collabora.com>
Date: Fri, 20 May 2022 17:38:25 +0200
Message-ID: <877d6gkydq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_083830_456988_D34A947C 
X-CRM114-Status: GOOD (  16.98  )
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

> To enhance human readability, add kerneldoc to all driver structs.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 30 +++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index c31ab4368388..8e4fa7cd16e6 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -34,6 +34,13 @@
>  #define MTK_PMIC_HOMEKEY_INDEX	1
>  #define MTK_PMIC_MAX_KEY_COUNT	2
>  
> +/**
> + * struct mtk_pmic_keys_regs - PMIC keys per-key registers
> + * @deb_reg:             Debounced key status register
> + * @deb_mask:            Bitmask of this key in status register
> + * @intsel_reg:          Interrupt selector register
> + * @intsel_mask:         Bitmask of this key in interrupt selector
> + */
>  struct mtk_pmic_keys_regs {
>  	u32 deb_reg;
>  	u32 deb_mask;
> @@ -50,6 +57,11 @@ struct mtk_pmic_keys_regs {
>  	.intsel_mask		= _intsel_mask,		\
>  }
>  
> +/**
> + * struct mtk_pmic_regs - PMIC Keys registers
> + * @keys_regs:           Specific key registers
> + * @pmic_rst_reg:        PMIC Keys reset register
> + */
>  struct mtk_pmic_regs {
>  	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
>  	u32 pmic_rst_reg;
> @@ -85,15 +97,31 @@ static const struct mtk_pmic_regs mt6358_regs = {
>  	.pmic_rst_reg = MT6358_TOP_RST_MISC,
>  };
>  
> +/**
> + * struct mtk_pmic_keys_info - PMIC Keys per-key params
> + * @keys:                Pointer to main driver structure
> + * @regs:                Register offsets/masks for this key
> + * @keycode:             Key code for this key
> + * @irq:                 Keypress or press/release interrupt
> + * @irq_r:               Key release interrupt (optional)
> + * @wakeup:              Indicates whether to use this key as a wakeup source
> + */
>  struct mtk_pmic_keys_info {
>  	struct mtk_pmic_keys *keys;
>  	const struct mtk_pmic_keys_regs *regs;
>  	unsigned int keycode;
>  	int irq;
> -	int irq_r; /* optional: release irq if different */
> +	int irq_r;
>  	bool wakeup:1;
>  };
>  
> +/**
> + * struct mtk_pmic_keys - Main driver structure
> + * @input_dev:           Input device pointer
> + * @dev:                 Device pointer
> + * @regmap:              Regmap handle
> + * @keys:                Per-key parameters
> + */
>  struct mtk_pmic_keys {
>  	struct input_dev *input_dev;
>  	struct device *dev;
> -- 
> 2.35.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
