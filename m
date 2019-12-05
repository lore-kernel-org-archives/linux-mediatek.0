Return-Path: <SRS0=lqdO=Z3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA57BC43603
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 04:51:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAFF6205ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 04:51:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mg4ddDx6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BNKMjaJ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAFF6205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvbwUAET5X3R3v7KKSoUPJGSQMe5/MJYR/sMmB/gCpY=; b=mg4ddDx6F4GeSl
	vt0X2H7ZWmhZJ7tdjXZBT74jzaK/CJuq1ggxDXh4/pjiwGFmDwIjdc3K5ErxDF5b5l0txyuWqxf34
	g6yYNITUIVXN+bM+5UwvYvHLDSPMdux6DQ/eCEj5PqMc3gYf5jmxeJQz3LZjh1Xs4SzaMRmSKXaYy
	oUjs0rRXmtKPH/mih0poBA9wT5/6+RPC+fxJMBKFrXt+NRc/oxVS9/vO9tXKyZ/GwLgbIRA/ifzq8
	XCLbdGZ+nICluXs7S5aUzzfCxqwG5Gs58n9ATgV0HerpmfFFqJ6a4H3/ej78bQZn9+lkdRqFe9oxQ
	9aWdR34AxBsYCTezqTtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icj6Y-0003kh-SL; Thu, 05 Dec 2019 04:51:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icj6P-0003eZ-Ar; Thu, 05 Dec 2019 04:50:59 +0000
X-UUID: 18f6653f7d5e4411927a6a0cec29eb25-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=s/Zob46rm/gB42OZlQiOKfWys+tar2a34P8ilcTgUYg=; 
 b=BNKMjaJ/ksGMOaMMvXaZIuOcOcnl9BRlZnrv4Dt8JJKdEZFeDBZqroPPWOyTjNb6zXUTo06i27kaHtZN4MK2FNv+5187z3yCboj+lf6ko9DaOJHvNhLhNPsfwJlighrqHd545+ON3WzxdqYCLE0383JExiAezVRcB6507i27mGQ=;
X-UUID: 18f6653f7d5e4411927a6a0cec29eb25-20191204
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1258338523; Wed, 04 Dec 2019 20:50:51 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 20:51:36 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 12:50:32 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Dec 2019 12:49:50 +0800
Message-ID: <1575521448.24783.11.camel@mtksdaap41>
Subject: Re: [PATCH v3 5/6] drm/mediatek: support CMDQ interface in ddp
 component
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Thu, 5 Dec 2019 12:50:48 +0800
In-Reply-To: <20191204094441.5116-6-bibby.hsieh@mediatek.com>
References: <20191204094441.5116-1-bibby.hsieh@mediatek.com>
 <20191204094441.5116-6-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_205057_384964_122560FE 
X-CRM114-Status: GOOD (  15.76  )
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
Cc: drinkcat@chromium.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

On Wed, 2019-12-04 at 17:44 +0800, Bibby Hsieh wrote:
> The CMDQ (Command Queue) in MT8183 is used to help
> update all relevant display controller registers
> with critical time limation.
> This patch add cmdq interface in ddp_comp interface,
> let all ddp_comp interface can support cpu/cmdq function
> at the same time.
> 
> Signed-off-by: YT Shen <yt.shen@mediatek.com>
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_color.c   |   7 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  65 +++++-----
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  43 ++++---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   8 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 136 +++++++++++++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  31 +++--
>  6 files changed, 197 insertions(+), 93 deletions(-)
> 

[snip]

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 3407d38aff8f..e93e46726de6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -12,7 +12,8 @@
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> -
> +#include <drm/drmP.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
>  #include "mtk_drm_drv.h"
>  #include "mtk_drm_plane.h"
>  #include "mtk_drm_ddp_comp.h"
> @@ -76,36 +77,82 @@
>  #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
>  #define DITHER_ADD_RSHIFT_G(x)			(((x) & 0x7) << 0)
>  
> +void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
> +		   struct mtk_ddp_comp *comp, unsigned int offset)
> +{
> +	if (cmdq_pkt)
> +#ifdef CONFIG_MTK_CMDQ
> +		cmdq_pkt_write(cmdq_pkt, comp->subsys,
> +			       comp->regs_pa + offset, value);
> +#endif
> +	else
> +		writel(value, comp->regs + offset);

If CONFIG_MTK_CMDQ is not defined, this code would become

	if (cmdq_pkt)

	else
		writel(value, comp->regs + offset);

> +}
> +
> +void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
> +			   struct mtk_ddp_comp *comp,
> +			   unsigned int offset)
> +{
> +	if (cmdq_pkt)
> +#ifdef CONFIG_MTK_CMDQ
> +		cmdq_pkt_write(cmdq_pkt, comp->subsys,
> +			       comp->regs_pa + offset, value);
> +#endif
> +	else
> +		writel_relaxed(value, comp->regs + offset);
> +}
> +
> +void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt,
> +			unsigned int value,
> +			struct mtk_ddp_comp *comp,
> +			unsigned int offset,
> +			unsigned int mask)
> +{
> +	if (cmdq_pkt) {
> +#ifdef CONFIG_MTK_CMDQ
> +		cmdq_pkt_write_mask(cmdq_pkt, comp->subsys,
> +				    comp->regs_pa + offset, value, mask);
> +#endif
> +	} else {
> +		u32 tmp = readl(comp->regs + offset);
> +
> +		tmp = (tmp & ~mask) | (value & mask);
> +		writel(tmp, comp->regs + offset);
> +	}
> +}
> +

[snip]

>  
>  static void mtk_gamma_start(struct mtk_ddp_comp *comp)
> @@ -324,6 +371,9 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
>  		      const struct mtk_ddp_comp_funcs *funcs)
>  {
>  	struct platform_device *comp_pdev;
> +	struct resource res;
> +	struct cmdq_client_reg *cmdq_reg;

I think you could simply defined as below, so you need not to allocate
and free.

struct cmdq_client_reg cmdq_reg;

Regards,
CK

> +	int ret = 0;
>  
>  	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
>  		return -EINVAL;
> @@ -358,6 +408,34 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
>  	}
>  	comp->dev = &comp_pdev->dev;
>  
> +#ifdef CONFIG_MTK_CMDQ
> +	if (of_address_to_resource(node, 0, &res) != 0) {
> +		dev_err(dev, "Missing reg in %s node\n",
> +			node->full_name);
> +		return -EINVAL;
> +	}
> +	comp->regs_pa = res.start;
> +
> +	comp_pdev = of_find_device_by_node(node);
> +	if (!comp_pdev) {
> +		dev_warn(dev, "Waiting for component device %s\n",
> +			 node->full_name);
> +		return -EPROBE_DEFER;
> +	}
> +
> +	cmdq_reg = kzalloc(sizeof(*cmdq_reg), GFP_KERNEL);
> +	if (!cmdq_reg)
> +		return -EINVAL;
> +
> +	ret = cmdq_dev_get_client_reg(&comp_pdev->dev, cmdq_reg, 0);
> +	if (ret != 0)
> +		dev_dbg(&comp_pdev->dev,
> +			"get mediatek,gce-client-reg fail!\n");
> +	else
> +		comp->subsys = cmdq_reg->subsys;
> +
> +	kfree(cmdq_reg);
> +#endif
>  	return 0;
>  }
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
