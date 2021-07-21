Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EC9C636C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 12:54:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB0AA6120C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 12:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB0AA6120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FracqoI7ygKpGdv99pzhuIqoHWejFo0oHhqzqDOAMNY=; b=1L576998BAEDTN
	0D2J422LtMcnC031k/q2vHvyPoB8MqNeJ3cv2tvQ+r9YuBGvdFBCwCiDF6tNMcZAFAa/BhnxGkBf9
	6WNkOJDCAHqunGp8gFVAsfthvKb+2ffshNlV2ppRtF5Nasc024t0vMTt/ir+HDJ2jhSWQG93qaaOw
	XAaq4Qw//XMFtGXaEYn7iWXfnGwNYgz3zpVD8OvrjP5o65Df9rrmy3ytnfrhnkokEIfqHwdcpeJRo
	MzyUXSXCSaBLhQBQKS42LymB3khxCa+ID2RBT+bDLEEdVHAbONI29i2A3i4WjuGW55gynC+AIe5sF
	bIas3DFBCIJ3td+177rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Bk4-00FgHY-4Q; Wed, 21 Jul 2021 12:54:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Bjo-00FgEZ-IM
 for linux-mediatek@lists.infradead.org; Wed, 21 Jul 2021 12:54:14 +0000
Received: by mail-pl1-x62f.google.com with SMTP id e14so897249plh.8
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Jul 2021 05:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iP4NUt/V0t1FXR1pars3ssyFHqsgxDoI/nyz3Is/Xqk=;
 b=gRk9/ILWwpLwl4zdj87BtAXrrYFGzkeVH6ObYfiKFfNQFmCyQIL6FYk80hsfm3asvB
 uGHNMJG+I/w9nTSOu1Yc/BAJFqRn1GkWPWM4/O1D8l2XKi6HSqHgNZzU3FokU5Idm1Tr
 ujF3MsuBvEb42eOWep8HcPBgTmsXD5KOQBb3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iP4NUt/V0t1FXR1pars3ssyFHqsgxDoI/nyz3Is/Xqk=;
 b=TF5AxtPO2i4HeWxOXIpzxvmasSzjZXQn/Qe6qFe8Tj5mbtvuiRrWbzXCGv6vhVSVZk
 X1dnQGd5Ax4ufQhYQSMY5ab1G2H6X8vECUlNIWkcbAAFjTEQuIGCwn+029wstbYOAFuh
 n+KLqjDhfHIs4ll44p1WZBtbP6xfv8b/Yquj7flsFAwvhZScZ6dMKFBjRjU1Sqxhejvr
 negOsGneDYL4kkezg59e+S7zPfn53yBxX1T08XibETUNLVteu95te+KFEt1peI0+w8E2
 XSKSFh6lEN70hmy5AQzCd4tyP9oHiZhV4HDfe4uybVXxjk2RZKOEjR401d4cuZuvark1
 xRsg==
X-Gm-Message-State: AOAM5323R1EZggBpRkNiGYyOBRhN/ndzL+c9FpwLQDSUdOTPak2pfTMs
 UK+QPmKjkw36dPtwz8xZdElcuipo26eJ49CucSbVkg==
X-Google-Smtp-Source: ABdhPJxsmHAT2BjdepvDkN94Ybs5nzq1uHhKtiM33GLd1tM4ZQBT6B0+xAjq7jQtTwOBEoILmIvJdMTSXTVC8Sch6dI=
X-Received: by 2002:a17:902:8c83:b029:129:17e5:a1cc with SMTP id
 t3-20020a1709028c83b029012917e5a1ccmr27602827plo.49.1626872051386; Wed, 21
 Jul 2021 05:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-11-yong.wu@mediatek.com>
In-Reply-To: <20210715121209.31024-11-yong.wu@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 21 Jul 2021 20:54:00 +0800
Message-ID: <CAATdQgDOGW7nudDoR5UPbax+d3e9omhPstrNd_FCPLd+96ZC9w@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] memory: mtk-smi: mt8195: Add initial setting for
 smi-common
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
X-CRM114-CacheID: sfid-20210721_055412_675245_BF4CFEB4 
X-CRM114-Status: GOOD (  30.32  )
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

On Thu, Jul 15, 2021 at 8:25 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> To improve the performance, add initial setting for smi-common.
> some register use some fix setting(suggested from DE).
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 42 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 3c288716a378..c52bf02458ff 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -18,11 +18,19 @@
>  #include <dt-bindings/memory/mtk-memory-port.h>
>
>  /* SMI COMMON */
> +#define SMI_L1LEN                      0x100
> +
>  #define SMI_BUS_SEL                    0x220
>  #define SMI_BUS_LARB_SHIFT(larbid)     ((larbid) << 1)
>  /* All are MMU0 defaultly. Only specialize mmu1 here. */
>  #define F_MMU1_LARB(larbid)            (0x1 << SMI_BUS_LARB_SHIFT(larbid))
>
> +#define SMI_M4U_TH                     0x234
> +#define SMI_FIFO_TH1                   0x238
> +#define SMI_FIFO_TH2                   0x23c
> +#define SMI_DCM                                0x300
> +#define SMI_DUMMY                      0x444
> +
>  /* SMI LARB */
>
>  /* Below are about mmu enable registers, they are different in SoCs */
> @@ -58,6 +66,13 @@
>         (_id << 8 | _id << 10 | _id << 12 | _id << 14); \
>  })
>
> +#define SMI_COMMON_INIT_REGS_NR                6
> +
> +struct mtk_smi_reg_pair {
> +       unsigned int            offset;
> +       u32                     value;
> +};
> +
>  enum mtk_smi_type {
>         MTK_SMI_GEN1,
>         MTK_SMI_GEN2,           /* gen2 smi common */
> @@ -74,6 +89,8 @@ static const char * const mtk_smi_larb_clks_optional[] = {"gals"};
>  struct mtk_smi_common_plat {
>         enum mtk_smi_type       type;
>         u32                     bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
> +
> +       const struct mtk_smi_reg_pair   *init;
>  };
>
>  struct mtk_smi_larb_gen {
> @@ -409,6 +426,15 @@ static struct platform_driver mtk_smi_larb_driver = {
>         }
>  };
>
> +static const struct mtk_smi_reg_pair mtk_smi_common_mt8195_init[SMI_COMMON_INIT_REGS_NR] = {
> +       {SMI_L1LEN, 0xb},
> +       {SMI_M4U_TH, 0xe100e10},
> +       {SMI_FIFO_TH1, 0x506090a},
> +       {SMI_FIFO_TH2, 0x506090a},
> +       {SMI_DCM, 0x4f1},
> +       {SMI_DUMMY, 0x1},
> +};
> +
>  static const struct mtk_smi_common_plat mtk_smi_common_gen1 = {
>         .type     = MTK_SMI_GEN1,
>  };
> @@ -439,11 +465,13 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vdo = {
>         .type     = MTK_SMI_GEN2,
>         .bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(3) | F_MMU1_LARB(5) |
>                     F_MMU1_LARB(7),
> +       .init     = mtk_smi_common_mt8195_init,
>  };
>
>  static const struct mtk_smi_common_plat mtk_smi_common_mt8195_vpp = {
>         .type     = MTK_SMI_GEN2,
>         .bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(7),
> +       .init     = mtk_smi_common_mt8195_init,
>  };
>
>  static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8195 = {
> @@ -530,15 +558,21 @@ static int mtk_smi_common_remove(struct platform_device *pdev)
>  static int __maybe_unused mtk_smi_common_resume(struct device *dev)
>  {
>         struct mtk_smi *common = dev_get_drvdata(dev);
> -       u32 bus_sel = common->plat->bus_sel;
> -       int ret;
> +       const struct mtk_smi_reg_pair *init = common->plat->init;
> +       u32 bus_sel = common->plat->bus_sel; /* default is 0 */
> +       int ret, i;
>
>         ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
>         if (ret)
>                 return ret;
>
> -       if (common->plat->type == MTK_SMI_GEN2 && bus_sel)
> -               writel(bus_sel, common->base + SMI_BUS_SEL);
> +       if (common->plat->type != MTK_SMI_GEN2)
> +               return 0;
> +
> +       for (i = 0; i < SMI_COMMON_INIT_REGS_NR && init && init[i].offset; i++)
> +               writel_relaxed(init[i].value, common->base + init[i].offset);

I'm not sure this array for register settings could be applied to other
platforms in future or only applied to mt8195. If it's only for mt8195,
I think taking callback function instead of mtk_smi_reg_pair[] as init member
would be better:

if (common->plat->init)
    common->plat->init(...);

> +
> +       writel(bus_sel, common->base + SMI_BUS_SEL);
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
