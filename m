Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69D6C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 17:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+ftqIfdkSVX9/E+y5CjNrH9E0Z7Pga+p2819VhJF+g=; b=0iG2DbVPGGkUB9FTLipvgYUAEq
	W1CELf+SCrsv1MFavh8gL22RX0An3Mbyc11InE6whyjZ2TCrbRIOUPGo4eKiln42BbOLmHM3EQjLO
	UCtjJARjcgxmHDWBxxsGqezt0hVhKhx/4ipiGiUelxBeF2sO1tbwalNUzlbjQWewUu2t/pJjCDlt/
	Ev2bCqad+NuQH9ejJb0OdM0yywRvHI848ZdoyZ5C2NAii5lXO6F7de4lePLUxMGOgXTZDGu1qnVfp
	K+XtoEtZOEErqwir3Kx8pL1EDOJpt6eCQyilP7by7WPgnvIPs/M040kdi6WYlAeffGyQpfKlsOfKv
	aSHJ/BjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxXEf-00B6gg-J9; Tue, 22 Nov 2022 17:39:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxXER-00B6dH-VZ; Tue, 22 Nov 2022 17:38:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so11677945wms.0;
        Tue, 22 Nov 2022 09:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h+ftqIfdkSVX9/E+y5CjNrH9E0Z7Pga+p2819VhJF+g=;
        b=EqZFphm6mu/6vZej+M7COtDqt5dpwClyQiLRA4vFvDa3RXQ2e1bOKYrCHrBHZHM2c0
         QmJAO2mpAsh1jWNNJyK+Yvb05EblWec7imFqb40zHbynjXLLTN1+oj5aGzKmDHz4odiv
         uhsbiY2OHCeLV2Og7WDcAHXDjuVJEZoBeq0LdrG5OR7dZ4HHouUzhFljSnDrT/fZYRJY
         6aJwEf+4/3bQQ8d7dZOrXjiT9cdduoikisCib1WHxg46wL8T6DkgAnKIj/KleqogPTT+
         u6wDM3210bf8rpP/g2DP0lZo9PDtmMuYniVXIrDxrdk3WWmvl86qNWWS0cv2AfGegiVH
         GnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+ftqIfdkSVX9/E+y5CjNrH9E0Z7Pga+p2819VhJF+g=;
        b=dMVVlP6Pgkzuqvoi5dOUH61l9xtZb6DAWfNLziijXvv1UmdP56ENaoVXIDkCrqWFKy
         qPnJLLTb+i+bQEK6DJ/rSXhOCOWHODoye+OGGElNb06gqATbMJ3XL+yeDTQRfW6FTpJ3
         +TFF2G3p86mOvGn3mnp0kawizvstd2LtNa99AJGMA/5PUz3wSACmpZ5egoKzF89UPhLn
         XwnvmVhsEoYEtzsK/9YXTERE6k/kqzhrE4BrCvKAQ4WiQKZNzsKxBfQYoUKVoOqzxz7+
         1xtknawWzrwtSJTsktUdGECzuNsDC+2bqSz4N/Chq/pyepve565lv/1IvMWz6SFVYmqj
         HlbQ==
X-Gm-Message-State: ANoB5pn+CQOB0DpolEZcXQFe7pDnN92fBhZKzu62TtKX6sz3lIvcNWhn
	4XEDd/N9x1NF8WZjj/Zwq78=
X-Google-Smtp-Source: AA0mqf7Lcc8odQYBjV/PBGGjFzwvPElZiX4Vw/d75C/ERxuf9H4WD3Ghxg7YYtikN0Eo2Ta6fcNTlg==
X-Received: by 2002:a05:600c:348d:b0:3cf:88e7:f808 with SMTP id a13-20020a05600c348d00b003cf88e7f808mr3503934wmq.200.1669138730275;
        Tue, 22 Nov 2022 09:38:50 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id g15-20020adff40f000000b00241db7deb57sm4886755wro.114.2022.11.22.09.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 09:38:49 -0800 (PST)
Message-ID: <4a08b689-4592-86cb-7eba-cca49970a489@gmail.com>
Date: Tue, 22 Nov 2022 18:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] soc: mediatek: pm-domains: Fix the power glitch issue
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
References: <20221014102029.1162-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221014102029.1162-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_093852_048993_F2C5CA46 
X-CRM114-Status: GOOD (  17.00  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/10/2022 12:20, Allen-KH Cheng wrote:
> From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> 
> Power reset maybe generate unexpected signal. In order to avoid
> the glitch issue, we need to enable isolation first to guarantee the
> stable signal when power reset is triggered.
> 
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Applied to fixes now, thanks!

> ---
>    Resend a PATCH from
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220310011548.2487-1-chun-jie.chen@mediatek.com/
> 
>   [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> ---
> ---
>   drivers/soc/mediatek/mtk-pm-domains.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 09e3c38b8466..474b272f9b02 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -275,9 +275,9 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>   	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>   
>   	/* subsys power off */
> -	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>   	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
>   	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_BIT);
> +	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>   	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_2ND_BIT);
>   	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ON_BIT);
>   

