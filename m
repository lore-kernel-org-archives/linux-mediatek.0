Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC86C2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 05:16:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A56206D3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 05:16:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m5q8fMp9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Z1dNkRmE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31A56206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/TEUW5/F12rFbtzQZqE5TEoncCt/LkTYvh7lt/iz0Q=; b=m5q8fMp9eG+Rex
	1u5NG1TFLCu2Lw43sMxf3zZLxO0xikoUANhoxJXQhNUAkhtgOrxUBLmNStkCNGr5whhgeT4DkqKO7
	MGS6bk21RjS5mflTBHWYtbe7j0QZry37jPXHk6aC8bmmwd8YAMrrksfd/OIXZymcD70C7hqEMJzsR
	Cp0Yo+mO+2o8WFxd0lWW7c2NATSZy31gfXFqSNlP7c/aGkOuaqXrnnIqh1FJd8YZmIhmToB8pGJFo
	PFqUG+MgWbOEF2hgcx0Vvw9eZXs6frJzoBTiWU7OjvRsfPxa06whKrp7gETjYBHodr22zQD+WgRcM
	bdnE6Y7k04KJOLA1Febw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieBPb-0007ss-0w; Mon, 09 Dec 2019 05:16:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieBPY-0007sE-0B; Mon, 09 Dec 2019 05:16:46 +0000
X-UUID: 6f4a2e17f9a044f7a97295bdac02cd62-20191208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/iuyPvsaVdzjThz3ynKNy7lY5Ed2c8DFHT3fXKOUa5U=; 
 b=Z1dNkRmEe2z2l3kOcK9d8FTlDJw2ubJAmeq9VbT0g6x/0Y5I6m/etRAN4dKLpnxbmRupuoOhhpWSPHelafy+lvt3zFUk/taVJWkSfE133bQN62ck7CCe6eMrfPmrIyGXtyLdzrKdTd/9tVVxaifMMKYx9IbqjvkNmb3pmO+IBFA=;
X-UUID: 6f4a2e17f9a044f7a97295bdac02cd62-20191208
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1544962341; Sun, 08 Dec 2019 21:16:41 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 8 Dec 2019 21:16:53 -0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Dec 2019 13:16:01 +0800
Message-ID: <1575868591.7013.5.camel@mtksdaap41>
Subject: Re: [resend PATCH v6 03/12] drm/mediatek: Use regmap for register
 access
From: CK Hu <ck.hu@mediatek.com>
To: <matthias.bgg@kernel.org>
Date: Mon, 9 Dec 2019 13:16:31 +0800
In-Reply-To: <20191207224740.24536-4-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
 <20191207224740.24536-4-matthias.bgg@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_211644_047851_FA95C4BB 
X-CRM114-Status: GOOD (  17.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, rdunlap@infradead.org, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
 linux-clk@vger.kernel.org, drinkcat@chromium.org, wens@csie.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, sean.wang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, sboyd@kernel.org,
 sean.wang@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 enric.balletbo@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Matthias:

On Sat, 2019-12-07 at 23:47 +0100, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The mmsys memory space is shared between the drm and the
> clk driver. Use regmap to access it.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 50 +++++++++++--------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 13 ++-----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  2 +-
>  5 files changed, 30 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 34a731755791..259e2f4fa5fa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -27,7 +27,7 @@
>   * @enabled: records whether crtc_enable succeeded
>   * @planes: array of 4 drm_plane structures, one for each overlay plane
>   * @pending_planes: whether any plane has pending changes to be applied
> - * @config_regs: memory mapped mmsys configuration register space
> + * @config_regs: regmap mapped mmsys configuration register space
>   * @mutex: handle to one of the ten disp_mutex streams
>   * @ddp_comp_nr: number of components in ddp_comp
>   * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
> @@ -43,7 +43,7 @@ struct mtk_drm_crtc {
>  	unsigned int			layer_nr;
>  	bool				pending_planes;
>  
> -	void __iomem			*config_regs;
> +	struct regmap			*config_regs;
>  	struct mtk_disp_mutex		*mutex;
>  	unsigned int			ddp_comp_nr;
>  	struct mtk_ddp_comp		**ddp_comp;
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index 8106a71a7404..b765181223e6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -331,61 +331,53 @@ static unsigned int mtk_ddp_sel_in(enum mtk_ddp_comp_id cur,
>  	return value;
>  }
>  
> -static void mtk_ddp_sout_sel(void __iomem *config_regs,
> +static void mtk_ddp_sout_sel(struct regmap *config_regs,
>  			     enum mtk_ddp_comp_id cur,
>  			     enum mtk_ddp_comp_id next)
>  {
>  	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
> -		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
> +		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
> +				BLS_TO_DSI_RDMA1_TO_DPI1);
>  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> -		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> -			       config_regs + DISP_REG_CONFIG_OUT_SEL);
> -		writel_relaxed(DSI_SEL_IN_RDMA,
> -			       config_regs + DISP_REG_CONFIG_DSI_SEL);
> -		writel_relaxed(DPI_SEL_IN_BLS,
> -			       config_regs + DISP_REG_CONFIG_DPI_SEL);
> +		regmap_write(config_regs, DISP_REG_CONFIG_OUT_SEL,
> +				BLS_TO_DPI_RDMA1_TO_DSI);
> +		regmap_write(config_regs, DISP_REG_CONFIG_DSI_SEL,
> +				DSI_SEL_IN_RDMA);
> +		regmap_write(config_regs, DISP_REG_CONFIG_DPI_SEL,
> +				DPI_SEL_IN_BLS);
>  	}
>  }
>  
> -void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
> +void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
>  			      enum mtk_ddp_comp_id cur,
>  			      enum mtk_ddp_comp_id next)
>  {
> -	unsigned int addr, value, reg;
> +	unsigned int addr, value;
>  
>  	value = mtk_ddp_mout_en(cur, next, &addr);
> -	if (value) {
> -		reg = readl_relaxed(config_regs + addr) | value;
> -		writel_relaxed(reg, config_regs + addr);
> -	}
> +	if (value)
> +		regmap_update_bits(config_regs, addr, value, value);
>  
>  	mtk_ddp_sout_sel(config_regs, cur, next);
>  
>  	value = mtk_ddp_sel_in(cur, next, &addr);
> -	if (value) {
> -		reg = readl_relaxed(config_regs + addr) | value;
> -		writel_relaxed(reg, config_regs + addr);
> -	}
> +	if (value)
> +		regmap_update_bits(config_regs, addr, value, value);
>  }
>  
> -void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
> +void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
>  				   enum mtk_ddp_comp_id cur,
>  				   enum mtk_ddp_comp_id next)
>  {
> -	unsigned int addr, value, reg;
> +	unsigned int addr, value;
>  
>  	value = mtk_ddp_mout_en(cur, next, &addr);
> -	if (value) {
> -		reg = readl_relaxed(config_regs + addr) & ~value;
> -		writel_relaxed(reg, config_regs + addr);
> -	}
> +	if (value)
> +		regmap_update_bits(config_regs, addr, value, 0);
>  
>  	value = mtk_ddp_sel_in(cur, next, &addr);
> -	if (value) {
> -		reg = readl_relaxed(config_regs + addr) & ~value;
> -		writel_relaxed(reg, config_regs + addr);
> -	}
> +	if (value)
> +		regmap_update_bits(config_regs, addr, value, 0);
>  }
>  
>  struct mtk_disp_mutex *mtk_disp_mutex_get(struct device *dev, unsigned int id)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> index 827be424a148..01ff8b68881f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.h
> @@ -12,10 +12,10 @@ struct regmap;
>  struct device;
>  struct mtk_disp_mutex;
>  
> -void mtk_ddp_add_comp_to_path(void __iomem *config_regs,
> +void mtk_ddp_add_comp_to_path(struct regmap *config_regs,
>  			      enum mtk_ddp_comp_id cur,
>  			      enum mtk_ddp_comp_id next);
> -void mtk_ddp_remove_comp_from_path(void __iomem *config_regs,
> +void mtk_ddp_remove_comp_from_path(struct regmap *config_regs,
>  				   enum mtk_ddp_comp_id cur,
>  				   enum mtk_ddp_comp_id next);
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 352b81a7a670..210455e9f46c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/component.h>
>  #include <linux/iommu.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
> @@ -485,7 +486,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct mtk_drm_private *private;
> -	struct resource *mem;
>  	struct device_node *node;
>  	struct component_match *match = NULL;
>  	int ret;
> @@ -499,14 +499,9 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  	INIT_WORK(&private->commit.work, mtk_atomic_work);
>  	private->data = of_device_get_match_data(dev);
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	private->config_regs = devm_ioremap_resource(dev, mem);
> -	if (IS_ERR(private->config_regs)) {
> -		ret = PTR_ERR(private->config_regs);
> -		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
> -			ret);
> -		return ret;
> -	}
> +	private->config_regs = syscon_node_to_regmap(dev->of_node);
> +	if (IS_ERR(private->config_regs))
> +		return PTR_ERR(private->config_regs);
>  
>  	/* Iterate over sibling DISP function blocks */
>  	for_each_child_of_node(dev->of_node->parent, node) {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index e03fea12ff59..63a121577dcb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -39,7 +39,7 @@ struct mtk_drm_private {
>  
>  	struct device_node *mutex_node;
>  	struct device *mutex_dev;
> -	void __iomem *config_regs;
> +	struct regmap *config_regs;
>  	struct device_node *comp_node[DDP_COMPONENT_ID_MAX];
>  	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
>  	const struct mtk_mmsys_driver_data *data;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
