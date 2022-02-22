Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF22C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGJexerpOal85xyeBEjulQQJpl+PFGAhW5wA9tFI6g4=; b=AQeGtWjDW4HupP
	dc6vT2v2CyFvOMaYf0q/DKn1QiEsBiXOQSvzryMEBCsYr8v8MNT3HdDex0tx6GqY2UMtu9JQmrMlZ
	ZgxHHFc61oSdr6Va9Qqvwoz8T4ZaoToeS1ap1AARhZFcWy0s4zqrjxx2Rjoa2WtR8gt3SzWSUzRx+
	8UnY4ckvLSwaMbr4+XKSrXHhBN9rwYvWzElRZmdiELp+IDnwVCe5EIDIpo7wcv89nsuu+92R4BXfF
	rk9SeCbhPuPOnf+MYRkxL4kIxbsnD9fi2/WvALGMrw88srme0L4DL7s4YSIPZOgZ+2n7HvKGwx3n8
	87ME840SFmg0FPAGBH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMS70-008tWU-H9; Tue, 22 Feb 2022 10:09:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMS6l-008tRk-KR; Tue, 22 Feb 2022 10:09:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DAA191F442C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645524562;
 bh=JxbXr9ACueoKHRqZRjfnrevBI7Jf+2vW88nX1Uz2Uiw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RiFfI5jInD+h90OnlAlKkj5f+sczBcQFJNBi9knbaDNKGUg2IgKrCVVelakbbbCt8
 XgqWi16ODlh84vZmd1BEyWnPlKEkBtvctlyI14Pp6M0M+IY0gQZqhR20Em5c8ITtPp
 NSoDxEHm2gVh6N8X6XYVRwvkupWYTf5C6oJstHt7/c/RsI6nynCoH2pn1gE3CioSTS
 IBLlT7Pm3/2VZcFdR8ZD00LaEIlB0j8Qn961vdiZgW0cjiWhG49eIZrvEPoKePdIF9
 vFlzkYKkrtRMD6mZ1PyOCQqNEjAoLKAKUifrz4qQRzyBDQF/d95Dzjtn6LiKnSRS9x
 lDfbuzkKxCRDg==
Message-ID: <3d333da3-82cb-acdd-fba0-d555d94fbfa2@collabora.com>
Date: Tue, 22 Feb 2022 11:09:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH V2 2/6] spi: mediatek: add IPM single mode design support
Content-Language: en-US
To: Leilk Liu <leilk.liu@mediatek.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220221040717.3729-1-leilk.liu@mediatek.com>
 <20220221040717.3729-3-leilk.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220221040717.3729-3-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_020923_973855_2B25BEAA 
X-CRM114-Status: GOOD (  24.30  )
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

Il 21/02/22 05:07, Leilk Liu ha scritto:
> this patch add the support of IPM single mode design.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>   drivers/spi/spi-mt65xx.c | 103 +++++++++++++++++++++++++++++++++------
>   1 file changed, 87 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index bbfeb8046c17..5fa677a589a4 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -31,6 +31,7 @@
>   #define SPI_CFG2_REG                      0x0028
>   #define SPI_TX_SRC_REG_64                 0x002c
>   #define SPI_RX_DST_REG_64                 0x0030
> +#define SPI_CFG3_IPM_REG                  0x0040
>   
>   #define SPI_CFG0_SCK_HIGH_OFFSET          0
>   #define SPI_CFG0_SCK_LOW_OFFSET           8
> @@ -48,6 +49,7 @@
>   #define SPI_CFG1_CS_IDLE_MASK             0xff
>   #define SPI_CFG1_PACKET_LOOP_MASK         0xff00
>   #define SPI_CFG1_PACKET_LENGTH_MASK       0x3ff0000
> +#define SPI_CFG1_IPM_PACKET_LENGTH_MASK   GENMASK(31, 16)
>   #define SPI_CFG2_SCK_HIGH_OFFSET          0
>   #define SPI_CFG2_SCK_LOW_OFFSET           16
>   
> @@ -68,7 +70,13 @@
>   #define SPI_CMD_TX_ENDIAN            BIT(15)
>   #define SPI_CMD_FINISH_IE            BIT(16)
>   #define SPI_CMD_PAUSE_IE             BIT(17)
> +#define SPI_CMD_IPM_NONIDLE_MODE     BIT(19)
> +#define SPI_CMD_IPM_SPIM_LOOP        BIT(21)
> +#define SPI_CMD_IPM_GET_TICKDLY_OFFSET    22
>   
> +#define SPI_CMD_IPM_GET_TICKDLY_MASK	GENMASK(24, 22)
> +#define SPI_CFG3_IPM_HALF_DUPLEX_DIR		BIT(2)
> +#define SPI_CFG3_IPM_HALF_DUPLEX_EN		BIT(3)
>   #define MT8173_SPI_MAX_PAD_SEL 3
>   
>   #define MTK_SPI_PAUSE_INT_STATUS 0x2
> @@ -78,6 +86,7 @@
>   
>   #define MTK_SPI_MAX_FIFO_SIZE 32U
>   #define MTK_SPI_PACKET_SIZE 1024
> +#define MTK_SPI_IPM_PACKET_SIZE SZ_64K
>   #define MTK_SPI_32BITS_MASK  (0xffffffff)
>   
>   #define DMA_ADDR_EXT_BITS (36)
> @@ -93,6 +102,9 @@ struct mtk_spi_compatible {
>   	bool dma_ext;
>   	/* some IC no need unprepare SPI clk */
>   	bool no_need_unprepare;
> +	/* IPM design improve some single mode features */
> +	bool ipm_design;
> +
>   };
>   
>   struct mtk_spi {
> @@ -116,6 +128,12 @@ static const struct mtk_spi_compatible mt2712_compat = {
>   	.must_tx = true,
>   };
>   
> +static const struct mtk_spi_compatible ipm_compat_single = {
> +	.enhance_timing = true,
> +	.dma_ext = true,
> +	.ipm_design = true,
> +};
> +
>   static const struct mtk_spi_compatible mt6765_compat = {
>   	.need_pad_sel = true,
>   	.must_tx = true,
> @@ -157,6 +175,9 @@ static const struct mtk_chip_config mtk_default_chip_info = {
>   };
>   
>   static const struct of_device_id mtk_spi_of_match[] = {
> +	{ .compatible = "mediatek,ipm-spi-single",
> +		.data = (void *)&ipm_compat_single,
> +	},
>   	{ .compatible = "mediatek,mt2701-spi",
>   		.data = (void *)&mtk_common_compat,
>   	},
> @@ -275,12 +296,11 @@ static int mtk_spi_set_hw_cs_timing(struct spi_device *spi)
>   	return 0;
>   }
>   
> -static int mtk_spi_prepare_message(struct spi_master *master,
> -				   struct spi_message *msg)
> +static int mtk_spi_hw_init(struct spi_master *master,
> +			   struct spi_device *spi)
>   {
>   	u16 cpha, cpol;
>   	u32 reg_val;
> -	struct spi_device *spi = msg->spi;
>   	struct mtk_chip_config *chip_config = spi->controller_data;
>   	struct mtk_spi *mdata = spi_master_get_devdata(master);
>   
> @@ -288,6 +308,15 @@ static int mtk_spi_prepare_message(struct spi_master *master,
>   	cpol = spi->mode & SPI_CPOL ? 1 : 0;
>   
>   	reg_val = readl(mdata->base + SPI_CMD_REG);
> +	if (mdata->dev_comp->ipm_design) {
> +		/* SPI transfer without idle time until packet length done */
> +		reg_val |= SPI_CMD_IPM_NONIDLE_MODE;
> +		if (spi->mode & SPI_LOOP)
> +			reg_val |= SPI_CMD_IPM_SPIM_LOOP;
> +		else
> +			reg_val &= ~SPI_CMD_IPM_SPIM_LOOP;
> +	}
> +
>   	if (cpha)
>   		reg_val |= SPI_CMD_CPHA;
>   	else
> @@ -344,18 +373,33 @@ static int mtk_spi_prepare_message(struct spi_master *master,
>   		writel(mdata->pad_sel[spi->chip_select],
>   		       mdata->base + SPI_PAD_SEL_REG);
>   
> -	/* tick delay */
> -	reg_val = readl(mdata->base + SPI_CFG1_REG);
> -	reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK;
> -	reg_val |= ((chip_config->tick_delay & 0x7)
> -		<< SPI_CFG1_GET_TICK_DLY_OFFSET);
> -	writel(reg_val, mdata->base + SPI_CFG1_REG);

Hello Leilk,

with this change, you are excluding this code from MT2712: is that
intentional?
If it is, then this should reside in a different commit with a Fixes
tag, also explaining the reason for not setting the tick delay on
that SoC.

Also, please don't remove the /* tick delay */ comment.

Regards,
Angelo

> +	if (mdata->dev_comp->enhance_timing) {
> +		if (mdata->dev_comp->ipm_design) {
> +			reg_val = readl(mdata->base + SPI_CMD_REG);
> +			reg_val &= ~SPI_CMD_IPM_GET_TICKDLY_MASK;
> +			reg_val |= ((chip_config->tick_delay & 0x7)
> +				   << SPI_CMD_IPM_GET_TICKDLY_OFFSET);
> +			writel(reg_val, mdata->base + SPI_CMD_REG);
> +		} else {
> +			reg_val = readl(mdata->base + SPI_CFG1_REG);
> +			reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK;
> +			reg_val |= ((chip_config->tick_delay & 0x7)
> +				<< SPI_CFG1_GET_TICK_DLY_OFFSET);
> +			writel(reg_val, mdata->base + SPI_CFG1_REG);
> +		}
> +	}
>   
>   	/* set hw cs timing */
>   	mtk_spi_set_hw_cs_timing(spi);
>   	return 0;
>   }


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
