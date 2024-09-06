Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004C5CE7B1B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyrXtbzfkJ2qcMutIVumsIJniKM+4zkeN/47MqaDQFQ=; b=meHFcniJpvsi5uTeC5skrnU4MK
	EtD+htiyCnsh9BSGMHot6LBsQ+JjI4ctkbxlX/XSFrsaZyNAtDW2KGAkKYjxZXa8U9NFZEMrpIBty
	XGpXM5K5GNGZW/2Ex42yIXToHIzBDDTdL66b9ixFewYSeL6bnGGQ1g/Crdl33px1wZr6DElCr3J+y
	FK9iyMo7W5VHoXkyigIJIfp2re/A9y5kLBsSxgqI90xQ9Ssj5trlMcvjI5gEYQRP7aIkkW+UW59Kw
	9TzHgUY2xRJlxupFIZwXx1yIGzZ94PYQz76TCBNFzD45BefsyW+ihbeylkNKQvYE4vhCyORXvYhh5
	hDK6PAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZqJ-0000000CVzB-1z8b;
	Fri, 06 Sep 2024 14:21:43 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZpJ-0000000CVpG-2nMu
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Sep 2024 14:20:43 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2f753375394so7445611fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Sep 2024 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1725632440; x=1726237240; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyrXtbzfkJ2qcMutIVumsIJniKM+4zkeN/47MqaDQFQ=;
        b=QhLOqpeF7smvdSbvh8DxRTO1D4Wd/JWDlEE6OChChIBhjtzbpFTSLAzyIybMU2nznT
         akuBdfppNCwRUbp2XgEmYjLbiGUYOwAjvV4oZqbkD0F2y1HbmOC7IzWSNwXXyJ0Sv2tZ
         rNijdXtyX7qd3dDk1LYMVqS7yL33DDkJhybpxOy/S4Oo9Cgy5MZt5RFVlWQxOcocje4V
         8sSND3ZJjxUWm3nGwMA5paR+K3/cnJewf1UOWJq02p4HTtO26Z8RjaZHZJRopJlx9/li
         bRBTmq+v/1XYHavtWPqwlwhfVQCLgS8YY37rmgSb9GZHlE+whQwKaihacSJn0VOzIVeZ
         Kq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725632440; x=1726237240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyrXtbzfkJ2qcMutIVumsIJniKM+4zkeN/47MqaDQFQ=;
        b=Bw/cXDA5sv7cNvs0WoBZmLePwxfFXZbIAK4MXVS9xaPcjczFo6NytARMI6gso7sfZ2
         6Mzl5lnpgXTjFLzvQUy/Offy28rpK98ULlv6aYzj6H5VKEshAuvndrUdq1v9DSEB/IB8
         vKiBP4UVjZjQ/vRDp8OfBUR4pbQem7Syoc8UNni8Vv5IdOfhncMdpvkqg2hMJpwAVx6p
         feT5YuvW8lnw1Vosg8ugMYuAmz4oub0VVkKRkVYH0nv+vkyHILk11Dq6+G9OfWOgXDy9
         bMzi/l+md8hUTYNJ9B4R6Pb5RNEUhZwovwJ/YeYcp8LHNH5biDMOM0tFejTyUsyvliR5
         R6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8OmMBHBV1YEDp6WQ+GhkleqvvdnY5H9CN+gpmnJB9+OGeve/YcNcvpoJ1jnHzCnTahqoYCIaOmOLGPtq3yA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdBJt5PpbNdcOvgy9UnSI/AVGWSDs63WStzdWHJkGIdyApm1lo
	c/oQ5V8tAD+/j5kkto0c0lZgD3cax3NbgxDM1jOYmzfTayT/RyvcJ0aymvhiHoiBMkOrLyFWo42
	+gIdoW4Xzz2+p5lAN0U6nxmrSrI/lPMTyvCuSpw==
X-Google-Smtp-Source: AGHT+IHtrjIX9SiVNRlY+i3UMGuEvIPbzq+NyW1Z8vRRgxniTG/aS0jGvGsF6c1SbfkZ6JVW1koyRlbyba/UViBbpEs=
X-Received: by 2002:a2e:a587:0:b0:2f7:52c5:b67 with SMTP id
 38308e7fff4ca-2f752c50e4amr17556431fa.29.1725632439382; Fri, 06 Sep 2024
 07:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org> <20240506-tc358775-fix-powerup-v1-9-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-9-545dcf00b8dd@kernel.org>
From: Daniel Semkowicz <dse@thaumatec.com>
Date: Fri, 6 Sep 2024 16:20:28 +0200
Message-ID: <CAHgnY3=KCD4gyJ4nL6nN1tvWcsiRQL+Oz11RNOniDdyMoEPcSg@mail.gmail.com>
Subject: Re: [PATCH 09/20] drm/bridge: tc358775: remove complex vsdelay calculation
To: Michael Walle <mwalle@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Vinay Simha BN <simhavcs@gmail.com>, Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_072041_739370_5DE99D3A 
X-CRM114-Status: GOOD (  25.75  )
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

Hello Michael,

On Mon, May 6, 2024 at 3:35=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> To cite the datasheet on VSDELAY:
>   During DSI link speed is slower than that of LVDS link=E2=80=99s, data =
needs
>   to be buffer within 775XBG before outputting to prevent data from
>   underflow. Register field VPCTRL[VSDELAY] is used to for this purpose
>
> This driver assumes that the DSI link speed is the pixel clock (as does
> every DSI bridge driver), after all the LVDS clock is derived from the
> DSI clock. Thus we know for a fact, that the DSI link is not slower than
> the LVDS side. Just use the (sane) default value of the bridge and drop
> the complicated calculation here.

I am not convinced this is a good idea to revert to a default
VSdelay value. I tested your patch series with RK3399 platform
and default value (5) was not enough there. There was small data
underflow visible, resulting in display offset. Removing this patch
and using the original calculation formula fixed the problem.
The calculated VSDELAY value seems to be a lot bigger than required,
but keeps us on the safe side.

It looks that hback-porch value for panel is used also on DSI link,
effectively delaying hactive data delivered to TC358775 bridge.
I suspect this causes the requirement for higher VSDELAY.

>
> While at it, replace the TC358775_VPCTRL_MSF() and
> TC358775_VPCTRL_OPXLFMT() inline functions by the usual macros for a bit
> flag.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 49 +++++++--------------------------=
------
>  1 file changed, 8 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/t=
c358775.c
> index 54aea58a3406..a9d731e87970 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -109,7 +109,9 @@
>  #define RDPKTLN         0x0404  /* Command Read Packet Length */
>
>  #define VPCTRL          0x0450  /* Video Path Control */
> -#define EVTMODE                BIT(5)  /* Video event mode enable, tc358=
76x only */
> +#define VPCTRL_MSF     BIT(0)
> +#define VPCTRL_OPXLFMT BIT(8)
> +#define VPCTRL_EVTMODE BIT(5)  /* Video event mode enable, tc35876x only=
 */
>  #define HTIM1           0x0454  /* Horizontal Timing Control 1 */
>  #define HTIM2           0x0458  /* Horizontal Timing Control 2 */
>  #define VTIM1           0x045C  /* Vertical Timing Control 1 */
> @@ -187,30 +189,6 @@ enum {
>
>  #define L0EN BIT(1)
>
> -#define TC358775_VPCTRL_VSDELAY__MASK  0x3FF00000
> -#define TC358775_VPCTRL_VSDELAY__SHIFT 20
> -static inline u32 TC358775_VPCTRL_VSDELAY(uint32_t val)
> -{
> -       return ((val) << TC358775_VPCTRL_VSDELAY__SHIFT) &
> -                       TC358775_VPCTRL_VSDELAY__MASK;
> -}
> -
> -#define TC358775_VPCTRL_OPXLFMT__MASK  0x00000100
> -#define TC358775_VPCTRL_OPXLFMT__SHIFT 8
> -static inline u32 TC358775_VPCTRL_OPXLFMT(uint32_t val)
> -{
> -       return ((val) << TC358775_VPCTRL_OPXLFMT__SHIFT) &
> -                       TC358775_VPCTRL_OPXLFMT__MASK;
> -}
> -
> -#define TC358775_VPCTRL_MSF__MASK      0x00000001
> -#define TC358775_VPCTRL_MSF__SHIFT     0
> -static inline u32 TC358775_VPCTRL_MSF(uint32_t val)
> -{
> -       return ((val) << TC358775_VPCTRL_MSF__SHIFT) &
> -                       TC358775_VPCTRL_MSF__MASK;
> -}
> -
>  #define TC358775_LVCFG_PCLKDIV__MASK   0x000000f0
>  #define TC358775_LVCFG_PCLKDIV__SHIFT  4
>  static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
> @@ -350,7 +328,6 @@ static void tc_bridge_enable(struct drm_bridge *bridg=
e)
>         u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2=
;
>         u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2=
;
>         unsigned int val =3D 0;
> -       u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
>         struct drm_display_mode *mode;
>         struct drm_connector *connector =3D get_connector(bridge->encoder=
);
>
> @@ -398,27 +375,17 @@ static void tc_bridge_enable(struct drm_bridge *bri=
dge)
>
>         /* Video event mode vs pulse mode bit, does not exist for tc35877=
5 */
>         if (tc->type =3D=3D TC358765)
> -               val =3D EVTMODE;
> +               val =3D VPCTRL_EVTMODE;
>         else
>                 val =3D 0;
>
>         if (tc->bpc =3D=3D 8)
> -               val |=3D TC358775_VPCTRL_OPXLFMT(1);
> +               val |=3D VPCTRL_OPXLFMT;
>         else /* bpc =3D 6; */
> -               val |=3D TC358775_VPCTRL_MSF(1);
> -
> -       dsiclk =3D mode->crtc_clock * 3 * tc->bpc / tc->num_dsi_lanes / 1=
000;
> -       clkdiv =3D dsiclk / (tc->lvds_link =3D=3D DUAL_LINK ? DIVIDE_BY_6=
 : DIVIDE_BY_3);
> -       byteclk =3D dsiclk / 4;
> -       t1 =3D hactive * (tc->bpc * 3 / 8) / tc->num_dsi_lanes;
> -       t2 =3D ((100000 / clkdiv)) * (hactive + hback_porch + hsync_len +=
 hfront_porch) / 1000;
> -       t3 =3D ((t2 * byteclk) / 100) - (hactive * (tc->bpc * 3 / 8) /
> -               tc->num_dsi_lanes);
> -
> -       vsdelay =3D (clkdiv * (t1 + t3) / byteclk) - hback_porch - hsync_=
len - hactive;
> +               val |=3D VPCTRL_MSF;
>
> -       val |=3D TC358775_VPCTRL_VSDELAY(vsdelay);
> -       regmap_write(tc->regmap, VPCTRL, val);
> +       regmap_update_bits(tc->regmap, VPCTRL, val,
> +                          VPCTRL_OPXLFMT | VPCTRL_MSF | VPCTRL_EVTMODE);
>
>         regmap_write(tc->regmap, HTIM1, htime1);
>         regmap_write(tc->regmap, VTIM1, vtime1);
>
> --
> 2.39.2
>

Kind regards
Daniel

