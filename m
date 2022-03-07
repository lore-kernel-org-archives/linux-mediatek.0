Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B56C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDpebeHOKrOlo1RtIhq3b3M+UueUt4vppq97UuFA1WI=; b=bT7/Fp9TZgXKw4
	1Dpkr4qZiQFPuXtfoOMsY8O6NnxW4/QJBLe07pQ2A9gXB1hOEzZwVLiWeotwkLvXep/IV2FDTVFZ5
	zRqXCTRe1LNgDqsMdHypFoaSzhb5LmiSJdzPgFTC9VcGApaWTSIvgx+TweT8QBNhHm/4nszclrbJk
	wXzO5SygbGamVUHDpm76jNaev8LO9+zSuWh3rQbJ1U8EpHBY0Q1FCL2R8SkqVfwxoEkLbjFN4NyKS
	lH0l6zPHZyGtNsty3UluUj7h5Juqbda0GX+rRoFATLHiW8CQt4+IG26woheTA88bvnR/9o4d26Xr5
	Bp7Y1sDJtxi4tudI6anQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRAc2-00H7Xj-2G; Mon, 07 Mar 2022 10:29:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRAbm-00H7Sk-O9; Mon, 07 Mar 2022 10:28:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 084031F43910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646648933;
 bh=ubDDcRsBY8hq/HNKN5ZLqctS0m6TTgeM8kkuJN+7rnc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZdPjxL42/EtC95u2ilJLnDzPsXUhoYOFYNkaY7fGA/B2/0HBqe2Q1z753afQCHUAP
 RkiN62wI3E8VgdttdBbUQ6nDVw07t6yXSTMpZFGsdwTUDz1y5yEHp9oFDzOfYQLhH/
 G/04KIL5SQeoNqTIG6Ddpj0TxF2wB7tsaZ0TYvMso4tyMm+NXdd0AtNLvcuhaxc/5H
 SP8YGbkghTj89WYp+Z4CA/k0k0rxHGj0cbZMrvdIYvmOlvia2jGA9iXmTenFI8hkzL
 OUcLovkKNlEp6M8I4df66UKXFFyTJt3RNYXoBoI3wWMahuBHvZemGw7Z0iZ8TohTyM
 MvE+xknEW/DxA==
Message-ID: <bb705a6b-282d-5f9e-9231-036329cca5ef@collabora.com>
Date: Mon, 7 Mar 2022 11:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V3 1/7] spi: mediatek: support tick_delay without
 enhance_timing
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220307065230.12655-1-leilk.liu@mediatek.com>
 <20220307065230.12655-2-leilk.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220307065230.12655-2-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_022854_985692_8E751CA0 
X-CRM114-Status: GOOD (  14.96  )
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

Il 07/03/22 07:52, Leilk Liu ha scritto:
> this patch support tick_delay bit[31:30] without enhance_timing feature.
> 
> Fixes: f84d866ab43f("spi: mediatek: add tick_delay support")
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/spi/spi-mt65xx.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index bbfeb8046c17..3fd89548ec3c 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -43,8 +43,11 @@
>   #define SPI_CFG1_PACKET_LOOP_OFFSET       8
>   #define SPI_CFG1_PACKET_LENGTH_OFFSET     16
>   #define SPI_CFG1_GET_TICK_DLY_OFFSET      29
> +#define SPI_CFG1_GET_TICK_DLY_OFFSET_V1   30
>   
>   #define SPI_CFG1_GET_TICK_DLY_MASK        0xe0000000
> +#define SPI_CFG1_GET_TICK_DLY_MASK_V1     0xc0000000
> +
>   #define SPI_CFG1_CS_IDLE_MASK             0xff
>   #define SPI_CFG1_PACKET_LOOP_MASK         0xff00
>   #define SPI_CFG1_PACKET_LENGTH_MASK       0x3ff0000
> @@ -346,9 +349,15 @@ static int mtk_spi_prepare_message(struct spi_master *master,
>   
>   	/* tick delay */
>   	reg_val = readl(mdata->base + SPI_CFG1_REG);
> -	reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK;
> -	reg_val |= ((chip_config->tick_delay & 0x7)
> -		<< SPI_CFG1_GET_TICK_DLY_OFFSET);
> +	if (mdata->dev_comp->enhance_timing) {
> +		reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK;
> +		reg_val |= ((chip_config->tick_delay & 0x7)
> +			    << SPI_CFG1_GET_TICK_DLY_OFFSET);
> +	} else {
> +		reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK_V1;
> +		reg_val |= ((chip_config->tick_delay & 0x3)
> +			    << SPI_CFG1_GET_TICK_DLY_OFFSET_V1);
> +	}
>   	writel(reg_val, mdata->base + SPI_CFG1_REG);
>   
>   	/* set hw cs timing */

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
