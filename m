Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34F4C48297
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILcWEc1f+BD4tBTh/9witht4MXUTh/Xn200mxqGEyxA=; b=ra041Mkf4lskeqCYUJFIWHFM9n
	v/HT38afQoc1dSNQ3EKkZ9wvwhh2qWeF0An5buOS/AbIBO1D89Wgilc2FuAiLm8w/+VJ+s1c7OiRq
	l5Y2CNuTpwcU8eJTuhD6hKNDEFk84mUyJoiUifYYPtTiI4PjNB2BeN7lmrTAuHKsbi8dixMDlaccC
	pqcG7jYdkBfS9Ek+2tjPiXs8YBA3kSR82AvvItK6ZAjze4DJzdQzWn358csBIlGhxx+WJL50cfgUE
	jlu+pbGf5VTn0gLovOTonO4EcLbaM13TNykqB79IRYYhtYbCndh7FBCACGAe64vV+J4YB+pf0ITIZ
	pSMUDaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZS0G-00000004fF4-1SJv;
	Mon, 12 Feb 2024 08:49:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZS0C-00000004fE8-1VPr;
	Mon, 12 Feb 2024 08:49:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707727763;
	bh=1VsQ4z1r3dEamcItynYxqF1YB4jf1wiMOZfZh4BLL7o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z+blcmK+YbesX4oSXgB0nnDs8q8tMFP62tHS9wmWzqmGkKKXHuMZSWX7Z8yIdrc4p
	 M/JFWMrusIALQ6IB+F3V0TjmS8i+tNF2PN2BGVPyGAiBmV7gWLAXNnp499/LPTD6mP
	 OAJ8HA1guaUgHOvm4M521hJpIg3WlL+SPdOQiXMWeVSStXXyCA8hlbJRqH6XZsAn8B
	 /7TwojQIIPzAjm/v5MzpRc5UqricuAvpMtjqtRsPO46vcyrXQTU4V76ntzaicutipQ
	 txstS5dQuLzVmFRUX0WHrnQFDLeaQqcIk6XEwWoJYbKWkNMXZA3RJAnktzJrgdy28d
	 LW1y3zRvkX5hw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 27262378203F;
	Mon, 12 Feb 2024 08:49:22 +0000 (UTC)
Message-ID: <25e10072-30eb-4272-8a89-2c5240d53a1c@collabora.com>
Date: Mon, 12 Feb 2024 09:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/mtk_iommu: Use devm_kcalloc() instead of
 devm_kzalloc()
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hardening@vger.kernel.org
References: <20240211182250.12656-1-erick.archer@gmx.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240211182250.12656-1-erick.archer@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_004924_568560_E87ADB65 
X-CRM114-Status: GOOD (  18.83  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/02/24 19:22, Erick Archer ha scritto:
> This is an effort to get rid of all multiplications from allocation
> functions in order to prevent integer overflows [1].
> 
> Here the multiplication is obviously safe because MTK_PROTECT_PA_ALIGN
> is defined as a literal value of 256 or 128.
> 
> For the "mtk_iommu.c" file: 256
> For the "mtk_iommu_v1.c" file: 128
> 
> However, using devm_kcalloc() is more appropriate [2] and improves
> readability. This patch has no effect on runtime behavior.
> 
> Link: https://github.com/KSPP/linux/issues/162 [1]
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [2]
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/iommu/mtk_iommu.c    | 2 +-
>   drivers/iommu/mtk_iommu_v1.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 7abe9e85a570..9aae6eb604b1 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1264,7 +1264,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   	data->plat_data = of_device_get_match_data(dev);
> 
>   	/* Protect memory. HW will access here while translation fault.*/
> -	protect = devm_kzalloc(dev, MTK_PROTECT_PA_ALIGN * 2, GFP_KERNEL);
> +	protect = devm_kcalloc(dev, 2, MTK_PROTECT_PA_ALIGN, GFP_KERNEL);
>   	if (!protect)
>   		return -ENOMEM;
>   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 25b41222abae..45cd845d153f 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -621,8 +621,8 @@ static int mtk_iommu_v1_probe(struct platform_device *pdev)
>   	data->dev = dev;
> 
>   	/* Protect memory. HW will access here while translation fault.*/
> -	protect = devm_kzalloc(dev, MTK_PROTECT_PA_ALIGN * 2,
> -			GFP_KERNEL | GFP_DMA);
> +	protect = devm_kcalloc(dev, 2, MTK_PROTECT_PA_ALIGN,
> +			       GFP_KERNEL | GFP_DMA);
>   	if (!protect)
>   		return -ENOMEM;
>   	data->protect_base = ALIGN(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
> --
> 2.25.1
> 



