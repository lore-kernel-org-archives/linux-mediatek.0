Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D30CA0EDC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Aug 2025 05:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMOc0zAG5IHElycDwN0z3G1Bp9v6la9CFRr7DqTKuhw=; b=WGEo6M8N5QDyOIOh5OOUOJO+2D
	nx56BrLAtgSVuVj/wUtH4lZinohg4u99V8nTX9opVfRZdncG1eb/VHr3Sk8SrWUD+mb5QxAQPTAcT
	gaBEdJ/oMbh6ZLfYGnHSoyNwI2bs+NJyUYzYyKPKhSef+uhShv6YB2B8fuW25qsWz8P8Slu+9SyRl
	SJPImgAJf3JU/TKX5f9auWzO4E0slAa+GtagAy+wDxsnWSbQpdQhz3uaphuT1Xj05YBWQtyj7DRZv
	3/oB8lbFR/21Q4AvwkC3VZTtWeL/3LpxLiS6dvi3Hs86Tzsozeu98O7vfvBO/vQ0HME9yCCEAPlmy
	Mznmvflw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uobB3-0000000COAb-0RuV;
	Wed, 20 Aug 2025 05:16:01 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uobB0-0000000CO9o-2WhE
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Aug 2025 05:15:59 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-70a9282f475so51574676d6.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Aug 2025 22:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755666957; x=1756271757; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMOc0zAG5IHElycDwN0z3G1Bp9v6la9CFRr7DqTKuhw=;
        b=BgFAd2eeskb+9tcLHzkpfeC8h8TDyqM3jRbLEvPVYtgDgdZDcL9fH95rVUrKzVXLuE
         rBepMeFGL2XA5iz/FR3APn4M0XUMmMt/A8a7cZZ2CbjJG/vu02L7+iD0IJvz3NJhfJTS
         oUCVqq9S9Jez5SXdDQhqcYhKAdVnfyqEdVji4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755666957; x=1756271757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMOc0zAG5IHElycDwN0z3G1Bp9v6la9CFRr7DqTKuhw=;
        b=S59AKX4JXjrlF3QbN2mdkMMd6Gudi1u1buZMiiKUXxAjz3HLTNis/sULlcaUXHch3W
         WPMMh5TpwYDq8MAfJlx8vTm4ncivTHNMIIo+nkmh0aTamtZMZIyuizr9OyJoq5SFcxWM
         ys952mMRb3iXW8xyQ45q6sHTODUMJ2jk5uiafopO1jXiLCnUcmzC32OpbuRcCum1wHZq
         UKyF/UnM995WOHVnhSgaFx+p+nebByB2LI7qKyIiZy7jw1x1sMTInBv6QgWvSk4XxQ5+
         pv6mE5NVJVbffvnH1IJkMzGPCH3jfes2S6W0VIKnq+3sh73NbCmLZtZHGwqrt6vwIECX
         pqzA==
X-Forwarded-Encrypted: i=1; AJvYcCUXbqnhvFX9UvmlRw3O9IAfzqPvkKB/LGTCCFASIqa/sEStF0JGhOV20N4ckSpjLOq060qT5kAUo1Qe5IbIWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE45c7dFzRViGKROdZPnfZ8RtykmI23OEnjjDq7LSxT6DdV6Xl
	6dDyzTreY9XJwP+yoVmq4Celg9Y1KhWFVZuybBWFiCpF6R3c4CsGB6woK0XUkC4Juz7qutxA1ey
	UZIfwcw==
X-Gm-Gg: ASbGncs5W26iZSqTcxQNiyAMWf5YxwZMXj6gBby34umEygVMk4Jyg6WEv0zwQHL41UZ
	R4o0mBFhYDyXgpDfQSLYWdNDs257HZA1VxsMBmriLowrN7sYhghikIEW9I7nvqD3TxIp19uSRwP
	5VqY+PV0csnM/l6ikhCK7/dHOWWrlawLRXI6UrBQA3SSXwvF6WFSlp0KZ2bRVllN8Psb867Osv0
	qQ8bOuVVO5uqLRjCobtvEe5j2l7i7vUB1jkF7Rwsf0pZowZar+PY1WEHbNpvcDv87zDegXrOPqx
	olQMHHzP9v1j1RSL2FBVU4io59YkJZsYORfWNPOc4WiXTUCh5niO0sLvIOsm09OOCvyDOmNcCoD
	YQX3P14YXNCBNz5KXISWWsHtIz5gD2Gs1H6DZMltYRuH4mLO6UnXBX+q+FyEhtQ==
X-Google-Smtp-Source: AGHT+IGAstHSfqVbW/qjoNdyc1/TXIRqPSOyEk2Qdbnn7rPrcunjgnYo2NTQ1H8Gh5hAVng1HYKUEw==
X-Received: by 2002:a05:6214:2b09:b0:707:71d9:d6de with SMTP id 6a1803df08f44-70d770b89cbmr14387996d6.36.1755666956491;
        Tue, 19 Aug 2025 22:15:56 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70bb34e3fa9sm62465366d6.22.2025.08.19.22.15.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 22:15:54 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b0bf08551cso140491cf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Aug 2025 22:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhVcRM7fMpwPE3LRYgRKpqlxvfkzu0CmLLUik+dI88cCRkO3u6xVkem/4fLs0kcScGp1hn5v/wSFWLca+xIw==@lists.infradead.org
X-Received: by 2002:ac8:7d0c:0:b0:4a6:f525:e35a with SMTP id
 d75a77b69052e-4b292f95907mr2439661cf.9.1755666954079; Tue, 19 Aug 2025
 22:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250814083144.191554-1-wenst@chromium.org> <CAC=S1nhz_ESY4VrgWs=dVinLtdOamh6to3EgD1w1Kx=4YBOD9A@mail.gmail.com>
 <CAGXv+5Hke6aEYdyc096_aeS9KHiOzcNqirB-rFT2odepaYhayQ@mail.gmail.com> <CAC=S1nheT46K+jkmtq4EJxOVO=nwasan0LCJwv-HTEK6P6DgxA@mail.gmail.com>
In-Reply-To: <CAC=S1nheT46K+jkmtq4EJxOVO=nwasan0LCJwv-HTEK6P6DgxA@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 20 Aug 2025 14:15:35 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CRZaCvaw5fQxgWBgBjnK6Y05p6kHJ2hrHGtLY47Ymsog@mail.gmail.com>
X-Gm-Features: Ac12FXy8CAi4s4o72NAJVVqc3RW7R9QsaD5heHRhqLT1YoNyBEvsC2eFaSQEZVc
Message-ID: <CAAFQd5CRZaCvaw5fQxgWBgBjnK6Y05p6kHJ2hrHGtLY47Ymsog@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Fei Shao <fshao@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_221558_675580_D288A62B 
X-CRM114-Status: GOOD (  33.60  )
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

On Thu, Aug 14, 2025 at 6:52=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Thu, Aug 14, 2025 at 5:06=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Thu, Aug 14, 2025 at 4:59=E2=80=AFPM Fei Shao <fshao@chromium.org> w=
rote:
> > >
> > > On Thu, Aug 14, 2025 at 4:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> > > >
> > > > Previously a mutex was added to protect the encoder and decoder con=
text
> > > > lists from unexpected changes originating from the SCP IP block, ca=
using
> > > > the context pointer to go invalid, resulting in a NULL pointer
> > > > dereference in the IPI handler.
> > > >
> > > > Turns out on the MT8173, the VPU IPI handler is called from hard IR=
Q
> > > > context. This causes a big warning from the scheduler. This was fir=
st
> > > > reported downstream on the ChromeOS kernels, but is also reproducib=
le
> > > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even th=
ough
> > > > the actual capture format is not supported, the affected code paths
> > > > are triggered.
> > > >
> > > > Since this lock just protects the context list and operations on it=
 are
> > > > very fast, it should be OK to switch to a spinlock.
> > > >
> > > > Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to prote=
ct decoder context list")
> > > > Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to prote=
ct encoder context list")
> > > > Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > ---
> > > >  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++--=
--
> > > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-=
----
> > > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
> > > >  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  4 ++--
> > > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-=
----
> > > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
> > > >  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  4 ++--
> > > >  7 files changed, 26 insertions(+), 20 deletions(-)
> > > >
> > >
> > > [...]
> > >
> > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vp=
u_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > index 145958206e38..e9b5cac9c63b 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > @@ -77,14 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vc=
odec_dec_dev *dec_dev, struct vde
> > > >         struct mtk_vcodec_dec_ctx *ctx;
> > > >         int ret =3D false;
> > > >
> > > > -       mutex_lock(&dec_dev->dev_ctx_lock);
> > > > +       spin_lock(&dec_dev->dev_ctx_lock);
> > >
> > > Do you mean spin_lock_irqsave()?
> >
> > This function is only called from the handler below (outside the diff
> > context), which itself is called from hard IRQ context. This is mention=
ed
> > in the comment above the handler.
>
> I see. I only searched here but didn't check the full source.
> Leaving a comment would be clearer if a revision is made, but it's not
> worth resending just for that alone.

Hmm, I feel like this could make it easy to introduce further locking
bugs in the future, because someone may just decide to call this
function from a different context. Also having the _irqsave variants
consistently used for the lock make it clear that it's used to
synchronize with an IRQ handler regardless of which place in the code
one looks at.

My recommendation would be to still amend the patch to do that.

>
> Reviewed-by: Fei Shao <fshao@chromium.org>
>
>
> On Thu, Aug 14, 2025 at 5:06=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > On Thu, Aug 14, 2025 at 4:59=E2=80=AFPM Fei Shao <fshao@chromium.org> w=
rote:
> > >
> > > On Thu, Aug 14, 2025 at 4:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.=
org> wrote:
> > > >
> > > > Previously a mutex was added to protect the encoder and decoder con=
text
> > > > lists from unexpected changes originating from the SCP IP block, ca=
using
> > > > the context pointer to go invalid, resulting in a NULL pointer
> > > > dereference in the IPI handler.
> > > >
> > > > Turns out on the MT8173, the VPU IPI handler is called from hard IR=
Q
> > > > context. This causes a big warning from the scheduler. This was fir=
st
> > > > reported downstream on the ChromeOS kernels, but is also reproducib=
le
> > > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even th=
ough
> > > > the actual capture format is not supported, the affected code paths
> > > > are triggered.
> > > >
> > > > Since this lock just protects the context list and operations on it=
 are
> > > > very fast, it should be OK to switch to a spinlock.
> > > >
> > > > Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to prote=
ct decoder context list")
> > > > Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to prote=
ct encoder context list")
> > > > Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > ---
> > > >  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++--=
--
> > > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++-=
----
> > > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
> > > >  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  4 ++--
> > > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++-=
----
> > > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
> > > >  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  4 ++--
> > > >  7 files changed, 26 insertions(+), 20 deletions(-)
> > > >
> > >
> > > [...]
> > >
> > > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vp=
u_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > index 145958206e38..e9b5cac9c63b 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > > @@ -77,14 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vc=
odec_dec_dev *dec_dev, struct vde
> > > >         struct mtk_vcodec_dec_ctx *ctx;
> > > >         int ret =3D false;
> > > >
> > > > -       mutex_lock(&dec_dev->dev_ctx_lock);
> > > > +       spin_lock(&dec_dev->dev_ctx_lock);
> > >
> > > Do you mean spin_lock_irqsave()?
> >
> > This function is only called from the handler below (outside the diff
> > context), which itself is called from hard IRQ context. This is mention=
ed
> > in the comment above the handler.
> >
> > > >         list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
> > > >                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vp=
u) {
> > > >                         ret =3D true;
> > > >                         break;
> > > >                 }
> > > >         }
> > > > -       mutex_unlock(&dec_dev->dev_ctx_lock);
> > > > +       spin_unlock(&dec_dev->dev_ctx_lock);
> > > >
> > > >         return ret;
> > > >  }
> > >
> > > [...]
> > >
> > > > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vp=
u_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > > index 51bb7ee141b9..79a91283da78 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > > @@ -47,14 +47,14 @@ static bool vpu_enc_check_ap_inst(struct mtk_vc=
odec_enc_dev *enc_dev, struct ven
> > > >         struct mtk_vcodec_enc_ctx *ctx;
> > > >         int ret =3D false;
> > > >
> > > > -       mutex_lock(&enc_dev->dev_ctx_lock);
> > > > +       spin_lock(&enc_dev->dev_ctx_lock);
> > >
> > > Also here.
> >
> > Same reasoning applies here as well.
> >
> > ChenYu
> >
> > > Regards,
> > > Fei
> > >
> > > >         list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
> > > >                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vp=
u) {
> > > >                         ret =3D true;
> > > >                         break;
> > > >                 }
> > > >         }
> > > > -       mutex_unlock(&enc_dev->dev_ctx_lock);
> > > > +       spin_unlock(&enc_dev->dev_ctx_lock);
> > > >
> > > >         return ret;
> > > >  }
> > > > --
> > > > 2.51.0.rc1.163.g2494970778-goog
> > > >
> > > >
>

