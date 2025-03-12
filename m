Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF0AC28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 23:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4lh1IdXKK9ieRHVC5/i2vcJ1AHp2V4bvc+lvsNrbQY=; b=pin/h047d/4cp8pl1WaYU12zmQ
	3EzPWZ77ksaz/1nAX/67bj2SSDiyoPGJkjM202N9srmWZ22Z9PsP7qvEDmiLMgBARhkp9CCj5xTmo
	K0ktz2t8SkFJMJJjUO99IdhgL3HZhfs1qWCqKbyUgnqzqpmLuCmy/ipu8YwTi2Y7rdBEmX54rtFc0
	fpXP9qykGSgzD/SIlZL5GvExKqQ82EMzz4ZAzot8H0r81uXMonP9MVhEXJw8l7pngNe/LuZ+aYZBw
	hQ/Nd34vOAngu5iuCPsk3wxak4MUcnBdg70uwGX+Cyiw6l6JgCBw2CYuSaQ/mQbrWHIJgjvIN84Bs
	ZRNHCLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsVXi-00000009ivr-2u4L;
	Wed, 12 Mar 2025 23:31:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsVXf-00000009iv7-3sg7
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 23:31:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 474C6A44DD6
	for <linux-mediatek@lists.infradead.org>; Wed, 12 Mar 2025 23:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E82C4CEE3
	for <linux-mediatek@lists.infradead.org>; Wed, 12 Mar 2025 23:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741822274;
	bh=0FIfOKtTFqDx8sOyM2/0xeZkZ1+MOAxFl+Cuyc/3Nls=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GGIdQwmxR8nUUfD7Lzz31qb1s1rmqhY/JV3IIbF0dIeqkYUh7PCjX5tV3OIt2ChJB
	 4AIHjNgubzZHGonlGQrAu8E3efAupoPc09z/ktbTeF+GG+JN5YJPIS4NQ/IsroevJK
	 M66J0gTPOI1CbX1gwwTovgIsRDblB/ymF90cg6HVh5jrCeFLwqWcrxQ4cPQaCk+KYC
	 YhWSt9uxyWWGrvXVMVTGQzEfC4hYxAGD+pXPTA9j/q3ec2ufqJjwjFr+zdRj+61nTz
	 j3Yek9nm0irhlkMW3+0Q2NMWmc19UC8D/VD/HTwl97TeZwzGOWwmiI2WHRZ+ILmDGA
	 KEbaABtI/NViw==
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff80290debso865276a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Mar 2025 16:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHCxhYskIdhQINElWoK2Vy3zHPY1vX5meGOo0YzV6SSYKOV4kyhPfA0EYAZX6HzCWYJVzG4fAAjxDrD4jqsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMyrBv+jNUPU7LPGFMOq60TK6Uw7EbCtHNLHTyN0wvH5XxBt5V
	W2It+eKvrQ0GuIW/h2nN/E4UPdG51yzPiK47K+MI7pHHwXSsljarhNHRIwpR430TFFoDZg1fM4f
	oIEWJ1/V7y0Tciv9anhc9oDTyfw==
X-Google-Smtp-Source: AGHT+IEEEh4O5Kiec3VUO0CDJ2gaa3Qh4/pD7cDIWd+oHbt2InzI4dvUTLi5SMsyxG4sK9hhfjV+fbZColeLXtpafP0=
X-Received: by 2002:a17:90b:3887:b0:2f4:4003:f3ea with SMTP id
 98e67ed59e1d1-2ff7cef99c2mr40636176a91.33.1741822274428; Wed, 12 Mar 2025
 16:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250310132759.3345-1-chunkuang.hu@kernel.org> <CAPM=9txoJ3ZOyrcr-FikFAMHSdt3dOFAt=+TvBHFuPTXzH5qvQ@mail.gmail.com>
In-Reply-To: <CAPM=9txoJ3ZOyrcr-FikFAMHSdt3dOFAt=+TvBHFuPTXzH5qvQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 13 Mar 2025 07:32:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-xpp22oCT2u1qssFo_-Dz2FMTtzOKWJVgr7KgXK3DUoQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpePEnQ2cAumHPt5pTwQz9_z9O1wnbZyRwmIti1fdbx5LhZCLS7P1r3G3s
Message-ID: <CAAOTY_-xpp22oCT2u1qssFo_-Dz2FMTtzOKWJVgr7KgXK3DUoQ@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 6.15
To: Dave Airlie <airlied@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, 
	Douglas Anderson <dianders@chromium.org>, Fabien Parent <fparent@baylibre.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_163116_093888_B009AC79 
X-CRM114-Status: GOOD (  21.01  )
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

Hi, Dave:

Dave Airlie <airlied@gmail.com> =E6=96=BC 2025=E5=B9=B43=E6=9C=8812=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=887:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hey,
>
> This introduced a warning on my local builds,
>
> commit 30d5c46444a6aa4c78103fb898250ab5e6e8a97d
> Author: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Date:   Mon Feb 24 13:12:21 2025 +0800
>
>     drm/mediatek: Fix config_updating flag never false when no mbox chann=
el
>
>   CC [M]  drivers/gpu/drm/mediatek/mtk_dp.o
> /raid1/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_crt=
c.c:
> In function =E2=80=98mtk_crtc_update_config=E2=80=99:
> /raid1/home/airlied/devel/kernel/dim/src/drivers/gpu/drm/mediatek/mtk_crt=
c.c:630:1:
> warning: label =E2=80=98update_config_out=E2=80=99 defined but not used
> [-Wunused-label]
>   630 | update_config_out:
>       | ^~~~~~~~~~~~~~~~~
>
> Please fix and resend,

Sorry not find this. I've fixed this and resend pull request.

Regards,
Chun-Kuang.

> Thanks,
> Dave.
>
> On Mon, 10 Mar 2025 at 23:37, Chun-Kuang Hu <chunkuang.hu@kernel.org> wro=
te:
> >
> > Hi, Dave & Daniel:
> >
> > This includes:
> > 1. HDMI fixup and refinement
> > 2. Move to devm_platform_ioremap_resource() usage
> > 3. Add MT8188 dsc compatible
> > 4. Fix config_updating flag never false when no mbox channel
> > 5. dp: drm_err =3D> dev_err in HPD path to avoid NULL ptr
> > 6. Add dpi power-domains example
> > 7. Add MT8365 SoC support
> > 8. Fix error codes in mtk_dsi_host_transfer()
> >
> > Regards,
> > Chun-Kuang.
> >
> > The following changes since commit 2014c95afecee3e76ca4a56956a936e23283=
f05b:
> >
> >   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.gi=
t tags/mediatek-drm-next-6.15
> >
> > for you to fetch changes up to 8c9d519aa138aa36c0c3f201ff336b17b0ba32b2=
:
> >
> >   drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer() (2025-0=
3-03 13:26:03 +0000)
> >
> > ----------------------------------------------------------------
> > Mediatek DRM Next for Linux 6.15
> >
> > 1. HDMI fixup and refinement
> > 2. Move to devm_platform_ioremap_resource() usage
> > 3. Add MT8188 dsc compatible
> > 4. Fix config_updating flag never false when no mbox channel
> > 5. dp: drm_err =3D> dev_err in HPD path to avoid NULL ptr
> > 6. Add dpi power-domains example
> > 7. Add MT8365 SoC support
> > 8. Fix error codes in mtk_dsi_host_transfer()
> >
> > ----------------------------------------------------------------
> > AngeloGioacchino Del Regno (21):
> >       drm/mediatek: mtk_hdmi: Unregister audio platform device on failu=
re
> >       drm/mediatek: mtk_hdmi: Fix typo for aud_sampe_size member
> >       drm/mediatek: mtk_hdmi: Compress of_device_id array entries
> >       drm/mediatek: mtk_hdmi: Move vendor/product strings to drm_bridge
> >       drm/mediatek: mtk_hdmi: Remove unused members of struct mtk_hdmi
> >       drm/mediatek: mtk_hdmi: Use devm managed version of drm_bridge_ad=
d
> >       drm/mediatek: mtk_hdmi: Remove ifdef for CONFIG_PM_SLEEP
> >       drm/mediatek: mtk_hdmi: Remove goto in mtk_hdmi_clk_enable_audio(=
)
> >       drm/mediatek: mtk_hdmi: Remove driver bound to HDMI print
> >       drm/mediatek: mtk_hdmi: Cleanup function mtk_hdmi_resume()
> >       dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
> >       drm/mediatek: mtk_dpi: Add support for Pattern Generator in debug=
fs
> >       drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
> >       drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
> >       drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
> >       drm/mediatek: mtk_dpi: Move the input_2p_en bit to platform data
> >       drm/mediatek: mtk_dpi: Add support for DPI input clock from HDMI
> >       drm/mediatek: mtk_dpi: Support AFIFO 1T1P output and conversion
> >       drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/of=
f
> >       drm/mediatek: Add support for MT8195 Digital Parallel Interface
> >       dt-bindings: display: mediatek: dsc: Add MT8188 compatible
> >
> > Anusha Srivatsa (1):
> >       drm/mediatek: Move to devm_platform_ioremap_resource() usage
> >
> > Dan Carpenter (1):
> >       drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()
> >
> > Douglas Anderson (1):
> >       drm/mediatek: dp: drm_err =3D> dev_err in HPD path to avoid NULL =
ptr
> >
> > Fabien Parent (2):
> >       dt-bindings: display: mediatek: dpi: add power-domains example
> >       drm/mediatek: add MT8365 SoC support
> >
> > Jason-JH Lin (1):
> >       drm/mediatek: Fix config_updating flag never false when no mbox c=
hannel
> >
> >  .../bindings/display/mediatek/mediatek,dpi.yaml    |   7 +
> >  .../bindings/display/mediatek/mediatek,dsc.yaml    |   3 +
> >  drivers/gpu/drm/mediatek/mtk_crtc.c                |   5 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_color.c          |   4 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   4 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   4 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   4 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   4 +-
> >  drivers/gpu/drm/mediatek/mtk_dp.c                  |   6 +-
> >  drivers/gpu/drm/mediatek/mtk_dpi.c                 | 323 +++++++++++++=
++------
> >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |   9 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  10 +
> >  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  10 +-
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c                | 108 +++----
> >  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |   4 +-
> >  15 files changed, 334 insertions(+), 171 deletions(-)

