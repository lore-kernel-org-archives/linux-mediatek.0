Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973ACC47094
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 12:01:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CDC7613CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 12:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CDC7613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AXcvzKQbW2uwERygKiU8SSk2wXThM/jwvx9ae1/XgQ=; b=v2YZqV+uY3D3f4
	EwP7ErtFAGPhu7BT9pDfUSejx3+ofKB74ep+X56XOfyVE7paFKdaBhoUpdz80UU1aIn1/0KiiZphU
	MJK7NRs8RV6mVTNqOaPuwDz5TeQPOVtgk7dl79bPxSr2zYg8Js/k5IALTyB03kHOUmhuLIeWBKl7a
	XiAdRC/eOXf0/dWP99I8GbTrv1xVngIc7BjrJjwzFWA9BvKI8SJsFHojm+3e9yLcQQTrce05tgMo4
	GsSl3fOZ4lAItMr9qZGsGebbuKI9/Vvrfj2bnO4y+H4kTIOf/mzjs6Rle55Xl9xEY6MsSM8DpgKr0
	dAR7ceEYOlOC1AnEvHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrJMd-000bcm-OY; Thu, 10 Jun 2021 12:00:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrJMO-000bZC-70; Thu, 10 Jun 2021 12:00:35 +0000
X-UUID: 52f6f930da524208b55f018d2fecdba3-20210610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tlUPqFBYcu/rjIdxpBkPwMA/VWMkzOdQO1eIjrE31tg=; 
 b=ZmPAml7Eq8FNNVDjfF9wMF37GRSM3u/M4AtRQOscfwj0NbFrU+wt2ynUifiZttoGgGmIV0K4O8cETjMbVL+zDCCyCKu0Pmoe6mGPqEErKcfi2jbkEfKNF+K4uffCvIin0fVOn3e7sq69qvMRrMD/ENBkY5Um5g+NMM42SWsy66M=;
X-UUID: 52f6f930da524208b55f018d2fecdba3-20210610
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 167832626; Thu, 10 Jun 2021 05:00:25 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 05:00:23 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Jun 2021 20:00:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Jun 2021 20:00:18 +0800
Message-ID: <1623326418.23717.18.camel@mhfsdcap03>
Subject: Re: [PATCH v5 11/16] drm/mediatek: Get rid of mtk_smi_larb_get/put
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Evan Green" <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 "Tomasz Figa" <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, "Matthias
 Kaehlcke" <mka@chromium.org>, <anan.sun@mediatek.com>,
 <chao.hao@mediatek.com>, <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, 
 <eizan@chromium.org>, <acourbot@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 10 Jun 2021 20:00:18 +0800
In-Reply-To: <6f3bfbeb-e7d4-249e-b4f0-da1825fec461@collabora.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-12-yong.wu@mediatek.com>
 <6f3bfbeb-e7d4-249e-b4f0-da1825fec461@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5BEB4821D74113F0BEB303285223F2F9684DE83B6E5B1323D11FBD40F26FC9382000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_050032_287287_E0E9478D 
X-CRM114-Status: GOOD (  29.15  )
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

On Wed, 2021-05-26 at 08:41 +0300, Dafna Hirschfeld wrote:
> Hi
> 
> On 10.04.21 12:11, Yong Wu wrote:
> > MediaTek IOMMU has already added the device_link between the consumer
> > and smi-larb device. If the drm device call the pm_runtime_get_sync,
> > the smi-larb's pm_runtime_get_sync also be called automatically.
> > 
> > CC: CK Hu <ck.hu@mediatek.com>
> > CC: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: Evan Green <evgreen@chromium.org>
> > Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  9 ------
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 35 ---------------------
> >   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 -
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  5 +--
> >   4 files changed, 1 insertion(+), 49 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 971ef58ac1dc..d59353af4019 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -10,7 +10,6 @@
> >   #include <linux/soc/mediatek/mtk-mutex.h>
> >   
> >   #include <asm/barrier.h>
> > -#include <soc/mediatek/smi.h>
> >   
> >   #include <drm/drm_atomic.h>
> >   #include <drm/drm_atomic_helper.h>
> > @@ -544,12 +543,6 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
> >   
> >   	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
> >   
> > -	ret = mtk_smi_larb_get(comp->larb_dev);
> > -	if (ret) {
> > -		DRM_ERROR("Failed to get larb: %d\n", ret);
> > -		return;
> > -	}
> > -
> >   	ret = pm_runtime_resume_and_get(comp->dev);
> >   	if (ret < 0)
> >   		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n",
> > @@ -557,7 +550,6 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
> >   
> >   	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
> >   	if (ret) {
> > -		mtk_smi_larb_put(comp->larb_dev);
> >   		pm_runtime_put(comp->dev);
> >   		return;
> >   	}
> > @@ -594,7 +586,6 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
> >   
> >   	drm_crtc_vblank_off(crtc);
> >   	mtk_crtc_ddp_hw_fini(mtk_crtc);
> > -	mtk_smi_larb_put(comp->larb_dev);
> >   	ret = pm_runtime_put(comp->dev);
> >   	if (ret < 0)
> >   		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n",
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index 75bc00e17fc4..6c01492ba4df 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -449,37 +449,12 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
> >   	return ret;
> >   }
> >   
> > -static int mtk_ddp_get_larb_dev(struct device_node *node, struct mtk_ddp_comp *comp,
> > -				struct device *dev)
> > -{
> > -	struct device_node *larb_node;
> > -	struct platform_device *larb_pdev;
> > -
> > -	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
> > -	if (!larb_node) {
> > -		dev_err(dev, "Missing mediadek,larb phandle in %pOF node\n", node);
> > -		return -EINVAL;
> > -	}
> > -
> > -	larb_pdev = of_find_device_by_node(larb_node);
> > -	if (!larb_pdev) {
> > -		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
> > -		of_node_put(larb_node);
> > -		return -EPROBE_DEFER;
> > -	}
> > -	of_node_put(larb_node);
> > -	comp->larb_dev = &larb_pdev->dev;
> > -
> > -	return 0;
> > -}
> > -
> >   int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
> >   		      enum mtk_ddp_comp_id comp_id)
> >   {
> >   	struct platform_device *comp_pdev;
> >   	enum mtk_ddp_comp_type type;
> >   	struct mtk_ddp_comp_dev *priv;
> > -	int ret;
> Hi,
> 
> This 'ret' is also used inside `if IS_REACHABLE(CONFIG_MTK_CMDQ)`
> so it  should not be removed.

Hi Dafna,

Thanks very much for pointing out. Apparently I didn't enable this to
build. Sorry for this.

I will fix it in next version.

> 
> Thanks,
> Dafna
> 
> >   
> >   	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
> >   		return -EINVAL;
> > @@ -495,16 +470,6 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
> >   	}
> >   	comp->dev = &comp_pdev->dev;
> >   
> > -	/* Only DMA capable components need the LARB property */
> > -	if (type == MTK_DISP_OVL ||
> > -	    type == MTK_DISP_OVL_2L ||
> > -	    type == MTK_DISP_RDMA ||
> > -	    type == MTK_DISP_WDMA) {
> > -		ret = mtk_ddp_get_larb_dev(node, comp, comp->dev);
> > -		if (ret)
> > -			return ret;
> > -	}
> > -
> >   	if (type == MTK_DISP_BLS ||
> >   	    type == MTK_DISP_CCORR ||
> >   	    type == MTK_DISP_COLOR ||
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index bb914d976cf5..1b582262b682 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -70,7 +70,6 @@ struct mtk_ddp_comp_funcs {
> >   struct mtk_ddp_comp {
> >   	struct device *dev;
> >   	int irq;
> > -	struct device *larb_dev;
> >   	enum mtk_ddp_comp_id id;
> >   	const struct mtk_ddp_comp_funcs *funcs;
> >   };
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index b013d56d2777..622de47239eb 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -576,11 +576,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
> >   	pm_runtime_disable(dev);
> >   err_node:
> >   	of_node_put(private->mutex_node);
> > -	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++) {
> > +	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
> >   		of_node_put(private->comp_node[i]);
> > -		if (private->ddp_comp[i].larb_dev)
> > -			put_device(private->ddp_comp[i].larb_dev);
> > -	}
> >   	return ret;
> >   }
> >   
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
