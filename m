Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDFCC25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 05:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HS/q+5B/lHN3GpC5brMPX120YuCJjay08ll9bVANbnw=; b=IYHQrauA2A7p/+29FcYnWIcWLv
	EHQo+p5eUzwSE/xod8ZJOZAFfHSr9GUHTMK1gwe9Lw68gHXbIGLthUQpFCTe0Mm+oa+P3Pme8zU33
	98/F4+e5G1ELqqi6wAv2Cled5f4PCXzcpQYWup1aMTjPLRP51QUhJ1mfwb6hMaufi2F6zj3c1CjtZ
	UFAF3VtVAps0y19POxE7xlibIqKz0qCXQfto1HnsNgEUa46BO0c8mbUunxHUnar1bXqPVAavNegF6
	eRCk6rN8+7BB+QOdpCFhHXhtBI14VaZEA1p01AzH9VSmjrP4+y9roKmXyRCUM51Gv6ChS7fZ0h1TA
	uloL+pUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBSua-0000000Dqa5-1jBt;
	Mon, 27 May 2024 05:28:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBSuW-0000000DqX3-2YEC
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 05:28:42 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52449b7aa2bso8162840e87.3
        for <linux-mediatek@lists.infradead.org>; Sun, 26 May 2024 22:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716787717; x=1717392517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS/q+5B/lHN3GpC5brMPX120YuCJjay08ll9bVANbnw=;
        b=ni3ALgpVImxagDoPgOxd3Dtt5ytffeMy7GZzrdoUY5pMZ+070oWGLHc2xisr2p5eOo
         QijkkVdIINKP/Mz9GFY5c+ak+KTLjAtHJZwfCDcxy4u6ED0m7e1rj6LEsLaMzfQDxJUR
         UzpZwTWpzdqo5flo6GsDogLP6GI+yr4ji+cpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716787717; x=1717392517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS/q+5B/lHN3GpC5brMPX120YuCJjay08ll9bVANbnw=;
        b=wcm5OzAax9KXziTvQzPqUYIRswAPvtm06ieUx3a/H3tYcu2Eo9VbElefih8rQIktQR
         ak3lvFekuCd5dls14FxILCbZBRcdlAE054CcqVSl4bNGmBh/nzyL/lGuVQQCjxXCz+bC
         CtZGBlTPlyPQF6WpI+lQ9cY7MZj9FMpZax9FyFe3esuJ50rRalUiQ64VsdXqraHqGXyu
         Z1lAMGBkk/tm88UGlHk058yqJry/t81jddydzjinCVx8wUah8Wu0Sohz1qTbpQVm9glZ
         /LBezqKdnQchoTgyzQBjsfdnUdERRXFjv6qnCS6jtPJREwJXOz+7UnhhX31O7sULMTSd
         Wu0A==
X-Forwarded-Encrypted: i=1; AJvYcCU6CLY7068xm+l4NRMUwvYhvMginBK/ogjJMzhB3CCFpbOnYJezzAVSeXFZHlmRP+FB6EieCe8chbvnvnUb6eyBufSBMDzCeTga5x5hxV/aIdfn
X-Gm-Message-State: AOJu0YxVPdQW3dWr15eW+XJS2HtQIYnF5WuWO6QZpy46cfMsLqN1Il0r
	PhCZkw/JsAdb9jYUzEpir2urP13DWGqe9D5rlRAG+296d5nLnoBrb5ApuN4CibBA6Qfzb9Eyb+7
	IMnsow65QZq84LPcGd8wzb9GX4hP/N4D1SNdG
X-Google-Smtp-Source: AGHT+IEsHSmiiXQvoDBh4HgceuFqJ+anCd8E7q1lvKuF22p0eNxhQ85JLw6yLNL5oKFNhigmMgRwhIFYqARVxyb3t9I=
X-Received: by 2002:a05:6512:21c:b0:529:37be:ffad with SMTP id
 2adb3069b0e04-52966ca6460mr4315742e87.49.1716787716995; Sun, 26 May 2024
 22:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240502103848.5845-1-shawn.sung@mediatek.com>
 <20240502103848.5845-6-shawn.sung@mediatek.com> <CAC=S1ngUh-o107YM8zEu-ebaP7+eaO1x6SsZ6OeRxrH5YgFKxw@mail.gmail.com>
 <CAGb2v67TZSoQnEMhUNKhnbkwK2=9yCPcwnLD-iHuRp6=Y2ez2Q@mail.gmail.com> <CAC=S1nhKPo5BUYJ_cHGz3OoPrWNh5eO8rhdyikLimsqSOrZ5Xg@mail.gmail.com>
In-Reply-To: <CAC=S1nhKPo5BUYJ_cHGz3OoPrWNh5eO8rhdyikLimsqSOrZ5Xg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 May 2024 13:28:26 +0800
Message-ID: <CAGXv+5FbJ=LzV25=-tmm8zFGgecSSa2Zib7G-pUuYUK9ytyfsw@mail.gmail.com>
Subject: Re: [PATCH v7 05/18] drm/mediatek: Set DRM mode configs accordingly
To: Fei Shao <fshao@chromium.org>
Cc: wens@kernel.org, Shawn Sung <shawn.sung@mediatek.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
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
X-CRM114-CacheID: sfid-20240526_222840_744986_68F28285 
X-CRM114-Status: GOOD (  39.37  )
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

On Mon, May 27, 2024 at 12:54=E2=80=AFPM Fei Shao <fshao@chromium.org> wrot=
e:
>
> On Mon, May 27, 2024 at 12:38=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> w=
rote:
> >
> > On Mon, May 27, 2024 at 12:34=E2=80=AFPM Fei Shao <fshao@chromium.org> =
wrote:
> > >
> > > Hi Shawn,
> > >
> > > On Thu, May 2, 2024 at 6:39=E2=80=AFPM Shawn Sung <shawn.sung@mediate=
k.com> wrote:
> > > >
> > > > From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > > >
> > > > Set DRM mode configs limitation according to the hardware capabilit=
ies
> > > > and pass the IGT checks as below:
> > > >
> > > > - The test "graphics.IgtKms.kms_plane" requires a frame buffer with
> > > >   width of 4512 pixels (> 4096).
> > > > - The test "graphics.IgtKms.kms_cursor_crc" checks if the cursor si=
ze is
> > > >   defined, and run the test with cursor size from 1x1 to 512x512.
> > > >
> > > > Please notice that the test conditions may change as IGT is updated=
.
> > > >
> > > > Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> > > > ---
> > > >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 22 ++++++++++++++++++++++
> > > >  drivers/gpu/drm/mediatek/mtk_drm_drv.h |  4 ++++
> > > >  2 files changed, 26 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/d=
rm/mediatek/mtk_drm_drv.c
> > > > index 8e047043202b4..c9cad3a827376 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > > > @@ -294,6 +294,9 @@ static const struct mtk_mmsys_driver_data mt818=
8_vdosys0_driver_data =3D {
> > > >         .conn_routes =3D mt8188_mtk_ddp_main_routes,
> > > >         .num_conn_routes =3D ARRAY_SIZE(mt8188_mtk_ddp_main_routes)=
,
> > > >         .mmsys_dev_num =3D 2,
> > > > +       .max_width =3D 8191,
> > > > +       .min_width =3D 1,
> > > > +       .min_height =3D 1,
> > > >  };
> > > >
> > > >  static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data=
 =3D {
> > > > @@ -308,6 +311,9 @@ static const struct mtk_mmsys_driver_data mt819=
5_vdosys0_driver_data =3D {
> > > >         .main_path =3D mt8195_mtk_ddp_main,
> > > >         .main_len =3D ARRAY_SIZE(mt8195_mtk_ddp_main),
> > > >         .mmsys_dev_num =3D 2,
> > > > +       .max_width =3D 8191,
> > > > +       .min_width =3D 1,
> > > > +       .min_height =3D 1,
> > > >  };
> > > >
> > > >  static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_da=
ta =3D {
> > > > @@ -315,6 +321,9 @@ static const struct mtk_mmsys_driver_data mt819=
5_vdosys1_driver_data =3D {
> > > >         .ext_len =3D ARRAY_SIZE(mt8195_mtk_ddp_ext),
> > > >         .mmsys_id =3D 1,
> > > >         .mmsys_dev_num =3D 2,
> > > > +       .max_width =3D 8191,
> > > > +       .min_width =3D 2, /* 2-pixel align when ethdr is bypassed *=
/
> > > > +       .min_height =3D 1,
> > > >  };
> > > >
> > > >  static const struct of_device_id mtk_drm_of_ids[] =3D {
> > > > @@ -493,6 +502,15 @@ static int mtk_drm_kms_init(struct drm_device =
*drm)
> > > >                 for (j =3D 0; j < private->data->mmsys_dev_num; j++=
) {
> > > >                         priv_n =3D private->all_drm_private[j];
> > > >
> > > > +                       if (priv_n->data->max_width)
> > > > +                               drm->mode_config.max_width =3D priv=
_n->data->max_width;
> > > > +
> > > > +                       if (priv_n->data->min_width)
> > > > +                               drm->mode_config.min_width =3D priv=
_n->data->min_width;
> > > > +
> > > > +                       if (priv_n->data->min_height)
> > > > +                               drm->mode_config.min_height =3D pri=
v_n->data->min_height;
> > > > +
> > > >                         if (i =3D=3D CRTC_MAIN && priv_n->data->mai=
n_len) {
> > > >                                 ret =3D mtk_crtc_create(drm, priv_n=
->data->main_path,
> > > >                                                       priv_n->data-=
>main_len, j,
> > > > @@ -520,6 +538,10 @@ static int mtk_drm_kms_init(struct drm_device =
*drm)
> > > >                 }
> > > >         }
> > > >
> > > > +       /* IGT will check if the cursor size is configured */
> > > > +       drm->mode_config.cursor_width =3D drm->mode_config.max_widt=
h;
> > > > +       drm->mode_config.cursor_height =3D drm->mode_config.max_hei=
ght;
> > >
> > > I think you shouldn't set the cursor size to the maximum plane size.
> > > As you mentioned in the commit message, IGT tests the cursor sizes
> > > from 1x1 to 512x512, so just setting them to 512 (with a macro) shoul=
d
> > > be enough.
> > >
> > > Currently this tells the userspace "the supported cursor plane size i=
s
> > > up to 4096x8191" on MT8195 and MT8188.
> > > That means the userspace may allocate a buffer with 4096*8191*4 ~=3D
> > > 128MB for the cursor plane in the worst case, and most of the buffer
> > > will be wasted.
> > > Note that the default value for DRM_CAP_CURSOR_WIDTH is 64.
> > >
> > > In practice, when applying this on the MT8188 Chromebook, I see the
> > > userspace allocates two 64MB buffers for the cursor plane.
> > > But if I limit the cursor size to 512, the userspace only allocates
> > > two 1MB buffers i.e. 126MB is optimized for the DMA buffer allocation=
.
> >
> > That seems more like an issue of ChromeOS not doing the most optimal
> > thing though?
>
> I agree that we need to fix this on the ChromeOS side too, but I still
> think the driver doesn't need to set the capabilities like this
> because a full-screen size cursor is not practical anyway.
> The default cursor plane size is just 64x64.

Seems like a better solution was merged:

https://patchwork.freedesktop.org/patch/583298/


ChenYu

> Regard,
> Fei
>
>
>
> >
> > > Regards,
> > > Fei
> > >
> > >
> > > >
> > > > +
> > > >         /* Use OVL device for all DMA memory allocations */
> > > >         crtc =3D drm_crtc_from_index(drm, 0);
> > > >         if (crtc)
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/d=
rm/mediatek/mtk_drm_drv.h
> > > > index 78d698ede1bf8..6cfa790e8df5c 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> > > > @@ -46,6 +46,10 @@ struct mtk_mmsys_driver_data {
> > > >         bool shadow_register;
> > > >         unsigned int mmsys_id;
> > > >         unsigned int mmsys_dev_num;
> > > > +
> > > > +       int max_width;
> > > > +       int min_width;
> > > > +       int min_height;
> > > >  };
> > > >
> > > >  struct mtk_drm_private {
> > > > --
> > > > 2.18.0
> > > >

