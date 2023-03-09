Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FC6C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 21:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nh5PbECcDcnxj+Di/AvIm/ptzZTES5BXOO5Ff5nk+zg=; b=NL6nJXCAoKnKjmRxuCzpD09edu
	7E7acQzKAUc+CKbm5JUGQfZXkZT/6RVRhHJSD4lU/oBFBsHs3+xld5gSp1g57mdgj/soO75lbckYG
	1tuNG+ePh3ACklASU4a7Ob5C8udEvwOHVdmNOIe+tf1p/nKnQoe5lE/XW7IfAyRS8qhDRl4mfxRjG
	JRjeNLN8l4WUhLXkoRP4FUvYAUZPV9bEVbyvwHK2+U2x5gXGxF4qRxQo0LbBJwfqgmVGCptTekrUM
	ehGwx36962sPjKsDSBEG5c88U6xKgzUuwXeQ5J4WOKTKw2wgNpV1ycdksjPU3CKwYmWvDequMQGP7
	WVuhz66g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNSE-00BvOF-KW; Thu, 09 Mar 2023 21:05:38 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNS9-00BvLO-Ed
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 21:05:35 +0000
Received: by mail-pg1-x531.google.com with SMTP id s18so1890500pgq.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 13:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678395932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nh5PbECcDcnxj+Di/AvIm/ptzZTES5BXOO5Ff5nk+zg=;
        b=MVvF25i8lR3Vz0TroD3ZkrjDrQYUnGxQPuKXkHKnOqeFVwArY9amsl4rIwaePp1m8D
         RXdAWJ5YeUM/zH7mwnBWpFb4aDUCNJvak7R3ZsqRw0Or7+p6iNF3+2SMnNP8St7BK127
         ldtQhbCQFsI75aCWNB0uzk93HYom3MOF9EL/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678395932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nh5PbECcDcnxj+Di/AvIm/ptzZTES5BXOO5Ff5nk+zg=;
        b=O//Gdth6ryy3WVMa/hdMMrmv7RCoLkkVQSJhcE+evHYzaz8Lh04eNEtM7f6cgxeGt8
         ETod7cowttEAxNTHSwrOqiYxn/3ZTK4xIXbda/ToNb1wMwm9gQwsk7cWo6P7nYbhlMQU
         x9ceJdF/rR98k4JNoLGncJfw9aUHKLQg2VdZwcW/joa/rXZ9L8FQU09/mgY+hK9VyEsX
         LzgMvh/zPzdB9/CnVmn1JmtzR6X9SU7YmSk2HwzwW3kM8WHnWC2pGYQ8u8Oko0+cFG7y
         T+FZ9u//KTTXao3MeVrm3I1ejxxYUZLzg73u6MG7BtuXIJEqiIy2rQnzcypAHxgAYaA/
         jClg==
X-Gm-Message-State: AO0yUKXZZa0va/LtxxU2MCzMmoTycnI4zuNHOV9n+ewikyQ4i8oyLvLF
	ylNQ2yYr+zzjppFEJcqU6EgwvHK71pJJlf1zlKdk/w==
X-Google-Smtp-Source: AK7set9pQmmwqDvT8irNYmHZqiYgLBmigycFOJraZWSQaupdAEXHJX8Tgl2r1DpJVgMteLJkXIl0iUy4AV9nn66xhwg=
X-Received: by 2002:a63:715d:0:b0:4fc:2058:fa2b with SMTP id
 b29-20020a63715d000000b004fc2058fa2bmr8308168pgn.3.1678395931674; Thu, 09 Mar
 2023 13:05:31 -0800 (PST)
MIME-Version: 1.0
References: <20230308153358.333297-1-greenjustin@chromium.org>
 <20230308153358.333297-3-greenjustin@chromium.org> <CAAOTY__LJPfBMkZM1XxBrrzYdnTG20RH2Yn1rCYioro9Fv+1_g@mail.gmail.com>
In-Reply-To: <CAAOTY__LJPfBMkZM1XxBrrzYdnTG20RH2Yn1rCYioro9Fv+1_g@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Thu, 9 Mar 2023 16:05:20 -0500
Message-ID: <CAHC42RdCqwO+bTbRhp45xoZaftbUFcbHZ7sBs4emL6w9cnu7GQ@mail.gmail.com>
Subject: Re: [PATCH v7 RESEND 2/3] drm/mediatek: Add support for AR30 and BA30 overlays
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, p.zabel@pengutronix.de, 
	matthias.bgg@gmail.com, daniel@ffwll.ch, daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_130533_581211_FC3CE48C 
X-CRM114-Status: GOOD (  24.84  )
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

Hi Chun-Kuang,
Thanks for the review! This patch was tested like the previous one, by
running Chrome on an MT8195 and looking for regressions. I'll post a
new series with the updated patch descriptions.

Regards,
Justin

On Wed, Mar 8, 2023 at 6:34=E2=80=AFPM Chun-Kuang Hu <chunkuang.hu@kernel.o=
rg> wrote:
>
> Hi, Justin:
>
> Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
8=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:34=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > Tested using "modetest -P" on an MT8195 device.
>
> I think you could not test this when only apply the first two patches
> of this series, so move the test information to the third patch. In
> this patch, you could describe more about what and why this patch
> does. The other modification looks good to me.
>
> Regards,
> Chun-Kuang.
>
> >
> > Signed-off-by: Justin Green <greenjustin@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 33 +++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/=
mediatek/mtk_disp_ovl.c
> > index 8743c8047dc9..a6255e847104 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -41,6 +41,7 @@
> >  #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
> >  #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
> >  #define DISP_REG_OVL_ADDR_MT2701               0x0040
> > +#define DISP_REG_OVL_CLRFMT_EXT                        0x02D0
> >  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
> >  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x=
20 * (n))
> >  #define DISP_REG_OVL_HDR_ADDR(ovl, n)          ((ovl)->data->addr + 0x=
20 * (n) + 0x04)
> > @@ -61,6 +62,10 @@
> >                                         0 : OVL_CON_CLRFMT_RGB)
> >  #define OVL_CON_CLRFMT_RGB888(ovl)     ((ovl)->data->fmt_rgb565_is_0 ?=
 \
> >                                         OVL_CON_CLRFMT_RGB : 0)
> > +#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)     (0xFF << 4 * (ovl))
> > +#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)   (depth << 4 * (ovl))
> > +#define OVL_CON_CLRFMT_8_BIT                   0x00
> > +#define OVL_CON_CLRFMT_10_BIT                  0x01
> >  #define        OVL_CON_AEN             BIT(8)
> >  #define        OVL_CON_ALPHA           0xff
> >  #define        OVL_CON_VIRT_FLIP       BIT(9)
> > @@ -89,6 +94,7 @@ struct mtk_disp_ovl_data {
> >         bool supports_afbc;
> >         const u32 *formats;
> >         size_t num_formats;
> > +       bool supports_clrfmt_ext;
> >  };
> >
> >  /*
> > @@ -218,6 +224,30 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *=
ovl, struct cmdq_pkt *cmdq_pkt
> >                            DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN=
(idx));
> >  }
> >
> > +static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 for=
mat,
> > +                                 struct cmdq_pkt *cmdq_pkt)
> > +{
> > +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> > +       unsigned int reg;
> > +       unsigned int bit_depth =3D OVL_CON_CLRFMT_8_BIT;
> > +
> > +       if (!ovl->data->supports_clrfmt_ext)
> > +               return;
> > +
> > +       reg =3D readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
> > +       reg &=3D ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
> > +
> > +       if (format =3D=3D DRM_FORMAT_RGBA1010102 ||
> > +           format =3D=3D DRM_FORMAT_BGRA1010102 ||
> > +           format =3D=3D DRM_FORMAT_ARGB2101010)
> > +               bit_depth =3D OVL_CON_CLRFMT_10_BIT;
> > +
> > +       reg |=3D OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
> > +
> > +       mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg,
> > +                     ovl->regs, DISP_REG_OVL_CLRFMT_EXT);
> > +}
> > +
> >  void mtk_ovl_config(struct device *dev, unsigned int w,
> >                     unsigned int h, unsigned int vrefresh,
> >                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> > @@ -332,9 +362,11 @@ static unsigned int ovl_fmt_convert(struct mtk_dis=
p_ovl *ovl, unsigned int fmt)
> >                 return OVL_CON_CLRFMT_ARGB8888;
> >         case DRM_FORMAT_BGRX8888:
> >         case DRM_FORMAT_BGRA8888:
> > +       case DRM_FORMAT_BGRA1010102:
> >                 return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
> >         case DRM_FORMAT_XRGB8888:
> >         case DRM_FORMAT_ARGB8888:
> > +       case DRM_FORMAT_ARGB2101010:
> >                 return OVL_CON_CLRFMT_RGBA8888;
> >         case DRM_FORMAT_XBGR8888:
> >         case DRM_FORMAT_ABGR8888:
> > @@ -418,6 +450,7 @@ void mtk_ovl_layer_config(struct device *dev, unsig=
ned int idx,
> >                                       &ovl->cmdq_reg, ovl->regs, DISP_R=
EG_OVL_PITCH_MSB(idx));
> >         }
> >
> > +       mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
> >         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
> >  }
> >
> > --
> > 2.39.1.456.gfc5497dd1b-goog
> >

