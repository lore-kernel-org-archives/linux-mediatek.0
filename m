Return-Path: <SRS0=uE9q=7M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404A1C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2020 08:26:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D802070E
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 May 2020 08:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IOy+3wjB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FLdCfQzV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4D802070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCunGc9Eo/xYuLS6KGjH9ly0bFkw5eM4glO7Q96ZFrg=; b=IOy+3wjB8iTBKR
	Dijt1D1UpiAybudi3NshjR95h+pAxvgcYLyf1V0RopRyDDy1mIYNfmVty/wXvEu81MrvWhCdqyauq
	f3gUjFRXSGm9Y4faTR1MnGZSeD2Y08zssyQKf/IoKKyCH7ni3h09yhCFJ8cGytObypKAFSmVrTcgK
	TsdUj4bTUqW1g54MaIj9MewTEojXS5FWkXACy22y6sSb20kavK7VTV/b1IbEyjh9BQtzGAiiCpXum
	RgKQUnqvCkPKEBNeCBBlf4oHDxeznvPhj40+BUJcxYuRmO/xvCMYB8WFVfOaGOKutWkzmBlijoeer
	+8xyrlBvkWE2zTjUBnKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jewoe-0001N3-Ch; Sat, 30 May 2020 08:26:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jewmc-0005iw-JZ; Sat, 30 May 2020 08:24:02 +0000
X-UUID: c5142b37b84d47899ed5be8bfe389e90-20200530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bmH7fMDhBXTZkXnZCBeHpG/EY1LSFoVwd2Y4WvtFHEE=; 
 b=FLdCfQzVXtrw2Y6J0TZ/aZsLRc9fBFVZhAV8lngS80f2J9AIvg4HhaABJEAhDSJ8GHtazDqP0h9EVDKWih4PoDYLxloMSYuwTADCnHVE07sqxUAP6X4B1R/FA3YRXK05La7LyKF3P6UqKYOz/YPiyqLfAkB5Too1XXXdNSzMb/w=;
X-UUID: c5142b37b84d47899ed5be8bfe389e90-20200530
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 192519906; Sat, 30 May 2020 00:23:49 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 May 2020 01:13:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 May 2020 16:13:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 30 May 2020 16:13:49 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 10/17] drm/mediatek: Add pm runtime support for ovl and rdma
Date: Sat, 30 May 2020 16:10:11 +0800
Message-ID: <1590826218-23653-11-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
References: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200530_012358_654634_25A646D8 
X-CRM114-Status: GOOD (  16.44  )
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
Cc: Will Deacon <will.deacon@arm.com>, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, Evan Green <evgreen@chromium.org>,
 eizan@chromium.org, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 devicetree@vger.kernel.org, cui.zhang@mediatek.com,
 Tomasz Figa <tfiga@google.com>, linux-mediatek@lists.infradead.org,
 ming-fan.chen@mediatek.com, yong.wu@mediatek.com, anan.sun@mediatek.com,
 acourbot@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Display use the dispsys device to call pm_rumtime_get_sync before.
This patch add pm_runtime_xx with ovl and rdma device whose nodes has
"iommus" property, then display could help pm_runtime_get for smi via
ovl or rdma device.

This is a preparing patch that smi cleaning up "mediatek,larb".

CC: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  9 ++++++++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  9 ++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 12 +++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
 5 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 891d80c..17c9baa 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -11,6 +11,7 @@
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_drm_crtc.h"
@@ -399,9 +400,13 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pm_runtime_enable(dev);
+
 	ret = component_add(dev, &mtk_disp_ovl_component_ops);
-	if (ret)
+	if (ret) {
+		pm_runtime_disable(dev);
 		dev_err(dev, "Failed to add component: %d\n", ret);
+	}
 
 	return ret;
 }
@@ -410,6 +415,8 @@ static int mtk_disp_ovl_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_ovl_component_ops);
 
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 0cb848d..5ea8fb6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -9,6 +9,7 @@
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/soc/mediatek/mtk-cmdq.h>
 
 #include "mtk_drm_crtc.h"
@@ -313,9 +314,13 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 
+	pm_runtime_enable(dev);
+
 	ret = component_add(dev, &mtk_disp_rdma_component_ops);
-	if (ret)
+	if (ret) {
+		pm_runtime_disable(dev);
 		dev_err(dev, "Failed to add component: %d\n", ret);
+	}
 
 	return ret;
 }
@@ -324,6 +329,8 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
 {
 	component_del(&pdev->dev, &mtk_disp_rdma_component_ops);
 
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index fe85e48..c9bc844 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -538,9 +538,15 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 		return;
 	}
 
+	ret = pm_runtime_get_sync(comp->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n",
+			      ret);
+
 	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
 	if (ret) {
 		mtk_smi_larb_put(comp->larb_dev);
+		pm_runtime_put(comp->dev);
 		return;
 	}
 
@@ -553,7 +559,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 {
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
-	int i;
+	int i, ret;
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 	if (!mtk_crtc->enabled)
@@ -577,6 +583,10 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	drm_crtc_vblank_off(crtc);
 	mtk_crtc_ddp_hw_fini(mtk_crtc);
 	mtk_smi_larb_put(comp->larb_dev);
+	ret = pm_runtime_put(comp->dev);
+	if (ret < 0)
+		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n",
+			      ret);
 
 	mtk_crtc->enabled = false;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 57c88de..593027a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -493,6 +493,8 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 
 	comp->larb_dev = &larb_pdev->dev;
 
+	comp->dev = dev;
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (of_address_to_resource(node, 0, &res) != 0) {
 		dev_err(dev, "Missing reg in %s node\n", node->full_name);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index debe363..4c063e0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -99,6 +99,7 @@ struct mtk_ddp_comp {
 	void __iomem *regs;
 	int irq;
 	struct device *larb_dev;
+	struct device *dev;
 	enum mtk_ddp_comp_id id;
 	const struct mtk_ddp_comp_funcs *funcs;
 	resource_size_t regs_pa;
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
