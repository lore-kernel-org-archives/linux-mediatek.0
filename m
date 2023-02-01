Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC54FC636CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 15:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEroFF01xF/gYLWOOhlWwk+a5XYrMZZEyHvzvZdXWOU=; b=h0BjL5yNuxHav1aKgprKFT42Rf
	30FYeUkKRey8PjYe3XagwLNWVo421Rodgd1WF2ZQqQhftnCXPt7TQ7w6QjBIk02cbJCPHmpzbghp3
	XnIE3H3ot7rxYWdcdHzc+2S7y5oTJaQQpNq+YHp0I6XdmY0gS7qPIxtBGS+1Ri7m+nfOfF1RZuWSq
	lIdoH1O9TN+AwZh3EuptAgPA1giJ6PuU6b8p5L9/rcg5t12x9ttgO9RUMuWbn6Xhe9hjHogXwZ0GC
	VF0TxpJeWNcHggfUqUUq9642PaCbMgioDDqf9V3Ji45LEx251HvpPg/eoL+fhiInAFfoRMyrmXAkS
	vVgVW8Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNFR1-00Cgxz-Vx; Wed, 01 Feb 2023 15:54:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNFQz-00CgxY-0E
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 15:54:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5AF79617BF
	for <linux-mediatek@lists.infradead.org>; Wed,  1 Feb 2023 15:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDABFC4339B
	for <linux-mediatek@lists.infradead.org>; Wed,  1 Feb 2023 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675266843;
	bh=PT4A84v6rmUsoQ+mFWhh606RLtEmXqHp4Q/3V0SWa/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vHe1lPHm3N5lU/lqD8fJEzsZmoMGNYMbE1QlMV8nk2ucoQpUyjRB1u3Po1TaSk6pH
	 nWojMexNtwMq0yrEMGsEYm3T0rlTDMz+9hp4K69d2CAOl6Kxc+pI3WCnvUgOxvOWkA
	 8+fp4Gp5ffgjdEBL/OePoM3UKG/p3T0Eyvh/XVlxpZC6Z4Ho+MeaVqtwoUBd+JoQH0
	 bJG7XhZeJJgCZi9D2WDv3PrAW5DcohWTC81332rM19HOVUMAlQYiP5ZqZEZjYXpsZ5
	 R5EqkQwhz96EjwsPWHAzLTs6xEFp4IMBjK3bG7PEPsiY8JNFrdyRRPwK84pFvF3gpc
	 XTgTlVx+1mcoQ==
Received: by mail-lf1-f41.google.com with SMTP id y25so29879563lfa.9
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 07:54:03 -0800 (PST)
X-Gm-Message-State: AO0yUKUMVRiK2JHRGjpBUT+t0osfBqU/3VxShG4iDNacBo4a0q0yGJxO
	3KNh0jE5xCMuDg1400l82/Y8ibByjTxYSG4++g==
X-Google-Smtp-Source: AK7set/8sZWvJVcVrn5PAAmoq9amA18e/RlNS/rSwIxi4HB2+iRJ5unLG90fANwnd/kOq3szqq0PQWJwqp1JtafTZ0w=
X-Received: by 2002:a05:6512:3184:b0:4d5:7b89:7b67 with SMTP id
 i4-20020a056512318400b004d57b897b67mr417774lfe.17.1675266841748; Wed, 01 Feb
 2023 07:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20230131200842.341272-1-greenjustin@chromium.org> <20230131200842.341272-3-greenjustin@chromium.org>
In-Reply-To: <20230131200842.341272-3-greenjustin@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 1 Feb 2023 23:53:49 +0800
X-Gmail-Original-Message-ID: <CAAOTY__7o5SMyc8jXSkO27Kc8r5TXaFBnMApSiOG3Cjm5+hZaQ@mail.gmail.com>
Message-ID: <CAAOTY__7o5SMyc8jXSkO27Kc8r5TXaFBnMApSiOG3Cjm5+hZaQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: Add support for AR30 and BA30 overlays
To: Justin Green <greenjustin@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@linux.ie, matthias.bgg@gmail.com, 
	daniel@ffwll.ch, daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_075405_146794_BEAE731A 
X-CRM114-Status: GOOD (  22.35  )
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

Hi, Justin:

Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B42=E6=9C=881=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=884:09=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Add support for overlays with pixel formats AR30 and BA30 on MT8195.

I would like to break this patch into two patches. One is ovl support
AR30 and BA30, and the other one is mt8195 ovl support AR30 and BA30.

>
> Tested using "modetest -P" on an MT8195 device.
>
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 49 ++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 8743c8047dc9..cd2f9a156456 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -41,6 +41,7 @@
>  #define DISP_REG_OVL_RDMA_CTRL(n)              (0x00c0 + 0x20 * (n))
>  #define DISP_REG_OVL_RDMA_GMC(n)               (0x00c8 + 0x20 * (n))
>  #define DISP_REG_OVL_ADDR_MT2701               0x0040
> +#define DISP_REG_OVL_CLRFMT_EXT                        0x02D0
>  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
>  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x20=
 * (n))
>  #define DISP_REG_OVL_HDR_ADDR(ovl, n)          ((ovl)->data->addr + 0x20=
 * (n) + 0x04)
> @@ -61,6 +62,10 @@
>                                         0 : OVL_CON_CLRFMT_RGB)
>  #define OVL_CON_CLRFMT_RGB888(ovl)     ((ovl)->data->fmt_rgb565_is_0 ? \
>                                         OVL_CON_CLRFMT_RGB : 0)
> +#define OVL_CON_CLRFMT_BIT_DEPTH_MASK(ovl)     (0xFF << 4 * (ovl))
> +#define OVL_CON_CLRFMT_BIT_DEPTH(depth, ovl)   (depth << 4 * (ovl))
> +#define OVL_CON_CLRFMT_8_BIT                   0x00
> +#define OVL_CON_CLRFMT_10_BIT                  0x01
>  #define        OVL_CON_AEN             BIT(8)
>  #define        OVL_CON_ALPHA           0xff
>  #define        OVL_CON_VIRT_FLIP       BIT(9)
> @@ -80,6 +85,22 @@ static const u32 mt8173_formats[] =3D {
>         DRM_FORMAT_YUYV,
>  };
>
> +static const u32 mt8195_formats[] =3D {
> +       DRM_FORMAT_XRGB8888,
> +       DRM_FORMAT_ARGB8888,
> +       DRM_FORMAT_ARGB2101010,
> +       DRM_FORMAT_BGRX8888,
> +       DRM_FORMAT_BGRA8888,
> +       DRM_FORMAT_BGRA1010102,
> +       DRM_FORMAT_ABGR8888,
> +       DRM_FORMAT_XBGR8888,
> +       DRM_FORMAT_RGB888,
> +       DRM_FORMAT_BGR888,
> +       DRM_FORMAT_RGB565,
> +       DRM_FORMAT_UYVY,
> +       DRM_FORMAT_YUYV,
> +};
> +
>  struct mtk_disp_ovl_data {
>         unsigned int addr;
>         unsigned int gmc_bits;
> @@ -218,6 +239,27 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ov=
l, struct cmdq_pkt *cmdq_pkt
>                            DISP_REG_OVL_DATAPATH_CON, OVL_LAYER_AFBC_EN(i=
dx));
>  }
>
> +static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 forma=
t,
> +                                 struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_ovl *ovl =3D dev_get_drvdata(dev);
> +       unsigned int reg;
> +       unsigned int bit_depth =3D OVL_CON_CLRFMT_8_BIT;
> +
> +       reg =3D readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
> +       reg &=3D ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
> +
> +       if (format =3D=3D DRM_FORMAT_RGBA1010102 ||
> +           format =3D=3D DRM_FORMAT_BGRA1010102 ||
> +           format =3D=3D DRM_FORMAT_ARGB2101010)
> +               bit_depth =3D OVL_CON_CLRFMT_10_BIT;
> +
> +       reg |=3D OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
> +
> +       mtk_ddp_write(cmdq_pkt, reg, &ovl->cmdq_reg,
> +                     ovl->regs, DISP_REG_OVL_CLRFMT_EXT);

Does all SoC have this register? If no, you should write this register
for the SoC have this register.

Regards,
Chun-Kuang.

> +}
> +
>  void mtk_ovl_config(struct device *dev, unsigned int w,
>                     unsigned int h, unsigned int vrefresh,
>                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -332,9 +374,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_=
ovl *ovl, unsigned int fmt)
>                 return OVL_CON_CLRFMT_ARGB8888;
>         case DRM_FORMAT_BGRX8888:
>         case DRM_FORMAT_BGRA8888:
> +       case DRM_FORMAT_BGRA1010102:
>                 return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
>         case DRM_FORMAT_XRGB8888:
>         case DRM_FORMAT_ARGB8888:
> +       case DRM_FORMAT_ARGB2101010:
>                 return OVL_CON_CLRFMT_RGBA8888;
>         case DRM_FORMAT_XBGR8888:
>         case DRM_FORMAT_ABGR8888:
> @@ -418,6 +462,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigne=
d int idx,
>                                       &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
>         }
>
> +       mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
>         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
>  }
>
> @@ -583,8 +628,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driv=
er_data =3D {
>         .fmt_rgb565_is_0 =3D true,
>         .smi_id_en =3D true,
>         .supports_afbc =3D true,
> -       .formats =3D mt8173_formats,
> -       .num_formats =3D ARRAY_SIZE(mt8173_formats),
> +       .formats =3D mt8195_formats,
> +       .num_formats =3D ARRAY_SIZE(mt8195_formats),
>  };
>
>  static const struct of_device_id mtk_disp_ovl_driver_dt_match[] =3D {
> --
> 2.39.1.456.gfc5497dd1b-goog
>

