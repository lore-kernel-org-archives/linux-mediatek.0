Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E54C33CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 05:14:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC1CB2072B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 05:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q4Vjl4HZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Toqv6jeG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC1CB2072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u83AOZq59xDDzA3QAXhqQ38zTpNC7S/OKRGM9YOcU0I=; b=q4Vjl4HZISkbIX
	RUeznLmcPCnoEHBjwS0G9oC6S1PIzipsGa9dMv+n/+E7XIwE0hvd9q+7ib82I5vTugBk23hDuTOHj
	NIEvBt/64BLGQCiLh6xc5T8xxfnlNKFx7CRR8EWFgmKo8IFGPB3h7/j6VL40sCLf0s96TA/GB1vZf
	JZQWsaILgSBaqevla8Sxf3lo/gIdHD/te/55hNRT3m5wAljwXRfHPggXdqOc5a2elwSqJ4Bv7o9QS
	Cwri9M87E3wbMIO5BbM3Nb+jl4IA1UF9W1mDYaxoWZQHSACpwBBOYUB+Pwp2J3ZA2Vsv4C3mXOlfo
	lJ7kLm/qoyhmiEoXeSVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irb0g-0002uS-Ow; Wed, 15 Jan 2020 05:14:30 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irb0c-0002t6-Uv
 for linux-mediatek@lists.infradead.org; Wed, 15 Jan 2020 05:14:29 +0000
Received: by mail-oi1-x244.google.com with SMTP id v140so14284585oie.0
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jan 2020 21:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1V7MW/ylG5HH52qKYnJfjENVm5zMbyLo/1xAyipVPNU=;
 b=Toqv6jeGfvvxWRkr5nvZFkzGlWyXW0qh9bEcuwG/GucvkAKkjZSDtLzEWNyuJz0kAn
 3LFtDjFZjvJ7Cjg7QuoSNUcSCrCzCprhHwc/fgBE3nhH6SR9YUsAAdK89gezNLJwSh+u
 U2JRzqaD9IF3wcMHh/XVE6mg6as3ybZqHT9UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1V7MW/ylG5HH52qKYnJfjENVm5zMbyLo/1xAyipVPNU=;
 b=KLQ9st+SjgPPJPenBI04UcN0H2R7u8eXulOK5rPPkE1m7qmgPlHkaV5sfabnsNRtS2
 gfRylkQzBlK8deSFkaGvMLqmidXrNn0gJe94X02oD1xWO7/xH0L0U2yQjr3DJW5P1q9u
 PEWfK8vIb48IdpoKSNOJUMLB14SX5THyVpu2KabHupH7+xE79kH996Z/Q1wMnqybBwYS
 PTpd5E0ROYDsCgMvnEJ521544SjtgPneGfx8BJbKqGpZmgsWFcoGHKfHkrEEeavS6dLZ
 DBIgteHy5lsnYlMrGakruvfp1DJJEA14m+JKt8h6FIO5aqksnNTsPbsj/Qu/SBdE1lN/
 XRyw==
X-Gm-Message-State: APjAAAVyydGuHt01u5ZL+4VedcfBIltkz3V2ZJfT86LGXfiX19MxoaBW
 ANg23IVFobFUaaD7+jFptjw2HQz31s2YaA==
X-Google-Smtp-Source: APXvYqy8NGdh/MKRaC1S14FW1ge8hW3kL2z3Pwk0UpO6mPfPvXJ07fG4N+rDmygHZDDlXn4gcUaNmA==
X-Received: by 2002:a05:6808:181:: with SMTP id
 w1mr20282130oic.176.1579065265068; 
 Tue, 14 Jan 2020 21:14:25 -0800 (PST)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
 [209.85.167.178])
 by smtp.gmail.com with ESMTPSA id z17sm5352967oib.3.2020.01.14.21.14.23
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 21:14:24 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id p125so14235562oif.10
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Jan 2020 21:14:23 -0800 (PST)
X-Received: by 2002:aca:d0b:: with SMTP id 11mr19753910oin.71.1579065262776;
 Tue, 14 Jan 2020 21:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20200114033226.16786-1-gtk_ruiwang@mediatek.com>
 <CAPBb6MXhiNK84PuUy8=RUUeSh5j4VXw-Ar5SbZDHZAobp7xpEQ@mail.gmail.com>
In-Reply-To: <CAPBb6MXhiNK84PuUy8=RUUeSh5j4VXw-Ar5SbZDHZAobp7xpEQ@mail.gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 15 Jan 2020 14:14:11 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXu9+9C7iUZST_OCwfren7kggFTG41DArF6yzRa_0hf4w@mail.gmail.com>
Message-ID: <CAPBb6MXu9+9C7iUZST_OCwfren7kggFTG41DArF6yzRa_0hf4w@mail.gmail.com>
Subject: Re: media: mtk-vcodec: reset segment data then trig decoder
To: gtk_ruiwang <gtk_ruiwang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_211427_019239_49FECC25 
X-CRM114-Status: GOOD (  21.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, srv_heupstream@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2020 at 12:47 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
>
> On Tue, Jan 14, 2020 at 12:32 PM <gtk_ruiwang@mediatek.com> wrote:
> >
> > From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
> >
> > VP9 bitstream specification indicate segment data should reset to
> > default when meet key frames, intra only frames or enable error
> > resilience mode. So memset segmentation map buffer before every
> > decode process is not appropriate.
> >
> > Reset segment data only when needed, then trig decoder hardware
> >
> > Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
> > ---
> >  .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> > index 24c1f0bf2147..42c9c3c98076 100644
> > --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> > +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> > @@ -110,7 +110,9 @@ struct vp9_sf_ref_fb {
> >   * @buf_len_sz_c : size used to store cbcr plane ufo info (AP-R, VPU-W)
> >
> >   * @profile : profile sparsed from vpu (AP-R, VPU-W)
> > - * @show_frame : display this frame or not (AP-R, VPU-W)
> > + * @show_frame : [BIT(0)] display this frame or not (AP-R, VPU-W)
> > + *     [BIT(14)] reset segment data or not (AP-R, VPU-W)
> > + *     [BIT(15)] trig decoder hardware or not (AP-R, VPU-W)
> >   * @show_existing_frame : inform this frame is show existing frame
> >   *     (AP-R, VPU-W)
> >   * @frm_to_show_idx : index to show frame (AP-R, VPU-W)
> > @@ -494,12 +496,12 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
> >                                         frm_to_show->fb->base_y.size);
> >                 }
> >                 if (!vp9_is_sf_ref_fb(inst, inst->cur_fb)) {
> > -                       if (vsi->show_frame)
> > +                       if (vsi->show_frame & BIT(0))
> >                                 vp9_add_to_fb_disp_list(inst, inst->cur_fb);
> >                 }
> >         } else {
> >                 if (!vp9_is_sf_ref_fb(inst, inst->cur_fb)) {
> > -                       if (vsi->show_frame)
> > +                       if (vsi->show_frame & BIT(0))
> >                                 vp9_add_to_fb_disp_list(inst, frm_to_show->fb);
> >                 }
> >         }
> > @@ -870,13 +872,22 @@ static int vdec_vp9_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> >                                         vsi->sf_frm_sz[idx]);
> >                         }
> >                 }
> > -               memset(inst->seg_id_buf.va, 0, inst->seg_id_buf.size);
> >                 ret = vpu_dec_start(&inst->vpu, data, 3);
> >                 if (ret) {
> >                         mtk_vcodec_err(inst, "vpu_dec_start failed");
> >                         goto DECODE_ERROR;
> >                 }
> >
> > +               if ((vsi->show_frame & BIT(15)) &&
> > +                   (vsi->show_frame & BIT(14))) {
>
> Using the new bits in this manner means this patch is not compatible
> with the older firmware.
>
> On an older firmware, these bits will be 0, which means the decoder
> will never be started. To preserve compatibility, the behavior should
> be reversed: *do not* reset and/or start the decoder if the bits are
> set.
>
> Also both bits are only used together - we should either separate the
> data segment reset and decoder start, or rely on only one bit for
> this.

Ah, looks like I missed the fact that the decoder is still started
even when these bits are not set. So this indeed looks
backward-compatible. Please ignore my comment.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
