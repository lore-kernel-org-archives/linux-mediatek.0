Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C5CC47089
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:10:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80B02613B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80B02613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZT+FoYWkRx/ELe5lqRTjZ8RJf2UNxmHzXNv9iTuja0E=; b=Tp2WLHYK/6tlat
	P6PHDZyB5v/I830Cazb4LEy81dUbxv2/xPTyifSyQnv6nrVblN4IAuBbed2EX5j4prAp2vteUK/aM
	eFxqR1q2QTM1HEo3WRUkHa/HRdKdyyLTHPSrIvWglnvhoIb1FVfJxNDXM1cEy6z3ZgF9JKq/qzDKB
	VPKDFT+nvM3AAUf6k7ugpO3xXF1dLsR2IeIqnJPcZX+tP7WnYLxLXtbP2zpOJRZ6ylWn80ExQlCOv
	88ySbOkBO4eEkwMYeEIgsn+dOpCg+6oxD1HF+Fsiach+VYTiiN/9T+xEtj3gm5uTDbxeZYZQ4Qj5c
	HehhmYaWoIxN63MuPf8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmCy8-004eYv-Is; Thu, 27 May 2021 10:10:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmCy4-004eV4-De
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 10:10:23 +0000
Received: by mail-lj1-x22e.google.com with SMTP id w7so51516lji.6
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=It703JKz/+Tb0hP6nAjPyrUgpmKATOgV+pJiiFvJ1fY=;
 b=YTFjcU/H6G9VcHV0gx9/RP72YTs7DGoos6iEnjKMPoRymcEzunk9qCm4JR8h7WM2f0
 lYzTGIvTcHVIDO8CEJiGmnWGvJwlRzqOvSBuMk24SZ756vtw6UpbfAKrhPXN9+20nA9m
 v3O5PgQY6OfnaNm5LX5j1FqfyeqUlQYlVYWqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=It703JKz/+Tb0hP6nAjPyrUgpmKATOgV+pJiiFvJ1fY=;
 b=Uh5TamWsoOfAJ5/Bkl4r1UszF93ruVLLLMSMJhTWerC6L5HOrKsA46bUeYJzHGuXA0
 S2sqJ/xaaCZUhuttft3vTr+nMDbP3fxlhoVMioV09AS/h1EXs++uTl/IJyb8979vA0AD
 WQATYRkPDLrSF+k4BR0HTXZvfJ0MPn347lpZuo8rIXhPPoGB5ZEyySNzLk8mSYHWI/zA
 iQzwNLigg5LQ/uFwA3CAZ2mO80zxSHZd6HV5v2I6yfP2ofY0Exx4tMgD4u5drlKN0umA
 bWR8VdvieyeetT7fViVeROxJO4EGw3vBDTdoDwKi1wxK7fOsIj5plfYAgMc/ICHcvboA
 ow1w==
X-Gm-Message-State: AOAM533NtYLGFaLrc0kbajToNNDt20E05OUUh7YUxJde36Vtosal/5T1
 tAT+E56Vg2cSKr8e43zrOv/VvSsz2F8qEA==
X-Google-Smtp-Source: ABdhPJwSF6jQ2hndyeSlKrnfnGl9NNeseUQ8HRiPEmbC4R9mH4AR09vEn/hbqXBld+lTRFHdmmlBMA==
X-Received: by 2002:a2e:b805:: with SMTP id u5mr2080634ljo.74.1622110217456;
 Thu, 27 May 2021 03:10:17 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42])
 by smtp.gmail.com with ESMTPSA id n130sm176759lfa.10.2021.05.27.03.10.16
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 03:10:16 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id a2so7154844lfc.9
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 03:10:16 -0700 (PDT)
X-Received: by 2002:a19:6a0f:: with SMTP id u15mr1949848lfu.614.1622110215899; 
 Thu, 27 May 2021 03:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <ed6610cb-5164-4185-f7c9-6d872ea16ec7@xs4all.nl>
In-Reply-To: <ed6610cb-5164-4185-f7c9-6d872ea16ec7@xs4all.nl>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 27 May 2021 19:10:03 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUFmwxaP_11kx2FNAeieOiMCV9W2WGgweuuL8z6ZWeSng@mail.gmail.com>
Message-ID: <CAPBb6MUFmwxaP_11kx2FNAeieOiMCV9W2WGgweuuL8z6ZWeSng@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] media: mtk-vcodec: support for MT8183 decoder
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_031020_498711_B776F760 
X-CRM114-Status: GOOD (  31.88  )
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

On Thu, May 27, 2021 at 5:08 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Alexandre,
>
> On 19/05/2021 16:29, Alexandre Courbot wrote:
> > This series adds support for the stateless API into mtk-vcodec, by first
> > separating the stateful ops into their own source file, and introducing
> > a new set of ops suitable for stateless decoding. As such, support for
> > stateful decoders should remain completely unaffected.
> >
> > This series has been tested with both MT8183 and MT8173. Decoding was
> > working for both chips, and in the case of MT8173 no regression has been
> > spotted.
> >
> > Patches 1-5 fix a few compliance issues with the decoder and encoder, most
> > notably by adding support for the START and STOP command for the latter. These
> > patches were last in the previous series but have been moved to the beginning so
> > they can be applied sooner.
> >
> > Patches 6-9 separates the "stateful" part of the driver into its own file and
> > add support for the new firmware and pixel format used by MT8183.
> >
> > Patches 10-14 add support for H.264 stateless decoding and MT8183.
> >
> > Changes since v4:
> > * Moved compliance fix patches to the head of the series.
> > * Select MEDIA_CONTROLLER_REQUEST_API.
> > * Properly capitalize MM21's format description string.
> > * Reorganize stateless code as suggested by Hans.
> > * Fix compilation errors when DEBUG is defined.
> > * Merge double-free fixup patch into the patch that introduced the issue (was
> >   a separate patch coming right after the one introducing the issue).
> >
> > Changes since v3:
> > * Stop checking that controls are set for every request.
> > * Add V4L2_CID_STATELESS_H264_START_CODE control.
> > * Stop mapping OUTPUT buffers and getting the NAL type from them, use the
> >   nal_ref_idc field instead.
> > * Make V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control stateful-only.
> > * Set vb2_buffer's field to V4L2_FIELD_NONE in buffer validation hook.
> >
> > Changes since v2:
> > * Add follow-up patches fixing support for START/STOP commands for the
> >   encoder, and stateful decoder.
> >
> > Alexandre Courbot (8):
> >   media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
> >   media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
> >   media: mtk-vcodec: make flush buffer reusable by encoder
> >   media: mtk-vcodec: venc: support START and STOP commands
> >   media: mtk-vcodec: vdec: handle firmware version field
> >   media: mtk-vcodec: support version 2 of decoder firmware ABI
> >   media: add Mediatek's MM21 format
> >   dt-bindings: media: document mediatek,mt8183-vcodec-dec
> >
> > Hirokazu Honda (1):
> >   media: mtk-vcodec: vdec: Support H264 profile control
> >
> > Yunfei Dong (5):
> >   media: mtk-vcodec: vdec: move stateful ops into their own file
> >   media: mtk-vcodec: vdec: support stateless API
> >   media: mtk-vcodec: vdec: support stateless H.264 decoding
> >   media: mtk-vcodec: vdec: add media device if using stateless api
> >   media: mtk-vcodec: enable MT8183 decoder
>
> Running scripts/checkpatch.pl --strict over this patch series gives
> a lot of warnings and checks. A lot of these look like they are easy
> to fix and reasonable.

Apologies, I forgot to use --strict. It's not pretty indeed. I've
fixed most of the problems reported ; a few are more tricky or would
require extra cleanup patches like converting e.g. uint32_t to u32
when adding a member to a struct, which would make sense if we convert
all members of the struct (or better, the whole driver) separately.
Hopefully these can be overlooked for the time being.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
