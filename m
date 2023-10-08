Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F18E95A8F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Oct 2023 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIjUR5wsU/i7XxPuSQP1qfexQee767Fh9n1eSCn2QNU=; b=bfX2HhD+CPM72svI08z32v14gf
	p4Jvt0PoAal4b11le6QS+Io4S+J2bvhPLxI5vnfJse8xDz4zTbSnlIGldHN2p5G8+U4TZuYAm56Mt
	KWfkNSG89uqyxfC186oLVNZU/jwIHdCo1j210M8oRN7x/EOCwapYKTANb6kiwyDLUteEL8aak7Nh6
	mIErXlA14vRemDa2o1o+dn3OrPZc/Tf2ahsonrkkpT9oa+jIH/lLdw38Ya56JctVdfBrJ3pbGuvtz
	d63c3SKZ7fL97XXDL+s4mZWxuYKrB2dtFTSAIuUbDbvy8PGixAJKyEZwVen0LYrMeIfWKbz2BDGQl
	OrNGZoMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpPqm-008ZC6-1M;
	Sun, 08 Oct 2023 09:13:24 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpPqj-008ZBb-0S;
	Sun, 08 Oct 2023 09:13:22 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-27758be8a07so2886831a91.0;
        Sun, 08 Oct 2023 02:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696756399; x=1697361199; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIjUR5wsU/i7XxPuSQP1qfexQee767Fh9n1eSCn2QNU=;
        b=CbCP5IRTzf3He2Ob1KnXW0qAMjXaMD5TEYUeTga2jqHIIg5Eh0A9ezpURUq4crVmTS
         ttTi0jg7d4AmFan2wI+lhnu+yAim6WnaFpWH/cbVo5Q3fc1Lg3WMo4Z3IEf0Lt/l5hf+
         VKjLwjemZUiwC3kLyFPB2Gqxb17GeKjyrHsGWcRw+vZsCRW0CxnZevCVzmskM9fljSBn
         V/z/G5Fdx+kJqmKGFeoLYkAWpIqO+xoyPhfIYmiizJEC9Hiq0Sd5YKBiBW1e8/TGQ0xQ
         0xdsulR5egFi7/vzMtIeesYtwpiA83J2/QHs4hLZ2DEZl1rVrLNRyObPxUNJbkGCpVP7
         h4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696756399; x=1697361199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIjUR5wsU/i7XxPuSQP1qfexQee767Fh9n1eSCn2QNU=;
        b=txMZCeE0CVCln/13PaVOh63tpCCgOotanpljHxQxd52p54Toi53AcrQDqKZTvPhPPg
         LbUaTvrWooJ71u+yuwo9S/3oVboPxWauncqJsKRlc1ZhTn0fdwQQoKBl/E56qTZCIThG
         Azf8e/kL2L2mKU3CYVYBicKyRr05uEF+KOqnQu9tqHoq5BX/6sI9Q+4DxqtHsx+Cd/9i
         1b6qJRsXXOWLJ85WQO8GGLx90VZBMHxYisigTjln2/AqxEKN6gtasYfLx9M1KCJjmhtR
         erUpK/zHqnIo+3q64DtO0L5wl2fHpVbClQqrFNSIULnkCDhi5X3f4sVXxx6U6Q+HVI8u
         Ublg==
X-Gm-Message-State: AOJu0YztitS0B4Vm/gpA+rfXd6B3FtqTQDNN8VbgM0MxX3ncX++HtHFw
	qJJti7GPTujEDKCWhyQOGMJYhuvGftcEmtRxFhA=
X-Google-Smtp-Source: AGHT+IFlzAJPF2c72JOttTd8L7USLuoA/igr3cJARYtnvM1yOtRhQrr9zu3gvttgERj4A9EJxSkJuVzwSq9kONltlgc=
X-Received: by 2002:a17:90a:ad87:b0:277:7969:6bf2 with SMTP id
 s7-20020a17090aad8700b0027779696bf2mr11948863pjq.47.1696756398972; Sun, 08
 Oct 2023 02:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230707092414.866760-1-zyytlz.wz@163.com> <8c8bd3ec-a5a4-32e4-45b5-ee16eeeac246@collabora.com>
 <CAJedcCxPG1mKtgB7AcJSwaQB_qvODObwq3gz6eM_1w777b2PfQ@mail.gmail.com>
 <54b14ebe-b51b-2744-328d-2adcdaaf6d0e@collabora.com> <CAJedcCyn+VHxcSXH+HqP3yiXX8L0wjNao+suti5GgyQzYORcYA@mail.gmail.com>
 <4d533beb-f416-1b22-6d9d-cee7f3cfdad1@collabora.com>
In-Reply-To: <4d533beb-f416-1b22-6d9d-cee7f3cfdad1@collabora.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Sun, 8 Oct 2023 17:13:07 +0800
Message-ID: <CAJedcCwDemUSo8Hv1XYLcAkHeo2Y2RU=xX7Fv5aSRz52AixK6g@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Zheng Wang <zyytlz.wz@163.com>, 
	Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com, 
	security@kernel.org, 1395428693sheep@gmail.com, alex000young@gmail.com, 
	Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_021321_199426_3CE910D9 
X-CRM114-Status: GOOD (  22.35  )
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

Dmitry Osipenko <dmitry.osipenko@collabora.com> =E4=BA=8E2023=E5=B9=B49=E6=
=9C=8820=E6=97=A5=E5=91=A8=E4=B8=89 02:24=E5=86=99=E9=81=93=EF=BC=9A
>
> On 8/31/23 11:18, Zheng Hacker wrote:
> >> The v4l2_m2m_ctx_release() already should wait for the job_timeout_wor=
k
> >> completion or for the interrupt fire. Apparently it doesn't work in
> >> yours case. You'll need to debug why v4l job or job_timeout_work is
> >> running after v4l2_m2m_ctx_release(), it shouldn't happen.
> >>
> > Yes, v4l2_m2m_cancel_job waits for m2m_ctx->job_flags to be  ~TRANS_RUN=
NING,
> > the mtk_jpeg_job_timeout_work will finally invoke v4l2_m2m_job_finish
> > to trigger that.
> >
> > However, this is not the only path to call v4l2_m2m_job_finish. Here
> > is a invoking chain:
> > v4l_streamon
> >   ->v4l2_m2m_ioctl_streamon
> >     ->v4l2_m2m_streamon
> >       ->v4l2_m2m_try_schedule
> >         ->v4l2_m2m_try_run
> >           ->mtk_jpeg_dec_device_run
> >             ->schedule_delayed_work(&jpeg->job_timeout_work...
> >             ->error path goto dec_end
> >             ->v4l2_m2m_job_finish
> >
> > In some specific situation, it starts the worker and also calls
> > v4l2_m2m_job_finish, which might
> > make v4l2_m2m_cancel_job continues.
>
> Then the error path should cancel the job_timeout_work, or better job
> needs to be run after the dec/enc has been started and not before.
>

Hi,

Sorry for my late reply for I just went on a long vacation.

Get it. I'll write another patch and change the summary to the lack of
canceling job in error path.

> Looking further at the code, I'm confused by this hunk:
>
>         mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
>         v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>
> The job should be marked as finished when h/w has finished processing
> the job and not right after the job has been started. So the job is
> always completed and mtk_jpeg_job_timeout_work() doesn't work as
> expected, am I missing something?

After reading the code I still don't know. I didn't see any function
like mtk_jpeg_dec_end. The same thing
happens on mtk_jpeg_enc_start. I think I'd better fix the first
problem and wait for someone familiar with
the second part.

Best regards,
Zheng

>
> --
> Best regards,
> Dmitry
>

