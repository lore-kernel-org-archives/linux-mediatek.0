Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D54C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 10:44:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 763A961009
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 10:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 763A961009
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2EqO/2cWKjuZ/VQY2MLZyf/dIY/p8KrRC3plIxqA1B4=; b=RJGfvZxGFyqc5I
	BshUpjZfYJILpvooym5uhL/KujX0PgGCW9zEJpWeCEii7jeTryop+//ZdDZzaV9ly5Sn4V6ENZ5QK
	zQRjuPVO02T3Y5BFwoWl8a/lHNhuCrXL7y6VVuzycgvMSSOPDsSL7VseDl/Hf9RODZHI/xZQEVFI0
	ivo8sM9uSK/8oHwR5bri4z+8+trtncs46aZ24hpDIILPO9VWcBaCP/sONUOjUtkNHrclm5rn03FjG
	jEUZD9ZVIWGL9lf6TJTD3tJdu2EIfm0VSR2mtpYA+lR2TYTJGashZ8dj/2nu7mWzOxIBYvaTur0vt
	Fip0jhYI/l9x0/ILyW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m69iR-00FH90-3d; Wed, 21 Jul 2021 10:44:39 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m69iD-00FH5D-Hl
 for linux-mediatek@lists.infradead.org; Wed, 21 Jul 2021 10:44:27 +0000
Received: by mail-pf1-x429.google.com with SMTP id i14so1918852pfd.5
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Jul 2021 03:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GXWcsJDXb1A/72l7a2R8Yfuydt9sw0KVY6gwcccRtzw=;
 b=HwJuai+igbPwD/LYxLesQ/+WpH5n2+B+lybbPQ2LEXAm0JuXXBDvz2QkL3Zi60jNPF
 Iz1WTkpHaPPD4gDA1DzM8+gosf00VczPuJVTpssHvQCa486ckwFxLNuyv1D4ngSEZWVv
 QIidHytZ+Q2tnIPpURlojfRB2zmtoJdrBau4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GXWcsJDXb1A/72l7a2R8Yfuydt9sw0KVY6gwcccRtzw=;
 b=sfNd02h/5WPqTYFhvCvA1MBfzixthENI6FW5i0sbRf0nBoOXARNmRqpNDIYjlrwIiy
 9m9WWl+OcH68u6UHQ0wWQtP/0VwiXyrdalMp3+SqFtIFBNbqzgfZIiOsCUEcOkmvAn1o
 +X67bxX0WVQY7WXeFAgIt8y4AlKB4zEYdE54oglRx/bdQ8B30xcwlj9zGcBJm2mQYycs
 aWO+ij8D3uK0WS8CqOk+Bk7lw8sOphQuAQfMd8LprGUVEFYH664z8G2cd3yaou+uw6b9
 ecFgz3Da605mHE8vDHPTGp/l4ac832UjGOAOz96GW48CGB/SZySlqgYGuC1NA31rFqJ1
 J93A==
X-Gm-Message-State: AOAM531EKFfywAXq1wKzis1dl3QUOr9ZExxaosmT2R+0oZy23x4HXLC+
 v7TU5Bll7KUmBNxRCPObqpxEcAwtFwsOxsu7+rCJDQ==
X-Google-Smtp-Source: ABdhPJyqyEkC7KsAlOheOaxaV+RUgvQXOkoIrX81SdGZGtmk+ga72QNgvkh/B2ekHAnq9tVQ9sgHLy2LM1SGELsGw6s=
X-Received: by 2002:a63:8f04:: with SMTP id n4mr34564903pgd.317.1626864264477; 
 Wed, 21 Jul 2021 03:44:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-5-yong.wu@mediatek.com>
In-Reply-To: <20210715121209.31024-5-yong.wu@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 21 Jul 2021 18:44:13 +0800
Message-ID: <CAATdQgB9eKCBvxV8R8jgkAa8Hqdbu4=nc9frMA024PvMnWWTaw@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] memory: mtk-smi: Rename smi_gen to smi_type
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
X-CRM114-CacheID: sfid-20210721_034425_647064_A1CE7796 
X-CRM114-Status: GOOD (  26.39  )
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

On Thu, Jul 15, 2021 at 8:14 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> Prepare for adding smi sub common. Only rename from smi_gen to smi_type.
> No functional change.
>
> About the current "smi_gen", we have gen1/gen2 that stand for the
> generation number for HW. I plan to add a new type(sub_common), then the
> name "gen" is not prober.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/memory/mtk-smi.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index a2213452059d..ff07b14bcd66 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -55,7 +55,7 @@
>  /* All are MMU0 defaultly. Only specialize mmu1 here. */
>  #define F_MMU1_LARB(larbid)            (0x1 << SMI_BUS_LARB_SHIFT(larbid))
>
> -enum mtk_smi_gen {
> +enum mtk_smi_type {
>         MTK_SMI_GEN1,
>         MTK_SMI_GEN2
>  };
> @@ -68,8 +68,8 @@ static const char * const mtk_smi_common_clks_optional[] = {"gals0", "gals1"};
>  static const char * const mtk_smi_larb_clks_optional[] = {"gals"};
>
>  struct mtk_smi_common_plat {
> -       enum mtk_smi_gen gen;
> -       u32              bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
> +       enum mtk_smi_type       type;
> +       u32                     bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
>  };
>
>  struct mtk_smi_larb_gen {
> @@ -402,27 +402,27 @@ static struct platform_driver mtk_smi_larb_driver = {
>  };
>
>  static const struct mtk_smi_common_plat mtk_smi_common_gen1 = {
> -       .gen = MTK_SMI_GEN1,
> +       .type     = MTK_SMI_GEN1,
>  };
>
>  static const struct mtk_smi_common_plat mtk_smi_common_gen2 = {
> -       .gen = MTK_SMI_GEN2,
> +       .type     = MTK_SMI_GEN2,
>  };
>
>  static const struct mtk_smi_common_plat mtk_smi_common_mt6779 = {
> -       .gen            = MTK_SMI_GEN2,
> -       .bus_sel        = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(4) |
> -                         F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
> +       .type     = MTK_SMI_GEN2,
> +       .bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(4) |
> +                   F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
>  };
>
>  static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
> -       .gen      = MTK_SMI_GEN2,
> +       .type     = MTK_SMI_GEN2,
>         .bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(5) |
>                     F_MMU1_LARB(7),
>  };
>
>  static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
> -       .gen      = MTK_SMI_GEN2,
> +       .type     = MTK_SMI_GEN2,
>         .bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(5) |
>                     F_MMU1_LARB(6),
>  };
> @@ -483,7 +483,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
>          * clock into emi clock domain, but for mtk smi gen2, there's no smi ao
>          * base.
>          */
> -       if (common->plat->gen == MTK_SMI_GEN1) {
> +       if (common->plat->type == MTK_SMI_GEN1) {
>                 res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>                 common->smi_ao_base = devm_ioremap_resource(dev, res);
>                 if (IS_ERR(common->smi_ao_base))
> @@ -523,7 +523,7 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
>         if (ret)
>                 return ret;
>
> -       if (common->plat->gen == MTK_SMI_GEN2 && bus_sel)
> +       if (common->plat->type == MTK_SMI_GEN2 && bus_sel)
>                 writel(bus_sel, common->base + SMI_BUS_SEL);
>         return 0;
>  }
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
