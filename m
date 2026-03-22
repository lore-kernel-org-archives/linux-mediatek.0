Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49643FC72C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Mar 2026 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6G2SVWO20IBn1PN7dFTFMYYXOJCjUg90dESHj0IaiD0=; b=NdK8j/WWJCdZQj9tRfLTIqXylz
	Q/izZmpT82eu34uFazBNAr9lb0fEJK6KCYnbQNeMI96w+JfcboXGRcCzVOm8QoKZ0uV+2PpTpG43Q
	8hudmOuiX9IjVIQkOgkz5lsPImSBx/ULUvOghTdX3mFCE1W0oofurSl/ELcXQzop03CwVV4/xZQlQ
	2D78s7y5cwSriFeKFx9e64HmWlokClSGfhJCSopQ0acIdjqZgby79fypjrfJ01Lk4Co0cYTwr3u2z
	F+sCXudQvpup3aUwFb3VCXosoeEogEUpOzDR3DMowNk7BoDVAVm9DmXDQkr6RhiEGhMJTnUzPyZvq
	biP116Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Jep-0000000FPLX-42hr;
	Sun, 22 Mar 2026 14:19:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Jeo-0000000FPLJ-0yv7
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Mar 2026 14:19:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DB24600C4
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 14:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983DBC19424
	for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774189196;
	bh=pw3Kex2TtkEIr5Hh1UwrWSsRUK78ekd18b80cHZofwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BoFzhb5gLlfX688voT++AKnLCgQBqxpwKcGS57Z5P/fBgmKtP5VBs1tLoEDj+jA6F
	 jXoL1k6bIEAEVg+2M2U2MywBJ3huIrXn0v0FIyzuUGwbweaxlIaVFsrMwsK+hCi24t
	 Ch0ouWrOdCjWlvNPlw63nE1hhLmFk5nR4Zv92C7qB05u13fVqZED6GcjVH87xPjRhu
	 fHURr1Sy8joGP3MTrM+qJMtl9NQRi3Kr18wqs0zGn5cjvfN74jURXLcnnyacfeuOJp
	 zgsuv6BYnOxWmErUnzqoSFYb4xaa+Ko1Zlnaaz83iGYiuYmk9uwodGGj9mOZy0WbKh
	 N00CNy9zJTEHQ==
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12a695044a4so2651373c88.0
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 07:19:56 -0700 (PDT)
X-Gm-Message-State: AOJu0YyAizKnbByBYGxLMQy+8YcfwMKlXqyOBlW9DFds4EjeQxNYcsRC
	L/0IM5x5vEVaVMFBiB/FOkOO0cbjZ4urr/9jyyAKCsMuECpgMYkUwQj8DXicn32PlHzTZRR8tc/
	075T3+PjuH7lcr0tBKjNUqPIncKLOtA==
X-Received: by 2002:a05:7022:928:b0:128:e016:dd4b with SMTP id
 a92af1059eb24-12a726e13e4mr4555706c88.37.1774189195957; Sun, 22 Mar 2026
 07:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260225094047.76780-1-l.scorcia@gmail.com>
In-Reply-To: <20260225094047.76780-1-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 14:19:43 +0000
X-Gmail-Original-Message-ID: <CAAOTY_-_k4Fv2H_P6Xt3mT3aqfWHki_Ary3Lt0G6vk_nfqb6OQ@mail.gmail.com>
X-Gm-Features: AaiRm53TPKDRjcIENz8E-lT6qKe1LyJ0Aic3cDGSTsLZUFPpGAbsnhoMCBgOczA
Message-ID: <CAAOTY_-_k4Fv2H_P6Xt3mT3aqfWHki_Ary3Lt0G6vk_nfqb6OQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Luca:

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=
=8825=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:41=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> The call to mipi_dsi_host_register triggers a callback to mtk_dsi_bind,
> which uses dev_get_drvdata to retrieve the mtk_dsi struct, so this
> structure needs to be stored inside the driver data before invoking it.
>
> As drvdata is currently uninitialized it leads to a crash when
> registering the DSI DRM encoder right after acquiring
> the mode_config.idr_mutex, blocking all subsequent DRM operations.
>
> Fixes the following crash during mediatek-drm probe (tested on Xiaomi
> Smart Clock x04g):
>
> Unable to handle kernel NULL pointer dereference at virtual address
>  0000000000000040
> [...]
> Modules linked in: mediatek_drm(+) drm_display_helper cec drm_client_lib
>  drm_dma_helper drm_kms_helper panel_simple
> [...]
> Call trace:
>  drm_mode_object_add+0x58/0x98 (P)
>  __drm_encoder_init+0x48/0x140
>  drm_encoder_init+0x6c/0xa0
>  drm_simple_encoder_init+0x20/0x34 [drm_kms_helper]
>  mtk_dsi_bind+0x34/0x13c [mediatek_drm]
>  component_bind_all+0x120/0x280
>  mtk_drm_bind+0x284/0x67c [mediatek_drm]
>  try_to_bring_up_aggregate_device+0x23c/0x320
>  __component_add+0xa4/0x198
>  component_add+0x14/0x20
>  mtk_dsi_host_attach+0x78/0x100 [mediatek_drm]
>  mipi_dsi_attach+0x2c/0x50
>  panel_simple_dsi_probe+0x4c/0x9c [panel_simple]
>  mipi_dsi_drv_probe+0x1c/0x28
>  really_probe+0xc0/0x3dc
>  __driver_probe_device+0x80/0x160
>  driver_probe_device+0x40/0x120
>  __device_attach_driver+0xbc/0x17c
>  bus_for_each_drv+0x88/0xf0
>  __device_attach+0x9c/0x1cc
>  device_initial_probe+0x54/0x60
>  bus_probe_device+0x34/0xa0
>  device_add+0x5b0/0x800
>  mipi_dsi_device_register_full+0xdc/0x16c
>  mipi_dsi_host_register+0xc4/0x17c
>  mtk_dsi_probe+0x10c/0x260 [mediatek_drm]
>  platform_probe+0x5c/0xa4
>  really_probe+0xc0/0x3dc
>  __driver_probe_device+0x80/0x160
>  driver_probe_device+0x40/0x120
>  __driver_attach+0xc8/0x1f8
>  bus_for_each_dev+0x7c/0xe0
>  driver_attach+0x24/0x30
>  bus_add_driver+0x11c/0x240
>  driver_register+0x68/0x130
>  __platform_register_drivers+0x64/0x160
>  mtk_drm_init+0x24/0x1000 [mediatek_drm]
>  do_one_initcall+0x60/0x1d0
>  do_init_module+0x54/0x240
>  load_module+0x1838/0x1dc0
>  init_module_from_file+0xd8/0xf0
>  __arm64_sys_finit_module+0x1b4/0x428
>  invoke_syscall.constprop.0+0x48/0xc8
>  do_el0_svc+0x3c/0xb8
>  el0_svc+0x34/0xe8
>  el0t_64_sync_handler+0xa0/0xe4
>  el0t_64_sync+0x198/0x19c
> Code: 52800022 941004ab 2a0003f3 37f80040 (29005a80)
> ---[ end trace 0000000000000000 ]---

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: e4732b590a77 ("drm/mediatek: dsi: Register DSI host after acquirin=
g clocks and PHY")
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> v3: Also initialize irq_wait_queue before calling platform_set_drvdata
> v2: Added Fixes tag
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index d7726091819c..acee2227275b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1232,6 +1232,11 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>
>         dsi->host.ops =3D &mtk_dsi_ops;
>         dsi->host.dev =3D dev;
> +
> +       init_waitqueue_head(&dsi->irq_wait_queue);
> +
> +       platform_set_drvdata(pdev, dsi);
> +
>         ret =3D mipi_dsi_host_register(&dsi->host);
>         if (ret < 0)
>                 return dev_err_probe(dev, ret, "Failed to register DSI ho=
st\n");
> @@ -1243,10 +1248,6 @@ static int mtk_dsi_probe(struct platform_device *p=
dev)
>                 return dev_err_probe(&pdev->dev, ret, "Failed to request =
DSI irq\n");
>         }
>
> -       init_waitqueue_head(&dsi->irq_wait_queue);
> -
> -       platform_set_drvdata(pdev, dsi);
> -
>         dsi->bridge.of_node =3D dev->of_node;
>         dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
>
> --
> 2.43.0
>

