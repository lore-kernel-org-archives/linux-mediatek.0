Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E78C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 14:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnWw5ddbb7C1HlliPTLMIlPGGbzGQXRr3LGJEzaTQVo=; b=ZhkNFfK+zQCR56T1hCWKHi6e7f
	kccv7wdAXvpy+hqbqYUX7lirxsVooGuQmKTRB3ypseyOYe1KZf8TedUDRC6HwqNGCEwWAYMLboecw
	8LNLZfpuQehCEgw3SUQVjF1Ek7Fka/1X/sjeA+Pp7YWgZ9YarXRUvQKo6CkxW540vM/ZU0LPwBJFv
	7xYl7G82C3sP9eBNFOWLOjoPDmNlXNZXP1m2mbkY+l/cwZ1a1XNsqZ0ogY0F73+FvkKZ+mNDA9UIR
	MZKHvk3efRUXHIJJ+68n/xGBSLw066D20NYlTWqIUBMtsuqFWzQgeAd3IZeGl8eyK6NOuBkW2yLLu
	pizzVyBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg47m-00000000lO2-1lZk;
	Fri, 01 Mar 2024 14:44:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg47X-00000000l81-1aBC;
	Fri, 01 Mar 2024 14:44:24 +0000
X-UUID: 28b152c2d7da11eea40fa5ac21cdad35-20240301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UnWw5ddbb7C1HlliPTLMIlPGGbzGQXRr3LGJEzaTQVo=;
	b=OQYGX5Il+YkcrsWJ858vNfcBWXob3LUbKUkiNKTH/GC9t4sBfqa7cMTXBmQuJFjxiyZg+c74FOU7r71UsU4APFXacXWNjBuFY7z2KjGPzARdEmNOERu4wInTmN8hI7WpAUdBmb5E+gVqjD6TtJsoRBi1/ZbqyedPhWXh6Dt34FU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:70f59866-7d73-4370-8d81-efedc5749b03,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:72370181-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 28b152c2d7da11eea40fa5ac21cdad35-20240301
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1828481843; Fri, 01 Mar 2024 07:44:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 1 Mar 2024 22:44:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 1 Mar 2024 22:44:05 +0800
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
Subject: [RESEND, PATCH 3/5] soc: mediatek: mtk-cmdq: Add cmdq_pkt_poll_addr() function
Date: Fri, 1 Mar 2024 22:44:01 +0800
Message-ID: <20240301144403.2977-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240301144403.2977-1-jason-jh.lin@mediatek.com>
References: <20240301144403.2977-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_064419_640670_55FCB8D3 
X-CRM114-Status: GOOD (  17.31  )
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

POLL is an old operation in GCE, so it does not support SPR and
CMDQ_CODE_LOGIC. CMDQ users need to use GPR and CMDQ_CODE_MASK
to move polling register address to GPR to make an instruction.
This will be done in cmdq_pkt_poll_addr().

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 38 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 16 +++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 3a1e47ad8a41..2e9fc9bb1183 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -12,6 +12,7 @@
 
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
 #define CMDQ_POLL_ENABLE_MASK	BIT(0)
+#define CMDQ_POLL_HIGH_ADDR_GPR	(14)
 #define CMDQ_EOC_IRQ_EN		BIT(0)
 #define CMDQ_REG_TYPE		1
 #define CMDQ_JUMP_RELATIVE	1
@@ -406,6 +407,43 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 }
 EXPORT_SYMBOL(cmdq_pkt_poll_mask);
 
+int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mask)
+{
+	struct cmdq_instruction inst = { {0} };
+	int err;
+	u8 use_mask = 0;
+
+	if (mask != U32_MAX) {
+		inst.op = CMDQ_CODE_MASK;
+		inst.mask = ~mask;
+		err = cmdq_pkt_append_command(pkt, inst);
+		if (err != 0)
+			return err;
+		use_mask = CMDQ_POLL_ENABLE_MASK;
+	}
+
+	/*
+	 * POLL is an old operation in GCE and it does not support SPR and CMDQ_CODE_LOGIC,
+	 * so it can not use cmdq_pkt_assign to keep polling register address to SPR.
+	 * It needs to use GPR and CMDQ_CODE_MASK to move polling register address to GPR.
+	 */
+	inst.op = CMDQ_CODE_MASK;
+	inst.dst_t = CMDQ_REG_TYPE;
+	inst.sop = CMDQ_POLL_HIGH_ADDR_GPR;
+	inst.mask = addr;
+	err = cmdq_pkt_append_command(pkt, inst);
+	if (err < 0)
+		return err;
+
+	inst.op = CMDQ_CODE_POLL;
+	inst.dst_t = CMDQ_REG_TYPE;
+	inst.sop = CMDQ_POLL_HIGH_ADDR_GPR;
+	inst.offset = use_mask;
+	inst.value = value;
+	return cmdq_pkt_append_command(pkt, inst);
+}
+EXPORT_SYMBOL(cmdq_pkt_poll_addr);
+
 int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
 {
 	struct cmdq_instruction inst = {};
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index b6dbe2d8f16a..2fe9be240fbc 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -253,6 +253,22 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
 int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
 		       u16 offset, u32 value, u32 mask);
 
+/**
+ * cmdq_pkt_poll_addr() - Append polling command to the CMDQ packet, ask GCE to
+ *			 execute an instruction that wait for a specified
+ *			 address of hardware register to check for the value
+ *			 w/ or w/o mask.
+ *			 All GCE hardware threads will be blocked by this
+ *			 instruction.
+ * @pkt:	the CMDQ packet
+ * @addr:	the hardware register address
+ * @value:	the specified target register value
+ * @mask:	the specified target register mask
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_pkt_poll_addr(struct cmdq_pkt *pkt, dma_addr_t addr, u32 value, u32 mask);
+
 /**
  * cmdq_pkt_assign() - Append logic assign command to the CMDQ packet, ask GCE
  *		       to execute an instruction that set a constant value into
-- 
2.18.0


