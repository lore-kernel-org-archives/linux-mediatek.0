Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FDDC5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2jtfBQ99XTwNQWIlhNqeShiovjYiw2SHuwp+NS8xzo=; b=fuqXRvC3I1uIvCE0U0uBiUjNy1
	EOdAnodNXDjJwhihMqUTG7LLeIVlMQdaNaIETwrSZ/lF60h4gcztyTqU4rBO6ygadqPYNb+fgLFG2
	o9/fgy5ubHgkvdFdOn9A//cNlhD8TbKqNBKi+aZZCrikmIVE6neRdN6ZXbsg/7OKy24pvNb/FrZYP
	xlDHI+8mdS0SHrZs2HG2ERZYUSmxnYUR8I9Z2kwyGt0gqS12E8vt2FBY+WARi12YbPY6/nMQSKpIk
	8a0FMjj6/dB5VbPU5RhwW44QWFeJTuCzbtL9P1vCbQvpsXiPyniq6pHiX/PkIMJHQoATal7eCuXzm
	/8VVkBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg47l-00000000lNA-29sC;
	Fri, 01 Mar 2024 14:44:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg47X-00000000l89-1aNY;
	Fri, 01 Mar 2024 14:44:23 +0000
X-UUID: 2894f14ad7da11eea40fa5ac21cdad35-20240301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=b2jtfBQ99XTwNQWIlhNqeShiovjYiw2SHuwp+NS8xzo=;
	b=rfp3hl9iawLTDiftCT5bJCtp/CPmY6z9TDO+Sk0/Zgih5bvYS2Iacijqfvg/vGFJVr5QdmSf877IZGCxJPlQzcWPFKM2Z0VwJlXybb3C3/BTL++eFZsghgJcNh1eGsic7uQT67kfQxXazTFGeA2G8Nvnwl+lyLAvZ5JROcPCesg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:c942cd8f-1a0b-4304-8d38-0ebb1ebe1c58,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:3a44e88f-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2894f14ad7da11eea40fa5ac21cdad35-20240301
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1255078596; Fri, 01 Mar 2024 07:44:07 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Mar 2024 22:44:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Mar 2024 22:44:04 +0800
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
Subject: [RESEND, PATCH 2/5] soc: mediatek: mtk-cmdq: Add cmdq_pkt_mem_move() function
Date: Fri, 1 Mar 2024 22:44:00 +0800
Message-ID: <20240301144403.2977-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240301144403.2977-1-jason-jh.lin@mediatek.com>
References: <20240301144403.2977-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_064419_624815_91ED0F05 
X-CRM114-Status: GOOD (  12.43  )
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
 include/linux/soc/mediatek/mtk-cmdq.h  | 10 ++++++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index b0cd071c4719..3a1e47ad8a41 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -299,6 +299,32 @@ int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 }
 EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
 
+s32 cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_addr)
+{
+	s32 err;
+	const u16 tmp_reg_idx = CMDQ_THR_SPR_IDX0;
+	const u16 swap_reg_idx = CMDQ_THR_SPR_IDX1;
+
+	/* read the value of src_addr into swap_reg_idx */
+	err = cmdq_pkt_assign(pkt, tmp_reg_idx, CMDQ_ADDR_HIGH(src_addr));
+	if (err < 0)
+		return err;
+	err = cmdq_pkt_read_s(pkt, tmp_reg_idx, CMDQ_ADDR_LOW(src_addr), swap_reg_idx);
+	if (err < 0)
+		return err;
+
+	/* write the value of swap_reg_idx into dst_addr */
+	err = cmdq_pkt_assign(pkt, tmp_reg_idx, CMDQ_ADDR_HIGH(dst_addr));
+	if (err < 0)
+		return err;
+	err = cmdq_pkt_write_s(pkt, tmp_reg_idx, CMDQ_ADDR_LOW(dst_addr), swap_reg_idx);
+	if (err < 0)
+		return err;
+
+	return err;
+}
+EXPORT_SYMBOL(cmdq_pkt_mem_move);
+
 int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event, bool clear)
 {
 	struct cmdq_instruction inst = { {0} };
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 1dae80185f9f..b6dbe2d8f16a 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -182,6 +182,16 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
 				u16 addr_low, u32 value, u32 mask);
 
+/**
+ * cmdq_pkt_mem_move() - append memory move command to the CMDQ packet
+ * @pkt:	the CMDQ packet
+ * @src_addr:	source address
+ * @dma_addr_t: destination address
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


