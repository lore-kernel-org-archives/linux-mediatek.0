Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2D3D63935
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2024 12:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ky2DCCFtceUmUsj812OQxW4/vj2KlA4fTFE+/xlmC54=; b=3ixhh8q0yQWpt8TIyeQeViT5nD
	JTaqnZ0cmrqlhQGGQrLq5a5+a4Yn7BCO5er6AHfOqhW3u5xIf1m0nWvX9c8Fdik/HhwP/PrlFTbVG
	xEJ2qgybUb3+biKSoNUIVoxYlA8vE4vfus9rdAF7nGsyUxdGWlI2zgn9vlahzy/Ga/fO8LvmmqHpc
	i7gT8+RWvAA2/VGmb85AURXVmjVmbQAC9KnB8JLT6ITBkNyqu/ocKNB3Zu0/fa43RCJWoQKXhOh3v
	T0nWk5k1LmZiPYSeA+9KORJ0wxPYsLO4vODxx5/ZJolJ7ZEBLGxdKbbwdFZil2kMlhWx1FFyZqlCW
	IPuLShnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkEh-0000000FM4F-3l7f;
	Wed, 20 Nov 2024 12:55:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDk5L-0000000FK60-0TU4;
	Wed, 20 Nov 2024 12:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732106729;
	bh=YvXp9iAM0sfJIO9S6Cz6CwfErEPbMQs4Cq24WKsOvIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJNToTZueYZV5ijGsCOfyQy8ojOFmLLm+5OQh/D+Dv2R5oxnCgB8DwMnUKgFMqUxi
	 Z2UNWE4xEpXdQSniVk5rpFxpjHsScHH0qkantI2SSQ1/cwlsowUUrhT1g1A1gb8XP2
	 hS2TH9XmrpL71Wgi4zcCuFC0SAyLVskvrsY7sYrCQjU+hiYJ2pBSYy22ZoGLlFPYh6
	 07W8AYfFo9PlIsQ6Zw3ydXwGkqJK7ozWytGQwvculNrFltd3RTzNiEFdRQM5NwSwlg
	 iDdLBcHKGfFkLTpj0VQiH/6MXZvXRIKGryCOYxd91nmXPTVySGoPMaCVIUbR+WFxF3
	 sPIzl/uq/Kmrg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEA0E17E367E;
	Wed, 20 Nov 2024 13:45:28 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 3/7] drm/mediatek: mtk_cec: Switch to register as module_platform_driver
Date: Wed, 20 Nov 2024 13:45:08 +0100
Message-ID: <20241120124512.134278-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_044531_315185_87CC3A77 
X-CRM114-Status: GOOD (  13.93  )
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

In preparation for splitting out the common bits from the HDMI
driver, change the mtk_cec driver from being registered from the
HDMI driver itself to be a module_platform_driver of its own.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c  | 5 ++++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 1 -
 drivers/gpu/drm/mediatek/mtk_hdmi.h | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index 2de248443147..263ae3b4c4df 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -12,7 +12,6 @@
 #include <linux/platform_device.h>
 
 #include "mtk_cec.h"
-#include "mtk_hdmi.h"
 #include "mtk_drm_drv.h"
 
 #define TR_CONFIG		0x00
@@ -247,3 +246,7 @@ struct platform_driver mtk_cec_driver = {
 		.of_match_table = mtk_cec_of_ids,
 	},
 };
+module_platform_driver(mtk_cec_driver);
+
+MODULE_DESCRIPTION("MediaTek HDMI CEC Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 7687f673964e..73ab88015d7f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1805,7 +1805,6 @@ static struct platform_driver mtk_hdmi_driver = {
 
 static struct platform_driver * const mtk_hdmi_drivers[] = {
 	&mtk_hdmi_ddc_driver,
-	&mtk_cec_driver,
 	&mtk_hdmi_driver,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.h b/drivers/gpu/drm/mediatek/mtk_hdmi.h
index 472bf141c92b..e40bc4651995 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.h
@@ -8,7 +8,6 @@
 
 struct platform_driver;
 
-extern struct platform_driver mtk_cec_driver;
 extern struct platform_driver mtk_hdmi_ddc_driver;
 
 #endif /* _MTK_HDMI_CTRL_H */
-- 
2.47.0


