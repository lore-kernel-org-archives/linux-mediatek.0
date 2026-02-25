Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05617EFD238
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZTzGWHccByJBdaZUZxrkE2sNIhOCCTQKy9wwE5UBFMs=; b=Ak5ej34p7WAAZ3WuGithu+cXdC
	ex8PsZY4MZ3ik3A4+5Eze4GoWjKoBW3tnOimIbZ57zDoTTI7t5I73GxaNKR+OiHMc6ODTgxpJPbrm
	OhqB9BVvaCpwM7X1zr0vEhF+p4hicmHOEculGAVptWHsvAkwrUmZ+Su1JVNo6MrrELgUABZI92T7G
	bEYUgSvvxudMTZW7APO2T4wMD+fl8dap5SNZA1H/TPVMzlxuSImuoCRTABfgyD5X31Jg5764v96za
	5BmxS8nKBczmS3KZaCrA35wzIljGiu6Xhb0xPwEiOGU5vXqCaZ8LX1JjE6jUMuLTW4DoKPcXSujgj
	0CYLaPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBOJ-00000003iGa-090n;
	Wed, 25 Feb 2026 09:41:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBOG-00000003iEn-0HK9
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 09:41:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso52053585e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 01:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772012466; x=1772617266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTzGWHccByJBdaZUZxrkE2sNIhOCCTQKy9wwE5UBFMs=;
        b=iZckZT/S2FIEHHwIMCr/7ctzXOywBTJSf5rsExzZLUT9W9dVKOKW45DLlccuBV/XBE
         e8K+CFxKTacEU0oIwMPBtBm8ATxWQSg7EvcRpLbincw7L8hMmJwcRtj8PDMBV3pbXr+x
         bX/kgMbt6xpXeAQvMb3MPua+5WUAuETTIaGlBV3ZR7DDqiw4bZhUx44IFkUwxFmEeJzx
         5qMX1LxvrtfFw5wEdlF+Xjzw+sdcUBUOSNPiYBLIvn86LIfbG5RriD4b6I9qXbGEPqIh
         1nPB0n4VnrZpmPNBIbqZYIjafB/r9o1stH7L9P6Jx0QBxriBPW40x7spENu5fcmdu7Q6
         WbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772012466; x=1772617266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTzGWHccByJBdaZUZxrkE2sNIhOCCTQKy9wwE5UBFMs=;
        b=tUq4l4BPGdjfjqIEipf872hjqNtltH6fpe13+s0wcPr/i75Oo27RNlMPl//3lMSOBH
         t0/WzRpNlJDzZe1opTGqrmdbZ65y3goXjD2KaqTGajDOBODBEfBSuoZEM5nhzq/KkUYF
         2Q7O64XhMBnNJl2k8E2+YtD+OalTI6qdeb0mjM5zFJDWgpD2KawQa2SKkKlvTmwhlp0Z
         6UvibJ5y/rKrOJJ5BG76RKV9E7IEYqL427CzAGcXcinqSnUjPSVoKazcHREbKEfu8eUe
         9l1V582xdKxgXfrGQdAPZFuDW8g7TCMSQsBXSwaRPO/QnB2p86MQhKxuy/Y+ePaG0VjM
         xeDA==
X-Gm-Message-State: AOJu0YyQTvpuShcZ8dmrnZFRK8nulF5Z7tIzMmQw1aCZuYMScHMD4o90
	bELGACAcvYGUl7IxhFTZKcxCGV+HTK6MC+zUYpmDE2KjMV7Q9a1Wj/6394FKBw==
X-Gm-Gg: ATEYQzx75ozFZi++gqcDBRXugWnhfBC2O2L+iWpZqwLb26JAiH4gU+RACt/CxbX31m9
	QFgOoatagcjEFpQrdblZXG4W43RfLqIhI0wJZFt84wi0XivMyPsKeI0uCa07op/l0wEZxr2lPOx
	G4BOC75bCuvdHMxiF5oiPm39qlBf2ByUjlLdZ9eZpDOF3pWTor1Q3kOIktkXAiEAUbXEFOoHf1v
	7x4piRqovVVc9xSIT3rzBeL7mWJMlPgSplSIrr6/gCTQ8uoNBKr2i2pTI/jp/kkZz76zA0wQhlq
	THRDVdky90PKaqUWyPpxRKglnU8EXiAHrBEB+lVVQ88RyzKRqBqQUHbEeKe/Xa+o+jsTaxGxoYe
	SK87dudlR+VQQL5WZLDFXAqDCvYndfD09Eb9GFFj+CbA5NSWFrejXq53tE4+nfBS49F+QrmpXfa
	45AtL8uk85C2F2V6eFKbs=
X-Received: by 2002:a05:600c:8b31:b0:483:2c98:435e with SMTP id 5b1f17b1804b1-483a95ee684mr256150945e9.34.1772012465553;
        Wed, 25 Feb 2026 01:41:05 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f2f88sm59282785e9.2.2026.02.25.01.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:41:05 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register
Date: Wed, 25 Feb 2026 09:38:41 +0000
Message-ID: <20260225094047.76780-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_014108_117930_2F3FC814 
X-CRM114-Status: GOOD (  11.73  )
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

The call to mipi_dsi_host_register triggers a callback to mtk_dsi_bind,
which uses dev_get_drvdata to retrieve the mtk_dsi struct, so this
structure needs to be stored inside the driver data before invoking it.

As drvdata is currently uninitialized it leads to a crash when
registering the DSI DRM encoder right after acquiring
the mode_config.idr_mutex, blocking all subsequent DRM operations.

Fixes the following crash during mediatek-drm probe (tested on Xiaomi
Smart Clock x04g):

Unable to handle kernel NULL pointer dereference at virtual address
 0000000000000040
[...]
Modules linked in: mediatek_drm(+) drm_display_helper cec drm_client_lib
 drm_dma_helper drm_kms_helper panel_simple
[...]
Call trace:
 drm_mode_object_add+0x58/0x98 (P)
 __drm_encoder_init+0x48/0x140
 drm_encoder_init+0x6c/0xa0
 drm_simple_encoder_init+0x20/0x34 [drm_kms_helper]
 mtk_dsi_bind+0x34/0x13c [mediatek_drm]
 component_bind_all+0x120/0x280
 mtk_drm_bind+0x284/0x67c [mediatek_drm]
 try_to_bring_up_aggregate_device+0x23c/0x320
 __component_add+0xa4/0x198
 component_add+0x14/0x20
 mtk_dsi_host_attach+0x78/0x100 [mediatek_drm]
 mipi_dsi_attach+0x2c/0x50
 panel_simple_dsi_probe+0x4c/0x9c [panel_simple]
 mipi_dsi_drv_probe+0x1c/0x28
 really_probe+0xc0/0x3dc
 __driver_probe_device+0x80/0x160
 driver_probe_device+0x40/0x120
 __device_attach_driver+0xbc/0x17c
 bus_for_each_drv+0x88/0xf0
 __device_attach+0x9c/0x1cc
 device_initial_probe+0x54/0x60
 bus_probe_device+0x34/0xa0
 device_add+0x5b0/0x800
 mipi_dsi_device_register_full+0xdc/0x16c
 mipi_dsi_host_register+0xc4/0x17c
 mtk_dsi_probe+0x10c/0x260 [mediatek_drm]
 platform_probe+0x5c/0xa4
 really_probe+0xc0/0x3dc
 __driver_probe_device+0x80/0x160
 driver_probe_device+0x40/0x120
 __driver_attach+0xc8/0x1f8
 bus_for_each_dev+0x7c/0xe0
 driver_attach+0x24/0x30
 bus_add_driver+0x11c/0x240
 driver_register+0x68/0x130
 __platform_register_drivers+0x64/0x160
 mtk_drm_init+0x24/0x1000 [mediatek_drm]
 do_one_initcall+0x60/0x1d0
 do_init_module+0x54/0x240
 load_module+0x1838/0x1dc0
 init_module_from_file+0xd8/0xf0
 __arm64_sys_finit_module+0x1b4/0x428
 invoke_syscall.constprop.0+0x48/0xc8
 do_el0_svc+0x3c/0xb8
 el0_svc+0x34/0xe8
 el0t_64_sync_handler+0xa0/0xe4
 el0t_64_sync+0x198/0x19c
Code: 52800022 941004ab 2a0003f3 37f80040 (29005a80)
---[ end trace 0000000000000000 ]---

Fixes: e4732b590a77 ("drm/mediatek: dsi: Register DSI host after acquiring clocks and PHY")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v3: Also initialize irq_wait_queue before calling platform_set_drvdata
v2: Added Fixes tag

 drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d7726091819c..acee2227275b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1232,6 +1232,11 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
+
+	init_waitqueue_head(&dsi->irq_wait_queue);
+
+	platform_set_drvdata(pdev, dsi);
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
@@ -1243,10 +1248,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
 	}
 
-	init_waitqueue_head(&dsi->irq_wait_queue);
-
-	platform_set_drvdata(pdev, dsi);
-
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-- 
2.43.0


