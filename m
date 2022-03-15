Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87Dk5h2s2FLTEZeukSS+iCwOVuyLx6aN0JmJuRPtpUA=; b=AUkUN1WuIWVt+w
	zct20xVlwS+hvgvOiU3zrdpr7q9/g5n1sE/qdBSHQ3fZ7PgkKSXgZzAVm2LSbxXlBC/tTeJ4aPQsD
	17RR0NbUfVgmHacXn5MoYTUK8jFjJtavEvI8SryDnq7lGBmjNcGVlexJ+uFYMzYmMeb6lLmF5SNxK
	P5HMuR7+HNgkreE4yb4j1vm/q2mUBl/4Gwl3hGZp3LAW2/sjPdsWjnMUfY5f+8OE1lIespL4kCFSr
	OC8VKeNtNlNDELXYktCJgdR0PLDLINrV1255ckmKkyGBz240gYOKkTGMC07FLqLp4pJui93hP/ppC
	uv+Qpcj0hpPATneMaaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU3XJ-008XL4-34; Tue, 15 Mar 2022 09:32:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU3X8-008XJU-04; Tue, 15 Mar 2022 09:32:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 57BBF1F43621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647336720;
 bh=QE/YbRmb8tZucb45FCoOsfQ+iIuuTe3bEnOlGJc219M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PwTm2ystHVQqrE7oJkq3lebCs09xm0AIRE5RM3D3XtTSMfacCKD+Z7RYNEeGbvZTk
 A/DPtUD7N32kEAAFoDsKy1D9dyBsyV7uVQNWkYNKH2AfR6WUnWypyRxTm8ceVPPYQZ
 G+gfOWjmy1xSoSXxgA1F3eIQH2nkuKq+GTyeMkGAWEdiq7ig4uavwS223BnIIYH9/u
 uFvAIB2C2QHzaXIy47HKbu5dAG3Y5NimtTbipf3E+Ku1PjHMmbO9Fs80ccMIkPi5gu
 WnU8IV92fOPqUkZ3xnR40U2mC40cZjGdX3xPNAnilVEJ11/dyw1gihQ7lJDR99ZI2A
 vjGHGzR3lV7PA==
Message-ID: <b237c1fe-9ddd-0a2e-ecf2-05bfb984c5dd@collabora.com>
Date: Tue, 15 Mar 2022 10:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V4 4/6] spi: mediatek: add spi memory support for ipm
 design
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220315032411.2826-1-leilk.liu@mediatek.com>
 <20220315032411.2826-5-leilk.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220315032411.2826-5-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_023202_212916_2D793216 
X-CRM114-Status: GOOD (  22.32  )
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
> this patch add the support of spi-mem for ipm design.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>   drivers/spi/spi-mt65xx.c | 349 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 348 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 1a0b3208dfca..8958c3fa4fea 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c

...snip...

> +
> +static void of_mtk_spi_parse_dt(struct spi_master *master, struct device_node *nc)
> +{
> +	struct mtk_spi *mdata = spi_master_get_devdata(master);
> +	u32 value;
> +
> +	if (!of_property_read_u32(nc, "spi-tx-bus-width", &value)) {

Hello Leilk,

thanks for considering my advice about "spi-{tx,rx}-bus-width", but there's
something that you have misunderstood about it.

Simply, you don't need this function at all. Whatever you are doing here is
already being performed in the Linux SPI framework: at the end of the probe
function, this driver is calling the (legacy) devm_spi_register_master(),
which calls devm_spi_register_controller().

In drivers/spi/spi.c, function spi_register_controller(), will in turn call
of_register_spi_devices(ctlr) -> of_register_spi_device(ctlr, nc)... that
will end up finally calling function of_spi_parse_dt(ctlr, spi, nc).

The last mentioned function already contains the logic and setup to check
devicetree properties "spi-tx-bus-width" and "spi-rx-bus-width" (and some
others, as well).

This means that spi-mt65xx.c already probed these even before your IPM
implementation, hence ***function of_mtk_spi_parse_dt() is not needed***.

Simply drop it and don't check for these properties: that's already done.


Regards,
Angelo

> +		switch (value) {
> +		case 1:
> +			break;
> +		case 2:
> +			master->mode_bits |= SPI_TX_DUAL;
> +			break;
> +		case 4:
> +			master->mode_bits |= SPI_TX_QUAD;
> +			break;
> +		default:
> +			dev_warn(mdata->dev,
> +				 "spi-tx-bus-width %d not supported\n",
> +				value);
> +			break;
> +		}
> +	}
> +
> +	if (!of_property_read_u32(nc, "spi-rx-bus-width", &value)) {
> +		switch (value) {
> +		case 1:
> +			break;
> +		case 2:
> +			master->mode_bits |= SPI_RX_DUAL;
> +			break;
> +		case 4:
> +			master->mode_bits |= SPI_RX_QUAD;
> +			break;
> +		case 8:
> +			master->mode_bits |= SPI_RX_OCTAL;
> +			break;
> +		default:
> +			dev_warn(mdata->dev,
> +				 "spi-rx-bus-width %d not supported\n",
> +				value);
> +			break;
> +		}
> +	}
> +}
> +
>   static int mtk_spi_probe(struct platform_device *pdev)
>   {
>   	struct spi_master *master;
> @@ -830,6 +1170,13 @@ static int mtk_spi_probe(struct platform_device *pdev)
>   	if (mdata->dev_comp->ipm_design)
>   		master->mode_bits |= SPI_LOOP;
>   
> +	if (mdata->dev_comp->ipm_design) {
> +		mdata->dev = &pdev->dev;
> +		master->mem_ops = &mtk_spi_mem_ops;
> +		of_mtk_spi_parse_dt(master, pdev->dev.of_node);
> +		init_completion(&mdata->spimem_done);
> +	}
> +
>   	if (mdata->dev_comp->need_pad_sel) {
>   		mdata->pad_num = of_property_count_u32_elems(
>   			pdev->dev.of_node,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
