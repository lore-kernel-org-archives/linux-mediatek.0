Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E73C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 01:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=goFtPwMVn64ABIQNA1G7S20XXap5d/VUqT3HlPpXTwI=; b=ILrczGVzPinh0ds4y2G96xWZJX
	Syt068RPFDQpC5peqpdaZnwrcRPMwMikj7O4gnh0BtIFP0uAMBUanXQtxHoXEs9KZIPPlAU35RLNw
	Iw4XnAAFFS5hs+56wCm8VcbQbg4kjlAAPD4ZIU0JpP6nNQj/RLLLv6opA3z64JojSDFKHkaLrjH1s
	vt0SZrffxWj5vShCVtpyhADGVkXYAqMgqVxQD4ecdB+WQjsS2+xFmV8sM8OAKyfHZAfYIqZxU4hks
	RiqwTLhB67Yv+qm5uoXAwBNn9cNatyUTNCnaMJUv6FmYGIi+igXGdFcoE5MfT2Ajszpx2FJ80ZK7C
	to81Rs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwZ6g-004jJZ-17;
	Wed, 10 May 2023 01:59:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwZ6d-004jIy-2M;
	Wed, 10 May 2023 01:59:05 +0000
X-UUID: 3905a6fceed611ed83ed1395ce914268-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=goFtPwMVn64ABIQNA1G7S20XXap5d/VUqT3HlPpXTwI=;
	b=iEAABm8V9UNxhd5TZLe039wJheG78Rf9sThM/2Wuhg1dZOaYc6whINhpA1wEOB4I7t5GicvsdpGPr7TQB9Hz3FNCIsvfb8IwMcovJoT8ipCwVvZ8aSNrzAtuqoyVc9TSkahPa/XNtPmxA3eu4m2WUkWrtY5wVwCafdW9pL9l9Fw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:ab955daa-4b7f-4587-a8af-ee84423803c7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:178d4d4,CLOUDID:5e84a73a-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 3905a6fceed611ed83ed1395ce914268-20230509
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <wenbin.mei@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1083667570; Tue, 09 May 2023 18:58:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 May 2023 09:58:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 09:58:53 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v2] mmc: mtk-sd: reduce CIT for better performance
Date: Wed, 10 May 2023 09:58:51 +0800
Message-ID: <20230510015851.11830-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_185903_798062_33CAD0DD 
X-CRM114-Status: GOOD (  11.26  )
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

CQHCI_SSC1 indicates to CQE the polling period to use when using periodic
SEND_QUEUE_STATUS(CMD13) polling.
The default value 0x1000 that corresponds to 150us, let's decrease it to
0x40 that corresponds to 3us, which can improve the performance of some
eMMC devices.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index edade0e54a0c..ffeccddcd028 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2453,6 +2453,7 @@ static void msdc_hs400_enhanced_strobe(struct mmc_host *mmc,
 static void msdc_cqe_enable(struct mmc_host *mmc)
 {
 	struct msdc_host *host = mmc_priv(mmc);
+	struct cqhci_host *cq_host = mmc->cqe_private;
 
 	/* enable cmdq irq */
 	writel(MSDC_INT_CMDQ, host->base + MSDC_INTEN);
@@ -2462,6 +2463,9 @@ static void msdc_cqe_enable(struct mmc_host *mmc)
 	msdc_set_busy_timeout(host, 20 * 1000000000ULL, 0);
 	/* default read data timeout 1s */
 	msdc_set_timeout(host, 1000000000ULL, 0);
+
+	/* decrease the send status command idle timer to 3us */
+	cqhci_writel(cq_host, 0x40, CQHCI_SSC1);
 }
 
 static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
-- 
2.25.1


