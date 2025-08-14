Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBC1CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 09:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdQWt9Kme6F2JRMMWpXobiCrHf8Uzy/gSybqJMT791c=; b=Nda1zpgMxqyzesReHmhzuEU9Yo
	2eh19hQ8vN2GavGgdSGYsOZoYGCbKv40D18tutmvohQO6IyW3+eQSyjflQyMjfQf/cJdRz+ajrj/v
	FUpOBeVkXFxhp6fTB2KU2coHg6GsnB6OBzPmAGMRCXrzVjGH2eh61eNrIC1S9FYO5ItpLyojetlh8
	6ej9KXdQ4T/G2pysXw7U+DH8Kg6FTdxmuhQkyMRynupss0+UgdVHCWGkGt3ZORswc6bexkfR5739A
	SMn3UP2EQl/dli/oYP1thTfrhHh502s7wgh1GjepbfOe7fJ+acvNFbZZloyo0kDDt8c+nz/WLGIIl
	441awp4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUUo-0000000GS4t-0VBs;
	Thu, 14 Aug 2025 09:43:42 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTuY-0000000GLVD-1KeL
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Aug 2025 09:06:15 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55cdfcc0ceaso1706383e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 02:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755162372; x=1755767172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdQWt9Kme6F2JRMMWpXobiCrHf8Uzy/gSybqJMT791c=;
        b=KSv08FfEhQwFSJeTkBNzQWF2USqAluxiQL3J29Besb+3f6F7EMXJ2UZaZXRgyLUpZB
         jBUxNLhviEdH5aHQTRMHUHarW2ZBR3oe7GC6AwyxMnuhlQbqjsH41KPnH5SaDTrUJyTY
         GkEKwszBE1HDHN1PPhg28y6+gXGrURJjfIPqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755162372; x=1755767172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdQWt9Kme6F2JRMMWpXobiCrHf8Uzy/gSybqJMT791c=;
        b=SPEJbjCnYfqsOnhrsF5j1t/CyKxwj7xDIdb8eh44JfrGQCMNG6dZijeY0vhbOYzdTp
         Nkn/whKw5XH8iVUwW92uZPzyDHo1WH3ACF09sbk2kZ2EFL9NLZou6KzEsHzfazgNjJ+2
         VY2suZlqyzlWhswN4ACbM5/7lB/+ObIE0KqeRhKdWqEDP7TO6QM9MIm2qqQM3SmoK5tt
         vWlqKLM5i1DHhzppCXtLcBsNwI6B7ElvkueZuEVYfMUZeXEWHEHFYEfye2LOwDMNBbQy
         LbpONr7cnSAyyOTpJA2UBGdTsYJfUAj/hiUFTfCQ68nfH68agWNJG/9CoHDGLwMbk4/I
         cP1g==
X-Forwarded-Encrypted: i=1; AJvYcCUCBYsjF7Bam31md+Uvf1Tnv79Bt2gtlLRSkFu56mq0e2msun59gatXiFWZkROCb4t/r0pdzn1s8+jgIz866Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVB6itz/toUyGQNPbGAZ/hJdPGnbBSZRPSPabeqSYFhpEjujgj
	EFbYZR+sHqVIWqVSXj9XEvEIjCqwVoX46qZWwHeR1U0iJfiPbd6qq6lmXOcB+rAGhkkbbdpGrJS
	Z3IuL3h1OS43qMzMGcCFhFMQPAEetxwYiDIASWOA8
X-Gm-Gg: ASbGncsTiuBw0/eVSj7D8kEwbaC1F+iXSqFTRkKKcTI98oHsA+0QWjNl4KDTdEYyIF5
	VrHE0g7t/EHVl35v7vShZKWku/EJU/6miIW7/7UITsHW/oqp4DhtWfS+bCeqHUyKK52LBr7l7QB
	ab64xURD2n+o+PzxFmNwPS/PDfL+BA4iv/h+01dOedRr4IKvBY3MtEwOfcib8H1WPN1oSY9wbFW
	xXynJEFTjep0YjW4xZ/NPI0EHgHgwLF2s0=
X-Google-Smtp-Source: AGHT+IGU9GnphCG6HSBtyUKLlXUpoZ2Yg6vOrNiRQ7pS1lm8OOaCvT+3b+1fL4SVXK6wQQu9nnSh1xn95CGSvALWb8c=
X-Received: by 2002:a05:6512:36c4:b0:550:e8b6:6996 with SMTP id
 2adb3069b0e04-55ce62621ffmr411660e87.2.1755162372342; Thu, 14 Aug 2025
 02:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250814083144.191554-1-wenst@chromium.org> <CAC=S1nhz_ESY4VrgWs=dVinLtdOamh6to3EgD1w1Kx=4YBOD9A@mail.gmail.com>
In-Reply-To: <CAC=S1nhz_ESY4VrgWs=dVinLtdOamh6to3EgD1w1Kx=4YBOD9A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Aug 2025 17:06:01 +0800
X-Gm-Features: Ac12FXy4zkwvr3Zx8Pq_FLpV4JVPqltCgSdUQmuTTkGxHam842ZxAUktUDXeYyQ
Message-ID: <CAGXv+5Hke6aEYdyc096_aeS9KHiOzcNqirB-rFT2odepaYhayQ@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Fei Shao <fshao@chromium.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_020614_372350_BE140B86 
X-CRM114-Status: GOOD (  23.94  )
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

On Thu, Aug 14, 2025 at 4:59=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Thu, Aug 14, 2025 at 4:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > Previously a mutex was added to protect the encoder and decoder context
> > lists from unexpected changes originating from the SCP IP block, causin=
g
> > the context pointer to go invalid, resulting in a NULL pointer
> > dereference in the IPI handler.
> >
> > Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> > context. This causes a big warning from the scheduler. This was first
> > reported downstream on the ChromeOS kernels, but is also reproducible
> > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even though
> > the actual capture format is not supported, the affected code paths
> > are triggered.
> >
> > Since this lock just protects the context list and operations on it are
> > very fast, it should be OK to switch to a spinlock.
> >
> > Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect d=
ecoder context list")
> > Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect e=
ncoder context list")
> > Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
> >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-----
> >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
> >  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  4 ++--
> >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-----
> >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
> >  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  4 ++--
> >  7 files changed, 26 insertions(+), 20 deletions(-)
> >
>
> [...]
>
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if=
.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > index 145958206e38..e9b5cac9c63b 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > @@ -77,14 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcodec=
_dec_dev *dec_dev, struct vde
> >         struct mtk_vcodec_dec_ctx *ctx;
> >         int ret =3D false;
> >
> > -       mutex_lock(&dec_dev->dev_ctx_lock);
> > +       spin_lock(&dec_dev->dev_ctx_lock);
>
> Do you mean spin_lock_irqsave()?

This function is only called from the handler below (outside the diff
context), which itself is called from hard IRQ context. This is mentioned
in the comment above the handler.

> >         list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
> >                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu) {
> >                         ret =3D true;
> >                         break;
> >                 }
> >         }
> > -       mutex_unlock(&dec_dev->dev_ctx_lock);
> > +       spin_unlock(&dec_dev->dev_ctx_lock);
> >
> >         return ret;
> >  }
>
> [...]
>
> > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if=
.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > index 51bb7ee141b9..79a91283da78 100644
> > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > @@ -47,14 +47,14 @@ static bool vpu_enc_check_ap_inst(struct mtk_vcodec=
_enc_dev *enc_dev, struct ven
> >         struct mtk_vcodec_enc_ctx *ctx;
> >         int ret =3D false;
> >
> > -       mutex_lock(&enc_dev->dev_ctx_lock);
> > +       spin_lock(&enc_dev->dev_ctx_lock);
>
> Also here.

Same reasoning applies here as well.

ChenYu

> Regards,
> Fei
>
> >         list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
> >                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu) {
> >                         ret =3D true;
> >                         break;
> >                 }
> >         }
> > -       mutex_unlock(&enc_dev->dev_ctx_lock);
> > +       spin_unlock(&enc_dev->dev_ctx_lock);
> >
> >         return ret;
> >  }
> > --
> > 2.51.0.rc1.163.g2494970778-goog
> >
> >

