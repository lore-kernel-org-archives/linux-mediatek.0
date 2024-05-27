Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6884CC25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 04:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gJOhzmspBkrZuLKBoP0mmK3YHQ3TyvOptzZlj6zm9s=; b=qD78fxYNpvTuoKrMNrfZaqwhCf
	53hMoPfIJbFFXe+cjXTAPS0UC44hoCVSe7vOq8kybaVejKPxRD2uUmqaehd5snnbYKb5asih/u/2N
	CKKd0lY6bFa1sXezKE50+EeV4uQGaTAt6+M4TpPlyXTZuuMb9ZKdV6b0N0MXF81mV2eO0SjohGG69
	7Nx3rt5wKJfLRzXZQAMgks96M7DKyoZH3toPdVwuS/FUjucH55DeFD48gJEKlLg/ir031rsy73Apj
	wqPqZzvlURxb2LZl3McaHC/GGDPkVNTtoANsTNwzxQ5z4EG9+Q2G1K2xauoBzOG9FANX65t2gfKSu
	tpGKtdpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBSNs-0000000Dn1v-3fDS;
	Mon, 27 May 2024 04:54:56 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBSNp-0000000Dn0z-3JAf
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 04:54:55 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-48a39b54e22so706152137.3
        for <linux-mediatek@lists.infradead.org>; Sun, 26 May 2024 21:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716785689; x=1717390489; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gJOhzmspBkrZuLKBoP0mmK3YHQ3TyvOptzZlj6zm9s=;
        b=gc4a74bdgUe6zykptD7vnL8fT2Jy8NqfdhPMuzeNsDWjobNIbtw7N2noxI4Q5pjE1A
         HrT7m+GgYQw+BTBgV5+DymS62gx/wns/4esiag4TUnLs0cA9maj37uFenUTryJUxKBtj
         WaBHMrUzVgga0JkSB0AUiCTPIHqq7d2wGCDL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716785689; x=1717390489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gJOhzmspBkrZuLKBoP0mmK3YHQ3TyvOptzZlj6zm9s=;
        b=eqEz15zTfeMeZHvlYhyv+GEWGa7kbD4PMGfVTozFO7E5sVmPpIdfHpmQzFfxT2MAbj
         33XNZq5Mfnq/AEG51pUW2iruf8APcmoHo/OfrAPK9j5M6ryT+ITgvxLLv1SMOsudINj/
         1u7DELgxlOVxgiQLRXvRsI6M6lfw4Tv5al8DNizOeB/o6nPSfiOiPm8Fb5aYALvvjrch
         AU31cGawIiMGtwCl3Y66Y0IqlYxa60UrROkXUxQBl/WROfEd6eRfbB35YDrwdiYpy1dc
         eDOQ/uTPP+qUO8VWVqP7Q+LH5QGyicj/fq6mAzTnCcR/APNxuR4feb/KxvvTSe/NI0nb
         tcWA==
X-Forwarded-Encrypted: i=1; AJvYcCWnJ1aEPq0liWc9xLXzLKMxZXa3QO9mfUqe21ScU4jazZ4tjjSow1TYNss0V54yLHT6AGbNkBvFKpjCSzin+UBKSEY+9mxZSdWZSmCexWcwICsc
X-Gm-Message-State: AOJu0YyJahwl3IjdjFqRNxqTXGxTD6Gr+m2GRGFxtIBX9YG5fTQa8F6m
	tupx7yeDdxQPaj0QxcsKc/yMOQ2KksQ/L0BaOA9gXUxAtutcIpy8ElxEzixBgX76v3ycXdVF4vt
	o2w==
X-Google-Smtp-Source: AGHT+IEhtOQAAZ+NmlbLN1VO7O8XWjyQK1EJDp2xddNWASCs0EDONZXvsE7X8eheVGakBnMkkf+Bug==
X-Received: by 2002:a67:ed42:0:b0:48a:370c:deb6 with SMTP id ada2fe7eead31-48a385138b3mr7341990137.6.1716785689041;
        Sun, 26 May 2024 21:54:49 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-804cc04ad04sm949098241.23.2024.05.26.21.54.48
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 May 2024 21:54:48 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-804e8616951so434850241.3
        for <linux-mediatek@lists.infradead.org>; Sun, 26 May 2024 21:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNHHPqhvh/FcavGrDAvOUzqlAE/wnjFA1OHEKj/YFR1jKfgsfcNYbOAM0n9BOcGR9HONcc2o+REEScR1AEjym6GQzR/JH8zfFlVC4AmPdFphRI
X-Received: by 2002:a67:f88d:0:b0:48a:33af:3ba with SMTP id
 ada2fe7eead31-48a386b3a53mr7310666137.31.1716785688017; Sun, 26 May 2024
 21:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-6-shawn.sung@mediatek.com> <CAC=S1ngUh-o107YM8zEu-ebaP7+eaO1x6SsZ6OeRxrH5YgFKxw@mail.gmail.com>
 <CAGb2v67TZSoQnEMhUNKhnbkwK2=9yCPcwnLD-iHuRp6=Y2ez2Q@mail.gmail.com>
In-Reply-To: <CAGb2v67TZSoQnEMhUNKhnbkwK2=9yCPcwnLD-iHuRp6=Y2ez2Q@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 27 May 2024 12:54:10 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhKPo5BUYJ_cHGz3OoPrWNh5eO8rhdyikLimsqSOrZ5Xg@mail.gmail.com>
Message-ID: <CAC=S1nhKPo5BUYJ_cHGz3OoPrWNh5eO8rhdyikLimsqSOrZ5Xg@mail.gmail.com>
Subject: Re: [PATCH v7 05/18] drm/mediatek: Set DRM mode configs accordingly
To: wens@kernel.org
Cc: Shawn Sung <shawn.sung@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	"Nancy . Lin" <nancy.lin@mediatek.com>, Sean Paul <sean@poorly.run>, 
	Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_215453_901371_7C700EF0 
X-CRM114-Status: GOOD (  38.31  )
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

On Mon, May 27, 2024 at 12:38=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Mon, May 27, 2024 at 12:34=E2=80=AFPM Fei Shao <fshao@chromium.org> wr=
ote:
> >
> > Hi Shawn,
> >
> > On Thu, May 2, 2024 at 6:39=E2=80=AFPM Shawn Sung <shawn.sung@mediatek.=
com> wrote:
> > >
> > > From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > >
> > > Set DRM mode configs limitation according to the hardware capabilitie=
s
> > > and pass the IGT checks as below:
> > >
> > > - The test "graphics.IgtKms.kms_plane" requires a frame buffer with
> > >   width of 4512 pixels (> 4096).
> > > - The test "graphics.IgtKms.kms_cursor_crc" checks if the cursor size=
 is
> > >   defined, and run the test with cursor size from 1x1 to 512x512.
> > >
> > > Please notice that the test conditions may change as IGT is updated.
> > >
> > > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 22 ++++++++++++++++++++++
> > >  drivers/gpu/drm/mediatek/mtk_drm_drv.h |  4 ++++
> > >  2 files changed, 26 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm=
/mediatek/mtk_drm_drv.c
> > > index 8e047043202b4..c9cad3a827376 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > @@ -294,6 +294,9 @@ static const struct mtk_mmsys_driver_data mt8188_=
vdosys0_driver_data =3D {
> > >         .conn_routes =3D mt8188_mtk_ddp_main_routes,
> > >         .num_conn_routes =3D ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
> > >         .mmsys_dev_num =3D 2,
> > > +       .max_width =3D 8191,
> > > +       .min_width =3D 1,
> > > +       .min_height =3D 1,
> > >  };
> > >
> > >  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data =
=3D {
> > > @@ -308,6 +311,9 @@ static const struct mtk_mmsys_driver_data mt8195_=
vdosys0_driver_data =3D {
> > >         .main_path =3D mt8195_mtk_ddp_main,
> > >         .main_len =3D ARRAY_SIZE(mt8195_mtk_ddp_main),
> > >         .mmsys_dev_num =3D 2,
> > > +       .max_width =3D 8191,
> > > +       .min_width =3D 1,
> > > +       .min_height =3D 1,
> > >  };
> > >
> > >  static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data=
 =3D {
> > > @@ -315,6 +321,9 @@ static const struct mtk_mmsys_driver_data mt8195_=
vdosys1_driver_data =3D {
> > >         .ext_len =3D ARRAY_SIZE(mt8195_mtk_ddp_ext),
> > >         .mmsys_id =3D 1,
> > >         .mmsys_dev_num =3D 2,
> > > +       .max_width =3D 8191,
> > > +       .min_width =3D 2, /* 2-pixel align when ethdr is bypassed */
> > > +       .min_height =3D 1,
> > >  };
> > >
> > >  static const struct of_device_id mtk_drm_of_ids[] =3D {
> > > @@ -493,6 +502,15 @@ static int mtk_drm_kms_init(struct drm_device *d=
rm)
> > >                 for (j =3D 0; j < private->data->mmsys_dev_num; j++) =
{
> > >                         priv_n =3D private->all_drm_private[j];
> > >
> > > +                       if (priv_n->data->max_width)
> > > +                               drm->mode_config.max_width =3D priv_n=
->data->max_width;
> > > +
> > > +                       if (priv_n->data->min_width)
> > > +                               drm->mode_config.min_width =3D priv_n=
->data->min_width;
> > > +
> > > +                       if (priv_n->data->min_height)
> > > +                               drm->mode_config.min_height =3D priv_=
n->data->min_height;
> > > +
> > >                         if (i =3D=3D CRTC_MAIN && priv_n->data->main_=
len) {
> > >                                 ret =3D mtk_crtc_create(drm, priv_n->=
data->main_path,
> > >                                                       priv_n->data->m=
ain_len, j,
> > > @@ -520,6 +538,10 @@ static int mtk_drm_kms_init(struct drm_device *d=
rm)
> > >                 }
> > >         }
> > >
> > > +       /* IGT will check if the cursor size is configured */
> > > +       drm->mode_config.cursor_width =3D drm->mode_config.max_width;
> > > +       drm->mode_config.cursor_height =3D drm->mode_config.max_heigh=
t;
> >
> > I think you shouldn't set the cursor size to the maximum plane size.
> > As you mentioned in the commit message, IGT tests the cursor sizes
> > from 1x1 to 512x512, so just setting them to 512 (with a macro) should
> > be enough.
> >
> > Currently this tells the userspace "the supported cursor plane size is
> > up to 4096x8191" on MT8195 and MT8188.
> > That means the userspace may allocate a buffer with 4096*8191*4 ~=3D
> > 128MB for the cursor plane in the worst case, and most of the buffer
> > will be wasted.
> > Note that the default value for DRM_CAP_CURSOR_WIDTH is 64.
> >
> > In practice, when applying this on the MT8188 Chromebook, I see the
> > userspace allocates two 64MB buffers for the cursor plane.
> > But if I limit the cursor size to 512, the userspace only allocates
> > two 1MB buffers i.e. 126MB is optimized for the DMA buffer allocation.
>
> That seems more like an issue of ChromeOS not doing the most optimal
> thing though?

I agree that we need to fix this on the ChromeOS side too, but I still
think the driver doesn't need to set the capabilities like this
because a full-screen size cursor is not practical anyway.
The default cursor plane size is just 64x64.

Regard,
Fei



>
> > Regards,
> > Fei
> >
> >
> > >
> > > +
> > >         /* Use OVL device for all DMA memory allocations */
> > >         crtc =3D drm_crtc_from_index(drm, 0);
> > >         if (crtc)
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm=
/mediatek/mtk_drm_drv.h
> > > index 78d698ede1bf8..6cfa790e8df5c 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > > @@ -46,6 +46,10 @@ struct mtk_mmsys_driver_data {
> > >         bool shadow_register;
> > >         unsigned int mmsys_id;
> > >         unsigned int mmsys_dev_num;
> > > +
> > > +       int max_width;
> > > +       int min_width;
> > > +       int min_height;
> > >  };
> > >
> > >  struct mtk_drm_private {
> > > --
> > > 2.18.0
> > >

