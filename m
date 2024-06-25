Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AC6C30653
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P6NGLArjM/jU5V8YJGX2B1WlLVZG4c754OTzUfKkh2M=; b=nIZZgW3FO0f0eNNLAm7s8xzlo5
	iQWgqYgxHi/5/PHV3Z9vh6nEJ8Jgu9C7XafGGst3UoKltrIyzBacFFJ+1RaqI/SpPywTsDW3I/0EG
	nSJeWJe/qMWMjRCs3tucQkzdcPBO6jFGX4q3wEqoAm+HN2YB/vYeWYCGmvZ3uKLPS5srCoogsoRE5
	qfm1wLogOkHrQltgF3sFvAWURNR90fH4djCnHRXvHPMgDRYzPW1ZxNL3AmtN5vNL+4WsIbUYPypXW
	GDdXRtM7Zhoaa9NMzGzFVk5WMCRFiTVwuFDoaXbhTJeQqjLS9YwAEl9sBzwjZUtvLjlVbimfUaQUD
	VIRht+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1il-000000029GK-1hrz;
	Tue, 25 Jun 2024 08:40:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1ii-000000029FR-3MRM;
	Tue, 25 Jun 2024 08:40:10 +0000
X-UUID: 82c9ce5c32ce11ef9daba96ee3f3cc8c-20240625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=P6NGLArjM/jU5V8YJGX2B1WlLVZG4c754OTzUfKkh2M=;
	b=NWYItuT/8PY92qGnJ8xdpDMBi5qhVJrOSKSGhCvE3RZHKe6AkJgopVetG4LnQZTM9v5fCeDr/Fj8K3x1C5K3VYNOLE+8ei+gzq7jOWFuiq5L9prbMqIP7jiJQOjfjgM6xpqYJRK3cuu7pxc+I7zkLJdibs1P//ncxs8H2CBi6uQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:4f3a2bc9-2b5f-4540-aa9e-90ad5380ff07,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:6da00189-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 82c9ce5c32ce11ef9daba96ee3f3cc8c-20240625
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 662605140; Tue, 25 Jun 2024 01:40:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 25 Jun 2024 16:39:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 25 Jun 2024 16:39:58 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>
Subject: [PATCH] soc: mtk-cmdq: Add cmdq_pkt_logic_command to support math operation
Date: Tue, 25 Jun 2024 16:39:57 +0800
Message-ID: <20240625083957.3540-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_014008_889226_18D11666 
X-CRM114-Status: GOOD (  15.79  )
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

Add cmdq_pkt_logic_command to support math operation.

cmdq_pkt_logic_command can append logic command to the CMDQ packet,
ask GCE to execute a arithmetic calculate instruction,
such as add, subtract, multiply, AND, OR and NOT, etc.

Note that all arithmetic instructions are unsigned calculations.
If there are any overflows, GCE will sent the invalid IRQ to notify
CMDQ driver.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 34 +++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 42 ++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 046522664dc1..f3cd15387f2d 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -15,6 +15,7 @@
 /* dedicate the last GPR_R15 to assign the register address to be poll */
 #define CMDQ_POLL_ADDR_GPR	(15)
 #define CMDQ_EOC_IRQ_EN		BIT(0)
+#define CMDQ_IMMEDIATE_VALUE	0
 #define CMDQ_REG_TYPE		1
 #define CMDQ_JUMP_RELATIVE	0
 #define CMDQ_JUMP_ABSOLUTE	1
@@ -45,6 +46,16 @@ struct cmdq_instruction {
 	u8 op;
 };
 
+static inline u8 cmdq_operand_get_type(struct cmdq_operand *op)
+{
+	return op->reg ? CMDQ_REG_TYPE : CMDQ_IMMEDIATE_VALUE;
+}
+
+static inline u16 cmdq_operand_get_idx_value(struct cmdq_operand *op)
+{
+	return op->reg ? op->idx : op->value;
+}
+
 int cmdq_dev_get_client_reg(struct device *dev,
 			    struct cmdq_client_reg *client_reg, int idx)
 {
@@ -461,6 +472,29 @@ int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mas
 }
 EXPORT_SYMBOL(cmdq_pkt_poll_addr);
 
+int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, u16 result_reg_idx,
+			   struct cmdq_operand *left_operand,
+			   enum cmdq_logic_op s_op,
+			   struct cmdq_operand *right_operand)
+{
+	struct cmdq_instruction inst = { {0} };
+
+	if (!left_operand || !right_operand || s_op >= CMDQ_LOGIC_MAX)
+		return -EINVAL;
+
+	inst.op = CMDQ_CODE_LOGIC;
+	inst.dst_t = CMDQ_REG_TYPE;
+	inst.src_t = cmdq_operand_get_type(left_operand);
+	inst.arg_c_t = cmdq_operand_get_type(right_operand);
+	inst.sop = s_op;
+	inst.reg_dst = result_reg_idx;
+	inst.src_reg = cmdq_operand_get_idx_value(left_operand);
+	inst.arg_c = cmdq_operand_get_idx_value(right_operand);
+
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_logic_command);
+
 int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 {
 	struct cmdq_instruction inst = {};
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index d4a8e34505e6..5bee6f7fc400 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -25,6 +25,31 @@
 
 struct cmdq_pkt;
 
+enum cmdq_logic_op {
+	CMDQ_LOGIC_ASSIGN = 0,
+	CMDQ_LOGIC_ADD = 1,
+	CMDQ_LOGIC_SUBTRACT = 2,
+	CMDQ_LOGIC_MULTIPLY = 3,
+	CMDQ_LOGIC_XOR = 8,
+	CMDQ_LOGIC_NOT = 9,
+	CMDQ_LOGIC_OR = 10,
+	CMDQ_LOGIC_AND = 11,
+	CMDQ_LOGIC_LEFT_SHIFT = 12,
+	CMDQ_LOGIC_RIGHT_SHIFT = 13,
+	CMDQ_LOGIC_MAX,
+};
+
+struct cmdq_operand {
+	/* register type */
+	bool reg;
+	union {
+		/* index */
+		u16 idx;
+		/* value */
+		u16 value;
+	};
+};
+
 struct cmdq_client_reg {
 	u8 subsys;
 	u16 offset;
@@ -272,6 +297,23 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
 int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 		       u16 offset, u32 value, u32 mask);
 
+/**
+ * cmdq_pkt_logic_command() - Append logic command to the CMDQ packet, ask GCE to
+ *		          execute an instruction that store the result of logic operation
+ *		          with left and right operand into result_reg_idx.
+ * @pkt:		the CMDQ packet
+ * @result_reg_idx:	SPR index that store operation result of left_operand and right_operand
+ * @left_operand:	left operand
+ * @s_op:		the logic operator enum
+ * @right_operand:	right operand
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, u16 result_reg_idx,
+			   struct cmdq_operand *left_operand,
+			   enum cmdq_logic_op s_op,
+			   struct cmdq_operand *right_operand);
+
 /**
  * cmdq_pkt_assign() - Append logic assign command to the CMDQ packet, ask GCE
  *		       to execute an instruction that set a constant value into
-- 
2.18.0


