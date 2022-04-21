Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A881C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 15:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJ0vq0dAu6nB0fVqShZOit3xapYNZ/nnKvoIcz32lAQ=; b=IXJbG71oHcxoFG
	mBgIMwlbXACnhtFIzNynanGSPisA+oUtMW2MrSWS5V7KaGg5nfDNvb/N2iDJT0k9qvmfbUw/qilip
	fu1Jj6YS2vUpklj6VosQNkejEentcP8Dup+kauoRHSQIPd2u28FTgTX05IpJ/gxflZp49PwZL0DUk
	UwQVmrw8VoPGswmKq/2tj2GhF2N+iC1uGy0bL0TeBLq8mOaipeqgxO188Jfoxc0okYC7F+mZcw++n
	9SmL/eYa6zmuRyrOwnGPEDfN8ZIz3XFSTyvpqiITBFbsdx9XoQwmO52D0FP5E2NIgLskefbxd6rGP
	fn2Dm19UDeHsKO0aQf4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhZBK-00E89e-Ms; Thu, 21 Apr 2022 15:57:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhZB8-00E84Y-La
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 15:57:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id x18so7358588wrc.0
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 08:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=VnNLAyze2JE7XuuKoj/51ytXs6NGyhHmfp21Cyl9MmA=;
 b=VO8awK3lGiGnHhWrqCQnGID1R8HC8MQlHxQoJMuxKp0mpRHZoF0BNkq6Xy3Blqbeuw
 tMXT4+xCkRY3OjIwsxv4rb78IDf3C6/GRo6TvkJRp6/xNIDITda9NJDg9v9tjw1blF8E
 8TnG5qrVwmyBzjygQfhwxiUt9myM525OXWtxQKh/DyzHujOn+MuN50X85+IoXpEgqIe8
 tCic3jWveRtB4r0HKXQpcABwHD/v/dwbzTjNKcobp9I7bX6N+2o/KZj+wuizWNq2wtvz
 cAEsxTGl+hWKYe2t2QmZrzmLZOYbpSJPVJ+EKwHqmT9K6074g3UEg9sGC4c2cuBy4kao
 uaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=VnNLAyze2JE7XuuKoj/51ytXs6NGyhHmfp21Cyl9MmA=;
 b=XmxFAqzbxAw8JZUodQdggGS8r7pBOBCK77KCnlDOhL9a7k7UKle3PX6g89JTUlRjMg
 i0WJDziDvp2kzWhvxQzY0Nedr2RtGRXOtn4+aNY0yz9aPfxcn38deuyphtJ7EOva240m
 JhLHLzL+IAwIBjdFXlgs0iZITrHgcPWI/UDbbphFpGDmnWuv75fGsTwROgX0Bi9GO18r
 xI95XrVM8UnEFwR7dcpFz0p72BLTz0udP3q7kHKqc2Pff4+mWIsQRzVN5gYaKrfeQWVi
 304gWkFh8GGtw9Y3zcqpEZtlvmdBiU33ybSS3VTmOce9Kw7/1x8q4YDEFC2wp5gUI0SE
 auKQ==
X-Gm-Message-State: AOAM531iuO/Q93rkItp2dJ+wgk+dQJJEL57s8FvrnKgJTb10GOoYLPPA
 KMrO6BnonXgx+7YA8x6k/9Gd7w==
X-Google-Smtp-Source: ABdhPJy0Bo28YBoXAWWYAZsWUoDBNtieLbnxM8RQ1LgV+c29fVCI3LPxSZ/+9rsggw7Jk/R66nt7xw==
X-Received: by 2002:adf:90e9:0:b0:204:2ee:7d5 with SMTP id
 i96-20020adf90e9000000b0020402ee07d5mr312461wri.536.1650556627033; 
 Thu, 21 Apr 2022 08:57:07 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:e19f:c42c:d783:89c1])
 by smtp.gmail.com with ESMTPSA id
 b5-20020adfd1c5000000b0020a7954a974sm3117739wrd.34.2022.04.21.08.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:57:06 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Fabien Parent <fparent@baylibre.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] Input: mtk-pmic-keys: add field to store if PMIC
 has key release IRQs
In-Reply-To: <20220415153629.1817202-6-fparent@baylibre.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
 <20220415153629.1817202-6-fparent@baylibre.com>
Date: Thu, 21 Apr 2022 17:57:05 +0200
Message-ID: <87fsm6zay6.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_085710_734142_FA781123 
X-CRM114-Status: GOOD (  18.30  )
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

> The MT6358 PMIC is not the only PMIC to have release IRQs. In order to
> support more PMIC that supports release IRQs, such as MT6357, MT6359,
> and possibly others, let's add some field in the platform data to
> indicate whether a PMIC support release keys.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Tested-by: Mattijs Korpershoek <mkorpershoek@baylibre.com> # on mt8183-pumpkin 

> ---
>  drivers/input/keyboard/mtk-pmic-keys.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index a0da644fe93d..609b87afd020 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -53,6 +53,7 @@ struct mtk_pmic_keys_regs {
>  struct mtk_pmic_keys_pdata {
>  	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
>  	u32 pmic_rst_reg;
> +	bool has_key_release_irqs;
>  };
>  
>  static const struct mtk_pmic_keys_pdata mt6397_pdata = {
> @@ -83,6 +84,7 @@ static const struct mtk_pmic_keys_pdata mt6358_pdata = {
>  		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
>  				   0x8, MT6358_PSC_TOP_INT_CON0, 0xa),
>  	.pmic_rst_reg = MT6358_TOP_RST_MISC,
> +	.has_key_release_irqs = true,
>  };
>  
>  struct mtk_pmic_keys_info {
> @@ -319,7 +321,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
>  			return keys->keys[index].irq;
>  		}
>  
> -		if (of_device_is_compatible(node, "mediatek,mt6358-keys")) {
> +		if (mtk_pmic_keys_pdata->has_key_release_irqs) {
>  			keys->keys[index].irq_r = platform_get_irq_byname(pdev,
>  									  irqnames_r[index]);
>  
> -- 
> 2.35.2

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
