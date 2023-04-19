Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEDDC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 06:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H3VdK/Wg34P97Kr/kokR5AgdCJlvacRK9WvxPDBE7no=; b=hgF+hgLCpqwl3uTbuhFRZbYt5w
	FgqS+CcpATKiLB9tuu4b5JCrIrJdKKAJ1SVZ7oQS6qdvweIs7aEgi6EHs6WB0lPHxCbg2uEbxDeRp
	dge/tn0W4t04rQWxJnNnZKuHIBg87tzOVrR3JkGOQihC5J42y9MQGwVmhoVyOe7n3jRvwBbnVPaN4
	tmVVSMtdS2gvwTLEftJPzSQnl6SjyoJa54YAlinPo6GnhxO85YxWrk+dcAv3FVnITWBZkBHBjKPFb
	Bx35PVUqIIXQCytCc5a5gX3QYaXeHiK8wNg4+vuxgIbOasg+gdNcriudgNLnQD5Zyu5MnloyrF10F
	n9ucy4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp1LL-004FMn-2y;
	Wed, 19 Apr 2023 06:31:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp1LI-004FLH-2q;
	Wed, 19 Apr 2023 06:31:02 +0000
X-UUID: bc8aeb42de7b11edb7d8d11f642b8e78-20230418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=H3VdK/Wg34P97Kr/kokR5AgdCJlvacRK9WvxPDBE7no=;
	b=DHB7kvriA+IJS8JZFwt5kAvAlyDTMMjwIPyuyMO9HtPrfi92cE2KgOy3bK2saSlZMuGhaDtSY1rkhuOc/SzonAEF9cq2ZhOssBhzR+DGhSD7RcD9JuwiM4ycRW5BaXW0Bbt2f1AkguVAVXDNCTS8LocnKVUc2HSK092tMbWS4+4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:b13473a8-228a-4fea-8df6-951121171fc8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:2450d2a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: bc8aeb42de7b11edb7d8d11f642b8e78-20230418
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <wenbin.mei@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1044871954; Tue, 18 Apr 2023 23:30:54 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 19 Apr 2023 14:30:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 19 Apr 2023 14:30:51 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH] mmc: mtk-sd: reduce CIT for better performance
Date: Wed, 19 Apr 2023 14:30:48 +0800
Message-ID: <20230419063048.10516-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_233100_949474_587A5D38 
X-CRM114-Status: GOOD (  10.59  )
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

CQHCI_SSC1 indicates to CQE the polling period to use when using
periodic SEND_QUEUE_STATUS(CMD13) polling.
The default value is 0x1000, now change it to 0x40, which can
improve the performance of some eMMC devices.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index edade0e54a0c..483353ea3a99 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2453,6 +2453,7 @@ static void msdc_hs400_enhanced_strobe(struct mmc_host *mmc,
 static void msdc_cqe_enable(struct mmc_host *mmc)
 {
 	struct msdc_host *host = mmc_priv(mmc);
+	struct cqhci_host *cq_host = mmc->cqe_private;
 
 	/* enable cmdq irq */
 	writel(MSDC_INT_CMDQ, host->base + MSDC_INTEN);
@@ -2462,6 +2463,8 @@ static void msdc_cqe_enable(struct mmc_host *mmc)
 	msdc_set_busy_timeout(host, 20 * 1000000000ULL, 0);
 	/* default read data timeout 1s */
 	msdc_set_timeout(host, 1000000000ULL, 0);
+
+	cqhci_writel(cq_host, 0x40, CQHCI_SSC1);
 }
 
 static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
-- 
2.25.1


