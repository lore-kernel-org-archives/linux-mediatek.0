Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B56C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gy8lGSFU5RBmoxXvp9TegFPqS8GKlJnpsBnNq4Fk3C0=; b=HBSkRTYyEOh2s9
	Atri3Cqw9uQKZuTsiK897+kVgrju+8rhd6yeFWQSCe9YZ37hYm5o0MbhXzLXNXyJ7AeOQ5XP9Gbhq
	vH13RTw2uGADYmSW0W07gluBTwAwGbNhfmfnglWIO/aMksz8btSFVVc7HIdz9GK17vYVFmJloSpWM
	oTMRewAphNoWaWZqOkGHQ0QzXY8/upo6l0TkBT4TY8IL0DJRI7Kdx3uiPNuCcdz42lCgd+oaLMZ5W
	05rl066leWNVjL+L3/vJg2jbQk4r+akmwcHcngCXstt2tJOoVU4dSckekRDhGz/UyyZ9HGi5wL0uf
	/vTLHVPCsoaIyIIKBZsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI4O2-002yX6-46; Thu, 10 Feb 2022 08:01:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI4No-002ySU-Qd; Thu, 10 Feb 2022 08:00:54 +0000
X-UUID: 0adb9630f5bd4c89b25590948b776621-20220210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=B23BWFMXi9iPezRpda4z8wbV5sJxHqqK3SgNUqZsgMI=; 
 b=FkGQcnjSvCyawVbtQH+XAcVkl81uAg0xtQx60WvHS8hTdptseugkQAiDyunhszFz8uYFBqrVTag5iMQOvV5s01SdRl9kxlP3G0Fndiz86tki2SLuxzaMo0GNBEla/vkBE1Xbr1fD0XOJWbU7P1kXFnZjh7YYfFA3hmXb8XCMBGY=;
X-UUID: 0adb9630f5bd4c89b25590948b776621-20220210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 802628450; Thu, 10 Feb 2022 01:00:48 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 23:50:46 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 10 Feb 2022 15:50:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 15:50:42 +0800
Message-ID: <ebb92c1c8c584464245da68e42bcafac2170558c.camel@mediatek.com>
Subject: Re: [RFC PATCH] component: Add common helpers for compare/release
 functions
From: Yong Wu <yong.wu@mediatek.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, "James
 Wang" <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 <iommu@lists.linux-foundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, <linux-kernel@vger.kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-mediatek@lists.infradead.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Stephen
 Boyd" <sboyd@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa
 <tfiga@chromium.org>, <srv_heupstream@mediatek.com>, Rob Clark
 <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sebastian Reichel <sre@kernel.org>
Date: Thu, 10 Feb 2022 15:50:43 +0800
In-Reply-To: <YfRtGF3v+BwH5RkG@phenom.ffwll.local>
References: <20220128081101.27837-1-yong.wu@mediatek.com>
 <YfRtGF3v+BwH5RkG@phenom.ffwll.local>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_000052_897634_6C34A2FC 
X-CRM114-Status: GOOD (  33.33  )
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

On Fri, 2022-01-28 at 23:24 +0100, Daniel Vetter wrote:
> On Fri, Jan 28, 2022 at 04:11:01PM +0800, Yong Wu wrote:
> > The component requires the compare/release functions, there are so
> > many
> > copy in current kernel. Just define three common helpers for them.
> > No functional change.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> > Base on v5.17-rc1
> > ---
> >  .../gpu/drm/arm/display/komeda/komeda_drv.c    |  5 -----
> >  drivers/gpu/drm/arm/hdlcd_drv.c                |  7 +------
> >  drivers/gpu/drm/armada/armada_drv.c            |  5 -----
> >  drivers/gpu/drm/drm_of.c                       |  8 +-------
> >  drivers/gpu/drm/etnaviv/etnaviv_drv.c          |  7 -------
> >  drivers/gpu/drm/exynos/exynos_drm_drv.c        |  5 -----
> >  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c    |  5 -----
> >  drivers/gpu/drm/imx/imx-drm-core.c             |  4 ++--
> >  drivers/gpu/drm/ingenic/ingenic-drm-drv.c      |  5 -----
> >  drivers/gpu/drm/mcde/mcde_drv.c                |  7 +------
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c         |  5 -----
> >  drivers/gpu/drm/meson/meson_drv.c              |  8 --------
> >  drivers/gpu/drm/msm/msm_drv.c                  |  9 ---------
> >  drivers/gpu/drm/omapdrm/dss/dss.c              |  8 +-------
> >  drivers/gpu/drm/rockchip/rockchip_drm_drv.c    |  5 -----
> >  drivers/gpu/drm/sti/sti_drv.c                  |  5 -----
> >  drivers/gpu/drm/sun4i/sun4i_drv.c              |  9 ---------
> >  drivers/gpu/drm/vc4/vc4_drv.c                  |  5 -----
> >  drivers/iommu/mtk_iommu.h                      | 10 ----------
> >  drivers/power/supply/ab8500_charger.c          |  8 +-------
> >  drivers/video/fbdev/omap2/omapfb/dss/dss.c     |  8 +-------
> >  include/linux/component.h                      | 18
> > ++++++++++++++++++
> >  sound/soc/codecs/wcd938x.c                     | 16 ++----------
> > ----
> 
> Seems like a neat idea. Please add kerneldoc for the new functions
> you're
> adding (bonus point for an example in there) and make sure it all
> renders
> correctly in

OK, I will add it.

> 
> $ make htmldoc

sorry, I still need some time to run this in my environment.

> 
> Also please split up the patch series per-driver and add the
> maintainers
> to each patches' Cc: list. With that I think this should be ready for
> merging.

In the orignal idea, I thought the name compare_of/release_of was
enough, thus I squashed them into one patch, otherwise, it may cause
build fail due to redefinition when bisecting.

From Jani, It's better to add a namespace for the function name,
something like comp_ or component_?

If the function name is changed, then I could split them. A question:
The biggest change are in DRM, and all of these patches will go
together. Maybe all the DRM parts could be in one patch, to avoid so
many small patches, is this ok? or We'd better create a patch per a drm
driver.

In the end, then the code should be something like:

--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -287,6 +287,24 @@ static void take_down_master(struct master
*master)
        }
 }

+int component_compare_of(struct device *dev, void *data)
+{
+       return device_match_of_node(dev, data);
+}
+EXPORT_SYMBOL_GPL(component_compare_of);
+
+void component_release_of(struct device *dev, void *data)
+{
+       of_node_put(data);
+}
+EXPORT_SYMBOL_GPL(component_release_of);

> 
> Cheers, Daniel
> 
> >  23 files changed, 28 insertions(+), 144 deletions(-)

> > diff --git a/include/linux/component.h b/include/linux/component.h
> > index 16de18f473d7..5a7468ea827c 100644
> > --- a/include/linux/component.h
> > +++ b/include/linux/component.h
> > @@ -2,6 +2,8 @@
> >  #ifndef COMPONENT_H
> >  #define COMPONENT_H
> >  
> > +#include <linux/device.h>
> > +#include <linux/of.h>
> >  #include <linux/stddef.h>
> >  
> >  
> > @@ -82,6 +84,22 @@ struct component_master_ops {
> >  	void (*unbind)(struct device *master);
> >  };
> >  
> > +/* A set common helpers for compare/release functions */
> > +static inline int compare_of(struct device *dev, void *data)
> > +{
> > +	return dev->of_node == data;
> > +}
> > +
> > +static inline void release_of(struct device *dev, void *data)
> > +{
> > +	of_node_put(data);
> > +}
> > +
> > +static inline int compare_dev(struct device *dev, void *data)
> > +{
> > +	return dev == data;
> > +}
> > +
> >  void component_master_del(struct device *,
> >  	const struct component_master_ops *);
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
