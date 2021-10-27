Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62558C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 03:57:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D07161073
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 03:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D07161073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QOH8NcvefTuivMGmrZBhNhp4I1IC8FuY8N59Ozykqs=; b=Z6BDmXwNzYqDC5
	dSE1C/z5KxA6E2skvNHCUi4eJW0cqkIAffB6GDtTZUKsD7XJbMuJKfUgw+lQNVtjC+e/o6vXxK35x
	L54XEKdAULbWll65Iy2pSq1NvRZOGQgTHViaTRutcmSxnt/UbzAwOFDmQndFJuOOjjmt6ZszV6oRt
	hlR5EPgdLr2ZL+897UMwQ2fEhqJ4XGzYFeU4vpRj8IPdrmgsO5umo4Xmrt+a57yrVbBH8YdimZCLC
	BbrDEujmOJaklv/+GMgkYH3YbUNfBZu6UkpBZdBA0gTQZdARg2mO0d1ynayYnhLrUM7IPJIHsbkrt
	1AoHGuNvE9u9jDak3wJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfa4R-003nBL-Mp; Wed, 27 Oct 2021 03:57:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfa4P-003nAj-Ff; Wed, 27 Oct 2021 03:57:47 +0000
X-UUID: cb98573603994ef994b903153fa30188-20211026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9eSb7qn3/LPscD1cplmBdJDI7Pw9AFl6IDdS5bPuJvA=; 
 b=jnt67Z3XJo7LEPdTOJKjqD6v0bb6TijQeF7gzN9v6Sk62AV9HaSPYhze1+HJbpZ294041neRffpfzbdSqGYOhTciQ9UNtYWGqkjRKnCKL2leH1r6a5ji0h0JToNOnirA15EFM/yk3XisFGHte67fmUJ1JStZ0H/TRtvH3KKdVFE=;
X-UUID: cb98573603994ef994b903153fa30188-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1718875898; Tue, 26 Oct 2021 20:57:43 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 20:47:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Oct 2021 11:47:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Oct 2021 11:47:31 +0800
Message-ID: <f72354d3d99c22fd02cbcc2894fee2716934e180.camel@mediatek.com>
Subject: Re: [PATCH v7, 11/15] media: mtk-vcodec: Add core thread
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Oct 2021 11:47:31 +0800
In-Reply-To: <3b7084d4-e530-9a55-11f4-d67c37f8f5fa@collabora.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-12-yunfei.dong@mediatek.com>
 <3b7084d4-e530-9a55-11f4-d67c37f8f5fa@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_205745_549695_F58D8706 
X-CRM114-Status: GOOD (  33.23  )
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

Hi AngeloGioacchino,

Thanks for your suggestion.
On Thu, 2021-10-14 at 12:56 +0200, AngeloGioacchino Del Regno wrote:
> > Core thread:
> > 1. Gets lat_buf from core msg queue.
> > 2. Proceeds core decode.
> > 3. Puts the lat_buf back to lat msg queue.
> > 
> > Both H264 and VP9 rely on the core thread.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> I would be happier to see a better commit message, for example:
> "Introduce a core thread, responsible for... getting lat_buf from ...
> which then proceeds core decode by ... and finally, puts the lat_buf
> back to the lat message queue"
> 
> > ---
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 12 +++++++
> >   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  7 ++++
> >   .../platform/mtk-vcodec/vdec_msg_queue.c      | 32
> > +++++++++++++++++++
> >   .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
> >   4 files changed, 57 insertions(+)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c 
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index e21e0c4bcd86..de83e3b821b4 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -364,6 +364,18 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >   		goto err_dec_pm;
> >   	}
> >   
> > +	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
> > +		vdec_msg_queue_init_ctx(&dev->msg_queue_core_ctx,
> > +			MTK_VDEC_CORE);
> 
> No need to break this line.
> 
Fix in v8.
> > +		dev->kthread_core =
> > kthread_run(vdec_msg_queue_core_thead, dev,
> > +			"mtk-%s", "core");
> 
> Please fix indentation, like so:
> 		dev->kthread_core =
> kthread_run(vdec_msg_queue_core_thead, dev,
> 
> 						"mtk-%s", "core");
> 
> > +		if (IS_ERR(dev->kthread_core)) {
> > +			dev_err(&pdev->dev, "Failed to create core
> > thread");
> > +			ret = PTR_ERR(dev->kthread_core);
> > +			goto err_res;
> > +		}
> > +	}
> > +
> >   	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
> >   		mutex_init(&dev->dec_mutex[i]);
> >   	spin_lock_init(&dev->irqlock);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index 9d072c082f73..68a9b1a2d3b3 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -27,6 +27,7 @@
> >   #define MTK_VCODEC_MAX_PLANES	3
> >   #define MTK_V4L2_BENCHMARK	0
> >   #define WAIT_INTR_TIMEOUT_MS	1000
> > +#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >=
> > MTK_VDEC_LAT_SINGLE_CORE)
> 
> I'd propose to change this to IS_VDEC_LAT_ARCH(hw_arch): that would
> increase human
> readability when using this macro.
> 
Fix in v8.
> >   
> >   /*
> >    * enum mtk_hw_reg_idx - MTK hw register base index
> > @@ -466,6 +467,9 @@ struct mtk_vcodec_enc_pdata {
> >    * @comp_dev: component hardware device
> >    * @component_node: component node
> >    *
> > + * @kthread_core: thread used for core hardware decode
> > + * @msg_queue_core_ctx: msg queue context used for core thread
> > + *
> >    * @hardware_bitmap: used to record hardware is ready or not
> >    */
> >   struct mtk_vcodec_dev {
> > @@ -508,6 +512,9 @@ struct mtk_vcodec_dev {
> >   	void *comp_dev[MTK_VDEC_HW_MAX];
> >   	struct device_node *component_node[MTK_VDEC_HW_MAX];
> >   
> > +	struct task_struct *kthread_core;
> > +	struct vdec_msg_queue_ctx msg_queue_core_ctx;
> > +
> >   	DECLARE_BITMAP(hardware_bitmap, MTK_VDEC_HW_MAX);
> >   };
> >   
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > index d66ed98c79a9..665f571eab4b 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> > @@ -256,3 +256,35 @@ void vdec_msg_queue_deinit(
> >   			kfree(lat_buf->private_data);
> >   	}
> >   }
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
> 
> Is this supposed to really happen?
> I see that this is always initialized in function
> vdec_msg_queue_init().
Fix in v8, using work queue instead of create thread.

Thanks
Yunfei Dong
> 
> Regards,
> - Angelo
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
