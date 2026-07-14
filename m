Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F77CC44507
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2026 11:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bgw+W6x3XwOGpOBbewWu0rWA6FzM7Udtsxnl2GDqZSc=; b=FlrYY1KSA8heGE3r0JGdA7Zozw
	xqP5Ksl5zZwuTnZ02wgw/wCRaTCzt4HPOXH1Yi+ijrG54jv78eSq3hQ1TsreA5y+4mRrIt3TP9R9x
	1mtHcmTh0wS45POEYriqaY6w5Xs77PQpe4t79ECvNKXvHlSlZytmP0DRaq7R2rQ7kfHVx/HUqDYtW
	3hrayEEAqg+fIfR9uuDfbwET3bTIor5KipcMzoUsG4yLbVvcTQ9N7s6Y3sJBnf6q4ref0Y6J3/t/V
	jmj4pkIeL8LcE8d/AfpPeZtVZWCf9NMM662JtAlhSR0zX6hIvPWExB4HHfBUizbDsm+a62oOKBnZU
	Tnw/QksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjba3-0000000BjwB-0mXr;
	Tue, 14 Jul 2026 11:45:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZJ-0000000BikD-06ov;
	Tue, 14 Jul 2026 11:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029495;
	bh=s6Vj1WZujnvXkBCJEH/Iq1V9qS+ywOCxMkXWi8KrhAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iQqAKbDD3YnVKW5TOlrwucYuuRYXYBd0OIlnK6/CIMTIM2wvMPRGPyTepKFhJUC3K
	 IHbiHBjaQ8yPm7tAvsKR9i9izex+TtuuOyKEfaANYFYTrE7cmyDCGrRWeKbHl3ZZgu
	 1SBmabcNYsdKVmRDs77ZwFUbyyDU9ZIZjR6pRa59n2tSfe1QsSCqi7Q4Ue7zYHKqId
	 4NhVDoq3u7iYjVDo2cvZXBVbhnsPW/L+5F5LtLklRO0IllQHVp+6GpMDMatPX7qH/q
	 NAuozkkRzu1NsxzhhFQiSYEUnsHiLZUMiqjTOko/Dit7Qr4XTN9TtgX8tWWDakp415
	 huIJHKXNktnoA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 389A617E0FD0;
	Tue, 14 Jul 2026 13:44:54 +0200 (CEST)
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
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 21/46] soc: mediatek: mtk-mutex: Add new functions to add/remove triggers
Date: Tue, 14 Jul 2026 13:43:49 +0200
Message-ID: <20260714114414.184512-22-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044457_290148_1D5B9FD0 
X-CRM114-Status: GOOD (  13.66  )
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

Add new mtk_mutex_add_trigger() and mtk_mutex_remove_trigger() to
replace, in the near future, their older style equivalents such as
mtk_mutex_add_comp() and mtk_mutex_remove_comp() for the Display
Controller related MuteX triggers.

The same functions will be used to also replace the Media Data
Path 3 (MDP3) specific mtk_mutex_write_mod(), unifying the MuteX
handling across all of the currently supported multimedia-related
drivers for MediaTek SoCs.

While at it, this also takes into account the upcoming refactoring
of mtk_mmsys and mediatek-drm, which are about to migrate to a new
Component "Type -> Hardware ID" mapping, by adding a new function
parameter "hw_inst_id" to support that.

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 60 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mutex.h |  6 +++
 2 files changed, 66 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index eb5d381ff5af..ef8e77f7e2f6 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -887,6 +887,65 @@ void mtk_mutex_unprepare(struct mtk_mutex *mutex)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_unprepare);
 
+static enum mtk_mutex_sof_id mtk_mutex_get_sof_trig(enum mtk_ddp_comp_type type,
+						    unsigned int hw_inst_id)
+{
+	switch (type) {
+	case MTK_DISP_DSI:
+		return MUTEX_SOF_DSI0 + hw_inst_id;
+	case MTK_DISP_DPI:
+		return MUTEX_SOF_DPI0 + hw_inst_id;
+	case MTK_DISP_DP_INTF:
+		return MUTEX_SOF_DP_INTF0 + hw_inst_id;
+	default:
+		break;
+	}
+
+	return DDP_MUTEX_SOF_MAX;
+}
+
+void mtk_mutex_add_trigger(struct mtk_mutex *mutex, enum mtk_ddp_comp_type type,
+			   unsigned int hw_inst_id, unsigned int mtx_trig_id)
+{
+	struct mtk_mutex_ctx *ctx = container_of(mutex, struct mtk_mutex_ctx, mutex[mutex->id]);
+	enum mtk_mutex_sof_id sof_id = mtk_mutex_get_sof_trig(type, hw_inst_id);
+	const u32 offset = DISP_REG_MUTEX_MOD(ctx, mtx_trig_id, mutex->id);
+	u32 val;
+
+	if (sof_id < DDP_MUTEX_SOF_MAX) {
+		const u32 sof_offset = DISP_REG_MUTEX_SOF(ctx->data->mutex_sof_reg, mutex->id);
+
+		writel(ctx->data->mutex_sof[sof_id], ctx->regs + sof_offset);
+		return;
+	}
+
+	val = readl(ctx->regs + offset);
+	writel(val | BIT(mtx_trig_id % 32), ctx->regs + offset);
+}
+EXPORT_SYMBOL_NS_GPL(mtk_mutex_add_trigger, "MTK_MUTEX");
+
+void mtk_mutex_remove_trigger(struct mtk_mutex *mutex, enum mtk_ddp_comp_type type,
+			      unsigned int hw_inst_id, unsigned int mtx_trig_id)
+{
+	struct mtk_mutex_ctx *ctx = container_of(mutex, struct mtk_mutex_ctx, mutex[mutex->id]);
+	enum mtk_mutex_sof_id sof_id = mtk_mutex_get_sof_trig(type, hw_inst_id);
+	const u32 offset = DISP_REG_MUTEX_MOD(ctx, mtx_trig_id, mutex->id);
+	u32 val;
+
+	if (sof_id < DDP_MUTEX_SOF_MAX) {
+		const u32 sof_offset = DISP_REG_MUTEX_SOF(ctx->data->mutex_sof_reg, mutex->id);
+
+		val = readl(ctx->regs + sof_offset);
+		writel(val & ~ctx->data->mutex_sof[sof_id], ctx->regs + sof_offset);
+		return;
+	}
+
+	val = readl(ctx->regs + offset);
+	writel(val & ~BIT(mtx_trig_id % 32), ctx->regs + offset);
+}
+EXPORT_SYMBOL_NS_GPL(mtk_mutex_remove_trigger, "MTK_MUTEX");
+
+/* TODO: Legacy - Scheduled for removal */
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id)
 {
@@ -938,6 +997,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
 
+/* TODO: Legacy - Scheduled for removal */
 void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			   enum mtk_ddp_comp_id id)
 {
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index 635218e3ac68..5368206dd62c 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -67,16 +67,22 @@ enum mtk_mutex_sof_index {
 	MUTEX_SOF_IDX_MAX		/* ALWAYS keep at the end */
 };
 
+enum mtk_ddp_comp_type;
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev);
 int mtk_mutex_prepare(struct mtk_mutex *mutex);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
+void mtk_mutex_add_trigger(struct mtk_mutex *mutex, enum mtk_ddp_comp_type type,
+			   unsigned int hw_inst_id, unsigned int mtx_trig_id);
 void mtk_mutex_enable(struct mtk_mutex *mutex);
 int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
 			     void *pkt);
 void mtk_mutex_disable(struct mtk_mutex *mutex);
 void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			   enum mtk_ddp_comp_id id);
+void mtk_mutex_remove_trigger(struct mtk_mutex *mutex, enum mtk_ddp_comp_type type,
+			      unsigned int hw_inst_id, unsigned int mtx_trig_id);
 void mtk_mutex_unprepare(struct mtk_mutex *mutex);
 void mtk_mutex_put(struct mtk_mutex *mutex);
 void mtk_mutex_acquire(struct mtk_mutex *mutex);
-- 
2.54.0


