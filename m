Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6D8C6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVJyKjrhaqRZ0w/StQGRkSFgwa0DYFt5USJ+Q9kZUu0=; b=dMDNNJCn/T05PjIZAeviZID5q7
	KfCDyYP9Rpi5OVjzKVnczX9pgkEdgquRAeMZy1iRf3qmZ1RaleUkkj7qSngrPW+163J0L9uFczJqR
	hsdRwMbwKZOCwzxR5Y+RjMysRZr3pwq0op3sgNDI585TDG67wr6p2egrXSB/kycVeGT/81M7uTOo2
	egznn7PZ5AuGiBEZdxtCiHdKE2r4lE7U5UcOs9hqqsJCQG+0twjETq1MTMQ0R6QeGsaqU84fBw7lR
	iAz48UYJR945AwiRcKhGJEcRwiC+R8jrFpivpTuQd5b8PWzKGXvivxyWxblOccXyLw1z1Kybk1s3w
	faNi7sNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmNP-00Bvns-6E; Wed, 22 Feb 2023 10:29:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUleV-00BYiw-7r; Wed, 22 Feb 2023 09:43:08 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 627B866021D5;
	Wed, 22 Feb 2023 09:43:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058985;
	bh=t0WQRQY93wT7Ed+artLK4huBmFp5RCO/YHHv1kqN5ow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ihCuNPi0WgxnIHJEEL+kMrFdWXEi9a4xwIiBOZoekKc0R1UMCAscg4QF16nCCkfw5
	 bEwK2qBpTo/xZzWahGFe2Xt2JHnkzsnbqyD/NTM5Q8N92XPpPxcilEv95/gLSuoE1G
	 l19rMU234gvbymd2bprEeJBPS8kIETCZds1t72eG/hFBT6D/6m8ko9BByk7IKTUKrM
	 ZWcZRuOm8BPL1g5+JgHVh8C2aAW3tXGpXc+nW7xkRWTRsVMwF1CDkQzc2wBmR7KmaT
	 Ov8Tc888vKvh7sS3KQBmOWpZkn2pjn8LQETcdxJtj/40vzb3FoCWGlXjOD04banzzD
	 iYLlSU5XpaEnA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 9/9] soc: mediatek: Cleanup ifdefs for IS_REACHABLE(CONFIG_MTK_CMDQ)
Date: Wed, 22 Feb 2023 10:42:53 +0100
Message-Id: <20230222094253.23678-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
References: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_014307_458749_008D18E7 
X-CRM114-Status: GOOD (  17.29  )
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

Now that the mtk-cmdq.h header contains inline functions for cases
in which the driver is not enabled (either module or built-in), we
can safely go on with cleaning up ifdefs for CMDQ handling.

This also shows in a clearer manner that writing through CMDQ HW is
optional and used only for performance purposes when/where wanted,
needed and/or required.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/soc/mediatek/mtk-mmsys.c | 22 +++++++++-------------
 drivers/soc/mediatek/mtk-mutex.c | 15 +++------------
 2 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 0f0fa27e17a5..8da5c8d26ed0 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -131,21 +131,18 @@ struct mtk_mmsys {
 static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val,
 				  struct cmdq_pkt *cmdq_pkt)
 {
+	int ret;
 	u32 tmp;
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	if (cmdq_pkt) {
-		if (mmsys->cmdq_base.size == 0) {
-			pr_err("mmsys lose gce property, failed to update mmsys bits with cmdq");
+	if (mmsys->cmdq_base.size && cmdq_pkt) {
+		ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
+					  mmsys->cmdq_base.offset + offset, val,
+					  mask);
+		if (ret)
+			pr_debug("CMDQ unavailable: using CPU write\n");
+		else
 			return;
-		}
-		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
-				    mmsys->cmdq_base.offset + offset, val,
-				    mask);
-		return;
 	}
-#endif
-
 	tmp = readl_relaxed(mmsys->regs + offset);
 	tmp = (tmp & ~mask) | (val & mask);
 	writel_relaxed(tmp, mmsys->regs + offset);
@@ -332,11 +329,10 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		}
 	}
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	/* CMDQ is optional */
 	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
 	if (ret)
 		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
-#endif
 
 	platform_set_drvdata(pdev, mmsys);
 
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index b106f3d23e0d..b92cffec7be7 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -871,23 +871,18 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
 	if (!mtx->cmdq_reg.size) {
 		dev_err(mtx->dev, "mediatek,gce-client-reg hasn't been set");
-		return -EINVAL;
+		return -ENODEV;
 	}
 
 	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
 		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
 	return 0;
-#else
-	dev_err(mtx->dev, "Not support for enable MUTEX by CMDQ");
-	return -ENODEV;
-#endif
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
 
@@ -1000,10 +995,7 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_mutex_ctx *mtx;
 	struct resource *regs;
-	int i;
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	int ret;
-#endif
+	int i, ret;
 
 	mtx = devm_kzalloc(dev, sizeof(*mtx), GFP_KERNEL);
 	if (!mtx)
@@ -1030,11 +1022,10 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 	}
 	mtx->addr = regs->start;
 
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	/* CMDQ is optional */
 	ret = cmdq_dev_get_client_reg(dev, &mtx->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
-#endif
 
 	platform_set_drvdata(pdev, mtx);
 
-- 
2.39.2


