Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8690FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 01:42:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BBFD613DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 01:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BBFD613DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCS+dhrqWXFQM1U+Zd/sMSMzPbC49tlo3hqUNq/BTf8=; b=av9by24wUO9m0o
	ZnTGMQwEN0bpsQvfbOOI2cnVZ8uyB0a/MPSLMl2jGhm/6Frdptmq8KzU59lRVXnVejikfKWHl42Z8
	NDgHQwFTSo8IAOzJNhlNK58rocLgkYkn1EpM6Pj9k50wNfrdaqGzSQVC8vsDT86nVSywiMw6zRpXE
	xvgLd/NBjcrpeZZONW2hS29n8keuQ+KrSTt/m5UDiRa+oUAh7WVTGjGzWHW6LK0YDUaFUWNQKVJzG
	oWzegt6+csWloNMV3OfvDCuPpj9EdDwAexiMb7O/gW763P5UXvehCM75iPm8CJsZCoDX/xmeYZ2Xe
	9j5wtRtFqPBpw/vXTkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVObZ-009bCO-OU; Wed, 29 Sep 2021 01:41:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVObB-009b4r-9x; Wed, 29 Sep 2021 01:41:30 +0000
X-UUID: 1d6a198204984bddaa0de2184c214003-20210928
X-UUID: 1d6a198204984bddaa0de2184c214003-20210928
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1210281761; Tue, 28 Sep 2021 18:41:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 18:38:48 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 29 Sep 2021 09:38:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Sep 2021 09:38:44 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Matthias Kaehlcke
 <mka@chromium.org>, <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>,
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>, "Dafna
 Hirschfeld" <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>, "CK
 Hu" <ck.hu@mediatek.com>
Subject: [PATCH v8 08/12] drm/mediatek: Get rid of mtk_smi_larb_get/put
Date: Wed, 29 Sep 2021 09:37:15 +0800
Message-ID: <20210929013719.25120-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210929013719.25120-1-yong.wu@mediatek.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_184129_374990_6EA306D5 
X-CRM114-Status: GOOD (  19.96  )
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

MediaTek IOMMU has already added the device_link between the consumer
and smi-larb device. If the drm device call the pm_runtime_get_sync,
the smi-larb's pm_runtime_get_sync also be called automatically.

CC: CK Hu <ck.hu@mediatek.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Evan Green <evgreen@chromium.org>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de> # BPI-R2/MT7623
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 10 ------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 36 ++-------------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  5 +--
 4 files changed, 3 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 455ea23c6130..445c30cc823f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -12,7 +12,6 @@
 #include <linux/soc/mediatek/mtk-mutex.h>
 
 #include <asm/barrier.h>
-#include <soc/mediatek/smi.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -643,22 +642,14 @@ static void mtk_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	DRM_DEBUG_DRIVER("%s %d\n", __func__, crtc->base.id);
 
-	ret = mtk_smi_larb_get(comp->larb_dev);
-	if (ret) {
-		DRM_ERROR("Failed to get larb: %d\n", ret);
-		return;
-	}
-
 	ret = pm_runtime_resume_and_get(comp->dev);
 	if (ret < 0) {
-		mtk_smi_larb_put(comp->larb_dev);
 		DRM_DEV_ERROR(comp->dev, "Failed to enable power domain: %d\n", ret);
 		return;
 	}
 
 	ret = mtk_crtc_ddp_hw_init(mtk_crtc);
 	if (ret) {
-		mtk_smi_larb_put(comp->larb_dev);
 		pm_runtime_put(comp->dev);
 		return;
 	}
@@ -695,7 +686,6 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 	mtk_crtc_ddp_hw_fini(mtk_crtc);
-	mtk_smi_larb_put(comp->larb_dev);
 	ret = pm_runtime_put(comp->dev);
 	if (ret < 0)
 		DRM_DEV_ERROR(comp->dev, "Failed to disable power domain: %d\n", ret);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 99cbf44463e4..48642e814370 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -414,37 +414,15 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 	return ret;
 }
 
-static int mtk_ddp_get_larb_dev(struct device_node *node, struct mtk_ddp_comp *comp,
-				struct device *dev)
-{
-	struct device_node *larb_node;
-	struct platform_device *larb_pdev;
-
-	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
-	if (!larb_node) {
-		dev_err(dev, "Missing mediadek,larb phandle in %pOF node\n", node);
-		return -EINVAL;
-	}
-
-	larb_pdev = of_find_device_by_node(larb_node);
-	if (!larb_pdev) {
-		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
-		of_node_put(larb_node);
-		return -EPROBE_DEFER;
-	}
-	of_node_put(larb_node);
-	comp->larb_dev = &larb_pdev->dev;
-
-	return 0;
-}
-
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 		      enum mtk_ddp_comp_id comp_id)
 {
 	struct platform_device *comp_pdev;
 	enum mtk_ddp_comp_type type;
 	struct mtk_ddp_comp_dev *priv;
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	int ret;
+#endif
 
 	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
 		return -EINVAL;
@@ -460,16 +438,6 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	}
 	comp->dev = &comp_pdev->dev;
 
-	/* Only DMA capable components need the LARB property */
-	if (type == MTK_DISP_OVL ||
-	    type == MTK_DISP_OVL_2L ||
-	    type == MTK_DISP_RDMA ||
-	    type == MTK_DISP_WDMA) {
-		ret = mtk_ddp_get_larb_dev(node, comp, comp->dev);
-		if (ret)
-			return ret;
-	}
-
 	if (type == MTK_DISP_AAL ||
 	    type == MTK_DISP_BLS ||
 	    type == MTK_DISP_CCORR ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index bb914d976cf5..1b582262b682 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -70,7 +70,6 @@ struct mtk_ddp_comp_funcs {
 struct mtk_ddp_comp {
 	struct device *dev;
 	int irq;
-	struct device *larb_dev;
 	enum mtk_ddp_comp_id id;
 	const struct mtk_ddp_comp_funcs *funcs;
 };
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index aec39724ebeb..c234293fc2c3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -603,11 +603,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 err_node:
 	of_node_put(private->mutex_node);
-	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++) {
+	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
 		of_node_put(private->comp_node[i]);
-		if (private->ddp_comp[i].larb_dev)
-			put_device(private->ddp_comp[i].larb_dev);
-	}
 	return ret;
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
