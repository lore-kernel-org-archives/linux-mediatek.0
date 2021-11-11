Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3C8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 04:00:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8107461284
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 04:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8107461284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvSplQrmSuDKTyaSnEQya/b7eEjiY+N/c1YoERy2HlE=; b=3pifVQB1xCh0sg
	c0b+2lGqbtxA0uDFyMwVELLDe6uybbgWYZ6nzDQG/qbJjxLdjWn9tTKuTBKceWy5NehYzuBCg+DR6
	vrRP4lfCLP8K6vSZpiQgIxOK7YhNXmIZKetkVNHvf9itAE6KWcGL8CAUH9eW1xyDyrbul5U0G0v/5
	LpSWVRwiFhLacs87deINhzFae72OVpRrKGl88tsn2ihMErsc6xLFCVyE3jMRDuvJQRLy9YYgVmNSj
	sn3kFGW0g1+ZaLyYjzs01FdTpzTnYOlhS1xoQYEYAD3tLxRbMji/kkeUBjP4gm8tOI8VrR/zHFb+R
	SqYjnYJENFMev7sSvI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml1Fh-006xo9-OE; Thu, 11 Nov 2021 03:59:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml1FT-006xnO-Jj; Thu, 11 Nov 2021 03:59:43 +0000
X-UUID: a21ac08b91ba4c3d9487a2c533b874db-20211110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BmPM8re7xeHEKsd6eMrBovewOIcxRsiuZHsA4TTSmks=; 
 b=iLCokiw+wgFFVhhiS7aeKc7sXfMAf5RsO92iICUrVc7oj1BXi6C7Ze4Z1iUr0gaYc5Jrrc+5F0VYqCK03xVtOy58je/geuAFmmXSFlTP9gicLHf8XcWgdMg6piRgilFMk5jazvDJYBpSpUhj5bwB76qye9FGw9HzEgCIFle1kcY=;
X-UUID: a21ac08b91ba4c3d9487a2c533b874db-20211110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1578271250; Wed, 10 Nov 2021 20:59:34 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Nov 2021 19:49:32 -0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Nov 2021 11:49:18 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 11 Nov 2021 11:49:16 +0800
Message-ID: <19a4cb1cc774f98bd79a1b3e4d25acfbd190ae28.camel@mediatek.com>
Subject: Re: [PATCH v9, 06/19] media: mtk-vcodec: Manage multi hardware
 information
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 11 Nov 2021 11:49:16 +0800
In-Reply-To: <CA+Px+wXSFkK1o__7YWntGwFXtfWKH65VoSq=783fEPoEH-MwGw@mail.gmail.com>
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-7-yunfei.dong@mediatek.com>
 <CA+Px+wXSFkK1o__7YWntGwFXtfWKH65VoSq=783fEPoEH-MwGw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_195939_829459_29103BFA 
X-CRM114-Status: GOOD (  45.38  )
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

Hi Tzung-Bi,

Thanks for your suggestion.
On Wed, 2021-11-10 at 18:30 +0800, Tzung-Bi Shih wrote:
> On Tue, Nov 09, 2021 at 08:50:17PM +0800, Yunfei Dong wrote:
> > Manage each hardware information which includes irq/power/clk.
> > The hardware includes LAT0, LAT1 and CORE.
> 
> The commit message doesn't explain the code.  Could you provide some
> explanations about how the async mechanism works?  (e.g. A bitmap for
> all sub-devices' readiness ...)
> 
add more detail description for commit message.
> > Reported-by: kernel test robot <lkp@intel.com>
> 
> Apparently wrong tag.
> 
Remove
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c 
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index b7a51e96d4ba..eb2af42aa102 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -18,19 +18,49 @@
> > 
> >  #include "mtk_vcodec_drv.h"
> >  #include "mtk_vcodec_dec.h"
> > +#include "mtk_vcodec_dec_hw.h"
> >  #include "mtk_vcodec_dec_pm.h"
> >  #include "mtk_vcodec_intr.h"
> > -#include "mtk_vcodec_util.h"
> 
> Why does mtk_vcodec_util.h need to remove?
> 
Put #include "mtk_vcodec_util.h" in mtk_vcodec_dec_hw.h.
> > +static int mtk_vcodec_subdev_device_check(struct mtk_vcodec_ctx
> > *ctx)
> > + {
> 
> Remove the extra space.
> 
Fix
> > +     struct mtk_vcodec_dev *vdec_dev = ctx->dev;
> > +     struct platform_device *pdev = vdec_dev->plat_dev;
> > +     struct device_node *subdev_node;
> > +     enum mtk_vdec_hw_id hw_idx;
> > +     const struct of_device_id *of_id;
> > +     int i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(mtk_vdec_hw_match); i++) {
> > +             of_id = &mtk_vdec_hw_match[i];
> > +             subdev_node = of_find_compatible_node(NULL, NULL,
> > +                     of_id->compatible);
> > +             if (!subdev_node)
> > +                     continue;
> > +
> > +             if (!of_device_is_available(subdev_node)) {
> > +                     of_node_put(subdev_node);
> > +                     dev_err(&pdev->dev, "Fail to get MMSYS
> > node\n");
> 
> I am not sure if the error message makes sense about mentioning MMSYS
> here.
> 
Fix with subdev node.
> > +                     continue;
> > +             }
> > +
> > +             hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;
> 
> Does it really need to cast twice?
> 
yes, or will build warning.
> > +             vdec_dev->subdev_node[hw_idx] = subdev_node;
> > +
> > +             if (!test_bit(hw_idx, vdec_dev->hardware_bitmap)) {
> > +                     dev_err(&pdev->dev, "Vdec hw_idx is not ready
> > %d.",
> > +                             hw_idx);
> 
> I would prefer "Vdec %d is not ready\n".
> 
Fix
> > +                     return -EINVAL;
> 
> -EAGAIN makes more sense.
> Fix
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> 
> Would it need to call of_node_put() in the error handling path?
> 
yes, fix it.
> > +static int mtk_vcodec_init_dec_params(struct mtk_vcodec_dev *dev)
> > +{
> 
> I would rather not call them "params".  They are more like
> "resources".
> 
Fix it with resources.
> > +     struct platform_device *pdev = dev->plat_dev;
> > +     int ret;
> > +
> > +     ret = mtk_vcodec_get_reg_bases(dev);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!dev->vdec_pdata->is_subdev_supported) {
> > +             dev->dec_irq = platform_get_irq(pdev, 0);
> > +             if (dev->dec_irq < 0) {
> > +                     dev_err(&pdev->dev, "failed to get irq
> > number");
> > +                     return dev->dec_irq;
> > +             }
> > +
> > +             irq_set_status_flags(dev->dec_irq, IRQ_NOAUTOEN);
> > +             ret = devm_request_irq(&pdev->dev, dev->dec_irq,
> > +                     mtk_vcodec_dec_irq_handler, 0, pdev->name,
> > dev);
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "failed to install dev-
> > >dec_irq %d (%d)",
> > +                             dev->dec_irq, ret);
> > +                     return ret;
> > +             }
> > +
> > +             ret = mtk_vcodec_init_dec_pm(pdev, &dev->pm);
> > +             if (ret < 0) {
> > +                     dev_err(&pdev->dev, "failed to get mt vcodec
> > clock source");
> > +                     return ret;
> > +             }
> > +     }
> 
> I would prefer:
> 
> if (dev->vdec_pdata->is_subdev_supported)
>     return 0;
> 
Fix
> And decrease the indent level by 1 for the following blocks.
> 
> > @@ -329,6 +377,13 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >               goto err_event_workq;
> >       }
> > 
> > +     ret = of_platform_populate(pdev->dev.of_node, NULL, NULL,
> > +             &pdev->dev);
> > +     if (ret) {
> > +             mtk_v4l2_err("Master device of_platform_populate
> > failed.");
> 
> s/Master/Main/
> 
> Doesn't it need to reference `is_subdev_supported` before populating?
> 
Fix
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > new file mode 100644
> > index 000000000000..745be12548ef
> 
> [...]
> > +const struct of_device_id mtk_vdec_hw_match[] = {
> > +     {
> > +             .compatible = "mediatek,mtk-vcodec-lat",
> > +             .data = (void *)MTK_VDEC_LAT0,
> > +     },
> > +     {
> > +             .compatible = "mediatek,mtk-vcodec-core",
> > +             .data = (void *)MTK_VDEC_CORE,
> > +     },
> > +     {},
> > +};
> > +EXPORT_SYMBOL_GPL(mtk_vdec_hw_match);
> 
> Introducing new compatible strings.  Need a dt-bindings patch for
> them.
> 
Add in patch 15.
> > +static int mtk_vdec_hw_probe(struct platform_device *pdev)
> > +{
> 
> [...]
> > +     subdev_dev->reg_base[VDEC_HW_MISC] =
> > +             devm_platform_ioremap_resource_byname(pdev, "misc");
> > +     if (IS_ERR((__force void *)subdev_dev-
> > >reg_base[VDEC_HW_MISC])) {
> > +             ret = PTR_ERR((__force void *)subdev_dev-
> > >reg_base[VDEC_HW_MISC]);
> > +             goto err;
> > +     }
> 
> Resource "misc" needs a dt-bindings patch to explain how to
> use/specify it.
> 
Remove.
> > +     hw_idx = (enum mtk_vdec_hw_id)(uintptr_t)of_id->data;
> 
> Does it really need to cast twice?
> 
yes, or will build warning.
> > +     if (hw_idx < MTK_VDEC_HW_MAX) {
> > +             main_dev->subdev_dev[hw_idx] = subdev_dev;
> > +             subdev_dev->hw_idx = hw_idx;
> > +             subdev_dev->main_dev = main_dev;
> > +             subdev_dev->reg_base[VDEC_HW_SYS] =
> > +                     main_dev->reg_base[VDEC_HW_SYS];
> > +             set_bit(subdev_dev->hw_idx, main_dev-
> > >hardware_bitmap);
> > +     }
> 
> mtk_vcodec_subdev_device_check() doesn't check the value of
> of_id->data.  Does it make more sense to align the
> implementation?  If
> hw_idx is equal to or bigger than MTK_VDEC_HW_MAX, shall it print
> warning messages for example.
> 
bitmap is used to record whether the hardware index is init or not.
Set the hardware index to 1 in bitmap when init done.
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
> 
> [...]
> > +#define VDEC_HW_ACTIVE 0x10
> > +#define VDEC_IRQ_CFG 0x11
> > +#define VDEC_IRQ_CLR 0x10
> > +#define VDEC_IRQ_CFG_REG 0xa4
> 
> If only mtk_vcodec_dec_hw.c uses them, could they move to the file?
> 
Also used in mtk_vcodec_dec_drv.c
> > @@ -423,6 +436,11 @@ struct mtk_vcodec_enc_pdata {
> >   * @pm: power management control
> >   * @dec_capability: used to identify decode capability, ex: 4k
> >   * @enc_capability: used to identify encode capability
> > + *
> > + * @subdev_dev: subdev hardware device
> > + * @subdev_node: subdev node
> > + *
> > + * @hardware_bitmap: used to record hardware is ready or not
> >   */
> >  struct mtk_vcodec_dev {
> >       struct v4l2_device v4l2_dev;
> > @@ -460,6 +478,11 @@ struct mtk_vcodec_dev {
> >       struct mtk_vcodec_pm pm;
> >       unsigned int dec_capability;
> >       unsigned int enc_capability;
> > +
> > +     void *subdev_dev[MTK_VDEC_HW_MAX];
> > +     struct device_node *subdev_node[MTK_VDEC_HW_MAX];
> > +
> > +     DECLARE_BITMAP(hardware_bitmap, MTK_VDEC_HW_MAX);
> 
> I would prefer to use name `subdev_bitmap`.
Fix

Thanks,
Yunfei Dong
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
