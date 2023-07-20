Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA36C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 07:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiM5G/vWoCFuSUz05jwBQs1wGEmSe48LHLWrvJxAhdM=; b=OIf6ZygK0gVDdWYOF932c8GB9O
	AkO3ZgEC//2A0fZNUD8L0ZT7Pr21rcQo0nIj0PlzMm+4lFR2mUFbRIScq2EhaXF7KKPnWiaipX1/J
	y2FXi+5F8UOnhyT0t36sfHQpxgu/Num4uWXxZu+3QxtiEnlJuUk++iqKgNIpmP7msXuPu95bs+AXl
	Y9edAiHNm/xSEv41yPhJ5mT1omYwX8Y2rqIp3V9SNDhdPWpAozeC3bc84Qjttzqfyvw7MYeO/bQrC
	NGmUsW2KcoyEMIdH3ZlAZClONa3ZguVS+nBpEhluwUBfsGnnX1rVucvEMXNSV6Id/usa6OlpUgnN/
	q4/5TVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMODO-00A8jn-00;
	Thu, 20 Jul 2023 07:36:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMODJ-00A8ht-1Q;
	Thu, 20 Jul 2023 07:36:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0295B660707E;
	Thu, 20 Jul 2023 08:36:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689838594;
	bh=EHO0w35l8NQ29Dy6jUug8m14qN9BbaA/sjfaaS9DRHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ey1mpn+D5WJdff2GbBxnPkeu91VevPg2abGmtt4grVCABRjJ+QIOmvsJsxIsfPR2C
	 3YLzuhRviPK3OrkvT8Pt4EUveWJu4z2qp9TI3Jrt1T5AiZGw4gbWD/5Q/PcYIrPNyL
	 Viax40SSaSw2WqNxnJPSvUCOqFpUvp4Jz0uKDelfOovwqZy68gG1wiUVM2y9PCWY7P
	 RwVcHu8p7jStFGqJj9EifRMUZ+HbdldlbRIDG6Gdg+rKhF74e/4zshRxmCqJ12x6ik
	 yFPCyweKrvuexT7StjaYi5NXY1hq0Y/I+ziw7/Hl4XpPH0j5nQ9Opx6/RqeYCHTWSx
	 Tcu1E9RHjL5lQ==
Message-ID: <206b8e55-184e-7cea-4424-4eecfd0ec189@collabora.com>
Date: Thu, 20 Jul 2023 09:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] spmi: mtk-pmif: Serialize PMIF status check and
 command submission
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 James Lo <james.lo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@google.com>
References: <20230719192319.252617-1-nfraprado@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719192319.252617-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_003641_784547_D39729AD 
X-CRM114-Status: GOOD (  38.83  )
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

Il 19/07/23 21:23, Nícolas F. R. A. Prado ha scritto:
> Before writing the read or write command to the SPMI arbiter through the
> PMIF interface, the current status of the channel is checked to ensure
> it is idle. However, since the status only changes from idle when the
> command is written, it is possible for two concurrent calls to determine
> that the channel is idle and simultaneously send their commands. At this
> point the PMIF interface hangs, with the status register no longer being
> updated, and thus causing all subsequent operations to time out.
> 
> This was observed on the mt8195-cherry-tomato-r2 machine, particularly
> after commit 46600ab142f8 ("regulator: Set PROBE_PREFER_ASYNCHRONOUS for
> drivers between 5.10 and 5.15") was applied, since then the two MT6315
> devices present on the SPMI bus would probe assynchronously and
> sometimes (during probe or at a later point) read the bus
> simultaneously, breaking the PMIF interface and consequently slowing
> down the whole system.
> 
> To fix the issue at its root cause, introduce locking around the channel
> status check and the command write, so that both become an atomic
> operation, preventing race conditions between two (or more) SPMI bus
> read/write operations. A spinlock is used since this is a fast bus, as
> indicated by the usage of the atomic variant of readl_poll, and
> '.fast_io = true' being used in the mt6315 driver, so spinlocks are
> already used for the regmap access.
> 
> Fixes: b45b3ccef8c0 ("spmi: mediatek: Add support for MT6873/8192")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Sorry for pointing that out in a second review, but this just came to mind...
...better late than never, right?

Instead of spinlock_t, we should use raw_spinlock_t: on non-PREEMPT_RT kernels,
spinlocks are mapped to raw spinlocks but, on PREEMPT_RT, those have a different
implementation that's giving a lot of overhead, being based on rtmutex.

If we use raw_spinlock_t we can avoid that kind of overhead in PREEMPT_RT
configurations.

Can you please switch to raw_spinlock_xxxx?

There's also another comment, check below.

> ---
> 
> Changes in v2:
> - Added missing spin_unlocks to error paths
> - Moved memcpy outside spinlock region in the write_cmd function
> - Reworded commit message to make clear that issue can happen at any
>    point in runtime, not only during boot
> 
>   drivers/spmi/spmi-mtk-pmif.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> index b3c991e1ea40..78b69e0b5c81 100644
> --- a/drivers/spmi/spmi-mtk-pmif.c
> +++ b/drivers/spmi/spmi-mtk-pmif.c
> @@ -50,6 +50,7 @@ struct pmif {
>   	struct clk_bulk_data clks[PMIF_MAX_CLKS];
>   	size_t nclks;
>   	const struct pmif_data *data;
> +	spinlock_t lock;
>   };
>   
>   static const char * const pmif_clock_names[] = {
> @@ -314,6 +315,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	struct ch_reg *inf_reg;
>   	int ret;
>   	u32 data, cmd;
> +	unsigned long flags;
>   
>   	/* Check for argument validation. */
>   	if (sid & ~0xf) {
> @@ -334,12 +336,14 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	else
>   		return -EINVAL;
>   
> +	spin_lock_irqsave(&arb->lock, flags);
>   	/* Wait for Software Interface FSM state to be IDLE. */
>   	inf_reg = &arb->chan;
>   	ret = readl_poll_timeout_atomic(arb->base + arb->data->regs[inf_reg->ch_sta],
>   					data, GET_SWINF(data) == SWINF_IDLE,
>   					PMIF_DELAY_US, PMIF_TIMEOUT_US);
>   	if (ret < 0) {
> +		spin_unlock_irqrestore(&arb->lock, flags);
>   		/* set channel ready if the data has transferred */
>   		if (pmif_is_fsm_vldclr(arb))
>   			pmif_writel(arb, 1, inf_reg->ch_rdy);

Unlock the spinlock after setting CHANNEL_READY, otherwise, we may signal that
we're ready *while* another CPU is writing data to the bus, getting back again
to the same lockup that you're trying to solve :-)

P.S.: Same for write_cmd, of course.

P.P.S.: Adding Chen-Yu to the Cc's as he is surely interested in this one as well.

Cheers!
Angelo

> @@ -350,6 +354,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	/* Send the command. */
>   	cmd = (opc << 30) | (sid << 24) | ((len - 1) << 16) | addr;
>   	pmif_writel(arb, cmd, inf_reg->ch_send);
> +	spin_unlock_irqrestore(&arb->lock, flags);
>   
>   	/*
>   	 * Wait for Software Interface FSM state to be WFVLDCLR,
> @@ -376,7 +381,8 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	struct pmif *arb = spmi_controller_get_drvdata(ctrl);
>   	struct ch_reg *inf_reg;
>   	int ret;
> -	u32 data, cmd;
> +	u32 data, wdata, cmd;
> +	unsigned long flags;
>   
>   	if (len > 4) {
>   		dev_err(&ctrl->dev, "pmif supports 1..4 bytes per trans, but:%zu requested", len);
> @@ -394,12 +400,17 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	else
>   		return -EINVAL;
>   
> +	/* Set the write data. */
> +	memcpy(&wdata, buf, len);
> +
> +	spin_lock_irqsave(&arb->lock, flags);
>   	/* Wait for Software Interface FSM state to be IDLE. */
>   	inf_reg = &arb->chan;
>   	ret = readl_poll_timeout_atomic(arb->base + arb->data->regs[inf_reg->ch_sta],
>   					data, GET_SWINF(data) == SWINF_IDLE,
>   					PMIF_DELAY_US, PMIF_TIMEOUT_US);
>   	if (ret < 0) {
> +		spin_unlock_irqrestore(&arb->lock, flags);
>   		/* set channel ready if the data has transferred */
>   		if (pmif_is_fsm_vldclr(arb))
>   			pmif_writel(arb, 1, inf_reg->ch_rdy);
> @@ -407,13 +418,12 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   		return ret;
>   	}
>   
> -	/* Set the write data. */
> -	memcpy(&data, buf, len);
> -	pmif_writel(arb, data, inf_reg->wdata);
> +	pmif_writel(arb, wdata, inf_reg->wdata);
>   
>   	/* Send the command. */
>   	cmd = (opc << 30) | BIT(29) | (sid << 24) | ((len - 1) << 16) | addr;
>   	pmif_writel(arb, cmd, inf_reg->ch_send);
> +	spin_unlock_irqrestore(&arb->lock, flags);
>   
>   	return 0;
>   }
> @@ -488,6 +498,8 @@ static int mtk_spmi_probe(struct platform_device *pdev)
>   	arb->chan.ch_send = PMIF_SWINF_0_ACC + chan_offset;
>   	arb->chan.ch_rdy = PMIF_SWINF_0_VLD_CLR + chan_offset;
>   
> +	spin_lock_init(&arb->lock);
> +
>   	platform_set_drvdata(pdev, ctrl);
>   
>   	err = spmi_controller_add(ctrl);


