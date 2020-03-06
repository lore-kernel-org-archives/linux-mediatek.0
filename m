Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A602C10DCE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 10:57:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B36720726
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 10:57:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tbqYcLFt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="d2qudtTv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B36720726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hMqbKp93zM5diOpgNZwpPjggWyX8Nc3WxKGj9qEMoI=; b=tbqYcLFtjPUktv
	jxhXPk52Mri7STQFjzxT/koIcwqMluXYYKD4MPEabnhsppfFZNaPI5w9Acx3fZcIFuYWMX1hdv+to
	ReAa72BTNo4inNLpRaHrmINGVPIL3JswgmZw0vDr2uFXNsvROCyj13hyV6DyZxHeI9LF6c7Cq4MWQ
	Ihftj33qfqtiMGcJZT1sFkItobBtLvJU2Rfg5RPP5b0Jd9uJ3XaCQsuZPF7+OUwKd0OF9g5p+y7Mq
	THihdwJDMpG+dkRKYW8yOP0IGfxahBHDTrJEjrMNdQsbs9hid15w5iE9QteRZH+7FuX3f8+N6n+dW
	y6N42rYnWFy8dWRL4wrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAAfE-00028S-7c; Fri, 06 Mar 2020 10:57:08 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAAfA-000275-KO
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 10:57:06 +0000
Received: by mail-wm1-x342.google.com with SMTP id a141so1885273wme.2
 for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2020 02:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7rrE7Mh/VC4v8EhKmWswWSWB2baVjxpmAL/nTxqthaY=;
 b=d2qudtTvQazENZdB0E1Ugs4TiEWdjEh+sF5HkI/qMuAz1lhVxP+7jJ7IMt5HaphPzP
 5DxLj/MhLkdg2wPief+M95Xgo8kLO0XxU7PsK0Ih/1XNOcaBx0JTPt14bGOTe9dw2/L/
 v80v+GtgQ0pM22uXV5txDnK85ki9Af31ZRI+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7rrE7Mh/VC4v8EhKmWswWSWB2baVjxpmAL/nTxqthaY=;
 b=FdBZNRN5V1qDtIRWuivjbrYG50s2fBv6m+l2BlG6g7M02AgBzEb0HhISdb47rYJrIL
 Fg6M9J9L9nP87nJwo8t1l9pjjetfabF0Gbp/3CpQl9w3+ZugUHPfT8fOwgJVnRAXKcJi
 xqPOGgL+eZCMkvJMyq/ZUG+r3fYn62/CEUz1Bj8hWuOwVjwSKPJ9UQDzNUHpA9hk1PRt
 pEu0gBFKYfT71PsK+S2fMU16715QoknvqYVtifNHvQHti22eflsMDz8UiQiS41rr63SJ
 nNcasFr/xSUTZPVgYji9TNjepd6okWbaOcv1fNDucyVXFNYuABAMd4e5PlRprDT/ethd
 Ix/w==
X-Gm-Message-State: ANhLgQ2T3k5pBLzhf2vVUeoERB3V/oC+PrLUjWTt2NNM6nR0i8clCSKH
 o359lmVvjY7UgaLU96yf31r/xA==
X-Google-Smtp-Source: ADFU+vu8MQamXRdd0QBPum9kh+cSyHKPSAUhm+lD5hy3LLs4xarlv6b6xFmutidwsLBLwmFf5dsvQw==
X-Received: by 2002:a1c:bd45:: with SMTP id n66mr3312185wmf.167.1583492223205; 
 Fri, 06 Mar 2020 02:57:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e7sm28718865wrt.70.2020.03.06.02.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 02:57:01 -0800 (PST)
Date: Fri, 6 Mar 2020 11:56:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/22] drm: Convert drivers to drm_simple_encoder_init()
Message-ID: <20200306105659.GY2363188@phenom.ffwll.local>
References: <20200305155950.2705-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305155950.2705-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_025704_672799_02751BDD 
X-CRM114-Status: GOOD (  16.10  )
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
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, heiko@sntech.de,
 airlied@linux.ie, stefan@agner.ch, linux@armlinux.org.uk, paul@crapouillou.net,
 eric@anholt.net, thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 sebastian.reichel@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, hjc@rock-chips.com, festevam@gmail.com,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com,
 patrik.r.jakobsson@gmail.com, jonathanh@nvidia.com, xinliang.liu@linaro.org,
 ludovic.desroches@microchip.com, kgene@kernel.org, linux-imx@nxp.com,
 ck.hu@mediatek.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 p.zabel@pengutronix.de, puck.chen@hisilicon.com, s.hauer@pengutronix.de,
 alison.wang@nxp.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, john.stultz@linaro.org, jsarha@ti.com,
 matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
 jernej.skrabec@siol.net, kraxel@redhat.com, rodrigosiqueiramelo@gmail.com,
 tomi.valkeinen@ti.com, bbrezillon@kernel.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, sw0312.kim@samsung.com,
 nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, daniel@ffwll.ch,
 zourongrong@gmail.com, linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 05, 2020 at 04:59:28PM +0100, Thomas Zimmermann wrote:
> A call to drm_simple_encoder_init() initializes an encoder without
> further functionality. It only provides the destroy callback to
> cleanup the encoder's state. Only few drivers implement more
> sophisticated encoders than that. Most drivers implement such a
> simple encoder and can use drm_simple_encoder_init() instead.
> 
> The patchset converts drivers where the encoder's instance is
> embedded in a larger data structure. The driver releases the
> memory during cleanup. Each patch replaces drm_encoder_init() with
> drm_simple_encoder_init() and removes the (now unused) driver's
> encoder functions.
> 
> While the patchset is fairly large, the indiviual patches are self-
> contained and can be merged independently from each other. The
> simple-encoder functionality is currently in drm-misc-next, where
> these patches could go as well.
> 
> Future directions: There's another common case where the driver
> calls kzalloc() plus drm_encoder_init(). Such drivers are not
> handled by this patchset. The plan here is to use a simple encoder
> with either managed memory allocation (once it's merged), or embed
> the encoder in a larger data structure and drop kzalloc() entirely.
> 
> The patchset has been compile-tested on x86-64, aarch64 and arm.

So from a cursory look all these drivers get it wrong and devm_kzalloc
their encoders. But I guess simplifying stuff like you do here will at
least give us a nice list of things to look at once we get to the
drmm_simple_encoder_init version of all this. On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Thomas Zimmermann (22):
>   drm/arc: Use simple encoder
>   drm/atmel-hlcdc: Use simple encoder
>   drm/exynos: Use simple encoder
>   drm/fsl-dcu: Use simple encoder
>   drm/gma500: Use simple encoder
>   drm/hisilicon/kirin: Use simple encoder
>   drm/i2c/tda998x: Use simple encoder
>   drm/imx: Use simple encoder
>   drm/ingenic: Use simple encoder
>   drm/mediatek: Use simple encoder
>   drm/rcar-du: Use simple encoder
>   drm/rockchip: Use simple encoder
>   drm/shmobile: Use simple encoder
>   drm/sun4i: Use simple encoder
>   drm/tegra: Use simple encoder
>   drm/tidss: Use simple encoder
>   drm/tilcdc: Use simple encoder
>   drm/vc4: Use simple encoder
>   drm/virtgpu: Use simple encoder
>   drm/vkms: Use simple encoder
>   drm/writeback: Use simple encoder
>   drm/zte: Use simple encoder
> 
>  drivers/gpu/drm/arc/arcpgu_hdmi.c              | 10 +++-------
>  drivers/gpu/drm/arc/arcpgu_sim.c               |  8 ++------
>  .../gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   | 12 ++++--------
>  drivers/gpu/drm/drm_writeback.c                | 10 +++-------
>  drivers/gpu/drm/exynos/exynos_dp.c             |  8 ++------
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c        |  8 ++------
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c        |  8 ++------
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c       |  8 ++------
>  drivers/gpu/drm/exynos/exynos_hdmi.c           |  8 ++------
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c      | 14 +++-----------
>  drivers/gpu/drm/gma500/cdv_intel_crt.c         | 14 +++-----------
>  drivers/gpu/drm/gma500/cdv_intel_dp.c          | 16 +++-------------
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c        |  4 ++--
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c        | 17 +++--------------
>  drivers/gpu/drm/gma500/mdfld_dsi_dpi.c         |  7 +++----
>  drivers/gpu/drm/gma500/mdfld_output.h          |  1 -
>  drivers/gpu/drm/gma500/mdfld_tmd_vid.c         |  6 ------
>  drivers/gpu/drm/gma500/mdfld_tpo_vid.c         |  6 ------
>  drivers/gpu/drm/gma500/oaktrail_hdmi.c         | 14 ++------------
>  drivers/gpu/drm/gma500/oaktrail_lvds.c         |  5 +++--
>  drivers/gpu/drm/gma500/psb_intel_drv.h         |  1 -
>  drivers/gpu/drm/gma500/psb_intel_lvds.c        | 18 +++---------------
>  drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c     |  5 -----
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c   |  8 ++------
>  drivers/gpu/drm/i2c/tda998x_drv.c              | 14 +++-----------
>  drivers/gpu/drm/imx/dw_hdmi-imx.c              |  8 ++------
>  drivers/gpu/drm/imx/imx-drm-core.c             |  6 ------
>  drivers/gpu/drm/imx/imx-drm.h                  |  1 -
>  drivers/gpu/drm/imx/imx-ldb.c                  |  8 ++------
>  drivers/gpu/drm/imx/imx-tve.c                  |  8 ++------
>  drivers/gpu/drm/imx/parallel-display.c         |  8 ++------
>  drivers/gpu/drm/ingenic/ingenic-drm.c          |  9 +++------
>  drivers/gpu/drm/mediatek/mtk_dpi.c             | 14 +++-----------
>  drivers/gpu/drm/mediatek/mtk_dsi.c             | 14 +++-----------
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c      | 14 +++-----------
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c    |  9 +++------
>  drivers/gpu/drm/rockchip/cdn-dp-core.c         |  9 +++------
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    |  8 ++------
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c    |  8 ++------
>  drivers/gpu/drm/rockchip/inno_hdmi.c           |  8 ++------
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c         |  8 ++------
>  drivers/gpu/drm/rockchip/rockchip_lvds.c       | 10 +++-------
>  drivers/gpu/drm/rockchip/rockchip_rgb.c        |  8 ++------
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c      | 14 +++-----------
>  drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c         | 12 +++---------
>  drivers/gpu/drm/sun4i/sun4i_lvds.c             | 12 +++---------
>  drivers/gpu/drm/sun4i/sun4i_rgb.c              | 17 +++--------------
>  drivers/gpu/drm/sun4i/sun4i_tv.c               | 17 +++--------------
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c         | 12 +++---------
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c          |  8 ++------
>  drivers/gpu/drm/tegra/drm.h                    |  2 --
>  drivers/gpu/drm/tegra/dsi.c                    | 10 +++-------
>  drivers/gpu/drm/tegra/hdmi.c                   |  9 +++------
>  drivers/gpu/drm/tegra/output.c                 |  6 +-----
>  drivers/gpu/drm/tegra/rgb.c                    |  8 ++------
>  drivers/gpu/drm/tegra/sor.c                    |  8 ++------
>  drivers/gpu/drm/tidss/tidss_encoder.c          | 10 +++-------
>  drivers/gpu/drm/tilcdc/tilcdc_external.c       | 10 +++-------
>  drivers/gpu/drm/tilcdc/tilcdc_panel.c          |  8 ++------
>  drivers/gpu/drm/vc4/vc4_dpi.c                  |  8 ++------
>  drivers/gpu/drm/vc4/vc4_dsi.c                  | 15 +++------------
>  drivers/gpu/drm/vc4/vc4_hdmi.c                 | 17 ++++-------------
>  drivers/gpu/drm/vc4/vc4_vec.c                  |  8 ++------
>  drivers/gpu/drm/virtio/virtgpu_display.c       |  8 ++------
>  drivers/gpu/drm/vkms/vkms_output.c             |  8 ++------
>  drivers/gpu/drm/zte/zx_hdmi.c                  |  8 ++------
>  drivers/gpu/drm/zte/zx_tvenc.c                 |  8 ++------
>  drivers/gpu/drm/zte/zx_vga.c                   |  8 ++------
>  68 files changed, 151 insertions(+), 488 deletions(-)
> 
> --
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
