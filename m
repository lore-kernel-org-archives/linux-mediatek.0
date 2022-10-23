Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C186FA373E
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Oct 2022 18:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNhR7Q4atrnFwHvWAFzt9a4DOAJQ/Ns6eXFZUm9NkhI=; b=v55/1yEje3u7E5o8PcX2luFpQC
	9poqTnqEyLXeyfzuy9QgP/eppY99Lipy0qnay8cHiYRKZamOw4xSx+h36HgnvzGknopAMnQHlrTR3
	WpZo0vTeICxCKOp5vAtUGvgKqQ42OWgJjxkv9/l4b5D2s10NKk0rx8COQmIg+d4gqpUT/F6Nhs815
	HTlhZwVDhESIX4iAl+8qGwpMnAE3kZO/HywnACC/2uH1FmbntJLgS+tp2ZVBDZhBkO0rTGc06Rumi
	NfvDii9u7kIQ1BRYLDRNeniga3jStC8uuIX3sSf9yjeFJzOmwhzFT6HZm/0t8EDxS2l814VTQHJFv
	xH8d94Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omfiV-00FxWz-Gz; Sun, 23 Oct 2022 18:28:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omfiJ-00FxPx-W0
	for linux-mediatek@lists.infradead.org; Sun, 23 Oct 2022 18:28:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 97F15B80DAD;
	Sun, 23 Oct 2022 18:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBAB5C433C1;
	Sun, 23 Oct 2022 18:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666549725;
	bh=qXT4GPzDeP9IpTekE6kjrT6VMQoqce0Ms6UpGOHy2nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRvj51M/OxQmVj0B89xeCv1ZlyFJ6ww2JE+ShGI4L80x7oCUimyz33P/NigCdyEOl
	 Mx1qO0KSpWzLzoNVF5aPiKBJVvpnEHjaJjwY2AFRFwFap48xM0CrdONxTfHQjUKdGL
	 arO7522VDJi57chlikXgMVEqihK81a1w5FIlkfFR3GQ13fS0if/gb/jJ3/0bjEDt+Z
	 ms20B6i8cDu7s7vmcqzJNhoq0MsrRxjot0lqgOilgc3ZByQ3YW2MFM4hF+mRQ9SW1B
	 pzIs/S51LYgWVJiERg3qMNQ68iCx1iTHBktg4Uv9M1f6c1ZYOmJeBogiB1GHtG+vG/
	 KfKtaJV7vUOjA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	daniel@makrotopia.org
Subject: [PATCH v2 net-next 6/6] net: ethernet: mtk_wed: add rx mib counters
Date: Sun, 23 Oct 2022 20:28:10 +0200
Message-Id: <920207544cd3810db3e993742f4644c48c720050.1666549145.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1666549145.git.lorenzo@kernel.org>
References: <cover.1666549145.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_112848_368775_CC912813 
X-CRM114-Status: GOOD (  12.50  )
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

Introduce WED RX MIB counters support available on MT7986a SoC.

Tested-by: Daniel Golle <daniel@makrotopia.org>
Co-developed-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/ethernet/mediatek/mtk_wed_debugfs.c   | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
index f420f187e837..56f663439721 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2021 Felix Fietkau <nbd@nbd.name> */
 
 #include <linux/seq_file.h>
+#include <linux/soc/mediatek/mtk_wed.h>
 #include "mtk_wed.h"
 #include "mtk_wed_regs.h"
 
@@ -18,6 +19,8 @@ enum {
 	DUMP_TYPE_WDMA,
 	DUMP_TYPE_WPDMA_TX,
 	DUMP_TYPE_WPDMA_TXFREE,
+	DUMP_TYPE_WPDMA_RX,
+	DUMP_TYPE_WED_RRO,
 };
 
 #define DUMP_STR(_str) { _str, 0, DUMP_TYPE_STRING }
@@ -36,6 +39,9 @@ enum {
 
 #define DUMP_WPDMA_TX_RING(_n) DUMP_RING("WPDMA_TX" #_n, 0, DUMP_TYPE_WPDMA_TX, _n)
 #define DUMP_WPDMA_TXFREE_RING DUMP_RING("WPDMA_RX1", 0, DUMP_TYPE_WPDMA_TXFREE)
+#define DUMP_WPDMA_RX_RING(_n)	DUMP_RING("WPDMA_RX" #_n, 0, DUMP_TYPE_WPDMA_RX, _n)
+#define DUMP_WED_RRO_RING(_base)DUMP_RING("WED_RRO_MIOD", MTK_##_base, DUMP_TYPE_WED_RRO)
+#define DUMP_WED_RRO_FDBK(_base)DUMP_RING("WED_RRO_FDBK", MTK_##_base, DUMP_TYPE_WED_RRO)
 
 static void
 print_reg_val(struct seq_file *s, const char *name, u32 val)
@@ -57,6 +63,7 @@ dump_wed_regs(struct seq_file *s, struct mtk_wed_device *dev,
 				   cur > regs ? "\n" : "",
 				   cur->name);
 			continue;
+		case DUMP_TYPE_WED_RRO:
 		case DUMP_TYPE_WED:
 			val = wed_r32(dev, cur->offset);
 			break;
@@ -69,6 +76,9 @@ dump_wed_regs(struct seq_file *s, struct mtk_wed_device *dev,
 		case DUMP_TYPE_WPDMA_TXFREE:
 			val = wpdma_txfree_r32(dev, cur->offset);
 			break;
+		case DUMP_TYPE_WPDMA_RX:
+			val = wpdma_rx_r32(dev, cur->base, cur->offset);
+			break;
 		}
 		print_reg_val(s, cur->name, val);
 	}
@@ -132,6 +142,80 @@ wed_txinfo_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(wed_txinfo);
 
+static int
+wed_rxinfo_show(struct seq_file *s, void *data)
+{
+	static const struct reg_dump regs[] = {
+		DUMP_STR("WPDMA RX"),
+		DUMP_WPDMA_RX_RING(0),
+		DUMP_WPDMA_RX_RING(1),
+
+		DUMP_STR("WPDMA RX"),
+		DUMP_WED(WED_WPDMA_RX_D_MIB(0)),
+		DUMP_WED_RING(WED_WPDMA_RING_RX_DATA(0)),
+		DUMP_WED(WED_WPDMA_RX_D_PROCESSED_MIB(0)),
+		DUMP_WED(WED_WPDMA_RX_D_MIB(1)),
+		DUMP_WED_RING(WED_WPDMA_RING_RX_DATA(1)),
+		DUMP_WED(WED_WPDMA_RX_D_PROCESSED_MIB(1)),
+		DUMP_WED(WED_WPDMA_RX_D_COHERENT_MIB),
+
+		DUMP_STR("WED RX"),
+		DUMP_WED_RING(WED_RING_RX_DATA(0)),
+		DUMP_WED_RING(WED_RING_RX_DATA(1)),
+
+		DUMP_STR("WED RRO"),
+		DUMP_WED_RRO_RING(WED_RROQM_MIOD_CTRL0),
+		DUMP_WED(WED_RROQM_MID_MIB),
+		DUMP_WED(WED_RROQM_MOD_MIB),
+		DUMP_WED(WED_RROQM_MOD_COHERENT_MIB),
+		DUMP_WED_RRO_FDBK(WED_RROQM_FDBK_CTRL0),
+		DUMP_WED(WED_RROQM_FDBK_IND_MIB),
+		DUMP_WED(WED_RROQM_FDBK_ENQ_MIB),
+		DUMP_WED(WED_RROQM_FDBK_ANC_MIB),
+		DUMP_WED(WED_RROQM_FDBK_ANC2H_MIB),
+
+		DUMP_STR("WED Route QM"),
+		DUMP_WED(WED_RTQM_R2H_MIB(0)),
+		DUMP_WED(WED_RTQM_R2Q_MIB(0)),
+		DUMP_WED(WED_RTQM_Q2H_MIB(0)),
+		DUMP_WED(WED_RTQM_R2H_MIB(1)),
+		DUMP_WED(WED_RTQM_R2Q_MIB(1)),
+		DUMP_WED(WED_RTQM_Q2H_MIB(1)),
+		DUMP_WED(WED_RTQM_Q2N_MIB),
+		DUMP_WED(WED_RTQM_Q2B_MIB),
+		DUMP_WED(WED_RTQM_PFDBK_MIB),
+
+		DUMP_STR("WED WDMA TX"),
+		DUMP_WED(WED_WDMA_TX_MIB),
+		DUMP_WED_RING(WED_WDMA_RING_TX),
+
+		DUMP_STR("WDMA TX"),
+		DUMP_WDMA(WDMA_GLO_CFG),
+		DUMP_WDMA_RING(WDMA_RING_TX(0)),
+		DUMP_WDMA_RING(WDMA_RING_TX(1)),
+
+		DUMP_STR("WED RX BM"),
+		DUMP_WED(WED_RX_BM_BASE),
+		DUMP_WED(WED_RX_BM_RX_DMAD),
+		DUMP_WED(WED_RX_BM_PTR),
+		DUMP_WED(WED_RX_BM_TKID_MIB),
+		DUMP_WED(WED_RX_BM_BLEN),
+		DUMP_WED(WED_RX_BM_STS),
+		DUMP_WED(WED_RX_BM_INTF2),
+		DUMP_WED(WED_RX_BM_INTF),
+		DUMP_WED(WED_RX_BM_ERR_STS),
+	};
+	struct mtk_wed_hw *hw = s->private;
+	struct mtk_wed_device *dev = hw->wed_dev;
+
+	if (!dev)
+		return 0;
+
+	dump_wed_regs(s, dev, regs, ARRAY_SIZE(regs));
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(wed_rxinfo);
 
 static int
 mtk_wed_reg_set(void *data, u64 val)
@@ -175,4 +259,7 @@ void mtk_wed_hw_add_debugfs(struct mtk_wed_hw *hw)
 	debugfs_create_u32("regidx", 0600, dir, &hw->debugfs_reg);
 	debugfs_create_file_unsafe("regval", 0600, dir, hw, &fops_regval);
 	debugfs_create_file_unsafe("txinfo", 0400, dir, hw, &wed_txinfo_fops);
+	if (hw->version != 1)
+		debugfs_create_file_unsafe("rxinfo", 0400, dir, hw,
+					   &wed_rxinfo_fops);
 }
-- 
2.37.3


