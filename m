Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C16E78D68
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bK67bz6+ZRm2fCC4bR1rHQZob0A/Zg4DSSdjRpq2kto=; b=gu3n6sm4y9Bpr1a9NHpQaFXXIR
	fg6IXGE42gxmO7duntyrZbtkWDtr6A4yD6PYHERRTq4NjGZifpNJBVlwX/twZXkZBccmCPM235rGX
	apwAlRDbmWxkhMTuAytoWM0qNFX+yEonUYDkSNhwvGtqM1KESSI+q3yLioTtrozdOhistGps83HAq
	YHNpzUByURvNksJCw5ejvSWt8Vb6rKVaaI6ktydfN4296UwCTGmd2Q91hrx0/PM9CrSTQFQbWmrsN
	TccwNq0M31PAA1fe8DKXFH/Iw3H5eIrJsqGJ9fxMb1clDd0o8GGhwA+seEeVBpmWZVHuOrjnoWgcp
	zrKcO4iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpND7-0000000F5Hz-3dmt;
	Mon, 09 Feb 2026 09:05:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpND5-0000000F5H0-0Vcf
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 09:05:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4806bf39419so31912455e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Feb 2026 01:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770627932; x=1771232732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bK67bz6+ZRm2fCC4bR1rHQZob0A/Zg4DSSdjRpq2kto=;
        b=N51Iq9byk9BgBv3S7/jublKZkdz0UfQGzy1CjSrvIseXWTtkcUij2K6UU+uFEq/7UG
         oEsuZ2uzB84EQY4FlS0AeAeD/NJReO7d/42EOm8/QI6AbaPiDGtYfgbOp9dPZOhGdXHH
         H0kVG0Yg/Wafefr6k+G1MnVVLawE394GVODJ0Ekcd+OK+/Yx/Qd31QXpnyU3VO3yi6P/
         Y2BtRWFNdpwCPxpZzWBKvjPIybkYJsHN7j0CGLYJKFqObww+8semmGZ0rEQUjxdAnH8e
         w0Btpjh1ImST4w/5aFqriqktSGT6WYS5RIaYkTADxnuSvpNml2nUNwb0ggxp3gdVfefK
         P8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627932; x=1771232732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bK67bz6+ZRm2fCC4bR1rHQZob0A/Zg4DSSdjRpq2kto=;
        b=Cz9F2h98awyIB8ajpS71AZmhxfylfQch7NimuO7MuGRyBVbMR98fHpBMiXXrefsT51
         z3+OLWnH9qf2k8/E2HBf5ov7Stw7ozcVVyPq3otpk4MSuVHELF5vjuisPoI0sYmQh6ux
         o8tB6KtJSLzeRqKP5k9puv0enBJILHDNdCBvem3h/IA6DZkygHkbPJm67SFzL9+Yzmh3
         5y3RwxSxZJiG2olDrXsDdHE6NNh7txreM1+YaVKFrzYgKKW0ViWIwls8iqllTN91pmIp
         jwOssvH7gJgXZZoMjg45GinfPUxI2pzaLs3dp7SUMMxi8rpkh1N6EX1YO2T03/akA8oR
         UFsQ==
X-Gm-Message-State: AOJu0YyL88tMupPLA7PcGIpOP/xaLm+HbLVS2AqvvdXdIMLU2LxfYJtV
	NBFiWth6fMUjXvI1Xgtl/nUysRJZvWqPDEEL07sFcjF9SgVDMBSNvXb+jHrqKQ==
X-Gm-Gg: AZuq6aKBr1VCoGCoPyLMt5oMGt4Z4Nt18fkkKjH0AGGdvIQf0B3CWh0b4bFATOcw3xb
	l7rSLUhnwzUuNPeCZsclyjXD//mWVa5pPttj51bKzUu7HzffZRuANZvYuz8D2hzdRDPLOHVPdUh
	9V/i/vGoxhFIzv06dpja4gn0OqRUyJdSM91WYVah2pnlm+AVxIAD7+bRWPm41RRBVmnnBEyInU4
	dY4+mRs2lWpuqAqJOA5uXgu3MrMo3qFYNjmAUZ4NBOUqr8yjxb1WexhDJuXTVXdCagjHw7Q0Xlr
	DCGSSg97l/FDMD8iwmbcntpPGQoHpBjcKqVOLtCleOBqYqxQDjTuqol+nShDG2cr0/THh/CJlqV
	LD9U8vKM0aGzhaUOPWqpU+S1Z1Hi/+H2bwqcrhv8nf25HtNObYFeUEdHmDMrZJYkfr56r2g/T1Y
	zBeSXw+rg=
X-Received: by 2002:a05:600c:5619:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-4831791784bmr141816525e9.11.1770627931570;
        Mon, 09 Feb 2026 01:05:31 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483203d606fsm90335365e9.2.2026.02.09.01.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:05:31 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mediatek: dsi: Store driver data before invoking mipi_dsi_host_register
Date: Mon,  9 Feb 2026 09:05:15 +0000
Message-ID: <20260209090516.14369-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_010535_207317_838DC13E 
X-CRM114-Status: GOOD (  12.72  )
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

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 4c2983852596..2358407b8a6b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1232,6 +1232,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
+	platform_set_drvdata(pdev, dsi);
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
@@ -1254,8 +1256,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	init_waitqueue_head(&dsi->irq_wait_queue);
 
-	platform_set_drvdata(pdev, dsi);
-
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-- 
2.43.0


