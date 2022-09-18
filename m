Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3C7C6FA86
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 04:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kd0YDX+z6kyCey+UZ/+Z3wH+hVCPLwSMIFiVa1GENDY=; b=3xT99irjuTk1YfHUz+TBmq7pYp
	mpoxovuBrxdTIEACDDZ+0Z9qC5NC48RPwG23MtYQKGBpdUrsMPG8qGusYpeTVfxQed8X/Uw3dR6ma
	oQ6RSpSpcrit1GStbyUTYd6lffgoBV5AJ7BmBMOcJ19hWKUSXTWNDJnYgWcZlmZ0M0bvx1A3230Im
	TC+wHmVBvVJTv/7sYEr1xNcTIX73S2jvKR6v26VCqXzE96lV2z2ih4zqZXwK96C8jSWDQimxXSGwp
	i7bs1qrpupVvHhIcBu1I/LBQ/SS2jxE9C0cKeKhc3AA4KBZam4uTxOIItpZDn3Uz3SDAaapCX431+
	65Y70Jhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZmCI-00CKh6-Bk; Sun, 18 Sep 2022 04:46:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZmC7-00CKcE-Jz; Sun, 18 Sep 2022 04:46:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 20A94B80E65;
	Sun, 18 Sep 2022 04:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF06DC433B5;
	Sun, 18 Sep 2022 04:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663476371;
	bh=2cPWZw4w/TcwHuccfk+B15vjuXnxQzPuyQKi2rCoie0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Js5mz3WtPUU2a795Pe7XCKIB04sgNrJ7DbAaLMA943uH4KnctsgGKQhOHKH8SGE+V
	 z+ds2S3/zOpbOtPxcS2PjjvRK36y0dFG9juWy/pmVucEE1qIjG6n8woedrJPzyzz98
	 sxf7yIeVDtRACu+mv4dNrpFX39JnbcymuJ46ooME5gqcadolNTMBK1apYnLjZgUXMZ
	 IqDT2VFfZ/bG0qCXC44KVZ/vmVHbo3UW985b469LKKyfXimEmeXpLaLcZWkJsANhDM
	 NlHE/XQicbSEMGu0okjx7m4at2dcuV/0axiFahaUodGbsMZ+U+RdRgTcJgodq/4Ma7
	 aJCt9RqqqW+Rw==
Received: by mail-ot1-f49.google.com with SMTP id r22-20020a9d7516000000b00659ef017e34so2143514otk.13;
        Sat, 17 Sep 2022 21:46:11 -0700 (PDT)
X-Gm-Message-State: ACrzQf3dcoLlwwAmR+LTWQhWG8a6dkM7o2ZLeBsp+Uzai5XxDPxjLYsT
	uUtx3BlP1w7cB24cZmo4CoZRtKDOXAyVfOpSNQ==
X-Google-Smtp-Source: AMsMyM7/TsTtrCgUFQOzPlvUTK3GwzyR6pNA0COoL5bCBOBVU9WveDfz/EdrwyaGicMBNy06OK3Aq1t/NrfkyGM4cVw=
X-Received: by 2002:a05:6830:2781:b0:65a:4e1:b3d2 with SMTP id
 x1-20020a056830278100b0065a04e1b3d2mr366184otu.77.1663476370828; Sat, 17 Sep
 2022 21:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org> <20220717174454.46616-4-sam@ravnborg.org>
In-Reply-To: <20220717174454.46616-4-sam@ravnborg.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 12:45:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Yo4Kx+UaRQSGcqHtA6hMBvFUUwHe6-vQX4Vt5nBJb+A@mail.gmail.com>
Message-ID: <CAAOTY_9Yo4Kx+UaRQSGcqHtA6hMBvFUUwHe6-vQX4Vt5nBJb+A@mail.gmail.com>
Subject: Re: [PATCH v1 03/12] drm/mediatek: Drop chain_mode_fixup call in mode_valid()
To: Sam Ravnborg <sam@ravnborg.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Benson Leung <bleung@chromium.org>, Cai Huoqing <cai.huoqing@linux.dev>, 
	chrome-platform@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@linux.ie>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
	Guenter Roeck <groeck@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-renesas-soc@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Philip Chen <philipchen@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_214615_975165_6BE7DA76 
X-CRM114-Status: GOOD (  25.55  )
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

Hi, Sam:

Sam Ravnborg <sam@ravnborg.org> =E6=96=BC 2022=E5=B9=B47=E6=9C=8818=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E5=87=8C=E6=99=A81:45=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The mode_valid implementation had a call to
> drm_bridge_chain_mode_fixup() which would be wrong as the mode_valid is
> not allowed to change anything - only to validate the mode.
>
> As the next bridge is often/always a connector the call had no effect
> anyway. So drop it.
>
> From the git history I could see this call was included in the original
> version of the driver so there was no help there to find out why it was
> added in the first place. But a lot has changed since the initial driver
> were added and is seems safe to remove the call now.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 3196189429bc..a63b76055f81 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1208,22 +1208,11 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_=
bridge *bridge,
>                                       const struct drm_display_mode *mode=
)
>  {
>         struct mtk_hdmi *hdmi =3D hdmi_ctx_from_bridge(bridge);
> -       struct drm_bridge *next_bridge;
>
>         dev_dbg(hdmi->dev, "xres=3D%d, yres=3D%d, refresh=3D%d, intl=3D%d=
 clock=3D%d\n",
>                 mode->hdisplay, mode->vdisplay, drm_mode_vrefresh(mode),
>                 !!(mode->flags & DRM_MODE_FLAG_INTERLACE), mode->clock * =
1000);
>
> -       next_bridge =3D drm_bridge_get_next_bridge(&hdmi->bridge);
> -       if (next_bridge) {
> -               struct drm_display_mode adjusted_mode;
> -
> -               drm_mode_copy(&adjusted_mode, mode);
> -               if (!drm_bridge_chain_mode_fixup(next_bridge, mode,
> -                                                &adjusted_mode))
> -                       return MODE_BAD;
> -       }
> -
>         if (hdmi->conf) {
>                 if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mod=
e))
>                         return MODE_BAD;
> --
> 2.34.1
>

