Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFD4C5475B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 01:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qozeXGlq1HPWjhIPE+mUg1AVfOhg2AA2XM+Vk2n0Jm0=; b=4w1awBZKw+DuYKwc93FlXCoCJb
	yKMnYcbiXAKtxfz3dchIz/6B8W6rQPZPUCS9h3IwSDalaYVA8elFkFgTkB58MPae6oIyXN259v2WI
	N7bRW3gHIzgLeEdd1enbJlyhbug7bdhKk4fw2Nvd2Mbd0cpjhxSpkEDg+MasS+3akheedSWsZVMmJ
	ZU/0jYS/4z3jWPvrK2rQ8lS8Oz303SOu6PcFOH3cGuP3tLlGaYfEofENQe+/TvodelqsrCLD5BhQW
	+Lp6QLNf6mUupmt0+QFMNflHjfX35aNHHA+z2rpIEt2w2uAcTPTWSn9AeaSHFFxa1n0TRjMA+FZ7n
	Bggs14Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri2z2-00000002a0d-1Lm5;
	Thu, 07 Mar 2024 01:55:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri2yy-00000002a03-0j8a;
	Thu, 07 Mar 2024 01:55:42 +0000
X-UUID: c9d31df8dc2511eea8a22560583bddef-20240306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qozeXGlq1HPWjhIPE+mUg1AVfOhg2AA2XM+Vk2n0Jm0=;
	b=jkv12huo17kEpX6Rc/d+5qiGFtpBFFqIKF4HpNvm8bxboSaUpyuKiBwgg/C4UH7Fmb5m2t6A3YBix3C+9IzirQFEBxgUkGqtBdwoqZzUSjZdHKWMKl2Z4Bvfo9Ir51VqMCYUy/86yErK48wr2t8WuJbaKWXRUcPceLhjtK5dyN0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:d0ce532e-e50a-4663-8c48-fb03c4716e27,IP:0,U
	RL:0,TC:0,Content:33,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:33
X-CID-META: VersionHash:6f543d0,CLOUDID:ca891b90-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:4,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c9d31df8dc2511eea8a22560583bddef-20240306
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 64321857; Wed, 06 Mar 2024 18:55:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Mar 2024 09:35:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Mar 2024 09:35:00 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 3/4] soc: mediatek: mtk-cmdq: Add cmdq_pkt_poll_addr() function
Date: Thu, 7 Mar 2024 09:34:57 +0800
Message-ID: <20240307013458.23550-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240307013458.23550-1-jason-jh.lin@mediatek.com>
References: <20240307013458.23550-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_175540_267971_0D738DC6 
X-CRM114-Status: GOOD (  18.77  )
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

Add cmdq_pkt_poll_addr function to support CMDQ user making
an instruction for polling a specific address of hardware rigster
to check the value with or without mask.

POLL is a legacy operation in GCE, so it does not support SPR and
CMDQ_CODE_LOGIC. To support polling the register address which doesn't
have the subsys id, CMDQ users need to make an instruction with GPR and
CMDQ_CODE_MASK operation to move the register address to be poll into GPR.
Then users can make an POLL instruction with GPR to poll the register
address assigned in previous instruction.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 49 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 16 +++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 111b5b47ac8f..4f69df743505 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -12,6 +12,8 @@
 
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
 #define CMDQ_POLL_ENABLE_MASK	BIT(0)
+/* dedicate the last GPR_R15 to assign the register address to be poll */
+#define CMDQ_POLL_ADDR_GPR	(15)
 #define CMDQ_EOC_IRQ_EN		BIT(0)
 #define CMDQ_REG_TYPE		1
 #define CMDQ_JUMP_RELATIVE	1
@@ -406,6 +408,53 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 }
 EXPORT_SYMBOL(cmdq_pkt_poll_mask);
 
+int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mask)
+{
+	struct cmdq_instruction inst = { {0} };
+	u8 use_mask = 0;
+	int ret;
+
+	/*
+	 * Append an MASK instruction to set the mask for following POLL instruction
+	 * which enables use_mask bit.
+	 */
+	if (mask != GENMASK(31, 0)) {
+		inst.op = CMDQ_CODE_MASK;
+		inst.mask = ~mask;
+		ret = cmdq_pkt_append_command(pkt, inst);
+		if (ret < 0)
+			return ret;
+		use_mask = CMDQ_POLL_ENABLE_MASK;
+	}
+
+	/*
+	 * POLL is an legacy operation in GCE and it does not support SPR and CMDQ_CODE_LOGIC,
+	 * so it can not use cmdq_pkt_assign to keep polling register address to SPR.
+	 * If user wants to poll a register address which doesn't have a subsys id,
+	 * user needs to use GPR and CMDQ_CODE_MASK to move polling register address to GPR.
+	 */
+	inst.op = CMDQ_CODE_MASK;
+	inst.dst_t = CMDQ_REG_TYPE;
+	inst.sop = CMDQ_POLL_ADDR_GPR;
+	inst.value = addr;
+	ret = cmdq_pkt_append_command(pkt, inst);
+	if (ret < 0)
+		return ret;
+
+	/* Append POLL instruction to poll the register address assign to GPR previously. */
+	inst.op = CMDQ_CODE_POLL;
+	inst.dst_t = CMDQ_REG_TYPE;
+	inst.sop = CMDQ_POLL_ADDR_GPR;
+	inst.offset = use_mask;
+	inst.value = value;
+	ret = cmdq_pkt_append_command(pkt, inst);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(cmdq_pkt_poll_addr);
+
 int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 {
 	struct cmdq_instruction inst = {};
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index f07c9e2e0855..b0004d097e23 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -255,6 +255,22 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
 int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 		       u16 offset, u32 value, u32 mask);
 
+/**
+ * cmdq_pkt_poll_addr() - Append blocking POLL command to CMDQ packet
+ * @pkt:	the CMDQ packet
+ * @addr:	the hardware register address
+ * @value:	the specified target register value
+ * @mask:	the specified target register mask
+ *
+ * Appends a polling (POLL) command to the CMDQ packet and asks the GCE
+ * to execute an instruction that checks for the specified `value` (with
+ * or without `mask`) to appear in the specified hardware register `addr`.
+ * All GCE threads will be blocked by this instruction.
+ *
+ * Return: 0 for success or negative error code
+ */
+int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mask);
+
 /**
  * cmdq_pkt_assign() - Append logic assign command to the CMDQ packet, ask GCE
  *		       to execute an instruction that set a constant value into
-- 
2.18.0


