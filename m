Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E15C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:44:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF376611AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 08:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF376611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRkESuMHiETSEv2XVJiEyPotcdpCIjMrByXgSmtiBX4=; b=SAI0vRViRrkqaccX3llG3SHBU4
	j3n5OpFnS97syEpe7gyND4u0RYJDIFrzBy1YiDywiZEEUFOv5TwRd6qth6AgmrfIy86RqBY/j/AX6
	rNJWaTP6JV89p0HmaO41YhpfD6zgsOQOmwXsXzaaqD8u/TWTGxTYw4XJhZ44/ldE8Gow2OWIR15Wu
	r4gLrny1gdpR4uvfCp+1MvwhnNcugi7vJN8RALcWgkocx2i+N65EZ0Whi/B68mMn3keqQYRVY8ZOe
	/hf/56HB/tNf5m+IPdUtfYdNRZT+cklRByQ4HuPcpZdJ87X1rUtutZjPvy7TtVPIInHj+oEI7uZDW
	Nv/MQvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3aVF-00ClAQ-Vg; Wed, 14 Jul 2021 08:44:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3aUx-00Cl36-71; Wed, 14 Jul 2021 08:44:09 +0000
Received: from [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623] (unknown
 [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 42F781F42B41;
 Wed, 14 Jul 2021 09:44:04 +0100 (BST)
Subject: Re: [PATCH v6 06/11] drm/mediatek: Add pm runtime support for ovl and
 rdma
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 ming-fan.chen@mediatek.com, yi.kuo@mediatek.com, acourbot@chromium.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, anthony.huang@mediatek.com,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-7-yong.wu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <61aa5aa9-5bd2-e99c-02ef-f5d13526eb43@collabora.com>
Date: Wed, 14 Jul 2021 10:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714025626.5528-7-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_014407_554972_9EAEE8F4 
X-CRM114-Status: GOOD (  27.35  )
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



On 14.07.21 04:56, Yong Wu wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Prepare for smi cleaning up "mediatek,larb".
> 
> Display use the dispsys device to call pm_rumtime_get_sync before.
> This patch add pm_runtime_xx with ovl and rdma device whose nodes has
> "iommus" property, then display could help pm_runtime_get for smi via
> ovl or rdma device.
> 
> CC: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> (Yong: Use pm_runtime_resume_and_get instead of pm_runtime_get_sync)
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c  |  9 ++++++++-
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  9 ++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 12 +++++++++++-
>   3 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index fa9d79963cd3..ea5760f856ec 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -11,6 +11,7 @@
>   #include <linux/of_device.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/soc/mediatek/mtk-cmdq.h>
>   
>   #include "mtk_disp_drv.h"
> @@ -414,15 +415,21 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	pm_runtime_enable(dev);
> +
>   	ret = component_add(dev, &mtk_disp_ovl_component_ops);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_disable(dev);
>   		dev_err(dev, "Failed to add component: %d\n", ret);
> +	}
>   
>   	return ret;
>   }
>   
>   static int mtk_disp_ovl_remove(struct platform_device *pdev)
>   {
> +	pm_runtime_disable(&pdev->dev);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index 705f28ceb4dd..0f31d1c8e37c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -9,6 +9,7 @@
>   #include <linux/of_device.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/soc/mediatek/mtk-cmdq.h>
>   
>   #include "mtk_disp_drv.h"
> @@ -327,9 +328,13 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, priv);
>   
> +	pm_runtime_enable(dev);
> +
>   	ret = component_add(dev, &mtk_disp_rdma_component_ops);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_disable(dev);
>   		dev_err(dev, "Failed to add component: %d\n", ret);
> +	}
>   
>   	return ret;
>   }
> @@ -338,6 +343,8 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
>   {
>   	component_del(&pdev->dev, &mtk_disp_rdma_component_ops);
>   
> +	pm_runtime_disable(&pdev->dev);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 474efb844249..08e3f352377d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -557,9 +557,15 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>   		return;
>   	}
>   
> +	ret = pm_runtime_resume_and_get(comp->dev);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n",
> +			      ret);

shouldn't the code return in case of failure here?

Thanks,
Dafna

> +
>   	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
>   	if (ret) {
>   		mtk_smi_larb_put(comp->larb_dev);
> +		pm_runtime_put(comp->dev);
>   		return;
>   	}
>   
> @@ -572,7 +578,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
>   {
>   	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>   	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
> -	int i;
> +	int i, ret;
>   
>   	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
>   	if (!mtk_crtc->enabled)
> @@ -596,6 +602,10 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
>   	drm_crtc_vblank_off(crtc);
>   	mtk_crtc_ddp_hw_fini(mtk_crtc);
>   	mtk_smi_larb_put(comp->larb_dev);
> +	ret = pm_runtime_put(comp->dev);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n",
> +			      ret);
>   
>   	mtk_crtc->enabled = false;
>   }
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
