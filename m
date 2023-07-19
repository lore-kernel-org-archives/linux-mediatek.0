Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC34C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53A2dGFcQkIOpirEOrtEWn7D2heHvt+jK3efKrQ1VBQ=; b=KXdxUtWWo69YriCKf3YF7S+sn+
	S00hWvhggYLHPuzec/mv1rcCmC3ek54sfTz0eA1CqPrlzCs1PugC6yekl3kOsr/siWr4d9VbOgdu7
	wQLIRh0Wc21ZoxsCaNOcvv1akn4M0ltHM4ay0fZLn2uYbwO0FcweXobL23Q+s8pA3cfM3fQerIy86
	RMla9RmBLXY2jMJ+FlB5Y00/XzjOrPPXk1W+bKiMr3tzL8+lbeUyQW30Kd0QZMXsfNfFjXTIVHdTL
	AX+ZCH0WD/tF0a20B0dhRDCj+LroT7QJklAazC1M1Kvc0cXhBkNXlwqTZvMBg9HYRWxGg2ZurEkgd
	3oDA+sSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2UA-006KTd-2m;
	Wed, 19 Jul 2023 08:24:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2U7-006KRW-2C;
	Wed, 19 Jul 2023 08:24:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A813D660704A;
	Wed, 19 Jul 2023 09:24:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689755074;
	bh=eD8QzZ9d79NiTyGzIqtIll+xqD7fGW1diaZBMcwUNII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ITogaG+HeOljK2CNEP2vEIT4dgx1l5G8M09tLAax9WSLJ82rNFhSM/J4xSIya6gcm
	 F/6yWYE6PbDPiPJDHvB4HLGZLM9FVt7XsVcIvMkC4MIP4qjRAusfhi0kb04jU8dA91
	 kRqz9M1mWO03eJ2Z2WKifU/qHD0tEyP0H3l2Wxfkvvamm/muWI2ylNMB1RuQt+Wtcn
	 0P2mVUnEtdaPhIwmGBThq4Q/1IHAXq3h2xSKJQ3mjEAutQbYABT1e8KEkqRtb2clam
	 l1EkHkYRgLeiKbdE6uvUdSz5ReRBdP+iA69cSBOoC7fBE8kTWbKFdINa7s2KhbTWQB
	 CfdeOojS/Bpsw==
Message-ID: <febc5cee-17fb-b524-add7-5d6c295b946b@collabora.com>
Date: Wed, 19 Jul 2023 10:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] spmi: mtk-pmif: Serialize PMIF status check and command
 submission
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 James Lo <james.lo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230714211739.42928-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230714211739.42928-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_012436_000629_BDF8B265 
X-CRM114-Status: GOOD (  32.92  )
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

Il 14/07/23 23:17, Nícolas F. R. A. Prado ha scritto:
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
> sometimes read the bus simultaneously, breaking the PMIF interface and
> consequently slowing down the whole system.
> 
> To fix the issue, introduce locking around the channel status check and
> the command write, so that both become an atomic operation. A spinlock
> is used since this is a fast bus, as indicated by the usage of the
> atomic variant of readl_poll, and '.fast_io = true' being used in the
> mt6315 driver, so spinlocks are already used for the regmap access.
> 
> Fixes: b45b3ccef8c0 ("spmi: mediatek: Add support for MT6873/8192")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

I agree. After all, switching back to synchronous probe would solve the issue
but that wouldn't be enough, as there's another latent issue in this driver.

You missed an important part for this commit's description!

Concurrent R/W may happen *not only* during probe, but *also* (and that's why
we *really* need this locking action) during runtime as some platforms may
have multiple regulator ICs, or others, over SPMI.

Anyway, look further, there are some comments to address for this patch.

> ---
> 
>   drivers/spmi/spmi-mtk-pmif.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
> index b3c991e1ea40..208ba0adfb98 100644
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
> @@ -334,6 +336,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	else
>   		return -EINVAL;
>   
> +	spin_lock_irqsave(&arb->lock, flags);
>   	/* Wait for Software Interface FSM state to be IDLE. */
>   	inf_reg = &arb->chan;
>   	ret = readl_poll_timeout_atomic(arb->base + arb->data->regs[inf_reg->ch_sta],
> @@ -350,6 +353,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	/* Send the command. */
>   	cmd = (opc << 30) | (sid << 24) | ((len - 1) << 16) | addr;
>   	pmif_writel(arb, cmd, inf_reg->ch_send);
> +	spin_unlock_irqrestore(&arb->lock, flags);

NACK. If readl_poll_timeout_atomic() fails you're leaving the spinlock locked!!!

Please fix :-)

>   
>   	/*
>   	 * Wait for Software Interface FSM state to be WFVLDCLR,
> @@ -377,6 +381,7 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	struct ch_reg *inf_reg;
>   	int ret;
>   	u32 data, cmd;
> +	unsigned long flags;
>   
>   	if (len > 4) {
>   		dev_err(&ctrl->dev, "pmif supports 1..4 bytes per trans, but:%zu requested", len);
> @@ -394,6 +399,7 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	else
>   		return -EINVAL;
>   
> +	spin_lock_irqsave(&arb->lock, flags);
>   	/* Wait for Software Interface FSM state to be IDLE. */
>   	inf_reg = &arb->chan;
>   	ret = readl_poll_timeout_atomic(arb->base + arb->data->regs[inf_reg->ch_sta],
> @@ -414,6 +420,7 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>   	/* Send the command. */
>   	cmd = (opc << 30) | BIT(29) | (sid << 24) | ((len - 1) << 16) | addr;
>   	pmif_writel(arb, cmd, inf_reg->ch_send);
> +	spin_unlock_irqrestore(&arb->lock, flags);
>   

For performance, do the memcpy() outside of the spinlock, before waiting for IDLE.

Cheers,
Angelo


