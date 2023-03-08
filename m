Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB3EC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 23:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29njkmTzIUDFmXLxK4RuUPHH8xVwEXksxMZXQotmbXY=; b=yaYADMieKtpQIRv2dii5hpsNaH
	Q4qT9fSXsVV6AWzNiU/h6Cm0V0VDSqa7XrgG890wBHcThpwN0betGo2RajVL+phxtiwJsvucg049e
	NUh3nthUo9jTzaELI7elPas2gz/Km+Z6cMUNwwzRDqJW+FGxf8cqafptYQPwgVb3d4ONCVKZzmugP
	i0VKAby5V5YXO5JGGbzvXXjSHbqCAlhbGuof2UaDeJ/eQWWjUAsYUQtEScQ67u1Mwb4T1g5b7Rpb9
	Ms56QElMgG7SeYMyxKVn6+Jjyvdi1AkVEdeAo0gmoqB0ozImZZdR9fb0n1C0TU2Yk9SupE8qvJJna
	1TMt1TgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa3IX-0078ta-PL; Wed, 08 Mar 2023 23:34:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa3IU-0078sz-HV
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 23:34:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28CED616FE
	for <linux-mediatek@lists.infradead.org>; Wed,  8 Mar 2023 23:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2222C433AA
	for <linux-mediatek@lists.infradead.org>; Wed,  8 Mar 2023 23:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678318452;
	bh=KUGDEgonlg9RXBeUOcEOHd3TUC9eBAaEXNluLsYZAao=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=au+97evzRqd78Dy4n9eVrSyu9VMiSiWPRJyoiTBcEeoptCEEghO9zy/Y+MI3UMCOO
	 2WcQFeDu4snkRN28cg71IUD/vuHAHrhY4YKvcRvdg1HCpSlbfVIH9/jd3wrFg2KPpx
	 zO07uC2QsSFADZnr1MZRGZhtQb8CWW53NDQSv08hJnRgre0BfxKmJyRXSK4hFF4uiR
	 DJpO3tMD1iERylS7qa7l0oTJpMyyqYCBJWOZ9wr8Y3mSno86hJ/cYsBo33l/QebRKr
	 iXr1eB29ci0aZtIDoxQG/c44Ycazt4RymqZ0RC5d4zXTnFw6juyVISQf7/FgIf3h0a
	 hQklF5ujmYNjw==
Received: by mail-lf1-f45.google.com with SMTP id t11so122396lfr.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 15:34:12 -0800 (PST)
X-Gm-Message-State: AO0yUKVFLUSH5ToS+7lNLlF84SPdcwY/OuCncFTcoRdT1SUx9SES0pgm
	dr1od/5viI0Bgn2UD3LW4ZL5etx3KKr/QqDwmw==
X-Google-Smtp-Source: AK7set9jU1rJvJm8BuARSI7xDYybdRxjrachn9eWnJEyi+odkJN2cu9+DkDVO1JPavi5lB7ija2xXLVkY9O12YvKapU=
X-Received: by 2002:ac2:5de1:0:b0:4dd:af74:fe17 with SMTP id
 z1-20020ac25de1000000b004ddaf74fe17mr6129635lfq.7.1678318450861; Wed, 08 Mar
 2023 15:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20230308153358.333297-1-greenjustin@chromium.org> <20230308153358.333297-3-greenjustin@chromium.org>
In-Reply-To: <20230308153358.333297-3-greenjustin@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 9 Mar 2023 07:33:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY__LJPfBMkZM1XxBrrzYdnTG20RH2Yn1rCYioro9Fv+1_g@mail.gmail.com>
Message-ID: <CAAOTY__LJPfBMkZM1XxBrrzYdnTG20RH2Yn1rCYioro9Fv+1_g@mail.gmail.com>
Subject: Re: [PATCH v7 RESEND 2/3] drm/mediatek: Add support for AR30 and BA30 overlays
To: Justin Green <greenjustin@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, daniel@ffwll.ch, 
	daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_153414_696621_3B859478 
X-CRM114-Status: GOOD (  21.11  )
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

Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=888=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:34=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Tested using "modetest -P" on an MT8195 device.

I think you could not test this when only apply the first two patches
of this series, so move the test information to the third patch. In
this patch, you could describe more about what and why this patch
does. The other modification looks good to me.

Regards,
Chun-Kuang.

>
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 8743c8047dc9..a6255e847104 100644
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
> @@ -89,6 +94,7 @@ struct mtk_disp_ovl_data {
>         bool supports_afbc;
>         const u32 *formats;
>         size_t num_formats;
> +       bool supports_clrfmt_ext;
>  };
>
>  /*
> @@ -218,6 +224,30 @@ static void mtk_ovl_set_afbc(struct mtk_disp_ovl *ov=
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
> +       if (!ovl->data->supports_clrfmt_ext)
> +               return;
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
> +}
> +
>  void mtk_ovl_config(struct device *dev, unsigned int w,
>                     unsigned int h, unsigned int vrefresh,
>                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -332,9 +362,11 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_=
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
> @@ -418,6 +450,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigne=
d int idx,
>                                       &ovl->cmdq_reg, ovl->regs, DISP_REG=
_OVL_PITCH_MSB(idx));
>         }
>
> +       mtk_ovl_set_bit_depth(dev, idx, fmt, cmdq_pkt);
>         mtk_ovl_layer_on(dev, idx, cmdq_pkt);
>  }
>
> --
> 2.39.1.456.gfc5497dd1b-goog
>

