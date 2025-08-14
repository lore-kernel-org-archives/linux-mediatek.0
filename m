Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EEECA0EE4
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiDCfbM3bTCVcLsZuPU1JDs4qEWT1BpZ2ztHAIDrKGI=; b=C/zlBmu0j25a3hoXu1Bzefyhb1
	OJdhJQT52mJVMSdvBrpCdGNLjojnH9QFRBW32NvC2VjSw5rHDpqEKZf2FstBO/bLmpIC830WG36IM
	jf/9p9qGPD6b0Z5VI9bfxmd5A+QhzSfdQIpEwD7NqGz24fJopErhCE+um0mVcRmW/2oZTjqn4KG0X
	XNgMbnNv2FJS46iJUiBdjv3o3VzlTLiUBC4zDQWp6c6ROxe7xOsFqbkrL1ztkixtd1PHOdi0uY7PE
	UHZhLVxR/mkbFVZzysRUnHDxNvlfDa3zFPtkvdhq85iFnAE7XDpw0b+reQvxI/p7o3bXg8vk/SnNb
	+vAh0+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXn1-0000000GxXp-0dyY;
	Thu, 14 Aug 2025 13:14:43 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUYl-0000000GU1l-2zTP
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Aug 2025 09:47:48 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-50f88ed81c8so529178137.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 02:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755164866; x=1755769666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiDCfbM3bTCVcLsZuPU1JDs4qEWT1BpZ2ztHAIDrKGI=;
        b=clYiMIGSLroQNMz5htX73jBcquYTYMDwLfnZej0XFuKRfrEDdby9xb0RZGt2tGI4Tj
         BkPjTfGTzjmSY57TX/NFVTVv7NFK/9uJ2/enNoZIUEGjvBJwEz1q0o2+FsouFOuccyry
         +xzL1PijzjzDBdcVAK7oT/G5Xwvx/ptuUeJfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755164866; x=1755769666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiDCfbM3bTCVcLsZuPU1JDs4qEWT1BpZ2ztHAIDrKGI=;
        b=ohaf8fdidJOmD1uQFS1pYqlVPFGczGIjsEiJ9bW/97a46mVHWSgjxZvInz95XJ47Er
         /ISgrtUwYm0q8oawdrvYD8dNbLGVjLfxjQWzd3FlQW634JU0JH4ln4Z4Jm4XnmtRf0VW
         BXOtFu3VOEeZu3e+lCEe+PKrQL8ktgNqB6Ei6bvhU/an2js15MQw9mjc2WzJd313XDJz
         QdmElJffXVRPToKxOsT/uRK/GiPeVOxRECT1glx1sltsKL7GMQgwDO1uOOru5dZFOLh4
         EIM2WfADpXz6+5pG4gkL373Ae0chbolKdVXHxRneUNyNv+fMJZk3w2RAEXAGAOrL+He1
         ytNg==
X-Forwarded-Encrypted: i=1; AJvYcCXerzaZaR1/x3q+h9GIXw7BoG3/MbN+MOkW73qThXEvcmpZNEGke7BGghM4XX2dSUik2r2Uq7mUHCnkQsqYhw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyc0170HMb+wv8XilFFkzVYlzX6hyWx+l1hWLHsxpFnFNRBoj4
	n1A7PLkbvt7lz79OK2xSwF/ERZYd7Fwq1xHDdsbKp6V/7pcDfn+s2MC06GPLDhGlSFf/h3bs539
	h4dA=
X-Gm-Gg: ASbGnctrL18yx+jzwDmb7zmy4T6Xa4p+/t2geqeoWGuW6620zqhNhgK1T5N4k92PgKF
	qKeSVTSMbKlIQy0nScCyHLbDjvYbUEnBg7PNr+2r7mfCFFfaIMEkmr2BBPK4YKDkM7nHpJHHVbo
	6X/f/R14XNnr6wNGwiGlbF9cR/t6RohzcdwRmg5BetU0wamE0QVtaboWDEfdbcsDe8eQpEqkb/Z
	60U3xsAfvjlxFmDUlAPFrQGuWuSrcc+HtPRnjPPjbtGnPxiogboW3AFTAJuRDE0V+iPC3UfUAeP
	y5X30EjEiy3jE6j6PvIw2Z5gEALrU5aUtJNEXymKwiZDspK6mkOYLWlxzIDHno0AL7dYywLdoPf
	eiHzW0VrJ2Ng4KOaV6a8wdkEca5M5ZyaTY1ppKyNBPWTEPKQkaj3O+6SK1uP4ors/Gvd+Z4vk
X-Google-Smtp-Source: AGHT+IFR0WIhq+ImWfRTmevgZwNj4lhv9G5AZ1lJd/gy4I/n00mS2VmBojMjfs+Xlw2Jrk/0Tl92Ng==
X-Received: by 2002:a05:6102:dc6:b0:4f7:ac0e:9e91 with SMTP id ada2fe7eead31-50fea4b4e45mr803508137.15.1755164866249;
        Thu, 14 Aug 2025 02:47:46 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-50629bdd28asm3086512137.8.2025.08.14.02.47.45
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 02:47:45 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-53b1719b717so679654e0c.0
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 02:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCWK5tpQx/gPVPok2f9BupFnmPRdscXvg50t4HFVEdHU6o1O/WzXwSl6yteBypCIYfSPYz5ILO1t7o9KBeEw==@lists.infradead.org
X-Received: by 2002:a05:6122:82a3:b0:538:dbc9:17a6 with SMTP id
 71dfb90a1353d-53b189eb471mr820629e0c.4.1755164864462; Thu, 14 Aug 2025
 02:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250814083144.191554-1-wenst@chromium.org> <CAC=S1nhz_ESY4VrgWs=dVinLtdOamh6to3EgD1w1Kx=4YBOD9A@mail.gmail.com>
 <CAGXv+5Hke6aEYdyc096_aeS9KHiOzcNqirB-rFT2odepaYhayQ@mail.gmail.com>
In-Reply-To: <CAGXv+5Hke6aEYdyc096_aeS9KHiOzcNqirB-rFT2odepaYhayQ@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 14 Aug 2025 17:47:08 +0800
X-Gmail-Original-Message-ID: <CAC=S1nheT46K+jkmtq4EJxOVO=nwasan0LCJwv-HTEK6P6DgxA@mail.gmail.com>
X-Gm-Features: Ac12FXzvFfMabP6kQ3r7qgde36ENXvfds4n3oOTocQXTQlh5-zck0_vwf1VSQ1c
Message-ID: <CAC=S1nheT46K+jkmtq4EJxOVO=nwasan0LCJwv-HTEK6P6DgxA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Use spinlock for context list
 protection lock
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_024747_755389_74F20097 
X-CRM114-Status: GOOD (  27.66  )
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

On Thu, Aug 14, 2025 at 5:06=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, Aug 14, 2025 at 4:59=E2=80=AFPM Fei Shao <fshao@chromium.org> wro=
te:
> >
> > On Thu, Aug 14, 2025 at 4:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > Previously a mutex was added to protect the encoder and decoder conte=
xt
> > > lists from unexpected changes originating from the SCP IP block, caus=
ing
> > > the context pointer to go invalid, resulting in a NULL pointer
> > > dereference in the IPI handler.
> > >
> > > Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> > > context. This causes a big warning from the scheduler. This was first
> > > reported downstream on the ChromeOS kernels, but is also reproducible
> > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even thou=
gh
> > > the actual capture format is not supported, the affected code paths
> > > are triggered.
> > >
> > > Since this lock just protects the context list and operations on it a=
re
> > > very fast, it should be OK to switch to a spinlock.
> > >
> > > Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect=
 decoder context list")
> > > Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect=
 encoder context list")
> > > Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
> > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++---=
--
> > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
> > >  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  4 ++--
> > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++---=
--
> > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
> > >  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  4 ++--
> > >  7 files changed, 26 insertions(+), 20 deletions(-)
> > >
> >
> > [...]
> >
> > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_=
if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > index 145958206e38..e9b5cac9c63b 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > @@ -77,14 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcod=
ec_dec_dev *dec_dev, struct vde
> > >         struct mtk_vcodec_dec_ctx *ctx;
> > >         int ret =3D false;
> > >
> > > -       mutex_lock(&dec_dev->dev_ctx_lock);
> > > +       spin_lock(&dec_dev->dev_ctx_lock);
> >
> > Do you mean spin_lock_irqsave()?
>
> This function is only called from the handler below (outside the diff
> context), which itself is called from hard IRQ context. This is mentioned
> in the comment above the handler.

I see. I only searched here but didn't check the full source.
Leaving a comment would be clearer if a revision is made, but it's not
worth resending just for that alone.

Reviewed-by: Fei Shao <fshao@chromium.org>


On Thu, Aug 14, 2025 at 5:06=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, Aug 14, 2025 at 4:59=E2=80=AFPM Fei Shao <fshao@chromium.org> wro=
te:
> >
> > On Thu, Aug 14, 2025 at 4:38=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.or=
g> wrote:
> > >
> > > Previously a mutex was added to protect the encoder and decoder conte=
xt
> > > lists from unexpected changes originating from the SCP IP block, caus=
ing
> > > the context pointer to go invalid, resulting in a NULL pointer
> > > dereference in the IPI handler.
> > >
> > > Turns out on the MT8173, the VPU IPI handler is called from hard IRQ
> > > context. This causes a big warning from the scheduler. This was first
> > > reported downstream on the ChromeOS kernels, but is also reproducible
> > > on mainline using Fluster with the FFmpeg v4l2m2m decoders. Even thou=
gh
> > > the actual capture format is not supported, the affected code paths
> > > are triggered.
> > >
> > > Since this lock just protects the context list and operations on it a=
re
> > > very fast, it should be OK to switch to a spinlock.
> > >
> > > Fixes: 6467cda18c9f ("media: mediatek: vcodec: adding lock to protect=
 decoder context list")
> > > Fixes: afaaf3a0f647 ("media: mediatek: vcodec: adding lock to protect=
 encoder context list")
> > > Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c       | 10 ++++++----
> > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c     | 12 +++++++---=
--
> > >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h     |  2 +-
> > >  .../platform/mediatek/vcodec/decoder/vdec_vpu_if.c   |  4 ++--
> > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c     | 12 +++++++---=
--
> > >  .../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h     |  2 +-
> > >  .../platform/mediatek/vcodec/encoder/venc_vpu_if.c   |  4 ++--
> > >  7 files changed, 26 insertions(+), 20 deletions(-)
> > >
> >
> > [...]
> >
> > > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_=
if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > index 145958206e38..e9b5cac9c63b 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > > @@ -77,14 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcod=
ec_dec_dev *dec_dev, struct vde
> > >         struct mtk_vcodec_dec_ctx *ctx;
> > >         int ret =3D false;
> > >
> > > -       mutex_lock(&dec_dev->dev_ctx_lock);
> > > +       spin_lock(&dec_dev->dev_ctx_lock);
> >
> > Do you mean spin_lock_irqsave()?
>
> This function is only called from the handler below (outside the diff
> context), which itself is called from hard IRQ context. This is mentioned
> in the comment above the handler.
>
> > >         list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
> > >                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu)=
 {
> > >                         ret =3D true;
> > >                         break;
> > >                 }
> > >         }
> > > -       mutex_unlock(&dec_dev->dev_ctx_lock);
> > > +       spin_unlock(&dec_dev->dev_ctx_lock);
> > >
> > >         return ret;
> > >  }
> >
> > [...]
> >
> > > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_=
if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > index 51bb7ee141b9..79a91283da78 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > > @@ -47,14 +47,14 @@ static bool vpu_enc_check_ap_inst(struct mtk_vcod=
ec_enc_dev *enc_dev, struct ven
> > >         struct mtk_vcodec_enc_ctx *ctx;
> > >         int ret =3D false;
> > >
> > > -       mutex_lock(&enc_dev->dev_ctx_lock);
> > > +       spin_lock(&enc_dev->dev_ctx_lock);
> >
> > Also here.
>
> Same reasoning applies here as well.
>
> ChenYu
>
> > Regards,
> > Fei
> >
> > >         list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
> > >                 if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu)=
 {
> > >                         ret =3D true;
> > >                         break;
> > >                 }
> > >         }
> > > -       mutex_unlock(&enc_dev->dev_ctx_lock);
> > > +       spin_unlock(&enc_dev->dev_ctx_lock);
> > >
> > >         return ret;
> > >  }
> > > --
> > > 2.51.0.rc1.163.g2494970778-goog
> > >
> > >

