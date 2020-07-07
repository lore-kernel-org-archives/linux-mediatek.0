Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F8EC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 04:44:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 860C020722
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 04:44:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L9NcmWOI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q2TYLI59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 860C020722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CVrB2uLdMfjFeU4ZuvsIVr3u4ulWv3PKyPMY2sOAQys=; b=L9NcmWOI2UgmVNGdx+SY2MS1Q
	kZujC9mw5xgDe1jpISYGYc3ehqcABj/hXmodUIto80t/LhqPw3EverQks1bMw+0yFE4gKb8sXvMW6
	RUA/Iz3xFcmOIVIOrjNduHRQg4RSYoalk/ENnuRF6Rxd0tAui5gW9aD6lmSSivlcYWEKQbt/FtxdZ
	Nl/NTqv8EeZYN4mw3KOMDj+8tDJ28dVGiTwvZFoGNodwmFXwgYr3DNbw6gUp1ObbjynH7DaaNIseS
	olzdfg2xp8qQMSE7DoAKtwaj0OSp1UDOaUA9EKKhaYdrU0b9FIkgzaqDCOF3qJP3sTU/Z4+cbynKP
	4Km4OyJ6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsfTF-0001q0-Ce; Tue, 07 Jul 2020 04:44:41 +0000
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsfTB-0001pS-Qf
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 04:44:38 +0000
Received: by mail-oo1-xc41.google.com with SMTP id t6so1860066ooh.4
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2020 21:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QMSJ1P6WOlDQn3tsvCD0MzG+bEGBt/nCP/I+g6xWtsU=;
 b=Q2TYLI59eGIzf9IyL+deJj2UiBWfUg/SZGJX20H+rEyFW8mLY5lTKiIvdOmwlox+3C
 bmbdefuB3rsJrA4Nd5EenMqY2KKrWEfMiZweUsxaAhcm+YTGyrBkF9JwMwGENuS33DGu
 z6xpcdOz9/Xv58FoQV3N3o2qEgqaKG6XrJof0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QMSJ1P6WOlDQn3tsvCD0MzG+bEGBt/nCP/I+g6xWtsU=;
 b=AVktSKuudUcyMB056GT5maD6/RBOf6vQLyOQhEOq1yj+zv1dQgN1ykQya0jp2tf7yW
 it0tZVBvh6lnUw4xFGsmUk4cSY+EmVfVYlLTe3PsjMwjekZAd43qLagAQ7fNe55SLXle
 G3KmS/E5WvAfHK6H+G1dtCCQOLr9TmVhY1KQPKD7Qhw4/LA6wHQJOtFhm3g4UkTHRTdq
 19am4HHQKBQ2vzoJxYpq7RvF432obqg38kZhgizqfE8GAgih9R5bXP9GUdaNQoyRPfhZ
 mSv/lhSC79H34dKc2EE06Wdg6b18fQ6bbwfJO/qmiFL0EECatSfApKV90W4lQ9trfBYI
 moFg==
X-Gm-Message-State: AOAM532q5pRdfdDvCfROPRqifiPVWe7+p8TGh9CJ5Pm6V+ow/kZ+lsbL
 mT+rGIHFdM/9CNOAMVHMq7RL0SNVY5s=
X-Google-Smtp-Source: ABdhPJwd+cP4OiBfkbj3kfrZ0PkjwMYi2vjHt1ZTozWHQ53h+o+KrimuF1++TFE2HpG8QCTTdx8RDA==
X-Received: by 2002:a4a:9011:: with SMTP id i17mr22980046oog.29.1594097073503; 
 Mon, 06 Jul 2020 21:44:33 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52])
 by smtp.gmail.com with ESMTPSA id q15sm5491994oij.54.2020.07.06.21.44.32
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 21:44:32 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id n24so31169392otr.13
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2020 21:44:32 -0700 (PDT)
X-Received: by 2002:a9d:7dc1:: with SMTP id k1mr680267otn.141.1594097071741;
 Mon, 06 Jul 2020 21:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200626080442.292309-1-acourbot@chromium.org>
 <20200626080442.292309-17-acourbot@chromium.org>
 <84068e20-9a34-6d03-61e6-6c243680749c@xs4all.nl>
 <CAPBb6MW9deo11+YH9Mh3u08sEt7ShAF_a+S0-Jb_VDGhCQot_Q@mail.gmail.com>
 <74652f57-8dd8-6b24-9889-59bec389464e@xs4all.nl>
In-Reply-To: <74652f57-8dd8-6b24-9889-59bec389464e@xs4all.nl>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Tue, 7 Jul 2020 13:44:19 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWT=aALmuQLkaKLYeXiyPViQCDZLdUUGdi_NFFXCo6Vcw@mail.gmail.com>
Message-ID: <CAPBb6MWT=aALmuQLkaKLYeXiyPViQCDZLdUUGdi_NFFXCo6Vcw@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] media: mtk-vcodec: venc: make S_PARM return
 -ENOTTY for CAPTURE queue
To: Hans Verkuil <hverkuil@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_004437_894054_340045E9 
X-CRM114-Status: GOOD (  37.09  )
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

On Mon, Jul 6, 2020 at 9:43 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 04/07/2020 14:36, Alexandre Courbot wrote:
> > On Fri, Jul 3, 2020 at 5:30 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> On 26/06/2020 10:04, Alexandre Courbot wrote:
> >>> v4l2-compliance expects ENOTTY to be returned when a given queue does
> >>> not support S_PARM.
> >>>
> >>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> >>> ---
> >>>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> >>> index aae610e6d4e8..346a33c6869d 100644
> >>> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> >>> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> >>> @@ -200,7 +200,7 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
> >>>       struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> >>>
> >>>       if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> >>> -             return -EINVAL;
> >>> +             return -ENOTTY;
> >>
> >> This doesn't look right: S_PARM *is* supported, just not for this buffer type.
> >> So -EINVAL is the correct error code.
> >>
> >> What is the exact v4l2-compliance failure? It might be a bug in the test.
> >
> > The error is as follows:
> >
> > Format ioctls:
> >         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> >                 fail: v4l2-test-formats.cpp(1336): got error 22 when
> > setting parms for buftype 9
> >         test VIDIOC_G/S_PARM: FAIL
>
> This is due to bugs in the compliance test that do not take into account the
> stateful encoder spec.
>
> The compliance test should check for the following:
>
> If ENUM_FRAMEINTERVALS is implemented, then G/S_PARM shall be supported for OUTPUT.
>
> If ENUM_FRAMEINTERVALS is not implemented, then G/S_PARM is optional for OUTPUT. But if
> G_PARM is implemented, then S_PARM shall also be implemented. In this case the
> frame interval range is determined by the codec standard.
>
> If V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL is set for one or more pixel formats,
> then G/S_PARM shall be implemented for both CAPTURE and OUTPUT.
>
> For backwards compatibility: if G/S_PARM is supported for OUTPUT, then it may be
> supported for CAPTURE as well.
>
> Can you try with the following patch?
>
> With this v4l2-compliance patch you should be able to drop patches 15/18 and 16/18
> of your series.

Indeed, with this patch v4l2-compliance passes on the encoder device
without 15/18 and 16/18. Thanks, I'll remove them from the next
iteration.

>
> Regards,
>
>         Hans
>
> -------------------------- cut here ------------------------------
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index b5bde2f4..d0441651 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1250,6 +1250,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>                 node.frmsizes.clear();
>                 node.frmsizes_count.clear();
>                 node.has_frmintervals = false;
> +               node.has_enc_cap_frame_interval = false;
>                 node.valid_buftypes = 0;
>                 node.valid_memorytype = 0;
>                 node.buf_caps = 0;
> diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
> index 21e31872..ae10bdf9 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.h
> +++ b/utils/v4l2-compliance/v4l2-compliance.h
> @@ -141,6 +141,7 @@ struct base_node {
>         frmsizes_set frmsizes;
>         frmsizes_count_map frmsizes_count;
>         bool has_frmintervals;
> +       bool has_enc_cap_frame_interval;
>         __u32 valid_buftypes;
>         __u32 valid_buftype;
>         __u32 valid_memorytype;
> diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
> index 3dfc593e..edf1536e 100644
> --- a/utils/v4l2-compliance/v4l2-test-formats.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
> @@ -71,6 +71,8 @@ static int testEnumFrameIntervals(struct node *node, __u32 pixfmt,
>                 ret = doioctl(node, VIDIOC_ENUM_FRAMEINTERVALS, &frmival);
>                 if (ret == ENOTTY)
>                         return ret;
> +               // M2M devices don't support this, except for stateful encoders
> +               fail_on_test(node->is_m2m && !(node->codec_mask & STATEFUL_ENCODER));
>                 if (f == 0 && ret == EINVAL) {
>                         if (type == V4L2_FRMSIZE_TYPE_DISCRETE)
>                                 warn("found framesize %dx%d, but no frame intervals\n", w, h);
> @@ -264,16 +266,22 @@ static int testEnumFormatsType(struct node *node, unsigned type)
>                         return fail("drivers must never set the emulated flag\n");
>                 if (fmtdesc.flags & ~(V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_EMULATED |
>                                       V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM |
> -                                     V4L2_FMT_FLAG_DYN_RESOLUTION))
> +                                     V4L2_FMT_FLAG_DYN_RESOLUTION |
> +                                     V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL))
>                         return fail("unknown flag %08x returned\n", fmtdesc.flags);
>                 if (!(fmtdesc.flags & V4L2_FMT_FLAG_COMPRESSED))
>                         fail_on_test(fmtdesc.flags & (V4L2_FMT_FLAG_CONTINUOUS_BYTESTREAM |
> -                                                     V4L2_FMT_FLAG_DYN_RESOLUTION));
> +                                                     V4L2_FMT_FLAG_DYN_RESOLUTION |
> +                                                     V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL));
>                 ret = testEnumFrameSizes(node, fmtdesc.pixelformat);
>                 if (ret)
>                         fail_on_test(node->codec_mask & STATEFUL_ENCODER);
>                 if (ret && ret != ENOTTY)
>                         return ret;
> +               if (fmtdesc.flags & V4L2_FMT_FLAG_ENC_CAP_FRAME_INTERVAL) {
> +                       fail_on_test(!(node->codec_mask & STATEFUL_ENCODER));
> +                       node->has_enc_cap_frame_interval = true;
> +               }
>                 f++;
>                 if (type == V4L2_BUF_TYPE_PRIVATE)
>                         continue;
> @@ -1222,6 +1230,7 @@ int testSlicedVBICap(struct node *node)
>
>  static int testParmStruct(struct node *node, struct v4l2_streamparm &parm)
>  {
> +       bool is_stateful_enc = node->codec_mask & STATEFUL_ENCODER;
>         struct v4l2_captureparm *cap = &parm.parm.capture;
>         struct v4l2_outputparm *out = &parm.parm.output;
>         int ret;
> @@ -1239,6 +1248,7 @@ static int testParmStruct(struct node *node, struct v4l2_streamparm &parm)
>                         fail_on_test(!cap->readbuffers);
>                 fail_on_test(cap->capability & ~V4L2_CAP_TIMEPERFRAME);
>                 fail_on_test(node->has_frmintervals && !cap->capability);
> +               fail_on_test(is_stateful_enc && !cap->capability);
>                 fail_on_test(cap->capturemode & ~V4L2_MODE_HIGHQUALITY);
>                 if (cap->capturemode & V4L2_MODE_HIGHQUALITY)
>                         warn("V4L2_MODE_HIGHQUALITY is poorly defined\n");
> @@ -1257,6 +1267,7 @@ static int testParmStruct(struct node *node, struct v4l2_streamparm &parm)
>                 else if (node->g_caps() & V4L2_CAP_STREAMING)
>                         fail_on_test(!out->writebuffers);
>                 fail_on_test(out->capability & ~V4L2_CAP_TIMEPERFRAME);
> +               fail_on_test(is_stateful_enc && !out->capability);
>                 fail_on_test(out->outputmode);
>                 fail_on_test(out->extendedmode);
>                 if (out->capability & V4L2_CAP_TIMEPERFRAME)
> @@ -1271,6 +1282,7 @@ static int testParmStruct(struct node *node, struct v4l2_streamparm &parm)
>  static int testParmType(struct node *node, unsigned type)
>  {
>         struct v4l2_streamparm parm;
> +       bool is_stateful_enc = node->codec_mask & STATEFUL_ENCODER;
>         int ret;
>
>         memset(&parm, 0, sizeof(parm));
> @@ -1288,10 +1300,10 @@ static int testParmType(struct node *node, unsigned type)
>         case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>         case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -               if (type && (node->g_caps() & buftype2cap[type]))
> +               if (node->g_caps() & buftype2cap[type]) {
>                         fail_on_test(ret && node->has_frmintervals);
> -               if (ret)
> -                       break;
> +                       fail_on_test(ret && node->has_enc_cap_frame_interval);
> +               }
>                 break;
>         default:
>                 fail_on_test(ret == 0);
> @@ -1300,8 +1312,15 @@ static int testParmType(struct node *node, unsigned type)
>                 fail_on_test(!doioctl(node, VIDIOC_S_PARM, &parm));
>                 break;
>         }
> +       if (ret == ENOTTY) {
> +               memset(&parm, 0, sizeof(parm));
> +               parm.type = type;
> +               fail_on_test(doioctl(node, VIDIOC_S_PARM, &parm) != ENOTTY);
> +       }
>         if (ret == ENOTTY)
>                 return ret;
> +       // M2M devices don't support this, except for stateful encoders
> +       fail_on_test(node->is_m2m && !is_stateful_enc);
>         if (ret == EINVAL)
>                 return ENOTTY;
>         if (ret)
> @@ -1327,11 +1346,29 @@ static int testParmType(struct node *node, unsigned type)
>                 cap = parm.parm.output.capability;
>         else
>                 cap = parm.parm.capture.capability;
> -       fail_on_test(ret && node->has_frmintervals);
> -       if (!ret && (cap & V4L2_CAP_TIMEPERFRAME) && !node->has_frmintervals)
> +
> +       if (is_stateful_enc) {
> +               fail_on_test(ret && node->has_enc_cap_frame_interval);
> +               if (V4L2_TYPE_IS_OUTPUT(type))
> +                       fail_on_test(ret);
> +       } else {
> +               fail_on_test(ret && node->has_frmintervals);
> +       }
> +
> +       /*
> +        * Stateful encoders can support S_PARM without ENUM_FRAMEINTERVALS.
> +        * being present. In that case the limits of the chosen codec apply.
> +        */
> +       if (!ret && (cap & V4L2_CAP_TIMEPERFRAME) && !node->has_frmintervals && !is_stateful_enc)
>                 warn("S_PARM is supported for buftype %d, but not for ENUM_FRAMEINTERVALS\n", type);
>         if (ret == ENOTTY)
>                 return 0;
> +       /*
> +        * S_PARM(CAPTURE) is optional for stateful encoders, so EINVAL is a
> +        * valid error code in that case.
> +        */
> +       if (is_stateful_enc && !V4L2_TYPE_IS_OUTPUT(type) && ret == -EINVAL)
> +               return 0;
>         if (ret)
>                 return fail("got error %d when setting parms for buftype %d\n", ret, type);
>         fail_on_test(parm.type != type);
> -------------------------- cut here ------------------------------

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
