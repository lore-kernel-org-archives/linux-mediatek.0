Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69954C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0TEPIKvTMelMvDIa53wQD/fXQmWCneTwZdZhTKVAVw=; b=uZWX8TCpbG6+EHZFGdj9qSCw9v
	b++usqpwMYlMQYB1y4NciPcldy9xX24OtfqojsJt281T4ymuUpzWZnLI3WZYZP2XB+CWHRQurhwgv
	8v666D3MiVUTQs33NKJu/cGtoyFxfBeqphsM9uRdlD1Gy4YX0UNpg7TTW5ZGJUaRZsm/7CQ9k9Hh0
	d+Xvo7k7SJ0vNuz758mOcEq1SLLiEjNksyfR46XAf0e5DJko8qZHfgDnsKDdN+nDXFnim/WOashZp
	lOUBEEL8/Xi2bCodUz4HDeedHMwF3KvdIlgrM0RMB2IWWkobJ1AXuj8XOm6buvmiPzj46Xg11JjEj
	MZA4nN+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRAE-0000000BWqY-3Byy;
	Mon, 29 Jul 2024 14:15:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYR9m-0000000BWjk-1KNR;
	Mon, 29 Jul 2024 14:15:24 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 088FF229;
	Mon, 29 Jul 2024 16:14:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722262473;
	bh=Dsx+wQDpQZBV6jgYIBuibYg69MaOvR6sl7gc+MNvXCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nw+PdMEmiHulb82E2wbq5gWTzJuGJYuutZwFznRuA0KH9TXb3ypLpqvFIkPYK/TFm
	 tporQ5xcUF8vJwIlRSJ6wv6Q7qa8ewt4X6NyrP8Bgoy4B++zUBpuHxFtGENdAQLAVr
	 QALTeiCNdekNbpIJ76Szr/qKm4fVmDuFjd/Cmqmg=
Date: Mon, 29 Jul 2024 17:14:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	Andy Hsieh =?utf-8?B?KOisneaZuueakyk=?= <Andy.Hsieh@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>,
	"pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Message-ID: <20240729141459.GA1552@pendragon.ideasonboard.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
 <85c54f0b1b8bb5d9026c67109a3526fd95cc013b.camel@mediatek.com>
 <CAEHHSvZ2etjPKq0MqHYD=hjs19Yy+DJLwXGGorJK7q2tW2dfRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEHHSvZ2etjPKq0MqHYD=hjs19Yy+DJLwXGGorJK7q2tW2dfRQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_071522_531323_46BF4998 
X-CRM114-Status: GOOD (  30.65  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 29, 2024 at 03:40:09PM +0200, Julien Stephan wrote:
> Le jeu. 18 juil. 2024 à 04:54, CK Hu (胡俊光) <ck.hu@mediatek.com> a écrit :
> >
> > Hi, Julien:
> >
> > On Thu, 2024-07-04 at 15:36 +0200, Julien Stephan wrote:
> > >
> > > External email : Please do not click links or open attachments until you have verified the sender or the content.
> > >  From: Phi-bang Nguyen <pnguyen@baylibre.com>
> > >
> > > This driver provides a path to bypass the SoC ISP so that image data
> > > coming from the SENINF can go directly into memory without any image
> > > processing. This allows the use of an external ISP.
> > >
> > > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > > [Paul Elder fix irq locking]
> > > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > > ---
> >
> > [snip]
> >
> > > +static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
> > > +       unsigned int count)
> > > +{
> > > +struct mtk_cam_dev *cam = vb2_get_drv_priv(vq);
> > > +struct mtk_cam_dev_buffer *buf;
> > > +struct mtk_cam_video_device *vdev =
> > > +vb2_queue_to_mtk_cam_video_device(vq);
> > > +struct device *dev = cam->dev;
> > > +const struct v4l2_pix_format_mplane *fmt = &vdev->format;
> > > +int ret;
> > > +unsigned long flags;
> > > +
> > > +if (pm_runtime_get_sync(dev) < 0) {
> > > +dev_err(dev, "failed to get pm_runtime\n");
> > > +pm_runtime_put_autosuspend(dev);
> > > +return -1;
> > > +}
> > > +
> > > +(*cam->hw_functions->mtk_cam_setup)(cam, fmt->width, fmt->height,
> > > +fmt->plane_fmt[0].bytesperline, vdev->fmtinfo->code);
> > > +
> > > +
> > > +/* Enable CMOS and VF */
> > > +mtk_cam_cmos_vf_enable(cam, true, true);
> > > +
> > > +mutex_lock(&cam->op_lock);
> > > +
> > > +ret = mtk_cam_verify_format(cam);
> > > +if (ret < 0)
> > > +goto fail_unlock;
> > > +
> > > +/* Start streaming of the whole pipeline now*/
> > > +if (!cam->pipeline.start_count) {
> > > +ret = media_pipeline_start(vdev->vdev.entity.pads,
> > > +   &cam->pipeline);
> > > +if (ret) {
> > > +dev_err(dev, "failed to start pipeline:%d\n", ret);
> > > +goto fail_unlock;
> > > +}
> > > +}
> > > +
> > > +/* Media links are fixed after media_pipeline_start */
> > > +cam->stream_count++;
> > > +
> > > +cam->sequence = (unsigned int)-1;
> > > +
> > > +/* Stream on the sub-device */
> > > +ret = v4l2_subdev_call(&cam->subdev, video, s_stream, 1);
> > > +if (ret)
> > > +goto fail_no_stream;
> > > +
> > > +mutex_unlock(&cam->op_lock);
> > > +
> > > +/* Create dummy buffer */
> > > +cam->dummy_size = fmt->plane_fmt[0].sizeimage;
> > > +
> > > +cam->dummy.vaddr = dma_alloc_coherent(cam->dev, cam->dummy_size,
> > > +      &cam->dummy.daddr, GFP_KERNEL);
> >
> > Dummy buffer cost much in DRAM footprint. I think we can get rid of
> > this dummy buffer. If no buffer is queued from user space, call
> > mtk_camsv30_cmos_vf_hw_disable() to stop write data into DRAM. After
> > buffer is queued from user space, call mtk_camsv30_cmos_vf_hw_enable()
> > to start write data into DRAM.
> 
> Hi CK,
> 
> IMHO it does not cost that much. A long time ago, we tried to remove
> it, but we faced an issue (can't remember what :/).
> Moreover, some other driver already uses the dummy buffer
> implementation, if I am not wrong.

The hardware have a CAMSV_IMGO_SV_STRIDE register. What happens if you
set the stride to 0 instead of bytesperline ? Will the hardware write
repeatedly over the same line ? If so you can allocate a scratch buffer
of a single line.

You will need to ensure that, whenever you reconfigure the device, the
stride and buffer address will always be programmed atomically. If you
switch to the line buffer and the image starts before the stride is
reconfigure, bad things will happen.

Stopping the DMA is another solution that would I think be even better
if that can be done quickly (without waiting synchronously for the end
of the next frame), and if restarting is equally quick.

> > > +if (!cam->dummy.vaddr) {
> > > +ret = -ENOMEM;
> > > +goto fail_no_buffer;
> > > +}
> > > +
> > > +/* update first buffer address */
> > > +
> > > +/* added the buffer into the tracking list */
> > > +spin_lock_irqsave(&cam->irqlock, flags);
> > > +if (list_empty(&cam->buf_list)) {
> > > +(*cam->hw_functions->mtk_cam_update_buffers_add)(cam, &cam->dummy);
> > > +cam->is_dummy_used = true;
> > > +} else {
> > > +buf = list_first_entry_or_null(&cam->buf_list,
> > > +       struct mtk_cam_dev_buffer,
> > > +       list);
> > > +(*cam->hw_functions->mtk_cam_update_buffers_add)(cam, buf);
> > > +cam->is_dummy_used = false;
> > > +}
> > > +spin_unlock_irqrestore(&cam->irqlock, flags);
> > > +
> > > +return 0;
> > > +
> > > +fail_no_buffer:
> > > +mutex_lock(&cam->op_lock);
> > > +v4l2_subdev_call(&cam->subdev, video, s_stream, 0);
> > > +fail_no_stream:
> > > +cam->stream_count--;
> > > +if (cam->stream_count == 0)
> > > +media_pipeline_stop(vdev->vdev.entity.pads);
> > > +fail_unlock:
> > > +mutex_unlock(&cam->op_lock);
> > > +mtk_cam_vb2_return_all_buffers(cam, VB2_BUF_STATE_QUEUED);
> > > +
> > > +return ret;
> > > +}
> > > +

-- 
Regards,

Laurent Pinchart

