Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A24C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zLZl+lKBH3Vvqbi2d4ooSs8z0eKzlRHcz+2B2l8IDoU=; b=464sq5x8nUIG5U
	oMKxZ0NP/Pmpmxims38uqMm2gUu82URuqmbAu+0X7W/EjD99oQOSdmRmm2v+5/SsHYJFOsWB0DNoD
	r9BUu8wpy4Cr+lygWG7Mb7HP3ybxDlFiES5/jLzjU7ZN0rLb/ldAf/n5pXftOAEdQqeDGZylmtcNi
	M1ofIEMHwIuZ6wUtodYpcS62sduBZgl/rMm9g34GFypmvlZWmnOCTVLNzeP0zZdhwVjZE8pljT3Nu
	sqywPQFeeonG0jMCoBSCI9TT8Jd8G2kVSS66wDYe/UIvfhZ3JayuMGlJDDPkfCGRGQS1P17lMAB6U
	dvqA0t6l5+UeFj7F+Ilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2TN6-002OL1-Jb; Wed, 29 Dec 2021 07:27:40 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2TMt-002OIO-R3
 for linux-mediatek@lists.infradead.org; Wed, 29 Dec 2021 07:27:30 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso23821696pjc.4
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Dec 2021 23:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eZSNki/251fDYLWVkOPn8gWn57CxzUzo65fAsecZzSY=;
 b=C2b0u1tClTPmdQioW+rxkZ+V7pqKZXRaISlUmt8iCW927RhgQrOFUcbd6meMPzDYNJ
 vx/XLkZIkznWTkZgvAJ0ypkuBP40ipDUo3JMy4vf3JbUxpYhuOGGxI3JuXXye7pCnNXn
 OHFvXOdT2LXYXBGWmxRgIZgz0RV/Sdkl5FYD5J82qNlhU2jZNlaB03hEd6b34lmLCcpQ
 YED6khoDbdY0+qbd/rqXiy3pREdcFpr0WizTcRnrPvPmpwUgw5+wkuXI7xO9d6X8xnTE
 021Ucv5pypqtaIcTorUmLe52PUYDNHSXbPkhRRZ6tIZ/1Yr4jRcacTFc0vZ6xiGpSehi
 KHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZSNki/251fDYLWVkOPn8gWn57CxzUzo65fAsecZzSY=;
 b=QVclUtLpABUNfsrmnPYEWZMhpY9EY0UEgABLqNOPYCh41BiMmalU+4+dR9Gzza9rlE
 Qc1KGqUo4qchn1t7y3LbKXY8ao6IfRC449+UBL/W4jed1UKPV0mDiZ2abu+HBsmQEtKK
 dM+BgLr6KG3wWxNB0sMPHhsdniVq1q5/GtUgtTqS8K9PCcNPUZteNvCrBiHnWh2BwX2N
 JqlC7vi2y3p9xHW0iBKe4LgiykD0ICjyRFsMtmibMIxx3umPBjmHmaC5fv2fLxzqAikr
 JAKRTu5mcRmxJZCTEp6N/2K66fw3ndIK0JPVwXNE1fxhD9E5awfyIAz+H4seU6W3ILaY
 lGlw==
X-Gm-Message-State: AOAM533U6N7b+xUpvdG/Fr1TG2mrqQdvpQGmyi5MEPu0tTvTLyQbKopR
 vHWME8ythgcnG+bHMCoJ5UqOC36dPV2TccRb29hDAQ==
X-Google-Smtp-Source: ABdhPJwdorV9rKsCXwNUTFsMyMCJcCadilIxzOqhyG+k64txb8IQphCdPdY79KAgaFh5MoE1tQRj+5vGer2dfAH87+8=
X-Received: by 2002:a17:902:b591:b0:149:66d6:7589 with SMTP id
 a17-20020a170902b59100b0014966d67589mr19576058pls.24.1640762843190; Tue, 28
 Dec 2021 23:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-4-yunfei.dong@mediatek.com>
 <Ycvz4UrmbngVzIv2@google.com>
 <8102ba18b3fdcc19e6b9f53c7a635ffc084c825b.camel@mediatek.com>
In-Reply-To: <8102ba18b3fdcc19e6b9f53c7a635ffc084c825b.camel@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 29 Dec 2021 15:27:11 +0800
Message-ID: <CA+Px+wU2aU_t2F2XOsjf5vRUikQPaftRa9062CCCNwRJK-WA3w@mail.gmail.com>
Subject: Re: [PATCH v2, 03/12] media: mtk-vcodec: get capture queue buffer
 size from scp
To: "yunfei.dong@mediatek.com" <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Steve Cho <stevecho@chromium.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_232727_891748_BFCAB37A 
X-CRM114-Status: GOOD (  31.98  )
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

On Wed, Dec 29, 2021 at 2:52 PM yunfei.dong@mediatek.com
<yunfei.dong@mediatek.com> wrote:
> On Wed, 2021-12-29 at 13:36 +0800, Tzung-Bi Shih wrote:
> > On Tue, Dec 28, 2021 at 05:41:37PM +0800, Yunfei Dong wrote:
> > > From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> >
> > [...]
> > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > > index 130ecef2e766..87891ebd7246 100644
> > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > > @@ -466,6 +466,8 @@ static int vidioc_vdec_s_fmt(struct file *file,
> > > void *priv,
> > >                     }
> > >                     ctx->state = MTK_STATE_INIT;
> > >             }
> > > +   } else {
> > > +           ctx->capture_fourcc = fmt->fourcc;
> > >     }
> > >
> > >     /*
> > > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > index a23a7646437c..95e07cf2cd3e 100644
> > > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > > @@ -277,6 +277,7 @@ struct vdec_pic_info {
> > >   *              to be used with encoder and stateful decoder.
> > >   * @is_flushing: set to true if flushing is in progress.
> > >   * @current_codec: current set input codec, in V4L2 pixel format
> > > + * @capture_fourcc: capture queue type in V4L2 pixel format
> > >   *
> > >   * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
> > >   * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
> > > @@ -322,6 +323,7 @@ struct mtk_vcodec_ctx {
> > >     bool is_flushing;
> > >
> > >     u32 current_codec;
> > > +   u32 capture_fourcc;
> >
> > What is the purpose of capture_fourcc?  It is not used.
> >
> Need to calculate each plane size according to capture fourcc type from
> scp. The plane size of MM21 is different with MT21C. And the capture
> fourcc type of different codec maybe different.

Purpose of capture_fourcc in the context is not obvious and looks
irrelevant to the patch.  Could it move to somewhere patch that makes
more sense?

> > > +/**
> > > + * struct vdec_ap_ipi_get_param - for AP_IPIMSG_SET_PARAM
> > > + * @msg_id : AP_IPIMSG_DEC_START
> > > + * @inst_id     : instance ID. Used if the ABI version >= 2.
> > > + * @data   : picture information
> > > + * @param_type     : get param type
> > > + * @codec_type     : Codec fourcc
> > > + */
> > > +struct vdec_ap_ipi_get_param {
> > > +   uint32_t msg_id;
> > > +   uint32_t inst_id;
> > > +   uint32_t data[4];
> > > +   uint32_t param_type;
> > > +   uint32_t codec_type;
> > > +};
> >
> > Are AP_IPIMSG_SET_PARAM and AP_IPIMSG_DEC_START typos?
> >
> It's getting message from scp side. It's looks much better to add one
> new path from ap to scp.

Pardon me, I failed to understand it.  I thought the struct could be
for AP_IPIMSG_DEC_GET_PARAM.

> > > +/**
> > > + * struct vdec_vpu_ipi_init_ack - for VPU_IPIMSG_DEC_INIT_ACK
> > > + * @msg_id : VPU_IPIMSG_DEC_INIT_ACK
> > > + * @status : VPU exeuction result
> > > + * @ap_inst_addr   : AP vcodec_vpu_inst instance address
> > > + * @data     : picture information from SCP.
> > > + * @param_type     : get param type
> > > + */
> > > +struct vdec_vpu_ipi_get_param_ack {
> > > +   uint32_t msg_id;
> > > +   int32_t status;
> > > +   uint64_t ap_inst_addr;
> > > +   uint32_t data[4];
> > > +   uint32_t param_type;
> > > +   uint32_t reserved;
> > > +};
> >
> > Same here: is VPU_IPIMSG_DEC_INIT_ACK a typo?
> >
> It's getting message from scp side. It's looks much better to add one new path from ap to scp.

Same here: I thought it was for VPU_IPIMSG_DEC_GET_PARAM_ACK.

> > > diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > index 4cb3c7f5a3ad..963f8d4877b7 100644
> > > --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> > > @@ -28,6 +28,8 @@ struct mtk_vcodec_ctx;
> > >   * @wq          : wait queue to wait VPU message ack
> > >   * @handler     : ipi handler for each decoder
> > >   * @codec_type     : use codec type to separate different codecs
> > > + * @capture_type    : used capture type to separate different
> > > capture format
> > > + * @fb_sz  : frame buffer size of each plane
> > >   */
> > >  struct vdec_vpu_inst {
> > >     int id;
> > > @@ -42,6 +44,8 @@ struct vdec_vpu_inst {
> > >     wait_queue_head_t wq;
> > >     mtk_vcodec_ipi_handler handler;
> > >     unsigned int codec_type;
> > > +   unsigned int capture_type;
> > > +   unsigned int fb_sz[2];
> > >  };
> >
> > capture_type is not used in the patch.
> >
> Capture type will be used in scp to get capture plane size according to
> capture buffer type.

Pardon me, I failed to understand it.  I may misunderstand, however,
it doesn't look like a shared memory structure between AP and SCP.

At least to me, capture_type is not used in the patch.  It could be
better to move it to somewhere patch that makes more sense.

> > Does fb_sz take effect in later patches?
>
> Don't have effect to later patches.

Is the fb_sz used somewhere "later"?  The patch gets fb_sz from SCP,
however, fb_sz is never used in some control or configuration paths.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
