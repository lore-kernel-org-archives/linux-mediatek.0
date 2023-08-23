Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A53C3DA6F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYdg//lCIYOgvALNNQudiEpWCMvyctrh/pl2oOJOmyQ=; b=Vq2RrDRk6wePNm11rrao9EQNO3
	eWWUPkkfdxi4+HRd580dQEoecn0+93iP7kwjDE8jre/+MaRFK21I6qzP7ZSMR6y29dYRYNXFo6659
	SrrZ9YxWsDjPeI5CjhnxLLjKLNwDqXBINyicAZZBSxny0fsumVXr49dWeONeAwF43vxaOd3OI/LKx
	85j1XYxu5OU5Oz7o2n3vTzlNm8Hcs6AMbfhrRBCxU0hTsii0N+v9svjAk8CWxsH660BscOHIe1C3Q
	nEBcHFRlOh23HEbHaylQ5ksjyB7MzWUgFSPvJ1yTQJL9RdGWSXGsl7D9f/x89Vi4+ziFMS+I52ur2
	lNRDHnTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrSy-001CQV-2b;
	Wed, 23 Aug 2023 17:16:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYrSu-001CP9-1C;
	Wed, 23 Aug 2023 17:16:22 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RWCSR0Fxdz67Ldy;
	Thu, 24 Aug 2023 01:12:07 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 23 Aug
 2023 18:16:16 +0100
Date: Wed, 23 Aug 2023 18:16:15 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Li Zetao <lizetao1@huawei.com>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>
CC: <andrew@aj.id.au>, <angelogioacchino.delregno@collabora.com>,
	<avifishman70@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>,
	<benjaminfair@google.com>, <broonie@kernel.org>,
	<chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>, <conor.dooley@microchip.com>,
	<daire.mcnamara@microchip.com>, <fancer.lancer@gmail.com>,
	<florian.fainelli@broadcom.com>, <heiko@sntech.de>, <jbrunet@baylibre.com>,
	<joel@jms.id.au>, <khilman@baylibre.com>, <linus.walleij@linaro.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-mediatek@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-spi@vger.kernel.org>, <martin.blumenstingl@googlemail.com>,
	<matthias.bgg@gmail.com>, <neil.armstrong@linaro.org>, <olteanv@gmail.com>,
	<openbmc@lists.ozlabs.org>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
	<tali.perry1@gmail.com>, <tmaimon77@gmail.com>, <venture@google.com>,
	<yuenn@google.com>
Subject: Re: [PATCH -next v2 24/25] spi: spl022: Use helper function
 devm_clk_get_enabled()
Message-ID: <20230823181615.00007e9f@Huawei.com>
In-Reply-To: <20230823133938.1359106-25-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
	<20230823133938.1359106-1-lizetao1@huawei.com>
	<20230823133938.1359106-25-lizetao1@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_101620_696401_F10376DA 
X-CRM114-Status: GOOD (  15.66  )
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

On Wed, 23 Aug 2023 21:39:37 +0800
Li Zetao <lizetao1@huawei.com> wrote:

> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly.
> Moreover, the label "err_no_clk_en" is no used, drop it for clean code.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

If you want to follow up with a patch fixing that odd formatting (on it's own)
then that would be great.

Jonathan

> ---
> v1 -> v2: Delete the modification of odd formatting.
> 
>  drivers/spi/spi-pl022.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
> index bb347b6bb6f3..d1b6110b38fc 100644
> --- a/drivers/spi/spi-pl022.c
> +++ b/drivers/spi/spi-pl022.c
> @@ -2168,19 +2168,13 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
>  	dev_info(&adev->dev, "mapped registers from %pa to %p\n",
>  		&adev->res.start, pl022->virtbase);
>  
> -	pl022->clk = devm_clk_get(&adev->dev, NULL);
> +	pl022->clk = devm_clk_get_enabled(&adev->dev, NULL);
>  	if (IS_ERR(pl022->clk)) {
>  		status = PTR_ERR(pl022->clk);
>  		dev_err(&adev->dev, "could not retrieve SSP/SPI bus clock\n");
>  		goto err_no_clk;
>  	}
>  
> -	status = clk_prepare_enable(pl022->clk);
> -	if (status) {
> -		dev_err(&adev->dev, "could not enable SSP/SPI bus clock\n");
> -		goto err_no_clk_en;
> -	}
> -
>  	/* Initialize transfer pump */
>  	tasklet_init(&pl022->pump_transfers, pump_transfers,
>  		     (unsigned long)pl022);
> @@ -2240,8 +2234,6 @@ static int pl022_probe(struct amba_device *adev, const struct amba_id *id)
>  	if (platform_info->enable_dma)
>  		pl022_dma_remove(pl022);
>   err_no_irq:
> -	clk_disable_unprepare(pl022->clk);
> - err_no_clk_en:
>   err_no_clk:
>   err_no_ioremap:
>  	amba_release_regions(adev);
> @@ -2268,7 +2260,6 @@ pl022_remove(struct amba_device *adev)
>  	if (pl022->host_info->enable_dma)
>  		pl022_dma_remove(pl022);
>  
> -	clk_disable_unprepare(pl022->clk);
>  	amba_release_regions(adev);
>  	tasklet_disable(&pl022->pump_transfers);
>  }


