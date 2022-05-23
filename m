Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86466C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9QTKgDJEMzcr7LzFoNIiW11yJoWSVIpS+XOuNCXafo=; b=YsIPP3ioC2aBFt
	YkGgy/ZxKSxiI0rKIlw7W49S/WY96YlJXhrEfS48bU+eadOewiaL4fWYl1AhY6S7iC5asiCpj1MKR
	4dXeQv9pW8DTMVjd6Y9A1QCx5ku/Ei0x6PnVANXM5yZO+wkp/1JrBhsywdXl4By0y7OzrOt1upWnm
	1JF4fw+s9HSzEx9hGPQz50pFXmb9odLKT/G0Obv2FxOGsSICcczKlwgSE98PUWk7Ifhpe6+pXHEnx
	ixGDfv1rTzD4JrlBKTYw2OXldbVU+L2axV0ca7Ls5LPUbnXOtiQau3QvYdUbqqHX11xpaTwWQi/G3
	3zY2XXr2acd1F29KP98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt41R-002hJa-VJ; Mon, 23 May 2022 09:06:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2qH-002AAA-LK; Mon, 23 May 2022 07:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BreetYWTsmmdO6stIJQjRnOxhkNpGdp8Cj6UELkhpv4=; b=gkkLih+xH0vaKISEsoRNGh0H9s
 ta1/Jl15WzGi8ghfJcNmy5eMejxHZcyg0zsO01hxNgBXOSwL8yeZondrH5cjQLyLc+IoihAOi0D/G
 Od6XXYKlGUHbutvsF/7sfRasoE6k0Cikd3AoIXNaR6u7FC/89cxmJvx4J4uGDQeRi9vict9hQisGL
 FpA1oG8FjHFXzmq7+0zKLulSTosXyuDP1jby6+Tp1v/bhG2vakT0dnyS/o55V8GAdSiGqWsJ07Ege
 2QA99IdIYtyb0R5Lp0Y3/mFvvz3VEVdCNtzHs3YrmeiPTo4AumpHgkZwbESx5tg2aDUEazlCMCF/o
 wErtmLYg==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt04Z-000qD4-G9; Mon, 23 May 2022 04:53:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so1041954pjt.4; 
 Sun, 22 May 2022 21:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BreetYWTsmmdO6stIJQjRnOxhkNpGdp8Cj6UELkhpv4=;
 b=mSQk8IugJIT7TxFSLEZqXH1qMjQIQJpOChkViXRA3SMMoV2ROU1Yu67p5Q+lSKHWmd
 zpkB5dbftFup58N2KEW5d7aztZZ/tsK27DJkK5lcyTSPqSlXSGO5dMnQWLofueCLzShv
 dLoRqx1fHjfm+L02szCFwiHn5J0akL8qJ5sxlIjptagQ1g1SafyDgN0iWXrXmkiSbynt
 bJd9vrca0j7djr8LfqiQeGExkzNRqYTWnuUFHgwWkn44xVKzYVhopKIsXnBXtqRr9kY8
 vcb72rzHRZDGKOyP7k4ebHbuejPeAYr27A9jiSuv4VSXu6xeBgXZNQ0Cw+fcVvHjkGoM
 i9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BreetYWTsmmdO6stIJQjRnOxhkNpGdp8Cj6UELkhpv4=;
 b=o0VcbDr8+J9+coNXZnUAykt85ULEr3r9Y5qdBzJkJHsjL6VsBQWW4om1L5TR3kflzx
 hWW9IkVMzZe3Epl7cyqZcdWPK8kLgLDjDoGDaWJbNR4EX9xAfuZIT+BcfzjGrhAxGMuo
 8lldX3kks6Enc/z/jQbNqS3JGjt2J0uZ9oJztjv/0J8vG1i1ikoxdk93ct/fxkHsecuq
 uFqHzJ33jkFEtEGVcXg9QwWxYHe7tU0JrNm4ErURqreCvt21arF9arnLT46qM0NZ0fta
 qW5hs/+5KvjO/n5A2o0HbZfO7HDlBK0z0BjIquNsv0c8+lD0yGOOhLERornG11GZ7vLW
 aFng==
X-Gm-Message-State: AOAM531+bPvSJfnkk7PoKaaHXRpetI9jFw4bJ7g0ZSzpjrurIz+/q5vn
 X6cMn/tWOtjhtD0jiw2LpWE=
X-Google-Smtp-Source: ABdhPJwJ5SsDwYlXSr639JsqEyRvwH/SthXrMRADPBYVm16UnhX26NYYNJT45SYhWvFudnV3aMZc/Q==
X-Received: by 2002:a17:90b:38c1:b0:1e0:16da:86e with SMTP id
 nn1-20020a17090b38c100b001e016da086emr11344584pjb.149.1653281493378; 
 Sun, 22 May 2022 21:51:33 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:d84e:5dcd:9d68:ebbf])
 by smtp.gmail.com with ESMTPSA id
 jh22-20020a170903329600b0015e8d4eb285sm3950442plb.207.2022.05.22.21.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 21:51:32 -0700 (PDT)
Date: Sun, 22 May 2022 21:51:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] Input: mtk-pmic-keys - Use regmap_{set,clear}_bits
 where possible
Message-ID: <YosS0ZvAovyl8cF5@google.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
 <20220520125132.229191-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220520125132.229191-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_055339_781103_A9232BC3 
X-CRM114-Status: GOOD (  14.22  )
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

On Fri, May 20, 2022 at 02:51:29PM +0200, AngeloGioacchino Del Regno wrote:
> Instead of always using regmap_update_bits(), let's go for the shorter
> regmap_set_bits() and regmap_clear_bits() where possible.
> 
> No functional change.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 24 ++++++------------------
>  1 file changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index 8e4fa7cd16e6..83d0b90cc8cb 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -157,28 +157,16 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
>  
>  	switch (long_press_mode) {
>  	case LP_ONEKEY:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   MTK_PMIC_PWRKEY_RST);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   0);
> +		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
> +		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);

Why not combine this into a single update instead? I.e. assuming

#define MTK_PMIC_KEY_RST_MASK GENMASK(6, 5)

		regmap_update_bits(keys->regmap, pmic_rst_reg,
				   MTK_PMIC_KEY_RST_MASK,
				   MTK_PMIC_PWRKEY_RST);

>  		break;
>  	case LP_TWOKEY:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   MTK_PMIC_PWRKEY_RST);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   MTK_PMIC_HOMEKEY_RST);
> +		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
> +		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);

		regmap_update_bits(keys->regmap, pmic_rst_reg,
				   MTK_PMIC_KEY_RST_MASK,
				   MTK_PMIC_PWRKEY_RST | MTK_PMIC_HOMEKEY_RST);

>  		break;
>  	case LP_DISABLE:
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_PWRKEY_RST,
> -				   0);
> -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> -				   MTK_PMIC_HOMEKEY_RST,
> -				   0);
> +		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
> +		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);

		regmap_update_bits(keys->regmap, pmic_rst_reg,
				   MTK_PMIC_KEY_RST_MASKi, 0);

>  		break;
>  	default:
>  		break;
> -- 
> 2.35.1
> 

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
