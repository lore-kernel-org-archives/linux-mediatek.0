Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37F1C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 02:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vR16R3nH7fmv/BxEUykAASSecaa8iTYdR38F9yHcXJs=; b=T3WDtEmrAG8uVw23+HpvQQ/0vn
	h8/En1tmToyQ3R2/mJUjH7FzzX0iknnJ9OvC86fArgsag7MQGOuJAft94vPaOKPrn+klFn2rL2rJ1
	4K0l5lKfENHPowpelz5Vt58wG+aK2K4AxhOFKAqyQePraKUkrW+MSFsKQAHDdwlEvaJm9YOUAmxqQ
	BEufM2hohD0os/+09SCEENbE824HoZsff4QjLTUsH2/5pCXJGklTPrc7qKbi2jrME56XdM0hS8pqu
	eyvhZREGwMO/eJMRJ0bcA56jLvRqdy3xRldVkLuh6avYTx6WK5H6uQWl/L8Ddhtp/iT4z4qbG0y81
	uRouHVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Ykh-002qHM-2L;
	Wed, 08 Nov 2023 02:57:11 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Yke-002qG8-1z;
	Wed, 08 Nov 2023 02:57:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5bd5809f63aso2607664a12.3;
        Tue, 07 Nov 2023 18:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699412225; x=1700017025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vR16R3nH7fmv/BxEUykAASSecaa8iTYdR38F9yHcXJs=;
        b=Yjb0iJzY2NFTGwrusi/KxyoSF1k45XeeOUTmFYZd2rUBECQPHYBAbBH2fTHoDNVXVW
         X1/i2qgXLR1TIbuCVrWkEamMIMB1Tt+qPTdRr08w6SK4Ak4kkrl3J3WITFLgZEq1GoBP
         UDWe7EXv2ML5RrCWOkX4geJkymRsiCNRCx27H1DvFqNIAfiGuW5EVb9OH5Rx+FtVntzM
         JbBLjAZX0W4xyJ+O7hEj58paKR9caGRvFdBI3snVhAU1tzndC1HMMpsVPuhuiOo7K4ok
         iz5tqGzLlKM8fVnpbXyKw+X6f2Las8Fe7BhVtVix61RXZm2Dfo8BoZ7xJhP2Ib7SpLB2
         kf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699412225; x=1700017025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vR16R3nH7fmv/BxEUykAASSecaa8iTYdR38F9yHcXJs=;
        b=Iu24e35AX8oJw7tXhOK4cyul0+G6TkocE0WZ7ugiA2BwvLai9p45CFv60EeOENhmaz
         I+Tj8NfGdUGamrpWC5FOG0SYyxk8ZL4s1PQ6PKcrfdE0OwaObxLahlz7SKk00UmpWpsx
         wcAAE54cKKcFIcbcqPVohvngQVidE10DtnTnrtozhCgMJ1QFiYe7Ynb1wpoOrzumnYG8
         m+3E87kGAI2dxaKtyhgX/VggOEk+2xyTiVTU7tZamN3pyb0jjyR4aCvDYn7V8+l7pRZD
         O+7dmd5EAioQu5ammaKoiScZ2SWuhzS/CYCqBeHkA7I/EEhAXznhshzhxwWAAmj7Lqx/
         fuVQ==
X-Gm-Message-State: AOJu0YyNBPnF2349GbVechPg4gPx51UrSe09hxp0yERoXsbveWlwpISA
	WRlK7v6V+vBV8FUIfKhu4Sv1qD7pi2UTpz4SZ3k=
X-Google-Smtp-Source: AGHT+IF3q4D8mSxtA0NdLkdfYSoxbFu7W4fzZDtMoDCUqUarRgS7ohRJloJqc4hOG4cnBnvyiD/RosFjWtNu0PZ4qcQ=
X-Received: by 2002:a05:6300:8004:b0:180:eef7:b3b7 with SMTP id
 an4-20020a056300800400b00180eef7b3b7mr1118305pzc.51.1699412224768; Tue, 07
 Nov 2023 18:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20231106144811.868127-1-zyytlz.wz@163.com> <b5f9d751-5425-4281-8a21-99e92bd447b7@xs4all.nl>
In-Reply-To: <b5f9d751-5425-4281-8a21-99e92bd447b7@xs4all.nl>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Wed, 8 Nov 2023 10:56:52 +0800
Message-ID: <CAJedcCwaHCEksJpUz1Y0s-SX2zd_ncfOZs53qiMcaeBN2sw1YQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 0/3] Fix use-after-free bug in
 mtk_jpeg_dec_device_run and fix schedule error in mtk_jpegdec_worker
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Zheng Wang <zyytlz.wz@163.com>, dmitry.osipenko@collabora.com, Kyrie.Wu@mediatek.com, 
	bin.liu@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com, 
	security@kernel.org, amergnat@baylibre.com, wenst@chromium.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_185708_658335_1BF2BA7D 
X-CRM114-Status: GOOD (  19.90  )
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

Hans Verkuil <hverkuil@xs4all.nl> =E4=BA=8E2023=E5=B9=B411=E6=9C=887=E6=97=
=A5=E5=91=A8=E4=BA=8C 18:14=E5=86=99=E9=81=93=EF=BC=9A
>
> On 06/11/2023 15:48, Zheng Wang wrote:
> > Hello,
> >
> > This v2 series fixes the use-after-free bug in mtk_jpeg_dec_device_run.
> > This patch fixes the security bug in chrome-os.
> > It inclues reverting the incomplete fix before and make the right fix.
> > Also,it fixes the error of timeout-worker-schedule in multiple-core
> > devices.
> >
> > 1. Remove cancel worker in mtk_jpeg_remove for the worker is only
> > registered in single-core device but we try to cacnel it in both
> > single-core and multiple-core devices.
> >
> > 2. Fix use-after-free bug by delay the schedule_delayed_work only if
> > mtk_jpeg_set_dec_dst runs successfully.
> >
> > 3. Delay the schedule_delayed_work in mtk_jpegdec_worker as it has same
> > code logic in mtk_jpeg_dec_device_run.
> >
> > version 2 changes
> >
> > -put the patches into on series suggested by Dmitry
> >
> > Zheng Wang (3):
> >   media: mtk-jpeg: Remove cancel worker in mtk_jpeg_remove to avoid the
> >     crash of multi-core JPEG devices
> >   media: mtk-jpeg: Fix use after free bug due to error path handling
> >     in mtk_jpeg_dec_device_run
> >   media: mtk-jpeg: Fix timeout schedule error in mtk_jpegdec_worker.
> >
> >  .../media/platform/mediatek/jpeg/mtk_jpeg_core.c    | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
>
> Please don't resend. If it is in patchwork.linuxtv.org then it is good.
> Fixes (unless they fix something really nasty) can take several weeks bef=
ore
> they are picked up. I usually schedule 2 or 3 rounds per kernel cycle whe=
re
> I go through all the pending patches with fixes.
>

Oh Sorry for my rudeness. And I'm deeply appreciative of your contributions
to the community.

Best regards,
Zheng


> Regards,
>
>         Hans

