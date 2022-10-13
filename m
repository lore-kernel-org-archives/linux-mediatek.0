Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74618C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WptYcpJKtSv14SPU6lyecb1Oi01W8jQ54A08iIjYNg8=; b=2GwuWU8Z3GopIUpQCPpdOWfW7K
	DFluH52/QlrosuDf4X52VQHtTPbTiyJtB+584YFSBnrlud6i+pu7f0EGohBgjS/zrfE3NyPAkdQIB
	QFcr6d53P43IgLfO7MLE54yPE7N0F4TqXyNyZVY18r9Zp2pMKDzm2oO4YTEp+AzIf4XS0XHllW9MI
	5yy8NTCRPr7Vs/4hdm9z3YekqW5W0soO5c700OIo2CEcLzzEWfGdW5Svsirwp57gm6+lnP2VErw7x
	gXk9AnzcHXgBRFJnKafvECVcJKUi1UM2zJ7KU8Sx5SjdsEM6NrtIzOzDT6d+uxLtSYWttkGDBafGx
	b0pz6/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oitCU-00B1eX-Eg; Thu, 13 Oct 2022 08:04:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oitCR-00B1dp-EM
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 08:04:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C7C16600371;
	Thu, 13 Oct 2022 09:04:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665648252;
	bh=25+d+lS9LpCgKrZZzeawH6MfibiSiTO8j22wJ0cLF6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fgaUyPNTI3PfFltOYEWs+sk9OVHW15ESqD/X4JbTjYBBsXy6JGxKq4O19yvojtkFI
	 qFilDW+I9BUlofzfAOy3KaxvdKtpVh4Ne/c4yRz/2F/P+1yv27umBmIyYRzBX+DPDM
	 SumyNvrG336hNUddNvCPxQPt3rXHsx45Dsq2Hs8sun6m6cI7pRpE6BoIeHqA7fPzYd
	 lL4gQYOy0n26lxEcDErUsfvpWpONvGkWjab3JuTUQveeI7kiIy81GMRhN8jmOijge9
	 oDK7oqTEhkdv0YYIRn+y/Nhywyr6YkKsT50HntK9O1JYP5Bbd2SQkIb3lwi/wqFS5n
	 +S1HnieHcUXVA==
Message-ID: <0559d2a5-1b8c-67c5-0174-cd069d33218e@collabora.com>
Date: Thu, 13 Oct 2022 10:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] drm/mediatek: Add AFBC support to Mediatek DRM driver
To: Justin Green <greenjustin@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org
Cc: jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 matthias.bgg@gmail.com, daniel@ffwll.ch
References: <20221012191226.1646315-1-greenjustin@chromium.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221012191226.1646315-1-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_010415_723549_BE345D00 
X-CRM114-Status: GOOD (  13.95  )
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

Il 12/10/22 21:12, Justin Green ha scritto:
> Tested on MT8195 and confirmed both correct video output and improved DRAM
> bandwidth performance.
> 
> v3:
> * Replaced pitch bitshift math with union based approach.
> * Refactored overlay register writes to shared code between non-AFBC and
>    AFBC.
> * Minor code cleanups.
> 
> v2:
> * Marked mtk_ovl_set_afbc as static.
> * Reflowed some lines to fit column limit.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 90 +++++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 37 +++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_plane.h |  8 +++
>   3 files changed, 131 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 002b0f6cae1a..3f89b5f5064f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c

..snip..

> @@ -335,9 +396,10 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>   		addr += pending->pitch - 1;
>   	}
>   
> +	mtk_ovl_set_afbc(dev, cmdq_pkt, idx, is_afbc);

I'm sorry for not noticing that in the previous review - there's only one
more issue here: I'm not sure that *all* of the MediaTek chips have the
AFBC bits in OVL_DATAPATH_CON... this may be clashing with something else
in the layout of (very?) old chips.

The solution is simple here. Please, guard this call with:

	if (ovl->data->supports_afbc)
		mtk_ovl_set_afbc(dev, cmdq_pkt, idx, is_afbc);

...after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers!
Angelo

