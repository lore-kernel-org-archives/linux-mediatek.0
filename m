Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44F0C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 23:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpSY4cEs2z43UA1pKlIyca+NfOqJya4Mjuzvj9HEC7Q=; b=d2hIbK/z2lBOzAL7c8eftupohg
	1wAHGanbQy4e/VlIjO+3/3lyo5+afqS0aX9az1vKANgpWx964C2ZFHN5u+/ORT29pzeE96r9obB3i
	SBqg4PKqiTseyujALrMfFzTJsR8dvL522HQ4zfTGtpCYZ91sv5WfxxHbRGOJdS+uCnh9tvo9p0j/F
	OSrpdxCUhEuc+URntfoqW/2Nw70stYcEGR/rvCznNtE3TsrLtOSFMBr6gXPC1EuR8je1QAq2vwUZo
	EOy1TuzCUK4hodeD3gNcfi8zpajMJQxIKl3DWMiruP8iqX+ppaYB45F39Qig/m2leiw5MNvJm49qM
	PL6Qbqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmk1l-004dRl-0y;
	Wed, 12 Apr 2023 23:37:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmk1g-004dQv-0f;
	Wed, 12 Apr 2023 23:37:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C5B8632CA;
	Wed, 12 Apr 2023 23:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917B8C4339C;
	Wed, 12 Apr 2023 23:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681342637;
	bh=XPnc1KFFUf0qWKm0IhzaEsHbORokq/vVCY1WdIYlrSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZyiXaI+FsNZ9hn9zAE5mjGYlZH6uP+MR1VLJmB+fqLWtbQIrU8DrGt9T2ZNfergGP
	 DC9iNOCE/7jWjpESfbM7oTQ7XpWoXb3QbEF/hTvsuqnvsH0mISeYqsxB8pMrLzV53l
	 ZGM7q2uGv41Ie9X3zFGvWC+BZw5AkJ7AyBrFCATuU6qdolCvuhcVNS6Vz2xpsa5i6n
	 y/mYtZRiL3misO6f1L+O9ax2bE5CeLQXqvAbtBryWIuTBS4vYcpuU3pMGo0PR93P59
	 fI3MJ6esadCpslYseYh5WUAB9j/vJ13ACn5GLBtaKHYcXJDGOviiVIbHcmAJFAwOh6
	 DgxAcIp+Zf8OA==
Received: by mail-lj1-f174.google.com with SMTP id e9so42891948ljq.4;
        Wed, 12 Apr 2023 16:37:17 -0700 (PDT)
X-Gm-Message-State: AAQBX9eOqXYxdGXhpYb9E1DBsjz595oz+cbL+04gur56SQnvR3G2Jtb5
	M+ko5vF3Vtc7VO/gkD7lyxiFXxtLqJeP8PZrGQ==
X-Google-Smtp-Source: AKy350bBrdnIU3ky/e0Yu6oF9aXHAUd6d09dwmO3Kd0JhS8E1krtqtgIZ/HwHr2JngB1yrUihD3gm6BiNWvsorOauBA=
X-Received: by 2002:a2e:9586:0:b0:2a7:7622:fb01 with SMTP id
 w6-20020a2e9586000000b002a77622fb01mr111974ljh.10.1681342635586; Wed, 12 Apr
 2023 16:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230330032614.18837-1-nancy.lin@mediatek.com>
 <20230330032614.18837-2-nancy.lin@mediatek.com> <ZDU3IiewmLW1pDyn@phenom.ffwll.local>
In-Reply-To: <ZDU3IiewmLW1pDyn@phenom.ffwll.local>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 13 Apr 2023 07:37:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Yy2B5SkD+WpZPr5PVa=joW4vFxgfU+FcLGYJHPxN+OQ@mail.gmail.com>
Message-ID: <CAAOTY_-Yy2B5SkD+WpZPr5PVa=joW4vFxgfU+FcLGYJHPxN+OQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/mediatek: Add mdp_rdma get format function
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, David Airlie <airlied@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com, 
	shawn.sung@mediatek.com
Cc: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_163720_345259_6E547F73 
X-CRM114-Status: GOOD (  21.35  )
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

Hi, Daniel:

Daniel Vetter <daniel@ffwll.ch> =E6=96=BC 2023=E5=B9=B44=E6=9C=8811=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Mar 30, 2023 at 11:26:13AM +0800, Nancy.Lin wrote:
> > Add mdp_rdma get_format and get_num_formats function.
> >
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>
> The mtk get_formats stuff seems like a lot of midlayering for not much
> reasons? Is that really needed?

In general, mediatek crtc directly control dma device such as OVL
(multiple plane), RDMA (single plane) and supported format information
store in these sub driver. MT8195 hardware use 4 RDMA to work like
OVL. To simplify the crtc control of dma device, we use a midlayer
OVL_Adaptor to control the 4 RDMA, so crtc just control one
OVL_Adaptor. crtc should query supported format from OVL_Adaptor, but
the supported format store in RDMA driver. That's why we have two
layer get_formats.

Regards,
Chun-Kuang.

>
> Just a drive-by questions I had while merging the pr.
> -Daniel
>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h |  3 +++
> >  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 24 ++++++++++++++++++++++++
> >  2 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/=
mediatek/mtk_disp_drv.h
> > index 0d28b2e2069c..17b169530beb 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -152,4 +152,7 @@ void mtk_mdp_rdma_start(struct device *dev, struct =
cmdq_pkt *cmdq_pkt);
> >  void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
> >  void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *=
cfg,
> >                        struct cmdq_pkt *cmdq_pkt);
> > +const u32 *mtk_mdp_rdma_get_formats(struct device *dev);
> > +size_t mtk_mdp_rdma_get_num_formats(struct device *dev);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/=
mediatek/mtk_mdp_rdma.c
> > index eecfa98ff52e..e06db6e56b5f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> > @@ -62,6 +62,20 @@
> >  #define RDMA_CSC_FULL709_TO_RGB                      5
> >  #define RDMA_CSC_BT601_TO_RGB                        6
> >
> > +static const u32 formats[] =3D {
> > +     DRM_FORMAT_XRGB8888,
> > +     DRM_FORMAT_ARGB8888,
> > +     DRM_FORMAT_BGRX8888,
> > +     DRM_FORMAT_BGRA8888,
> > +     DRM_FORMAT_ABGR8888,
> > +     DRM_FORMAT_XBGR8888,
> > +     DRM_FORMAT_RGB888,
> > +     DRM_FORMAT_BGR888,
> > +     DRM_FORMAT_RGB565,
> > +     DRM_FORMAT_UYVY,
> > +     DRM_FORMAT_YUYV,
> > +};
> > +
> >  enum rdma_format {
> >       RDMA_INPUT_FORMAT_RGB565 =3D 0,
> >       RDMA_INPUT_FORMAT_RGB888 =3D 1,
> > @@ -219,6 +233,16 @@ void mtk_mdp_rdma_config(struct device *dev, struc=
t mtk_mdp_rdma_cfg *cfg,
> >                          MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_H);
> >  }
> >
> > +const u32 *mtk_mdp_rdma_get_formats(struct device *dev)
> > +{
> > +     return formats;
> > +}
> > +
> > +size_t mtk_mdp_rdma_get_num_formats(struct device *dev)
> > +{
> > +     return ARRAY_SIZE(formats);
> > +}
> > +
> >  int mtk_mdp_rdma_clk_enable(struct device *dev)
> >  {
> >       struct mtk_mdp_rdma *rdma =3D dev_get_drvdata(dev);
> > --
> > 2.18.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

