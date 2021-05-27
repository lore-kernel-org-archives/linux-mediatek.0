Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98013C4708A
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:10:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58033613B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58033613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hosLXSkCvAril3lStM1aBKe/KSPNGNNe6YPgY3xbqM=; b=Ul5TRPDwyq05RV
	1hkHak+o6EgF9ctSMmyLHkF6Xfij+SSHBnW8LkABVvt8LkbpVoXpOJasE0HACD3wCZVJBK05GHSYb
	/HHXX3m0nAI6jKzguWGpVSyAaeToB2oZpv7GC8gY+WqR68GUcGT3eqPSg8y1PwNOiI+7Iu6omCPb6
	xr9qE0Z/27qeCB8En4KWXAWa+LdT1zk2iVVpcCv0fyaSlLChRvTZpCgZMmrAmKSMLCrgajnI5E6+D
	w68tH0Fpi8NXrXmUN8wlxLNFmVyCQPCduyo7mmn92L4hujSk9MHHkuIHtgaeJX0H1PGCRh2s5NDSu
	2/XhjBiYqMXGNBYWXkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmCyU-004enj-Tl; Thu, 27 May 2021 10:10:46 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmCyR-004el6-OE
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 10:10:45 +0000
Received: by mail-lj1-x235.google.com with SMTP id b12so84133ljp.1
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 03:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jm/6jFCe3/7FOinz4SHy1Ee5ISvSki/EZvOhN9srBpY=;
 b=LGZVhXqBUDdX1KmMdSxzLcJeA+4qUVmlfy8wrXeVpW8TABCjHmnkD9dGcbbP71xWLg
 7Vxy1H6Br35G36rwv5dOVypvJYzC0jSVtg/wZomZQDxm2xB/vkWoMCzI/Tjgg9wl6R7j
 do9h37JCcYmF5NUhoh1KeG2QlKpOrIcgL4R+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jm/6jFCe3/7FOinz4SHy1Ee5ISvSki/EZvOhN9srBpY=;
 b=SE65yjU553lYDnIUVZH+/6gwHTZ+hHaK9uRa8/k0djeyxYQRc7BMiAvntx6ej4750K
 sv13qcXREQtqDtwiM3GzgU8hoq81Z2xBF9HwmoKV1y1yC9qFyiTRHZIZV9VEQMZInLBn
 /CpPjvyuc4swuQoL5HhSB1uJhtq91HiwWdFJcUULFuk9gEC8PSg586Frqd8wRQb4jxgy
 c5GXYzUTp+lZBSVaHe1ufPqesKGOJKysULSwY0loYFmxhIN2yQhwOSETlRNg7KcLKR5x
 rGN/OgtasvZug7oMskPxKQ9tdDASyDuMT0s8J26eW9Wd70izVMItR8RUkVK7qRhBQQSh
 wDww==
X-Gm-Message-State: AOAM530YwPOYQkYJ9BnOQCAFI3EYgVYIrXve7WsLXuz0i74aMHmYsRhN
 x50NJypK2wLbah/8SYZaSadRT/kqMgzmhA==
X-Google-Smtp-Source: ABdhPJz6J3Arc9jRHSNx6bYoD0TWAxKAfUCvp9mZaf2o9UUlZDmAZY/CXp4TI8y9lWVl3Lw+t7mg4g==
X-Received: by 2002:a2e:95d8:: with SMTP id y24mr1914697ljh.469.1622110242037; 
 Thu, 27 May 2021 03:10:42 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id g19sm182598lja.139.2021.05.27.03.10.41
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 03:10:41 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id b12so84049ljp.1
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 03:10:41 -0700 (PDT)
X-Received: by 2002:a2e:988b:: with SMTP id b11mr2014124ljj.87.1622110241115; 
 Thu, 27 May 2021 03:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-7-acourbot@chromium.org>
 <CA+Px+wV2N9uRuMGBzZDibCYqPVigPb5K40Q1BuLa58K2RY_eaA@mail.gmail.com>
In-Reply-To: <CA+Px+wV2N9uRuMGBzZDibCYqPVigPb5K40Q1BuLa58K2RY_eaA@mail.gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 27 May 2021 19:10:28 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXFrneXmhA=1FshkrGLZOder4_KeyzD7xGdw66o0hTBZw@mail.gmail.com>
Message-ID: <CAPBb6MXFrneXmhA=1FshkrGLZOder4_KeyzD7xGdw66o0hTBZw@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] media: mtk-vcodec: vdec: move stateful ops into
 their own file
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_031043_832498_3F01DF83 
X-CRM114-Status: GOOD (  24.36  )
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

On Fri, May 21, 2021 at 10:37 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
> <acourbot@chromium.org> wrote:
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> > new file mode 100644
> > index 000000000000..ed4b1308a0e4
> > --- /dev/null
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> > @@ -0,0 +1,667 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-mem2mem.h>
> > +#include <media/videobuf2-dma-contig.h>
> > +
> > +#include "mtk_vcodec_drv.h"
> > +#include "mtk_vcodec_dec.h"
> > +#include "mtk_vcodec_intr.h"
> > +#include "mtk_vcodec_util.h"
> > +#include "vdec_drv_if.h"
> > +#include "mtk_vcodec_dec_pm.h"
>
> Would be good practice to sort them.

Did what I could, but the order seems to somehow matter. :/

>
> > +static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct vdec_fb *disp_frame_buffer = NULL;
> > +       struct mtk_video_dec_buf *dstbuf;
> > +       struct vb2_v4l2_buffer *vb;
> > +
> > +       mtk_v4l2_debug(3, "[%d]", ctx->id);
> > +       if (vdec_if_get_param(ctx,
> > +                       GET_PARAM_DISP_FRAME_BUFFER,
> > +                       &disp_frame_buffer)) {
> > +               mtk_v4l2_err("[%d]Cannot get param : GET_PARAM_DISP_FRAME_BUFFER",
> > +                       ctx->id);
> > +               return NULL;
> > +       }
> > +
> > +       if (disp_frame_buffer == NULL) {
>
> Although this is a move refactor, to be neat, !disp_frame_buffer.

These were also raised by checkpatch.pl --strict, they are now all fixed.

>
> > +static struct vb2_buffer *get_free_buffer(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct mtk_video_dec_buf *dstbuf;
> > +       struct vdec_fb *free_frame_buffer = NULL;
> > +       struct vb2_v4l2_buffer *vb;
> > +
> > +       if (vdec_if_get_param(ctx,
> > +                               GET_PARAM_FREE_FRAME_BUFFER,
> > +                               &free_frame_buffer)) {
> > +               mtk_v4l2_err("[%d] Error!! Cannot get param", ctx->id);
> > +               return NULL;
> > +       }
> > +       if (free_frame_buffer == NULL) {
>
> The same concern as above.
>
> > +static void clean_display_buffer(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct vb2_buffer *framptr;
> > +
> > +       do {
> > +               framptr = get_display_buffer(ctx);
> > +       } while (framptr);
> > +}
> > +
> > +static void clean_free_buffer(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct vb2_buffer *framptr;
> > +
> > +       do {
> > +               framptr = get_free_buffer(ctx);
> > +       } while (framptr);
> > +}
>
> while (get_display_buffer(ctx)) ;
> and
> while (get_free_buffer(ctx)) ;
> looks better.

Done.

>
> > +static int mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       bool res_chg;
> > +       int ret = 0;
>
> No need to initialize.

Done.

>
> > +static void mtk_vdec_worker(struct work_struct *work)
> > +{
> > +       struct mtk_vcodec_ctx *ctx = container_of(work, struct mtk_vcodec_ctx,
> > +                               decode_work);
> > +       struct mtk_vcodec_dev *dev = ctx->dev;
> > +       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > +       struct mtk_vcodec_mem buf;
> > +       struct vdec_fb *pfb;
> > +       bool res_chg = false;
> > +       int ret;
> > +       struct mtk_video_dec_buf *dst_buf_info, *src_buf_info;
> > +
> > +       src_buf = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> > +       if (src_buf == NULL) {
>
> To neat, !src_buf.
>
> > +       dst_buf = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> > +       if (dst_buf == NULL) {
>
> To neat, !dst_buf.
>
> > +static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
> > +{
> > +       struct vb2_v4l2_buffer *src_buf;
> > +       struct mtk_vcodec_mem src_mem;
> > +       bool res_chg = false;
> > +       int ret = 0;
> > +       unsigned int dpbsize = 1, i = 0;
> > +       struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> > +       struct vb2_v4l2_buffer *vb2_v4l2 = NULL;
>
> ret, i, and vb2_v4l2 are obviously no need to initialize.

Done, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
