Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D5CC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 13:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hHv074/rOqt+tKSTiM6OlihI2sr43OeFvmvVD3qCXJ0=; b=NteuamrT+5c0pWMq7Z6W5DaN7N
	Enxf/5UauyDJ0wwais07u1htY5SjVCVRVl1BMCerubO5DwCC6JM4ns6iMjuj30qU/K38xiLjPG/DW
	SAtqnUplEtrAcecqq6w8uVHUgJ0h70hpP5GbgBxo0lPW6PpdcIOo44Rzs9vCojUlhBPu8jXSR9XHb
	ah0F8Nid3lqPPT/BNlxkmXft9G2y3QBl+UOfwzNdrcjVbT92oLonAiUx1CnOKs+WPbj1LXmc9/rgv
	k/JKl5T1QW3FDSKDK9dZDl4pACkVOz5MDFYD79VDQbzSndUYr8Wn6ueICG4cmx3tbP0cPAXxWQi1I
	O9GT651Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r69xN-004v2k-0Y;
	Thu, 23 Nov 2023 13:41:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r69xJ-004v0t-1m;
	Thu, 23 Nov 2023 13:41:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6D641063;
	Thu, 23 Nov 2023 05:42:04 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 350B93F6C4;
	Thu, 23 Nov 2023 05:41:17 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de
Cc: yong.wu@mediatek.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] drm/mediatek: Stop using iommu_present()
Date: Thu, 23 Nov 2023 13:41:12 +0000
Message-Id: <fd1b62aa006556f29f37535814abfe41be63f7ae.1700746094.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_054121_630832_C954B151 
X-CRM114-Status: UNSURE (   8.87  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove the pointless check. If an IOMMU is providing transparent DMA API
ops for any device(s) we care about, the DT code will have enforced the
appropriate probe ordering already. And if the IOMMU *is* entirely
absent, then attempting to go ahead with CMA and either suceeding or
failing decisively seems more useful than deferring forever.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

I realised that last time I sent this I probably should have CCed a
wider audience of reviewers, so here's one with an updated commit
message as well to make the resend more worthwhile.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 2dfaa613276a..48581da51857 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/component.h>
-#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -608,9 +607,6 @@ static int mtk_drm_bind(struct device *dev)
 	struct drm_device *drm;
 	int ret, i;
 
-	if (!iommu_present(&platform_bus_type))
-		return -EPROBE_DEFER;
-
 	pdev = of_find_device_by_node(private->mutex_node);
 	if (!pdev) {
 		dev_err(dev, "Waiting for disp-mutex device %pOF\n",
-- 
2.39.2.101.g768bb238c484.dirty


