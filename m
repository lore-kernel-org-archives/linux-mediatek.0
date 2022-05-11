Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14521C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xttod5cavTlasQdTIrp3WDjYlxDwyQ5WpGub7OkQrAQ=; b=OoER3PGEqERqFE
	VzmlQBLBNJp+HTo7S27vLb1WOl/wkxZrrC1MLY9S3QG0gOcCckGUDbOI3SGyQnTuw2euUjsj/wAz9
	157elDRpJZvbpRH3/PHuluGXauOL4/Jk1kyfh838jjlvqLga2G00hktFrig10AUy2NiIyK9k2MXxH
	tYSzS+HrE7ndI42zmzKDDCeSLIMFCbs38VjxbplMoiuANNmyJT0GPbmDNWNYNasb0ywD8VuE2QBQQ
	XBiFM1u4ZaPIRk/L1r/phJhHoqmWsoCsKZbPoQTrzxq03aj3gkjKxVSP82fJ1ndR53IQuNMDDAu5y
	K7it8vDbCAmE1NCJi7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nooD9-007YGE-Ph; Wed, 11 May 2022 15:25:11 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nooCt-007Y4p-Os
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 15:24:57 +0000
Received: by mail-ej1-x634.google.com with SMTP id bv19so4783012ejb.6
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 08:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=seaHCom44uiTs26SOVTHmO+d30N+urihbVnoa7jcBHU=;
 b=TAsFxKUwFUu/cfHGMVs7euuOOaHKgnj7ofjrXFjp8r9Snf7wiMSBmToMDbll08c4wB
 B4LGXeld//Q6hfxFtxBMvALlOyKkBrwRlXmA5HUoGvnBrbQ8Z0lf5TiNGHuyMrP5BR63
 n6ueMhr6dz49B7BTy3DGmj6ZgllDGug3NlmCJzP7cNvRG6GoVu5qS4C3KtiUZlgXFufh
 GrpfbUWWpQRQYDaaK9aKLJGsmkgEdTsj7LCUFYY8sOi2gz+5yjJCzJ/Cm21z7B6ydRD5
 Eb6frZ5RtEav3mlIuE5peSrbI9eRPdVtxJETEJRXmlpTKjxCb0r6y2Qp7SoSZumEhuWj
 rDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=seaHCom44uiTs26SOVTHmO+d30N+urihbVnoa7jcBHU=;
 b=eLGFqA66qKorpfpPCsnxbu/bihYm3m+tEqf4MN/XhjSz9jcCw8c9rg+20ZFjT8SwGn
 dObzgBFLdTqOkawcgw9Rq9C/mKMWAo5MI+IHXOcgamMB/zlysIB+9TxNmOds2JDbZQtT
 HTDiVqpTfCpFxfKmWrqAwhhJWXLDpupwxO8LpSKj/gAhs2gVwlbGvlfl3/82nu2V5x52
 TA4LSGwApcYiZomz3dSNFHuRWQmJTFLTInrc5GXEasqFNRo3L2FNLjpD49hDngwr3Umm
 S9XJjf5xrVBN/+V5rTlwzMasqiZ0wdFeEZWR9jnDVZ0fsG289OSZjgwMi8ErKqHrFQpV
 /xnA==
X-Gm-Message-State: AOAM533NRLraL/sRf0oDRIEBz8aH0K9AeIWmm4tW1HNTgbrDfZMDggNo
 +gu264m2pACVWeyoutgikMSt9++T6X+GEVedKyh0SA==
X-Google-Smtp-Source: ABdhPJw5lbZ3f5D9UUxJJpVm5HxR51LIMMyK1ge48NZ+6rLvEM9+7xdSTx82HwOKw4EXjm+P/qHF+QOQPr1ZncyweS8=
X-Received: by 2002:a17:907:162a:b0:6f4:c53b:fca7 with SMTP id
 hb42-20020a170907162a00b006f4c53bfca7mr25795243ejc.723.1652282690650; Wed, 11
 May 2022 08:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220511064920.18455-1-yong.wu@mediatek.com>
 <20220511064920.18455-2-yong.wu@mediatek.com>
In-Reply-To: <20220511064920.18455-2-yong.wu@mediatek.com>
From: Guenter Roeck <groeck@google.com>
Date: Wed, 11 May 2022 08:24:39 -0700
Message-ID: <CABXOdTcA1ERGTCMVDhz+cah6GwC3hsNR9W3PYyYZN6uGE5_Rsg@mail.gmail.com>
Subject: Re: [PATCH 1/4] iommu/mediatek: Use dev_err_probe to mute probe_defer
 err log
To: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, iommu@lists.linux-foundation.org, 
 linux-mediatek@lists.infradead.org, 
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, 
 yf.wang@mediatek.com, libo.kang@mediatek.com, chengci.xu@mediatek.com, 
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com, 
 Guenter Roeck <groeck@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_082455_838216_9C3CD34E 
X-CRM114-Status: GOOD (  17.15  )
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

On Tue, May 10, 2022 at 11:49 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> Mute the probe defer log:
>
> [    2.654806] mtk-iommu 14018000.iommu: mm dts parse fail(-517).
> [    2.656168] mtk-iommu 1c01f000.iommu: mm dts parse fail(-517).
>
> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
> The Fixes tag commit-id is from linux-next.
> ---
>  drivers/iommu/mtk_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 71b2ace74cd6..0f6ec4a4d9d4 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1198,7 +1198,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>         if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
>                 ret = mtk_iommu_mm_dts_parse(dev, &match, data);
>                 if (ret) {
> -                       dev_err(dev, "mm dts parse fail(%d).", ret);
> +                       dev_err_probe(dev, ret, "mm dts parse fail.");
>                         goto out_runtime_disable;
>                 }
>         } else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
