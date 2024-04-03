Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2C0CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2Vks/BZ0rlvMfSgw1uKAIL5FKtlzLmx1DK8tbvNN0g=; b=bqtC2NTRtI01M/0zGGiuc5SA9L
	83fkKqE6XH7BoaQtrkQ92Q6hX7ng4I5IZVik2Heo+htbf5k8+jTlqErTaMqXTIR5neFUywXTHCb3W
	USoqmuDrAHNZkPFbX3vkc/dNF2v0jSjwcgcH91YSuCHsMd7MM3OOIRfHiMQ0QD84ruFqenGrTFK70
	nCN4t4Tkid7cCQx62DHaz7pQ7pm7gRwy6WLkzPSTFUakdVQuDmfMHadioxu7TS6Q2w9MF8sRyhlyx
	CzNSC7IAs9YN+3Re28SFIRmlefoBRZru82EBioByT/sVPJyXi3TKsrd/wXaQe7u8iIBjL2yyvrzNW
	4YHew1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxpc-0000000FUKE-303f;
	Wed, 03 Apr 2024 10:27:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxpT-0000000FUDl-0umT;
	Wed, 03 Apr 2024 10:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n2Vks/BZ0rlvMfSgw1uKAIL5FKtlzLmx1DK8tbvNN0g=; b=dpdlU5lO8EDogQtXyG81K/zBMC
	L9VPpRhUb79S8TkmdeTv2PKiKhk0LL2wx1Py9l5dX2dF2jaVXF7KI6RUomgGenl1luYyKep1LwFmO
	+Dpa7p9KbhLN98SqNY5IHnEJ5bkN830hPuA/Eqma1iNmzh5RS4jeZ5CqfDbrA9W7gIQHOkAFXQHXY
	od7nJdG5P/yMamfJle3qXPz8rWEEb+fD/WGxFhcXg8oRHTRDIRgFolYah1+5gMKC6fmy1Xq1e/Amd
	yDNT2PMbxOn6D9gmP/imWD0N+u7scG4u7hVivnPO3cZNbsmlLru5AisDogaz+mvdLoMjn7H9WcdCC
	o2VQFCRw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxpP-00000004A5K-24HG;
	Wed, 03 Apr 2024 10:26:49 +0000
X-UUID: a92c198af1a411eeac1957ae9f99f617-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=n2Vks/BZ0rlvMfSgw1uKAIL5FKtlzLmx1DK8tbvNN0g=;
	b=Fjjb3k/kkfRvsoHgKeAqnN2FsLzB4NHRJyYVWn+ZNCUv3rSzFaSnoNum93Tcw+a3TeR/b3rwnVJi3+DafrTpHlbuWiFs+UsK7hdtLUt2QxuDO8SoL7Qbisdujh6Q0KBnqaJXoBEvu/sAshxf5rY1q8akmWOdPYDw9hoT6wGCn34=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:21ae5da0-ea9e-41aa-b5c9-cc60625cbcd8,IP:0,U
	RL:0,TC:0,Content:56,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:56
X-CID-META: VersionHash:6f543d0,CLOUDID:c99c2c91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a92c198af1a411eeac1957ae9f99f617-20240403
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1706595123; Wed, 03 Apr 2024 03:26:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 18:26:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 18:26:04 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Hsiao Chien Sung
	<shawn.sung@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 05/10] mailbox: mtk-cmdq: Support GCE loop packets in interrupt handler
Date: Wed, 3 Apr 2024 18:25:57 +0800
Message-ID: <20240403102602.32155-6-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403102602.32155-1-shawn.sung@mediatek.com>
References: <20240403102602.32155-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.597500-8.000000
X-TMASE-MatchedRID: wDTc/wNgEcPlOkrqlJanurMjW/sniEQKLoYOuiLW+uUnArDy4nBG1Hv9
	jBhUgWuoqNt6gBjaBAGOpJpDdVJ03s3AmdtMjGJVA9lly13c/gHt/okBLaEo+E1KG1YrOQW/OXU
	FK+IJNsIOrPUQy5xzLmzlLAWyLHZTHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDw59eZw3B3rO0Tk1
	oDEL6P6yCb531tLI5FgXeOGobR9TfGZ5s4jRI67w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.597500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 29ED1E9E0B58CF3AAAB12D3F7C2AF5F74154B6A106B0DED45C881FDA03819E2B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_112647_852886_969F731A 
X-CRM114-Status: GOOD (  12.21  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

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
index ead2200f39ba0..5906e0343d1fc 100644
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
index a8f0070c7aa98..f78a08e7c6ede 100644
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


