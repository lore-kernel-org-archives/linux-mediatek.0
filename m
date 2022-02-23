Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E01C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 02:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJ/bc7eA7SwtpcARUurQ/jclZJhzv3Bc2AwRAQk4Ck8=; b=mBAN3OeBM2/o7T
	28dXna70rgm8Nv4U4+TF2PComVnEEuBgQ7jkoXjKXexa++cYQ6L9bY8wXeXq+yFRokaGtCiUNiX7l
	RU3UPpNbAzPpyn8iB7VPFVpwgSLsTb7vyLCPhy7HNU28cTVoHjnyktCmV/A4NrASXr3pLOL19wuXz
	D4rFkzohfHTPGrYAajvMfWhXN5PasAsS3lwK/nzNF+C1wjRDN0zhEq/GXCw6wz15TKgyUpBPdXAu0
	hiDVx7sbd3oEPUp5EsluDQWuxUCG8nP0XxNP9YhMZ48DX1SkTq0lr2A7Fgx5PKtVcVxwmUaDQnoG2
	02I5BWRWYdTEjIcuOtsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMgzQ-00CG26-M9; Wed, 23 Feb 2022 02:02:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMgzE-00CG0b-BO; Wed, 23 Feb 2022 02:02:37 +0000
X-UUID: d76a3d93dd4b40d8859584c97ec4eb3e-20220222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=z93hlu+VUOeiBEsf62X7x9NGa/UtkXptynv+fKfoBks=; 
 b=AHXw+Eqd328eAg7qaCkyiIS03FGCvMDNYTcFAg9pQkUrE5SfAIlvb7HK7KSJBHQeb5tgiU0q3K3Y/O+VIfGFLGiDb2NX9z06YhxDsNeer5dDho0NG+znZZfQOuYmhFdF48YTvGCteHUjqEDsyrNHKFWqePjCNywn3khji7tLrUs=;
X-UUID: d76a3d93dd4b40d8859584c97ec4eb3e-20220222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1754878272; Tue, 22 Feb 2022 19:00:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 17:51:46 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 23 Feb 2022 09:51:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 09:51:44 +0800
Message-ID: <048044adfba3786bd94ec1878832376979fc9513.camel@mediatek.com>
Subject: Re: [PATCH V2 2/6] spi: mediatek: add IPM single mode design support
From: Leilk Liu <leilk.liu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Mark Brown" <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 23 Feb 2022 09:51:44 +0800
In-Reply-To: <3d333da3-82cb-acdd-fba0-d555d94fbfa2@collabora.com>
References: <20220221040717.3729-1-leilk.liu@mediatek.com>
 <20220221040717.3729-3-leilk.liu@mediatek.com>
 <3d333da3-82cb-acdd-fba0-d555d94fbfa2@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_180236_421366_F729A3E3 
X-CRM114-Status: GOOD (  28.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-02-22 at 11:09 +0100, AngeloGioacchino Del Regno wrote:
> Il 21/02/22 05:07, Leilk Liu ha scritto:
> > this patch add the support of IPM single mode design.
> > 
> > Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> > ---
> >   drivers/spi/spi-mt65xx.c | 103 +++++++++++++++++++++++++++++++++-
> > -----
> >   1 file changed, 87 insertions(+), 16 deletions(-)
> > 
> > diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> > index bbfeb8046c17..5fa677a589a4 100644
> > --- a/drivers/spi/spi-mt65xx.c
> > +++ b/drivers/spi/spi-mt65xx.c
> > @@ -31,6 +31,7 @@
> >   #define SPI_CFG2_REG                      0x0028
> >   #define SPI_TX_SRC_REG_64                 0x002c
> >   #define SPI_RX_DST_REG_64                 0x0030
> > +#define SPI_CFG3_IPM_REG                  0x0040
> >   
> >   #define SPI_CFG0_SCK_HIGH_OFFSET          0
> >   #define SPI_CFG0_SCK_LOW_OFFSET           8
> > @@ -48,6 +49,7 @@
> >   #define SPI_CFG1_CS_IDLE_MASK             0xff
> >   #define SPI_CFG1_PACKET_LOOP_MASK         0xff00
> >   #define SPI_CFG1_PACKET_LENGTH_MASK       0x3ff0000
> > +#define SPI_CFG1_IPM_PACKET_LENGTH_MASK   GENMASK(31, 16)
> >   #define SPI_CFG2_SCK_HIGH_OFFSET          0
> >   #define SPI_CFG2_SCK_LOW_OFFSET           16
> >   
> > @@ -68,7 +70,13 @@
> >   #define SPI_CMD_TX_ENDIAN            BIT(15)
> >   #define SPI_CMD_FINISH_IE            BIT(16)
> >   #define SPI_CMD_PAUSE_IE             BIT(17)
> > +#define SPI_CMD_IPM_NONIDLE_MODE     BIT(19)
> > +#define SPI_CMD_IPM_SPIM_LOOP        BIT(21)
> > +#define SPI_CMD_IPM_GET_TICKDLY_OFFSET    22
> >   
> > +#define SPI_CMD_IPM_GET_TICKDLY_MASK	GENMASK(24, 22)
> > +#define SPI_CFG3_IPM_HALF_DUPLEX_DIR		BIT(2)
> > +#define SPI_CFG3_IPM_HALF_DUPLEX_EN		BIT(3)
> >   #define MT8173_SPI_MAX_PAD_SEL 3
> >   
> >   #define MTK_SPI_PAUSE_INT_STATUS 0x2
> > @@ -78,6 +86,7 @@
> >   
> >   #define MTK_SPI_MAX_FIFO_SIZE 32U
> >   #define MTK_SPI_PACKET_SIZE 1024
> > +#define MTK_SPI_IPM_PACKET_SIZE SZ_64K
> >   #define MTK_SPI_32BITS_MASK  (0xffffffff)
> >   
> >   #define DMA_ADDR_EXT_BITS (36)
> > @@ -93,6 +102,9 @@ struct mtk_spi_compatible {
> >   	bool dma_ext;
> >   	/* some IC no need unprepare SPI clk */
> >   	bool no_need_unprepare;
> > +	/* IPM design improve some single mode features */
> > +	bool ipm_design;
> > +
> >   };
> >   
> >   struct mtk_spi {
> > @@ -116,6 +128,12 @@ static const struct mtk_spi_compatible
> > mt2712_compat = {
> >   	.must_tx = true,
> >   };
> >   
> > +static const struct mtk_spi_compatible ipm_compat_single = {
> > +	.enhance_timing = true,
> > +	.dma_ext = true,
> > +	.ipm_design = true,
> > +};
> > +
> >   static const struct mtk_spi_compatible mt6765_compat = {
> >   	.need_pad_sel = true,
> >   	.must_tx = true,
> > @@ -157,6 +175,9 @@ static const struct mtk_chip_config
> > mtk_default_chip_info = {
> >   };
> >   
> >   static const struct of_device_id mtk_spi_of_match[] = {
> > +	{ .compatible = "mediatek,ipm-spi-single",
> > +		.data = (void *)&ipm_compat_single,
> > +	},
> >   	{ .compatible = "mediatek,mt2701-spi",
> >   		.data = (void *)&mtk_common_compat,
> >   	},
> > @@ -275,12 +296,11 @@ static int mtk_spi_set_hw_cs_timing(struct
> > spi_device *spi)
> >   	return 0;
> >   }
> >   
> > -static int mtk_spi_prepare_message(struct spi_master *master,
> > -				   struct spi_message *msg)
> > +static int mtk_spi_hw_init(struct spi_master *master,
> > +			   struct spi_device *spi)
> >   {
> >   	u16 cpha, cpol;
> >   	u32 reg_val;
> > -	struct spi_device *spi = msg->spi;
> >   	struct mtk_chip_config *chip_config = spi->controller_data;
> >   	struct mtk_spi *mdata = spi_master_get_devdata(master);
> >   
> > @@ -288,6 +308,15 @@ static int mtk_spi_prepare_message(struct
> > spi_master *master,
> >   	cpol = spi->mode & SPI_CPOL ? 1 : 0;
> >   
> >   	reg_val = readl(mdata->base + SPI_CMD_REG);
> > +	if (mdata->dev_comp->ipm_design) {
> > +		/* SPI transfer without idle time until packet length
> > done */
> > +		reg_val |= SPI_CMD_IPM_NONIDLE_MODE;
> > +		if (spi->mode & SPI_LOOP)
> > +			reg_val |= SPI_CMD_IPM_SPIM_LOOP;
> > +		else
> > +			reg_val &= ~SPI_CMD_IPM_SPIM_LOOP;
> > +	}
> > +
> >   	if (cpha)
> >   		reg_val |= SPI_CMD_CPHA;
> >   	else
> > @@ -344,18 +373,33 @@ static int mtk_spi_prepare_message(struct
> > spi_master *master,
> >   		writel(mdata->pad_sel[spi->chip_select],
> >   		       mdata->base + SPI_PAD_SEL_REG);
> >   
> > -	/* tick delay */
> > -	reg_val = readl(mdata->base + SPI_CFG1_REG);
> > -	reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK;
> > -	reg_val |= ((chip_config->tick_delay & 0x7)
> > -		<< SPI_CFG1_GET_TICK_DLY_OFFSET);
> > -	writel(reg_val, mdata->base + SPI_CFG1_REG);
> 
> Hello Leilk,
> 
> with this change, you are excluding this code from MT2712: is that
> intentional?
> If it is, then this should reside in a different commit with a Fixes
> tag, also explaining the reason for not setting the tick delay on
> that SoC.
It's different for MT2712 and the other ICs for tick delay. I'll send a
patch with fixes tag, thanks

> 
> Also, please don't remove the /* tick delay */ comment.
> 
OK, I'll fix it,thanks

> Regards,
> Angelo
> 
> > +	if (mdata->dev_comp->enhance_timing) {
> > +		if (mdata->dev_comp->ipm_design) {
> > +			reg_val = readl(mdata->base + SPI_CMD_REG);
> > +			reg_val &= ~SPI_CMD_IPM_GET_TICKDLY_MASK;
> > +			reg_val |= ((chip_config->tick_delay & 0x7)
> > +				   << SPI_CMD_IPM_GET_TICKDLY_OFFSET);
> > +			writel(reg_val, mdata->base + SPI_CMD_REG);
> > +		} else {
> > +			reg_val = readl(mdata->base + SPI_CFG1_REG);
> > +			reg_val &= ~SPI_CFG1_GET_TICK_DLY_MASK;
> > +			reg_val |= ((chip_config->tick_delay & 0x7)
> > +				<< SPI_CFG1_GET_TICK_DLY_OFFSET);
> > +			writel(reg_val, mdata->base + SPI_CFG1_REG);
> > +		}
> > +	}
> >   
> >   	/* set hw cs timing */
> >   	mtk_spi_set_hw_cs_timing(spi);
> >   	return 0;
> >   }
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
