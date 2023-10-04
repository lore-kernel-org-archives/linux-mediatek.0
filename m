Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41409E8FDDB
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MBcBDOl5yeDMv2w87eIP+V8TiQXxwMS/ftWzExwh5K4=; b=3iQgf8SDgibKZByA6eqKwCZaf8
	3bFxKw750JuWNq9zOWwn+rtlDNAFNzy0Zp/8gh1JRcSG6dmuY6CueycFJe/JeKZwqAiTnFu+FpAer
	STZ/hDxinfXr5S+jSpDhUE74Ykl7zf6aY5cuoQLpLftEz+XzaEx506uhtDxl/QKOHSjfOS6UWjhfT
	55B6TQS0GMcxuBj8ImyyChpusze8qu45G5TRwEvK2qpUkGwTgoS/vi5pCwI1ttnpxTnpW/OGPLiO2
	MqDwlIyPwxShxJzgIaWF6Gdc53vtMXfzNryEVqPe3l7gr7opcmClAU4XVNGJ7hbjKNlZUPmOmY4yA
	IYRs+nPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxoj-00GyVc-01;
	Wed, 04 Oct 2023 09:05:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxog-00GyUU-08;
	Wed, 04 Oct 2023 09:05:15 +0000
X-UUID: 1d0562b6629511ee9b7791016c24628a-20231004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=MBcBDOl5yeDMv2w87eIP+V8TiQXxwMS/ftWzExwh5K4=;
	b=tlzGa6E6QCoy7yDHnSyBwwDhVFMpuHXIxhW0bC2w/3SFfgycs/lUbd8Nvyzbwmprfvwg6F4as7Hh4OIOpepk8JLXzgh2Qbz0hxi5ylU7/2lylB4eDXxg47txq/8wRySty57SHJjRgkdFOTEcL9iB/q0eq86khl9jG+BOt06KFDQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:ac2f2f65-db9a-43e2-86eb-0772f87d769c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:48f06ef0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1d0562b6629511ee9b7791016c24628a-20231004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 446828226; Wed, 04 Oct 2023 02:05:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 16:54:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 16:54:31 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>
Subject: [PATCH v2] mailbox: remove runtime GCE clk control
Date: Wed, 4 Oct 2023 16:54:30 +0800
Message-ID: <20231004085430.19538-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.248200-8.000000
X-TMASE-MatchedRID: UItuaqKgrvgz+qbfieptZovNlIrJDKnMLAnNohUyMa1PL4NRV2o9aN96
	V2NgrEHikTN+ni8KryeKEnrCE4DpBHDTzBSSF/pz/IBH0OAL+Ed51GakW92m5g6QlBHhBZuw5sZ
	TwYHfBM7hAIcJfvZAq/YYs13w9tXbmBl68mJwjOFPuMJi/ZAk8UyQ5fRSh265CqIJhrrDy2/e9i
	ux8ViNa29O6iLjkiESWfvheV6pyrTpRzKqh62z7KOONuzwygtG4OSJW6hGEzt+YesuCgkiXOeAO
	RV8mUv06bvMYoVlhNEisoGLKiuiEuVHGbcDbAq6FEUknJ/kEl7dB/CxWTRRu+rAZ8KTspSzCPth
	eo2hayBGreru7GmSNsJsVJfNHv8AZt3zqTfSSMnx0MnzOLGIHrcQv1kYa1q5E1GEss7kLzj+bpM
	aPzHLrSz9wa3yTOcyF0aD5ljt43pMcHZD6gqu7wxMjfifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.248200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2022B546A6B2495E2AE4DCB7E5C1375ED94A0D183FF7F533CD2D5F0A261C6E882000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_020514_127683_6B23D1E8 
X-CRM114-Status: GOOD (  15.26  )
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

1. GCE is a frequently used module, so runtime controlling
GCE clock won't save too much power and its original design
doesn't expect it to be enabled and disabled too frequently.

2. Runtime controlling GCE clock will cause display HW register
configured in worng stream done event issue below:
  GCE should config HW in every vblanking duration.
  The stream done event is the start signal of vblanking.

  If stream done event is sent between GCE clk_disable
  and clk_enable. After GCE clk_enable the stream done event
  may not appear immediately and have about 3us delay.

  Normal case:
  clk_disable -> get EventA -> clk_enable -> clear EventA
  -> wait EventB -> get EventB -> config HW

  Abnormal case:
  clk_disable -> get EventA -> clk_enable -> EventA delay appear
  -> clear EventA fail -> wait EventB but get EventA -> config HW

So just remove the runtime GCE clock contorl.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
v1 -> v2:
1. Rebase on Linux 6.6-rc4
2. Adjust commit message.
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 4d62b07c1411..a3c2d318beb7 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -140,7 +140,6 @@ static void cmdq_init(struct cmdq *cmdq)
 	int i;
 	u32 gctl_regval = 0;
 
-	WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
 	if (cmdq->pdata->control_by_sw)
 		gctl_regval = GCE_CTRL_BY_SW;
 	if (cmdq->pdata->sw_ddr_en)
@@ -152,7 +151,6 @@ static void cmdq_init(struct cmdq *cmdq)
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
 		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
-	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
 }
 
 static int cmdq_thread_reset(struct cmdq *cmdq, struct cmdq_thread *thread)
@@ -283,10 +281,8 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 			break;
 	}
 
-	if (list_empty(&thread->task_busy_list)) {
+	if (list_empty(&thread->task_busy_list))
 		cmdq_thread_disable(cmdq, thread);
-		clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
-	}
 }
 
 static irqreturn_t cmdq_irq_handler(int irq, void *dev)
@@ -333,7 +329,7 @@ static int cmdq_suspend(struct device *dev)
 	if (cmdq->pdata->sw_ddr_en)
 		cmdq_sw_ddr_enable(cmdq, false);
 
-	clk_bulk_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
+	clk_bulk_disable_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
 
 	return 0;
 }
@@ -342,7 +338,7 @@ static int cmdq_resume(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 
-	WARN_ON(clk_bulk_prepare(cmdq->pdata->gce_num, cmdq->clocks));
+	WARN_ON(clk_bulk_prepare_enable(cmdq->pdata->gce_num, cmdq->clocks));
 	cmdq->suspended = false;
 
 	if (cmdq->pdata->sw_ddr_en)
@@ -358,7 +354,7 @@ static int cmdq_remove(struct platform_device *pdev)
 	if (cmdq->pdata->sw_ddr_en)
 		cmdq_sw_ddr_enable(cmdq, false);
 
-	clk_bulk_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
+	clk_bulk_disable_unprepare(cmdq->pdata->gce_num, cmdq->clocks);
 	return 0;
 }
 
@@ -384,8 +380,6 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	task->pkt = pkt;
 
 	if (list_empty(&thread->task_busy_list)) {
-		WARN_ON(clk_bulk_enable(cmdq->pdata->gce_num, cmdq->clocks));
-
 		/*
 		 * The thread reset will clear thread related register to 0,
 		 * including pc, end, priority, irq, suspend and enable. Thus
@@ -457,7 +451,6 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	}
 
 	cmdq_thread_disable(cmdq, thread);
-	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
 
 done:
 	/*
@@ -497,7 +490,6 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	cmdq_thread_resume(thread);
 	cmdq_thread_disable(cmdq, thread);
-	clk_bulk_disable(cmdq->pdata->gce_num, cmdq->clocks);
 
 out:
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
@@ -631,7 +623,7 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, cmdq);
 
-	WARN_ON(clk_bulk_prepare(cmdq->pdata->gce_num, cmdq->clocks));
+	WARN_ON(clk_bulk_prepare_enable(cmdq->pdata->gce_num, cmdq->clocks));
 
 	cmdq_init(cmdq);
 
-- 
2.18.0


