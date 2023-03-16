Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36682C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 10:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IR/CpXSV7ofatZouPeub9r0axDV+uJfzN/Dwp+0HdX4=; b=wQjGlcEm3O5Hekkiux/B6fkmO0
	SWIJ0fEoKljf0TfzEHrJ1LDg+3EOr8WKZdBkqZhegiTyQd0bW4wFIv0GH5et+DOPfVlZfYlqyV5SP
	3QC0SNeSdqG1puAL5ZbelvWJpl+cvWeitDwSdOO0fksN7vw0kEKQ03rm82FQM26BdLAXP6K4NIdLP
	O35eOKultbrhHSkF3XqzcqLV3YXshnkuQHTeueN6bH0kYElwcnd2O8htVlaFHP3h/vinla4K5ASQW
	louhXSTEJaCRvtsBImRKV2MO/3+lyZH1ZQCqCuAbkwEYti6GTg+nqRQJmlh3Nr7JB9bI/Ii4+STTM
	Co21kk0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckmZ-00G3CZ-2k;
	Thu, 16 Mar 2023 10:24:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckmV-00G39X-08;
	Thu, 16 Mar 2023 10:24:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DA64E660309D;
	Thu, 16 Mar 2023 10:24:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678962261;
	bh=JdVoGCJf3Q6s6CvpqfATsO0IIiTbtHaPsLAGORiICLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ShTG0J1nBkA8ToOcGv0l67RQRBXFzu6DU+cCCVS2R+PFfiYGglc452pngu7LtW+VL
	 gBnyae7I0t5brIbuJLL01km4PdI3lkTX11Bn8Eb4eg8/SfEdHwtxLwFar1klM3CWPj
	 bGDClkcQiJIFpQJEH3ZV5CaVFZDjhYZziCL0kYncNOnxWpNMH3nPu4yYGPQ3mOGLID
	 yosnUYg6CG6RyY1YfGOm/v/IwzQxBA5zGgWkKxn5jYi1ul9RIlwzKkbGg/2Xo2rrUI
	 DZaUZ8HoFb/EYP1p1QxPAdw0Q0ZA5/seX+eXnCqKUzJwpU1jvf1Rwt/xA9yKKtcpf7
	 wX3DR3MZIDI3g==
Message-ID: <4a398efe-af02-b1b6-1617-5537fc490bd7@collabora.com>
Date: Thu, 16 Mar 2023 11:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 Yunfei Wang <yf.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jianjiao.zeng@mediatek.com,
 chengci.xu@mediatek.com
References: <20230316101445.12443-1-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230316101445.12443-1-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_032423_212588_320F3D17 
X-CRM114-Status: GOOD (  17.99  )
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

Il 16/03/23 11:14, Yong Wu ha scritto:
> When we enable PGTABLE_PA_35_EN, the PA for pgtable may be 35bits.
> Thus add dma_mask for it.
> 
> Fixes: 301c3ca12576 ("iommu/mediatek: Allow page table PA up to 35bit")
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v3: Sorry for a typo. Change from "if (!ret)" to "if (ret)".

I was just about to make you notice. Glad you've fixed that promptly and before
giving me a chance to complain! :-P

Good job!

Cheers,
Angelo

> 
> v2: Just move this out from mt8188 series. Nothing change.
> 
> v1: https://lore.kernel.org/linux-mediatek/20230307080555.14399-3-yong.wu@mediatek.com/
> ---
>   drivers/iommu/mtk_iommu.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index d5a4955910ff..6a00ce208dc2 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1258,6 +1258,14 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   			return PTR_ERR(data->bclk);
>   	}
>   
> +	if (MTK_IOMMU_HAS_FLAG(data->plat_data, PGTABLE_PA_35_EN)) {
> +		ret = dma_set_mask(dev, DMA_BIT_MASK(35));
> +		if (ret) {
> +			dev_err(dev, "Failed to set dma_mask 35.\n");
> +			return ret;
> +		}
> +	}
> +
>   	pm_runtime_enable(dev);
>   
>   	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {


