Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DC2C47082
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 21:38:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C331661005
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 21:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C331661005
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmMnRU02RM9OfPBYKCMc4hnNdM2trs4n1gDJMChqiD4=; b=s8YL8MOZXyRCnG
	ED+EKbQMHvlPYlYxKAlDgODifLmrhgOsP+6B0/l654qqDIHbeMEJceSKwgyy4wwB52+/qcmMb02EH
	oj3pgVq5ozUD7qWZXjG/uDsDzGFqvjCECIvItAh07OnK98DSyVuIdYokxbwMLcThE2ea+pt7XaGk/
	w8U8Ef5vpxT9e0IIHxFpyufBDCDG+2BegYfvoAinInFLRl69H8jTCmHJ2rfoRFV9YjPNy3WeRooVH
	QTGmcMVcuVsUy1BMYTWkIH4RdXlaSobJ110vsgLfm0fiX5s6PLvU3Tjx74mQJD0ezeFsBBDc6N+PZ
	mh4CxZrBYhKLkTdzifUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnpcX-00DVL4-NY; Mon, 31 May 2021 21:38:49 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnpcK-00DVIE-BA; Mon, 31 May 2021 21:38:38 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so12269669otg.2; 
 Mon, 31 May 2021 14:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ojuZOBLmhzSo//gYE9XYKfbNnXjNOZfB6L6acFXXDtI=;
 b=ehmT2U5qCUbzR760Ghnnoa2rUBLdZW5RPTKyMGIRh51+D89EqMHTXUiG7iCT38WqdJ
 8Pwi3lhHehtIDM7b+LnnEgZiMMdvKmu+6ARCx7zmBJ3nnIBrcZ5edU/um2Isg41otBfu
 4O4BaJR6oP3WlamHS2pJs3vWUqpNTjkEVH4911dYn/4IaFUJm1v8+zMQ9Fqq/lGzBm2J
 XWcE1TxwnF+u68j+UYGvDIvFaNNb1uEYQVvkqtF8k3w4ld+0T5KsZyusGe6gKi66EJDH
 SsL68mTpAaHO5CxVw+hdTdr3Ak3Y4yiGoGjoyPqWfy3HjyWSsj7wfRvxv7HYC98MSfTf
 dNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ojuZOBLmhzSo//gYE9XYKfbNnXjNOZfB6L6acFXXDtI=;
 b=fg6DIqbalePwmADXUWnIAwjvtLvgJ4p2A6LMLpIqYTlD7xqW/HbVE+CyILGfhmgjuI
 d1NW4nZffeiRPyKmnswI/KA6xDsYIilZHkNK9+EzXB8ZU9AQrORyw9b31GwS3REocPbK
 B7iyYmKu+f/bvJSaiXYETjDbbFnXolRX8cnQzVZ3RHb35u4qS1xVJ2IN0cOD9vc3PvBB
 uAA3vFOOY6A/873KS4spFUV0OUwXQ3ardX5jN/SXAXTsEjEua4r4mQqMM7qmSP8XU9rM
 DE6ciFTv9zMBAUcHz0FYwm48t6JX5fqQOhRt1Ajjwcpb0wwU0FgFlVPrfEv/W/AP+cGp
 RkBg==
X-Gm-Message-State: AOAM532RVDApIEP59zR795ATFVjZWRcDQI+Nh/iKb5g2XuI2ermS6NE8
 Rn9oAGyxQbMNz4CFdpC863td4SXy5jVdqY6A2AU=
X-Google-Smtp-Source: ABdhPJwPe57FNHz5K6ZC+pA2mUTdebCSdzaroJTS7Fkr2Z+OudnnGaGDOy65ptw9Up+ut7Mi+xpiftKensAcefH7jIM=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr17606539otb.281.1622497115732; 
 Mon, 31 May 2021 14:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210531043502.2702645-1-hsinyi@chromium.org>
In-Reply-To: <20210531043502.2702645-1-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 31 May 2021 23:38:23 +0200
Message-ID: <CAFqH_50qTKnKGeKUGYs_TzqWzmMGqpeKgGVmhYWjC90Nn_nKUw@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: mtk-pm-domains: Fix the clock prepared issue
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 chun-jie.chen@mediatek.corp-partner.google.com, 
 Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_143836_412992_2DAF829E 
X-CRM114-Status: GOOD (  29.57  )
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

Hi Hsin-Yi,

Thank you for the patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dl., 31 de maig
2021 a les 6:35:
>
> From: Weiyi Lu <weiyi.lu@mediatek.com>
>
> In this new power domain driver, when adding one power domain
> it will prepare the depenedent clocks at the same.

Typo: s/depenedent/dependent/

> So we only do clk_bulk_enable/disable control during power ON/OFF.
> When system suspend, the pm runtime framework will forcely power off
> power domains. However, the dependent clocks are disabled but kept
> preapred.

Typo: s/preapred/prepared

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

I think it would be nice to have a Fixes tag here, so this can be
backported more easily.

> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/soc/mediatek/mtk-pm-domains.c | 31 +++++++--------------------
>  1 file changed, 8 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 0af00efa0ef8..536d8c64b2b4 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -211,7 +211,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>         if (ret)
>                 return ret;
>
> -       ret = clk_bulk_enable(pd->num_clks, pd->clks);
> +       ret = clk_bulk_prepare_enable(pd->num_clks, pd->clks);
>         if (ret)
>                 goto err_reg;
>
> @@ -229,7 +229,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>         regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
>         regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>
> -       ret = clk_bulk_enable(pd->num_subsys_clks, pd->subsys_clks);
> +       ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
>         if (ret)
>                 goto err_pwr_ack;
>
> @@ -246,9 +246,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>  err_disable_sram:
>         scpsys_sram_disable(pd);
>  err_disable_subsys_clks:
> -       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> +       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>  err_pwr_ack:
> -       clk_bulk_disable(pd->num_clks, pd->clks);
> +       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>  err_reg:
>         scpsys_regulator_disable(pd->supply);
>         return ret;
> @@ -269,7 +269,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>         if (ret < 0)
>                 return ret;
>
> -       clk_bulk_disable(pd->num_subsys_clks, pd->subsys_clks);
> +       clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>
>         /* subsys power off */
>         regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
> @@ -284,7 +284,7 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
>         if (ret < 0)
>                 return ret;
>
> -       clk_bulk_disable(pd->num_clks, pd->clks);
> +       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>
>         scpsys_regulator_disable(pd->supply);
>
> @@ -405,14 +405,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>                 pd->subsys_clks[i].clk = clk;
>         }
>
> -       ret = clk_bulk_prepare(pd->num_clks, pd->clks);
> -       if (ret)
> -               goto err_put_subsys_clocks;
> -
> -       ret = clk_bulk_prepare(pd->num_subsys_clks, pd->subsys_clks);
> -       if (ret)
> -               goto err_unprepare_clocks;
> -
>         /*
>          * Initially turn on all domains to make the domains usable
>          * with !CONFIG_PM and to get the hardware in sync with the
> @@ -427,7 +419,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>                 ret = scpsys_power_on(&pd->genpd);
>                 if (ret < 0) {
>                         dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
> -                       goto err_unprepare_clocks;
> +                       goto err_put_subsys_clocks;
>                 }
>         }
>
> @@ -435,7 +427,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>                 ret = -EINVAL;
>                 dev_err(scpsys->dev,
>                         "power domain with id %d already exists, check your device-tree\n", id);
> -               goto err_unprepare_subsys_clocks;
> +               goto err_put_subsys_clocks;
>         }
>
>         if (!pd->data->name)
> @@ -455,10 +447,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>
>         return scpsys->pd_data.domains[id];
>
> -err_unprepare_subsys_clocks:
> -       clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> -err_unprepare_clocks:
> -       clk_bulk_unprepare(pd->num_clks, pd->clks);
>  err_put_subsys_clocks:
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  err_put_clocks:
> @@ -537,10 +525,7 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
>                         "failed to remove domain '%s' : %d - state may be inconsistent\n",
>                         pd->genpd.name, ret);
>
> -       clk_bulk_unprepare(pd->num_clks, pd->clks);
>         clk_bulk_put(pd->num_clks, pd->clks);
> -
> -       clk_bulk_unprepare(pd->num_subsys_clks, pd->subsys_clks);
>         clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
>  }
>
> --
> 2.32.0.rc0.204.g9fa02ecfa5-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
