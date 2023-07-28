Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4E4C001E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 02:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yNt8bGiUZ92UydpSH31hj/BI5ZtnckkCLekgOIDsQA=; b=h2bbkz9Fmdx/FwYdrynpMuRTJX
	sZnDuBkzIca7W0nIFy0+4ChfQCZk7a6KUVgmA7VgSCJH1z/vXCumPtK4yVPzjE4HaQU0Ub6ROAw4S
	7pXER5AQZw0hZzykGLD0/CbCjvZk8zLY5YHA7pQ2zOfBF2YBNW/H0WNbC0fmXMyCq8J6TB2jK9lug
	nVM6FZ2+T8dOp4B30zErnLQYNdcbVZ0tg2P7bRwSacquu4h87W9eiYGcTfBkLqoeUeG1EnRCd0d5W
	jTaEeEhSz0WwPH7olidTcmfKYrRhve2Y16vWxixxVpZwNSmcg2J1xtiTOn+G7SketPGYAAy5OUeH2
	hFpjugfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDPF-001KLQ-2B;
	Fri, 28 Jul 2023 02:40:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPDPD-001KKA-1J;
	Fri, 28 Jul 2023 02:40:40 +0000
X-UUID: 22416b1a2cf011ee912e1518a6540028-20230727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1yNt8bGiUZ92UydpSH31hj/BI5ZtnckkCLekgOIDsQA=;
	b=cncw1ZzU/5yeHNDSritxRvDlwqCKeyRmbzVDlHJUJlmsLw8kNstus4y5irOgd2IcWkuvbwkJAkfesb74GpcrSXxiddYVJrdu1hCfFxbBq46DDLk8yctyJavrMgbHfl1FD2rjJWzQPO3u/aJLRB+IQWdAzYsgx/mjy8df4DA1/yM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:cbf32faa-b7e6-4b8b-b933-041ea583d9fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:b2a4e0b3-a467-4aa9-9e04-f584452e3794,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 22416b1a2cf011ee912e1518a6540028-20230727
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1093291302; Thu, 27 Jul 2023 19:40:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Jul 2023 10:40:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 28 Jul 2023 10:40:02 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tinghan
 Shen <tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v16 12/14] remoteproc: mediatek: Report watchdog crash to all cores
Date: Fri, 28 Jul 2023 10:39:57 +0800
Message-ID: <20230728023959.12293-13-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230728023959.12293-1-tinghan.shen@mediatek.com>
References: <20230728023959.12293-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_194039_449739_53F3AC13 
X-CRM114-Status: GOOD (  11.48  )
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

To ensure consistent behavior, the watchdog timeout handling of the
multi-core SCP should reset the whole SCP sub-system when watchdog
timeout. Triggering the rproc recovery flow on all instances will
ensure proper recovery of the SCP sub-system.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 28ad5ceff3b5..bf935bb0f529 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -68,8 +68,14 @@ EXPORT_SYMBOL_GPL(scp_put);
 
 static void scp_wdt_handler(struct mtk_scp *scp, u32 scp_to_host)
 {
+	struct mtk_scp_of_cluster *scp_cluster = scp->cluster;
+	struct mtk_scp *scp_node;
+
 	dev_err(scp->dev, "SCP watchdog timeout! 0x%x", scp_to_host);
-	rproc_report_crash(scp->rproc, RPROC_WATCHDOG);
+
+	/* report watchdog timeout to all cores */
+	list_for_each_entry(scp_node, &scp_cluster->mtk_scp_list, elem)
+		rproc_report_crash(scp_node->rproc, RPROC_WATCHDOG);
 }
 
 static void scp_init_ipi_handler(void *data, unsigned int len, void *priv)
-- 
2.18.0


