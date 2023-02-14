Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413BEC61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 09:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLXwKDT+38qMjFq7mfs8Dv2GP6tvxZmA4QGeh2A3Bvw=; b=g7g3mhKelRUu8/qTQDUxSmKkJx
	wpayOuZuI+DHt62JPEUP2Hh6RmTYpj2kbe8akQik5fsaoZMikiJ1AejizJzZDS8Aki8MwviPCLJ/u
	fhVjKrmqow9ewa8ewkjUSmJ586FELAdZWw++1DWnam3JJH5sdHZ2HwSzhBYFxU2JGoPmtHhLQMPcP
	R6dp0EKGkxbP7FMZKyb6idwiuJexyG3YXok64Gb3qDO3M1iFFETrB3quBAJyIPHnEUtEiwKfCghdn
	L3uZDy343RdW43ypoJpozsvE0yiwMFFc934uC7VXAra+yIcLN+5H81bt+gbNVW/OyMLBr8h51etLS
	zxBv1QbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrvs-000nmb-Tf; Tue, 14 Feb 2023 09:49:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrvh-000niY-QW; Tue, 14 Feb 2023 09:48:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A3C0C660216A;
	Tue, 14 Feb 2023 09:48:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676368131;
	bh=RS/SlQQuZ6JIPOkiIzluR03FMSji1Xm6U0o34iXsd3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LYkCu/a8rlMknpgVQKs399/bogTlZjC/y6ESMhJV06FL80VMBsnlvuZ6bbAm9MelY
	 XZPaqNXraDfZWYVNvXcDDzFDHACyw2l3Wb9UuAxYzYTUXwpwminCBLe8m+5wbJCkoD
	 WfyFYBjnqxbm6f7XRA/w3WzNu8oTekmMb59wggZW1PXy3h1ujznRfzXQiPxidlT9Vu
	 tfK47yeMBpCdkOiCJx+0GnCcZeCQjUvuSbXBJFEe1o9ehlxZPZmBki5XYDy7f8KuVm
	 tvB/XPxNCAyegwJUHRNRi3LY9rFMFdPGV/oIiVQ/Om5QzfJuOHZEQ2dVuO7IQpu88l
	 xjaXdNRNF0SQw==
Message-ID: <7198af95-8835-0f08-09f3-af18a6bcd566@collabora.com>
Date: Tue, 14 Feb 2023 10:48:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 03/11] iommu/mediatek: Improve comment for the current
 region/bank
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, nfraprado@collabora.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, jianjiao.zeng@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com
References: <20230214031114.926-1-yong.wu@mediatek.com>
 <20230214031114.926-4-yong.wu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214031114.926-4-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_014854_014516_FBFB1004 
X-CRM114-Status: GOOD (  20.87  )
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

Il 14/02/23 04:11, Yong Wu ha scritto:
> No functional change. Just add more comment about the current region/bank
> in the code.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 31 ++++++++++++++++++++++++++-----
>   1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index d5a4955910ff..ab53edcb221f 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -197,12 +197,33 @@ struct mtk_iommu_plat_data {
>   
>   	char			*pericfg_comp_str;
>   	struct list_head	*hw_list;
> -	unsigned int		iova_region_nr;
> -	const struct mtk_iommu_iova_region	*iova_region;
>   
> -	u8                  banks_num;
> -	bool                banks_enable[MTK_IOMMU_BANK_MAX];
> -	unsigned int        banks_portmsk[MTK_IOMMU_BANK_MAX];
> +	/*
> +	 * The IOMMU HW may support 16GB iova. In order to balance the IOVA ranges,
> +	 * different masters will be put in different iova ranges, for example vcodec
> +	 * is in 4G-8G and cam is in 8G-12G. Meanwhile, some masters may have the
> +	 * special IOVA range requirement, like CCU can only support the address
> +	 * 0x40000000-0x44000000.
> +	 * Here list the iova ranges this SoC supports and which larbs/ports are in
> +	 * which region.
> +	 *
> +	 * 16GB iova all use one pgtable, but each a region is a iommu group.
> +	 */
> +	struct {
> +		unsigned int	iova_region_nr;
> +		const struct mtk_iommu_iova_region	*iova_region;
> +	};
> +
> +	/*
> +	 * The IOMMU HW may have 5 banks. Each bank has a indenpendent pgtable.

You got a typo here: `inde*n*pendent` - after fixing that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



