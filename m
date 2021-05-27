Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799F8C4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:11:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 421ED60720
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 421ED60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQQ+U6K0+gdErA0cm2aeNSHxNpCW1s9fWt12rq8Bq1g=; b=Mchq+0TmdXpZIq
	D5tWDqF7qx7nLISN6PtNN9U1bJ8dtFvDw70n04EslL9kRLDzvw3/XzuFA+gqs5dH4peonuKVVXJYa
	2FIGj/GUL3SiOwwL28PKWbvYvC/6QveXSt1cKzw8v8TFGVXai4UeSYbyHiLXg9xV6trHFUyinXTKo
	ejOG/tGpTXeSwRhE7fMuNScBmZ6/mppoB6jmjuNZJcUckn+0dSkq/qwXhcIe5UfgOgkMeknVOlFTu
	A5Wdum0t4mydDHVwrgM+P0T6BYqgQHqKbTWgnVx6s2oHtFgojlc3u0O5rIym/10rrMcXRNhKr7DzW
	TJQgi+ewExw/FssgdN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmCyd-004esx-9g; Thu, 27 May 2021 10:10:55 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmCyZ-004ep3-PG
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 10:10:53 +0000
Received: by mail-lf1-x134.google.com with SMTP id q7so7194641lfr.6
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 03:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DAPD4ukT6eCf6HIGe5wvyHRlg/DJMReQYqQE1gSOFEE=;
 b=MuYBL86U5dNPZzYeIcrgWG2vi8zuGy7jo0PD9uelsBqLAf+9oXfb7SJ8DVVqvqUp6c
 51P6kaiGH6GHS0efDbeHaOaIInAi6nHcPFllEp9opUet4VMHfrBeX8+Tqp2R5D8jfPj3
 LG0X+qcYI0YvKRHxY6aFDIsr29BgyYjFq/zO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DAPD4ukT6eCf6HIGe5wvyHRlg/DJMReQYqQE1gSOFEE=;
 b=lOVn4nBPwfCjh2qw1cNlqbstHFIfBQLAeq3/E7zKd8Yih/B4WSqVJeAeBnM6Nxlx0T
 PSifuXiy3Dc9CTH7Zr6iQG/irgxG+8PXTBJF+pPo8bAC0X1BK7qRkDpFOuAfiGwVARjC
 0VdCB6zw5dBeES57lyhfblpI31eGQJkHDH31ABF1gnAodoO6L86r4yzzAY/3z0l8IDaH
 wUVxdg72t5ihDXBcQwr8zfBOzkSq9DN0cq49wXWUvJEVTwihqngkIFGinudeGKRX1NIj
 H625um8MDRaucI4gETdGea3+OZhiLUD9WFSLRs/x4hvLpfl/6QGMS+hBvc8bRDSALhhN
 5w6Q==
X-Gm-Message-State: AOAM532c2LKxc+pXxmYyUBccg3Q1wnfxnDU5pQ8sa1K9qO0Q53STSsyR
 OAS4ZYRt7R0h5IG8hyhUadBfSXiA8qzCZQ==
X-Google-Smtp-Source: ABdhPJySGyoxUFKZjUTOW3UhKU/D/7WikzwshWa2Pg7GL1mU3/w/9J75MmKNWA1+qiPFDgROUMxdsg==
X-Received: by 2002:ac2:44a8:: with SMTP id c8mr1892525lfm.232.1622110248841; 
 Thu, 27 May 2021 03:10:48 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id t1sm159116lfp.168.2021.05.27.03.10.47
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 03:10:48 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id a5so6438901lfm.0
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 03:10:47 -0700 (PDT)
X-Received: by 2002:ac2:528d:: with SMTP id q13mr1944901lfm.73.1622110247228; 
 Thu, 27 May 2021 03:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-12-acourbot@chromium.org>
 <CA+Px+wXXtsmG2q4aJ4Em1pzFcA-mA6CuATfXKevNyEOuBq+zYw@mail.gmail.com>
In-Reply-To: <CA+Px+wXXtsmG2q4aJ4Em1pzFcA-mA6CuATfXKevNyEOuBq+zYw@mail.gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 27 May 2021 19:10:34 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUR9nXQc=Dua67Ep7U_7LMGcEhw=yhB42KN03R19oEgCg@mail.gmail.com>
Message-ID: <CAPBb6MUR9nXQc=Dua67Ep7U_7LMGcEhw=yhB42KN03R19oEgCg@mail.gmail.com>
Subject: Re: [PATCH v5 11/14] media: mtk-vcodec: vdec: support stateless H.264
 decoding
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
X-CRM114-CacheID: sfid-20210527_031051_848948_B74786D4 
X-CRM114-Status: GOOD (  18.59  )
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

On Fri, May 21, 2021 at 10:38 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
> <acourbot@chromium.org> wrote:
> > +#include "../vdec_drv_if.h"
> > +#include "../mtk_vcodec_util.h"
> > +#include "../mtk_vcodec_dec.h"
> > +#include "../mtk_vcodec_intr.h"
> > +#include "../vdec_vpu_if.h"
> > +#include "../vdec_drv_base.h"
>
> Would be good practice to sort them.

Done as much as possible.

>
> > +static int allocate_predication_buf(struct vdec_h264_slice_inst *inst)
> > +{
> > +       int err = 0;
>
> No need to initialize.  It will be overridden soon.

Done.

>
> > +static void free_predication_buf(struct vdec_h264_slice_inst *inst)
> > +{
> > +       struct mtk_vcodec_mem *mem = NULL;
> > +
> > +       mtk_vcodec_debug_enter(inst);
> > +
> > +       inst->vsi_ctx.pred_buf_dma = 0;
> > +       mem = &inst->pred_buf;
>
> Is it possible to inline to the variable declaration?  Or mem no need
> to initialize.

Indeed - done (also done all other suggestions in this email).


>
> > +static int alloc_mv_buf(struct vdec_h264_slice_inst *inst,
> > +       struct vdec_pic_info *pic)
> > +{
> > +       int i;
> > +       int err;
> > +       struct mtk_vcodec_mem *mem = NULL;
>
> No need to initialize.  It will be overridden soon.
>
> > +static void free_mv_buf(struct vdec_h264_slice_inst *inst)
> > +{
> > +       int i;
> > +       struct mtk_vcodec_mem *mem = NULL;
>
> No need to initialize.  It will be overridden soon.
>
> > +static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
> > +{
> > +       struct vdec_h264_slice_inst *inst = NULL;
>
> No need to initialize.  It will be overridden soon.
>
> > +static void vdec_h264_slice_deinit(void *h_vdec)
> > +{
> > +       struct vdec_h264_slice_inst *inst =
> > +               (struct vdec_h264_slice_inst *)h_vdec;
>
> No need to cast from void *.
>
> > +static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> > +                                 struct vdec_fb *fb, bool *res_chg)
> > +{
> > +       struct vdec_h264_slice_inst *inst =
> > +               (struct vdec_h264_slice_inst *)h_vdec;
>
> No need to cast from void *.
>
> > +       const struct v4l2_ctrl_h264_decode_params *dec_params =
> > +               get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
> > +       struct vdec_vpu_inst *vpu = &inst->vpu;
> > +       uint32_t data[2];
> > +       uint64_t y_fb_dma;
> > +       uint64_t c_fb_dma;
> > +       int err;
> > +
> > +       /* bs NULL means flush decoder */
> > +       if (bs == NULL)
>
> To neat, !bs.
>
> > +static int vdec_h264_slice_get_param(void *h_vdec,
> > +                              enum vdec_get_param_type type, void *out)
> > +{
> > +       struct vdec_h264_slice_inst *inst =
> > +               (struct vdec_h264_slice_inst *)h_vdec;
>
> No need to cast from void *.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
