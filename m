Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A5DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 15:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/tjCAlqgMG7VKZ4lgqvAQydy3YaeufwtYO7WAH7QQog=; b=EwS+lVrHDWPH1l
	nkjE9KCvhnohGJ501vuM7ztHK9JQ5uuJ7Egd8mjZYmFlj2aQbnNjTEyMnApPjlbamNzhZ52zT7jI2
	8JDnrNSgiMV/4srxkn7QUKkDtAj89kEPOazdJ4cOUsOOHgq6LcOfkyoqLI423kwk6neICiGWklqfz
	lI2AbXH+QSvO8XClUztRMH3UUu7PCr2XCq1Za6vmD59YLuBVVPbLUMNO/jl1xeayy3ru2BzZ0yfMs
	aeFfumf26EQ7ir31Y0BJqByTSvL662p+sQtPbkuUcSBgH2ZuUXYYz6MKeqzdlVSBZTGU2jph48uv/
	miQm8GikyafiSNVpPDww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlY93-001Ynw-0E; Mon, 02 May 2022 15:39:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlY8j-001Yda-41
 for linux-mediatek@lists.infradead.org; Mon, 02 May 2022 15:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651505946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RxZ1zA8nQC01DJB3x+D5mWs5PQSC8mjj8OCqdkOk8ik=;
 b=HQL0q8OlJFvZxLhXHBOs7DesawYrqiwKzzVtH3EeWkeKNv2LPjmxWV9NA+kyf4PSU3MKI6
 y0O30ZhbnFxh0LZa2YnaebOJxKRPsUBdozO6KZINoif8NXQ9lg9anm4y3dHM42cR2Vp68/
 AtbfydBZUg7jhQbIniAMnzlKKCuksrM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-o08IUFS_Pb6_iWqOfOc2eg-1; Mon, 02 May 2022 11:39:05 -0400
X-MC-Unique: o08IUFS_Pb6_iWqOfOc2eg-1
Received: by mail-wr1-f69.google.com with SMTP id
 t17-20020adfa2d1000000b0020ac519c222so5400312wra.4
 for <linux-mediatek@lists.infradead.org>; Mon, 02 May 2022 08:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RxZ1zA8nQC01DJB3x+D5mWs5PQSC8mjj8OCqdkOk8ik=;
 b=Se7zUCo+smYe1X34k7mZjaiNqbahV21aavVlxDpgDrdAa/yPSP9GcZgd8gGR83Zcer
 K0Jb3T2kqI8V2IzWAcRGboarVauQhEMC+WcHbPwc/zo7pxhgZf1k3Jj1ujMTi+gbmxHK
 W53RDT+oVki0y8CYYvtj9wT3VPjUSGR0A7gJiSXk+Kf7Kr7Xw/RA4aL3N6aL7Tgbwa/k
 9wwOhw7Y6n+aK2rQtxsAitljwGBouYSXMc53YwoB4f3XH8gZFoIuaUyF7NFytvEtUxN7
 Iyk3hraNN/EdlIC9RPtPL66t2lgg4Cw2IL3soVHqo3jFzuiHQYTVJGHcFK969t88XIr/
 VOuQ==
X-Gm-Message-State: AOAM531V+YLXS6TUuu4zs7jrvFdzA1YedcTeB7zCQE1DxBcByiVxp4yJ
 lJMc4Pv9OlxaDxAHAhfELN0J4qIthKigZ0+Uybk9MoDhHiVsZ9t7DujT2aG489OIseomvyjUSrN
 xbUtFXAVkbxPUjsp3qWZyMtwwF2lzGP2U
X-Received: by 2002:a05:600c:4f56:b0:394:3fa3:97bb with SMTP id
 m22-20020a05600c4f5600b003943fa397bbmr3455846wmq.83.1651505943847; 
 Mon, 02 May 2022 08:39:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5iF7k5TDSOSlgHfyQz+pcyPcHCX6LV3RnlxGS89mLob4h+ZdMgib1ArSojImIhdyBYcuzBw==
X-Received: by 2002:a05:600c:4f56:b0:394:3fa3:97bb with SMTP id
 m22-20020a05600c4f5600b003943fa397bbmr3455805wmq.83.1651505943296; 
 Mon, 02 May 2022 08:39:03 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v28-20020adfa1dc000000b0020c5253d923sm7294489wrv.111.2022.05.02.08.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 08:39:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v2 0/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
Date: Mon,  2 May 2022 17:38:57 +0200
Message-Id: <20220502153900.408522-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_083909_286021_B124273E 
X-CRM114-Status: GOOD (  11.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

This series contain patches suggested by Thomas Zimmermann as a feedback for
"[RFC PATCH v4 00/11] Fix some race between sysfb device registration and
drivers probe" [0].

Since other changes in [0] were more controversial, I decided to just split
this part in a new patch-set and revisit the rest of the patches later.

This is a v2 that addresses issues pointed out in v1.

Patch #1 is just a cleanup since when working on this noticed that some DRM
drivers were passing as preferred bits per pixel to drm_fbdev_generic_setup()
the value that is the default anyways.

Patch #2 renames the 'preferred_bpp' drm_fbdev_generic_setup() parameter to
'options', and make this a multi field parameter so that it can be extended
later to pass other options as well.

Patch #3 finally adds the new DRM_FB_FW option and makes simpledrm to use it
so that the registered framebuffer device is also marked as firmware provided.

[0]: https://lore.kernel.org/lkml/20220429084253.1085911-1-javierm@redhat.com/

Changes in v2:
- Rename DRM_FB_SET_OPTION() to DRM_FB_SET() and make more clear in the
  kernel-doc what this macro does (Laurent Pinchart).
- Fix some kernel-doc issues I didn't notice in v1.
- Add Reviewed-by tags from Thomas and Laurent.

Javier Martinez Canillas (3):
  drm: Remove superfluous arg when calling to drm_fbdev_generic_setup()
  drm/fb-helper: Rename preferred_bpp drm_fbdev_generic_setup()
    parameter
  drm: Allow simpledrm to setup its emulated FB as firmware provided

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 +++--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
 drivers/gpu/drm/drm_drv.c                     |  2 +-
 drivers/gpu/drm/drm_fb_helper.c               | 26 ++++++++++++++++---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
 drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
 drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
 drivers/gpu/drm/stm/drv.c                     |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/tiny/bochs.c                  |  2 +-
 drivers/gpu/drm/tiny/cirrus.c                 |  2 +-
 drivers/gpu/drm/tiny/simpledrm.c              |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  2 +-
 include/drm/drm_fb_helper.h                   | 22 ++++++++++++++++
 36 files changed, 81 insertions(+), 39 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
