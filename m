Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D25C00A89
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 00:35:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB8822268
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 00:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YFzxUGJf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XITDO58T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BB8822268
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwLVXnUJ2NFmljWqA3ZubxuUV/MKJvhOnIQZkTkKZrs=; b=YFzxUGJfjyLvVWT4R6GGyTfZPt
	pK6a/iblG9sTBIjNY63IQ3vP40NxEj/JR6HXW2ZlzProLIirkWLoYZ9z3jenlSu3tqGwYQQ68kHDS
	MlMyvNyrByylVUA0GAAyCpqX+XPGyuYONUGYKt5X+3NhG/SMUhch/BRCgFOWHpWdDQqL9j1n92URZ
	uhUbqK9pwtxXaHLjjyoDb2CZKgIVVw5nRtTpRNTAdsF0TqycxlsAgUiVouEsfuTKIy4cBAOb+8K5d
	rx9d/Sz7f31KQ22fMd3ZEhXkCxJ0qXMHl1eKN9DjSxPAaNzjoATy+pFXlUp3O2bH7cuux8ynQ85zH
	qb+XqKQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZkI8-0001IK-6L; Tue, 03 Nov 2020 00:35:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZkHm-00016X-Lo
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 00:34:56 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8E26E223BD;
 Tue,  3 Nov 2020 00:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604363694;
 bh=HbuatlSyvwmzO4j/6WIksCn8cA+kxvt/2rktXwWL9uc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XITDO58TpzTlrfMv5Xjieto0YEzROzUDOviHDWY0R//hnPiFleQGIvHgNYMqpP5oS
 gS6T8EjHA+Lwm3JxR7xKHEmabKliP6Ib18fHssdcPl5a9syT7ZSgd6VGoTmad6bRg8
 H9VIlVWeqr7++yBj7qEwU05tjLHuJBdQcKKhKL+I=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 06/11] drm/mediatek: Use struct cmdq_client_reg to gather cmdq
 variable
Date: Tue,  3 Nov 2020 08:34:17 +0800
Message-Id: <20201103003422.17838-7-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103003422.17838-1-chunkuang.hu@kernel.org>
References: <20201103003422.17838-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_193455_374475_52390FE2 
X-CRM114-Status: GOOD (  15.48  )
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
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: CK Hu <ck.hu@mediatek.com>

struct cmdq_client_reg include subsys and offset, so use it to replace
these two variable.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 24 ++++++---------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  4 ++--
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 27daff9458d6..bf166b032fca 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -96,8 +96,8 @@ void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, comp->subsys,
-			       comp->regs_pa + offset, value);
+		cmdq_pkt_write(cmdq_pkt, comp->cmdq_reg.subsys,
+			       comp->cmdq_reg.offset + offset, value);
 	else
 #endif
 		writel(value, regs + offset);
@@ -109,8 +109,8 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt)
-		cmdq_pkt_write(cmdq_pkt, comp->subsys,
-			       comp->regs_pa + offset, value);
+		cmdq_pkt_write(cmdq_pkt, comp->cmdq_reg.subsys,
+			       comp->cmdq_reg.offset + offset, value);
 	else
 #endif
 		writel_relaxed(value, regs + offset);
@@ -122,8 +122,8 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 {
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (cmdq_pkt) {
-		cmdq_pkt_write_mask(cmdq_pkt, comp->subsys,
-				    comp->regs_pa + offset, value, mask);
+		cmdq_pkt_write_mask(cmdq_pkt, comp->cmdq_reg.subsys,
+				    comp->cmdq_reg.offset + offset, value, mask);
 	} else {
 #endif
 		u32 tmp = readl(regs + offset);
@@ -537,8 +537,6 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	struct platform_device *larb_pdev;
 	struct mtk_ddp_comp_dev *priv;
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct resource res;
-	struct cmdq_client_reg cmdq_reg;
 	int ret;
 #endif
 
@@ -569,17 +567,9 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	comp->dev = &comp_pdev->dev;
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (of_address_to_resource(node, 0, &res) != 0) {
-		dev_err(comp->dev, "Missing reg in %s node\n", node->full_name);
-		return -EINVAL;
-	}
-	comp->regs_pa = res.start;
-
-	ret = cmdq_dev_get_client_reg(comp->dev, &cmdq_reg, 0);
+	ret = cmdq_dev_get_client_reg(comp->dev, &comp->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(comp->dev, "get mediatek,gce-client-reg fail!\n");
-	else
-		comp->subsys = cmdq_reg.subsys;
 #endif
 
 	if (comp_id == DDP_COMPONENT_COLOR0 ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index e18299573d2b..621b07ef807e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -7,6 +7,7 @@
 #define MTK_DRM_DDP_COMP_H
 
 #include <linux/io.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
 
 struct device;
 struct device_node;
@@ -102,8 +103,7 @@ struct mtk_ddp_comp {
 	struct device *larb_dev;
 	enum mtk_ddp_comp_id id;
 	const struct mtk_ddp_comp_funcs *funcs;
-	resource_size_t regs_pa;
-	u8 subsys;
+	struct cmdq_client_reg cmdq_reg;
 };
 
 static inline int mtk_ddp_comp_clk_enable(struct mtk_ddp_comp *comp)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
