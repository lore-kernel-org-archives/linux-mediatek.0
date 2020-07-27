Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC20AC433E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 09:07:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B98482075A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 09:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hgm9XXry";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hPNIvNvp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B98482075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mgdm3EQ+2T0J9YF0cxTsvNV0l4zjgr/R72N+B9qPmFk=; b=hgm9XXrysNg5+b+Mav5jaWxSM
	cJh6tEHzDUXuyTP2RmCrZEGCx14O1noUIlks3tQjtC1G19wBP6JfbBR0JDQdYZI/D+YbxGdkbmbYq
	AnhvT31LPoBv29OWv9CPtnTxwJjFO3xSjrDbJItlHCz1URLTYLZ3/gJ1cE4GS5ko45IzNdwaQzxos
	Gzrwky+x8ZU1AAx59qM0bcSDMnLNabg7526YkUd18c5ALi5NxVoN5Vrhi+1umTE6cX2ISHsasjKxF
	dcEDFS4aMuLoEmxp4/9lVaNqv3v/1+7j303VKxgCiULNKjBkzoPeAo3vgcQSfsl6SMAYQbHAKYh6l
	MrK0PG/rg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzz66-0005qY-Sx; Mon, 27 Jul 2020 09:07:02 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzz64-0005o1-Fc
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 09:07:01 +0000
Received: by mail-ot1-x343.google.com with SMTP id r21so1264868ota.10
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HYKgToXHXhx0gJz2aTB9SU//eyR38G50GGbzq2n5Ipw=;
 b=hPNIvNvpFOTTuiyz1gtUwXItKh0lDha0D8yxF72PrmXRN/3g7ABWPSATcOBc0/4qQ+
 Oi/jJNcK71J61tBAoBRZSwlh2A8FEOKUZc+dPww7gaiKNe6LU+hwXFjbVFcVKeuGUK+n
 qNlAEZxVzu9wK21hZVA2GI93Vf63+n9BtOuwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HYKgToXHXhx0gJz2aTB9SU//eyR38G50GGbzq2n5Ipw=;
 b=nl43XmGk/KjQyw1XZi2lyYnHmudwGy5ZlR83WWFKwtoUhDImbuKlam/78iAYShKXar
 IPtajMyjMIaYbQVO//Zyl0DKpwiGbYWOGDN4pXokFOHbP1EMdfALNtFHB9lC48q4s1kD
 ai0qiupEMROMLrCVjDzNF/ByHN5iIezgYy3Qrn2k+RarFitEacEIMdWN+v7AEbT3YQ9o
 koAW8a8L0rDxBHLNI6IWt8u/sEyHVul20U9R9IKoSA3sJ7iNj2qYlX4Jhj0tV5Qa9WY1
 s+Iq3fGikr0dBnl5fotGb1+9wv1MVxwzRAR9uWdKfdISnpqYM9V7zGSz6Ma6vUS61Ovd
 pjYQ==
X-Gm-Message-State: AOAM531Fv6Q35KOQr8WTdwA+xLOrJQ51kAkPBhg6DRXVv1/KgOyJ/GVx
 SFxnEYcSpEVKczRAK1B7yG5/57xnKdA=
X-Google-Smtp-Source: ABdhPJyLkqOnkZcKijRtdatLbz/K9kBHUGBNIUSnQYaxSK8U2C0rawR6SWY36jCXnMdf2I/keZ5f1Q==
X-Received: by 2002:a05:6830:1510:: with SMTP id
 k16mr19304888otp.336.1595840818330; 
 Mon, 27 Jul 2020 02:06:58 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com.
 [209.85.210.49])
 by smtp.gmail.com with ESMTPSA id c135sm1957230oig.38.2020.07.27.02.06.56
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 02:06:57 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 93so1622157otx.2
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 02:06:56 -0700 (PDT)
X-Received: by 2002:a9d:5609:: with SMTP id e9mr18648943oti.141.1595840815529; 
 Mon, 27 Jul 2020 02:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-8-acourbot@chromium.org>
 <CAAEAJfA4Po9R25CzBxiFAV=7-7rPujLc79zLnXyXWk7xNbBtYA@mail.gmail.com>
In-Reply-To: <CAAEAJfA4Po9R25CzBxiFAV=7-7rPujLc79zLnXyXWk7xNbBtYA@mail.gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 27 Jul 2020 18:06:42 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUsSzrZAZdeH+at+9pf5sVa0ghE982ktnPW8rB91pYt6Q@mail.gmail.com>
Message-ID: <CAPBb6MUsSzrZAZdeH+at+9pf5sVa0ghE982ktnPW8rB91pYt6Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] media: mtk-vcodec: venc: specify supported
 formats per-chip
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_050700_683176_3B04D519 
X-CRM114-Status: GOOD (  24.30  )
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
 devicetree <devicetree@vger.kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jul 26, 2020 at 11:29 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> Hi Alexandre,
>
> Last review on my side, this series looks mostly good.

Thanks for taking the time to look at it! I know it's not the best
looking code out there. ^_^;

>
> On Mon, 13 Jul 2020 at 03:09, Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > Different chips have different supported bitrate ranges. Move the list
>
> s/bitrate ranges/formats

Ack.

>
> > of supported formats to the platform data, and split the output and
> > capture formats into two lists to make it easier to find the default
> > format for each queue.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > ---
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   8 ++
> >  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 122 +++++++-----------
> >  .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  40 ++++++
> >  3 files changed, 95 insertions(+), 75 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index b8f913de8d80..59b4b750666b 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -313,6 +313,10 @@ enum mtk_chip {
> >   * @has_lt_irq: whether the encoder uses the LT irq
> >   * @min_birate: minimum supported encoding bitrate
> >   * @max_bitrate: maximum supported encoding bitrate
> > + * @capture_formats: array of supported capture formats
> > + * @num_capture_formats: number of entries in capture_formats
> > + * @output_formats: array of supported output formats
> > + * @num_output_formats: number of entries in output_formats
> >   */
> >  struct mtk_vcodec_enc_pdata {
> >         enum mtk_chip chip;
> > @@ -321,6 +325,10 @@ struct mtk_vcodec_enc_pdata {
> >         bool has_lt_irq;
> >         unsigned long min_bitrate;
> >         unsigned long max_bitrate;
> > +       const struct mtk_video_fmt *capture_formats;
> > +       size_t num_capture_formats;
> > +       const struct mtk_video_fmt *output_formats;
> > +       size_t num_output_formats;
> >  };
> >
> >  /**
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > index 50ba9da59153..05743a745a11 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > @@ -23,47 +23,9 @@
> >  #define DFT_CFG_WIDTH  MTK_VENC_MIN_W
> >  #define DFT_CFG_HEIGHT MTK_VENC_MIN_H
> >  #define MTK_MAX_CTRLS_HINT     20
> > -#define OUT_FMT_IDX            0
> > -#define CAP_FMT_IDX            4
> > -
> >
> >  static void mtk_venc_worker(struct work_struct *work);
> >
> > -static const struct mtk_video_fmt mtk_video_formats[] = {
> > -       {
> > -               .fourcc = V4L2_PIX_FMT_NV12M,
> > -               .type = MTK_FMT_FRAME,
> > -               .num_planes = 2,
>
> Again, not an issue with your patch, so feel free to ignore this.
>
> You may avoid keeping track of num_planes (or any other
> property of the pixel format) and use v4l2_fill_pixfmt_mp
> to get all the information you need.

That's a good idea. Let's see if I can come with an extra patch in a
way that does not prevent the already acked patches from being merged.
:)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
