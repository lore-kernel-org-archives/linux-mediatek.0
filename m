Return-Path: <SRS0=EBBG=AP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F26C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 12:36:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45C920870
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 12:36:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PIPzesYg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GjBoxNli"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45C920870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gnw+Dtqj+1eW/b1t41u6VDSxMOEAOFkLUjRbrzBswrc=; b=PIPzesYgLWqoPtrOnYf3O7SBu
	cX25woVc9L6WlIVRRD30FYmaQRVECusAeTajvF2zRp/Xl3dsYAuSQNPRAC10Sms9NEhJddynv/GFe
	tW5jfBBVc+mXsJt2OVJzYiNuH1nsgSriEIoU6Sp4AWuzupN84hv6pzozmVggGFDEhMmWhtSC7BTMZ
	8E46tHtg8B8EjUGW+QEZQUI4WAEnqGazAqFUD2PNCao/bNZ2xj6wJ1bG+OeBmknPMk+AOD485fkuS
	bkkuDwOu5HEca1e9vrf98hTileyCEF1ytaADcwm698Q72oQExeBGYzxXDqnXet4XkSvidAwZDtH1/
	KK/cg+u7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrhPI-0003kN-RT; Sat, 04 Jul 2020 12:36:36 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrhPG-0003jl-Kn
 for linux-mediatek@lists.infradead.org; Sat, 04 Jul 2020 12:36:35 +0000
Received: by mail-ot1-x342.google.com with SMTP id w17so20577939otl.4
 for <linux-mediatek@lists.infradead.org>; Sat, 04 Jul 2020 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OiMRaaF7xQe01D0K4G/ajZqNXBnr3GRE68W057m1m6g=;
 b=GjBoxNliBZ5RFYHjAFdw/X8vNki+bVFRUdP3EVTrVWqzBPUj3fwkJPSsDKd/JRXZuE
 Q49HuaNZose82NcMfwNnuIsIyMFvhhpyCkRJWVsKuEMVIdkE0Nn2qAucHoAxZQeceypF
 BS51mfiSCstCD8gn/mUuqCZi1EsXqpZLes6hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OiMRaaF7xQe01D0K4G/ajZqNXBnr3GRE68W057m1m6g=;
 b=N0zHZrELM+l7ua0ZJOk6JUZj6MXuonh7CWLYSGs5XEWP+XdThbkO/BZxYXfFQXk5YX
 m0FCZMk3k1Kg7pYxMaLuWsrcBEUCjo2q4G20YHFpaycGN4mpMNjDYexxABCRhcQhGPjL
 q0PBUDGWng1IBfclGUWyjN0GrRVYGM3A+F8GmtNpdt5KKX6LVh0ebJsW+anAKbdbCa5H
 F8NMxAZK3of6XBLZNi97ddKbyt5/GOsLFN/X//dSDnHN2bepjrc82gUGF8PSb84lpMnn
 LALNl0MfLVEAWzllBSFK3XCyfBlRb2ebMb+UHr5c6cZdRcufsZe3LdP6jgm4uQq/YXps
 w6zA==
X-Gm-Message-State: AOAM530UiJdjh5cZerP+LotDPeHsWh05jX8wiCLP2zF983F7wRjjpmoJ
 5VY1Dz2OI+PoPQTqox9G8jDpVDhvTLg=
X-Google-Smtp-Source: ABdhPJz4UIE0uza5JeSj19ACTGhyk8UyDQ3mnzlwSWGaas8FILPiyeWaN/TGqu6N58aqLwGfqNqYPQ==
X-Received: by 2002:a05:6830:4008:: with SMTP id
 h8mr35510172ots.158.1593866190188; 
 Sat, 04 Jul 2020 05:36:30 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
 [209.85.167.172])
 by smtp.gmail.com with ESMTPSA id r22sm4257296ooq.37.2020.07.04.05.36.28
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 05:36:29 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id k6so24685603oij.11
 for <linux-mediatek@lists.infradead.org>; Sat, 04 Jul 2020 05:36:28 -0700 (PDT)
X-Received: by 2002:a05:6808:646:: with SMTP id
 z6mr28913132oih.71.1593866188277; 
 Sat, 04 Jul 2020 05:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200626080442.292309-1-acourbot@chromium.org>
 <20200626080442.292309-17-acourbot@chromium.org>
 <84068e20-9a34-6d03-61e6-6c243680749c@xs4all.nl>
In-Reply-To: <84068e20-9a34-6d03-61e6-6c243680749c@xs4all.nl>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Sat, 4 Jul 2020 21:36:15 +0900
X-Gmail-Original-Message-ID: <CAPBb6MW9deo11+YH9Mh3u08sEt7ShAF_a+S0-Jb_VDGhCQot_Q@mail.gmail.com>
Message-ID: <CAPBb6MW9deo11+YH9Mh3u08sEt7ShAF_a+S0-Jb_VDGhCQot_Q@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] media: mtk-vcodec: venc: make S_PARM return
 -ENOTTY for CAPTURE queue
To: Hans Verkuil <hverkuil@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_083634_727713_1A019445 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 3, 2020 at 5:30 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 26/06/2020 10:04, Alexandre Courbot wrote:
> > v4l2-compliance expects ENOTTY to be returned when a given queue does
> > not support S_PARM.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > index aae610e6d4e8..346a33c6869d 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > @@ -200,7 +200,7 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
> >       struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> >
> >       if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> > -             return -EINVAL;
> > +             return -ENOTTY;
>
> This doesn't look right: S_PARM *is* supported, just not for this buffer type.
> So -EINVAL is the correct error code.
>
> What is the exact v4l2-compliance failure? It might be a bug in the test.

The error is as follows:

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
                fail: v4l2-test-formats.cpp(1336): got error 22 when
setting parms for buftype 9
        test VIDIOC_G/S_PARM: FAIL

Maybe we need to check for EINVAL and return ENOTTY in that case, like
what is done on line 1305 of v4l2-test-formats.cpp for VIDIOC_G_PARM?

>
> Regards,
>
>         Hans
>
> >
> >       ctx->enc_params.framerate_num =
> >                       a->parm.output.timeperframe.denominator;
> >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
