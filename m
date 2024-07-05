Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB86C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 09:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pT1UJ9N3pWzvcPQR7JsfhGRn7Rk+YcR2gwQuDIMWvfo=; b=QKieDru7oD0PMILhkB95zpMSa6
	AnXGg6hULNnNFiOfFYC82f30brRKkcAibCHwC+EV8ElZj6WomLwN6q1zJhh0JnVHEdOBTtlT6qspP
	qurOO5XHaIf2kB5l9ORRuINUaq6Hp1qpFlaEXi59i4fwwVS3trD3nca/aTH08BfmxBf5E9kHx2P9L
	gUOV8WqSM53UUljdXNjrzqwabJW+H5LsgB4P0sjnrvSDoOmVK9Cz/eRc27rkqfI+pvouPMsTRIYjA
	OHU8ueFlkSCK4DHv1gyr24Nri2m+6d0a1iFOHwa4Gx+4Ql8nQd4Gm2foQTGdBqYiplWIC90odaG3m
	2S7B0MTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfOl-0000000FTlT-3k1I;
	Fri, 05 Jul 2024 09:38:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfOi-0000000FTkB-1Ci2
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jul 2024 09:38:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-424f2b7385bso1513735e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Jul 2024 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1720172310; x=1720777110; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pT1UJ9N3pWzvcPQR7JsfhGRn7Rk+YcR2gwQuDIMWvfo=;
        b=SNCwG3nVoory9OhP5LS2Yoi/mgTFWsdTfnLJ8rIL66OemmzqL5fozNQTHR8gNgW3mX
         D8wcB3XKqHJl9g7cdDrZkjP1V9mTqsYqOAi0VsWhJ6JMbihHe4CBvnGDSd+oP3Fn35Kl
         aVgbR+gJ8oKfD96GkRMgTqORjqs/MJPO2eYHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720172310; x=1720777110;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pT1UJ9N3pWzvcPQR7JsfhGRn7Rk+YcR2gwQuDIMWvfo=;
        b=mld7ufVs2G1fbNiaODU1UrREBHpp+N326wZuRQGlpWAupxlkCZWXCTC5PCmE1hcPEZ
         mxV160MooeuljwD7YB11N+Zuwmso31cTLWwAzZj7DUUAIZ4C7tk5VFGV2M8KYzTHqSWw
         Qtcype0CdoYDzguPBU5s4o3Qb5i4fQ3f+LSjiot+BPKQhb1hBsONFdIx3eCFn6Qg3Mt8
         ExQLKvb40eRO0Ere+YqPbaMsAYb6zwpaLGrB5dj/HruPw/0dikf3zvjXgIK6EQ9FLjmZ
         ZGetC57qr5TGs0R2bU5VHWYPK0+GzmzaZkbYa0pfrC2Ncdpc5fRZ93H62uKisrkcDOSs
         /+9g==
X-Forwarded-Encrypted: i=1; AJvYcCWKTYJ1XibuoxwM0ikligxV6CGpQo/bW4vSSt6csn3iHm4xIRTEIqQtJlJJqBC3x3CKTAN9EMs9kIou8sKjs2+OCcHi7iR98qWcZaqQfB6wNw6m
X-Gm-Message-State: AOJu0YyFVt337bYso6ggGGlkbzOeuQPkgyiYXnWISgBpltjoEVFtDBrx
	hAv47CkR1u1YYV5k51+UKq7G8lO5XS6EUkP6V5bRdUa7Z9MduywXtHlUxe7PEPs=
X-Google-Smtp-Source: AGHT+IFr1VGyRFU/0u2pp78RWno1CY3Qil6jyjPg5NuX4Xxv2+lUICjs4JFYPgOwUWsfE6CcHi8F8g==
X-Received: by 2002:a5d:47a4:0:b0:367:916e:4215 with SMTP id ffacd0b85a97d-3679dd67d66mr2699242f8f.4.1720172310051;
        Fri, 05 Jul 2024 02:38:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3678fefc01dsm7099182f8f.26.2024.07.05.02.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:38:29 -0700 (PDT)
Date: Fri, 5 Jul 2024 11:38:27 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Hsiao Chien Sung <shawn.sung@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Michael Walle <mwalle@kernel.org>
Subject: Re: [GIT PULL] mediatek drm next for 6.11
Message-ID: <Zoe_E1eM7kb6rMsp@phenom.ffwll.local>
References: <20240628134632.28672-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240628134632.28672-1-chunkuang.hu@kernel.org>
X-Operating-System: Linux phenom 6.8.9-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_023832_353248_117EB70E 
X-CRM114-Status: GOOD (  20.03  )
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

On Fri, Jun 28, 2024 at 01:46:32PM +0000, Chun-Kuang Hu wrote:
> Hi, Dave & Daniel:
> 
> This includes:
> 
> 1. Convert to platform remove callback returning void
> 2. Drop chain_mode_fixup call in mode_valid()
> 3. Fixes the errors of MediaTek display driver found by IGT.
> 4. Add display support for the MT8365-EVK board
> 5. Fix bit depth overwritten for mtk_ovl_set bit_depth()
> 6. Remove less-than-zero comparison of an unsigned value
> 7. Call drm_atomic_helper_shutdown() at shutdown time
> 8. Log errors in probe with dev_err_probe()
> 9. Fix possible_crtcs calculation
> 10. Fix spurious kfree()
> 
> Regards,
> Chun-Kuang.
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.11
> 
> for you to fetch changes up to 8ad49a92cff4bab13eb2f2725243f5f31eff3f3b:
> 
>   drm/mediatek/dp: Fix spurious kfree() (2024-06-28 13:01:43 +0000)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> Mediatek DRM Next for Linux 6.11
> 
> 1. Convert to platform remove callback returning void
> 2. Drop chain_mode_fixup call in mode_valid()
> 3. Fixes the errors of MediaTek display driver found by IGT.
> 4. Add display support for the MT8365-EVK board
> 5. Fix bit depth overwritten for mtk_ovl_set bit_depth()
> 6. Remove less-than-zero comparison of an unsigned value
> 7. Call drm_atomic_helper_shutdown() at shutdown time
> 8. Log errors in probe with dev_err_probe()
> 9. Fix possible_crtcs calculation
> 10. Fix spurious kfree()
> 
> ----------------------------------------------------------------
> Alexandre Mergnat (9):
>       dt-bindings: display: mediatek: aal: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: ccorr: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: color: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: dither: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: dsi: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: dpi: add compatible for MT8365
>       dt-bindings: display: mediatek: gamma: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: ovl: add compatible for MT8365 SoC
>       dt-bindings: display: mediatek: rdma: add compatible for MT8365 SoC
> 
> Douglas Anderson (1):
>       drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time
> 
> Hsiao Chien Sung (15):
>       drm/mediatek: Add missing plane settings when async update
>       drm/mediatek: Use 8-bit alpha in ETHDR
>       drm/mediatek: Fix XRGB setting error in OVL
>       drm/mediatek: Fix XRGB setting error in Mixer
>       drm/mediatek: Fix destination alpha error in OVL
>       drm/mediatek: Turn off the layers with zero width or height
>       drm/mediatek: Add OVL compatible name for MT8195
>       drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
>       drm/mediatek: Add new color format MACROs in OVL
>       drm/mediatek: Set DRM mode configs accordingly
>       drm/mediatek: Support more 10bit formats in OVL
>       drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
>       drm/mediatek: Support DRM plane alpha in OVL
>       drm/mediatek: Support DRM plane alpha in Mixer
>       drm/mediatek: Remove less-than-zero comparison of an unsigned value
> 
> Jason-JH.Lin (1):
>       drm/mediatek: Fix bit depth overwritten for mtk_ovl_set bit_depth()
> 
> Michael Walle (2):
>       drm/mediatek: dpi/dsi: Fix possible_crtcs calculation
>       drm/mediatek/dp: Fix spurious kfree()
> 
> Nícolas F. R. A. Prado (1):
>       drm/mediatek: Log errors in probe with dev_err_probe()
> 
> Sam Ravnborg (1):
>       drm/mediatek: Drop chain_mode_fixup call in mode_valid()
> 
> Uwe Kleine-König (1):
>       drm/mediatek: Convert to platform remove callback returning void
> 
>  .../bindings/display/mediatek/mediatek,aal.yaml    |   1 +
>  .../bindings/display/mediatek/mediatek,ccorr.yaml  |   3 +
>  .../bindings/display/mediatek/mediatek,color.yaml  |   1 +
>  .../bindings/display/mediatek/mediatek,dither.yaml |   1 +
>  .../bindings/display/mediatek/mediatek,dpi.yaml    |   4 +
>  .../bindings/display/mediatek/mediatek,dsi.yaml    |   1 +
>  .../bindings/display/mediatek/mediatek,gamma.yaml  |   1 +
>  .../bindings/display/mediatek/mediatek,ovl.yaml    |   1 +
>  .../bindings/display/mediatek/mediatek,rdma.yaml   |   1 +
>  drivers/gpu/drm/mediatek/mtk_cec.c                 |  28 ++---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c            | 109 ++++++++++------
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h            |   8 +-
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c            |  18 ++-
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |  18 ++-
>  drivers/gpu/drm/mediatek/mtk_disp_color.c          |  18 ++-
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |  18 ++-
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c          |  25 ++--
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 140 +++++++++++++--------
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   6 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  31 ++---
>  drivers/gpu/drm/mediatek/mtk_dp.c                  |  18 +--
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 |   5 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  32 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   4 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |   5 +-
>  drivers/gpu/drm/mediatek/mtk_ethdr.c               |  46 ++++---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                |  42 ++-----
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |  21 ++--
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |  18 ++-
>  drivers/gpu/drm/mediatek/mtk_padding.c             |  25 ++--
>  drivers/gpu/drm/mediatek/mtk_plane.c               |   4 +-
>  31 files changed, 373 insertions(+), 280 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

