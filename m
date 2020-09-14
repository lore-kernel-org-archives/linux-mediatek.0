Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73E0C2D0E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 09:19:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A07B221EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 09:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r+2MCom4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tiMPrN36"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A07B221EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=waggF6hS7UyxG6CFXGtQzf+IMA4wr03j1BAWLx2s6mw=; b=r+2MCom4ybm27+XE5k9+NeEZe
	eXO3HYjWPWH+Qx70C9e5AfyVL4/SurC6ioUhy3xcicdmLmpZYaL1Engfz9Qhwvb3r+axLN5c71sFD
	8IOSV9bAkkZISBqUlqqzxBTj1/lbZctDbMXLtz6hUsHeLyTXicbvWRtAXLhj8DOemHl7qKXbeYMaH
	yb/Mk9DUBX4K4bP3hrtzDK0zH2+eNGjDCPEtNoCKyeLNu1YghybKtd22dgUmx36bSjlMwSFJMj4QP
	GVJBFTI5gPwegFhA3MAYTclpGPOa1KYmWV2iTl6TGMGrTgJaciZvjqf+0TQjHhF0w7cp0cN7pY/4C
	mX0c64r+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHke3-0003av-PT; Mon, 14 Sep 2020 09:19:31 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHke1-0003aM-Ku; Mon, 14 Sep 2020 09:19:30 +0000
Received: by mail-wr1-x444.google.com with SMTP id m6so17900700wrn.0;
 Mon, 14 Sep 2020 02:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wcF550GwyqliSCSyHw0Z/IDzm3K/ogaNto0zdoWfp60=;
 b=tiMPrN36G6dUn/kEUQVays/uU94aZcWuAZpt/Nvk7qqLpik+PvXRFUsv/Eiw4v+VXi
 nUPyrmVyWgm2X5NAZTkS2bjtga25N+GcOlP/8rgU3wlJRPFvOt6CD0D3XpoZb4zO7MJR
 RTb5xROBppfNI3+h3yXQO02cMDQH+vUyMhy7m2/bsQuWqO43t/T652wnp3ccQACIrruE
 w2NSQCEmAac+MPdWfdJqp47I7AkqnuRFn2K3zg5av1CmCkKi4fbhquKHLsLpy7oWEmTq
 1gCex1T5rtmEO45QL7sRyL/mFyhdzteRX3EgBCk5kCAKR8O3mBNDIkkYoFl359gSPulx
 sMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wcF550GwyqliSCSyHw0Z/IDzm3K/ogaNto0zdoWfp60=;
 b=k6tWiW0z0k9zKviNBJYOZa+Vx4O1ZZd0TODtalxkE/CXGkdWDZYQg9IjGSpEywxZ+T
 v0/g9HkS30ww0A5ylhbKgfvcGO8RBmqbX09utC+S5C2Y9kytbkvUFAa6OS9Uj2vssxrr
 rtLT2/1htGrDtmdAOaL3GBavjjTMOMrNrQgL6XwqPf/woq0p8NM1qHdNuVD7av0diHhz
 32BIIRgiRCbRBpu7IFiUflfyR07RcKAKu2Oro7XqNsIXWQX9D024wA2y3J/qzwwsUPfz
 idkPn3Cj+OikB+M0sUVvyXU40Mx8mBZ5/rqnaqWoE4OIyjiZ8BvZbDhviTUJskQIhKEe
 vgHQ==
X-Gm-Message-State: AOAM533M4dcMYweOMO8kPAlykOlU+tBiWKHKBEyC37y7vgEqfnlXwZW7
 S5tePHjJUa83eiZuTVMLktE=
X-Google-Smtp-Source: ABdhPJyiYN1HRm7fTUbCjsDnDAsfhonS+0cIoWKodJ2jQ+pGXmfjQNFD7P4TdRoi2iJM10fiR86oOA==
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr14605256wrt.267.1600075168623; 
 Mon, 14 Sep 2020 02:19:28 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id j7sm19884886wrs.11.2020.09.14.02.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2020 02:19:27 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] iommu/mediatek: add flag for legacy ivrp paddr
To: Fabien Parent <fparent@baylibre.com>, iommu@lists.linux-foundation.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20200907101649.1573134-1-fparent@baylibre.com>
 <20200907101649.1573134-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <cac92e0d-0789-64a4-729c-80ff5f34b6bb@gmail.com>
Date: Mon, 14 Sep 2020 11:19:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907101649.1573134-2-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_051929_710342_B5B33F70 
X-CRM114-Status: GOOD (  21.97  )
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
Cc: joro@8bytes.org, robh+dt@kernel.org, miles.chen@mediatek.com,
 yong.wu@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/09/2020 12:16, Fabien Parent wrote:
> Add a new flag in order to select which IVRP_PADDR format is used
> by an SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> 
> v4: no change
> v3: set LEGACY_IVRP_PADDR as a flag instead of platform data
> v2: new patch
> 
> ---
>   drivers/iommu/mtk_iommu.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 785b228d39a6..b1f85a7e9346 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -116,6 +116,7 @@
>   #define OUT_ORDER_WR_EN			BIT(4)
>   #define HAS_SUB_COMM			BIT(5)
>   #define WR_THROT_EN			BIT(6)
> +#define HAS_LEGACY_IVRP_PADDR		BIT(7)
>   
>   #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
>   		((((pdata)->flags) & (_x)) == (_x))
> @@ -582,7 +583,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
>   		F_INT_PRETETCH_TRANSATION_FIFO_FAULT;
>   	writel_relaxed(regval, data->base + REG_MMU_INT_MAIN_CONTROL);
>   
> -	if (data->plat_data->m4u_plat == M4U_MT8173)
> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_LEGACY_IVRP_PADDR))
>   		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
>   	else
>   		regval = lower_32_bits(data->protect_base) |
> @@ -818,7 +819,8 @@ static const struct mtk_iommu_plat_data mt6779_data = {
>   
>   static const struct mtk_iommu_plat_data mt8173_data = {
>   	.m4u_plat     = M4U_MT8173,
> -	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI,
> +	.flags	      = HAS_4GB_MODE | HAS_BCLK | RESET_AXI |
> +			HAS_LEGACY_IVRP_PADDR,
>   	.inv_sel_reg  = REG_MMU_INV_SEL_GEN1,
>   	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
>   };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
