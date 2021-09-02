Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0A2C4320E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:16:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E3E61041
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 06:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3E3E61041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvCyQJ/+DQEEeK70N0ZVpRXquSewe+ggzn0MJYN83m0=; b=SnZMdr+auNhkD2
	jN1Iz0Nmo2lMqefzF00m3BCOYzRz/mrGssrLj+zcAwQ35ybJRf9z+/Feqb/dlohR5lCBfFyS+udoI
	3GO1+oB77nS+U67RDus8UGR04cJBtY62nJhzOqYiCX7l3biT7ZJxt319CKmKb4o0WxrcnWuk7MedY
	oT7cQJPiADPhXqMWoQw0G8DBEYxIQ4hJ8hzUHB5y2yEnIjlIMt64SO8xZQ2IqyqJFDUBGnN+g2OPc
	QEiRnKz4frcqXGDEStUr6RfOFVTa1AWENQ7te6Vhg7DGknootblGag/XNW1wNNdTIFBq4nMrMfa1G
	7Fjpaup+e6BjdFiW4pCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLg0t-008gMo-N4; Thu, 02 Sep 2021 06:15:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLg0l-008gLe-SP; Thu, 02 Sep 2021 06:15:49 +0000
X-UUID: 608bbe09399942db98cf62151bc8b310-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Sauw7Ff3VCsBfO7Xjltt8yo8oYzrSGE/ZQoS3qooMFE=; 
 b=PsPv4aMmiD3NmlRoH3X5BPiXzs1kodvn2ddSQeVRwXUPZ1DJw0n5wuJ6vap/zbCJ3Cm+lRPOsD39Kod/ceX2wmvual2/1Ys9w2MC5e96rXCNi5KgGCIwG0DFyMB1+3mnOJtby3mi5xv3PI+E4PS0aTiuhlZtVzP8akeWuNF6H2g=;
X-UUID: 608bbe09399942db98cf62151bc8b310-20210901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chaotian.jing@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1631624352; Wed, 01 Sep 2021 23:15:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 23:07:21 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 2 Sep 2021 14:07:19 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 14:07:18 +0800
Message-ID: <6d6dd9a7ae090ad4601938261de120e6dba6ac11.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] mmc: mediatek: Add HS400 online tuning support
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Avri Altman <avri.altman@wdc.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Yue Hu <huyue2@yulong.com>, Bean Huo <beanhuo@micron.com>, Adrian Hunter
 <adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 2 Sep 2021 14:07:19 +0800
In-Reply-To: <1630547557-1573-3-git-send-email-wenbin.mei@mediatek.com>
References: <1630547557-1573-1-git-send-email-wenbin.mei@mediatek.com>
 <1630547557-1573-3-git-send-email-wenbin.mei@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_231543_995275_3825DF99 
X-CRM114-Status: GOOD (  32.17  )
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

On Thu, 2021-09-02 at 09:52 +0800, Wenbin Mei wrote:
> Due to the influence of the corner IC and vcore voltage, for the
> stability
> of HS400 mode, we Add HS400 mode online tuning support for mediatek
> mmc
> host.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
  Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
> ---
>  drivers/mmc/core/mmc.c    |   8 ++++
>  drivers/mmc/host/mtk-sd.c | 118
> +++++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/mmc/host.h  |   3 ++
>  3 files changed, 127 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 838726b..0aa72ac 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1222,6 +1222,14 @@ static int mmc_select_hs400(struct mmc_card
> *card)
>  	mmc_set_timing(host, MMC_TIMING_MMC_HS400);
>  	mmc_set_bus_speed(card);
>  
> +	if (host->ops->execute_hs400_tuning) {
> +		mmc_retune_disable(host);
> +		err = host->ops->execute_hs400_tuning(host, card);
> +		mmc_retune_enable(host);
> +		if (err)
> +			goto out_err;
> +	}
> +
>  	if (host->ops->hs400_complete)
>  		host->ops->hs400_complete(host);
>  
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4dfc246..484f5c3 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -258,6 +258,7 @@
>  #define MSDC_PAD_TUNE_RD_SEL	  (0x1 << 13)   /* RW */
>  #define MSDC_PAD_TUNE_CMD_SEL	  (0x1 << 21)   /* RW */
>  
> +#define PAD_DS_TUNE_DLY_SEL       (0x1 << 0)	/* RW */
>  #define PAD_DS_TUNE_DLY1	  (0x1f << 2)   /* RW */
>  #define PAD_DS_TUNE_DLY2	  (0x1f << 7)   /* RW */
>  #define PAD_DS_TUNE_DLY3	  (0x1f << 12)  /* RW */
> @@ -301,6 +302,11 @@
>  #define PAD_CMD_RD_RXDLY_SEL    (0x1 << 11)     /* RW */
>  #define PAD_CMD_TX_DLY          (0x1f << 12)    /* RW */
>  
> +/* EMMC50_PAD_DS_TUNE mask */
> +#define PAD_DS_DLY_SEL		(0x1 << 16)	/* RW */
> +#define PAD_DS_DLY1		(0x1f << 10)	/* RW */
> +#define PAD_DS_DLY3		(0x1f << 0)	/* RW */
> +
>  #define REQ_CMD_EIO  (0x1 << 0)
>  #define REQ_CMD_TMO  (0x1 << 1)
>  #define REQ_DAT_ERR  (0x1 << 2)
> @@ -448,11 +454,13 @@ struct msdc_host {
>  	bool vqmmc_enabled;
>  	u32 latch_ck;
>  	u32 hs400_ds_delay;
> +	u32 hs400_ds_dly3;
>  	u32 hs200_cmd_int_delay; /* cmd internal delay for HS200/SDR104
> */
>  	u32 hs400_cmd_int_delay; /* cmd internal delay for HS400 */
>  	bool hs400_cmd_resp_sel_rising;
>  				 /* cmd response sample selection for
> HS400 */
>  	bool hs400_mode;	/* current eMMC will run at hs400 mode */
> +	bool hs400_tuning;	/* hs400 mode online tuning */
>  	bool internal_cd;	/* Use internal card-detect logic */
>  	bool cqhci;		/* support eMMC hw cmdq */
>  	struct msdc_save_para save_para; /* used when gate HCLK */
> @@ -1190,7 +1198,8 @@ static bool msdc_cmd_done(struct msdc_host
> *host, int events,
>  	if (!sbc_error && !(events & MSDC_INT_CMDRDY)) {
>  		if (events & MSDC_INT_CMDTMO ||
>  		    (cmd->opcode != MMC_SEND_TUNING_BLOCK &&
> -		     cmd->opcode != MMC_SEND_TUNING_BLOCK_HS200))
> +		     cmd->opcode != MMC_SEND_TUNING_BLOCK_HS200 &&
> +		     !host->hs400_tuning))
>  			/*
>  			 * should not clear fifo/interrupt as the tune
> data
>  			 * may have alreay come when cmd19/cmd21 gets
> response
> @@ -1287,7 +1296,8 @@ static void msdc_cmd_next(struct msdc_host
> *host,
>  	if ((cmd->error &&
>  	    !(cmd->error == -EILSEQ &&
>  	      (cmd->opcode == MMC_SEND_TUNING_BLOCK ||
> -	       cmd->opcode == MMC_SEND_TUNING_BLOCK_HS200))) ||
> +	       cmd->opcode == MMC_SEND_TUNING_BLOCK_HS200 ||
> +	       host->hs400_tuning))) ||
>  	    (mrq->sbc && mrq->sbc->error))
>  		msdc_request_done(host, mrq);
>  	else if (cmd == mrq->sbc)
> @@ -2251,6 +2261,106 @@ static int msdc_prepare_hs400_tuning(struct
> mmc_host *mmc, struct mmc_ios *ios)
>  	return 0;
>  }
>  
> +static int msdc_send_cxd_data(struct mmc_card *card, struct mmc_host
> *host)
> +{
> +	struct mmc_request mrq = {};
> +	struct mmc_command cmd = {};
> +	struct mmc_data data = {};
> +	unsigned int len = 512;
> +	struct scatterlist sg;
> +	u8 *ext_csd;
> +
> +	ext_csd = kzalloc(len, GFP_KERNEL);
> +	if (!ext_csd)
> +		return -ENOMEM;
> +
> +	mrq.cmd = &cmd;
> +	mrq.data = &data;
> +
> +	cmd.opcode = MMC_SEND_EXT_CSD;
> +	cmd.arg = 0;
> +	cmd.flags = MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_ADTC;
> +
> +	data.blksz = len;
> +	data.blocks = 1;
> +	data.flags = MMC_DATA_READ;
> +	data.sg = &sg;
> +	data.sg_len = 1;
> +
> +	sg_init_one(&sg, ext_csd, len);
> +	mmc_set_data_timeout(&data, card);
> +	mmc_wait_for_req(host, &mrq);
> +
> +	kfree(ext_csd);
> +
> +	if (cmd.error)
> +		return cmd.error;
> +	if (data.error)
> +		return data.error;
> +
> +	return 0;
> +}
> +
> +static int msdc_execute_hs400_tuning(struct mmc_host *mmc, struct
> mmc_card *card)
> +{
> +	struct msdc_host *host = mmc_priv(mmc);
> +	struct msdc_delay_phase dly1_delay;
> +	u32 val, result_dly1 = 0;
> +	int i, ret;
> +
> +	if (host->top_base) {
> +		sdr_set_bits(host->top_base + EMMC50_PAD_DS_TUNE,
> +			     PAD_DS_DLY_SEL);
> +		if (host->hs400_ds_dly3)
> +			sdr_set_field(host->top_base +
> EMMC50_PAD_DS_TUNE,
> +				      PAD_DS_DLY3, host-
> >hs400_ds_dly3);
> +	} else {
> +		sdr_set_bits(host->base + PAD_DS_TUNE,
> PAD_DS_TUNE_DLY_SEL);
> +		if (host->hs400_ds_dly3)
> +			sdr_set_field(host->base + PAD_DS_TUNE,
> +				      PAD_DS_TUNE_DLY3, host-
> >hs400_ds_dly3);
> +	}
> +
> +	host->hs400_tuning = true;
> +	for (i = 0; i < PAD_DELAY_MAX; i++) {
> +		if (host->top_base)
> +			sdr_set_field(host->top_base +
> EMMC50_PAD_DS_TUNE,
> +				      PAD_DS_DLY1, i);
> +		else
> +			sdr_set_field(host->base + PAD_DS_TUNE,
> +				      PAD_DS_TUNE_DLY1, i);
> +		ret = msdc_send_cxd_data(card, mmc);
> +		if (!ret)
> +			result_dly1 |= (1 << i);
> +	}
> +	host->hs400_tuning = false;
> +
> +	dly1_delay = get_best_delay(host, result_dly1);
> +	if (dly1_delay.maxlen == 0) {
> +		dev_err(host->dev, "Failed to get DLY1 delay!\n");
> +		goto fail;
> +	}
> +	if (host->top_base)
> +		sdr_set_field(host->top_base + EMMC50_PAD_DS_TUNE,
> +			      PAD_DS_DLY1, dly1_delay.final_phase);
> +	else
> +		sdr_set_field(host->base + PAD_DS_TUNE,
> +			      PAD_DS_TUNE_DLY1,
> dly1_delay.final_phase);
> +
> +	if (host->top_base)
> +		val = readl(host->top_base + EMMC50_PAD_DS_TUNE);
> +	else
> +		val = readl(host->base + PAD_DS_TUNE);
> +
> +	dev_info(host->dev, "Fianl PAD_DS_TUNE: 0x%x\n", val);
> +
> +	return 0;
> +
> +fail:
> +	dev_err(host->dev, "Failed to tuning DS pin delay!\n");
> +	return -EIO;
> +}
> +
>  static void msdc_hw_reset(struct mmc_host *mmc)
>  {
>  	struct msdc_host *host = mmc_priv(mmc);
> @@ -2377,6 +2487,7 @@ static void msdc_cqe_post_disable(struct
> mmc_host *mmc)
>  	.card_busy = msdc_card_busy,
>  	.execute_tuning = msdc_execute_tuning,
>  	.prepare_hs400_tuning = msdc_prepare_hs400_tuning,
> +	.execute_hs400_tuning = msdc_execute_hs400_tuning,
>  	.hw_reset = msdc_hw_reset,
>  };
>  
> @@ -2396,6 +2507,9 @@ static void msdc_of_property_parse(struct
> platform_device *pdev,
>  	of_property_read_u32(pdev->dev.of_node, "hs400-ds-delay",
>  			     &host->hs400_ds_delay);
>  
> +	of_property_read_u32(pdev->dev.of_node, "mediatek,hs400-ds-
> dly3",
> +			     &host->hs400_ds_dly3);
> +
>  	of_property_read_u32(pdev->dev.of_node, "mediatek,hs200-cmd-
> int-delay",
>  			     &host->hs200_cmd_int_delay);
>  
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index ff1a251..7552d5e 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -162,6 +162,9 @@ struct mmc_host_ops {
>  	/* Prepare HS400 target operating frequency depending host
> driver */
>  	int	(*prepare_hs400_tuning)(struct mmc_host *host, struct
> mmc_ios *ios);
>  
> +	/* Execute HS400 tuning depending host driver */
> +	int	(*execute_hs400_tuning)(struct mmc_host *host, struct
> mmc_card *card);
> +
>  	/* Prepare switch to DDR during the HS400 init sequence */
>  	int	(*hs400_prepare_ddr)(struct mmc_host *host);
>  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
