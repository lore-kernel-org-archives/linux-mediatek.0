Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E770C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYUcYwIiN/Y66FxXmb/f6CbGvFSmqQgz2S8NH29CrSI=; b=FQQKQunW85Mj52
	677ptsWOlOW97CqEVSHJB2cJRsDerYDA7tQIfm2Izb6H2KlBD1uxRZNf3ut02XZpGGvOrPW+VVBlO
	jH/c6GXxPk/wnNrNU82yvCqOHWmycaGLkh7+u+EpeymUwktG6tfY4N15d2aOZS1ShLFM49ArY1/QM
	KZJJ3RHtv1UONV9oUNvpv3al6hqllTa41nNodMjqbUDrnDPzXY0CXvNwRkG9jiXdKkgtJwGOlrZeQ
	3Jzk2BE8zDiPZFrrDskI61XQYDQ/aY62PFZyCnp2f9SOGOKXEM+8Um+dTpmP/sL92qZOSc9eLZAt0
	+8B1iFprw/QpBhivscWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4j3-00DHK8-H1; Fri, 20 May 2022 15:39:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4iA-00DGsv-S0
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 15:38:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id k30so11997345wrd.5
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 08:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ZnvK6ktuMG6z7kIuQh9oc4o9U2vLN3omm5vhkUl4qvQ=;
 b=h6ZjivXbYXLq94WOxUL4/sgzsSx6HM0CeDzJh3R/zNe5ZsF8w7YH0BPwc34Mlgy5TB
 RyOc3jMK5YlUxqQ00CNn+B2kZYZ7bSpUGx5PS59kjYX/gR6s201dtYkZGe2lD06amo5l
 i8M1uorqkR5eBdonQZi6cvqm5o0n6Fz0QhRZY1XjpSkoF/aVjJx97ISgfgHUciNnUiMC
 kw1UJ8VnRnNDxpdFHwGeM5j1dYY3IrM805smq7HREQTxyQ7kYe5/yH3qgdC3tUXRlpMt
 WYRanunRlhIdOpRRcUTbHmxuYsmvCoASN+fLAEGB4Ii1zpMqV0tmyxUIOltnsdbmWSW8
 uZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ZnvK6ktuMG6z7kIuQh9oc4o9U2vLN3omm5vhkUl4qvQ=;
 b=J5W0+jgqQPTeKDBUBFsfPPtpkxrivB+DwOT/giRVjpqNz50QsPecxm4igjhdJ+Ru85
 r7z2PfFIsNFFtgHHzYcBBHqtHQFBELSazaDISiqnIE0Oc3BpG09RZwuR0wfzfGehgpB/
 0LJw8fQWP9f8ys5dwx28kbiIR6DKiZWLvXvxa93D9hiWAR6PfUfyfvRNCHewHIROgf+/
 o9jaUV8Ei0LeT3ZmDgvsB+rxjpXOwIJIb2l1/HdUzgGbTYP+hWPt+lT6Pvte8uxofY++
 RAmocQ0Ju7rTOEORg6FDVurZNmte19BJ+3i0gQ0JKpm3OL8HYxF6LSJvS1vxz3+lvVRH
 6g+g==
X-Gm-Message-State: AOAM531Y8HRQKT8P+4M69g7Y7+0Kalcb/RiSvG0baF67mSFfXJeQwFwr
 reulQodo8C5/nkVx4JXtv2eRdw==
X-Google-Smtp-Source: ABdhPJxRQjeoU324RH2NZNV3sYFQW171hzOW0yMrNpMbN8+QJqIUVyPGkcsWjMf9IfheJl0o7C7ykQ==
X-Received: by 2002:adf:dec1:0:b0:20e:6313:a4a5 with SMTP id
 i1-20020adfdec1000000b0020e6313a4a5mr8973519wrn.659.1653061118533; 
 Fri, 20 May 2022 08:38:38 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:41e3:1219:c56c:30b8])
 by smtp.gmail.com with ESMTPSA id
 s26-20020adfa29a000000b0020d069148bcsm2828619wra.110.2022.05.20.08.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:38:38 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] Input: mtk-pmic-keys - Add support for MT6331 PMIC
 keys
In-Reply-To: <20220520125132.229191-6-angelogioacchino.delregno@collabora.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
 <20220520125132.229191-6-angelogioacchino.delregno@collabora.com>
Date: Fri, 20 May 2022 17:38:37 +0200
Message-ID: <871qwokyde.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_083842_950602_DA8C41AA 
X-CRM114-Status: GOOD (  13.29  )
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

> Add support for PMIC Keys of the MT6331 PMIC.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index acd5aefac5f9..4a03fdfe8282 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -9,6 +9,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mfd/mt6323/registers.h>
> +#include <linux/mfd/mt6331/registers.h>
>  #include <linux/mfd/mt6358/registers.h>
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6397/registers.h>
> @@ -22,6 +23,10 @@
>  #define MTK_PMIC_MT6397_PWRKEY_RST_EN	BIT(6)
>  #define MTK_PMIC_MT6397_RST_DU_MASK	GENMASK(9, 8)
>  
> +#define MTK_PMIC_MT6331_HOMEKEY_RST_EN	BIT(8)
> +#define MTK_PMIC_MT6331_PWRKEY_RST_EN	BIT(9)
> +#define MTK_PMIC_MT6331_RST_DU_MASK	GENMASK(13, 12)
> +
>  #define MTK_PMIC_PWRKEY_INDEX	0
>  #define MTK_PMIC_HOMEKEY_INDEX	1
>  #define MTK_PMIC_MAX_KEY_COUNT	2
> @@ -86,6 +91,19 @@ static const struct mtk_pmic_regs mt6323_regs = {
>  	.rst_lprst_mask = MTK_PMIC_MT6397_RST_DU_MASK,
>  };
>  
> +static const struct mtk_pmic_regs mt6331_regs = {
> +	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
> +		MTK_PMIC_KEYS_REGS(MT6331_TOPSTATUS, 0x2,
> +				   MT6331_INT_MISC_CON, 0x4,
> +				   MTK_PMIC_MT6331_PWRKEY_RST_EN),
> +	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
> +		MTK_PMIC_KEYS_REGS(MT6331_TOPSTATUS, 0x4,
> +				   MT6331_INT_MISC_CON, 0x2,
> +				   MTK_PMIC_MT6331_HOMEKEY_RST_EN),
> +	.pmic_rst_reg = MT6331_TOP_RST_MISC,
> +	.rst_lprst_mask = MTK_PMIC_MT6331_RST_DU_MASK,
> +};
> +
>  static const struct mtk_pmic_regs mt6358_regs = {
>  	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>  		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
> @@ -284,6 +302,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
>  	}, {
>  		.compatible = "mediatek,mt6323-keys",
>  		.data = &mt6323_regs,
> +	}, {
> +		.compatible = "mediatek,mt6331-keys",
> +		.data = &mt6331_regs,
>  	}, {
>  		.compatible = "mediatek,mt6358-keys",
>  		.data = &mt6358_regs,
> -- 
> 2.35.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
