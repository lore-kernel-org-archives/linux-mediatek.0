Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5578CC001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhAHYO0CiSuPjrlSJCu239HOqEgzkDOS5hjCNz6EBFY=; b=q3RlvQTBH6EOgX/QLQU1Y47o4O
	74nLWJ/XyyM++GNlJNCH1olGIaJtffL5YtJKUcgx65CKAObHBXelFIW5F2XJssBEuYtlebBEPZI+T
	JwEuf4maqiZG0myeUCCENfArz1FW+BDic6azLmEKhHYE4boiV6ARHaO3Qy4Bk3EVASZuczURVkK/F
	fNCEdZurpT/LpN44Nbub5eP90Wvzrpf/Fav9bJmjvuxPgDzOLwmbldL12jzM33Qz7LNWzZXlAX1vq
	63bN/X2k72N0nt1hYyDZCYLG01A8sXaeljYbGBaa3eZbAQ2WJoVSeUaoNw8bG05r6dAceA0AddauA
	thHNverQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTJg-006xar-1V;
	Thu, 03 Aug 2023 08:04:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRTJd-006xZO-09;
	Thu, 03 Aug 2023 08:04:14 +0000
Received: from [192.168.0.125] (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A811266003AE;
	Thu,  3 Aug 2023 09:04:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691049848;
	bh=olN4dxI1FgVffux81b8zn3MJNrXq8USsOO0KoBkTCFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BlL9QbPlioYXC2hNIEVJBMKioa2AcQ6EjQ7NiyDIMcDgMbcM/28l7xVhptnPgiX4x
	 92SmPsToRA7yGqjMei6q88tORCKN0bEKHyN0UwD6Mw8nukOiWRYezCCOfWJ4CW0esr
	 5Zo6Uy3CCoPDfQca0SERrw925gqaoXGqNdrGKK9of7wqomSgQ1WZcALHdfrlB9MtJ/
	 3uijb4BuTs/jL92gGud8/ERb/EdZnwVq2pF+Vu3B+SK07cdVpibd/rTXi8zodRXPW1
	 9w+tjnnrpBK2H/C54IdNiwBf8JT8mH3z6wrlOaKUHvZWPAn6SGLllBYBONzasNHpF5
	 4j21QxdJPrj0w==
Message-ID: <e88a1074-ca86-709f-8c26-f875320e728a@collabora.com>
Date: Thu, 3 Aug 2023 11:04:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8186 modify dram type as non-cache
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: yc.hung@mediatek.com, allen-kh.cheng@mediatek.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230803075028.32170-1-trevor.wu@mediatek.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230803075028.32170-1-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_010413_360550_CE5A9E92 
X-CRM114-Status: GOOD (  24.08  )
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

Hi Trevor,

On 8/3/23 10:50, Trevor Wu wrote:
> To prevent incorrect access between the host and DSP sides, we need to
> modify DRAM as a non-cache memory type. Additionally, we can retrieve
> the size of shared DMA from the device tree.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
> Reviewed-by: Kuan-Hsun Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>   sound/soc/sof/mediatek/mt8186/mt8186.c | 40 +++++++++++++++-----------
>   1 file changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
> index 3e0ea0e109e2..f587edf9e0a7 100644
> --- a/sound/soc/sof/mediatek/mt8186/mt8186.c
> +++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
> @@ -111,6 +111,14 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
>   
>   	dev_dbg(dev, "DMA %pR\n", &res);
>   
> +	adsp->pa_shared_dram = (phys_addr_t)res.start;
> +	adsp->shared_size = resource_size(&res);
> +	if (adsp->pa_shared_dram & DRAM_REMAP_MASK) {
> +		dev_err(dev, "adsp shared dma memory(%#x) is not 4K-aligned\n",
> +			(u32)adsp->pa_shared_dram);
> +		return -EINVAL;
> +	}
> +

Would it be better to just realign to the next 4k boundary ?
Or, isn't it more usual to use dma_coerce_mask_and_coherent ?

>   	ret = of_reserved_mem_device_init(dev);
>   	if (ret) {
>   		dev_err(dev, "of_reserved_mem_device_init failed\n");
> @@ -244,23 +252,18 @@ static int adsp_shared_base_ioremap(struct platform_device *pdev, void *data)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_adsp_chip_info *adsp = data;
> -	u32 shared_size;
>   
>   	/* remap shared-dram base to be non-cachable */
> -	shared_size = TOTAL_SIZE_SHARED_DRAM_FROM_TAIL;
> -	adsp->pa_shared_dram = adsp->pa_dram + adsp->dramsize - shared_size;
> -	if (adsp->va_dram) {
> -		adsp->shared_dram = adsp->va_dram + DSP_DRAM_SIZE - shared_size;
> -	} else {
> -		adsp->shared_dram = devm_ioremap(dev, adsp->pa_shared_dram,
> -						 shared_size);
> -		if (!adsp->shared_dram) {
> -			dev_err(dev, "ioremap failed for shared DRAM\n");
> -			return -ENOMEM;
> -		}
> +	adsp->shared_dram = devm_ioremap(dev, adsp->pa_shared_dram,
> +					 adsp->shared_size);

You cannot use dma_alloc_coherent ? This should take care of all the 
cache maintainance for you.

> +	if (!adsp->shared_dram) {
> +		dev_err(dev, "failed to ioremap base %pa size %#x\n",
> +			adsp->shared_dram, adsp->shared_size);
> +		return -ENOMEM;
>   	}
> -	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%pa, size=%#x\n",
> -		adsp->shared_dram, &adsp->pa_shared_dram, shared_size);
> +
> +	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%pa,  size=%#x\n",
> +		adsp->shared_dram, &adsp->pa_shared_dram, adsp->shared_size);
>   
>   	return 0;
>   }
> @@ -307,9 +310,12 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
>   		return -ENOMEM;
>   	}
>   
> -	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev,
> -							  priv->adsp->pa_dram,
> -							  priv->adsp->dramsize);
> +	priv->adsp->va_sram = sdev->bar[SOF_FW_BLK_TYPE_IRAM];
> +
> +	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap(sdev->dev,
> +						       priv->adsp->pa_dram,
> +						       priv->adsp->dramsize);
> +
Same here

>   	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
>   		dev_err(sdev->dev, "failed to ioremap base %pa size %#x\n",
>   			&priv->adsp->pa_dram, priv->adsp->dramsize);


Regards,
Eugen

