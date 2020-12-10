Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B1CC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 16:32:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5118E23D57
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 16:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5118E23D57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjmo0xQ/Zrlka6Ia8FgaK+OpyRXWVSY92dZQA0KOPsc=; b=ww72n5Up5RFnig7LISfowxEMbv
	5Vh3rxPDE9kIIhlHuyg9hnzz/xOYpZNsrD5Kdh2q2TGhZEyAiOmWkHJ64nVinL2YTcN334SpRLcP3
	KepbQpf28AgZ1GC1Z4MqtWBLwOBo6cL9VPtQvPO6OQpwmLC91nZoBNzwPBPE8yWJlRVYfkSz4EsTr
	pamE4s4ZtmYEQNV2x427C38jab6VBzD+dyQYrWZkP5sH/wnQVLbHDcwy/cvIe6SOuJfeZOaKD6PQn
	hwisAua0AGLMFYrZWOQrTPw42ioFgVmNuGZKYmW4WfQmkkqF3mgnYY9GCB6I3CNPPzhbXJPySKITK
	aNFj7w1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knOrn-0001hF-Uo; Thu, 10 Dec 2020 16:32:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knOrj-0001P4-Si
 for linux-mediatek@merlin.infradead.org; Thu, 10 Dec 2020 16:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mssyP6pUt69AEHcUr4XGPIOvly2VMgDhiReadXQLwV0=; b=KM/aq+zh9oh6EAhsVJGybTZoZU
 jHAH99wZ2HVTKmS4Pcr8CVzlSszLNFxyLsY+nboQdxWF89B9gy0M+cYTRgky1UaFjtDW5GHrj35D3
 z9mEZIeWkUFikn043VcBpSQ1G37uJFWD4VwfAVzNQwRPPs9DEcRnozRi9PTUNV4GZJyvn0S2uDjlj
 FT+LrKTY1m5cI4PNRatllC9BKYEzBaAT0nzE4TgO5JImpYmZLTxoYwpBEQOQB2CnJo7N9nI2ZX6pg
 /UxMY49YWMjQP8SZtNH0RMxQtgusG3+5bhWFBjMiOT3c7MmKWGbs7pTfLYPJa9UIejFW/XY8ajTWN
 0A1iICvQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knOgu-00037n-Ea
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 16:21:19 +0000
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 07/12] drm/mediatek: Use struct cmdq_client_reg to gather
 cmdq variable
Date: Fri, 11 Dec 2020 00:10:45 +0800
Message-Id: <20201210161050.8460-8-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210161050.8460-1-chunkuang.hu@kernel.org>
References: <20201210161050.8460-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_162117_689978_2ECB82BF 
X-CRM114-Status: GOOD (  10.25  )
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
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 26 ++++++---------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  4 ++--
 2 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 775bc37c4045..14371d5863ae 100644
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
@@ -558,10 +558,6 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	struct platform_device *comp_pdev;
 	enum mtk_ddp_comp_type type;
 	struct mtk_ddp_comp_dev *priv;
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct resource res;
-	struct cmdq_client_reg cmdq_reg;
-#endif
 	int ret;
 
 	if (comp_id < 0 || comp_id >= DDP_COMPONENT_ID_MAX)
@@ -591,17 +587,9 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
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
 
 	/* Only DMA capable components need the LARB property */
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
