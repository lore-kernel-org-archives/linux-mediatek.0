Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023A5C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJKi3GWlTNGqNHfD16kmL/1khNfEKoKmy5L+rvicGOU=; b=YB/KtUuFc3PSb6TTfiC7KPt0UI
	q6w7c+DSWghaVx+9lN7xijZvkCJHMTdwKy0FlcR8UxO88Il0Vw97UPLNFuCKxxRRE7LieyXyYbMn2
	kn3LETUyqfl6ro7UzsA50NNNprztUHgclYCy7p7OYM3XkBCSiihTIuTZS9+FRSzjphWclnrFrHQaE
	CpokCYp4CF3oEH2JQsPr6YZ2MXh1dzCsEOT3TqlbNIhIOsfwogfzri+ja5w9V2bQuAZFacEE8z5Li
	mqGFbpj3a/58gA4d2hD0tCyScbxcmWsMIHWStJAV2p30DsVEgKfF7+5TeYcQvxYQ4Rwdoa4hQf9Gb
	uHy+w/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8J15-008Xx1-BT; Fri, 14 Jan 2022 09:37:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8J0r-008Xtn-AL; Fri, 14 Jan 2022 09:36:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 72FA71F466F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642153007;
 bh=pFIPIy9RdFXB+9xAvQLstpQYOgxW4GoQbae/UEltiWE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Tt0qSzhsWQ5EVH6VjZyCyTHylaUwo1BQR0kHlLZvfN2B3BBVCP12vhFPduPFVvWOM
 +PYV6SAKKjEYKDY30Qmkt33KfjNFJoBrODPR0XfMMkmmKVzyqcWJWtEdGUR/WrpNGE
 tOBje8PM8F+jjp5LVPEgUHsGSnGxI9Z2e74ZUBG+59+fo4Tw8xKmdMMWbEmD+XgcfV
 oEBXslQIgU7unasQkcDYVu6wZho/5u7POprK1bLaJRpGkQeQG8QclIo5CqT0UodInQ
 4YtD4eFVMRQ7pt2AixdLlaESbe8cGsIVc4FcnPcqLq+mNXJhheVtiCZ04HnQ/5h1F5
 F+ZiAYGZ6SJCQ==
Subject: Re: [v9,2/3] drm/mediatek: implement the DSI hs packets aligned
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 andrzej.hajda@intel.com, daniel@ffwll.ch, airlied@linux.ie,
 p.zabel@pengutronix.de
Cc: xji@analogixsemi.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jitao Shi <jitao.shi@mediatek.com>
References: <20220114092110.12137-1-rex-bc.chen@mediatek.com>
 <20220114092110.12137-3-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4076cb55-4546-6bbd-1a1f-19395dcd9ccd@collabora.com>
Date: Fri, 14 Jan 2022 10:36:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220114092110.12137-3-rex-bc.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_013649_940757_5E443A27 
X-CRM114-Status: GOOD (  20.58  )
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

Il 14/01/22 10:21, Rex-BC Chen ha scritto:
> Some DSI RX devices require the packets on all lanes aligned at the end.
> Otherwise, there will be some issues of shift or scroll for screen.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Hello,
thanks for the patch! However, there's something to improve...

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 5d90d2eb0019..ccdda15f5a66 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -195,6 +195,8 @@ struct mtk_dsi {
>   	struct clk *hs_clk;
>   
>   	u32 data_rate;
> +	/* force dsi line end without dsi_null data */
> +	bool hs_packet_end_aligned;

There's no need to introduce a new variable here...

>   
>   	unsigned long mode_flags;
>   	enum mipi_dsi_pixel_format format;
> @@ -500,6 +502,13 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
>   		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
>   	}
>   
> +	if (dsi->hs_packet_end_aligned) {

You can simply check mode_flags here:
	if (dsi->mode_flags & MIPI_DSI_HS_PKT_END_ALIGNED) {

> +		horizontal_sync_active_byte = roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
> +		horizontal_frontporch_byte = roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
> +		horizontal_backporch_byte = roundup(horizontal_backporch_byte, dsi->lanes) - 2;
> +		horizontal_backporch_byte -= (vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
> +	}
> +
>   	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
>   	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
>   	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
> @@ -794,6 +803,9 @@ static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
>   	dsi->lanes = device->lanes;
>   	dsi->format = device->format;
>   	dsi->mode_flags = device->mode_flags;
> +	dsi->hs_packet_end_aligned = (dsi->mode_flags &
> +				      MIPI_DSI_HS_PKT_END_ALIGNED)
> +				     ? true : false;

...so there's no need for this one, either.

>   
>   	return 0;
>   }
> 

Regards,
- Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
