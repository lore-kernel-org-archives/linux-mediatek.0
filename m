Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA513C6377A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 10:44:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A296F61009
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 10:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A296F61009
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oHg8C6zyzsi57s8zeW5O6doM/SYLnsooFgoGMfDJnI=; b=nNra24KsyNn9fo
	Bfc0a9EmNceCTkY+z2hoxelyJwc1kQpJfQHjqdqFLf6CGk/jgMdALH/JUnBXFZNhUb7vbon7Bc/eH
	DoT1nGySnNCG9EZqTdEDRCdcsEdaoOQ26E4Pph3434P1vYkc7TucopHZUj7RGrWSp/1EgtZJsAd9k
	dG3OCkQHTrkD3vwOa8FGjK/zRDC8vp3n6k/OhBdy9a6i3Qj+NN2zZZPe3mscnPBhevI8q1pKW23gC
	b9JMS97DtjsdWFGl9Mi8uAj9xC68qhlSkuuaYePpj7mVKFzpFtcO/7iAWt7QcfxPb23Qq8Fya6RVi
	HA0qhPdtpYtQKG3LxYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m69i4-00FH32-7D; Wed, 21 Jul 2021 10:44:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m69ho-00FH1f-4y
 for linux-mediatek@lists.infradead.org; Wed, 21 Jul 2021 10:44:02 +0000
Received: by mail-pl1-x635.google.com with SMTP id e14so744269plh.8
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Jul 2021 03:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9DVp5cMarKfRblqMp1JqfD1jVMuOznsl/p/4ds1/Lc4=;
 b=EsHBU3Bqty6jMEJPdASJeQ8I6Qs6swot5cdCUYUMf+P6xEmv1uPyu1BO2Nunm7w9hj
 BuiMTXC4et7tYFweISnJMrtEoxAd4nKBV/N1uYOShmNp05Z5oTWDyjhq7Nc4zj+n2kUD
 tgMbtPxMULDMfgLNBuFqzpR2SR37MjcXaDvVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9DVp5cMarKfRblqMp1JqfD1jVMuOznsl/p/4ds1/Lc4=;
 b=lwsg1LQJoNy6WIbou3KHLfJUIFCm10cGy+/AsIHOLnQ1I5OKjKSY16nmRY0/wuvTxG
 4mbHUoxmXLTq+98tuPSsOCJF2rJ0J9146VXCcqOGNcuoySGuj7NoEYjSRRWOl7Ta3TrW
 HkgY52g418ek6TiknBa8osz21Q1zkH1ROl6f9xUGlOuML3j1diiE7ng+hjq0CfsK8XtW
 6D9q9NZ/XOxe/O71b42f4r8cD4dc9dNUGIfyEh/q8sLy6u/7NHWBA3kQ0WTPS46Ve2m8
 NiEv3XQlZOoirLaB0EcLpwb8TsGntkyTGadH2Fvw+mL7FstD3/mjXMdyeK3ef2Dkj8gz
 5vGg==
X-Gm-Message-State: AOAM533ye1vOWQzVs+0F4by7Q9mWKBM+tAJW9Dja3ZiR+M5pSfaq9tGd
 w89wWYQ2s1TJkhCc9pRsmTe5NqpKOTui2qHr8SC2aA==
X-Google-Smtp-Source: ABdhPJzUwLC3PwM/Irpdo1uhb1AZIY9WX9IISXYAAcU+rL4ygkAXYJMDMx/lhZJEj0r/QIe60SZzNua5LdWcPUK8Plo=
X-Received: by 2002:a17:90a:e284:: with SMTP id
 d4mr3160085pjz.126.1626864238015; 
 Wed, 21 Jul 2021 03:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-4-yong.wu@mediatek.com>
In-Reply-To: <20210715121209.31024-4-yong.wu@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 21 Jul 2021 18:43:46 +0800
Message-ID: <CAATdQgDUwOSAx+tTjQvduwegOd7AM02T4BqHT5YtgjwU=zRSaA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] memory: mtk-smi: Use clk_bulk clock ops
To: Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux-foundation.org, 
 youlin.pei@mediatek.com, anan.sun@mediatek.com, ming-fan.chen@mediatek.com, 
 yi.kuo@mediatek.com, anthony.huang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_034400_224442_65BABA7E 
X-CRM114-Status: GOOD (  35.86  )
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

On Thu, Jul 15, 2021 at 8:23 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> Use clk_bulk interface instead of the orginal one to simplify the code.
>
> SMI have several clocks: apb/smi/gals, the apb/smi clocks are required
> for both smi-common and smi-larb while the gals clock are optional.
> thus, use devm_clk_bulk_get for apb/smi and use
> devm_clk_bulk_get_optional for gals.
>
> For gals clocks, we already use get_optional for it, then the flag
> "has_gals" is not helpful now, remove it.
>
> Also remove clk fail logs since bulk interface already output fail log.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/memory/mtk-smi.c | 138 +++++++++++++--------------------------
>  1 file changed, 47 insertions(+), 91 deletions(-)
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index c5fb51f73b34..a2213452059d 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -60,9 +60,15 @@ enum mtk_smi_gen {
>         MTK_SMI_GEN2
>  };
>
> +#define MTK_SMI_CLK_NR_MAX                     4
> +
> +/* Always require apb/smi clocks while gals clocks are optional. */
> +static const char * const mtk_smi_clks_required[] = {"apb", "smi"};
> +static const char * const mtk_smi_common_clks_optional[] = {"gals0", "gals1"};
> +static const char * const mtk_smi_larb_clks_optional[] = {"gals"};
> +
>  struct mtk_smi_common_plat {
>         enum mtk_smi_gen gen;
> -       bool             has_gals;
>         u32              bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
>  };
>
> @@ -70,13 +76,12 @@ struct mtk_smi_larb_gen {
>         int port_in_larb[MTK_LARB_NR_MAX + 1];
>         void (*config_port)(struct device *dev);
>         unsigned int                    larb_direct_to_common_mask;
> -       bool                            has_gals;
>  };
>
>  struct mtk_smi {
>         struct device                   *dev;
> -       struct clk                      *clk_apb, *clk_smi;
> -       struct clk                      *clk_gals0, *clk_gals1;
> +       unsigned int                    clk_num;
> +       struct clk_bulk_data            clks[MTK_SMI_CLK_NR_MAX];
>         struct clk                      *clk_async; /*only needed by mt2701*/
>         union {
>                 void __iomem            *smi_ao_base; /* only for gen1 */
> @@ -95,45 +100,6 @@ struct mtk_smi_larb { /* larb: local arbiter */
>         unsigned char                   *bank;
>  };
>
> -static int mtk_smi_clk_enable(const struct mtk_smi *smi)
> -{
> -       int ret;
> -
> -       ret = clk_prepare_enable(smi->clk_apb);
> -       if (ret)
> -               return ret;
> -
> -       ret = clk_prepare_enable(smi->clk_smi);
> -       if (ret)
> -               goto err_disable_apb;
> -
> -       ret = clk_prepare_enable(smi->clk_gals0);
> -       if (ret)
> -               goto err_disable_smi;
> -
> -       ret = clk_prepare_enable(smi->clk_gals1);
> -       if (ret)
> -               goto err_disable_gals0;
> -
> -       return 0;
> -
> -err_disable_gals0:
> -       clk_disable_unprepare(smi->clk_gals0);
> -err_disable_smi:
> -       clk_disable_unprepare(smi->clk_smi);
> -err_disable_apb:
> -       clk_disable_unprepare(smi->clk_apb);
> -       return ret;
> -}
> -
> -static void mtk_smi_clk_disable(const struct mtk_smi *smi)
> -{
> -       clk_disable_unprepare(smi->clk_gals1);
> -       clk_disable_unprepare(smi->clk_gals0);
> -       clk_disable_unprepare(smi->clk_smi);
> -       clk_disable_unprepare(smi->clk_apb);
> -}
> -
>  int mtk_smi_larb_get(struct device *larbdev)
>  {
>         int ret = pm_runtime_resume_and_get(larbdev);
> @@ -270,7 +236,6 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt6779 = {
>  };
>
>  static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
> -       .has_gals                   = true,
>         .config_port                = mtk_smi_larb_config_port_gen2_general,
>         .larb_direct_to_common_mask = BIT(2) | BIT(3) | BIT(7),
>                                       /* IPU0 | IPU1 | CCU */
> @@ -312,6 +277,27 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
>         {}
>  };
>
> +static int mtk_smi_dts_clk_init(struct device *dev, struct mtk_smi *smi,
> +                               unsigned int clk_nr_optional,
> +                               const char * const clk_optional[])
> +{
> +       int i, ret, clk_nr_required;
> +
> +       clk_nr_required = ARRAY_SIZE(mtk_smi_clks_required);
> +       for (i = 0; i < clk_nr_required; i++)
> +               smi->clks[i].id = mtk_smi_clks_required[i];
> +       ret = devm_clk_bulk_get(dev, clk_nr_required, smi->clks);
> +       if (ret)
> +               return ret;
> +
> +       for (i = 0; i < clk_nr_optional; i++)
> +               smi->clks[i + clk_nr_required].id = clk_optional[i];
> +       ret = devm_clk_bulk_get_optional(dev, clk_nr_optional,
> +                                        smi->clks + clk_nr_required);
> +       smi->clk_num = clk_nr_required + clk_nr_optional;
> +       return ret;
> +}
> +
>  static int mtk_smi_larb_probe(struct platform_device *pdev)
>  {
>         struct mtk_smi_larb *larb;
> @@ -320,6 +306,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>         struct device_node *smi_node;
>         struct platform_device *smi_pdev;
>         struct device_link *link;
> +       int ret;
>
>         larb = devm_kzalloc(dev, sizeof(*larb), GFP_KERNEL);
>         if (!larb)
> @@ -331,24 +318,13 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>         if (IS_ERR(larb->base))
>                 return PTR_ERR(larb->base);
>
> -       larb->smi.clk_apb = devm_clk_get(dev, "apb");
> -       if (IS_ERR(larb->smi.clk_apb))
> -               return PTR_ERR(larb->smi.clk_apb);
> -
> -       larb->smi.clk_smi = devm_clk_get(dev, "smi");
> -       if (IS_ERR(larb->smi.clk_smi))
> -               return PTR_ERR(larb->smi.clk_smi);
> -
> -       if (larb->larb_gen->has_gals) {
> -               /* The larbs may still haven't gals even if the SoC support.*/
> -               larb->smi.clk_gals0 = devm_clk_get(dev, "gals");
> -               if (PTR_ERR(larb->smi.clk_gals0) == -ENOENT)
> -                       larb->smi.clk_gals0 = NULL;
> -               else if (IS_ERR(larb->smi.clk_gals0))
> -                       return PTR_ERR(larb->smi.clk_gals0);
> -       }
> -       larb->smi.dev = dev;
> +       ret = mtk_smi_dts_clk_init(dev, &larb->smi,
> +                                  ARRAY_SIZE(mtk_smi_larb_clks_optional),
> +                                  mtk_smi_larb_clks_optional);
> +       if (ret)
> +               return ret;
>
> +       larb->smi.dev = dev;
>         smi_node = of_parse_phandle(dev->of_node, "mediatek,smi", 0);
>         if (!smi_node)
>                 return -EINVAL;
> @@ -391,11 +367,9 @@ static int __maybe_unused mtk_smi_larb_resume(struct device *dev)
>         const struct mtk_smi_larb_gen *larb_gen = larb->larb_gen;
>         int ret;
>
> -       ret = mtk_smi_clk_enable(&larb->smi);
> -       if (ret < 0) {
> -               dev_err(dev, "Failed to enable clock(%d).\n", ret);
> +       ret = clk_bulk_prepare_enable(larb->smi.clk_num, larb->smi.clks);
> +       if (ret < 0)
>                 return ret;
> -       }
>
>         /* Configure the basic setting for this larb */
>         larb_gen->config_port(dev);
> @@ -407,7 +381,7 @@ static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
>  {
>         struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>
> -       mtk_smi_clk_disable(&larb->smi);
> +       clk_bulk_disable_unprepare(larb->smi.clk_num, larb->smi.clks);
>         return 0;
>  }
>
> @@ -437,21 +411,18 @@ static const struct mtk_smi_common_plat mtk_smi_common_gen2 = {
>
>  static const struct mtk_smi_common_plat mtk_smi_common_mt6779 = {
>         .gen            = MTK_SMI_GEN2,
> -       .has_gals       = true,
>         .bus_sel        = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(4) |
>                           F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
>  };
>
>  static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
>         .gen      = MTK_SMI_GEN2,
> -       .has_gals = true,
>         .bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(5) |
>                     F_MMU1_LARB(7),
>  };
>
>  static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
>         .gen      = MTK_SMI_GEN2,
> -       .has_gals = true,
>         .bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(5) |
>                     F_MMU1_LARB(6),
>  };
> @@ -501,23 +472,10 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
>         common->dev = dev;
>         common->plat = of_device_get_match_data(dev);
>
> -       common->clk_apb = devm_clk_get(dev, "apb");
> -       if (IS_ERR(common->clk_apb))
> -               return PTR_ERR(common->clk_apb);
> -
> -       common->clk_smi = devm_clk_get(dev, "smi");
> -       if (IS_ERR(common->clk_smi))
> -               return PTR_ERR(common->clk_smi);
> -
> -       if (common->plat->has_gals) {
> -               common->clk_gals0 = devm_clk_get(dev, "gals0");
> -               if (IS_ERR(common->clk_gals0))
> -                       return PTR_ERR(common->clk_gals0);
> -
> -               common->clk_gals1 = devm_clk_get(dev, "gals1");
> -               if (IS_ERR(common->clk_gals1))
> -                       return PTR_ERR(common->clk_gals1);
> -       }
> +       ret = mtk_smi_dts_clk_init(dev, common, ARRAY_SIZE(mtk_smi_common_clks_optional),
> +                                  mtk_smi_common_clks_optional);
> +       if (ret)
> +               return ret;
>
>         /*
>          * for mtk smi gen 1, we need to get the ao(always on) base to config
> @@ -561,11 +519,9 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
>         u32 bus_sel = common->plat->bus_sel;
>         int ret;
>
> -       ret = mtk_smi_clk_enable(common);
> -       if (ret) {
> -               dev_err(common->dev, "Failed to enable clock(%d).\n", ret);
> +       ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
> +       if (ret)
>                 return ret;
> -       }
>
>         if (common->plat->gen == MTK_SMI_GEN2 && bus_sel)
>                 writel(bus_sel, common->base + SMI_BUS_SEL);
> @@ -576,7 +532,7 @@ static int __maybe_unused mtk_smi_common_suspend(struct device *dev)
>  {
>         struct mtk_smi *common = dev_get_drvdata(dev);
>
> -       mtk_smi_clk_disable(common);
> +       clk_bulk_disable_unprepare(common->clk_num, common->clks);
>         return 0;
>  }
>
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
