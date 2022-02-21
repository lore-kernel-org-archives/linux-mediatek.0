Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68988C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 01:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fI0EjWQNRahxMkaDqpxd/i51dwQ2+KCTwyM5bTju8bw=; b=GQn0CgL6ncU+bb
	je2ZzSSx6y+H+pvXG8VzDPopPcyC0wcb6SCED8z24kQMDvgDv2LpnifWyhkxrWa7tpohMAAlkEsk6
	3fygY+T+MpI1VgYdK5uqs9gSpGEgIXitPgIsjJ5GRwrirSu44/3em1McU2Qxsa7nM35+Y3wKa48Rl
	9Ogp+TN52833fQ7qi5g4UzcBVuvCbS9RoQ5fwfIsAKPVogmPdBx6zePqxykJFuiOd1Azj/T4A3zyv
	c9PhNyE9Xq4IfhDTUbChOnxV8z0ZXKnqIlTyffAwFleeNwkhS1lg3JyZ23byILfaD2phm7YsrXK5u
	Qf3pkNgqtVkWEDzonxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLxoW-002qco-OD; Mon, 21 Feb 2022 01:48:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLxoK-002qZt-Kp; Mon, 21 Feb 2022 01:48:22 +0000
X-UUID: 68302fb92034409cb7003fd48fba9fb9-20220220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wNNYnA8th71LmXW/JCp3Zubc5lyaCzLvf1qFD9O0vew=; 
 b=TpNQe3X1SrSMjVkORy3N+TdisEyaBP93lhJWuXZkvpv4PGFOJG9Vnc7oMFnV5LsPMS9eDVgVP5BsoyaGOKMIsnlHUTcwxueZ+z66SE37FF+3hlXEUtIx6WPuRZgPbjvBKnfbO1/pW9yc+JqKIMEpn9MQSkxqYLUMSb2XZQXX74Q=;
X-UUID: 68302fb92034409cb7003fd48fba9fb9-20220220
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 989867131; Sun, 20 Feb 2022 18:48:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 17:48:13 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 21 Feb 2022 09:48:12 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 09:48:11 +0800
Message-ID: <af2f8e675baedbe3c6ece234dc5ff296133f65b1.camel@mediatek.com>
Subject: Re: [PATCH V6, 2/5] media: mtk-jpegenc: manage jpegenc multi-hardware
From: kyrie.wu <kyrie.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <irui.wang@mediatek.com>
Date: Mon, 21 Feb 2022 09:48:11 +0800
In-Reply-To: <4e1b549b-748e-94f3-befb-59ceab950297@collabora.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
 <1638501230-13417-3-git-send-email-kyrie.wu@mediatek.com>
 <4e1b549b-748e-94f3-befb-59ceab950297@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_174820_720565_1D143BCC 
X-CRM114-Status: GOOD (  38.26  )
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

On Mon, 2022-02-07 at 15:50 +0100, AngeloGioacchino Del Regno wrote:
> Il 03/12/21 04:13, kyrie.wu ha scritto:
> > manage each hardware information, including irq/clk/power.
> > the hardware includes HW0 and HW1.
> > 
> > Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> 
> Hello Kyrie,
> thanks for the patch!
> 
> However, there are a few things to improve...
> 
> > ---
> > V6: use of_platform_populate to replace component framework
> > to manage multi-hardware
> > ---
> >   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 103 +++++++
> > ---
> >   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  55 +++++
> >   drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 232
> > +++++++++++++++++++++-
> >   3 files changed, 362 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > index a89c7b2..da7eb84 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > @@ -1353,33 +1353,40 @@ static int mtk_jpeg_probe(struct
> > platform_device *pdev)
> >   	spin_lock_init(&jpeg->hw_lock);
> >   	jpeg->dev = &pdev->dev;
> >   	jpeg->variant = of_device_get_match_data(jpeg->dev);
> > -	INIT_DELAYED_WORK(&jpeg->job_timeout_work,
> > mtk_jpeg_job_timeout_work);
> >   
> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
> 
> This has to be rebased... new versions are using
> devm_platform_ioremap_resource(),
> which is shorter and cleaner...
Hi AngeloGioacchino,
Thanks for your kindly reply, I will fix this problem in the next
version.

> 
> > -	if (IS_ERR(jpeg->reg_base)) {
> > -		ret = PTR_ERR(jpeg->reg_base);
> > -		return ret;
> > -	}
> > +	if (!jpeg->variant->is_encoder) {
> 
> What about mediatek,mtk-jpgenc? That's also an encoder... this
> "is_encoder"
> variable is a bit confusing... Is that a newer version of the IP?
> Please, let's find a better name for this variable to avoid
> confusion.
The confusion would modify in the next version.
Thanks.

> 
> 
> > +		INIT_DELAYED_WORK(&jpeg->job_timeout_work,
> > +				mtk_jpeg_job_timeout_work);
> >   
> > -	jpeg_irq = platform_get_irq(pdev, 0);
> > -	if (jpeg_irq < 0) {
> > -		dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n",
> > jpeg_irq);
> > -		return jpeg_irq;
> > -	}
> > +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +		jpeg->reg_base = devm_ioremap_resource(&pdev->dev,
> > res);
> > +		if (IS_ERR(jpeg->reg_base)) {
> > +			ret = PTR_ERR(jpeg->reg_base);
> > +			return ret;
> > +		}
> >   
> > -	ret = devm_request_irq(&pdev->dev, jpeg_irq,
> > -			       jpeg->variant->irq_handler, 0, pdev-
> > >name, jpeg);
> > -	if (ret) {
> > -		dev_err(&pdev->dev, "Failed to request jpeg_irq %d
> > (%d)\n",
> > -			jpeg_irq, ret);
> > -		goto err_req_irq;
> > -	}
> > +		jpeg_irq = platform_get_irq(pdev, 0);
> > +		if (jpeg_irq < 0) {
> > +			dev_err(&pdev->dev, "Failed to get
> > jpeg_irq.\n");
> > +			return jpeg_irq;
> > +		}
> >   
> > -	ret = mtk_jpeg_clk_init(jpeg);
> > -	if (ret) {
> > -		dev_err(&pdev->dev, "Failed to init clk, err %d\n",
> > ret);
> > -		goto err_clk_init;
> > +		ret = devm_request_irq(&pdev->dev, jpeg_irq,
> > +				       jpeg->variant->irq_handler,
> > +					   0, pdev->name, jpeg);
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "Failed to request jpeg_irq
> > %d (%d)\n",
> > +				jpeg_irq, ret);
> > +			goto err_req_irq;
> > +		}
> > +
> > +		ret = mtk_jpeg_clk_init(jpeg);
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "Failed to init clk(%d)\n",
> > ret);
> > +			goto err_clk_init;
> > +		}
> > +
> > +		pm_runtime_enable(&pdev->dev);
> >   	}
> >   
> >   	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
> 
> ...snip...
> 
> /
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > index 1cf037b..4ccda1d 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > @@ -4,12 +4,27 @@
> >    * Author: Xia Jiang <xia.jiang@mediatek.com>
> >    *
> >    */
> > -
> > +#include <linux/clk.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> >   #include <linux/io.h>
> >   #include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
> > +#include <media/media-device.h>
> >   #include <media/videobuf2-core.h>
> >   #include <media/videobuf2-dma-contig.h>
> > +#include <media/videobuf2-v4l2.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/v4l2-dev.h>
> > +#include <media/v4l2-device.h>
> > +#include <media/v4l2-fh.h>
> > +#include <media/v4l2-event.h>
> >   
> > +#include "mtk_jpeg_core.h"
> >   #include "mtk_jpeg_enc_hw.h"
> >   
> >   static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
> > @@ -30,6 +45,21 @@ static const struct mtk_jpeg_enc_qlt
> > mtk_jpeg_enc_quality[] = {
> >   	{.quality_param = 97, .hardware_value = JPEG_ENC_QUALITY_Q97},
> >   };
> >   
> > +#if defined(CONFIG_OF)
> > +static const struct of_device_id mtk_jpegenc_drv_ids[] = {
> 
> There's nothing special in jpgenc1 or, at least, nothing that really
> needs
> us to differentiate between jpgenc0 and jpgenc1, apart knowing which
> core is
> the "main" one, hence, you don't need a special compatible string for
> each core.
> 
> Here's my proposal:
> - Use one compatible "mediatek,mt8195-jpgenc-hw"
> - Add either of:
>    - A bool "mediatek,hw-leader" on core 0; or
>    - A u8 "mediatek,instance" (0, 1, 2 ... for core number)
> 
> A comment is required on "mediatek,instance" though... this way
> should only be
> chosen if it is expected, in the future, to have the following
> situation on
> newer SoCs:
> - More than two cores, and
> - non-interchangeable cores (meaning that, for example, frame 1
> *shall* go to
>    core 1, frame 2 shall go to core 2, frame 3 to core 3, BUT core
> 2/3 are not
>    interchangeable, as in there are reasons to never process frame 2
> on core 3),
>    so this means that it's not important if Linux labels core 3 as
> core 2.
> 
> Otherwise, if it's not expected to have non-interchangeable "hw-
> follower" cores,
> or if more than two cores are not ever expected, "mediatek,hw-leader" 
> is the best
> choice for this.
> 
> Example:
> 
> jpegenc@address {
> 	compatible = "mediatek,mt8195-jpgenc";
> 	reg = < .... >;
> 	ranges = < ....... >;
> 	.... other properties here ....
> 
> 	jpegenc-hw0@relative-address {
> 		compatible = "mediatek,mt8195-jpgenc-hw",
> "mediatek,jpgenc-hw";
> 		iommus, interrupts, other properties here ...
> 		mediatek,hw-leader;
> 	};
> 
> 	jpegenc-hw1@relative-address {
> 		compatible = "mediatek,mt8195-jpgenc-hw",
> "mediatek,jpgenc-hw";
> 		iommus, interrupts, etc.....
> 	};
> };
I will take your suggestion in the next version.
Thanks.
> 
> > +	{
> > +		.compatible = "mediatek,mt8195-jpgenc0",
> > +		.data = (void *)MTK_JPEGENC_HW0,
> > +	},
> > +	{
> > +		.compatible = "mediatek,mt8195-jpgenc1",
> > +		.data = (void *)MTK_JPEGENC_HW1,
> > +	},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);
> > +#endif
> > +
> >   void mtk_jpeg_enc_reset(void __iomem *base)
> >   {
> >   	writel(0, base + JPEG_ENC_RSTB);
> 
> Thanks,
> Angelo
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
