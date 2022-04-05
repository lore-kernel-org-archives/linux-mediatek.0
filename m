Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E30C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 14:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vwu2UI0T6Q1zd0jYIeBI3e6nzXcMSb5sUhow89S04Us=; b=IzcacGx7dp/VNx
	0nGNgSmRY2/IrqOYPGAfwZ4KNKL3IAP0Qjg/ndk2tHxy8/4lZ7Rw00+Wlrxn9E6PLgYI0hhMoq+Rl
	XcXGqz0/+26YGGRddtti88RwoPiJHzPvV0ssGGqDUMG0gSn7flfVnQ/KzLRgjQPPe+telFnbFfuOp
	LGdmgmlvwVzu8UIxn3BUgRNmMEpuMdVQWzBslm9Z4ZZipXneG2XbwWqikXTo0orLuseRyvhnQwOBm
	ArmRAGi8dnqW/hrPqAOyL46e5gq69YXepn2EyBV98ps+xpGf+m8GwUKhLJ+DEHyuIKNqAuxr3k1e8
	RLF6VQYUb6MMAK6PzWpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbjyG-001OT2-E0; Tue, 05 Apr 2022 14:15:48 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbjyD-001OQp-Vg
 for linux-mediatek@lists.infradead.org; Tue, 05 Apr 2022 14:15:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA55C1474;
 Tue,  5 Apr 2022 07:15:42 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E836F3F5A1;
 Tue,  5 Apr 2022 07:15:41 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de
Cc: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Stop using iommu_present()
Date: Tue,  5 Apr 2022 15:15:38 +0100
Message-Id: <7d91fdb731829febcd141361d46c7c4fd3a465ba.1649168138.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_071546_085998_31412F33 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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

Remove the pointless check. If an IOMMU is providing transparent DMA API
ops for any device(s) we care about, the DT code will have enforced the
appropriate probe ordering already.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 247c6ff277ef..2de31746a308 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/component.h>
-#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
@@ -239,9 +238,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	if (drm_firmware_drivers_only())
 		return -ENODEV;
 
-	if (!iommu_present(&platform_bus_type))
-		return -EPROBE_DEFER;
-
 	pdev = of_find_device_by_node(private->mutex_node);
 	if (!pdev) {
 		dev_err(drm->dev, "Waiting for disp-mutex device %pOF\n",
-- 
2.28.0.dirty


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
