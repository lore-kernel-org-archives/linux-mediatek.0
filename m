Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D77FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 16:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkqKpyyGUzTovd4RmtWb5lfUN26Xm2fjJU/Ms9BXDaU=; b=QyXCJUgQvRwgsU
	B10z70EwuRHBFQB7gwlQJ6s/Si1R4CyXQtyBJdbR63TvAm1gg0rRPReK0MOJfrs/5XQrGcXogxRMq
	vI5Hv7OwPn9HSy9jINYeCH8ltfXDYJLEkl77zGKCpiub/gxexts1g/m1OldCBk56eQnD48bkW9LTz
	gvBEJThn07r3UlNY5qRlE1BELFCYMkeiQVG8Zyzdqx+72Fa+h1JG+oYyyUL9uwd11cj7i4VEUAMTE
	UOZeV+F36rGW80P03j7rCRlf05+6ejj6Mdvx8x1EzDPOOkxSz5j5DWAhAIqMBqU3qBgAYkMSInUYB
	VvMm+lS3VxEC0ReWW4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nICQr-004Nez-Fo; Thu, 10 Feb 2022 16:36:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nICQf-004NcA-12; Thu, 10 Feb 2022 16:36:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4069B1F466A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644510978;
 bh=D6WwfmbStMmHxfTQqVmfzkYRd3e74eS+cdcYjWxj8bc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Qvx+ShQ5sHm0W4YLpcexIsfT19zd/qWWe7akYKUqQooiV+EMIg68i8SA0bmRxBPRh
 nB3k6gyUsDtnvsRPkA8yuXFt6JbF+Tz5XchHTcpQk085zpbMvfCyiWncGKCz+UJ/EC
 S6i7Y1CcylZ2C50U51JqKq2eA9JBZhgo9/dXs/Zpsd61kV8YO9swjgFrwBxQruy9j2
 mngas7Os73dbOaHkAMP70s7qAcZc54phBBBYxfLEbBHRx+5NKSiEf52K7PJyIQCaSs
 PW82F1dxZrsNfcNRZguU6LkUfmBUtzRds1XzuNRaQXTLZw7+bX1aKwqu429sBx+JAu
 codL35w1/4UnQ==
Message-ID: <4907bdc1-b4a6-e9ad-5cfa-266fc20c0bec@collabora.com>
Date: Thu, 10 Feb 2022 17:36:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] drm/mediatek: allow commands to be sent during video
 mode
Content-Language: en-US
To: Julien STEPHAN <jstephan@baylibre.com>, ck.hu@mediatek.com
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
References: <20220210124638.2330904-1-jstephan@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210124638.2330904-1-jstephan@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_083621_413144_9EC8BCD8 
X-CRM114-Status: GOOD (  26.09  )
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

Il 10/02/22 13:46, Julien STEPHAN ha scritto:
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
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Hello Julien,
thanks for the patch!

However, there's a severe issue to solve.

> ---
> Changes in v2:
>    - update commit message to be more descriptive
> 
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 34 ++++++++++++++++++++++--------
>   1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 5d90d2eb0019..7d66fdc7f81d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -891,24 +891,34 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
>   	u8 read_data[16];
>   	void *src_addr;
>   	u8 irq_flag = CMD_DONE_INT_FLAG;
> -
> -	if (readl(dsi->regs + DSI_MODE_CTRL) & MODE) {
> -		DRM_ERROR("dsi engine is not command mode\n");
> -		return -EINVAL;
> +	u32 dsi_mode;
> +
> +	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
> +	if (dsi_mode & MODE) {
> +		mtk_dsi_stop(dsi);
> +		if (mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500)) {
> +			recv_cnt = -EINVAL;

Variable recv_cnt is u32, hence unsigned... You cannot assign a negative error
number to that variable.

While at it, please add a `int ret` variable to increase readability of this
function after your additions... in which case, this would then be

		ret = mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
		if (ret)
			goto restore_dsi_mode;

...which also simplifies the flow, in my opinion (but that's personal preference).

> +			goto restore_dsi_mode;
> +		}
>   	}
>   
>   	if (MTK_DSI_HOST_IS_READ(msg->type))
>   		irq_flag |= LPRX_RD_RDY_INT_FLAG;
>   
> -	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0)
> -		return -ETIME;
> +	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0) {
> +		recv_cnt = -ETIME;

This can be improved: mtk_dsi_host_send_cmd() already returns either zero or
-ETIME if mtk_dsi_wait_for_irq_done() times out.

I would also suggest, at this point, to make function mtk_dsi_wait_for_irq_done()
directly return -ETIME, so that also mtk_dsi_switch_to_cmd_mode() and
mtk_dsi_host_send_cmd() are simplified.

Whether you want to improve this file, or want to avoid improving it right now,
this should anyway be like:

	ret = mtk_dsi_host_send_cmd(..blah)
	if (ret)
		goto restore_dsi_mode;

> +		goto restore_dsi_mode;
> +	}
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
> +		recv_cnt = -EINVAL;
> +		goto restore_dsi_mode;
>   	}
>   
>   	for (i = 0; i < 16; i++)
> @@ -933,6 +943,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
>   	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
>   		 recv_cnt, *((u8 *)(msg->tx_buf)));
>   
> +restore_dsi_mode:
> +	if (dsi_mode & MODE) {
> +		mtk_dsi_set_mode(dsi);
> +		mtk_dsi_start(dsi);
> +	}
> +
>   	return recv_cnt;

P.S.:   return ret < 0 ? ret : recv_cnt;

>   }
>   
> 

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
