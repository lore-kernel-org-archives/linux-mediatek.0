Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583E0C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 09:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=inN7Dnsag4UrXksRbeX0kHW4P4m9WTc/SrWM+WS07QM=; b=oVZD/em1Pr8/X0
	p1dmF9jhsOiuoJPL7kocWULHBV80Gk46Ld3+ShMCqheyHPUAYc7AWE7/zHAuf1FKV9adGP+dzllH8
	EqSNlnYHS8xAxfVemwHafKZxSvreuxApHjqNg6LX8oeUrCR1uqDfT37u4mP8TJceG+ZNNX3H+er5W
	EM4i/dEg+r/TTSeQzufDNJWA9Sv9i3TnKwxNyFJYac/2xWYRwWtHL4MXNVxiwwez8YZUdm2dntN9N
	YnsmPrSwIWSnsw0yKNz7u5UgT8YFR6bIU+zTe7fNsNOBGHa4At2TqLM3/3dykAHyfoEm6c/7MfsQQ
	YmJzphpNyve2+A79F9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJXlk-00EGvJ-Gk; Mon, 14 Feb 2022 09:35:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJXSE-00ECEU-LG; Mon, 14 Feb 2022 09:15:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0CB661F43418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644830124;
 bh=QcBW7EbcVCJj4WVhYdUseyVwWonS1t6LoaXt/1doffQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mFIx8aIDOuNZlJ27i12Qg5ovU1JWkvpMC/M1o0pKVoMQa3MY05a1XMv0AELQLDzXj
 EJb2TFW7JQ3c2vM+Y9RF86O8uK480YDzyuWew8qusIR8HQGN7cz7/A2j4LFmGjvmAb
 Oznh1THqcNKn/zBtxt55B4KaOKZIRIBOuUJXXNxyno2FiLgxyTTm/ZlnzaxUN7obDY
 B+PUP737ecZRBbOChMZOQBwm9Xf44Gzm+tR0F4mcE3ipovG/Ddm+elxqx/FryS5tZe
 LMK6S2pRy1gxTJ2FtNRS1k/02hjU+aP/AVTnrkzi5NSOwht3na3faBC56kiw2dV/z4
 iSewDIdC3OvZw==
Message-ID: <fea5c577-117b-9fa0-1bae-dd00d023b86d@collabora.com>
Date: Mon, 14 Feb 2022 10:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3] drm/mediatek: allow commands to be sent during video
 mode
Content-Language: en-US
To: Julien STEPHAN <jstephan@baylibre.com>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DRM DRIVERS FOR MEDIATEK"
 <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20220214084736.3374211-1-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220214084736.3374211-1-jstephan@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_011530_920368_54637581 
X-CRM114-Status: GOOD (  23.94  )
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

Il 14/02/22 09:47, Julien STEPHAN ha scritto:
> Mipi dsi panel drivers can use mipi_dsi_dcs_{set,get}_display_brightness()
> to request backlight changes.
> 
> This can be done during panel initialization (dsi is in command mode)
> or afterwards (dsi is in Video Mode).
> 
> When the DSI is in Video Mode, all commands are rejected.
> 
> Detect current DSI mode in mtk_dsi_host_transfer() and switch modes
> temporarily to allow commands to be sent.
> 
> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
> Changes in v3:
>      - increase readability of code and use correct return variable (see
>        comment https://lore.kernel.org/linux-mediatek/4907bdc1-b4a6-e9ad-5cfa-266fc20c0bec@collabora.com/)
> 
> Changes in v2:
>      - update commit message to be more descriptive
> 
> 
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 33 ++++++++++++++++++++++--------
>   1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 5d90d2eb0019..7f1b2b7ed3fd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -891,24 +891,33 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
>   	u8 read_data[16];
>   	void *src_addr;
>   	u8 irq_flag = CMD_DONE_INT_FLAG;
> +	u32 dsi_mode;
> +	int ret;
> 
> -	if (readl(dsi->regs + DSI_MODE_CTRL) & MODE) {
> -		DRM_ERROR("dsi engine is not command mode\n");
> -		return -EINVAL;
> +	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
> +	if (dsi_mode & MODE) {
> +		mtk_dsi_stop(dsi);
> +		ret = mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
> +		if (ret)
> +			goto restore_dsi_mode;
>   	}
> 
>   	if (MTK_DSI_HOST_IS_READ(msg->type))
>   		irq_flag |= LPRX_RD_RDY_INT_FLAG;
> 
> -	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0)
> -		return -ETIME;
> +	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
> +	if (ret)
> +		goto restore_dsi_mode;
> 
> -	if (!MTK_DSI_HOST_IS_READ(msg->type))
> -		return 0;
> +	if (!MTK_DSI_HOST_IS_READ(msg->type)) {
> +		recv_cnt = 0;
> +		goto restore_dsi_mode;
> +	}
> 
>   	if (!msg->rx_buf) {
>   		DRM_ERROR("dsi receive buffer size may be NULL\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto restore_dsi_mode;
>   	}
> 
>   	for (i = 0; i < 16; i++)
> @@ -933,7 +942,13 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
>   	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
>   		 recv_cnt, *((u8 *)(msg->tx_buf)));
> 
> -	return recv_cnt;
> +restore_dsi_mode:
> +	if (dsi_mode & MODE) {
> +		mtk_dsi_set_mode(dsi);
> +		mtk_dsi_start(dsi);
> +	}
> +
> +	return ret < 0 ? ret: recv_cnt;


Nitpick: you've missed a space ... ret : recv_cnt;

With that fixed,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   }
> 
>   static const struct mipi_dsi_host_ops mtk_dsi_ops = {
> --
> 2.35.1
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
