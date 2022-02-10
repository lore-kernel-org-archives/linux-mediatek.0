Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333BBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 02:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ryj59sa/M/oZlGW1V3mS9kuVeV2zFbrPVV9GbYyY1is=; b=mV0pUnf1y82SsK
	IfXPYAJCbkZgUQkmdeLZ86UxnmhBPbuJZg2OFoH8PRhJQk5+DCNldAsMw21U3OWkZpZ3FvswDcFvS
	CShtXFJQAR+5bMZtjCE2i7cCu4vR3+IBxcZGEsCxyGvolKVbgENDeycNiwsDZilQaoxxLzXYynQrV
	hmdrABctl2ZyNwmo2+bLsAt8Q23Ltv8XgNpHDBbF3oEnTbyLDcfzAiiTeLswV3eixVe/LcCbPGMgH
	ZkqF6DwmWsaGRbVQbdA0sKd1LGFCtAwYAc5N9J3m5K1uQe9xkmWBKBRgry3xvXM2+tZY1owc/mmc0
	4qOnrJCiVmKrDqSZf0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHzQr-002JgI-UB; Thu, 10 Feb 2022 02:43:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHzQp-002Jee-0P; Thu, 10 Feb 2022 02:43:40 +0000
X-UUID: 600f648923d442f7bd0827d8b05d6fed-20220209
X-UUID: 600f648923d442f7bd0827d8b05d6fed-20220209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 134622874; Wed, 09 Feb 2022 19:43:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 18:43:29 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 10 Feb 2022 10:43:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 10:43:28 +0800
Message-ID: <f2fffc0a7d60d454f1722585f1352823910c30b3.camel@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: allow commands to be sent during video mode
From: CK Hu <ck.hu@mediatek.com>
To: Julien STEPHAN <jstephan@baylibre.com>
CC: Mattijs Korpershoek <mkorpershoek@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "open list:DRM DRIVERS FOR MEDIATEK"
 <dri-devel@lists.freedesktop.org>, "moderated list:DRM DRIVERS FOR MEDIATEK"
 <linux-mediatek@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Thu, 10 Feb 2022 10:43:28 +0800
In-Reply-To: <20220124152250.441809-1-jstephan@baylibre.com>
References: <20220124152250.441809-1-jstephan@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_184339_107344_1A885962 
X-CRM114-Status: GOOD (  21.18  )
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

Hi, Julien:

On Mon, 2022-01-24 at 16:22 +0100, Julien STEPHAN wrote:
> When the DSI is in video mode, all commands are rejected.
> 
> Detect current DSI mode in mtk_dsi_host_transfer() and switch modes
> temporarily to allow commands to be sent.

Is this patch a bug-fix or new feature? If this is a bug-fix, add Fixes
tag [1] in this patch. If this is a new feature, describe more about
more about this feature, such as support more panel or something.

[1] 
https://www.kernel.org/doc/html/v5.16/process/submitting-patches.html

Regards,
CK

> 
> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 34 ++++++++++++++++++++++----
> ----
>  1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 5d90d2eb0019..7d66fdc7f81d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -891,24 +891,34 @@ static ssize_t mtk_dsi_host_transfer(struct
> mipi_dsi_host *host,
>  	u8 read_data[16];
>  	void *src_addr;
>  	u8 irq_flag = CMD_DONE_INT_FLAG;
> -
> -	if (readl(dsi->regs + DSI_MODE_CTRL) & MODE) {
> -		DRM_ERROR("dsi engine is not command mode\n");
> -		return -EINVAL;
> +	u32 dsi_mode;
> +
> +	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
> +	if (dsi_mode & MODE) {
> +		mtk_dsi_stop(dsi);
> +		if (mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG,
> 500)) {
> +			recv_cnt = -EINVAL;
> +			goto restore_dsi_mode;
> +		}
>  	}
>  
>  	if (MTK_DSI_HOST_IS_READ(msg->type))
>  		irq_flag |= LPRX_RD_RDY_INT_FLAG;
>  
> -	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0)
> -		return -ETIME;
> +	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0) {
> +		recv_cnt = -ETIME;
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
>  	if (!msg->rx_buf) {
>  		DRM_ERROR("dsi receive buffer size may be NULL\n");
> -		return -EINVAL;
> +		recv_cnt = -EINVAL;
> +		goto restore_dsi_mode;
>  	}
>  
>  	for (i = 0; i < 16; i++)
> @@ -933,6 +943,12 @@ static ssize_t mtk_dsi_host_transfer(struct
> mipi_dsi_host *host,
>  	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
>  		 recv_cnt, *((u8 *)(msg->tx_buf)));
>  
> +restore_dsi_mode:
> +	if (dsi_mode & MODE) {
> +		mtk_dsi_set_mode(dsi);
> +		mtk_dsi_start(dsi);
> +	}
> +
>  	return recv_cnt;
>  }
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
