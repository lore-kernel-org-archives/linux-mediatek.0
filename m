Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38A5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 03:25:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63A0C6103B
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 03:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63A0C6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3qv5QraPImGqEs72oy5Vh9Axml7xA3pnis6ELAhhyM=; b=y8yihgreDHmd7H
	mXWYDUA8hU+XLiZniLGyxAaZeFPSMDBMbLvUgaer0OXlk7nr+Q2Qe90DYBqvoUHZYayIhB3WqiIf2
	cZMhF8dnG/5uYW/PeaMT1vrHtPqrM+ANC/sjbO1NUH71nIk20T0jq2NU5cDwnAHimKITvBd9gqTUN
	ZLur40Qkjohb8rat+NhtwZl50VUMMMShrzf73yX5FU2n4+eA453UTwdOqzw9FxJ5Q1/Ww2bkQpLXm
	AGU2XrgY7M3GQRUY1qR9QfW7FGiXCUOceuUY32tW5whdTJknK9xqLn1H1pp2LRz8Radx1q5vkScb2
	LWL4M5IyLp2DFNhDoBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgIWL-009dPk-JB; Fri, 29 Oct 2021 03:25:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgIW8-009dNm-Jo; Fri, 29 Oct 2021 03:25:22 +0000
X-UUID: d7fd8763c79c41bcaca3e4051b9347df-20211028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xAZ3nAnsOrl8Ct8D2Vi4hu3IaxpDjpE6ODDFPn66SOM=; 
 b=NuouUxrbI7ngrTBRUGkMvAZ6GV17ls9AQH/NYdPPHWs24q5ZjVozKS4b8b+c3S7qItB+M1u7UNeQUSgFQ0VkzNOk+NRetVcBN7dz52NoPiOEWtYZNc+rNgIVCTTU2ZiiAXAOqESj3Js2+fTwPtrQ5ocHrn8/+C2XF9ld0wiI+qk=;
X-UUID: d7fd8763c79c41bcaca3e4051b9347df-20211028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1380819958; Thu, 28 Oct 2021 20:25:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 20:25:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 29 Oct 2021 11:25:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 29 Oct 2021 11:25:12 +0800
Message-ID: <31ec034a50949e5859fc10bf8e0dfacdb0b6bd50.camel@mediatek.com>
Subject: Re: [PATCH v7, 11/15] media: mtk-vcodec: Add core thread
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
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
Date: Fri, 29 Oct 2021 11:25:12 +0800
In-Reply-To: <YWgitrqT9sWyELpr@fedora>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-12-yunfei.dong@mediatek.com> <YWgitrqT9sWyELpr@fedora>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_202520_680895_80825D56 
X-CRM114-Status: GOOD (  30.86  )
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

Hi Ezequiel,

   1. Thanks for your suggestion.
On Thu, 2021-10-14 at 09:29 -0300, Ezequiel Garcia wrote:
> Hi Yunfei,
> 
> On Mon, Oct 11, 2021 at 03:02:43PM +0800, Yunfei Dong wrote:
> > Core thread:
> > 1. Gets lat_buf from core msg queue.
> > 2. Proceeds core decode.
> > 3. Puts the lat_buf back to lat msg queue.
> > 
> > Both H264 and VP9 rely on the core thread.
> > 
> 
> Avoid the kthread API and instead go with the workqueue API.
> 
> See Documentation/core-api/workqueue.rst and
> include/linux/workqueue.h.
> 
Fix it in patch v8.
> Thanks!
> Ezequiel
> 
Thanks
Yunfei Dong
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 12 +++++++
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  7 ++++
> >  .../platform/mtk-vcodec/vdec_msg_queue.c      | 32
> > +++++++++++++++++++
> >  .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
> >  4 files changed, 57 insertions(+)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c 
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index e21e0c4bcd86..de83e3b821b4 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -364,6 +364,18 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >  		goto err_dec_pm;
> >  	}
> >  
> > +	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> > +		vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx,
> > +			MTK_VDEC_CORE);
> > +		dev->kthread_core =
> > kthread_run(vdec_msg_queue_core_thead, dev,
> > +			"mtk-%s", "core");
> > +		if (IS_ERR(dev->kthread_core)) {
> > +			dev_err(&pdev->dev, "Failed to create core
> > thread");
> > +			ret = PTR_ERR(dev->kthread_core);
> > +			goto err_res;
> > +		}
> > +	}
> > +
> >  	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
> >  		mutex_init(&dev->dec_mutex[i]);
> >  	spin_lock_init(&dev->irqlock);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index 9d072c082f73..68a9b1a2d3b3 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -27,6 +27,7 @@
> >  #define MTK_VCODEC_MAX_PLANES	3
> >  #define MTK_V4L2_BENCHMARK	0
> >  #define WAIT_INTR_TIMEOUT_MS	1000
> > +#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >=
> > MTK_VDEC_LAT_SINGLE_CORE)
> >  
> >  /*
> >   * enum mtk_hw_reg_idx - MTK hw register base index
> > @@ -466,6 +467,9 @@ struct mtk_vcodec_enc_pdata {
> >   * @comp_dev: component hardware device
> >   * @component_node: component node
> >   *
> > + * @kthread_core: thread used for core hardware decode
> > + * @msg_queue_core_ctx: msg queue context used for core thread
> > + *
> >   * @hardware_bitmap: used to record hardware is ready or not
> >   */
> >  struct mtk_vcodec_dev {
> > @@ -508,6 +512,9 @@ struct mtk_vcodec_dev {
> >  	void *comp_dev[MTK_VDEC_HW_MAX];
> >  	struct device_node *component_node[MTK_VDEC_HW_MAX];
> >  
> > +	struct task_struct *kthread_core;
> > +	struct vdec_msg_queue_ctx msg_queue_core_ctx;
> > +
> >  	DECLARE_BITMAP(hardware_bitmap, MTK_VDEC_HW_MAX);
> >  };
> >  
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > index d66ed98c79a9..665f571eab4b 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > @@ -256,3 +256,35 @@ void vdec_msg_queue_deinit(
> >  			kfree(lat_buf->private_data);
> >  	}
> >  }
> > +
> > +int vdec_msg_queue_core_thead(void *data)
> > +{
> > +	struct mtk_vcodec_dev *dev = data;
> > +	struct vdec_lat_buf *lat_buf;
> > +	struct mtk_vcodec_ctx *ctx;
> > +
> > +	set_freezable();
> > +	for (;;) {
> > +		try_to_freeze();
> > +		if (kthread_should_stop())
> > +			break;
> > +
> > +		lat_buf = vdec_msg_queue_dqbuf(&dev-
> > >msg_queue_core_ctx);
> > +		if (!lat_buf)
> > +			continue;
> > +
> > +		ctx = lat_buf->ctx;
> > +		mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
> > +
> > +		if (!lat_buf->core_decode)
> > +			mtk_v4l2_err("Core decode callback func is
> > NULL");
> > +		else
> > +			lat_buf->core_decode(lat_buf);
> > +
> > +		mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
> > +		vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
> > +	}
> > +
> > +	mtk_v4l2_debug(3, "Video Capture Thread End");
> > +	return 0;
> > +}
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > index 1905ce713592..b5745b144140 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > @@ -148,4 +148,10 @@ void vdec_msg_queue_deinit(
> >  	struct vdec_msg_queue *msg_queue,
> >  	struct mtk_vcodec_ctx *ctx);
> >  
> > +/**
> > + * vdec_msg_queue_core_thead - used for core decoder.
> > + * @data: private data used for each codec
> > + */
> > +int vdec_msg_queue_core_thead(void *data);
> > +
> >  #endif
> > -- 
> > 2.25.1
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
