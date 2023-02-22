Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFC0C6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9DZFjHkXD9oTdu8QdUEq9lRR/LQtsT4fUSmrhHq+Zs=; b=Gj+g5FERPY+fNnUFBzt27bF9R7
	3LyawUoxNT7anWhe06uwlLOBOvrHUpqi/Xa1XkSIC1v9fV491vzg96EMK0wFxaJQxl4+FXSjkz4Vo
	yWakQy85Spyb6XSQ6Jt+CuLL4fWxdstbohgLG2blPFwb38z25cAk5Tdgtv2EkK3VhcVD4T5SDwj44
	unSyKq9fQMf39R1dQ0XX+ixv/lKo+n542Hx8MA2/5DtVfDfE072ur5V0nNn0+je3HVAyohPmQ9bPi
	MCipMVPFI8gT1CbHeYWI8u9Tw4URy6MNGGOMmqZdHfuZXJ6us1qkFqAVkfVfiSJgZP9dx+al6agTg
	IVztGkhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmN9-00BvfS-9q; Wed, 22 Feb 2023 10:29:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUleU-00BYiQ-GN; Wed, 22 Feb 2023 09:43:08 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B0B4866021D4;
	Wed, 22 Feb 2023 09:43:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058985;
	bh=QLUE6gweejlnVZKkySch/QDsSqbrZL8wTCZxRZLCRkA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Az6tc/ddE8y2KAl2HzuVlrtJbg8p6y/QCMj+LY17E+uey84JRNm4RVFIoZInorF/8
	 8P06AalpXwNGCvZwN2beagEfIoBEJengdPxXi8M4KTcGMs+pqnrMn3YTtRQh5QXbpy
	 t7KnGth9jk9pw9XF9pVr0tsCB3A90pAj8CJ5+d6Iox2XfTluMl1PpdeELngEaK5GYG
	 10+7PsORVre2ca4geI2lapOhIoFMSUVkUcQTjBGEAzMsK/LpbrmdWY8TzukUu4FlLM
	 6HDMs+UNts96Sn2BVBlrarM439J7aJO00j+tAD92TV10isK9HWbKyueRoZW3eYg9bI
	 I0uVTCubJK0WA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 8/9] soc: mediatek: cmdq: Add inline functions for !CONFIG_MTK_CMDQ
Date: Wed, 22 Feb 2023 10:42:52 +0100
Message-Id: <20230222094253.23678-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
References: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_014306_783443_46F5DEB4 
X-CRM114-Status: UNSURE (   9.80  )
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

In preparation for a cleanup of ifdef instances of IS_REACHABLE() for
the CONFIG_MTK_CMDQ configuration option, add inline functions that
will either return a failure or, for void functions, do nothing.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 include/linux/soc/mediatek/mtk-cmdq.h | 114 ++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 2b498f4f3946..649955d2cf5c 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -27,6 +27,8 @@ struct cmdq_client {
 	struct mbox_chan *chan;
 };
 
+#if IS_ENABLED(CONFIG_MTK_CMDQ)
+
 /**
  * cmdq_dev_get_client_reg() - parse cmdq client reg from the device
  *			       node of CMDQ client
@@ -277,4 +279,116 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
  */
 int cmdq_pkt_flush_async(struct cmdq_pkt *pkt);
 
+#else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
+
+static inline int cmdq_dev_get_client_reg(struct device *dev,
+					  struct cmdq_client_reg *client_reg, int idx)
+{
+	return -ENODEV;
+}
+
+static inline struct cmdq_client *cmdq_mbox_create(struct device *dev, int index)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline void cmdq_mbox_destroy(struct cmdq_client *client) { }
+
+static inline  struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline void cmdq_pkt_destroy(struct cmdq_pkt *pkt) { }
+
+static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
+{
+	return -ENOENT;
+}
+
+static inline int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
+				      u16 offset, u32 value, u32 mask)
+{
+	return -ENOENT;
+}
+
+static inline int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
+				  u16 addr_low, u16 reg_idx)
+{
+	return -ENOENT;
+}
+
+static inline int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
+				   u16 addr_low, u16 src_reg_idx)
+{
+	return -ENOENT;
+}
+
+static inline int cmdq_pkt_write_s_mask(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
+					u16 addr_low, u16 src_reg_idx, u32 mask)
+{
+	return -ENOENT;
+}
+
+static inline int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
+					 u16 addr_low, u32 value)
+{
+	return -ENOENT;
+}
+
+static inline int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
+					      u16 addr_low, u32 value, u32 mask)
+{
+	return -ENOENT;
+}
+
+static inline int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_pkt_clear_event(struct cmdq_pkt *pkt, u16 event)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_pkt_set_event(struct cmdq_pkt *pkt, u16 event)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
+				u16 offset, u32 value)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
+				     u16 offset, u32 value, u32 mask)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
+{
+	return -EINVAL;
+}
+
+#endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
+
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.39.2


