Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014DFC25B7A
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 May 2024 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duLkq3MY08t3TPV16Qz00xGJ7IWdS0qMJsGqtmvG1LI=; b=JAwUejBhZreE//C8OjndQk+G4x
	BHQwELY/IMH7gqglj2n75NkQSWs/cx9TP/CduRNcGDeNwDtOAVckGLJ5jREFqzDVAdF9E1mAWh3zH
	gpi/hvCCcdCsQstVbv8467/qaMaRFbPeLWtTlALMAVTF27ZLbrW0VUmcv9d2w/kPEEEKOy2a6LzbI
	cAfnZiD84Z7vEgWGpU51UHJNuvSrvMqAHinKLPEOfIFtZwkEG9m2v2YIB8i8Vbenr2pdtcbk4xAOs
	KubZcoYKygg09WyAz6u3WdW+LL0kCJfX9wY87wr9yV1Sbv+hbJN+CXnBzReQo2ox73ovVcV5+8HwA
	CH2Nxtjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBF7M-0000000CoY2-3lhe;
	Sun, 26 May 2024 14:45:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBF7G-0000000CoTY-0vhm;
	Sun, 26 May 2024 14:44:55 +0000
X-UUID: 801e08f21b6e11efbf6c7d4f5c147266-20240526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=duLkq3MY08t3TPV16Qz00xGJ7IWdS0qMJsGqtmvG1LI=;
	b=BztSt7wB057OqQH4pWV71Nw9nzt4KGl898gT+5bThVilJANZ7RfPCCVVna4xIffHaGevJpLBPY1mlmiFGFBPJkbAIGA+OnhAiU5O9n0zjmZrgU09ZpYP3wnyXLJO8hLY85J/opG/tCMgOC+P7rDCXeHEiJ9BPi70i/apw2h//2k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:19b3eff2-e1f5-4f3e-bbe4-900cd9b7b45e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:c919d143-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 801e08f21b6e11efbf6c7d4f5c147266-20240526
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1338490061; Sun, 26 May 2024 07:44:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 22:44:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 22:44:45 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH RESEND,v6 8/8] soc: mediatek: mtk-cmdq: Add secure cmdq_pkt APIs
Date: Sun, 26 May 2024 22:44:43 +0800
Message-ID: <20240526144443.14345-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240526_074454_332707_9DD720B2 
X-CRM114-Status: GOOD (  18.72  )
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

Open secure cmdq_pkt APIs to support executing commands in secure world.

1. Add cmdq_sec_pkt_alloc_sec_data(), cmdq_sec_pkt_free_sec_data() and
   cmdq_sec_pkt_set_data() to prepare the sec_data in cmdq_pkt that will
   be referenced in the secure world.

2. Add cmdq_sec_insert_backup_cookie() and cmdq_sec_pkt_write() to
   generate commands that need to be executed in the secure world.
   In cmdq_sec_pkt_write(), we need to prepare the metadata to store
   buffer offset of the secure buffer handle because secure world can
   only translate the start address of secure buffer by secure handle.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c | 155 +++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  |  71 +++++++++++
 2 files changed, 226 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 42fae05f61a8..de6557f3ca2f 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -562,4 +562,159 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_finalize);
 
+int cmdq_sec_insert_backup_cookie(struct cmdq_pkt *pkt)
+{
+	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
+	struct cmdq_operand left, right;
+	dma_addr_t addr;
+
+	addr = cmdq_sec_get_exec_cnt_addr(cl->chan);
+	cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX1, CMDQ_ADDR_HIGH(addr));
+	cmdq_pkt_read_s(pkt, CMDQ_THR_SPR_IDX1, CMDQ_ADDR_LOW(addr), CMDQ_THR_SPR_IDX1);
+
+	left.reg = true;
+	left.idx = CMDQ_THR_SPR_IDX1;
+	right.reg = false;
+	right.value = 1;
+	cmdq_pkt_logic_command(pkt, CMDQ_THR_SPR_IDX1, &left, CMDQ_LOGIC_ADD, &right);
+
+	addr = cmdq_sec_get_cookie_addr(cl->chan);
+	cmdq_pkt_assign(pkt, CMDQ_THR_SPR_IDX2, CMDQ_ADDR_HIGH(addr));
+	cmdq_pkt_write_s(pkt, CMDQ_THR_SPR_IDX2, CMDQ_ADDR_LOW(addr), CMDQ_THR_SPR_IDX1);
+	cmdq_pkt_set_event(pkt, cmdq_sec_get_eof_event_id(cl->chan));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_insert_backup_cookie);
+
+static int cmdq_sec_realloc_addr_list(struct cmdq_pkt *pkt, const u32 count)
+{
+	struct cmdq_sec_data *sec_data = (struct cmdq_sec_data *)pkt->sec_data;
+	void *prev = (void *)(unsigned long)sec_data->addr_metadatas, *curr;
+
+	if (count <= sec_data->addr_metadata_max_cnt)
+		return 0;
+
+	curr = kcalloc(count, sizeof(*sec_data), GFP_KERNEL);
+	if (!curr)
+		return -ENOMEM;
+
+	if (count && sec_data->addr_metadatas)
+		memcpy(curr, prev, sizeof(*sec_data) * sec_data->addr_metadata_max_cnt);
+
+	kfree(prev);
+
+	sec_data->addr_metadatas = (uintptr_t)curr;
+	sec_data->addr_metadata_max_cnt = count;
+	return 0;
+}
+
+void cmdq_sec_pkt_free_sec_data(struct cmdq_pkt *pkt)
+{
+	kfree(pkt->sec_data);
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_pkt_free_sec_data);
+
+int cmdq_sec_pkt_alloc_sec_data(struct cmdq_pkt *pkt)
+{
+	struct cmdq_sec_data *sec_data;
+
+	if (pkt->sec_data)
+		return 0;
+
+	sec_data = kzalloc(sizeof(*sec_data), GFP_KERNEL);
+	if (!sec_data)
+		return -ENOMEM;
+
+	pkt->sec_data = (void *)sec_data;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_pkt_alloc_sec_data);
+
+static int cmdq_sec_append_metadata(struct cmdq_pkt *pkt,
+				    const enum cmdq_iwc_addr_metadata_type type,
+				    const u32 base, const u32 offset)
+{
+	struct cmdq_sec_data *sec_data;
+	struct iwc_cmdq_addr_metadata_t *meta;
+	int idx, max, ret;
+
+	pr_debug("[%s %d] pkt:%p type:%u base:%#x offset:%#x",
+		 __func__, __LINE__, pkt, type, base, offset);
+
+	ret = cmdq_sec_pkt_alloc_sec_data(pkt);
+	if (ret < 0)
+		return ret;
+
+	sec_data = (struct cmdq_sec_data *)pkt->sec_data;
+	idx = sec_data->addr_metadata_cnt;
+	if (idx >= CMDQ_IWC_MAX_ADDR_LIST_LENGTH) {
+		pr_err("idx:%u reach over:%u", idx, CMDQ_IWC_MAX_ADDR_LIST_LENGTH);
+		return -EFAULT;
+	}
+
+	if (!sec_data->addr_metadata_max_cnt)
+		max = ADDR_METADATA_MAX_COUNT_ORIGIN;
+	else if (idx >= sec_data->addr_metadata_max_cnt)
+		max = sec_data->addr_metadata_max_cnt * 2;
+	else
+		max = sec_data->addr_metadata_max_cnt;
+
+	ret = cmdq_sec_realloc_addr_list(pkt, max);
+	if (ret)
+		return ret;
+
+	if (!sec_data->addr_metadatas) {
+		pr_info("addr_metadatas is missing");
+
+		meta = kzalloc(sizeof(*meta), GFP_KERNEL);
+		if (!meta)
+			return -ENOMEM;
+
+		sec_data->addr_metadatas = (uintptr_t)(void *)meta;
+	}
+	meta = (struct iwc_cmdq_addr_metadata_t *)(uintptr_t)sec_data->addr_metadatas;
+
+	meta[idx].type = type;
+	meta[idx].base_handle = base;
+	meta[idx].offset = offset;
+	sec_data->addr_metadata_cnt += 1;
+	return 0;
+}
+
+int cmdq_sec_pkt_set_data(struct cmdq_pkt *pkt, enum cmdq_sec_scenario scenario)
+{
+	struct cmdq_sec_data *sec_data;
+	int ret;
+
+	if (!pkt) {
+		pr_err("invalid pkt:%p", pkt);
+		return -EINVAL;
+	}
+
+	ret = cmdq_sec_pkt_alloc_sec_data(pkt);
+	if (ret < 0)
+		return ret;
+
+	pr_debug("[%s %d] pkt:%p sec_data:%p scen:%u",
+		 __func__, __LINE__, pkt, pkt->sec_data, scenario);
+
+	sec_data = (struct cmdq_sec_data *)pkt->sec_data;
+	sec_data->scenario = scenario;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_pkt_set_data);
+
+int cmdq_sec_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset,
+		       enum cmdq_iwc_addr_metadata_type type,
+		       u32 base, u32 base_offset)
+{
+	cmdq_pkt_write(pkt, subsys, offset, base);
+
+	return cmdq_sec_append_metadata(pkt, type, base, base_offset);
+}
+EXPORT_SYMBOL_GPL(cmdq_sec_pkt_write);
+
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 5bee6f7fc400..6baf60313409 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -9,6 +9,7 @@
 
 #include <linux/mailbox_client.h>
 #include <linux/mailbox/mtk-cmdq-mailbox.h>
+#include <linux/mailbox/mtk-cmdq-sec-mailbox.h>
 #include <linux/timer.h>
 
 #define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
@@ -399,6 +400,52 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
  */
 int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
 
+/**
+ * cmdq_sec_pkt_free_sec_data() - free sec_data for CMDQ packet.
+ * @pkt:	the CMDQ packet.
+ */
+void cmdq_sec_pkt_free_sec_data(struct cmdq_pkt *pkt);
+
+/**
+ * cmdq_sec_pkt_alloc_sec_data() - allocate sec_data for CMDQ packet.
+ * @pkt:	the CMDQ packet.
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_sec_pkt_alloc_sec_data(struct cmdq_pkt *pkt);
+
+/**
+ * cmdq_sec_insert_backup_cookie() - append backup cookie related instructions.
+ * @pkt:	the CMDQ packet.
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_sec_insert_backup_cookie(struct cmdq_pkt *pkt);
+
+/**
+ * cmdq_sec_pkt_set_data() - set secure configuration to sec_data in CDMQ packet.
+ * @pkt:	the CMDQ packet.
+ * @scenario:		the scenario to CMDQ TA.
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_sec_pkt_set_data(struct cmdq_pkt *pkt, enum cmdq_sec_scenario scenario);
+
+/**
+ * cmdq_sec_pkt_write() - append write secure buffer related instructions.
+ * @pkt:	  the CMDQ packet.
+ * @subsys:	the CMDQ sub system code.
+ * @offset:	register offset from CMDQ sub system.
+ * @type:	the address metadata conversion type.
+ * @base:	the secure handle of secure buffer.
+ * @base_offset:the address offset of secure buffer.
+ *
+ * Return: 0 for success; else the error code is returned
+ */
+int cmdq_sec_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset,
+		       enum cmdq_iwc_addr_metadata_type type,
+		       u32 base, u32 base_offset);
+
 #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 static inline int cmdq_dev_get_client_reg(struct device *dev,
@@ -524,6 +571,30 @@ static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 	return -EINVAL;
 }
 
+static inline void cmdq_sec_pkt_free_sec_data(struct cmdq_pkt *pkt) {}
+
+static inline int cmdq_sec_pkt_alloc_sec_data(struct cmdq_pkt *pkt)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_sec_insert_backup_cookie(struct cmdq_pkt *pkt)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_sec_pkt_set_data(struct cmdq_pkt *pkt, enum cmdq_sec_scenario scenario)
+{
+	return -EINVAL;
+}
+
+static inline int cmdq_sec_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset,
+				     enum cmdq_iwc_addr_metadata_type type,
+				     u32 base, u32 base_offset)
+{
+	return -EINVAL;
+}
+
 #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
 
 #endif	/* __MTK_CMDQ_H__ */
-- 
2.18.0


