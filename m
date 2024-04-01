Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA462CD1288
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9qh02aSQqkFNf3LhjjoFs5rbnBuXyuGxGuocn0IWSE=; b=jxQNcMQibfMsBYYYkWVPkh+OOF
	nzAMEFbSe9y142oBoE/ZxL2lf65unkrOGnS1YqobgKNfBzLNNhgpF+cVHPUytP4b1KspQEAdVFDMF
	RoHJX8yWAqsWI3Xy2XSVmGTuoP+YeILmc77949ce+1zS/bGkQcB7E3DmdpqhICWs89dA3G0Swh5ST
	wjUp02xZErZikY7VfoWLtbgs9ZT6MblgUuycY+CrwIQg5dgqif40PFHeWvNjT0OKXJSPrH817pvlq
	IcZZGC7PUh1/dfHHah6e17rwj49yVakBmCs4KjGGxUDObhnl5f2F1ZchxOD4/HSoGuE4iSGs7RrXe
	yxQCxQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrIUw-000000082Tv-2Wfx;
	Mon, 01 Apr 2024 14:18:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrIUs-000000082T1-3jq5;
	Mon, 01 Apr 2024 14:18:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6E3BFCE10EA;
	Mon,  1 Apr 2024 14:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1278C43141;
	Mon,  1 Apr 2024 14:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711981126;
	bh=f2DoFurOynOG4quHV5d8r8M1WM9y77WeUcdSY3SBS8I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JgVrt27DJVAew0sATHO5VZ3AQgNkhHlKyDUwITVRIa6hzv0BdugeBJnUKSxhRilzU
	 AEVQXYpKQjwj8kHhSw4XBUBuaBr5PVFGVJcWUIwctFvV1tsWZM1e4edB89/DWV6YBl
	 MZfl49Lb/8GOVL8xBqjMmyNYK5Q17cKyXha98a2/19KT/spReHU3S2EGbPFsxO9C93
	 H8igpDXIcN2S7h2NfXbdzzKTi3iunZjPnc4gdj0y6xphVlvOayvoSKKIApyiY0iQWe
	 49YZHhJHLeAzWVBBTu7W+OXHIDtI6QL0CQnOmlUNXItkyQut6Gcl7r8wSc8UmUngcE
	 Ng0sY2ek7i0tg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-513d3746950so5011744e87.1;
        Mon, 01 Apr 2024 07:18:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwBkuAJZyCZJwuO5815mfsjibdM6e123O/JBGLrSxq9LsT9jNNnKsKO6VTqIKB1bYqPFb3C0TUNo0IeAua5aW2y1hGUoDOo/ulI59/lrXsx4CeD4OJLOYzvb2yeNjYU7PvoM3kbVaGMlDYqySKzK9g2ogLsib+hIw=
X-Gm-Message-State: AOJu0YyYOGmwHSQ11DG31hKzVJq/Nsds5q1aXrLMj5kA8j7XTgRgnGMa
	TgV4P5G7/tqTlBHPojo9JjdmxF5F2ttQjdko3ZzDAe6iPhmxbY7vTyIm/kk8b9QLpiKRZtB2zk0
	SPfmseeXSybtFUwa7yO+I30W+KA==
X-Google-Smtp-Source: AGHT+IHdAlkLW/SrxLn81/xGOsOTs89tCt0NFENCGddgQeEUwEG7bKOE+D4m9RY1CD7sWB90CmVEJay42db8PHVpres=
X-Received: by 2002:a2e:9d44:0:b0:2d6:9e7a:1524 with SMTP id
 y4-20020a2e9d44000000b002d69e7a1524mr5486251ljj.13.1711981125136; Mon, 01 Apr
 2024 07:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240201125304.218467-1-angelogioacchino.delregno@collabora.com>
 <20240201125304.218467-3-angelogioacchino.delregno@collabora.com> <4b5d172c9b169313aaec777158e2db697fe447fc.camel@mediatek.com>
In-Reply-To: <4b5d172c9b169313aaec777158e2db697fe447fc.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 1 Apr 2024 22:18:37 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8K9Z0skA8aAXauUnoyLqqVEaukes=Mpz-EF19eF0XcYA@mail.gmail.com>
Message-ID: <CAAOTY_8K9Z0skA8aAXauUnoyLqqVEaukes=Mpz-EF19eF0XcYA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/mediatek: Perform iounmap on simple DDP component destruction
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wenst@chromium.org" <wenst@chromium.org>, 
	"kernel@collabora.com" <kernel@collabora.com>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	"daniel@ffwll.ch" <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	=?UTF-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_071851_305513_6ADEE135 
X-CRM114-Status: GOOD (  27.26  )
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

Hi, Angelo:

CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) <ck.hu@mediatek.com> =E6=96=BC 2024=E5=
=B9=B43=E6=9C=8822=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:49=E5=AF=
=AB=E9=81=93=EF=BC=9A
>
> Hi, Angelo:
>
> On Thu, 2024-02-01 at 13:53 +0100, AngeloGioacchino Del Regno wrote:
> > Add a new mtk_ddp_comp_destroy() function and call it in the teardown
> > path of mtk_drm_drv to make sure that we unmap the iospace of the
> > simple DDP components.
> >
> > While at it, also fix iounmapping on mtk_ddp_comp_init() error path.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>
> >
> > Fixes: ff1395609e20 ("drm/mediatek: Move mtk_ddp_comp_init() from sub
> > driver to DRM driver")
> > Signed-off-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 38
> > ++++++++++++++++++++-
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  4 ++-
> >  3 files changed, 41 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index c13359eeb3cd..539b526a6b0a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -626,8 +626,11 @@ int mtk_ddp_comp_init(struct device_node *node,
> > struct mtk_ddp_comp *comp,
> >
> >       priv->regs =3D of_iomap(node, 0);
> >       priv->clk =3D of_clk_get(node, 0);
> > -     if (IS_ERR(priv->clk))
> > +     if (IS_ERR(priv->clk)) {
> > +             iounmap(priv->regs);
> > +             priv->regs =3D NULL;
> >               return PTR_ERR(priv->clk);
> > +     }
> >
> >  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
> >       ret =3D cmdq_dev_get_client_reg(comp->dev, &priv->cmdq_reg, 0);
> > @@ -639,3 +642,36 @@ int mtk_ddp_comp_init(struct device_node *node,
> > struct mtk_ddp_comp *comp,
> >
> >       return 0;
> >  }
> > +
> > +void mtk_ddp_comp_destroy(struct mtk_ddp_comp *comp)
> > +{
> > +     struct mtk_ddp_comp_dev *priv;
> > +
> > +     if (!comp || !comp->dev)
> > +             return;
> > +
> > +     /* Complex components are destroyed with their own remove
> > callback */
> > +     if (type =3D=3D MTK_DISP_AAL ||

Build error:

../drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c: In function
\u2018mtk_ddp_comp_destroy\u2019:
../drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c:657:13: error:
\u2018type\u2019 undeclared (first use in this function); did you mean
\u2018_ctype\u2019?
  657 |         if (type =3D=3D MTK_DISP_AAL ||
      |             ^~~~
      |             _ctype
../drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c:657:13: note: each
undeclared identifier is reported only once for each function it
appears in

Regards,
Chun-Kuang.

> > +         type =3D=3D MTK_DISP_BLS ||
> > +         type =3D=3D MTK_DISP_CCORR ||
> > +         type =3D=3D MTK_DISP_COLOR ||
> > +         type =3D=3D MTK_DISP_GAMMA ||
> > +         type =3D=3D MTK_DISP_MERGE ||
> > +         type =3D=3D MTK_DISP_OVL ||
> > +         type =3D=3D MTK_DISP_OVL_2L ||
> > +         type =3D=3D MTK_DISP_PWM ||
> > +         type =3D=3D MTK_DISP_RDMA ||
> > +         type =3D=3D MTK_DPI ||
> > +         type =3D=3D MTK_DP_INTF ||
> > +         type =3D=3D MTK_DSI)
> > +             return;
> > +
> > +     priv =3D dev_get_drvdata(comp->dev);
> > +     if (!priv)
> > +             return;
> > +
> > +     if (priv->regs) {
> > +             iounmap(priv->regs);
> > +             priv->regs =3D NULL;
> > +     }
> > +}
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index 15b2eafff438..43372b416a3f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -318,6 +318,7 @@ unsigned int
> > mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
> >                                               struct device *dev);
> >  int mtk_ddp_comp_init(struct device_node *comp_node, struct
> > mtk_ddp_comp *comp,
> >                     unsigned int comp_id);
> > +void mtk_ddp_comp_destroy(struct mtk_ddp_comp *comp);
> >  enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
> >  void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
> >                  struct cmdq_client_reg *cmdq_reg, void __iomem
> > *regs,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index 14a1e0157cc4..89b6c31a1511 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -944,8 +944,10 @@ static void mtk_drm_remove(struct
> > platform_device *pdev)
> >       component_master_del(&pdev->dev, &mtk_drm_ops);
> >       pm_runtime_disable(&pdev->dev);
> >       of_node_put(private->mutex_node);
> > -     for (i =3D 0; i < DDP_COMPONENT_DRM_ID_MAX; i++)
> > +     for (i =3D 0; i < DDP_COMPONENT_DRM_ID_MAX; i++) {
> > +             mtk_ddp_comp_destroy(&private->ddp_comp[i]);
> >               of_node_put(private->comp_node[i]);
> > +     }
> >  }
> >
> >  static int mtk_drm_sys_prepare(struct device *dev)

