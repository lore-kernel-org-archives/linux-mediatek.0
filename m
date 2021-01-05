Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB22C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 07:57:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CFF422257
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 07:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CFF422257
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZRl/Lje24dC9VfXZL+PWTNyaweafFQKkGmHKhXyuFB0=; b=jPbk02ool1Dy7GEtJFcnqCLig
	URNYgHflZ+yQOugKWcYAJx68MUsPtZnGMdggn39IxtaRQkH94W/xlePy/txj4OEhg/JBQBTvIj+7M
	Z8HWkeNaruIjX3z3qhIGEZC6MI6MR5FEin80YiTAH9mU3CwMBG6EyvLquQ8qnTi1xCVhIUgnFIjRc
	Yzfm3mP0S4yVqyJ9948Xl1WcgCFF31AR8JdLIA9tN4g/df2No8fJxSWhBAXfYnfp10wwyniwec/fM
	KtIWdAdqAmT3detv6C6LD8+Cn/1u/pG03G1Eyq3z/xHOftuJpajAZq3DhmSVAJLzc+dTsxzSHMtlW
	pJM4Pue4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwhDr-0005HC-Bl; Tue, 05 Jan 2021 07:57:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwhDl-0005Fo-5V; Tue, 05 Jan 2021 07:57:38 +0000
X-UUID: 8af69127f988427a9de609c489655a75-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=alttxq7q6iGfrC+7iONqjpwCXGJBquHvAjOcL0wKqZI=; 
 b=onukzJGuiN49fT+UY0dEmQFopxqL7ZmaYkgOzsdt5y2+ZRtaMwH10YpuFoLTCQKsrSDeDBMtnvs3hxBRCZzLoGdl6Q1F7tP/7+1lZlrUaaNa6h8xzrim8rwtcRqLVxroY4XF+OPVQmd8bT7UKhOZdzd++nljOctVteeYWo9I8kQ=;
X-UUID: 8af69127f988427a9de609c489655a75-20210104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 879525351; Mon, 04 Jan 2021 23:57:28 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 23:57:26 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 5 Jan 2021 15:57:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jan 2021 15:57:20 +0800
Message-ID: <1609833440.28292.7.camel@mhfsdcap03>
Subject: Re: [PATCH v1 1/1] spi: spi-mt65xx: add cs timing support
From: Leilk.Liu <leilk.liu@mediatek.com>
To: <Mason.Zhang@mediatek.com>
Date: Tue, 5 Jan 2021 15:57:20 +0800
In-Reply-To: <20201231095753.426-2-Mason.Zhang@mediatek.com>
References: <20201231095753.426-1-Mason.Zhang@mediatek.com>
 <20201231095753.426-2-Mason.Zhang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 959F2E033833FD798A1199AC7168CD7C855A4F654E0F3522F71D820DE95B9CF12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_025737_408273_D21B4ED8 
X-CRM114-Status: GOOD (  19.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-spi@vger.kernel.org, luhua.xu@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Mason.Zhang@ubuntu, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-31 at 17:57 +0800, Mason.Zhang@mediatek.com wrote:
> From: mtk22786 <Mason.Zhang@mediatek.com>
> 
> spi user can set cs_setup, cs_hold, cs_inactive by call function:
> spi_set_cs_timing. If user have not call this, spi master will use
> default cs timing.
> 
> Change-Id: I0189bab9a066d384e1f265846dac46816bf4561c
> Signed-off-by: Mason.Zhang
> ---
>  drivers/spi/spi-mt65xx.c | 74 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 63 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 5d643051bf3d..23d94eb9a465 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -284,11 +284,38 @@ static void mtk_spi_set_cs(struct spi_device *spi, bool enable)
>  	}
>  }
>  
> +static int mtk_set_cs_timing(struct spi_device *spi,
> +			struct spi_delay *setup,
> +			struct spi_delay *hold,
> +			struct spi_delay *inactive)
> +{
> +	u32 len = sizeof(struct spi_delay);
> +
> +	if (setup)
> +		memcpy(&spi->controller->cs_setup, setup, len);
> +	else
> +		memset(&spi->controller->cs_setup, 0, len);
> +
> +	if (hold)
> +		memcpy(&spi->controller->cs_hold, hold, len);
> +	else
> +		memset(&spi->controller->cs_hold, 0, len);
> +
> +	if (inactive)
> +		memcpy(&spi->controller->cs_inactive, inactive, len);
> +	else
> +		memset(&spi->controller->cs_inactive, 0, len);
> +
> +	return 0;
> +}
> +
>  static void mtk_spi_prepare_transfer(struct spi_master *master,
> -				     struct spi_transfer *xfer)
> +			struct spi_transfer *xfer, struct spi_device *spi)
>  {
> -	u32 spi_clk_hz, div, sck_time, cs_time, reg_val;
> +	u32 spi_clk_hz, div, sck_time, cs_time, reg_val, delay = 0;
>  	struct mtk_spi *mdata = spi_master_get_devdata(master);
> +	u32 cs_setuptime, cs_holdtime, cs_idletime = 0;
> +	u32 clk_period_ns = 0;
>  
>  	spi_clk_hz = clk_get_rate(mdata->spi_clk);
>  	if (xfer->speed_hz < spi_clk_hz / 2)
> @@ -297,31 +324,55 @@ static void mtk_spi_prepare_transfer(struct spi_master *master,
>  		div = 1;
>  
>  	sck_time = (div + 1) / 2;
> +	/* set default cs timing */
>  	cs_time = sck_time * 2;
>  
> +	clk_period_ns = 1000000000 / xfer->speed_hz;
> +
> +	delay = spi_delay_to_ns(&master->cs_setup, xfer);
> +	cs_setuptime = delay / clk_period_ns;
> +
> +	delay = spi_delay_to_ns(&master->cs_hold, xfer);
> +	cs_holdtime = delay / clk_period_ns;
> +
> +	delay = spi_delay_to_ns(&master->cs_inactive, xfer);
> +	cs_idletime = delay / clk_period_ns;
> +
> +	if (cs_setuptime < cs_time)
> +		cs_setuptime = cs_time;
> +
> +	if (cs_holdtime < cs_time)
> +		cs_holdtime = cs_time;
> +
> +	if (cs_idletime < cs_time)
> +		cs_idletime = cs_time;
> +
>  	if (mdata->dev_comp->enhance_timing) {
>  		reg_val = (((sck_time - 1) & 0xffff)
>  			   << SPI_CFG2_SCK_HIGH_OFFSET);
>  		reg_val |= (((sck_time - 1) & 0xffff)
>  			   << SPI_CFG2_SCK_LOW_OFFSET);
>  		writel(reg_val, mdata->base + SPI_CFG2_REG);
> -		reg_val = (((cs_time - 1) & 0xffff)
> +		reg_val = (((cs_holdtime - 1) & 0xffff)
>  			   << SPI_ADJUST_CFG0_CS_HOLD_OFFSET);
> -		reg_val |= (((cs_time - 1) & 0xffff)
> +		reg_val |= (((cs_setuptime - 1) & 0xffff)
>  			   << SPI_ADJUST_CFG0_CS_SETUP_OFFSET);
>  		writel(reg_val, mdata->base + SPI_CFG0_REG);
>  	} else {
>  		reg_val = (((sck_time - 1) & 0xff)
> -			   << SPI_CFG0_SCK_HIGH_OFFSET);
> -		reg_val |= (((sck_time - 1) & 0xff) << SPI_CFG0_SCK_LOW_OFFSET);
> -		reg_val |= (((cs_time - 1) & 0xff) << SPI_CFG0_CS_HOLD_OFFSET);
> -		reg_val |= (((cs_time - 1) & 0xff) << SPI_CFG0_CS_SETUP_OFFSET);
> +				<< SPI_CFG0_SCK_HIGH_OFFSET);
> +		reg_val |= (((sck_time - 1) & 0xff)
> +				<< SPI_CFG0_SCK_LOW_OFFSET);
> +		reg_val |= (((cs_holdtime - 1) & 0xff)
> +				<< SPI_CFG0_CS_HOLD_OFFSET);
> +		reg_val |= (((cs_setuptime - 1) & 0xff)
> +				<< SPI_CFG0_CS_SETUP_OFFSET);
>  		writel(reg_val, mdata->base + SPI_CFG0_REG);
>  	}
>  
>  	reg_val = readl(mdata->base + SPI_CFG1_REG);
>  	reg_val &= ~SPI_CFG1_CS_IDLE_MASK;
> -	reg_val |= (((cs_time - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
> +	reg_val |= (((cs_idletime - 1) & 0xff) << SPI_CFG1_CS_IDLE_OFFSET);
>  	writel(reg_val, mdata->base + SPI_CFG1_REG);
>  }
>  
> @@ -430,7 +481,7 @@ static int mtk_spi_fifo_transfer(struct spi_master *master,
>  	mdata->cur_transfer = xfer;
>  	mdata->xfer_len = min(MTK_SPI_MAX_FIFO_SIZE, xfer->len);
>  	mdata->num_xfered = 0;
> -	mtk_spi_prepare_transfer(master, xfer);
> +	mtk_spi_prepare_transfer(master, xfer, spi);
>  	mtk_spi_setup_packet(master);
>  
>  	cnt = xfer->len / 4;
> @@ -462,7 +513,7 @@ static int mtk_spi_dma_transfer(struct spi_master *master,
>  	mdata->cur_transfer = xfer;
>  	mdata->num_xfered = 0;
>  
> -	mtk_spi_prepare_transfer(master, xfer);
> +	mtk_spi_prepare_transfer(master, xfer, spi);
>  
>  	cmd = readl(mdata->base + SPI_CMD_REG);
>  	if (xfer->tx_buf)
> @@ -644,6 +695,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
>  	master->transfer_one = mtk_spi_transfer_one;
>  	master->can_dma = mtk_spi_can_dma;
>  	master->setup = mtk_spi_setup;
> +	master->set_cs_timing = mtk_set_cs_timing;
while add set_cs_timing callback, this driver can't support multiple
devices on one bus(use "cs-gpios" property) with gpio cs timing.

>  
>  	of_id = of_match_node(mtk_spi_of_match, pdev->dev.of_node);
>  	if (!of_id) {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
