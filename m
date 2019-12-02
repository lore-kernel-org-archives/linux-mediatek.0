Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E03C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB2C720848
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:59:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t3ntvI2V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InHq5aiL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB2C720848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKVQEtqgZiKV1R44bCQ/jB2wwuwHyGlDx8ozwmDUFfE=; b=t3ntvI2Vc7ErZO
	8cf6X7wR6yDfvoK68WJmnzRy8Mr8/mrxdh7nwBd9sNiAaXWxOR+SvE9iv8qoEuSTDgjDCOe0tDzww
	zz8uPBgFHRrrIpqzm0sA2vCDtPrO7HnEgx3KLXfgCVQjnqJcRLdMk8yVyWl11QfVDfvamkd707gfo
	ONNTVHKNgqsgsFB8SVCWISMESvfLxVPimSyI3HyE5XTkw22RXw79Q4M7JKjycX1LiVDx4m+Brtcu0
	m0dRLe0C2Efjcld6Q1khDSDxAG6+C4KJv0e7DbXIwTRmph43S62C3bf//AskNJKVEZGUEhUJAoJkG
	Qpj1AfDE8zJ4LglVuFMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrrH-0001n5-E5; Mon, 02 Dec 2019 19:59:47 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrrD-0001li-VY; Mon, 02 Dec 2019 19:59:45 +0000
Received: by mail-il1-x143.google.com with SMTP id w13so886503ilo.1;
 Mon, 02 Dec 2019 11:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/1GIiVAt9IkBpoZ9Uj4zenbh/EnV7XYXqjcP5Gkayek=;
 b=InHq5aiL3hR9tFDnhuqx6aayq30VOPnHw69PCMZh0fSzKM55HtwqVJl0b4YhHu7o0S
 +vKSRzTuJwrb/lXpHGExaIBaelO+6e1no2J7UB2BWeJc2O8zSrV6zrjf11Joenv7+K+O
 bIOK66rwnalFLRsaiCMoP1L5Q+Gri2cgksvOUQua6x2NZ9JNO0modjT5LhxhvqbmC8dc
 2FZZWCxZ4UxsFPSHkDVN45m1Rxjv8DMuTLQZdROk5eqrpDHYKSl4SPzzPtiTLnQvNG4L
 Gdc25pYlvp0qSQqCaGqVXUgLhtnumBY8uup6p7tMk8yK2DpH0DcOK17AODcn1FefgjKv
 oLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/1GIiVAt9IkBpoZ9Uj4zenbh/EnV7XYXqjcP5Gkayek=;
 b=q+hO3jzAUPXrexqIFoFOJMuCDVrKsXsOwEApr79wxzos+xjyTV2zZobjwt2yCQINDl
 USckEEkCVGNiH++rzB6fylOepLWebIw8HRgD+wpjgPk9+pkgDZgrylchBwQPUCUNK2iD
 GpvWoYu7AOixTBzpN6WKlHkP9IOqUST+4ccRILUHnwrUgENS93sQ3rG9UhEwfUKqHZQw
 QSyk5zCNosec5PvaM4TmJgfgPVocn/hPoFN5HUASy/QG9MaNrDGhDxBiCH2zJ+pVGwUN
 vr/fqixKZhmki7UGHGfL0Vi+XFIS8vbiJIsEHz+yDavvayS9Nv/uyQQQ5PeGgfSWh3TW
 m68w==
X-Gm-Message-State: APjAAAXeivuTcXrFyLDRIGodBDPNnSkNDvwA4rUCYQfqw78Y++FNrkpo
 aiFVbs8cqtsYuBhIwIhhA+UIjlk/hUyLgXFp5Po=
X-Google-Smtp-Source: APXvYqx6YUMOUm+z16ig9xldwuTeM19+Bd22B3aBAblOLhFaOGglg7N1XrSehMoTWzvuuSea3OH9TLlXRGuqdFXhTE0=
X-Received: by 2002:a92:4891:: with SMTP id j17mr565262ilg.33.1575316780879;
 Mon, 02 Dec 2019 11:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 2 Dec 2019 12:59:29 -0700
Message-ID: <CAOCk7NoKPoxcETLYQ4CyAtYGnPwvYapdSavZM=aRdswDydTLEA@mail.gmail.com>
Subject: Re: [PATCH v1 0/26] drm/panel infrastructure + backlight update
To: Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_115944_020011_0AA751B6 
X-CRM114-Status: GOOD (  19.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 2, 2019 at 12:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> This patchset include a couple of different
> things - all related to panels.
>
> - The panel callbacks are optional - so drop error if
>   callback is not present.
>
> - Add support for backlight in drm_panel.
>   This allows us to make much simpler backlight
>   support to most panels.
>   The patchset include conversion of most of the
>   trivial cases.
>
> - Drop drm_connector from drm_panel.
>   This change required many changes to most
>   panels and many bridges and display drivers.
>   This is by far the most invasive change in this patchset.
>
> - Drop the unused get_timings() callback.
>   No users, so no need to keep it around.
>
> With this patchset drm_panel_(attach|detach) are nop's
> but they are kept for now.
>
> A few of these patches has been sent out before - but versioning
> started again from v1 - as the most patches are new.
>
> I have tested the panel-simple changes, and thus some
> of the infrastructure changes.
> The testing was done on an earlier iteration - and I ended
> up submitting this as Laurent and others started to depend on it.
> Jitao has a patch to add more callbacks, and I wanted the
> simplification of the callbacks before we add more callbacks.
>
>         Sam
>
>
> Sam Ravnborg (26):
>       drm/drm_panel: no error when no callback
>       drm/panel: add backlight support
>       drm/panel: simple: use drm_panel backlight support
>       drm: get drm_bridge_panel connector via helper
>       drm/panel: add drm_connector argument to get_modes()
>       drm/panel: decouple connector from drm_panel
>       drm/panel: remove get_timings
>       drm/panel: drop drm_device from drm_panel
>       drm/panel: feiyang-fy07024di26a30d: use drm_panel backlight support
>       drm/panel: ilitek-ili9881c: use drm_panel backlight support
>       drm/panel: innolux-p079zca: use drm_panel backlight support
>       drm/panel: kingdisplay-kd097d04: use drm_panel backlight support
>       drm/panel: lvds: use drm_panel backlight support
>       drm/panel: olimex-lcd-olinuxino: use drm_panel backlight support
>       drm/panel: osd-osd101t2587-53ts: use drm_panel backlight support
>       drm/panel: panasonic-vvx10f034n00: use drm_panel backlight support
>       drm/panel: raydium-rm68200: use drm_panel backlight support
>       drm/panel: rocktech-jh057n00900: use drm_panel backlight support
>       drm/panel: ronbo-rb070d30: use drm_panel backlight support
>       drm/panel: seiko-43wvf1g: use drm_panel backlight support
>       drm/panel: sharp-lq101r1sx01: use drm_panel backlight support
>       drm/panel: sharp-ls043t1le01: use drm_panel backlight support
>       drm/panel: sitronix-st7701: use drm_panel backlight support
>       drm/panel: sitronix-st7789v: use drm_panel backlight support
>       drm/panel: tpo-td028ttec1: use drm_panel backlight support
>       drm/panel: tpo-tpg110: use drm_panel backlight support
>
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |   2 +-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |   2 +-
>  drivers/gpu/drm/bridge/panel.c                     |  18 +++-
>  drivers/gpu/drm/bridge/parade-ps8622.c             |   2 +-
>  drivers/gpu/drm/bridge/tc358764.c                  |   2 +-
>  drivers/gpu/drm/bridge/tc358767.c                  |   2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c              |   2 +-
>  drivers/gpu/drm/drm_panel.c                        |  96 ++++++++++++++----
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c            |   2 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   2 +-
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |   2 +-
>  drivers/gpu/drm/imx/imx-ldb.c                      |   2 +-
>  drivers/gpu/drm/imx/parallel-display.c             |   2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |   2 +-
>  .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |   2 +-
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              |   2 +-

How come the diff stat in the cover letter here indicates a change to
this file, yet I cannot find a change to this file in any of the
patches?  What am I missing?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
