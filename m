Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7F3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wJu0V6KU30LMq4huX4SInEF2qJi8dNmJ6v74kDz5SU=; b=xej4tTc0hgoSkT
	+/3jEOH0KNPtNmOu4lp7/TdSskoY/IijDzZHKC7hG0LZ1w9jHURQmc/BSGb4xsryOLnuZWzrNASuH
	vKrTw7RVvkH9g5y5hP0lm6UJXhSZuLk2P2bCwLuQCGHif0nZIG+y/Uy+k7oTfYE+f10CZM4joy9nv
	J7SGV52J1/FGgI3uRTXjM5x+NxbhN2NAI/bnejE1OmUuPHy1AgArqetUVp8xTpPdyCYqUrUrgXKhd
	2jK2bjkzLI6oLnbsG/Nsm/kcLToLXmkM7UNIrNd1QqpvJgeR9cHvQgVyymQjJo1kbQ+plWVOQpivI
	nWF3Q4ajf0TGzlQn5JAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU3dA-008YaH-9M; Tue, 15 Mar 2022 09:38:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU3cx-008YXB-FX; Tue, 15 Mar 2022 09:38:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D71161F436D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647337082;
 bh=hZ3Ozc14j72XOG+b1t+GWcovi4uvCyAsuQVFavKh/sc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R7SGXBVCLCthgJfbqNC649m2NSEhAmzxNhj9UIBmYiQfZ+UuBx+Om3Ph9ejXUlrGw
 b3sXqViSiqFKuv92g78KV63TidJpbB7q23XrfzGhKoY5rvrEGoo8xEKWi80Ukv+4TF
 LBsQ/APy3skr+3tXnNAAsd2HWPsORbBSUO7w3a3sC4yCs1/2Atuw6PmU1KZnPfQEOr
 ibYvS3dTk98lYZx8W1zV8i69uwnjgE5JLnpirElozBMPaCwbYWKnjk8K/nGWN0Kw1A
 ul+x+ebjfR25QCMP2jrkrvxR19DzFopWAvDUy79jhlrRSBJCNQcUa5BsK5yaMc4MXN
 5GC8jvbUL72Jw==
Message-ID: <e3facd86-9e93-bda7-b6dd-c18f1660466a@collabora.com>
Date: Tue, 15 Mar 2022 10:37:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V4 6/6] spi: mediatek: support hclk
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220315032411.2826-1-leilk.liu@mediatek.com>
 <20220315032411.2826-7-leilk.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315032411.2826-7-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_023803_823783_AC651E8D 
X-CRM114-Status: GOOD (  23.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/03/22 04:24, Leilk Liu ha scritto:
> this patch adds hclk support.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>   drivers/spi/spi-mt65xx.c | 85 ++++++++++++++++++++++++++++++++--------
>   1 file changed, 69 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 8958c3fa4fea..d4a602e78aa7 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -130,7 +130,7 @@ struct mtk_spi {
>   	u32 state;
>   	int pad_num;
>   	u32 *pad_sel;
> -	struct clk *parent_clk, *sel_clk, *spi_clk;
> +	struct clk *parent_clk, *sel_clk, *spi_clk, *spi_hclk;
>   	struct spi_transfer *cur_transfer;
>   	u32 xfer_len;
>   	u32 num_xfered;
> @@ -1252,25 +1252,38 @@ static int mtk_spi_probe(struct platform_device *pdev)
>   		goto err_put_master;
>   	}
>   
> +	mdata->spi_hclk = devm_clk_get(&pdev->dev, "hclk");
> +	if (!IS_ERR(mdata->spi_hclk)) {

What you're doing here can be simplified by using devm_clk_get_optional() instead.
Please use that.

> +		ret = clk_prepare_enable(mdata->spi_hclk);
> +		if (ret < 0) {
> +			dev_err(&pdev->dev, "failed to enable hclk (%d)\n", ret);
> +			goto err_put_master;
> +		}
> +	}
> +
>   	ret = clk_prepare_enable(mdata->spi_clk);
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "failed to enable spi_clk (%d)\n", ret);
> -		goto err_put_master;
> +		goto err_disable_spi_hclk;
>   	}
>   
>   	ret = clk_set_parent(mdata->sel_clk, mdata->parent_clk);
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "failed to clk_set_parent (%d)\n", ret);
> -		clk_disable_unprepare(mdata->spi_clk);
> -		goto err_put_master;
> +		goto err_disable_spi_clk;
>   	}
>   
>   	mdata->spi_clk_hz = clk_get_rate(mdata->spi_clk);
>   
> -	if (mdata->dev_comp->no_need_unprepare)
> +	if (mdata->dev_comp->no_need_unprepare) {
>   		clk_disable(mdata->spi_clk);
> -	else
> +		if (!IS_ERR(mdata->spi_hclk))
> +			clk_disable(mdata->spi_hclk);
> +	} else {
>   		clk_disable_unprepare(mdata->spi_clk);
> +		if (!IS_ERR(mdata->spi_hclk))
> +			clk_disable_unprepare(mdata->spi_hclk);
> +	}
>   
>   	pm_runtime_enable(&pdev->dev);
>   
> @@ -1310,6 +1323,11 @@ static int mtk_spi_probe(struct platform_device *pdev)
>   
>   err_disable_runtime_pm:
>   	pm_runtime_disable(&pdev->dev);
> +err_disable_spi_clk:
> +	clk_disable_unprepare(mdata->spi_clk);
> +err_disable_spi_hclk:
> +	if (!IS_ERR(mdata->spi_hclk))

When using devm_clk_get_optional(), you can simply omit this check, since it will
be impossible to reach this point with an error pointer stored in spi_hclk.

> +		clk_disable_unprepare(mdata->spi_hclk);
>   err_put_master:
>   	spi_master_put(master);
>   
> @@ -1325,8 +1343,11 @@ static int mtk_spi_remove(struct platform_device *pdev)
>   
>   	mtk_spi_reset(mdata);
>   
> -	if (mdata->dev_comp->no_need_unprepare)
> +	if (mdata->dev_comp->no_need_unprepare) {
>   		clk_unprepare(mdata->spi_clk);
> +		if (!IS_ERR(mdata->spi_hclk))
> +			clk_unprepare(mdata->spi_hclk);
> +	}
>   
>   	return 0;
>   }
> @@ -1342,8 +1363,11 @@ static int mtk_spi_suspend(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> -	if (!pm_runtime_suspended(dev))
> +	if (!pm_runtime_suspended(dev)) {
>   		clk_disable_unprepare(mdata->spi_clk);
> +		if (!IS_ERR(mdata->spi_hclk))
> +			clk_disable_unprepare(mdata->spi_hclk);
> +	}
>   
>   	return ret;
>   }
> @@ -1360,11 +1384,23 @@ static int mtk_spi_resume(struct device *dev)
>   			dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
>   			return ret;
>   		}
> +
> +		if (!IS_ERR(mdata->spi_hclk)) {

Since you will be using devm_clk_get_optional(), you can also omit this check.

> +			clk_prepare_enable(mdata->spi_hclk);

There's a typo. ret = clk_prepare_enable....

> +			if (ret < 0) {
> +				dev_err(dev, "failed to enable spi_hclk (%d)\n", ret);
> +				clk_disable_unprepare(mdata->spi_clk);
> +				return ret;
> +			}
> +		}
>   	}
>   
>   	ret = spi_master_resume(master);
> -	if (ret < 0)
> +	if (ret < 0) {
>   		clk_disable_unprepare(mdata->spi_clk);
> +		if (!IS_ERR(mdata->spi_hclk))

Same here and everywhere else, no error check if you set this as optional clock.

> +			clk_disable_unprepare(mdata->spi_hclk);
> +	}
>   
>   	return ret;
>   }
> @@ -1376,10 +1412,15 @@ static int mtk_spi_runtime_suspend(struct device *dev)
>   	struct spi_master *master = dev_get_drvdata(dev);
>   	struct mtk_spi *mdata = spi_master_get_devdata(master);
>   
> -	if (mdata->dev_comp->no_need_unprepare)
> +	if (mdata->dev_comp->no_need_unprepare) {
>   		clk_disable(mdata->spi_clk);
> -	else
> +		if (!IS_ERR(mdata->spi_hclk))
> +			clk_disable(mdata->spi_hclk);
> +	} else {
>   		clk_disable_unprepare(mdata->spi_clk);
> +		if (!IS_ERR(mdata->spi_hclk))
> +			clk_disable_unprepare(mdata->spi_hclk);
> +	}
>   
>   	return 0;
>   }
> @@ -1390,13 +1431,25 @@ static int mtk_spi_runtime_resume(struct device *dev)
>   	struct mtk_spi *mdata = spi_master_get_devdata(master);
>   	int ret;
>   
> -	if (mdata->dev_comp->no_need_unprepare)
> +	if (mdata->dev_comp->no_need_unprepare) {
>   		ret = clk_enable(mdata->spi_clk);
> -	else
> +		if (!IS_ERR(mdata->spi_hclk))
> +			clk_enable(mdata->spi_hclk);
> +	} else {
>   		ret = clk_prepare_enable(mdata->spi_clk);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
> -		return ret;
> +		if (ret < 0) {
> +			dev_err(dev, "failed to enable spi_clk (%d)\n", ret);
> +			return ret;
> +		}
> +
> +		if (!IS_ERR(mdata->spi_hclk)) {
> +			ret = clk_prepare_enable(mdata->spi_hclk);
> +			if (ret < 0) {
> +				dev_err(dev, "failed to enable spi_hclk (%d)\n", ret);
> +				clk_disable_unprepare(mdata->spi_clk);
> +				return ret;
> +			}
> +		}
>   	}
>   
>   	return 0;
> 


Regards,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
