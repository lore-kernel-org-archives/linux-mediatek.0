Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCECC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 03:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0PEyfI3l4ntm/8JftXIHxUdEguz9nq/eb6wjtkVk28=; b=tej6n1aiLgPKL2
	Ma4u+dow3QEGl6yK1S7s7j2jpI5ZN/tLWx3/31dA6y+kYkzTdDbhftVMMsUTR3iVAafxOsaY1ASUu
	K3jKZcy6YiNBQMpJp+8KqOnTmq/ccyk6m5lGHRZI+Qd6HWxs8+OaVT7/FgtVsYC33wolOi2sN8cfG
	E+CZtGyC+jSolVgIZDPDHFUntrCQ0rIDX13LrzwyjnyF7SWULokKHiEwIMyiyQXcuEL1aegmccTlp
	wAGTeLoCm6d2Dn2/E/hVBqfNPLqbZ2VxRcUB2mIWsg8M9fH1riDIOTk726Jfc6IjYVA8zHST7SzDh
	ggKr0JYKS11iDX9GK3gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCCiY-006Mzv-6I; Tue, 25 Jan 2022 03:42:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCCiT-006MyY-OC; Tue, 25 Jan 2022 03:42:00 +0000
X-UUID: cf3367717a954cd1894c34fcb004598d-20220124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=U0kZFj5CncSUXqA6PCT1UVAuAbHSO4+zzopSsr1NulE=; 
 b=ogrDq4O7UYvaNEQtdMTGCkcGRQAgmUUBizd7WQA2Q+FySUG7sNHKo2f54lKRjxBlUl52b540C8exh6DfnyDvrlY3XtEj6bckx/KwQ3T4kEwUSNP5R7PEepW5Lxu2BL7/8f99ittJTdSEcbuuUrCI6XdWEZW5QMYuaMXhyaAg0B8=;
X-UUID: cf3367717a954cd1894c34fcb004598d-20220124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chaotian.jing@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 350028150; Mon, 24 Jan 2022 20:41:53 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Jan 2022 19:33:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 11:33:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 11:33:35 +0800
Message-ID: <f66964a5afd960fee6a2fecaf74fa902bb76a8d9.camel@mediatek.com>
Subject: Re: [PATCH] mmc: mediatek: Add cmd polling mode
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: Derong Liu <derong.liu@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <wsp_upstream@mediatek.com>, Peng Zhou <peng.zhou@mediatek.com>
Date: Tue, 25 Jan 2022 11:33:35 +0800
In-Reply-To: <20220124121814.17452-1-derong.liu@mediatek.com>
References: <20220124121814.17452-1-derong.liu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_194159_205054_2188B6AE 
X-CRM114-Status: GOOD (  32.55  )
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

On Mon, 2022-01-24 at 20:18 +0800, Derong Liu wrote:
> We found sdcard can gain more read/write performance
> when using cmd polling mode instead of interrupt mode, in the
> meantime,
> there are much more devices have equipped with high frequency cpu,
> so it is necessary to support cmd polling mode.
> 
Hi, I think you have not found the root cause of performace drop. if
the sdcard read/write performance is 100MB/s, which means that it can
complete 512KB of data xfer within 5ms, and if performance drop is 5%,
then means that your interrupt mode will take more than 250us.
Is it possible to clarify if the interrupt mode really takes 250us?

And, if you find that the polling mode is readlly fast then interrupt
mode and has no side effect(ie. cpu loading issue), then, We will drop
the interrupt mode of waiting response.
> Signed-off-by: Derong Liu <derong.liu@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 92 +++++++++++++++++++++++++++++++++++
> ----
>  1 file changed, 83 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 65037e1d7723..612f5115ca4b 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -465,6 +465,7 @@ struct msdc_host {
>  	bool hs400_tuning;	/* hs400 mode online tuning */
>  	bool internal_cd;	/* Use internal card-detect logic */
>  	bool cqhci;		/* support eMMC hw cmdq */
> +	bool cmd_polling_mode;	/* support cmd polling mode */
>  	struct msdc_save_para save_para; /* used when gate HCLK */
>  	struct msdc_tune_para def_tune_para; /* default tune setting */
>  	struct msdc_tune_para saved_tune_para; /* tune result of
> CMD21/CMD19 */
> @@ -1250,6 +1251,63 @@ static inline bool msdc_cmd_is_ready(struct
> msdc_host *host,
>  	return true;
>  }
>  
> +static inline int use_cmd_polling_mode(struct msdc_host *host,
> +	struct mmc_command *cmd)
> +{
> +	/* R1B use interrupt mode */
> +	return (host->cmd_polling_mode &&
> +			((mmc_from_priv(host))->caps2 &
> MMC_CAP2_NO_SDIO) &&
> +			(mmc_resp_type(cmd) != MMC_RSP_R1B));
> +}
> +
> +static bool msdc_command_resp_polling(struct msdc_host *host,
> +	struct mmc_request *mrq, struct mmc_command *cmd,
> +	unsigned long timeout)
> +{
> +	bool ret = false;
> +	unsigned long tmo;
> +	int events;
> +	unsigned long flags;
> +
> +	if (!use_cmd_polling_mode(host, cmd))
> +		goto exit;
> +
> +retry:
> +	tmo = jiffies + timeout;
> +	while (1) {
> +		spin_lock_irqsave(&host->lock, flags);
why need spin lock ? if there are no SDIO device irq, then there is no
race conditon of access MSDC register.
> +		events = readl(host->base + MSDC_INT);
> +		if (events & cmd_ints_mask) {
> +			/* clear all int flag */
> +			events &= cmd_ints_mask;
> +			writel(events, host->base + MSDC_INT);
> +			spin_unlock_irqrestore(&host->lock, flags);
> +			break;
> +		}
> +		spin_unlock_irqrestore(&host->lock, flags);
> +
> +		if (time_after(jiffies, tmo) &&
> +			((events & cmd_ints_mask) == 0)) {
> +			dev_info(host->dev, "[%s]: CMD<%d>
> polling_for_completion timeout ARG<0x%.8x>\n",
> +				__func__, cmd->opcode, cmd->arg);
> +			ret = msdc_cmd_done(host, MSDC_INT_CMDTMO, mrq,
> cmd);
> +			goto exit;
> +		}
> +	}
> +
> +	if (cmd) {
> +		ret = msdc_cmd_done(host, events, mrq, cmd);
> +		/* if only autocmd23 done,
> +		 * it needs to polling the continue read/write cmd
> directly.
> +		 */
> +		if (!ret)
> +			goto retry;
> +	}
> +
> +exit:
> +	return ret;
> +}
> +
>  static void msdc_start_command(struct msdc_host *host,
>  		struct mmc_request *mrq, struct mmc_command *cmd)
>  {
> @@ -1273,7 +1331,10 @@ static void msdc_start_command(struct
> msdc_host *host,
>  	rawcmd = msdc_cmd_prepare_raw_cmd(host, mrq, cmd);
>  
>  	spin_lock_irqsave(&host->lock, flags);
> -	sdr_set_bits(host->base + MSDC_INTEN, cmd_ints_mask);
> +	if (use_cmd_polling_mode(host, cmd))
> +		sdr_clr_bits(host->base + MSDC_INTEN, cmd_ints_mask);
> +	else
> +		sdr_set_bits(host->base + MSDC_INTEN, cmd_ints_mask);
>  	spin_unlock_irqrestore(&host->lock, flags);
>  
>  	writel(cmd->arg, host->base + SDC_ARG);
> @@ -1290,9 +1351,11 @@ static void msdc_cmd_next(struct msdc_host
> *host,
>  	       host->hs400_tuning))) ||
>  	    (mrq->sbc && mrq->sbc->error))
>  		msdc_request_done(host, mrq);
> -	else if (cmd == mrq->sbc)
> +	else if (cmd == mrq->sbc) {
>  		msdc_start_command(host, mrq, mrq->cmd);
> -	else if (!cmd->data)
> +		msdc_command_resp_polling(host, mrq,
> +				mrq->cmd, CMD_TIMEOUT);
> +	} else if (!cmd->data)
>  		msdc_request_done(host, mrq);
>  	else
>  		msdc_start_data(host, cmd, cmd->data);
> @@ -1314,10 +1377,15 @@ static void msdc_ops_request(struct mmc_host
> *mmc, struct mmc_request *mrq)
>  	 * use HW option,  otherwise use SW option
>  	 */
>  	if (mrq->sbc && (!mmc_card_mmc(mmc->card) ||
> -	    (mrq->sbc->arg & 0xFFFF0000)))
> +	    (mrq->sbc->arg & 0xFFFF0000))) {
>  		msdc_start_command(host, mrq, mrq->sbc);
> -	else
> +		msdc_command_resp_polling(host, mrq,
> +				mrq->sbc, CMD_TIMEOUT);
> +	} else {
>  		msdc_start_command(host, mrq, mrq->cmd);
> +		msdc_command_resp_polling(host, mrq,
> +				mrq->cmd, CMD_TIMEOUT);
> +	}
>  }
>  
>  static void msdc_pre_req(struct mmc_host *mmc, struct mmc_request
> *mrq)
> @@ -1350,9 +1418,11 @@ static void msdc_post_req(struct mmc_host
> *mmc, struct mmc_request *mrq,
>  static void msdc_data_xfer_next(struct msdc_host *host, struct
> mmc_request *mrq)
>  {
>  	if (mmc_op_multi(mrq->cmd->opcode) && mrq->stop && !mrq->stop-
> >error &&
> -	    !mrq->sbc)
> +	    !mrq->sbc) {
>  		msdc_start_command(host, mrq, mrq->stop);
> -	else
> +		msdc_command_resp_polling(host, mrq,
> +				mrq->stop, CMD_TIMEOUT);
> +	} else
>  		msdc_request_done(host, mrq);
>  }
>  
> @@ -2492,11 +2562,15 @@ static void msdc_of_property_parse(struct
> platform_device *pdev,
>  	else
>  		host->hs400_cmd_resp_sel_rising = false;
>  
> -	if (of_property_read_bool(pdev->dev.of_node,
> -				  "supports-cqe"))
> +	if (of_property_read_bool(pdev->dev.of_node, "supports-cqe"))
>  		host->cqhci = true;
>  	else
>  		host->cqhci = false;
> +
> +	if (of_property_read_bool(pdev->dev.of_node, "mediatek,cmd-
> polling-mode"))
> +		host->cmd_polling_mode = true;
> +	else
> +		host->cmd_polling_mode = false;
>  }
>  
>  static int msdc_of_clock_parse(struct platform_device *pdev,
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
