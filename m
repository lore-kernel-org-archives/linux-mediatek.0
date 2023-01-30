Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00843C54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vYoc7Pe5sR1g/PrYdzGMRLZ4mX8BYa0CARTE9NtiI4=; b=1SXE/StmM0ETjSAFOjM16tLjPo
	6REty5ldRQGIFoGfaGwsYyJIwvfadAF0F9PS5lYvwfCCK6nDyjj9z5y7gpYBVivMh0Rjlo8aYoQw3
	qBMk9+hMQp4OnZXmSNTI57+U57xHNGJm06juwICi3xM2LDDxutdhyNllvhocr/4vvcR1gquowAGjI
	qgCxh/+QcCjKx5knFeP08S0zG5orF3ePzlAVVG8gQ7q97PlAOla8x2NhAKd3qyc4D/IZIFh6U6gIY
	rLvgI1Dxb303H+wm0qWi3PQwcrdgxhjDChfPGJT9NkrkKqHcS3+U9Cc8XcLGLKGLyM4mfq45cuXkt
	v9iMeR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXO9-004JMW-Lp; Mon, 30 Jan 2023 16:52:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXMv-004J6z-7W; Mon, 30 Jan 2023 16:50:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD01916F8;
	Mon, 30 Jan 2023 04:04:50 -0800 (PST)
Received: from [10.57.89.162] (unknown [10.57.89.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7C0B3F71E;
	Mon, 30 Jan 2023 04:04:06 -0800 (PST)
Message-ID: <741920ba-8637-5e28-695c-699b46351590@arm.com>
Date: Mon, 30 Jan 2023 12:04:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] iommu: mediatek: Add support of unmanaged iommu
 domain
Content-Language: en-GB
To: Alexandre Bailon <abailon@baylibre.com>, yong.wu@mediatek.com,
 joro@8bytes.org, will@kernel.org
Cc: matthias.bgg@gmail.com, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230130102722.133271-1-abailon@baylibre.com>
 <20230130102722.133271-3-abailon@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230130102722.133271-3-abailon@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_085057_353117_2BF098BE 
X-CRM114-Status: GOOD (  18.73  )
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

On 2023-01-30 10:27, Alexandre Bailon wrote:
> Currently, the driver can allocate an unmanaged iommu domain.
> But, this only works for SoC having multiple bank or multiple iova region.

That is for good reason - there is only a single pagetable per bank, so 
if there are multiple devices assigned to a single bank, they cannot 
possibly be attached to different domains at the same time. Hence why 
the banks are modelled as groups.

Thanks,
Robin.

> This updates the driver to also support unmanaged iommu domain if
> MTK_UNMANAGED_DEVICE is set in the iommu id.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>   drivers/iommu/mtk_iommu.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 2badd6acfb23d..5884a1ad409a0 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -858,9 +858,15 @@ static int mtk_iommu_get_group_id(struct device *dev, const struct mtk_iommu_pla
>   static struct iommu_group *mtk_iommu_device_group(struct device *dev)
>   {
>   	struct mtk_iommu_data *c_data = dev_iommu_priv_get(dev), *data;
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>   	struct list_head *hw_list = c_data->hw_list;
>   	struct iommu_group *group;
>   	int groupid;
> +	int i;
> +
> +	for (i = 0; i < fwspec->num_ids; i++)
> +		if (MTK_M4U_UNMANAGED(fwspec->ids[i]))
> +			return iommu_group_alloc();
>   
>   	data = mtk_iommu_get_frst_data(hw_list);
>   	if (!data)

