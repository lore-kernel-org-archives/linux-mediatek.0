Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644E1C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 10:45:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0604560238
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 10:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0604560238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nf8HUqvbHbB5LchhJJci5jTyyd9Xl+knCwoTo8SEZwk=; b=TCRfQ4nYq4HxwZ
	DVwyZ8grX6GmauWq2ceT5ogmgLNPEGwQZYdoWi3ryiE3kxo5QVwKY7TkqnY2C2z/2ixhqh3kVor5z
	zRNzavrnwTTqlMeA+iQ9qMCUCt/5f+n/1twxeSvoB1PQEUCZvXmYY3iH3FuCOqg5pP/pAhmeq0K9K
	QSa937bo6upqKy0GnYZpJmfeiX5Sle1vq5DgyOVZ0h5RTVzaX5Y5AverOF2lcoAZA0Bs3Leq99mMY
	fOpkBCSOfQE3nMsyiHzatt0oQWUdko982MN2+HLVN5O0Mh8VOPPVLs841bB/KU1TN6M7QcUGqZ1J0
	VSKdZ3Sw7uL0fGgrRM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m69ig-00FHF9-1R; Wed, 21 Jul 2021 10:44:54 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m69ic-00FHCm-B4
 for linux-mediatek@lists.infradead.org; Wed, 21 Jul 2021 10:44:52 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso3760068pjz.1
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Jul 2021 03:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m9KfU32Td3xB/wuWNhNbDVpIahkZHa5eXkr6/E8GaKE=;
 b=he/bvGRxDLSF7f0GBNdzXYHRkkjCsYcba5AlfCdmFGNOSPALoTInP/YKKXJkwF2DPu
 90L1sVjKnum25CXgGjAHi/E3U9XJXUxXyt6f2VlovfiI7NI4CGfsdLzyn12fuW0W5d4g
 xlb3wCH4NBfE83xkTJy7oGw7zBhZkEwfYc3Lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9KfU32Td3xB/wuWNhNbDVpIahkZHa5eXkr6/E8GaKE=;
 b=LeW78u1bAWeMSvKn1FuFcTTqbej45/+W1mZr9eKYet7VUtyeTUoKAwMA/xhkd6gsBr
 jNNhsAoHQTMg+TGYzfenQRjk5DdV7LAM7glI5X/kC7jlzVZ0VyeKiVztq385OT+4BdQ4
 Jhoow9Oisl69BopGR+fs7l+WnqghvJnMC8WALmVzXKX3bGEh5mTy9Al1H6Qlmd9FxoDU
 AG4Kf7GlUeAAfgKijS2h6uwnAf/ZipqVOOtp3iplJ/I/Sp3kW6xpZmTyRaBzJpFC/hPx
 isMyDZnveUCDw12PVEyytHWF3NiDZNSYd5BdL49Jb0NtBSMTeLkz4tnf5hmaV32sQo3O
 Ih7w==
X-Gm-Message-State: AOAM533uhmrtSqHdEtiwmBrUsOMwpngSSxhLl73/QQsL++5lp3BKP9X8
 /DkbaIXDbS1gTudi5Zp6daymrUyQOL7nUWF9CBecPA==
X-Google-Smtp-Source: ABdhPJwMQyEj40wDyMHpYAAPz6Zr7HtqGIr3IjYBKZh75hmdijcf7C1xGMIP2NE1ifwpN1NaVPhToI/+eV5K9Fo7Ztc=
X-Received: by 2002:a17:902:8c83:b029:129:17e5:a1cc with SMTP id
 t3-20020a1709028c83b029012917e5a1ccmr27210970plo.49.1626864289274; Wed, 21
 Jul 2021 03:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-6-yong.wu@mediatek.com>
In-Reply-To: <20210715121209.31024-6-yong.wu@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 21 Jul 2021 18:44:37 +0800
Message-ID: <CAATdQgB4P=7Wvhc_SBxy1tGKRXD7qukc95bGNJJ=ECyVm_dgHQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] memory: mtk-smi: Adjust some code position
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
X-CRM114-CacheID: sfid-20210721_034450_465348_E1A30D97 
X-CRM114-Status: GOOD (  26.35  )
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

Hi,

On Thu, Jul 15, 2021 at 8:23 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> No functional change. Only move the code position to make the code more
> readable.
> 1. Put the register smi-common above smi-larb. Prepare to add some others
>    register setting.
> 2. Put mtk_smi_larb_unbind around larb_bind.
> 3. Sort the SoC data alphabetically. and put them in one line as the
>    current kernel allow it.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/memory/mtk-smi.c | 185 +++++++++++++++------------------------
>  1 file changed, 73 insertions(+), 112 deletions(-)
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index ff07b14bcd66..6f8e582bace5 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -17,12 +17,15 @@
>  #include <dt-bindings/memory/mt2701-larb-port.h>
>  #include <dt-bindings/memory/mtk-memory-port.h>
>
> -/* mt8173 */
> -#define SMI_LARB_MMU_EN                0xf00
> +/* SMI COMMON */
> +#define SMI_BUS_SEL                    0x220
> +#define SMI_BUS_LARB_SHIFT(larbid)     ((larbid) << 1)
> +/* All are MMU0 defaultly. Only specialize mmu1 here. */
> +#define F_MMU1_LARB(larbid)            (0x1 << SMI_BUS_LARB_SHIFT(larbid))
>
> -/* mt8167 */
> -#define MT8167_SMI_LARB_MMU_EN 0xfc0
> +/* SMI LARB */
>
> +/* Below are about mmu enable registers, they are different in SoCs */
>  /* mt2701 */
>  #define REG_SMI_SECUR_CON_BASE         0x5c0
>
> @@ -41,20 +44,20 @@
>  /* mt2701 domain should be set to 3 */
>  #define SMI_SECUR_CON_VAL_DOMAIN(id)   (0x3 << ((((id) & 0x7) << 2) + 1))
>
> -/* mt2712 */
> -#define SMI_LARB_NONSEC_CON(id)        (0x380 + ((id) * 4))
> -#define F_MMU_EN               BIT(0)
> -#define BANK_SEL(id)           ({                      \
> +/* mt8167 */
> +#define MT8167_SMI_LARB_MMU_EN         0xfc0
> +
> +/* mt8173 */
> +#define MT8173_SMI_LARB_MMU_EN         0xf00
> +
> +/* larb gen2 */
> +#define SMI_LARB_NONSEC_CON(id)                (0x380 + ((id) * 4))
> +#define F_MMU_EN                       BIT(0)
> +#define BANK_SEL(id)                   ({              \
>         u32 _id = (id) & 0x3;                           \
>         (_id << 8 | _id << 10 | _id << 12 | _id << 14); \
>  })
>
> -/* SMI COMMON */
> -#define SMI_BUS_SEL                    0x220
> -#define SMI_BUS_LARB_SHIFT(larbid)     ((larbid) << 1)
> -/* All are MMU0 defaultly. Only specialize mmu1 here. */
> -#define F_MMU1_LARB(larbid)            (0x1 << SMI_BUS_LARB_SHIFT(larbid))
> -
>  enum mtk_smi_type {
>         MTK_SMI_GEN1,
>         MTK_SMI_GEN2
> @@ -132,36 +135,16 @@ mtk_smi_larb_bind(struct device *dev, struct device *master, void *data)
>         return -ENODEV;
>  }
>
> -static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
> -{
> -       struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> -       u32 reg;
> -       int i;
> -
> -       if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
> -               return;
> -
> -       for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
> -               reg = readl_relaxed(larb->base + SMI_LARB_NONSEC_CON(i));
> -               reg |= F_MMU_EN;
> -               reg |= BANK_SEL(larb->bank[i]);
> -               writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
> -       }
> -}
> -
> -static void mtk_smi_larb_config_port_mt8173(struct device *dev)
> +static void
> +mtk_smi_larb_unbind(struct device *dev, struct device *master, void *data)
>  {
> -       struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> -
> -       writel(*larb->mmu, larb->base + SMI_LARB_MMU_EN);
> +       /* Do nothing as the iommu is always enabled. */
>  }
>
> -static void mtk_smi_larb_config_port_mt8167(struct device *dev)
> -{
> -       struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> -
> -       writel(*larb->mmu, larb->base + MT8167_SMI_LARB_MMU_EN);
> -}
> +static const struct component_ops mtk_smi_larb_component_ops = {
> +       .bind = mtk_smi_larb_bind,
> +       .unbind = mtk_smi_larb_unbind,
> +};
>
>  static void mtk_smi_larb_config_port_gen1(struct device *dev)
>  {
> @@ -194,26 +177,36 @@ static void mtk_smi_larb_config_port_gen1(struct device *dev)
>         }
>  }
>
> -static void
> -mtk_smi_larb_unbind(struct device *dev, struct device *master, void *data)
> +static void mtk_smi_larb_config_port_mt8167(struct device *dev)
>  {
> -       /* Do nothing as the iommu is always enabled. */
> +       struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> +
> +       writel(*larb->mmu, larb->base + MT8167_SMI_LARB_MMU_EN);
>  }
>
> -static const struct component_ops mtk_smi_larb_component_ops = {
> -       .bind = mtk_smi_larb_bind,
> -       .unbind = mtk_smi_larb_unbind,
> -};
> +static void mtk_smi_larb_config_port_mt8173(struct device *dev)
> +{
> +       struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>
> -static const struct mtk_smi_larb_gen mtk_smi_larb_mt8173 = {
> -       /* mt8173 do not need the port in larb */
> -       .config_port = mtk_smi_larb_config_port_mt8173,
> -};
> +       writel(*larb->mmu, larb->base + MT8173_SMI_LARB_MMU_EN);
> +}
>
> -static const struct mtk_smi_larb_gen mtk_smi_larb_mt8167 = {
> -       /* mt8167 do not need the port in larb */
> -       .config_port = mtk_smi_larb_config_port_mt8167,
> -};
> +static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
> +{
> +       struct mtk_smi_larb *larb = dev_get_drvdata(dev);
> +       u32 reg;
> +       int i;
> +
> +       if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
> +               return;
> +
> +       for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
> +               reg = readl_relaxed(larb->base + SMI_LARB_NONSEC_CON(i));
> +               reg |= F_MMU_EN;
> +               reg |= BANK_SEL(larb->bank[i]);
> +               writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
> +       }
> +}
>
>  static const struct mtk_smi_larb_gen mtk_smi_larb_mt2701 = {
>         .port_in_larb = {
> @@ -235,6 +228,16 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt6779 = {
>                 /* DUMMY | IPU0 | IPU1 | CCU | MDLA */
>  };
>
> +static const struct mtk_smi_larb_gen mtk_smi_larb_mt8167 = {
> +       /* mt8167 do not need the port in larb */
> +       .config_port = mtk_smi_larb_config_port_mt8167,
> +};
> +
> +static const struct mtk_smi_larb_gen mtk_smi_larb_mt8173 = {
> +       /* mt8173 do not need the port in larb */
> +       .config_port = mtk_smi_larb_config_port_mt8173,
> +};
> +
>  static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
>         .config_port                = mtk_smi_larb_config_port_gen2_general,
>         .larb_direct_to_common_mask = BIT(2) | BIT(3) | BIT(7),
> @@ -246,34 +249,13 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
>  };
>
>  static const struct of_device_id mtk_smi_larb_of_ids[] = {
> -       {
> -               .compatible = "mediatek,mt8167-smi-larb",
> -               .data = &mtk_smi_larb_mt8167
> -       },
> -       {
> -               .compatible = "mediatek,mt8173-smi-larb",
> -               .data = &mtk_smi_larb_mt8173
> -       },
> -       {
> -               .compatible = "mediatek,mt2701-smi-larb",
> -               .data = &mtk_smi_larb_mt2701
> -       },
> -       {
> -               .compatible = "mediatek,mt2712-smi-larb",
> -               .data = &mtk_smi_larb_mt2712
> -       },
> -       {
> -               .compatible = "mediatek,mt6779-smi-larb",
> -               .data = &mtk_smi_larb_mt6779
> -       },
> -       {
> -               .compatible = "mediatek,mt8183-smi-larb",
> -               .data = &mtk_smi_larb_mt8183
> -       },
> -       {
> -               .compatible = "mediatek,mt8192-smi-larb",
> -               .data = &mtk_smi_larb_mt8192
> -       },
> +       {.compatible = "mediatek,mt2701-smi-larb", .data = &mtk_smi_larb_mt2701},
> +       {.compatible = "mediatek,mt2712-smi-larb", .data = &mtk_smi_larb_mt2712},
> +       {.compatible = "mediatek,mt6779-smi-larb", .data = &mtk_smi_larb_mt6779},
> +       {.compatible = "mediatek,mt8167-smi-larb", .data = &mtk_smi_larb_mt8167},
> +       {.compatible = "mediatek,mt8173-smi-larb", .data = &mtk_smi_larb_mt8173},
> +       {.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
> +       {.compatible = "mediatek,mt8192-smi-larb", .data = &mtk_smi_larb_mt8192},
>         {}
>  };
>
> @@ -428,34 +410,13 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
>  };
>
>  static const struct of_device_id mtk_smi_common_of_ids[] = {
> -       {
> -               .compatible = "mediatek,mt8173-smi-common",
> -               .data = &mtk_smi_common_gen2,
> -       },
> -       {
> -               .compatible = "mediatek,mt8167-smi-common",
> -               .data = &mtk_smi_common_gen2,
> -       },
> -       {
> -               .compatible = "mediatek,mt2701-smi-common",
> -               .data = &mtk_smi_common_gen1,
> -       },
> -       {
> -               .compatible = "mediatek,mt2712-smi-common",
> -               .data = &mtk_smi_common_gen2,
> -       },
> -       {
> -               .compatible = "mediatek,mt6779-smi-common",
> -               .data = &mtk_smi_common_mt6779,
> -       },
> -       {
> -               .compatible = "mediatek,mt8183-smi-common",
> -               .data = &mtk_smi_common_mt8183,
> -       },
> -       {
> -               .compatible = "mediatek,mt8192-smi-common",
> -               .data = &mtk_smi_common_mt8192,
> -       },
> +       {.compatible = "mediatek,mt2701-smi-common", .data = &mtk_smi_common_gen1},
> +       {.compatible = "mediatek,mt2712-smi-common", .data = &mtk_smi_common_gen2},
> +       {.compatible = "mediatek,mt6779-smi-common", .data = &mtk_smi_common_mt6779},
> +       {.compatible = "mediatek,mt8167-smi-common", .data = &mtk_smi_common_gen2},
> +       {.compatible = "mediatek,mt8173-smi-common", .data = &mtk_smi_common_gen2},
> +       {.compatible = "mediatek,mt8183-smi-common", .data = &mtk_smi_common_mt8183},
> +       {.compatible = "mediatek,mt8192-smi-common", .data = &mtk_smi_common_mt8192},
>         {}
>  };
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
