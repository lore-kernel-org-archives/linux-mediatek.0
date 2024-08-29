Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F53C83F32
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Aug 2024 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kt7i4GJhdgTXg3ytF2MqnupW23YASYf/2cxVEsbk79A=; b=c9KGJKneZUc4DCaOpfg9BPeQ/r
	dFeNg7eHYmkJ4Oi+s+KFBG37dmi4UVhBK76K8/Sd+7yGZXQfihKOcoRMgUddILPzI7UQ0A3A5T2Ci
	UERyNvy8kST4QlFXzUK1ykKxZ4KPbEwTMBWpjjyWRRm7asuaUilmVCRrk81KAKbZl9F0Tg1lyAy7D
	N8kXzsAHXw+CJLG8gRDcLJ2Aophl4EyPfe2MZnSbxQ4f5gBNrRbHEJNWHzlty2hUZUY44Y/poMIyu
	plCNbsXXtLJ0WeHuNFdcg9V2bO5G3T7Dz3QsbCSC+qH/dPi+Qbpao504PlZvWPwbb0zJfyDdXbI1J
	5bOS40YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjgYD-00000002V0E-42IK;
	Thu, 29 Aug 2024 14:55:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjgXK-00000002Ujp-3eRr;
	Thu, 29 Aug 2024 14:54:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 68213A4410D;
	Thu, 29 Aug 2024 14:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06B6C4CEC8;
	Thu, 29 Aug 2024 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943248;
	bh=gGjwRsC3M9/c/KkD/8kJVbZnTVSAPzCfx1ZJsG9gXmM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G3QOtK4x5NkJF/9wehBXrw0qdJZFipes3cS2BkAHTycSbmymWgoAN2aCJW9S3uwQo
	 gcGIaqAfNw9X37Zd9DaRxY0TBGmjcJ9+ruXjULPGXZqexlG/KrwaNXFW+i0UWsczUK
	 naQWHj8poWwrGoPQOld9I/Qjw6qSrDKgjW2uKZRd2+Vlo1HgzzKJYEmbK9g7RDGmZj
	 B4a+wrgocNvWL8vLLH/UwArKw0Jb3WBuQIOskvFTlKxoKg1gnETYttRqhU8zhyeaZT
	 utkjuOmAfQ7jAr9FHd9EXHw7kXFIcRGO7Q4iYKRAvu78MiqgWQxfuZCDWUAp4djDG3
	 xiLfxgrcUl7rQ==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5df9a9f7fe2so437150eaf.2;
        Thu, 29 Aug 2024 07:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZPxhYANrn1oqKVdVEhQ1XsxjhS3FwfhK8CItGdMRpVOq/kUp2zbfod5r/+BMaTe1VcAfrEPU2oKnXcEmph94=@lists.infradead.org, AJvYcCXfRh6imBMiOwvDRB0HcGWw83YBu+DZccyyeYjdH+UKTK29vZMMbjgHeOaijyVTZOyZl/O8R652SEzZXk2mVxe7@lists.infradead.org
X-Gm-Message-State: AOJu0YypwfiPNFdUJyZmUwitmGjFTNdBbD1S6QTrGSs64UP+TfbSDGy8
	TUbPyOkFYNoA4K6+bgXeEjhiQqoEhM/jmhyDGsAiq+htRVhsA+wpqIBGkbZ5aUC97+WGJsb+GEX
	Kgt1E+Xy0rCgV78Kf6NgHB4x54A==
X-Google-Smtp-Source: AGHT+IEyygn0DMFYzMyxc8jy6sIuWErx12dvbL0cJxtOdFO//M5/LG3maZP8Ohf/uApEShQBQN09W1UKNHJV+sMS3/Q=
X-Received: by 2002:a05:6358:6f98:b0:1aa:a01a:23dc with SMTP id
 e5c5f4694b2df-1b603c55350mr395137555d.15.1724943248105; Thu, 29 Aug 2024
 07:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240826060654.24038-1-shuijing.li@mediatek.com>
In-Reply-To: <20240826060654.24038-1-shuijing.li@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 29 Aug 2024 22:54:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8K2BQm5JOBpeP+ZYcctcHAp46JWma7z4vWGFoa1MFbCg@mail.gmail.com>
Message-ID: <CAAOTY_8K2BQm5JOBpeP+ZYcctcHAp46JWma7z4vWGFoa1MFbCg@mail.gmail.com>
Subject: Re: [PATCH v8] drm/mediatek: dsi: Add dsi per-frame lp code for mt8188
To: Shuijing Li <shuijing.li@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, jitao.shi@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_075411_065800_ABA6BB59 
X-CRM114-Status: GOOD (  24.21  )
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

Hi, Shuijing:

Shuijing Li <shuijing.li@mediatek.com> =E6=96=BC 2024=E5=B9=B48=E6=9C=8826=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:07=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Adding the per-frame lp function of mt8188, which can keep HFP in HS and
> reduce the time required for each line to enter and exit low power.
> Per Frame LP:
>   |<----------One Active Frame-------->|
> --______________________________________----___________________
>   ^HSA+HBP^^RGB^^HFP^^HSA+HBP^^RGB^^HFP^    ^HSA+HBP^^RGB^^HFP^
>
> Per Line LP:
>   |<---------------One Active Frame----------->|
> --______________--______________--______________----______________
>   ^HSA+HBP^^RGB^  ^HSA+HBP^^RGB^  ^HSA+HBP^^RGB^    ^HSA+HBP^^RGB^

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> ---
> Changes in v8:
> Directly write value into DSI_HSTX_CKL_WC without check per suggestion fr=
om previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240819061333.=
26069-1-shuijing.li@mediatek.com/
> Changes in v7:
> Fix code style and simplify the code per suggestion from previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240813022315.=
18502-1-shuijing.li@mediatek.com/
> Changes in v6:
> Simplify the code per suggestion from previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240812070341.=
26053-1-shuijing.li@mediatek.com/
> Changes in v5:
> Fix code style issue and add per-line-lp function to be symmetrical with =
per-frame-lp.
> per suggestion from previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240801081144.=
22372-1-shuijing.li@mediatek.com/
> Changes in v4:
> Drop the code related to bllp_en and bllp_wc, adjust ps_wc to dsi->vm.hac=
tive *
> dsi_buf_bpp.
> Changes in v3:
> Use function in bitfield.h and get value from phy timing, per suggestion
> from previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240424091639.=
22759-1-shuijing.li@mediatek.com/
> Changes in v2:
> Use bitfield macros and add new function for per prame lp and improve
> the format, per suggestion from previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240314094238.=
3315-1-shuijing.li@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 106 +++++++++++++++++++++++++----
>  1 file changed, 94 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index b6e3c011a12d..eeec641cab60 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -88,12 +88,15 @@
>  #define DSI_HSA_WC             0x50
>  #define DSI_HBP_WC             0x54
>  #define DSI_HFP_WC             0x58
> +#define HFP_HS_VB_PS_WC                GENMASK(30, 16)
> +#define HFP_HS_EN                      BIT(31)
>
>  #define DSI_CMDQ_SIZE          0x60
>  #define CMDQ_SIZE                      0x3f
>  #define CMDQ_SIZE_SEL          BIT(15)
>
>  #define DSI_HSTX_CKL_WC                0x64
> +#define HSTX_CKL_WC                    GENMASK(15, 2)
>
>  #define DSI_RX_DATA0           0x74
>  #define DSI_RX_DATA1           0x78
> @@ -187,6 +190,7 @@ struct mtk_dsi_driver_data {
>         bool has_shadow_ctl;
>         bool has_size_ctl;
>         bool cmdq_long_packet_ctl;
> +       bool support_per_frame_lp;
>  };
>
>  struct mtk_dsi {
> @@ -426,7 +430,75 @@ static void mtk_dsi_ps_control(struct mtk_dsi *dsi, =
bool config_vact)
>         writel(ps_val, dsi->regs + DSI_PSCTRL);
>  }
>
> -static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> +static void mtk_dsi_config_vdo_timing_per_frame_lp(struct mtk_dsi *dsi)
> +{
> +       u32 horizontal_sync_active_byte;
> +       u32 horizontal_backporch_byte;
> +       u32 horizontal_frontporch_byte;
> +       u32 hfp_byte_adjust, v_active_adjust;
> +       u32 cklp_wc_min_adjust, cklp_wc_max_adjust;
> +       u32 dsi_tmp_buf_bpp;
> +       unsigned int da_hs_trail;
> +       unsigned int ps_wc, hs_vb_ps_wc;
> +       u32 v_active_roundup, hstx_cklp_wc;
> +       u32 hstx_cklp_wc_max, hstx_cklp_wc_min;
> +       struct videomode *vm =3D &dsi->vm;
> +
> +       if (dsi->format =3D=3D MIPI_DSI_FMT_RGB565)
> +               dsi_tmp_buf_bpp =3D 2;
> +       else
> +               dsi_tmp_buf_bpp =3D 3;
> +
> +       da_hs_trail =3D dsi->phy_timing.da_hs_trail;
> +       ps_wc =3D vm->hactive * dsi_tmp_buf_bpp;
> +
> +       if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
> +               horizontal_sync_active_byte =3D
> +                       vm->hsync_len * dsi_tmp_buf_bpp - 10;
> +               horizontal_backporch_byte =3D
> +                       vm->hback_porch * dsi_tmp_buf_bpp - 10;
> +               hfp_byte_adjust =3D 12;
> +               v_active_adjust =3D 32 + horizontal_sync_active_byte;
> +               cklp_wc_min_adjust =3D 12 + 2 + 4 + horizontal_sync_activ=
e_byte;
> +               cklp_wc_max_adjust =3D 20 + 6 + 4 + horizontal_sync_activ=
e_byte;
> +       } else {
> +               horizontal_sync_active_byte =3D vm->hsync_len * dsi_tmp_b=
uf_bpp - 4;
> +               horizontal_backporch_byte =3D (vm->hback_porch + vm->hsyn=
c_len) *
> +                       dsi_tmp_buf_bpp - 10;
> +               cklp_wc_min_adjust =3D 4;
> +               cklp_wc_max_adjust =3D 12 + 4 + 4;
> +               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> +                       hfp_byte_adjust =3D 18;
> +                       v_active_adjust =3D 28;
> +               } else {
> +                       hfp_byte_adjust =3D 12;
> +                       v_active_adjust =3D 22;
> +               }
> +       }
> +       horizontal_frontporch_byte =3D vm->hfront_porch * dsi_tmp_buf_bpp=
 - hfp_byte_adjust;
> +       v_active_roundup =3D (v_active_adjust + horizontal_backporch_byte=
 + ps_wc +
> +                          horizontal_frontporch_byte) % dsi->lanes;
> +       if (v_active_roundup)
> +               horizontal_backporch_byte +=3D dsi->lanes - v_active_roun=
dup;
> +       hstx_cklp_wc_min =3D (DIV_ROUND_UP(cklp_wc_min_adjust, dsi->lanes=
) + da_hs_trail + 1)
> +                          * dsi->lanes / 6 - 1;
> +       hstx_cklp_wc_max =3D (DIV_ROUND_UP((cklp_wc_max_adjust + horizont=
al_backporch_byte +
> +                          ps_wc), dsi->lanes) + da_hs_trail + 1) * dsi->=
lanes / 6 - 1;
> +
> +       hstx_cklp_wc =3D FIELD_PREP(HSTX_CKL_WC, (hstx_cklp_wc_min + hstx=
_cklp_wc_max) / 2);
> +       writel(hstx_cklp_wc, dsi->regs + DSI_HSTX_CKL_WC);
> +
> +       hs_vb_ps_wc =3D ps_wc - (dsi->phy_timing.lpx + dsi->phy_timing.da=
_hs_exit +
> +                     dsi->phy_timing.da_hs_prepare + dsi->phy_timing.da_=
hs_zero + 2) * dsi->lanes;
> +       horizontal_frontporch_byte |=3D FIELD_PREP(HFP_HS_EN, 1) |
> +                                     FIELD_PREP(HFP_HS_VB_PS_WC, hs_vb_p=
s_wc);
> +
> +       writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
> +       writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
> +       writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
> +}
> +
> +static void mtk_dsi_config_vdo_timing_per_line_lp(struct mtk_dsi *dsi)
>  {
>         u32 horizontal_sync_active_byte;
>         u32 horizontal_backporch_byte;
> @@ -436,7 +508,6 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi =
*dsi)
>         u32 dsi_tmp_buf_bpp, data_phy_cycles;
>         u32 delta;
>         struct mtk_phy_timing *timing =3D &dsi->phy_timing;
> -
>         struct videomode *vm =3D &dsi->vm;
>
>         if (dsi->format =3D=3D MIPI_DSI_FMT_RGB565)
> @@ -444,16 +515,6 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi=
 *dsi)
>         else
>                 dsi_tmp_buf_bpp =3D 3;
>
> -       writel(vm->vsync_len, dsi->regs + DSI_VSA_NL);
> -       writel(vm->vback_porch, dsi->regs + DSI_VBP_NL);
> -       writel(vm->vfront_porch, dsi->regs + DSI_VFP_NL);
> -       writel(vm->vactive, dsi->regs + DSI_VACT_NL);
> -
> -       if (dsi->driver_data->has_size_ctl)
> -               writel(FIELD_PREP(DSI_HEIGHT, vm->vactive) |
> -                      FIELD_PREP(DSI_WIDTH, vm->hactive),
> -                      dsi->regs + DSI_SIZE_CON);
> -
>         horizontal_sync_active_byte =3D (vm->hsync_len * dsi_tmp_buf_bpp =
- 10);
>
>         if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> @@ -499,6 +560,26 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi=
 *dsi)
>         writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
>         writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
>         writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
> +}
> +
> +static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> +{
> +       struct videomode *vm =3D &dsi->vm;
> +
> +       writel(vm->vsync_len, dsi->regs + DSI_VSA_NL);
> +       writel(vm->vback_porch, dsi->regs + DSI_VBP_NL);
> +       writel(vm->vfront_porch, dsi->regs + DSI_VFP_NL);
> +       writel(vm->vactive, dsi->regs + DSI_VACT_NL);
> +
> +       if (dsi->driver_data->has_size_ctl)
> +               writel(FIELD_PREP(DSI_HEIGHT, vm->vactive) |
> +                       FIELD_PREP(DSI_WIDTH, vm->hactive),
> +                       dsi->regs + DSI_SIZE_CON);
> +
> +       if (dsi->driver_data->support_per_frame_lp)
> +               mtk_dsi_config_vdo_timing_per_frame_lp(dsi);
> +       else
> +               mtk_dsi_config_vdo_timing_per_line_lp(dsi);
>
>         mtk_dsi_ps_control(dsi, false);
>  }
> @@ -1197,6 +1278,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_=
driver_data =3D {
>         .has_shadow_ctl =3D true,
>         .has_size_ctl =3D true,
>         .cmdq_long_packet_ctl =3D true,
> +       .support_per_frame_lp =3D true,
>  };
>
>  static const struct of_device_id mtk_dsi_of_match[] =3D {
> --
> 2.45.2
>

