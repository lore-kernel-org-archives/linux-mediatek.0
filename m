Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B778EC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:32:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5275920C56
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5275920C56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wp5Um5y/vD9eC/z3JupA/kroxL1e4kIsZO2k7Z7N9pM=; b=0ihqXAfZpv5G5vnToAiaQM9tJ
	YJ4ssEQ92eQocthwGq7TWQlpXTUmwNFkVZA/MIN+8Jvu4fVSUMZiW8Jn+MRrDU3QTW90+JdMvLNmu
	gvtp5Fwved8l2+0J5AWuPSfpFNYBq1APVzrsdqK26FKvZYORucLtYEyb0t8HPW74+SeTMeJbMiwer
	LwZgDB0hp7Bw5xNpUdEpHhmesNw5WKn6+rgHdD5IItTN/9QuPmSBqRcDJB8RlYE91YEpYgQldnHgK
	OGNvIVoiEzNd6sWoGMoUsR2psuqyQ+S969HyEtDL0rVXYMexZoIY4/PB8krHYsg0G2ue9Rl1hlqkz
	PDYWqXS/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzZD-0004yV-HP; Wed, 23 Dec 2020 08:32:19 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzZA-0004x7-NA
 for linux-mediatek@lists.infradead.org; Wed, 23 Dec 2020 08:32:17 +0000
Received: by mail-pg1-x531.google.com with SMTP id z21so10174762pgj.4
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Dec 2020 00:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f6z2jHWOUsdwvkW1sMAfQ+uPvAPsBSWtcQYM5UeGKOQ=;
 b=R1Dtuprupk5qqiUMugbruG8tuTkprsynKgHI6FENUZDJPwteKI/RPbhP1u7CXwuf4u
 L2eZUc5xoe1egZtRKXhxLNCysC2nfWPgQ798UT68SUdKJM28lGqsh3znYrwyyn9m3a/x
 4vpCIEXdsq/TxF/e/vNFR3MLDzRxVnPS19Kls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f6z2jHWOUsdwvkW1sMAfQ+uPvAPsBSWtcQYM5UeGKOQ=;
 b=S3GL6aIvyINBFX+rL/XoEuSbwv6vqQmFaOvjTorEfUA8aCgc06+kYcQEtu0AuBR7W4
 7G3Tvfp2TTuhKLc8LRRfW0ypbDsA1UEJOFr6t5gj5EtMc9NBQKrZt2GDstX47I1t9nEP
 DaT7WO427HLCFKdjEhZzjFVfgsHo/CRpDPQ6zHI+5X+ES7Bjb5wF11TVr25ob1vkssir
 MEcoti8nSfeEC/iXZTbGfn5riBVrQinA3L+URFVhH5nSL/bWtgfSXamRNDokYlTUaTY9
 4LZST1fsI8/rFt5GGLCUIqGdMLXPUKnHBWQA3JXDqrqsIZpbwGUvgqDZYiR1TxWXzuld
 NFUQ==
X-Gm-Message-State: AOAM5327K2UTMi5AJFcH1NLU7gE31xrQ+iUb0vwcPb0FBtJYhrJKxVCY
 P4K/KS38T6DCIWd/LIMu+0nLDw==
X-Google-Smtp-Source: ABdhPJxRY0t2ecrt0qdbX6wNZyK5FMit7yNVCixLg3SFVanvhZuz5z5iGFCyfF9mG3ZV++F089pKQw==
X-Received: by 2002:a62:9208:0:b029:19e:a15f:169e with SMTP id
 o8-20020a6292080000b029019ea15f169emr23179186pfd.71.1608712334434; 
 Wed, 23 Dec 2020 00:32:14 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:2:a28c:fdff:fef0:43bf])
 by smtp.gmail.com with ESMTPSA id p187sm21556047pfp.60.2020.12.23.00.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 00:32:13 -0800 (PST)
Date: Wed, 23 Dec 2020 17:32:07 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 17/27] iommu/mediatek: Add pm runtime callback
Message-ID: <X+MAh87dFsY2p8vF@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-18-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209080102.26626-18-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_033216_801631_E636F534 
X-CRM114-Status: GOOD (  26.56  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 09, 2020 at 04:00:52PM +0800, Yong Wu wrote:
> This patch adds pm runtime callback.
> 
> In pm runtime case, all the registers backup/restore and bclk are
> controlled in the pm_runtime callback, then pm_suspend is not needed in
> this case.
> 
> runtime PM is disabled when suspend, thus we call
> pm_runtime_status_suspended instead of pm_runtime_suspended.
> 
> And, m4u doesn't have its special pm runtime domain in previous SoC, in
> this case dev->power.runtime_status is RPM_SUSPENDED defaultly,

This sounds wrong and could lead to hard to debug errors when the driver
is changed in the future. Would it be possible to make the behavior
consistent across the SoCs instead, so that runtime PM status is ACTIVE
when needed, even on SoCs without an IOMMU PM domain?

> thus add
> a "dev->pm_domain" checking for the SoC that has pm runtime domain.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 5614015e5b96..6fe3ee2b2bf5 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -808,7 +808,7 @@ static int mtk_iommu_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int __maybe_unused mtk_iommu_suspend(struct device *dev)
> +static int __maybe_unused mtk_iommu_runtime_suspend(struct device *dev)
>  {
>  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
>  	struct mtk_iommu_suspend_reg *reg = &data->reg;
> @@ -826,7 +826,7 @@ static int __maybe_unused mtk_iommu_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused mtk_iommu_resume(struct device *dev)
> +static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
>  {
>  	struct mtk_iommu_data *data = dev_get_drvdata(dev);
>  	struct mtk_iommu_suspend_reg *reg = &data->reg;
> @@ -853,7 +853,25 @@ static int __maybe_unused mtk_iommu_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int __maybe_unused mtk_iommu_suspend(struct device *dev)
> +{
> +	/* runtime PM is disabled when suspend in pm_runtime case. */
> +	if (dev->pm_domain && pm_runtime_status_suspended(dev))
> +		return 0;
> +
> +	return mtk_iommu_runtime_suspend(dev);
> +}
> +
> +static int __maybe_unused mtk_iommu_resume(struct device *dev)
> +{
> +	if (dev->pm_domain && pm_runtime_status_suspended(dev))
> +		return 0;
> +
> +	return mtk_iommu_runtime_resume(dev);
> +}

Wouldn't it be enough to just use pm_runtime_force_suspend() and
pm_runtime_force_resume() as system sleep ops?

> +
>  static const struct dev_pm_ops mtk_iommu_pm_ops = {
> +	SET_RUNTIME_PM_OPS(mtk_iommu_runtime_suspend, mtk_iommu_runtime_resume, NULL)
>  	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mtk_iommu_suspend, mtk_iommu_resume)
>  };
>  
> -- 
> 2.18.0
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
