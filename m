Return-Path: <SRS0=UOtS=CP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C06C43461
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 15:22:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 221AF2075A
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 15:22:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PRYyltFb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hyT1PpOw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 221AF2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/kfg1MCuP99/BL9GwybuAKeiOpHyNqEo+VTBl6nabq0=; b=PRYyltFb0hO/MKb+ErGvfPVW6
	VnzlYGreCYo92dPEfo8jq80+/YcpDP7uH99zkr3TEvn6arPepHI4ZMg6LRmWbZgbCfu4KiDtTE1S9
	olvx3WxXVS9WFWrVwyvibm6pzin3kK8Ffe5aymaRhQl1nlxhIdMIqmVX7DXiOBCwt47y+hsZraS6e
	hXezlR5MNyn6wX/Z1+fMAzYt3jzhBRu3gM3vIC9bhONuOPM0uqFljV6sFzBIUMn4Nc1gWNTsWg0Vy
	FvEOKeWSIbCX8W6j2suI0pg1ZfnxaQ0mF/4eYMulpVqUeTLtygWU9l/Jhk1s6gYTvSfMwFKs/l/RQ
	/TyMiOyHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEwUx-00055A-OV; Sun, 06 Sep 2020 15:22:31 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEwUu-00053q-S3
 for linux-mediatek@lists.infradead.org; Sun, 06 Sep 2020 15:22:29 +0000
Received: by mail-il1-x142.google.com with SMTP id m1so10397569ilj.10
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Sep 2020 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JwN/BVu2qRKl2g6ZpjOhiQKz73AB4SfyAtuVoOPIeRA=;
 b=hyT1PpOwkbC8e2AEOu/g9Z60NoTSWolqKqKILsHgaokzrv9DdzWF0iGZC3eIzCBK6D
 mjAV6ZT2C9Vxh1Ly7plpKR9in9PGAr0OEPu+GfdJwmNnPeW0Dd3/ZQzAc66HYh71aN5C
 VMfFGFfcDlIVIrRL1ePqttKFQ8qYgoqpHy8PXzMGR/gYqjK1Qpv8zkGw2kUyK/2HoiD2
 VwYvqKKAGM0Zf21f+GjMTO1todjKALyPIATfQQRalp63mcX01/Jwa3v1QyCeUgemW6VI
 XKlHKjJMx4dpYPWcKV5ts7aO03e7y9HLhoDz5h9FvJKcMQt7mUFEElQYlObrgEwpsp4N
 gXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JwN/BVu2qRKl2g6ZpjOhiQKz73AB4SfyAtuVoOPIeRA=;
 b=Wl9HRejgZmzipWUIrTyqXAKOAK5wn3plz6IFmnRAKgi46q5s7vpUup1hLVlkgIz/qg
 qxLS+RLpUx0Y5VEJCQEjaQnS1N1d/HYPzVRhoVle2CbB5rJ7ysG8x+CvMpnnDz5mwiB1
 snYUWEE7ZSoM9qxCjZZQ2VGH+wukJJutZzand8iach8NrTwfVll16DOkZUMXe0NSl9bC
 o9y+5rMW08SN27vtKIEXessl2X4cVxw+3dbTqqveK5yf3Z8JSrzUswuZOv8vyMtkV+Ig
 MOmlzqYU98eY+uDsVay/P/G7HuDtOV3udg4/lDzwDhrwiuM7n35NWiliypXgGCQ37Y6r
 cIng==
X-Gm-Message-State: AOAM533MOfrKaC4GCCpGCAIYYmkhmRNGvTXMcH2IwRCN/ZnwCq6lx0/O
 Zn/927XBUJUzOIbQDpOFRrVZVE1Y6iyuTgCnmwJyTQ==
X-Google-Smtp-Source: ABdhPJzKi00xRmsMGDFQSGHtnb/nykiYPK9LVtj52+aSMZYX3f63ZtwA74l54mZTa9IRhJphwOhsRh/ztDf7FIB2f5s=
X-Received: by 2002:a92:d8c2:: with SMTP id l2mr16266090ilo.301.1599405746941; 
 Sun, 06 Sep 2020 08:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200906151928.881209-1-fparent@baylibre.com>
 <20200906151928.881209-3-fparent@baylibre.com>
In-Reply-To: <20200906151928.881209-3-fparent@baylibre.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Sun, 6 Sep 2020 17:22:16 +0200
Message-ID: <CAOwMV_xzeTXjvay32av9buJeJzSewnOGVWNdte8r-awiQr148g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] iommu/mediatek: add support for MT8167
To: iommu@lists.linux-foundation.org, DTML <devicetree@vger.kernel.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_112228_924274_7F129CAB 
X-CRM114-Status: GOOD (  19.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, joro@8bytes.org,
 Rob Herring <robh+dt@kernel.org>, yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Sep 6, 2020 at 5:19 PM Fabien Parent <fparent@baylibre.com> wrote:
>
> Add support for the IOMMU on MT8167
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>
> V3:
>         * use LEGACY_IVRP_PADDR flag instead of using a platform data member

Forgot to mention a change here: .larbid_remap has been fixed to only
contain the number of larb present on MT8167

> V2:
>         * removed if based on m4u_plat, and using instead the new
>           has_legacy_ivrp_paddr member that was introduced in patch 2.
>
> ---
>  drivers/iommu/mtk_iommu.c | 8 ++++++++
>  drivers/iommu/mtk_iommu.h | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index b1f85a7e9346..6079f6a23c74 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -817,6 +817,13 @@ static const struct mtk_iommu_plat_data mt6779_data = {
>         .larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
>  };
>
> +static const struct mtk_iommu_plat_data mt8167_data = {
> +       .m4u_plat     = M4U_MT8167,
> +       .flags        = HAS_4GB_MODE | RESET_AXI | HAS_LEGACY_IVRP_PADDR,
> +       .inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
> +       .larbid_remap = {{0}, {1}, {2}}, /* Linear mapping. */
> +};
> +
>  static const struct mtk_iommu_plat_data mt8173_data = {
>         .m4u_plat     = M4U_MT8173,
>         .flags        = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
> @@ -835,6 +842,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
>  static const struct of_device_id mtk_iommu_of_ids[] = {
>         { .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
>         { .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
> +       { .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
>         { .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
>         { .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
>         {}
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index 122925dbe547..df32b3e3408b 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -39,6 +39,7 @@ enum mtk_iommu_plat {
>         M4U_MT2701,
>         M4U_MT2712,
>         M4U_MT6779,
> +       M4U_MT8167,
>         M4U_MT8173,
>         M4U_MT8183,
>  };
> --
> 2.28.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
