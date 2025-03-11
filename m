Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9A7C282EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 23:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCrEEz1dOxuYiOCf/MyW6ME80hX/dRGzdXvkMqYCiBA=; b=Lc68f3Wf7cKlMEV9vB38zjh/JX
	C+6ojPfQ9xDaAJdoJ+Uam93EVEanZ9uHoKw2wt547PTqs4w3++pmfMWJQ2SSGBYH+ixDXTp5NM5JN
	LlG67Nwrjmx6vA3T30wHXSKBqEYhWH6A6M8dxHWXxBBRSUUrwxBaQUyQ1UHvFtB/kSCfFOxIsBEKR
	rETlIlYi2xb1h44MGdMPE3N6p/72Tg30Q0ceCDaCasOuSfhFCHg8WSOKtRvGsmoP5++Yi+d8BdFNP
	iQmjHCI6jS13yf1EHQdtAJgX3dp/isufUDTeUxJafjS5zjIvn+EZ3w+DMptN1IcftUwkF/U9sDvPB
	dHRMOBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts9DE-00000007CS5-3PW8;
	Tue, 11 Mar 2025 23:40:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts9DC-00000007CRg-1YSY
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Mar 2025 23:40:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-abbb12bea54so1109034366b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Mar 2025 16:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741736436; x=1742341236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCrEEz1dOxuYiOCf/MyW6ME80hX/dRGzdXvkMqYCiBA=;
        b=S2N402aisVwx10vkdI+KZKWOiP0XAUCGf+ePLhVa9JvqPo/dl6b2Ih6VgSlcldwjQY
         H0NMt1yxzt6W76BEsmttdhRCeHOHO+HroCUPJ7R4fGM+fjlZY3odCsiwNSG5fULCOt4c
         YNTSYJXcXnZASGAycpt9kyib8eMlJ4s0y/WJkkFMP4Tp/+x4SovZwZzR0BfTZkdYCP6x
         IN2J7hqfbIpGJahwat4dmhHvLrFULQ/e/fYLkfaJ64U6hRtLWuC/voKZS/hNNMs4cwFv
         EIc+SQJkNVRLmK3LdVRAi4QiObTenRLqYe6YEJF4Vk1FEyuX9zZZuAsDo4n+nTWgOy3B
         Qp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741736436; x=1742341236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCrEEz1dOxuYiOCf/MyW6ME80hX/dRGzdXvkMqYCiBA=;
        b=gaHRBtgpA3gY33jG4eKqZVIvN5uN+9kQBvUWmIDSPntGPjNo82hRiXfNDt2ZCJ8deL
         9SjCVO+ygOPOnWGr3UaMo0TbgeFRJ8TmBNNbVgM3JYINNwcYW0BLK+CbveU9cG8ukrYr
         KbeEmZu0H04XgAf2izmI26qRxiINbdLpr/B5xO3mFyu60qu620iaVQhzhee+xkrB7Qh9
         054u1RyacEo/8bxo6jlw8IuWwp8v6xBMY0uXFvkF5P+IHPlwUh1N9gP3oP21SAWnyop9
         1GhxlQYTJ6CN1SU2+KHqKKwr6LvbgE94EFavxxnY8hS3JgDWQ0z5qUiWWsz5ylErOW+u
         KobA==
X-Forwarded-Encrypted: i=1; AJvYcCUoYS4sAPYQ5I4xImyeza9T1CH71a84YvT+1WHdzKUoPilw5Kpof6Om8G+Jmb2nvUjJkud287EFjweGjgGOuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPyqNv5RgVs8Xde5g7Obesvz4oO2X9GoAfB0nWu8TYiXa/jdvv
	iI7ChhQUlnXtJp21MX9kWb5+FZmG+IB2VbdBGgven0dGNfTIToFr5vBF9UE9WKw6euNQgeH5uEn
	iVLj+y+DEqAxi1CChwmk90/QWWC8=
X-Gm-Gg: ASbGnctodbMgFsTjkIyR6cDv7wLddmVX/YeyCv9im1jhoMJ0Nn2hGKdu/ypAjhQbXla
	CGI6YXqZJHiuhxAF3q4pp8BoO1r3x8GTi1BRNRzkeheGuBunDGiqEnNNX29nPDVoNAUjoU0L05S
	2aaasoh1UhYmHaoqP/YEKbm5bRBisfCo2N1xM=
X-Google-Smtp-Source: AGHT+IED7QDwbntOHRlnxjMjDpnMFuyLr4iyflUA7B1f8doT07Xl1uuxrnzYDNXmzw/O+rn332YQhW8ICQ9/3CKDmsk=
X-Received: by 2002:a17:907:a194:b0:ac2:d1bd:3293 with SMTP id
 a640c23a62f3a-ac2d1bd38fdmr243750566b.19.1741736435499; Tue, 11 Mar 2025
 16:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250310132759.3345-1-chunkuang.hu@kernel.org>
In-Reply-To: <20250310132759.3345-1-chunkuang.hu@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 12 Mar 2025 09:40:24 +1000
X-Gm-Features: AQ5f1Jpu8dUUMKDViwZXrHwirWdNNjyZ1Y-CfeoKOGN_jFAMjkXSkf8Tgq9kWd0
Message-ID: <CAPM=9txoJ3ZOyrcr-FikFAMHSdt3dOFAt=+TvBHFuPTXzH5qvQ@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 6.15
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, 
	Douglas Anderson <dianders@chromium.org>, Fabien Parent <fparent@baylibre.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_164038_415925_CDFEFE75 
X-CRM114-Status: GOOD (  15.85  )
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

Hey,

This introduced a warning on my local builds,

commit 30d5c46444a6aa4c78103fb898250ab5e6e8a97d
Author: Jason-JH Lin <jason-jh.lin@mediatek.com>
Date:   Mon Feb 24 13:12:21 2025 +0800

    drm/mediatek: Fix config_updating flag never false when no mbox channel

  CC [M]  drivers/gpu/drm/mediatek/mtk_dp.o
/raid1/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_crtc.=
c:
In function =E2=80=98mtk_crtc_update_config=E2=80=99:
/raid1/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_crtc.=
c:630:1:
warning: label =E2=80=98update_config_out=E2=80=99 defined but not used
[-Wunused-label]
  630 | update_config_out:
      | ^~~~~~~~~~~~~~~~~

Please fix and resend,
Thanks,
Dave.

On Mon, 10 Mar 2025 at 23:37, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote=
:
>
> Hi, Dave & Daniel:
>
> This includes:
> 1. HDMI fixup and refinement
> 2. Move to devm_platform_ioremap_resource() usage
> 3. Add MT8188 dsc compatible
> 4. Fix config_updating flag never false when no mbox channel
> 5. dp: drm_err =3D> dev_err in HPD path to avoid NULL ptr
> 6. Add dpi power-domains example
> 7. Add MT8365 SoC support
> 8. Fix error codes in mtk_dsi_host_transfer()
>
> Regards,
> Chun-Kuang.
>
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f0=
5b:
>
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git =
tags/mediatek-drm-next-6.15
>
> for you to fetch changes up to 8c9d519aa138aa36c0c3f201ff336b17b0ba32b2:
>
>   drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer() (2025-03-=
03 13:26:03 +0000)
>
> ----------------------------------------------------------------
> Mediatek DRM Next for Linux 6.15
>
> 1. HDMI fixup and refinement
> 2. Move to devm_platform_ioremap_resource() usage
> 3. Add MT8188 dsc compatible
> 4. Fix config_updating flag never false when no mbox channel
> 5. dp: drm_err =3D> dev_err in HPD path to avoid NULL ptr
> 6. Add dpi power-domains example
> 7. Add MT8365 SoC support
> 8. Fix error codes in mtk_dsi_host_transfer()
>
> ----------------------------------------------------------------
> AngeloGioacchino Del Regno (21):
>       drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
>       drm/mediatek: mtk_hdmi: Fix typo for aud_sampe_size member
>       drm/mediatek: mtk_hdmi: Compress of_device_id array entries
>       drm/mediatek: mtk_hdmi: Move vendor/product strings to drm_bridge
>       drm/mediatek: mtk_hdmi: Remove unused members of struct mtk_hdmi
>       drm/mediatek: mtk_hdmi: Use devm managed version of drm_bridge_add
>       drm/mediatek: mtk_hdmi: Remove ifdef for CONFIG_PM_SLEEP
>       drm/mediatek: mtk_hdmi: Remove goto in mtk_hdmi_clk_enable_audio()
>       drm/mediatek: mtk_hdmi: Remove driver bound to HDMI print
>       drm/mediatek: mtk_hdmi: Cleanup function mtk_hdmi_resume()
>       dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
>       drm/mediatek: mtk_dpi: Add support for Pattern Generator in debugfs
>       drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
>       drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
>       drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
>       drm/mediatek: mtk_dpi: Move the input_2p_en bit to platform data
>       drm/mediatek: mtk_dpi: Add support for DPI input clock from HDMI
>       drm/mediatek: mtk_dpi: Support AFIFO 1T1P output and conversion
>       drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/off
>       drm/mediatek: Add support for MT8195 Digital Parallel Interface
>       dt-bindings: display: mediatek: dsc: Add MT8188 compatible
>
> Anusha Srivatsa (1):
>       drm/mediatek: Move to devm_platform_ioremap_resource() usage
>
> Dan Carpenter (1):
>       drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()
>
> Douglas Anderson (1):
>       drm/mediatek: dp: drm_err =3D> dev_err in HPD path to avoid NULL pt=
r
>
> Fabien Parent (2):
>       dt-bindings: display: mediatek: dpi: add power-domains example
>       drm/mediatek: add MT8365 SoC support
>
> Jason-JH Lin (1):
>       drm/mediatek: Fix config_updating flag never false when no mbox cha=
nnel
>
>  .../bindings/display/mediatek/mediatek,dpi.yaml    |   7 +
>  .../bindings/display/mediatek/mediatek,dsc.yaml    |   3 +
>  drivers/gpu/drm/mediatek/mtk_crtc.c                |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_color.c          |   4 +-
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   4 +-
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   4 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   4 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   4 +-
>  drivers/gpu/drm/mediatek/mtk_dp.c                  |   6 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 | 323 +++++++++++++++=
------
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |   9 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  10 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  10 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                | 108 +++----
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |   4 +-
>  15 files changed, 334 insertions(+), 171 deletions(-)

