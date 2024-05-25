Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D747AC25B7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 May 2024 23:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxN0Cn2UnxKhpBITEVR5MpMye8qsppNfTxaYmd0XbS0=; b=bzZClX5ENCkUfDjXsXuhxHb/N7
	2YmsvJXMBUuw7OYwN61R4YpPmqsXTS5Eqkyt+lRxelMq92jkSncbjkZDsMEFUKeRONvKEBlviqz6t
	wXNn+bqMK9fu1DLgob+RGKXPS3Xy+OkAY8Mx+lKRdyq7s9yt5U8uyDJVDtoU2+LTljF+LCy2v5DnG
	ReFdVxRXW/lVF1paL2W6NPVgXn9y6eGlNHMTDxo1YaufUyInJPw9Wpjvm7pdk7glrfYpsTfVSryiL
	Gsh4/Y0i567VmnY6fRInMAQROoof/9cviNbf5J/ucyjvRx7LC8NVaXT9wqBq51uPN0PU4vDReEIrf
	wM4x4Bag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0VQ-0000000BpXm-0Vvz;
	Sat, 25 May 2024 23:08:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0Uv-0000000BpBn-2zhu;
	Sat, 25 May 2024 23:08:24 +0000
X-UUID: ab3aa7f81aeb11ef82c84f6416ccf2f3-20240525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KxN0Cn2UnxKhpBITEVR5MpMye8qsppNfTxaYmd0XbS0=;
	b=aTauG0kRpwTDQ9sIv4H0AAT3stTKQbUGZ2+cFDr69tycDizdp4hkK0NvSC6f3RdVpcH1pOOEm+VbFlb3zfEd3fSzs2+9A9qIoWKe6JlX5ddBnHS8sK+4CA52c5oioW4qxut+LBdx3JQCW0pRMxSXcyGxZlS1GlJINvzu9XTa26Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:3997fac8-4219-4fbb-a0a1-035a4d542799,IP:0,U
	RL:0,TC:0,Content:56,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:56
X-CID-META: VersionHash:82c5f88,CLOUDID:dddb4f84-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ab3aa7f81aeb11ef82c84f6416ccf2f3-20240525
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 767160877; Sat, 25 May 2024 16:08:16 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:08:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:08:11 +0800
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
Subject: [PATCH v6 4/8] mailbox: mtk-cmdq: Support GCE loop packets in interrupt handler
Date: Sun, 26 May 2024 07:08:06 +0800
Message-ID: <20240525230810.24623-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
References: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.597500-8.000000
X-TMASE-MatchedRID: wDTc/wNgEcPlOkrqlJanurMjW/sniEQKLoYOuiLW+uUnArDy4nBG1Hv9
	jBhUgWuoqNt6gBjaBAGOpJpDdVJ03s3AmdtMjGJVA9lly13c/gHt/okBLaEo+E1KG1YrOQW/OXU
	FK+IJNsIOrPUQy5xzLmzlLAWyLHZTHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDwh3LZaf1ztKRY2x
	n3QyvH0HjL7r86SIjXnbUmGdsUI/85dsuF2FPBIg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.597500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D14A99AFF9CDE27804D20F65FF61FCCE37C598278DE54D7A2A25CAD5161804D02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_160821_779194_6B2EBBAF 
X-CRM114-Status: GOOD (  11.59  )
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

1. Add a loop flag for CMDQ packet struct.
CMDQ helper will use a loop flag to mark CMDQ packet as lopping command
and make current command buffer jumps to the beginning when GCE executes
to the end of command buffer.

2. Add a looping task handle flow in irq handler.
GCE irq occurs when GCE executes to the end of command(EOC) instruction.
If the CMDQ packet is a loopping command, GCE irq handler can not
delete the CMDQ task and disable the GCE thread.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 11 +++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 4aa394e91109..618023011d31 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -267,6 +267,17 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 
 	curr_pa = readl(thread->base + CMDQ_THR_CURR_ADDR) << cmdq->pdata->shift;
 
+	task = list_first_entry_or_null(&thread->task_busy_list,
+					struct cmdq_task, list_entry);
+	if (task && task->pkt->loop) {
+		struct cmdq_cb_data data;
+
+		data.sta = err;
+		data.pkt = task->pkt;
+		mbox_chan_received_data(task->thread->chan, &data);
+		return;
+	}
+
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
 		task_end_pa = task->pa_base + task->pkt->cmd_buf_size;
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index a8f0070c7aa9..f78a08e7c6ed 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -76,6 +76,7 @@ struct cmdq_pkt {
 	size_t			cmd_buf_size; /* command occupied size */
 	size_t			buf_size; /* real buffer size */
 	void			*cl;
+	bool			loop;
 };
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
-- 
2.18.0


