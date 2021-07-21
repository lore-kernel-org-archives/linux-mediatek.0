Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626C1C636C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 11:45:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DBF1610F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 11:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DBF1610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Wge+BRjFwv4V8fT7WeAOMz1lN7q0u39noIKj7B6xDE=; b=XiVB5yiYinV7vN
	8bnFIKh11PMW6fD/NSvSxW2B/BwkbFMKq627wKPslNhvmIQzu0k3Px8xW8gUrx79yiJFmvai6w22G
	ypdHU3KbRSRgk56XKs1Ldb8ykCimHuLMGD5EtcCnmgbGEoq0OLywaNieh0LytFMZEVUBsHR/mIxJH
	AzjYUDy6hxTqPO8s28+gsCcwoVDx8Fl9h1dgZHBc8pzomCoJmKSY6yKSqSEyGNq8M87DWdfVPRbzp
	Vs0O5tGdB9oqhzQM8QEe0i2k4hFVClXgT9wR6fxpiSC+4C38t1OLNknKmGuZjKB76QepJ3Shqbe3d
	aqMU3E8JIFwM/6jsO3Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Aeq-00FUiA-FA; Wed, 21 Jul 2021 11:45:00 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6AeQ-00FUZD-M3
 for linux-mediatek@lists.infradead.org; Wed, 21 Jul 2021 11:44:36 +0000
Received: by mail-pg1-x52e.google.com with SMTP id i16so1596022pgi.9
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Jul 2021 04:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1e5owWDxMUbIBJfKFii6zS+/7R0v2+enWtZrIJ8w5gE=;
 b=oOMBLoLdDZUmJwKPMItYIv30/3dAnF/IjyteNCMVTgAl7Vs00+i0xC49Mg4KcYCRQH
 XDCA6ws6TiC9cYmziRd03GZESG5nW9Bi3IhSWJlzkL5ZjyknmAtZS/ryG5jgI5P56sJ0
 IAFknBfWisrvP3CVkp8BV9frTdmNt/tX2auDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1e5owWDxMUbIBJfKFii6zS+/7R0v2+enWtZrIJ8w5gE=;
 b=JCAiLDB7St8MbCnL45A68c1/Ov1FSpLPEdkGM6XyqoU+xSAYeihWmAKKqrlWgZNJ2X
 FP19zu50+8cT8TEhhjV3M+owut9tjbR8RYkOBzNgU3EzbkETEls6FP5llKmwou56Z2PA
 23wLuyleOMZPU88d359tgR34SMEwJTw7rgNpx5wurO6jeJloMvo61YZA2NHgekyFq+ge
 CCycRIeXuB4agZ+72KZKIqy/Qs6fJ+fz8VCfP63y2gAifEW9w7kd4948Tf5nhnmDl1Ep
 r4QFfcSkeaKW3UlIdkPL3l1ePWHlD+UaEkI4ZHSc36zFta+HM1BxLKmD8YQAAVNopdvu
 NLoQ==
X-Gm-Message-State: AOAM533tXy6LYld7Dot2bEebMycupy8uNAYpWC6k5JXxN+hYPIann7Ka
 RvHpxEN4AB2uvar+oJ7DPR9nNn6G542K4IY1YnIHaA==
X-Google-Smtp-Source: ABdhPJzDuuXuFsg+sEvfAF7SzXJ4MRUYLPDA9Vj5ACSar4H9upnFwBC/H+/Y7qoK7WoFI+0/zLdVgr5TPKu1KmiiWMI=
X-Received: by 2002:a63:3601:: with SMTP id d1mr6530858pga.299.1626867873570; 
 Wed, 21 Jul 2021 04:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-9-yong.wu@mediatek.com>
In-Reply-To: <20210715121209.31024-9-yong.wu@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 21 Jul 2021 19:44:22 +0800
Message-ID: <CAATdQgAnj2B=js44O8LQ6ALqEr9r_UhiwMnLX+wqxJkQ5Lw=Ew@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] memory: mtk-smi: Use
 devm_platform_ioremap_resource
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
X-CRM114-CacheID: sfid-20210721_044434_822706_98703AB0 
X-CRM114-Status: GOOD (  19.81  )
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

On Thu, Jul 15, 2021 at 8:24 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> No functional change. Simplify probing code.
>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/memory/mtk-smi.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index ee49bb50f5f5..e5a34b3952a0 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -317,7 +317,6 @@ static int mtk_smi_dts_clk_init(struct device *dev, struct mtk_smi *smi,
>  static int mtk_smi_larb_probe(struct platform_device *pdev)
>  {
>         struct mtk_smi_larb *larb;
> -       struct resource *res;
>         struct device *dev = &pdev->dev;
>         int ret;
>
> @@ -326,8 +325,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         larb->larb_gen = of_device_get_match_data(dev);
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       larb->base = devm_ioremap_resource(dev, res);
> +       larb->base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(larb->base))
>                 return PTR_ERR(larb->base);
>
> @@ -447,7 +445,6 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         struct mtk_smi *common;
> -       struct resource *res;
>         int ret;
>
>         common = devm_kzalloc(dev, sizeof(*common), GFP_KERNEL);
> @@ -468,8 +465,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
>          * base.
>          */
>         if (common->plat->type == MTK_SMI_GEN1) {
> -               res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -               common->smi_ao_base = devm_ioremap_resource(dev, res);
> +               common->smi_ao_base = devm_platform_ioremap_resource(pdev, 0);
>                 if (IS_ERR(common->smi_ao_base))
>                         return PTR_ERR(common->smi_ao_base);
>
> @@ -481,8 +477,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
>                 if (ret)
>                         return ret;
>         } else {
> -               res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -               common->base = devm_ioremap_resource(dev, res);
> +               common->base = devm_platform_ioremap_resource(pdev, 0);
>                 if (IS_ERR(common->base))
>                         return PTR_ERR(common->base);
>         }
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
