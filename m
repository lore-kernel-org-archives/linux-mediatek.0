Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411E6C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA35E6109F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 13:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA35E6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoVz0Qoh6SjQG4cRgQDf/fKJDHC/WFW/xFi7X0W6L8o=; b=gRLtDusxJPXR/uUWOQdnv4RTQL
	aj0VL8oBJDJ//VsJ2cCeCU4654Rb2Av6th9fXRCOnQg8VVtAXhz2XIC/LejUJjZcKIWcQZACFHK5P
	xYlp9WD25beYh7gMPLlIgdyjbPGW7Zlm1g3GT4JzbMAIP0tpYsWvZBvgjrwaGKTmHwOdzunJddSDO
	VKi8+vhl6xNK1U3o9aCFgQKQsmlw3Yu1mYDpHiHWIJi/nXfU7Cd0kxQyo/fnU3fdmkz2yQyBZNh3r
	Dprjt/rPZfye7YjLQQxqxiM/EUqvfjA8wuQHwRFKMdpPrm34YtgUKuaQYOTkwx66EgLK3E7PCDMWA
	SjZRdqzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk5ME-005Z0E-NG; Fri, 21 May 2021 13:38:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk5MC-005Yyf-Ov
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 13:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=P8K4c4I3E0ScqatNpdtAdPPA1ppP33415CwioITRQ28=; b=JXchT6QKZ3fYy1frxSQvOibcbM
 RldQ6YhjQoDYx64ceNlZE9aACbXeX1PHCzEYFgcdRMy13zOhS4d5L1MmI89YXudnXr4xZCT6rhXHW
 KyDxMBJEfeZzH1AI2S4bE4n/65MAqJ6kK5FROSgb9O8DHT8pXNqYByHa7Ien3wItjDJ3yrYSYiKui
 kR+JQdv4ELQ0ctlr55qJFTaHgs6uwwHfw1TVj7e9NotGz9a5tkAuZiqgDBfjmQNNoGYttglW6Yroh
 WdfPcGN+/jTozDYqZwmtr2A3z5tmuuCMmhr5A92YSJrU6T2X5yyD7eSNebIugAnHK22lT3Gz4cQpK
 h+PEQ03g==;
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk5MA-00H9Zz-9W
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 13:38:27 +0000
Received: by mail-io1-xd36.google.com with SMTP id z24so20153715ioi.3
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 06:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P8K4c4I3E0ScqatNpdtAdPPA1ppP33415CwioITRQ28=;
 b=WvVKiwzhtpchBrgwnrtu/VPArYkX35BZT0jVz2d3peS1iXg6p8KiiuIH8jzggDnNbr
 yVrse6NVTrPmjE13XP0shAgyR6vrOPr4U+8BCzEgDpoetP1EvMdhiy01IkSobFcBO+tl
 Mk2kr2gTuf9ODLYRqzppYHHEJGi6vKBENrmpg5YimFUu0StPEtOSKjdBlrr3PyXpgM63
 x+f5H8Wbimx1f1jScGC0mXwSoguiTIz0BHscM9OXDPR6I7deEJDecbuSxOy5nisEi9On
 gpn+r1UM7x/iX6z/r4bi1rMgMW3VtAEiVPGX6Ru1XTV/RByNIDbbQ887CRW3fpP7AOXd
 4sUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P8K4c4I3E0ScqatNpdtAdPPA1ppP33415CwioITRQ28=;
 b=eG058k1dQXG90f+JvrZ3EEq696O8pXxMHDSdcysGpkiE1fH60AIOhMjhybQNHx2lDe
 gxbE6rHytnlAJtIp4ouh8nK7HuSOoVY0XvDdhEmbGVWAKSrdNf+/Vp31QDIRUHSPWehf
 FPwoSDN1MmbSmTFgb17xI83RJzs8/UdWmyDJ4w37OiWxYFYr4Zk1VDg1BYnHJCE51Jsb
 FOv8nwon8n5S4tdGI8xmgKd7WFllHAR3RER0pYSKgpzSe+90slt2vGioKETbGeDQv2iq
 8mzWxc2vgEc+1RKlqD8mgeTR440cX/CMKJdJT9KIyA9+1zxELq+PVeE2VD8cALspVOVj
 0+KA==
X-Gm-Message-State: AOAM5316abadYneOphftJAHwQ7HjvWSk+djuh3GwKymRAs4rGjbBiajT
 LQ7xw1ebROZVAOfT6MEUm4zKWoSfLm9cxIAgzfNl4w==
X-Google-Smtp-Source: ABdhPJwGS5p1CUtc8MeJkM1M+YPLMW1IaLUnAfAAaV6/8vNhpyIeddCaWTRXOChcNDmTYv0D6x0Fsq6hZZ3HcEF0JCc=
X-Received: by 2002:a05:6638:3010:: with SMTP id
 r16mr4601269jak.126.1621604304927; 
 Fri, 21 May 2021 06:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-12-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-12-acourbot@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 21 May 2021 21:38:13 +0800
Message-ID: <CA+Px+wXXtsmG2q4aJ4Em1pzFcA-mA6CuATfXKevNyEOuBq+zYw@mail.gmail.com>
Subject: Re: [PATCH v5 11/14] media: mtk-vcodec: vdec: support stateless H.264
 decoding
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
X-CRM114-CacheID: sfid-20210521_063826_344313_8D4F7EBD 
X-CRM114-Status: GOOD (  13.64  )
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
> +#include "../vdec_drv_if.h"
> +#include "../mtk_vcodec_util.h"
> +#include "../mtk_vcodec_dec.h"
> +#include "../mtk_vcodec_intr.h"
> +#include "../vdec_vpu_if.h"
> +#include "../vdec_drv_base.h"

Would be good practice to sort them.

> +static int allocate_predication_buf(struct vdec_h264_slice_inst *inst)
> +{
> +       int err = 0;

No need to initialize.  It will be overridden soon.

> +static void free_predication_buf(struct vdec_h264_slice_inst *inst)
> +{
> +       struct mtk_vcodec_mem *mem = NULL;
> +
> +       mtk_vcodec_debug_enter(inst);
> +
> +       inst->vsi_ctx.pred_buf_dma = 0;
> +       mem = &inst->pred_buf;

Is it possible to inline to the variable declaration?  Or mem no need
to initialize.

> +static int alloc_mv_buf(struct vdec_h264_slice_inst *inst,
> +       struct vdec_pic_info *pic)
> +{
> +       int i;
> +       int err;
> +       struct mtk_vcodec_mem *mem = NULL;

No need to initialize.  It will be overridden soon.

> +static void free_mv_buf(struct vdec_h264_slice_inst *inst)
> +{
> +       int i;
> +       struct mtk_vcodec_mem *mem = NULL;

No need to initialize.  It will be overridden soon.

> +static int vdec_h264_slice_init(struct mtk_vcodec_ctx *ctx)
> +{
> +       struct vdec_h264_slice_inst *inst = NULL;

No need to initialize.  It will be overridden soon.

> +static void vdec_h264_slice_deinit(void *h_vdec)
> +{
> +       struct vdec_h264_slice_inst *inst =
> +               (struct vdec_h264_slice_inst *)h_vdec;

No need to cast from void *.

> +static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
> +                                 struct vdec_fb *fb, bool *res_chg)
> +{
> +       struct vdec_h264_slice_inst *inst =
> +               (struct vdec_h264_slice_inst *)h_vdec;

No need to cast from void *.

> +       const struct v4l2_ctrl_h264_decode_params *dec_params =
> +               get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
> +       struct vdec_vpu_inst *vpu = &inst->vpu;
> +       uint32_t data[2];
> +       uint64_t y_fb_dma;
> +       uint64_t c_fb_dma;
> +       int err;
> +
> +       /* bs NULL means flush decoder */
> +       if (bs == NULL)

To neat, !bs.

> +static int vdec_h264_slice_get_param(void *h_vdec,
> +                              enum vdec_get_param_type type, void *out)
> +{
> +       struct vdec_h264_slice_inst *inst =
> +               (struct vdec_h264_slice_inst *)h_vdec;

No need to cast from void *.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
