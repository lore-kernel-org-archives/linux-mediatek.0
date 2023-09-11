Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9B8EEB57D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 03:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0C3N7fE/tvZGh5zMmznktAGbJMG4wluUCFEK7cRhxCs=; b=Sl+Pm8Y5HO2/toW0e/SKmJd6g9
	qjHtIOrSw+AIPrbScanJaEEt3bAJULnrJMVGQqApQVGYqPgDuodwS+wYPt/6qi5zp4PtGcoHRHnks
	+GYfdrr4ACMUFjf2nCgrEfsy4U/bfLBTCnxfCh54ZTR3cZZQbxMc3HrLdjNL8kspODmv+q+c+GWTR
	5+B1cbpvuSkdK400CCdt5fQqwWr9ie5qG7dLrDBWPU5uXdVMYjMPDoBAFbcEgCHpwUl89R9uTOLM7
	7OzjbHpexYOdiOVa4niB0+P3LLPsGNAJNV+gE7YeXFiutxRjYKgQ9LeZrwwGzcutkQq9u421AeWzN
	udzKx7xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXQD-00H92a-2A;
	Mon, 11 Sep 2023 03:17:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfXQ5-00H8yd-0q;
	Mon, 11 Sep 2023 03:17:02 +0000
X-UUID: a9bf4fec505111ee86758d4a7c00f3a0-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0C3N7fE/tvZGh5zMmznktAGbJMG4wluUCFEK7cRhxCs=;
	b=gY9ZB09CYFzkcomBcbLbka3K/XE1keAnqdgMCLhPfcU+TsWoPWjH2TORpNqql/W7SzqA083KSEMMGJv2Bhj4gMZoGMQHHtNwStBb+jM0qOaXTpsTJ+wFzmDjtGFrd4tIz+j+0MCdKTqiyIAOt5h4qSQu8koFuCnfcRM5LwcxzV0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:acd6648b-baf9-4c4b-b348-2dc69e1b0988,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:89508aef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a9bf4fec505111ee86758d4a7c00f3a0-20230910
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 453498292; Sun, 10 Sep 2023 20:16:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 11:16:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 11:16:40 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v6 16/20] drm/mediatek: Make sure the power-on sequence of LARB and RDMA
Date: Mon, 11 Sep 2023 11:16:26 +0800
Message-ID: <20230911031630.12613-17-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230911031630.12613-1-shawn.sung@mediatek.com>
References: <20230911031630.12613-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_201701_303731_D9C9AF97 
X-CRM114-Status: GOOD (  14.70  )
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

Since LARBs (Local ARBiter) have to be powered on before its users,
to ensure the power-on sequence, we created a device link between
RDMA and its LARB, and when pm_runtime_get_sync is called in RDMA,
system will guarantee the LARB is powered on before the RDMA.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index c3adaeefd551..fce6fbb534b1 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -244,10 +244,23 @@ size_t mtk_mdp_rdma_get_num_formats(struct device *dev)

 int mtk_mdp_rdma_clk_enable(struct device *dev)
 {
+	int ret;
 	struct mtk_mdp_rdma *rdma = dev_get_drvdata(dev);

-	clk_prepare_enable(rdma->clk);
-	return 0;
+	/*
+	 * Since LARBs (Local ARBiter) have to be powered on before its users,
+	 * to ensure the power-on sequence, we created a device link between
+	 * RDMA and its LARB, and when pm_runtime_get_sync is called in RDMA,
+	 * system will make sure the LARB is powered on before the RDMA
+	 */
+	ret = pm_runtime_get_sync(dev);
+
+	if (ret < 0)
+		dev_err(dev, "pm_runtime_get_sync failed: %d\n", ret);
+	else
+		ret = clk_prepare_enable(rdma->clk);
+
+	return ret;
 }

 void mtk_mdp_rdma_clk_disable(struct device *dev)
@@ -255,6 +268,9 @@ void mtk_mdp_rdma_clk_disable(struct device *dev)
 	struct mtk_mdp_rdma *rdma = dev_get_drvdata(dev);

 	clk_disable_unprepare(rdma->clk);
+
+	/* Same reason as when enabling clock, turn the LARB off */
+	pm_runtime_put(dev);
 }

 static int mtk_mdp_rdma_bind(struct device *dev, struct device *master,
--
2.18.0


