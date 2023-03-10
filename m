Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24974C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 15:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDOE6hw3bL10vJY4XB0rZwt0ydrNfJKpp6gdmG8bf3E=; b=zjyerkpgloxtPuujN/6L6cTcjP
	lfXMJXJ0+l59XaYgzJuYkRNW5FHgTgFQhCD9hmcsQEG/MtEhafl3SZ5esgKGkvOZw1CMLG1hwmv23
	Awz7xc569uIMGmghTpJQ6mh1Hy/2oEsNRrKK9Xo3+dYxDhmQvToYxO+FchrLmimM4ddaoLtYIJHWM
	b8rK3yaGElcNZrDss857NmV2krz49HLu5T5VdHaAW6gpdIyNUdd30FZATHwcucYxHccsST0TLkK8O
	VnTk7amn3y0NF5PmV6/ycNfs7dSSHAadOFsqagiCELEC+DizD/b5QPBZmFCiP3Q9LDLT805nYhYei
	MuEzed7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paeGJ-00EtmJ-Sz; Fri, 10 Mar 2023 15:02:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paeFr-00Eta8-CO; Fri, 10 Mar 2023 15:02:01 +0000
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A89DA2E5;
	Fri, 10 Mar 2023 16:01:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1678460517;
	bh=PdhMIv1BqENXVPnM808oAbaFFFguQAJg5pti+hcZLlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9+1F8BLzjMrHWvCpTAU14Rb9jifcjI8NrrJ2PA9SY9SQaw4+KZrZGx2Hyw+z8lWW
	 Jq0kvPyhAPzDBAlkE3XVTgOjTxSzCJ6Wz/Q6/yBKJ3I2qp4yINmcrnybPp4r1jCqZb
	 mlohsPM5ERvAI6xrbpW1SBwP0jxecREqNum8+sRU=
Date: Fri, 10 Mar 2023 17:02:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Hyun Kwon <hyun.kwon@xilinx.com>,
	Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: Use of_property_present() for testing DT property
 presence
Message-ID: <20230310150201.GK5342@pendragon.ideasonboard.com>
References: <20230310144711.1543225-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230310144711.1543225-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_070159_621848_3F352E3F 
X-CRM114-Status: GOOD (  19.69  )
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

Hi Rob,

Thank you for the patch.

On Fri, Mar 10, 2023 at 08:47:11AM -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c        | 2 +-
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 2 +-
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c | 2 +-
>  drivers/media/platform/xilinx/xilinx-vtc.c                  | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 969516a940ba..1a2b3214b6f8 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1757,7 +1757,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>  	jpeg->vdev->device_caps = V4L2_CAP_STREAMING |
>  				  V4L2_CAP_VIDEO_M2M_MPLANE;
>  
> -	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
> +	if (of_property_present(pdev->dev.of_node, "dma-ranges"))
>  		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
>  
>  	ret = video_register_device(jpeg->vdev, VFL_TYPE_VIDEO, -1);
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> index 174a6eec2f54..d2db8ccaa4c0 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> @@ -321,7 +321,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL)) {
> +	if (of_property_present(pdev->dev.of_node, "dma-ranges")) {
>  		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
>  		if (ret) {
>  			mtk_v4l2_err("Failed to set mask");
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> index 9095186d5495..199042034a3c 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
> @@ -344,7 +344,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>  		goto err_event_workq;
>  	}
>  
> -	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
> +	if (of_property_present(pdev->dev.of_node, "dma-ranges"))
>  		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
>  
>  	ret = video_register_device(vfd_enc, VFL_TYPE_VIDEO, -1);
> diff --git a/drivers/media/platform/xilinx/xilinx-vtc.c b/drivers/media/platform/xilinx/xilinx-vtc.c
> index 0ae0208d7529..cb4b421a348d 100644
> --- a/drivers/media/platform/xilinx/xilinx-vtc.c
> +++ b/drivers/media/platform/xilinx/xilinx-vtc.c
> @@ -254,7 +254,7 @@ struct xvtc_device *xvtc_of_get(struct device_node *np)
>  	struct xvtc_device *found = NULL;
>  	struct xvtc_device *xvtc;
>  
> -	if (!of_find_property(np, "xlnx,vtc", NULL))
> +	if (!of_property_present(np, "xlnx,vtc"))
>  		return NULL;
>  
>  	xvtc_node = of_parse_phandle(np, "xlnx,vtc", 0);

-- 
Regards,

Laurent Pinchart

