Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57383C25B47
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 02:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+/LYLyDdbkps/oxv4vLLfhE34izDmpgctZLGQjlrOU=; b=sS5zqE9CjMImBNaGnmd4Hhfn1y
	qdXF7pKqsdSMD+Y9ilAUHob72+YEBwvh3IY7oeZXEjZZiCmiSc8HlluyHccusdHUYNrIzo/Z9ZT3S
	Irijf+gxog+2TEMoqNSOuVsJYIaF55v3ZE7m54fcLmqA3Jb7kZnlAif3oWxregeGZQCOxK2PXGjJu
	LTQZ8HgOYMalFFxwsKvGOpJDK2D6OKDSM5t0k4VFhwo3jwJvxOlZXMxbYTg9NTp1w6DYT/n76FGbR
	XGqlj+Tr4esb6TTI/qh2ZIWbedA90Iax5/Tv1f1mA3x9mnZdVmzy8wBk47AQIQJ36z4b0LkMoieUl
	mweHt1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvqFR-00DWOI-0g;
	Thu, 26 Oct 2023 02:37:25 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvqFO-00DWNG-0E;
	Thu, 26 Oct 2023 02:37:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-27e1eea2f0dso283917a91.1;
        Wed, 25 Oct 2023 19:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698287840; x=1698892640; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+/LYLyDdbkps/oxv4vLLfhE34izDmpgctZLGQjlrOU=;
        b=hsZmJ1gnMjH045Dg4QGa80x5NiuEJoIhWcn8sQPZSjr5We79AOCIZX1tenwxYkw2I4
         fpiZPL4BIkHiKpWdsszZvRnE83ch3t0CI8+SXzMOTHDpS7rQ8S3h1p2WQxsGsxJCjzGb
         6wF40gH08b3txNnZ2CcH+iCTsbvLLUX9YiXYlu6FhpUgA2RQqOi8xIwCCjHzjDEsvaue
         ik9T5gXpib5zO8dxNKEno3qV930ZKQvn2DoVcUKlEB/x0mpeu7fRgGWAwGXlJOeW7AEQ
         +rH9ofK1IdYsZtXqKoQtmp1ao/PT0PdbuPVqg2IkJCG8HBmXMQWS1LJpdIWT9+1GoAPq
         uE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698287840; x=1698892640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+/LYLyDdbkps/oxv4vLLfhE34izDmpgctZLGQjlrOU=;
        b=vOD7dUzTvLS1vNw3dvEvEH2+Twkf8fZDlTNGC5EO1ZuXRAEL7RP919FaYhhhuW8Dyc
         vQsqMplXVQdO+Gygimh5K2wtaCm7alSfDLO3yygSAmbSxij+og92xraq8xZK7xT7vHec
         s/pboQMC3dCKMN0j816n+w7/uXp5JkYN77crCDbK9tKXfUmVIQWMExnf4u4Nmy76QhG3
         Ti8mAW2dHPTCH/IfZfAmKmM+v/bht60ZY5VzoEVJj1tfm3OWmYoxSuBWwXoR9zrzt/sI
         B18U0qv1LZZhBJsdPpktyb9npiEePXLrReVYGYZyJR5sSrIQq2fwYYtJg1aFgJNFAf+9
         ZgBA==
X-Gm-Message-State: AOJu0YzgwF4D61KEo9kDP71pysTwVKbFOKswIXYTgK6ctsNA5VTP0QxG
	u4yboKis9TW73Kkw/1nR7Aa+2ilMPZYA/iZIZjk=
X-Google-Smtp-Source: AGHT+IFV4x3BSS9K1oEjlHSvE2/RvYvw8fBgrj6u9+FX0gXhcriKZl+MxQEA3rcXPFkAVWIVdxgy2xECdKyXcpxRICs=
X-Received: by 2002:a17:90a:4f45:b0:27e:3880:d03d with SMTP id
 w5-20020a17090a4f4500b0027e3880d03dmr10065765pjl.7.1698287839741; Wed, 25 Oct
 2023 19:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20231020040732.2499269-1-zyytlz.wz@163.com> <46f704c2-ba42-4e16-d798-ea2171e5ba16@collabora.com>
In-Reply-To: <46f704c2-ba42-4e16-d798-ea2171e5ba16@collabora.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Thu, 26 Oct 2023 10:37:06 +0800
Message-ID: <CAJedcCzE_EHqquj6iu-NgUpBkeF0XdUiDutsgOdCqqX814nkDg@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-jpeg: Fix use after free bug due to error path
 handling in mtk_jpeg_dec_device_run
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com, 
	security@kernel.org, 1395428693sheep@gmail.com, alex000young@gmail.com, 
	amergnat@baylibre.com, wenst@chromium.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_193722_132212_DC0EB95D 
X-CRM114-Status: GOOD (  31.36  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Get it. I'll figure it out how to split up.

Thanks,
Zheng

Dmitry Osipenko <dmitry.osipenko@collabora.com> =E4=BA=8E2023=E5=B9=B410=E6=
=9C=8824=E6=97=A5=E5=91=A8=E4=BA=8C 21:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/20/23 07:07, Zheng Wang wrote:
> > In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> > mtk_jpeg_job_timeout_work.
> >
> > In mtk_jpeg_dec_device_run, if error happens in
> > mtk_jpeg_set_dec_dst, it will finally start the worker while
> > mark the job as finished by invoking v4l2_m2m_job_finish.
> >
> > There are two methods to trigger the bug. If we remove the
> > module, it which will call mtk_jpeg_remove to make cleanup.
> > The possible sequence is as follows, which will cause a
> > use-after-free bug.
> >
> > CPU0                  CPU1
> > mtk_jpeg_dec_...    |
> >   start worker            |
> >                     |mtk_jpeg_job_timeout_work
> > mtk_jpeg_remove     |
> >   v4l2_m2m_release  |
> >     kfree(m2m_dev); |
> >                     |
> >                     | v4l2_m2m_get_curr_priv
> >                     |   m2m_dev->curr_ctx //use
> >
> > If we close the file descriptor, which will call mtk_jpeg_release,
> > it will have a similar sequence.
> >
> > Fix this bug by start timeout worker only if started jpegdec worker
> > successfully so the v4l2_m2m_job_finish will only be called on
> > either mtk_jpeg_job_timeout_work or mtk_jpeg_dec_device_run.
> >
> > This patch also reverts commit c677d7ae8314
> > ("media: mtk-jpeg: Fix use after free bug due to uncanceled work")
> > for this patch also fixed the use-after-free bug mentioned before.
> > Before mtk_jpeg_remove is invoked, mtk_jpeg_release must be invoked
> > to close opened files. And it will call v4l2_m2m_cancel_job to wait
> > for the timeout worker finished so the canceling in mtk_jpeg_remove
> > is unnecessary.
> >
> > Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decod=
er Driver")
> > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  .../media/platform/mediatek/jpeg/mtk_jpeg_core.c    | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > index 7194f88edc0f..c3456c700c07 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > @@ -1021,13 +1021,13 @@ static void mtk_jpeg_dec_device_run(void *priv)
> >       if (ret < 0)
> >               goto dec_end;
> >
> > -     schedule_delayed_work(&jpeg->job_timeout_work,
> > -                           msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC))=
;
> > -
> >       mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
> >       if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf-=
>vb2_buf, &fb))
> >               goto dec_end;
> >
> > +     schedule_delayed_work(&jpeg->job_timeout_work,
> > +                           msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC))=
;
> > +
> >       spin_lock_irqsave(&jpeg->hw_lock, flags);
> >       mtk_jpeg_dec_reset(jpeg->reg_base);
> >       mtk_jpeg_dec_set_config(jpeg->reg_base,
> > @@ -1403,7 +1403,6 @@ static void mtk_jpeg_remove(struct platform_devic=
e *pdev)
> >  {
> >       struct mtk_jpeg_dev *jpeg =3D platform_get_drvdata(pdev);
> >
> > -     cancel_delayed_work_sync(&jpeg->job_timeout_work);
> >       pm_runtime_disable(&pdev->dev);
> >       video_unregister_device(jpeg->vdev);
> >       v4l2_m2m_release(jpeg->m2m_dev);
> > @@ -1750,9 +1749,6 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
> >       v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> >       v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> >
> > -     schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> > -                           msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC))=
;
> > -
> >       mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
> >       if (mtk_jpeg_set_dec_dst(ctx,
> >                                &jpeg_src_buf->dec_param,
> > @@ -1762,6 +1758,9 @@ static void mtk_jpegdec_worker(struct work_struct=
 *work)
> >               goto setdst_end;
> >       }
> >
> > +     schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
> > +                           msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC))=
;
> > +
> >       spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
> >       ctx->total_frame_num++;
> >       mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
>
> What about to split this patch into 3 patches:
>
> 1. will remove cancel_delayed_work_sync()
> 2. will update mtk_jpeg_dec_device_run()
> 3. will update mtk_jpegdec_worker()
>
> The reason for splitting is because the multi-core mtk_jpegdec_worker()
> doesn't present in older stable kernels, and thus, the patch isn't
> backportable as-is.
>
> --
> Best regards,
> Dmitry
>

