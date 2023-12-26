Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83E7C46CD4
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Dec 2023 10:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Qv4TX+Q3LNkRer/VYBfFYjaPXdCM6iONKvmb/cRKfE=; b=p9h3mOMXIfT+EwMZIx8ssJ+uLX
	MHIHPC4l/3oINgMJnAuP2OmbWZli5bDFFl+kuVSnQbwYoYyrMtGEIM0ttn+4sCv50G0YQ8e+c7PQa
	iDOSAL6FPgj1+ij8hRlMqQ+jY6lIev53LbBL3rTWfQgBK5+Ea+pBJXzhjQe4oYEJhzVfgZObme801
	OGJFThbWPyGvUOLtiMWPZHemiteR9lDhOnsHRUE4EsT3eLLR/rPcMeWxBUUCoptflZCmMV7SSsyGb
	DRzEeQXZJMpKWbyeWH3GheMIliDjGlD4a5Dwr5rsJKgStsyJRpxOWv59TiepVg/ZFGNuSN/i78RCD
	d5uO7W5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rI4zb-00C6Ld-2w;
	Tue, 26 Dec 2023 10:48:59 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rI4zY-00C6L1-1W
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Dec 2023 10:48:58 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-466f4be526bso326642137.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Dec 2023 02:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703587735; x=1704192535; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Qv4TX+Q3LNkRer/VYBfFYjaPXdCM6iONKvmb/cRKfE=;
        b=ahRztdpx9qWg5BuOmsYqr4d1R4DLqpe2f0ZCponAElzH/oP+fyjxsz78qaywVrwnIi
         6p5O7jgaZssu68JIYSqXkA32LHuivj2ZAEuG6I406iV4P8yl6e/GehZjZU1MxPYPLmBa
         xcD3SVWyUNLoSqgEZ3ypZGYV3twg9JKE9Gda4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703587735; x=1704192535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Qv4TX+Q3LNkRer/VYBfFYjaPXdCM6iONKvmb/cRKfE=;
        b=HEC3z8u8pTF1Uj1a7YLCGnmmPyrwqiq/4JOgyH5HG7ChEAxXDt2w8ioh8Dx4CEex8l
         +tl45JwF1n0Ns00x6MyqIELTa4OTorIk5BRlGRiMNggAWr2WLQsAB4VtsnhL4Bh1aBtT
         OSYoWOQ/kpm1S6YPyby8nPzx/a+VAKbJReHqMeOqTrhPnk3If3vOLpdTKrHmgsrjxPDZ
         jpTnFEsK2xxQBbjzsZ/PPDm+anI+UeF9gzURbTFqvJDtltHgrWcev2UAOOKU7iD3oCT3
         UYo5zT2T+cxKBBNWia53T7dayBh8RAoMDA8rTIymCsMCJbrvzUy46AvB/qkxHrNfmGHi
         bFzw==
X-Gm-Message-State: AOJu0YxUw9XGWRBAAPoiM37HyvV22+DroExRJQwbn61IXl/JKXj+/CVb
	dFwr7cW2gf/V08XeO7CXigXkh+R9OF0qObCgLl+6Od6uPw==
X-Google-Smtp-Source: AGHT+IFwl4i0toWsZahyCkXHxhp1+/rd/orx4WypYl6ecLoFCGvWAOJ9gh7sRxp/4Gavu3oE7UU0QQ==
X-Received: by 2002:a05:6122:10fa:b0:4b6:d63c:ca8f with SMTP id m26-20020a05612210fa00b004b6d63cca8fmr1291814vko.16.1703587734968;
        Tue, 26 Dec 2023 02:48:54 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id c13-20020ac5ca0d000000b004b73998e344sm52208vkm.40.2023.12.26.02.48.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Dec 2023 02:48:54 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-46705557756so193622137.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Dec 2023 02:48:54 -0800 (PST)
X-Received: by 2002:a05:6122:4089:b0:4b6:cdd2:b553 with SMTP id
 cb9-20020a056122408900b004b6cdd2b553mr1074016vkb.13.1703587734078; Tue, 26
 Dec 2023 02:48:54 -0800 (PST)
MIME-Version: 1.0
References: <20231220135722.192080-1-angelogioacchino.delregno@collabora.com> <20231220135722.192080-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231220135722.192080-3-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 26 Dec 2023 18:48:18 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhNfyEWKaJZjb_G-pXpxSpXvNQd2EMJUzWWwxmC+TzSaA@mail.gmail.com>
Message-ID: <CAC=S1nhNfyEWKaJZjb_G-pXpxSpXvNQd2EMJUzWWwxmC+TzSaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_024856_531849_088E6879 
X-CRM114-Status: GOOD (  22.14  )
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

Hi Angelo,

On Wed, Dec 20, 2023 at 9:57=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Function mtk_dsi_ps_control() is a subset of mtk_dsi_ps_control_vact():
> merge the two in one mtk_dsi_ps_control() function by adding one
> function parameter `config_vact` which, when true, writes the VACT
> related registers.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 76 +++++++++---------------------
>  1 file changed, 23 insertions(+), 53 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 23d2c5be8dbb..b618e2e31022 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -352,40 +352,6 @@ static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
>         mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
>  }
>
> -static void mtk_dsi_ps_control_vact(struct mtk_dsi *dsi)
> -{
> -       struct videomode *vm =3D &dsi->vm;
> -       u32 dsi_buf_bpp, ps_wc;
> -       u32 ps_bpp_mode;
> -
> -       if (dsi->format =3D=3D MIPI_DSI_FMT_RGB565)
> -               dsi_buf_bpp =3D 2;
> -       else
> -               dsi_buf_bpp =3D 3;
> -
> -       ps_wc =3D vm->hactive * dsi_buf_bpp;
> -       ps_bpp_mode =3D ps_wc;
> -
> -       switch (dsi->format) {
> -       case MIPI_DSI_FMT_RGB888:
> -               ps_bpp_mode |=3D PACKED_PS_24BIT_RGB888;
> -               break;
> -       case MIPI_DSI_FMT_RGB666:
> -               ps_bpp_mode |=3D PACKED_PS_18BIT_RGB666;
> -               break;
> -       case MIPI_DSI_FMT_RGB666_PACKED:
> -               ps_bpp_mode |=3D LOOSELY_PS_18BIT_RGB666;
> -               break;
> -       case MIPI_DSI_FMT_RGB565:
> -               ps_bpp_mode |=3D PACKED_PS_16BIT_RGB565;
> -               break;
> -       }
> -
> -       writel(vm->vactive, dsi->regs + DSI_VACT_NL);
> -       writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
> -       writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
> -}
> -
>  static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>  {
>         u32 tmp_reg;
> @@ -417,36 +383,40 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *ds=
i)
>         writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
>  }
>
> -static void mtk_dsi_ps_control(struct mtk_dsi *dsi)
> +static void mtk_dsi_ps_control(struct mtk_dsi *dsi, bool config_vact)
>  {
> -       u32 dsi_tmp_buf_bpp;
> -       u32 tmp_reg;
> +       struct videomode *vm =3D &dsi->vm;
> +       u32 dsi_buf_bpp, ps_wc;
> +       u32 ps_bpp_mode;
> +
> +       if (dsi->format =3D=3D MIPI_DSI_FMT_RGB565)
> +               dsi_buf_bpp =3D 2;
> +       else
> +               dsi_buf_bpp =3D 3;

The same is also in mtk_dsi_config_vdo_timing(). Given this is a
cleanup series, I think it'd be a good chance to add another patch
and integrate those usages. Just a thought.  :)
>
> +
> +       ps_wc =3D vm->hactive * dsi_buf_bpp;

I noticed the "& DSI_PS_WC" part was dropped (but perhaps with awareness?).

While the outcome seems to always fall within the range of
DSI_PS_WC so we should be fine in practice, I think it doesn't hurt to
keep the value masked to save readers some time to check if this would
ever be possible to overflow and write undesired bits down the line.
WDYT?

Regardless of that, I didn't find obvious issue in this patch, so

Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei




>
> +       ps_bpp_mode =3D ps_wc;
>
>         switch (dsi->format) {
>         case MIPI_DSI_FMT_RGB888:
> -               tmp_reg =3D PACKED_PS_24BIT_RGB888;
> -               dsi_tmp_buf_bpp =3D 3;
> +               ps_bpp_mode |=3D PACKED_PS_24BIT_RGB888;
>                 break;
>         case MIPI_DSI_FMT_RGB666:
> -               tmp_reg =3D LOOSELY_PS_18BIT_RGB666;
> -               dsi_tmp_buf_bpp =3D 3;
> +               ps_bpp_mode |=3D PACKED_PS_18BIT_RGB666;
>                 break;
>         case MIPI_DSI_FMT_RGB666_PACKED:
> -               tmp_reg =3D PACKED_PS_18BIT_RGB666;
> -               dsi_tmp_buf_bpp =3D 3;
> +               ps_bpp_mode |=3D LOOSELY_PS_18BIT_RGB666;
>                 break;
>         case MIPI_DSI_FMT_RGB565:
> -               tmp_reg =3D PACKED_PS_16BIT_RGB565;
> -               dsi_tmp_buf_bpp =3D 2;
> -               break;
> -       default:
>
> -               tmp_reg =3D PACKED_PS_24BIT_RGB888;
> -               dsi_tmp_buf_bpp =3D 3;
> +               ps_bpp_mode |=3D PACKED_PS_16BIT_RGB565;
>                 break;
>         }
>
> -       tmp_reg +=3D dsi->vm.hactive * dsi_tmp_buf_bpp & DSI_PS_WC;
>
> -       writel(tmp_reg, dsi->regs + DSI_PSCTRL);
> +       if (config_vact) {
> +               writel(vm->vactive, dsi->regs + DSI_VACT_NL);
> +               writel(ps_wc, dsi->regs + DSI_HSTX_CKL_WC);
> +       }
> +       writel(ps_bpp_mode, dsi->regs + DSI_PSCTRL);
>  }
>
>  static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> @@ -522,7 +492,7 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi =
*dsi)
>         writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
>         writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
>
> -       mtk_dsi_ps_control(dsi);
> +       mtk_dsi_ps_control(dsi, false);
>  }
>
>  static void mtk_dsi_start(struct mtk_dsi *dsi)
> @@ -667,7 +637,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>         mtk_dsi_reset_engine(dsi);
>         mtk_dsi_phy_timconfig(dsi);
>
> -       mtk_dsi_ps_control_vact(dsi);
> +       mtk_dsi_ps_control(dsi, true);
>         mtk_dsi_set_vm_cmd(dsi);
>         mtk_dsi_config_vdo_timing(dsi);
>         mtk_dsi_set_interrupt_enable(dsi);
> --
> 2.43.0
>
>

