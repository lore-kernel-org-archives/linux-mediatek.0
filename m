Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE963C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 03:30:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83A6061529
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 03:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83A6061529
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXQoUti/wZrkIH0d/akTv/Got04Z2sheyQ+jEWVAzKc=; b=XfkPAS8uc5k3xq
	mDzem9OExXXPElfqfz9wEURMkdCulXwFgSUQtne5Ln3gwIJcdr8fRaaqeHCCgDDoyM+E792yYkJYP
	x8R1JSd39IZXcIsnbj0K03+PpObcijbjRu+1MhtduZBdsQPGT2VPmaA3b3VtnA4/+TlzRC1NSdGdz
	zLOFqUXsytPRDKsCL2UCDmqpwD6RIxvxlsR6aDI8wuNxGl9J19gmWBPkItjU3+jPEnhVit0q8uvaB
	N46mDGdK26xMXYoCvQDWWy3v1i407tU4jVi5hEbOkRF8/syDa7298aMOtwdxK/PKIbZSc0pc4z7YL
	FaaglbcwK3mQ0hG/z5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVmld-00CsZj-DU; Thu, 30 Sep 2021 03:29:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVmlQ-00CsYT-S7; Thu, 30 Sep 2021 03:29:42 +0000
X-UUID: b6097c29e0fb4999b572b326de86b390-20210929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PUbrJ3OGRNIhFg0lP0OUuhqkMUmrG7lCbGwhX9NNv8I=; 
 b=fyhWP3a8ryvYzvl/+BcS1BevoTk8b7BSv/6fXTrv/0FJHzhAzSJ9EvZsZZOdtHQCJpzPezquq8qd8ib5G+etIueXIhiV6osK9o/XNzlJRd14yCGqik5DCS7rzqn/9x2GItVxSYy7jrBQPSt1k+koUgmZjtjH7drpKIqvXeprZhA=;
X-UUID: b6097c29e0fb4999b572b326de86b390-20210929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1219215237; Wed, 29 Sep 2021 20:29:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Sep 2021 20:28:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 30 Sep 2021 11:28:11 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Sep 2021 11:28:09 +0800
Message-ID: <79cbf64491273797f218f417234b8c95936bd3b1.camel@mediatek.com>
Subject: Re: [PATCH v8 09/12] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>, <acourbot@chromium.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Irui Wang <irui.wang@mediatek.com>
Date: Thu, 30 Sep 2021 11:28:12 +0800
In-Reply-To: <02f444d5-9633-3f9c-2d1f-97ce073d1180@collabora.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-10-yong.wu@mediatek.com>
 <02f444d5-9633-3f9c-2d1f-97ce073d1180@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_202940_920930_CE041D97 
X-CRM114-Status: GOOD (  28.59  )
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

Hi Dafna,

Thanks very much for the review.

On Wed, 2021-09-29 at 14:13 +0200, Dafna Hirschfeld wrote:
> 
> On 29.09.21 03:37, Yong Wu wrote:
> > MediaTek IOMMU has already added the device_link between the
> > consumer
> > and smi-larb device. If the vcodec device call the
> > pm_runtime_get_sync,
> > the smi-larb's pm_runtime_get_sync also be called automatically.
> > 
> > CC: Tiffany Lin <tiffany.lin@mediatek.com>
> > CC: Irui Wang <irui.wang@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > Reviewed-by: Evan Green <evgreen@chromium.org>
> > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 +++-----------
> > --
> >   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
> >   .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
> >   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 +++-----------
> > -----
> >   4 files changed, 10 insertions(+), 75 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > index 6038db96f71c..d0bf9aa3b29d 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > @@ -8,14 +8,12 @@
> >   #include <linux/of_address.h>
> >   #include <linux/of_platform.h>
> >   #include <linux/pm_runtime.h>
> > -#include <soc/mediatek/smi.h>
> >   
> >   #include "mtk_vcodec_dec_pm.h"
> >   #include "mtk_vcodec_util.h"
> >   
> >   int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
> >   {
> > -	struct device_node *node;
> >   	struct platform_device *pdev;
> >   	struct mtk_vcodec_pm *pm;
> >   	struct mtk_vcodec_clk *dec_clk;
> > @@ -26,18 +24,7 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev
> > *mtkdev)
> >   	pm = &mtkdev->pm;
> >   	pm->mtkdev = mtkdev;
> >   	dec_clk = &pm->vdec_clk;
> > -	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
> > -	if (!node) {
> > -		mtk_v4l2_err("of_parse_phandle mediatek,larb fail!");
> > -		return -1;
> > -	}
> >   
> > -	pdev = of_find_device_by_node(node);
> > -	of_node_put(node);
> > -	if (WARN_ON(!pdev)) {
> > -		return -1;
> > -	}
> > -	pm->larbvdec = &pdev->dev;
> >   	pdev = mtkdev->plat_dev;
> >   	pm->dev = &pdev->dev;
> >   
> > @@ -47,14 +34,11 @@ int mtk_vcodec_init_dec_pm(struct
> > mtk_vcodec_dev *mtkdev)
> >   		dec_clk->clk_info = devm_kcalloc(&pdev->dev,
> >   			dec_clk->clk_num, sizeof(*clk_info),
> >   			GFP_KERNEL);
> > -		if (!dec_clk->clk_info) {
> > -			ret = -ENOMEM;
> > -			goto put_device;
> > -		}
> > +		if (!dec_clk->clk_info)
> > +			return -ENOMEM;
> >   	} else {
> >   		mtk_v4l2_err("Failed to get vdec clock count");
> > -		ret = -EINVAL;
> > -		goto put_device;
> > +		return -EINVAL;
> >   	}
> >   
> >   	for (i = 0; i < dec_clk->clk_num; i++) {
> > @@ -63,29 +47,24 @@ int mtk_vcodec_init_dec_pm(struct
> > mtk_vcodec_dev *mtkdev)
> >   			"clock-names", i, &clk_info->clk_name);
> >   		if (ret) {
> >   			mtk_v4l2_err("Failed to get clock name id =
> > %d", i);
> > -			goto put_device;
> > +			return ret;
> >   		}
> >   		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
> >   			clk_info->clk_name);
> >   		if (IS_ERR(clk_info->vcodec_clk)) {
> >   			mtk_v4l2_err("devm_clk_get (%d)%s fail", i,
> >   				clk_info->clk_name);
> > -			ret = PTR_ERR(clk_info->vcodec_clk);
> > -			goto put_device;
> > +			return PTR_ERR(clk_info->vcodec_clk);
> >   		}
> >   	}
> >   
> >   	pm_runtime_enable(&pdev->dev);
> >   	return 0;
> > -put_device:
> > -	put_device(pm->larbvdec);
> > -	return ret;
> >   }
> >   
> >   void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
> >   {
> >   	pm_runtime_disable(dev->pm.dev);
> > -	put_device(dev->pm.larbvdec);
> >   }
> 
> Now that functions only do  'pm_runtime_disable(dev->pm.dev);' so it
> will be more
> readable to remove the function mtk_vcodec_release_dec_pm
> and replace with pm_runtime_disable(dev->pm.dev);
> Same for the 'enc' equivalent.

Make sense. But It may be not proper if using pm_runtime_disable
as the symmetry with mtk_vcodec_init_dec_pm in the mtk_vcodec_probe.

Maybe we should move pm_runtime_enable out from mtk_vcodec_init_dec_pm
into mtk_vcodec_probe. I could do a new patch for this. Is this ok for
you?

> 
> Thanks,
> Dafna

[snip]
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
