Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766CFC43462
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00AC46109F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00AC46109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/ljFAxTNVKGQ1+Es8nal94a4E44vY09yFdr0hWiLuU=; b=CMmY+DYIS5ujRJhrNzJVe5Xvxg
	1+5YZD9eR7CjqNohlr1g/9JGXp3M6TJjIYYjXx/TYTW42bX12BJzZYNw12jmlmiRPvAgm8YyGkntX
	5oWFNnzqyIN4uan/na3kDEQuLVTsU+88N0qva3rSO2Hem43unm3Qe8+UOENkViUu2QWIp2C9r0Pko
	ud56Vkd2Cc3BZ5X2tZBGVbApyg7BNnXVU49mleGjqfWHsGrKA70n29Tt/E/vzxKnObkXVI7+KqFAW
	07Nz4K+TngKQMdB/Zy5tKHH8MNbc4PNO4SKOPzjGLIIHSM9BR7y5FMsq8tLHa9Mp2izYi/lxagdnP
	YbcNYyQg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5Lg-005YjN-Qc; Fri, 21 May 2021 13:37:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5Ld-005YiS-Ga
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NttNeLhcm02+oiWbzzzzBiDUNeT7wjZHq2cUEjZv6s0=; b=dvgxtBlnjYy+ityAth3n/pWVi/
 H3dyPu61fG0DeaafHklqUGj0ilQ5/OqAasL/0LbH0ANBg1CS+pHevPRi9VMd7yJyNL7LO995aQKiw
 kZflpevCsv45TRKbeM7CQ8/cVGg1LESsFeDbxyKs1clb6O+5bUzAqgas37RLXTvBmC/w+ZP0RlGyZ
 GYTo5u990PkXD2c2XtyTMMHU41r2qEfxpyLHWW/am9McIV9x/Absfqx4LtaWRMOI8CAarzGSEs+K7
 7CcT6uSwg3rpnsbdBGPreoh7bYsSCvPxoAevxTNnDahX6K3oQfh318dA3bgretEvXQRWGiP7InOwI
 qgCcXISw==;
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5La-00H9UN-TL
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:37:52 +0000
Received: by mail-io1-xd34.google.com with SMTP id z24so20152016ioi.3
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NttNeLhcm02+oiWbzzzzBiDUNeT7wjZHq2cUEjZv6s0=;
 b=v/KE6bfT6VCJYrnenvpz9zBGLCOpXfwLGaZk0v9Et0MttdvDk73dgEJXveraNR9+HX
 unAm2j2b4tweIPStl854Ty91CNZ4IATbtN30Hdlt/F9+O2Svl3Z3S5y5WCTgpx94AReE
 i7RJVe2ginenu3xnZAAnJE6i13f7bF9YRyqyVPIKJANH8TlhBrHYcJHjCSkW2pWbMUHN
 ekoIRlbQcYZbGZKbs+jpMEcUm64QeoI6u+ZCy4uuCGvHtDW4eVhePs2RskuLfrouVAYj
 UzhtkojWigfj4Np34KD4duWwqLdXu95eTnsWv25YY84Ape7heW8ImGamJvIJVeOouU5m
 Yhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NttNeLhcm02+oiWbzzzzBiDUNeT7wjZHq2cUEjZv6s0=;
 b=JUvAXqyoTNZB6nvXoBpcQpa4ZY+M+mPLQHCbb7PmQ+E+qvOJlvjHYdQg4jav/FJZ57
 XF1ZJ5b/iIfnN3/0hw5SgOG9OrEIh8B9in/AnuGhvPvZaV+S/fixzSQ5s1fkcnZNq0zi
 NDi0U84YXVkRTrR7mf9n265XmksbQV5r361oGvOqp+3Sd9aN3X/ZkxImk9PBrB2TKcLd
 XaiwvLc0MqRdlMX3n5Oohu91vOYOeQaUvXzhmyOVuHRn8cDo0wv/6cCjNlcG8yyj8s/l
 emWr9PT3jvfxyiIs/1lfoy/Oin0pE1IVNLiNbjBQDX8aOVFD//w8HaaCYfo66ySnmjY9
 gPUw==
X-Gm-Message-State: AOAM5317xaZuOTFr3nkNfKLsgQun+0NfoI3nIYHrBJB9fv4LhkZfjgUH
 H+OR2QFpbqgEO/VD18jWK31HBqxNs+pFMkoqhImA1g==
X-Google-Smtp-Source: ABdhPJzEUGA0KMOrUAL9TbTil30C8ZfAEdpL4JFWkP9cEMg7KMBktxOSGrCkZNOGkkC4qfUWFxJqStq3Uq8d5/TlmRs=
X-Received: by 2002:a02:a81a:: with SMTP id f26mr4621472jaj.110.1621604269444; 
 Fri, 21 May 2021 06:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-7-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-7-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:37:38 +0800
Message-ID: <CA+Px+wV2N9uRuMGBzZDibCYqPVigPb5K40Q1BuLa58K2RY_eaA@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] media: mtk-vcodec: vdec: move stateful ops into
 their own file
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_063750_954672_B68E828B 
X-CRM114-Status: GOOD (  17.99  )
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

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> new file mode 100644
> index 000000000000..ed4b1308a0e4
> --- /dev/null
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> @@ -0,0 +1,667 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "mtk_vcodec_drv.h"
> +#include "mtk_vcodec_dec.h"
> +#include "mtk_vcodec_intr.h"
> +#include "mtk_vcodec_util.h"
> +#include "vdec_drv_if.h"
> +#include "mtk_vcodec_dec_pm.h"

Would be good practice to sort them.

> +static struct vb2_buffer *get_display_buffer(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct vdec_fb *disp_frame_buffer = NULL;
> +       struct mtk_video_dec_buf *dstbuf;
> +       struct vb2_v4l2_buffer *vb;
> +
> +       mtk_v4l2_debug(3, "[%d]", ctx->id);
> +       if (vdec_if_get_param(ctx,
> +                       GET_PARAM_DISP_FRAME_BUFFER,
> +                       &disp_frame_buffer)) {
> +               mtk_v4l2_err("[%d]Cannot get param : GET_PARAM_DISP_FRAME_BUFFER",
> +                       ctx->id);
> +               return NULL;
> +       }
> +
> +       if (disp_frame_buffer == NULL) {

Although this is a move refactor, to be neat, !disp_frame_buffer.

> +static struct vb2_buffer *get_free_buffer(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct mtk_video_dec_buf *dstbuf;
> +       struct vdec_fb *free_frame_buffer = NULL;
> +       struct vb2_v4l2_buffer *vb;
> +
> +       if (vdec_if_get_param(ctx,
> +                               GET_PARAM_FREE_FRAME_BUFFER,
> +                               &free_frame_buffer)) {
> +               mtk_v4l2_err("[%d] Error!! Cannot get param", ctx->id);
> +               return NULL;
> +       }
> +       if (free_frame_buffer == NULL) {

The same concern as above.

> +static void clean_display_buffer(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct vb2_buffer *framptr;
> +
> +       do {
> +               framptr = get_display_buffer(ctx);
> +       } while (framptr);
> +}
> +
> +static void clean_free_buffer(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct vb2_buffer *framptr;
> +
> +       do {
> +               framptr = get_free_buffer(ctx);
> +       } while (framptr);
> +}

while (get_display_buffer(ctx)) ;
and
while (get_free_buffer(ctx)) ;
looks better.

> +static int mtk_vdec_flush_decoder(struct mtk_vcodec_ctx *ctx)
> +{
> +       bool res_chg;
> +       int ret = 0;

No need to initialize.

> +static void mtk_vdec_worker(struct work_struct *work)
> +{
> +       struct mtk_vcodec_ctx *ctx = container_of(work, struct mtk_vcodec_ctx,
> +                               decode_work);
> +       struct mtk_vcodec_dev *dev = ctx->dev;
> +       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +       struct mtk_vcodec_mem buf;
> +       struct vdec_fb *pfb;
> +       bool res_chg = false;
> +       int ret;
> +       struct mtk_video_dec_buf *dst_buf_info, *src_buf_info;
> +
> +       src_buf = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
> +       if (src_buf == NULL) {

To neat, !src_buf.

> +       dst_buf = v4l2_m2m_next_dst_buf(ctx->m2m_ctx);
> +       if (dst_buf == NULL) {

To neat, !dst_buf.

> +static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
> +{
> +       struct vb2_v4l2_buffer *src_buf;
> +       struct mtk_vcodec_mem src_mem;
> +       bool res_chg = false;
> +       int ret = 0;
> +       unsigned int dpbsize = 1, i = 0;
> +       struct mtk_vcodec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
> +       struct vb2_v4l2_buffer *vb2_v4l2 = NULL;

ret, i, and vb2_v4l2 are obviously no need to initialize.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
