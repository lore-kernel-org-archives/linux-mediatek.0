Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEACC11F66
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:17:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC49E613B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 11:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC49E613B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYkpyNS+VmhJMpZdtVnrQ+GrFyHYkD5hsO6SJ9JD/qc=; b=lGuT/dusmL14nr
	EJlaFZIR8UMBoZkwhKf925FWg06NCIinjF2wax7QjBAjd9t+hapjEI7I/YrJ73smtE/vucJZQcpnP
	QsiW03h/3f1pMNA0iun+qpK/2cwCi1q3q99awTPTTRXJrYrD/Bpo3EduXyQrVMLT1WiWvmShrc0CN
	QgWA8tHUeJYOFOgS09v4LVsQmGm5+O7XxDxaBebsx1GtGEi9Yv0BhV5glisVpcOOy4+D0Rl/J2T9k
	a0+5WzI96WpqDEAVvanO3Kfcoxz15QF+3AUQGMZy6udgIYf5w29MdXwtQgZQJFaYclJxamXVochfB
	n3r3ZpowzJmBXmrkuwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ctY-00DJMB-U9; Wed, 14 Jul 2021 11:17:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ctK-00DJGv-CE; Wed, 14 Jul 2021 11:17:28 +0000
X-UUID: d1822862c27647168d74864bf76dc4fa-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Q6LzrYoLA5I8zE2H4Wb3+h6SVEZjseCiEm0eHzHqVVY=; 
 b=JiVtkM06xC4nE6UJStsIA6kmkDdX55je0twkFO+/96n+I3Oa1YoIRfmeR26E106g6vLb2+YmMDODZ6jRa7Z7FK1PTweGv05XOi99Un7aITO5BV7arMLYja5d64yk02wcXvKHH2V7mtSnE1OlO6oTeqkb/PCYfbhGf8vuVkRcMX8=;
X-UUID: d1822862c27647168d74864bf76dc4fa-20210714
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1683753894; Wed, 14 Jul 2021 04:17:22 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 04:17:20 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Jul 2021 19:17:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 19:17:13 +0800
Message-ID: <1626261434.14352.14.camel@mhfsdcap03>
Subject: Re: [PATCH v6 06/11] drm/mediatek: Add pm runtime support for ovl
 and rdma
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Evan Green <evgreen@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>, "Will
 Deacon" <will.deacon@arm.com>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>, "Nicolas
 Boichat" <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, 
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Xia Jiang <xia.jiang@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Eizan
 Miyamoto" <eizan@chromium.org>, <anthony.huang@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 <yongqiang.niu@mediatek.com>
Date: Wed, 14 Jul 2021 19:17:14 +0800
In-Reply-To: <61aa5aa9-5bd2-e99c-02ef-f5d13526eb43@collabora.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-7-yong.wu@mediatek.com>
 <61aa5aa9-5bd2-e99c-02ef-f5d13526eb43@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 71B93BC55DBF796D54EF11802D7AD481B3722F9B783DF86A1B40DE94AAC8E5FC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_041726_451812_8AFFD815 
X-CRM114-Status: GOOD (  27.39  )
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

On Wed, 2021-07-14 at 10:44 +0200, Dafna Hirschfeld wrote:
> 
> On 14.07.21 04:56, Yong Wu wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > 
> > Prepare for smi cleaning up "mediatek,larb".
> > 
> > Display use the dispsys device to call pm_rumtime_get_sync before.
> > This patch add pm_runtime_xx with ovl and rdma device whose nodes has
> > "iommus" property, then display could help pm_runtime_get for smi via
> > ovl or rdma device.
> > 
> > CC: CK Hu <ck.hu@mediatek.com>
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > (Yong: Use pm_runtime_resume_and_get instead of pm_runtime_get_sync)
> > Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > ---
> >   drivers/gpu/drm/mediatek/mtk_disp_ovl.c  |  9 ++++++++-
> >   drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  9 ++++++++-
> >   drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 12 +++++++++++-
> >   3 files changed, 27 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > index fa9d79963cd3..ea5760f856ec 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -11,6 +11,7 @@
> >   #include <linux/of_device.h>
> >   #include <linux/of_irq.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >   #include <linux/soc/mediatek/mtk-cmdq.h>
> >   
> >   #include "mtk_disp_drv.h"
> > @@ -414,15 +415,21 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
> >   		return ret;
> >   	}
> >   
> > +	pm_runtime_enable(dev);
> > +
> >   	ret = component_add(dev, &mtk_disp_ovl_component_ops);
> > -	if (ret)
> > +	if (ret) {
> > +		pm_runtime_disable(dev);
> >   		dev_err(dev, "Failed to add component: %d\n", ret);
> > +	}
> >   
> >   	return ret;
> >   }
> >   
> >   static int mtk_disp_ovl_remove(struct platform_device *pdev)
> >   {
> > +	pm_runtime_disable(&pdev->dev);
> > +
> >   	return 0;
> >   }
> >   
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > index 705f28ceb4dd..0f31d1c8e37c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> > @@ -9,6 +9,7 @@
> >   #include <linux/of_device.h>
> >   #include <linux/of_irq.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >   #include <linux/soc/mediatek/mtk-cmdq.h>
> >   
> >   #include "mtk_disp_drv.h"
> > @@ -327,9 +328,13 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
> >   
> >   	platform_set_drvdata(pdev, priv);
> >   
> > +	pm_runtime_enable(dev);
> > +
> >   	ret = component_add(dev, &mtk_disp_rdma_component_ops);
> > -	if (ret)
> > +	if (ret) {
> > +		pm_runtime_disable(dev);
> >   		dev_err(dev, "Failed to add component: %d\n", ret);
> > +	}
> >   
> >   	return ret;
> >   }
> > @@ -338,6 +343,8 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
> >   {
> >   	component_del(&pdev->dev, &mtk_disp_rdma_component_ops);
> >   
> > +	pm_runtime_disable(&pdev->dev);
> > +
> >   	return 0;
> >   }
> >   
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 474efb844249..08e3f352377d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -557,9 +557,15 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
> >   		return;
> >   	}
> >   
> > +	ret = pm_runtime_resume_and_get(comp->dev);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n",
> > +			      ret);
> 
> shouldn't the code return in case of failure here?

After confirm with yongqiang, We will fix this in next version.

Thanks.

> 
> Thanks,
> Dafna
> 
> > +
> >   	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
> >   	if (ret) {
> >   		mtk_smi_larb_put(comp->larb_dev);
> > +		pm_runtime_put(comp->dev);
> >   		return;
> >   	}
> >   
> > @@ -572,7 +578,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
> >   {
> >   	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> >   	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
> > -	int i;
> > +	int i, ret;
> >   
> >   	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
> >   	if (!mtk_crtc->enabled)
> > @@ -596,6 +602,10 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
> >   	drm_crtc_vblank_off(crtc);
> >   	mtk_crtc_ddp_hw_fini(mtk_crtc);
> >   	mtk_smi_larb_put(comp->larb_dev);
> > +	ret = pm_runtime_put(comp->dev);
> > +	if (ret < 0)
> > +		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n",
> > +			      ret);
> >   
> >   	mtk_crtc->enabled = false;
> >   }
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
