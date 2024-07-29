Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C76C3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 13:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OybnryKVs2UqunE+HbITQkTW5YxjXd43/aMmkgTPKM=; b=EMM9vmfH3TgQL6E98PUdUgnO+e
	h2CRYJZcd38cjVH664dF0+6e6GSM3qaLhlVWAeXtevvcUKxhRUd/QtDuXdAqyDJcv4sxycPVVfOai
	wmCKweCg4C9SOmArZ2CIo15hnYfZe0PMZzhgLDV1Q5tw3dVm7JeCmN0sqD8K//es9QPUIluyZVE3U
	KbgQun5EoSDPBsJ05edN7TjR5VmhHv6FcBCrNthvi9SH4uwosessQp/QO9R+NLYk5r/uW96PQkirE
	7BPMlBnHpl4orT67k9oUyaB9ZTYeSGaJmOfm19o7yVjaOKF5q/EOthpjnGS1PPh2JjrbxxcGBBEmO
	5WoO7S0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYQc1-0000000BSPv-0ioO;
	Mon, 29 Jul 2024 13:40:29 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYQbx-0000000BSP6-0fqz
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jul 2024 13:40:27 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-44fe28eb1bfso18557471cf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jul 2024 06:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722260423; x=1722865223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OybnryKVs2UqunE+HbITQkTW5YxjXd43/aMmkgTPKM=;
        b=N5PXfDNc+AIiYWobYsC9pFPVOsTFGp5c6GQRv/LaP0nE8RdaUHQPkC9YAMDzN32BaJ
         J2DKMhBqr8ItDF24QNXVUu6rVrOrVR34hKr234RcIuFPQUyMg4c8rZ9oh+g2blLOSwZ9
         j6O6TswJb+VRATDcDEMFIHnfpqryvudia5mD7AZaZJJb33mp1RXMCmX9slYdgJDv/Q8c
         iKjxKSRDhkzASCsDSjrkkNIGeEGvHZ0d+R7PWin+Id2/lvrFA3VO6v7qdWzAMU7AyKIi
         Ne6tOOsxRJfOckzktOkB3d0ws/hs//6DLedfxodgI/REgfHEx4PqRQ0q+7V5CH4zhrzD
         jY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722260423; x=1722865223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OybnryKVs2UqunE+HbITQkTW5YxjXd43/aMmkgTPKM=;
        b=PJaHL3Wc9e9cTnn5loFnLF5ZLADtwTRwEkrLevdnaJipBNmPytMyZEwe0k91/5pTBe
         5U+nFnF0NeSFo/0nrNYOyBHgUitjzX4RUnIror5MILeJkbPEKCXF/DEr+PGVMUuljQ+G
         2OKRSUPja92J+C7ynQxK7g3mtvtO6Z6nq7Tt/Ojukf0Nw4nDY6jCEYheyYmyqAR2Sobm
         eW+LvIdumOjtZcO2HuWNcpkUMVhg9nZlt3SazsRzNpGVooB5HDUIyzGsUjlbj6d8XwZG
         MrUKa7af5+NNceo8mvmkRX0+qS1bWvu0Tba+IR6F2yoODelFJ63xg/lVsRX8SJH2cYZ2
         ugfw==
X-Forwarded-Encrypted: i=1; AJvYcCVyiOk/vjD1zOiM1GHmeN8IjgGhIvAI+HbEazoI/aucPLHW3qKzANk6WPsIiz1ilGMSsb5C2Xw6w1ZAo/CO8KjINR7U392ljHLkMn7I7G//z9vA
X-Gm-Message-State: AOJu0YyvFc+Qyh1APLT1DVE+r2k+DtECBVp9P4S3VyOlE8THk0MQfzx4
	Mned9tj6LhT1ek8yW2g/PFUvi8VUvVtLQc7/CXsQ+7QrUynNqkM/0DbqFFv3FqAm5d9GROqaqLq
	ZJtkdj7C6IbvsEXOpJRrIEAj0JL2YmQ3v74gRRQ==
X-Google-Smtp-Source: AGHT+IGSawRp512TpjUvjVB4Ov7SQcRSb7iRQeyOf4EprnazA+zHIHl6RfmOfDlEMz9/ziMVEreqiWeoj15Jc4GLZnA=
X-Received: by 2002:a05:6214:1d2e:b0:6b7:42aa:3358 with SMTP id
 6a1803df08f44-6bb55a7cb75mr88544056d6.31.1722260423344; Mon, 29 Jul 2024
 06:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
 <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com> <85c54f0b1b8bb5d9026c67109a3526fd95cc013b.camel@mediatek.com>
In-Reply-To: <85c54f0b1b8bb5d9026c67109a3526fd95cc013b.camel@mediatek.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 29 Jul 2024 15:40:09 +0200
Message-ID: <CAEHHSvZ2etjPKq0MqHYD=hjs19Yy+DJLwXGGorJK7q2tW2dfRQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, =?UTF-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"fsylvestre@baylibre.com" <fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_064025_313302_BCD06BA7 
X-CRM114-Status: GOOD (  26.24  )
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

Le jeu. 18 juil. 2024 =C3=A0 04:54, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck=
.hu@mediatek.com> a =C3=A9crit :
>
> Hi, Julien:
>
> On Thu, 2024-07-04 at 15:36 +0200, Julien Stephan wrote:
> >
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >  From: Phi-bang Nguyen <pnguyen@baylibre.com>
> >
> > This driver provides a path to bypass the SoC ISP so that image data
> > coming from the SENINF can go directly into memory without any image
> > processing. This allows the use of an external ISP.
> >
> > Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> > Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> > [Paul Elder fix irq locking]
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Co-developed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
>
> [snip]
>
> > +static int mtk_cam_vb2_start_streaming(struct vb2_queue *vq,
> > +       unsigned int count)
> > +{
> > +struct mtk_cam_dev *cam =3D vb2_get_drv_priv(vq);
> > +struct mtk_cam_dev_buffer *buf;
> > +struct mtk_cam_video_device *vdev =3D
> > +vb2_queue_to_mtk_cam_video_device(vq);
> > +struct device *dev =3D cam->dev;
> > +const struct v4l2_pix_format_mplane *fmt =3D &vdev->format;
> > +int ret;
> > +unsigned long flags;
> > +
> > +if (pm_runtime_get_sync(dev) < 0) {
> > +dev_err(dev, "failed to get pm_runtime\n");
> > +pm_runtime_put_autosuspend(dev);
> > +return -1;
> > +}
> > +
> > +(*cam->hw_functions->mtk_cam_setup)(cam, fmt->width, fmt->height,
> > +fmt->plane_fmt[0].bytesperline, vdev->fmtinfo->code);
> > +
> > +
> > +/* Enable CMOS and VF */
> > +mtk_cam_cmos_vf_enable(cam, true, true);
> > +
> > +mutex_lock(&cam->op_lock);
> > +
> > +ret =3D mtk_cam_verify_format(cam);
> > +if (ret < 0)
> > +goto fail_unlock;
> > +
> > +/* Start streaming of the whole pipeline now*/
> > +if (!cam->pipeline.start_count) {
> > +ret =3D media_pipeline_start(vdev->vdev.entity.pads,
> > +   &cam->pipeline);
> > +if (ret) {
> > +dev_err(dev, "failed to start pipeline:%d\n", ret);
> > +goto fail_unlock;
> > +}
> > +}
> > +
> > +/* Media links are fixed after media_pipeline_start */
> > +cam->stream_count++;
> > +
> > +cam->sequence =3D (unsigned int)-1;
> > +
> > +/* Stream on the sub-device */
> > +ret =3D v4l2_subdev_call(&cam->subdev, video, s_stream, 1);
> > +if (ret)
> > +goto fail_no_stream;
> > +
> > +mutex_unlock(&cam->op_lock);
> > +
> > +/* Create dummy buffer */
> > +cam->dummy_size =3D fmt->plane_fmt[0].sizeimage;
> > +
> > +cam->dummy.vaddr =3D dma_alloc_coherent(cam->dev, cam->dummy_size,
> > +      &cam->dummy.daddr, GFP_KERNEL);
>
> Dummy buffer cost much in DRAM footprint. I think we can get rid of
> this dummy buffer. If no buffer is queued from user space, call
> mtk_camsv30_cmos_vf_hw_disable() to stop write data into DRAM. After
> buffer is queued from user space, call mtk_camsv30_cmos_vf_hw_enable()
> to start write data into DRAM.
>

Hi CK,

IMHO it does not cost that much. A long time ago, we tried to remove
it, but we faced an issue (can't remember what :/).
Moreover, some other driver already uses the dummy buffer
implementation, if I am not wrong.

Cheers
Julien

> Regards,
> CK
>
> > +if (!cam->dummy.vaddr) {
> > +ret =3D -ENOMEM;
> > +goto fail_no_buffer;
> > +}
> > +
> > +/* update first buffer address */
> > +
> > +/* added the buffer into the tracking list */
> > +spin_lock_irqsave(&cam->irqlock, flags);
> > +if (list_empty(&cam->buf_list)) {
> > +(*cam->hw_functions->mtk_cam_update_buffers_add)(cam, &cam->dummy);
> > +cam->is_dummy_used =3D true;
> > +} else {
> > +buf =3D list_first_entry_or_null(&cam->buf_list,
> > +       struct mtk_cam_dev_buffer,
> > +       list);
> > +(*cam->hw_functions->mtk_cam_update_buffers_add)(cam, buf);
> > +cam->is_dummy_used =3D false;
> > +}
> > +spin_unlock_irqrestore(&cam->irqlock, flags);
> > +
> > +return 0;
> > +
> > +fail_no_buffer:
> > +mutex_lock(&cam->op_lock);
> > +v4l2_subdev_call(&cam->subdev, video, s_stream, 0);
> > +fail_no_stream:
> > +cam->stream_count--;
> > +if (cam->stream_count =3D=3D 0)
> > +media_pipeline_stop(vdev->vdev.entity.pads);
> > +fail_unlock:
> > +mutex_unlock(&cam->op_lock);
> > +mtk_cam_vb2_return_all_buffers(cam, VB2_BUF_STATE_QUEUED);
> > +
> > +return ret;
> > +}
> > +
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

