Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4702C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8C1jc6vMCfUw9qUSGi9mG6vYmRk/in78HyVHyxveNQ=; b=qrdIAE4dTQECJ6
	7ZFfGTfff3LXoT3imosLIRdJqaLyxEgklgVtHms2KELDa81vKwzygvD3CUN+6dW3cwU6VJ70nmFeq
	HmYGQjZ2+5XmhF8s5SStDHOwTbhZp1Nkz5FSst1KQwPud5jXZf2gRtZt+DpuLfkNK13oa7op23smE
	Hy1Waa6MUXCw1QC7HartqbWghS9RxMZm4R9swPl3Jmm5yVqEyHQQSmoJuw7qMppp6gwUXFaXOKZv4
	PyLKk12eVD3n0jriD0uQTReID0II1jvErkaMEXaTLLidwiwdCUrm82lezrH4tW628EQ3iPabKzrkS
	4S+7kU4hCEe1XVgL3sdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSoK-00CbSZ-Uv; Thu, 21 Apr 2022 09:09:13 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSmy-00Caiu-Lq; Thu, 21 Apr 2022 09:07:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DB0591F45279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650532067;
 bh=tb++htDWk/P/kh+yJkp0hPfRxlrxeXi4tKHeB0AnpV0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=n84OI35RxbQy50D/JAZvFas9G4XgXg1uk/TciCrzNNtm/T9v8dRv9Jm68V/XSs/wc
 0lZZS/5BwKZasAFVvUCBnoL1T9+o93fEL5N5h0FetM2Ecal1c2uyzg8eYyg9hbKS4E
 aHdvQhJ+SgdlxOXmI9xwxUki0r9M3s1YGJNfL4BXuzrpes15BXoYSVQ0M9SX6lyCcS
 ntiVZr7cJejkeKZzufsRWfOyGnSHDeucwyzzqDcHw43IysiJmrFgbgWDF2TcrGWysU
 tNV7Rq/9AjPQBYimkrRqaIczuF6Ys+PRiBSqMhFZ4Ht124yYI9UAY7soxHtWNOXg0Q
 Cq1ZRUo8EEfbQ==
Message-ID: <bff10500-4b63-9553-2ce0-3e46eb261d7a@collabora.com>
Date: Thu, 21 Apr 2022 11:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 08/12] clk: mediatek: reset: Add new register reset
 function with device
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-9-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220420130527.23200-9-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_020748_923496_1E075D7E 
X-CRM114-Status: GOOD (  16.17  )
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

Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> Some clock drvier only support device_node, so we still remain
> register reset function with device_node and add a function to
> register reset controller with device.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/clk/mediatek/clk-mt2701-eth.c |  2 +-
>   drivers/clk/mediatek/clk-mt2701-g3d.c |  2 +-
>   drivers/clk/mediatek/clk-mt2701-hif.c |  2 +-
>   drivers/clk/mediatek/clk-mt2701.c     |  4 +--
>   drivers/clk/mediatek/clk-mt2712.c     |  4 +--
>   drivers/clk/mediatek/clk-mt7622-eth.c |  2 +-
>   drivers/clk/mediatek/clk-mt7622-hif.c |  4 +--
>   drivers/clk/mediatek/clk-mt7622.c     |  4 +--
>   drivers/clk/mediatek/clk-mt7629-eth.c |  2 +-
>   drivers/clk/mediatek/clk-mt7629-hif.c |  4 +--
>   drivers/clk/mediatek/clk-mt8183.c     |  2 +-
>   drivers/clk/mediatek/reset.c          | 43 +++++++++++++++++++++++++++
>   drivers/clk/mediatek/reset.h          |  2 ++
>   13 files changed, 61 insertions(+), 16 deletions(-)
> 


..snip..

> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index b164b1da7dd3..1173111af3ab 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -107,4 +107,47 @@ int mtk_clk_register_rst_ctrl(struct device_node *np,
>   	return ret;
>   }
>   
> +int mtk_clk_register_rst_ctrl_with_dev(struct device *dev,
> +				       const struct mtk_clk_rst_desc *desc)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct regmap *regmap;
> +	struct mtk_clk_rst_data *data;
> +	int ret;
> +
> +	if (!desc) {
> +		dev_err(dev, "mtk clock reset desc is NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	if (desc->version >= MTK_RST_MAX) {
> +		dev_err(dev, "Error version number: %d\n", desc->version);
> +		return -EINVAL;
> +	}
> +
> +	regmap = device_node_to_regmap(np);
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "Cannot find regmap %pe\n", regmap);
> +		return -EINVAL;
> +	}
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->desc = desc;
> +	data->regmap = regmap;
> +	data->rcdev.owner = THIS_MODULE;
> +	data->rcdev.nr_resets = desc->reg_num * 32;
> +	data->rcdev.ops = rst_op[desc->version];
> +	data->rcdev.of_node = np;
> +	data->rcdev.dev = dev;
> +
> +	ret = devm_reset_controller_register(dev, &data->rcdev);
> +	if (ret)
> +		dev_err(dev, "could not register reset controller: %d\n", ret);

	if (ret) {
		dev_err(dev, "could not register reset controller: %d\n", ret);
		return ret;
	}

	return 0;

> +
> +	return ret;
> +}
> +
>   MODULE_LICENSE("GPL");

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
