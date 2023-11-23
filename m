Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BCCC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 15:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04FO+0xiec/j5GCV0CSQ6FfhoGOw8zVVnk2KzYp89cM=; b=Xw7CLslLhhKKxQ
	qCucU4j5C1fOGWNfTQHO4heedppoNPRt7fP3zbPkJ4mAq6NTEBCagHKnJ12+eeixoHTnkZ8rK316s
	WXztWo101JyulKQt1RZP5iRoKBSZgZuhAsH2DEPtgRMcWTboy2wP0j8u57DpUJDm0oaq2/loOFIBI
	/y9kjeu+WyvugoPNZxrdiLfM5gF5OClCye7ZqOJ0UKjXiAfI+uQhW++i0ejEwc/hQE+UtjSCcBcb5
	pBveSzJy8vcKGvA12dIk6tzeKpOmnUOqG/kxjoQt3m7admLC0ADb040YdBcFmBgWPDtlxvD6hNt8n
	1F1QMby10PRbpFd0mELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Bi0-005BDm-0O;
	Thu, 23 Nov 2023 15:33:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Bhs-005BBd-1D;
	Thu, 23 Nov 2023 15:33:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5C156225A;
	Thu, 23 Nov 2023 15:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69213C433C7;
	Thu, 23 Nov 2023 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700753610;
	bh=PVY0LzeEkDmnEjIm5dx7ChkB52X+cfmniynJvTefMpY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jg59GbM0ifip+kgf3VVWM4cetDw7IiyyOP5NT19QGqFCuaQHFWXcZjFPriqLOV5MQ
	 oww/npT4bQ/5J7jy++dY1Kk9ogEPile6jOVJsggqlUIYGDq3DiQKO6dUGTjnVHcbqC
	 phjKYXNAhm4zsX8sWAS+kzjLKIIOnXLFguH5iQM0RO32nRk5G/FPbG4QVcw7sGFQEE
	 afrBEFiJ6fqc+w+eqjNPEmUVTKmGGvfNsdqvLbmeAZ+HBg9003Rpbq068dR2BVNKF6
	 amqNCVGfYfNL7MjrDPnYzjEuIyDVIyB6XMafo9Y9gh5szeJWokHVdhXR1BS3vixOsG
	 inVaDcqfaqYnA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso11268191fa.2;
        Thu, 23 Nov 2023 07:33:30 -0800 (PST)
X-Gm-Message-State: AOJu0Yy37jYeowfMz8sMfYcr0/KfGaDf8YbzWHTe2MfVgaiVTmQPtgaq
	uoIBwJc0PHhMjPy80+hJzwwwGfO5IhqqCsU+qw==
X-Google-Smtp-Source: AGHT+IGkv3jtC6yED7yzjQMquybVRXRlSlDjxaeykoa+oyjWq2OAFtm+coBnLi9fc9I1lYhs+7TaTrvkkdYxfj3ADpU=
X-Received: by 2002:a2e:3210:0:b0:2c5:137d:6baa with SMTP id
 y16-20020a2e3210000000b002c5137d6baamr2618012ljy.14.1700753608585; Thu, 23
 Nov 2023 07:33:28 -0800 (PST)
MIME-Version: 1.0
References: <20230905084922.3908121-1-mwalle@kernel.org> <20230905084922.3908121-2-mwalle@kernel.org>
 <93576c3b04c8378c5c9296ec7a6585d9@kernel.org>
In-Reply-To: <93576c3b04c8378c5c9296ec7a6585d9@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 23 Nov 2023 23:33:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY__LqKkj7Exg=wr0QUD-AQ_i3adXLUSdT2M_oYj7iCBAKQ@mail.gmail.com>
Message-ID: <CAAOTY__LqKkj7Exg=wr0QUD-AQ_i3adXLUSdT2M_oYj7iCBAKQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs calculation
To: Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_073332_524570_26E5EE8A 
X-CRM114-Status: GOOD (  33.18  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, Stu Hsieh <stu.hsieh@mediatek.com>, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Michael:

Michael Walle <mwalle@kernel.org> =E6=96=BC 2023=E5=B9=B411=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:44=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi,
>
> > mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
> > always have the CRTC with id 0, the ext id 1 and the third id 2. This
> > is only true if the paths are all available. But paths are optional
> > (see
> > also comment in mtk_drm_kms_init()), e.g. the main path might not be
> > enabled or available at all. Then the CRTC IDs will shift one up, e.g.
> > ext will be 0 and the third path will be 1.
> >
> > To fix that, dynamically calculate the IDs by the presence of the
> > paths.
> >
> > While at it, make the return code a signed one and return -ENOENT if no
> > path is found and handle the error in the callers.
> >
> > Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting
> > possible_crtc way")
> > Suggested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> > Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> Is there anything wrong with these two patches? They are now lingering
> around for more than two months.
>
> Unfortunately, patch 2/2 won't apply anymore because of commit
> 01389b324c97 ("drm/mediatek: Add connector dynamic selection
> capability). And I'm a bit puzzled for what the crtc_id is used
> there because I guess it will have the same problem this patch
> fixes.

Please base on the latest kernel version to fix.

Regards,
Chun-Kuang.

>
> -michael
>
> > ---
> > v4:
> >  - return -ENOENT if mtk_drm_find_possible_crtc_by_comp() doesn't find
> >    any path
> > v3:
> >  - use data instead of priv_n->data
> >  - fixed typos
> >  - collected Rb and Tb tags
> > v2:
> >  - iterate over all_drm_private[] to get any vdosys
> >  - new check if a path is available
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c          |  5 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 75 ++++++++++++++++-----
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  3 +-
> >  drivers/gpu/drm/mediatek/mtk_dsi.c          |  5 +-
> >  4 files changed, 68 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 2f931e4e2b60..f9250f7ee706 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -796,7 +796,10 @@ static int mtk_dpi_bind(struct device *dev, struct
> > device *master, void *data)
> >               return ret;
> >       }
> >
> > -     dpi->encoder.possible_crtcs =3D
> > mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->dev);
> > +     ret =3D mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->dev);
> > +     if (ret < 0)
> > +             goto err_cleanup;
> > +     dpi->encoder.possible_crtcs =3D ret;
> >
> >       ret =3D drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL,
> >                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index 771f4e173353..83ae75ecd858 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -507,6 +507,27 @@ static bool mtk_drm_find_comp_in_ddp(struct device
> > *dev,
> >       return false;
> >  }
> >
> > +static bool mtk_ddp_path_available(const unsigned int *path,
> > +                                unsigned int path_len,
> > +                                struct device_node **comp_node)
> > +{
> > +     unsigned int i;
> > +
> > +     if (!path)
> > +             return false;
> > +
> > +     for (i =3D 0U; i < path_len; i++) {
> > +             /* OVL_ADAPTOR doesn't have a device node */
> > +             if (path[i] =3D=3D DDP_COMPONENT_DRM_OVL_ADAPTOR)
> > +                     continue;
> > +
> > +             if (!comp_node[path[i]])
> > +                     return false;
> > +     }
> > +
> > +     return true;
> > +}
> > +
> >  int mtk_ddp_comp_get_id(struct device_node *node,
> >                       enum mtk_ddp_comp_type comp_type)
> >  {
> > @@ -522,25 +543,47 @@ int mtk_ddp_comp_get_id(struct device_node *node,
> >       return -EINVAL;
> >  }
> >
> > -unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device
> > *drm,
> > -                                             struct device *dev)
> > +int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm, struct
> > device *dev)
> >  {
> >       struct mtk_drm_private *private =3D drm->dev_private;
> > -     unsigned int ret =3D 0;
> > -
> > -     if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path,
> > private->data->main_len,
> > -                                  private->ddp_comp))
> > -             ret =3D BIT(0);
> > -     else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
> > -                                       private->data->ext_len, private=
->ddp_comp))
> > -             ret =3D BIT(1);
> > -     else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
> > -                                       private->data->third_len, priva=
te->ddp_comp))
> > -             ret =3D BIT(2);
> > -     else
> > -             DRM_INFO("Failed to find comp in ddp table\n");
> > +     const struct mtk_mmsys_driver_data *data;
> > +     struct mtk_drm_private *priv_n;
> > +     int i =3D 0, j;
> > +
> > +     for (j =3D 0; j < private->data->mmsys_dev_num; j++) {
> > +             priv_n =3D private->all_drm_private[j];
> > +             data =3D priv_n->data;
> > +
> > +             if (mtk_ddp_path_available(data->main_path, data->main_le=
n,
> > +                                        priv_n->comp_node)) {
> > +                     if (mtk_drm_find_comp_in_ddp(dev, data->main_path=
,
> > +                                                  data->main_len,
> > +                                                  priv_n->ddp_comp))
> > +                             return BIT(i);
> > +                     i++;
> > +             }
> > +
> > +             if (mtk_ddp_path_available(data->ext_path, data->ext_len,
> > +                                        priv_n->comp_node)) {
> > +                     if (mtk_drm_find_comp_in_ddp(dev, data->ext_path,
> > +                                                  data->ext_len,
> > +                                                  priv_n->ddp_comp))
> > +                             return BIT(i);
> > +                     i++;
> > +             }
> > +
> > +             if (mtk_ddp_path_available(data->third_path, data->third_=
len,
> > +                                        priv_n->comp_node)) {
> > +                     if (mtk_drm_find_comp_in_ddp(dev, data->third_pat=
h,
> > +                                                  data->third_len,
> > +                                                  priv_n->ddp_comp))
> > +                             return BIT(i);
> > +                     i++;
> > +             }
> > +     }
> >
> > -     return ret;
> > +     DRM_INFO("Failed to find comp in ddp table\n");
> > +     return -ENOENT;
> >  }
> >
> >  int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp
> > *comp,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index febcaeef16a1..6a95df72de0a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -277,8 +277,7 @@ static inline bool mtk_ddp_comp_disconnect(struct
> > mtk_ddp_comp *comp, struct dev
> >
> >  int mtk_ddp_comp_get_id(struct device_node *node,
> >                       enum mtk_ddp_comp_type comp_type);
> > -unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device
> > *drm,
> > -                                             struct device *dev);
> > +int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm, struct
> > device *dev);
> >  int mtk_ddp_comp_init(struct device_node *comp_node, struct
> > mtk_ddp_comp *comp,
> >                     unsigned int comp_id);
> >  enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index d8bfc2cce54d..d67e5c61a9b9 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -843,7 +843,10 @@ static int mtk_dsi_encoder_init(struct drm_device
> > *drm, struct mtk_dsi *dsi)
> >               return ret;
> >       }
> >
> > -     dsi->encoder.possible_crtcs =3D mtk_drm_find_possible_crtc_by_com=
p(drm,
> > dsi->host.dev);
> > +     ret =3D mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
> > +     if (ret < 0)
> > +             goto err_cleanup_encoder;
> > +     dsi->encoder.possible_crtcs =3D ret;
> >
> >       ret =3D drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
> >                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);

