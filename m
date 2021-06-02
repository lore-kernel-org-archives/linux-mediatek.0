Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A44BC4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 12:31:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CF1661159
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 12:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CF1661159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=28kgUokb1YXFgPiAtpJcfKEHS0YJaWDccHLjHyCyzHo=; b=h09NzHKSm9eXlZWvNaPKumz6OY
	97Bn73S+0x6zFzjy3Q0vUfwqka61bOG8Lj48TlyJMkY2ATXhSmDrJZEYZFnEpqk/pAN6nVw4OxI8U
	chRVK5dD/8KxqKUaMzw62HHy6E+HBbomrYSDKPBxfwscb0IWgunQqlQrXsT2R8eovZtYX1OdO3VKa
	mZbx8BjcnbLGNMIoDAsA/gjWg/65VGzZNQRsGSyS5R2KnuVixeJord/9TROXc/sVpNLiT3qvq4MpZ
	K8DhmeQHsz02Cg5YcP0hNbmZEdmjKVTnzlfT/+rPgHvdSSwvrVC5iH/xVs3cFCOmOs5uSzCg/FNPP
	ry2qLdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loQ1s-0045RH-Um; Wed, 02 Jun 2021 12:31:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loPmy-003xnn-EV; Wed, 02 Jun 2021 12:16:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id j14so2080274wrq.5;
 Wed, 02 Jun 2021 05:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YWSY2cvkvidrGJauSm19Qmn4FgCLAu02zP7qkPvv6YY=;
 b=kQQsl2UpBlB6F2Fk5+FuEtjEbKlu1rn2IDj2N3IsksURVjrcDfzgw0akVFK2ZJrium
 7B9DHOzOfhCN1pHe+R7wqs9Bwy7HFnI6PeLGLEQN+Bz/YlJ2qPWQf2QIk2gt/siQyP66
 kx0pTnpoUKSqZ1bVspuqO00aRF+mZ/e6mpEipknqziVjKuxTHTbYkNY9JJy9I8vmBM6V
 8zrOmG5ohKCSYLrZQbXQpN0iTSHwaqv6Vdug5QTyZHKv4BonHDYQSWF4EG4L/i4j7sYa
 W8QgIgOPl6GG3UDgukR4o6+gnS8RO2MzJuMI4EMhtQ4hY0EykvhjeaustbCZLYXOBjdP
 KGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YWSY2cvkvidrGJauSm19Qmn4FgCLAu02zP7qkPvv6YY=;
 b=oUg8gqexVFe+NPCx3plwaWPQxm4k16V/c1YqloNzACeSQrt14EfA7f0zijWd0xjaAN
 SScT5f9BWi4EE74qvRnXU6aksicI86bIK9zxSwnRRJrzpaiW/MozUNpboeKKJLuCJ0or
 26Ptrmu7uMr0caw+1LlVif3HH+NKAnbK6tiXM58FfPmyN/u9adqLekbqo9Jzj9ujl3Xb
 hN90HLO/XKOC/fVYMhYN9NutVMmssuI2qCtBgItxYDiHC1QPIkOc5Hf/NDJInffuSy6n
 aHITGm/zxzDzmtgFiRf2Q9K0q7chIN/1akTIc5Cr2K0TagN6hP66VEQt/LlZO5nmszeH
 rzNQ==
X-Gm-Message-State: AOAM531+ltEfCSz1zjD3abgXZY77au7p4A2xZwRcZkfHPdVU14d1QgT/
 QxP8ai6NRCgrAVc75Y4GMnc=
X-Google-Smtp-Source: ABdhPJx5bX8sIxUb03oSEQ/bL4H3N6FDIFHL2loduI+1H+Ag//xzJ8LAxuqAT2oUTbeKxIxzvqX1PA==
X-Received: by 2002:adf:a193:: with SMTP id u19mr17638169wru.9.1622636158691; 
 Wed, 02 Jun 2021 05:15:58 -0700 (PDT)
Received: from ziggy.stardust ([37.223.145.68])
 by smtp.gmail.com with ESMTPSA id s7sm7187825wrf.91.2021.06.02.05.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:15:58 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] soc: mtk-pm-domains: Fix the clock prepared issue
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 chun-jie.chen@mediatek.corp-partner.google.com,
 Yong Wu <yong.wu@mediatek.com>
References: <20210601035905.2970384-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d13c74d7-845f-40bc-1969-2e419d49e78e@gmail.com>
Date: Wed, 2 Jun 2021 14:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210601035905.2970384-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_051600_602165_B09A87A4 
X-CRM114-Status: GOOD (  28.16  )
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



On 01/06/2021 05:59, Hsin-Yi Wang wrote:
> From: Weiyi Lu <weiyi.lu@mediatek.com>
> 
> In this new power domain driver, when adding one power domain
> it will prepare the dependent clocks at the same.
> So we only do clk_bulk_enable/disable control during power ON/OFF.
> When system suspend, the pm runtime framework will forcely power off
> power domains. However, the dependent clocks are disabled but kept
> prepared.
> 
> In MediaTek clock drivers, PLL would be turned ON when we do
> clk_bulk_prepare control.
> 
> Clock hierarchy:
> PLL -->
>        DIV_CK -->
>                  CLK_MUX
>                  (may be dependent clocks)
>                          -->
>                              SUBSYS_CG
>                              (may be dependent clocks)
> 
> It will lead some unexpected clock states during system suspend.
> This patch will fix by doing prepare_enable/disable_unprepare on
> dependent clocks at the same time while we are going to power on/off
> any power domain.
> 
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Both patches applied to v5.13-next/soc

Thanks!

> ---
>  drivers/soc/mediatek/mtk-pm-domains.c | 31 +++++++--------------------
>  1 file changed, 8 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 0af00efa0ef8..536d8c64b2b4 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -211,7 +211,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_bulk_enable(pd->num_clks, pd->clks);
> +	ret = clk_bulk_prepare_enable(pd->num_clks, pd->clks);
>  	if (ret)
>  		goto err_reg;
>  
> @@ -229,7 +229,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>  	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
>  	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>  
> -	ret = clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
> +	ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
>  	if (ret)
>  		goto err_pwr_ack;
>  
> @@ -246,9 +246,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>  err_disable_sram:
>  	scpsys_sram_disable(pd);
>  err_disable_subsys_clks:
> -	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> +	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>  err_pwr_ack:
> -	clk_bulk_disable(pd->num_clks, pd->clks);
> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>  err_reg:
>  	scpsys_regulator_disable(pd->supply);
>  	return ret;
> @@ -269,7 +269,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>  	if (ret < 0)
>  		return ret;
>  
> -	clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> +	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>  
>  	/* subsys power off */
>  	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
> @@ -284,7 +284,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>  	if (ret < 0)
>  		return ret;
>  
> -	clk_bulk_disable(pd->num_clks, pd->clks);
> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>  
>  	scpsys_regulator_disable(pd->supply);
>  
> @@ -405,14 +405,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>  		pd->subsys_clks[i].clk = clk;
>  	}
>  
> -	ret = clk_bulk_prepare(pd->num_clks, pd->clks);
> -	if (ret)
> -		goto err_put_subsys_clocks;
> -
> -	ret = clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
> -	if (ret)
> -		goto err_unprepare_clocks;
> -
>  	/*
>  	 * Initially turn on all domains to make the domains usable
>  	 * with !CONFIG_PM and to get the hardware in sync with the
> @@ -427,7 +419,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>  		ret = scpsys_power_on(&pd->genpd);
>  		if (ret < 0) {
>  			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
> -			goto err_unprepare_clocks;
> +			goto err_put_subsys_clocks;
>  		}
>  	}
>  
> @@ -435,7 +427,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>  		ret = -EINVAL;
>  		dev_err(scpsys->dev,
>  			"power domain with id %d already exists, check your device-tree\n", id);
> -		goto err_unprepare_subsys_clocks;
> +		goto err_put_subsys_clocks;
>  	}
>  
>  	if (!pd->data->name)
> @@ -455,10 +447,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>  
>  	return scpsys->pd_data.domains[id];
>  
> -err_unprepare_subsys_clocks:
> -	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> -err_unprepare_clocks:
> -	clk_bulk_unprepare(pd->num_clks, pd->clks);
>  err_put_subsys_clocks:
>  	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  err_put_clocks:
> @@ -537,10 +525,7 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>  			"failed to remove domain '%s' : %d - state may be inconsistent\n",
>  			pd->genpd.name, ret);
>  
> -	clk_bulk_unprepare(pd->num_clks, pd->clks);
>  	clk_bulk_put(pd->num_clks, pd->clks);
> -
> -	clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>  	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
