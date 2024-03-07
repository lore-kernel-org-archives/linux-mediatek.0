Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53F4C54E41
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 01:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IVxyUh81LU6YKFwdjw+QHiZscbAIjJJqLNb5lFP15s=; b=sWcifcMhpWDJOylT0KFpfVYkpe
	18ZdP1bONR8zABkcCfbiTR80UTnlb6fFrrgjtppbWtMnGUVSw5T7jNCKSkNgxwfhI+zjbZqVSBunO
	mHxCG07O3Wi8DHRXlVoojPVTAzbdebxYCp90wlzWVfyP7kmRDf7iPeYLpkYCAmhrCQmjesrMF/mVo
	/HA+qQNqKGllSIjamBmLqWivJxjHEeq1Qx47so7lUUm9PghwAhswetv+Fjhf+1QjqPul0f1u4hypK
	6JtQkUpSxfL9RynljgqZx1GNAQH126kinr4uzRk7dFF/vopAGfbCiQsPZ4A6BVx0xe8newERHqH6H
	IWxyqxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri2fD-00000002XNy-3p1m;
	Thu, 07 Mar 2024 01:35:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri2f9-00000002XL6-38wp;
	Thu, 07 Mar 2024 01:35:13 +0000
X-UUID: eb9807b2dc2211eea8a22560583bddef-20240306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8IVxyUh81LU6YKFwdjw+QHiZscbAIjJJqLNb5lFP15s=;
	b=BxgMekuoy3sIxhgP/GyqRyCKSAm4/l/2OwuBQbsKkxp3VEXtsvy378UqmuwXALIP+MvKREOKgWJr3nfYUQQI6lDAp/CejQmxOfVe0IiOzLHH7EBzBg3ONEHeHTo37ijo9goNNALcca0rBakMsQVO7uqNwQ5wIytpn9wKRe2ctSk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:8fb8ef90-56b3-475c-92b4-d9da4ec0c6cb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:907bb484-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: eb9807b2dc2211eea8a22560583bddef-20240306
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1762723770; Wed, 06 Mar 2024 18:35:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
Subject: [PATCH v2 2/4] soc: mediatek: mtk-cmdq: Add cmdq_pkt_mem_move() function
Date: Thu, 7 Mar 2024 09:34:56 +0800
Message-ID: <20240307013458.23550-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240307013458.23550-1-jason-jh.lin@mediatek.com>
References: <20240307013458.23550-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_173512_046932_472D3A6E 
X-CRM114-Status: GOOD (  13.63  )
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

Add cmdq_pkt_mem_move() function to support CMDQ user making
an instruction for moving a value from a source address to a
destination address.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 26 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 12 ++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index b0cd071c4719..111b5b47ac8f 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -299,6 +299,32 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
 
+int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_addr)
+{
+	const u16 high_addr_reg_idx  = CMDQ_THR_SPR_IDX0;
+	const u16 value_reg_idx = CMDQ_THR_SPR_IDX1;
+	int ret;
+
+	/* read the value of src_addr into high_addr_reg_idx */
+	ret = cmdq_pkt_assign(pkt, high_addr_reg_idx, CMDQ_ADDR_HIGH(src_addr));
+	if (ret < 0)
+		return ret;
+	ret = cmdq_pkt_read_s(pkt, high_addr_reg_idx, CMDQ_ADDR_LOW(src_addr), value_reg_idx);
+	if (ret < 0)
+		return ret;
+
+	/* write the value of value_reg_idx into dst_addr */
+	ret = cmdq_pkt_assign(pkt, high_addr_reg_idx, CMDQ_ADDR_HIGH(dst_addr));
+	if (ret < 0)
+		return ret;
+	ret = cmdq_pkt_write_s(pkt, high_addr_reg_idx, CMDQ_ADDR_LOW(dst_addr), value_reg_idx);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(cmdq_pkt_mem_move);
+
 int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 1dae80185f9f..f07c9e2e0855 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -182,6 +182,18 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 				u16 addr_low, u32 value, u32 mask);
 
+/**
+ * cmdq_pkt_mem_move() - append memory move command to the CMDQ packet
+ * @pkt:	the CMDQ packet
+ * @src_addr:	source address
+ * @dst_addr:	destination address
+ *
+ * Appends a CMDQ command to copy the value found in `src_addr` to `dst_addr`.
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_addr);
+
 /**
  * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
  * @pkt:	the CMDQ packet
-- 
2.18.0


