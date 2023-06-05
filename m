Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B31C7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rbrgKCEsggluIwIbzclii9/iGYei7Gnl+O00W9b23fY=; b=JlrIgpWLOzZAqmITPxB2vacPwE
	SaYsff6xx3QKkj4C5uytO2fVPfs1SZbGgWJi6uLGzp/lo0D+GIRgZyiQdYCSWSqHLW2XF580PgXIh
	9x+yvvCela9tXnUhqPErcrYzy7U63yMHCRTZkJIrjlM6ek2sUNgesiZTe+GocTTQnklHMb2RbpzGA
	5vAwuEhrGCnKV3+rA3TPrcSYGsTB//cSbHkLKPYon1AtnUWElooUGhLdTTohyGVvu7sMXQYV4E3oZ
	fPsUUGDYBYRsZxtfkf1Ex2BS7S9+4M4CmdjiQ+s2WzBMKEphE2huwscOybOsypFiOJxXr6ZTZGROk
	vYuqKM3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q69QI-00FSrE-1j;
	Mon, 05 Jun 2023 12:34:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q69QF-00FSps-2e;
	Mon, 05 Jun 2023 12:34:57 +0000
X-UUID: 5b67e54e039d11ee83ed1395ce914268-20230605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rbrgKCEsggluIwIbzclii9/iGYei7Gnl+O00W9b23fY=;
	b=sSw1lCRQeuMauBpgo2++zAl/EOv4GVrg2Mf93uZScT5vu7LJDUDuyGE5Qdlu461YuVyjkbtjedkL7DykUvzKjBjS9AaHqxAfSGIeRR+4jGai/43xC76TS2J+c6fH7jaFJTNbL5sdjsqhi0RJaYEh1SUtUgFMyW1xvAiiNcrT64A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:2894065e-3a57-4d47-b82d-21007d0c33b2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:f096136e-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 5b67e54e039d11ee83ed1395ce914268-20230605
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <wenbin.mei@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 702363830; Mon, 05 Jun 2023 05:34:47 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 5 Jun 2023 20:14:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Jun 2023 20:14:43 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Ritesh Harjani <riteshh@codeaurora.org>, "Asutosh
 Das" <asutoshd@codeaurora.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v4] mmc: mtk-sd: reduce CIT for better performance
Date: Mon, 5 Jun 2023 20:14:42 +0800
Message-ID: <20230605121442.23622-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_053455_864586_D54135C2 
X-CRM114-Status: GOOD (  15.22  )
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
Since MSDC CQE uses msdc_hclk as ITCFVAL, so driver should use hclk
frequency to get the actual time.
The default value 0x1000 that corresponds to 150us for MediaTek SoCs, let's
decrease it to 0x40 that corresponds to 2.35us, which can improve the
performance of some eMMC devices.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 drivers/mmc/host/cqhci.h  |  1 +
 drivers/mmc/host/mtk-sd.c | 45 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
index ba9387ed90eb..292b89ebd978 100644
--- a/drivers/mmc/host/cqhci.h
+++ b/drivers/mmc/host/cqhci.h
@@ -23,6 +23,7 @@
 /* capabilities */
 #define CQHCI_CAP			0x04
 #define CQHCI_CAP_CS			0x10000000 /* Crypto Support */
+#define CQHCI_CAP_ITCFMUL(x)		(((x) & GENMASK(15, 12)) >> 12)
 
 /* configuration */
 #define CQHCI_CFG			0x08
diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index edade0e54a0c..9f540973caff 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -473,6 +473,7 @@ struct msdc_host {
 	struct msdc_tune_para def_tune_para; /* default tune setting */
 	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
 	struct cqhci_host *cq_host;
+	u32 cq_ssc1_time;
 };
 
 static const struct mtk_mmc_compatible mt2701_compat = {
@@ -2450,9 +2451,48 @@ static void msdc_hs400_enhanced_strobe(struct mmc_host *mmc,
 	}
 }
 
+static void msdc_cqe_cit_cal(struct msdc_host *host, u64 timer_ns)
+{
+	struct mmc_host *mmc = mmc_from_priv(host);
+	struct cqhci_host *cq_host = mmc->cqe_private;
+	u8 itcfmul;
+	u64 hclk_freq;
+	u64 value;
+
+	/* Since MSDC CQE uses msdc_hclk as ITCFVAL, so driver should use hclk
+	 * frequency to get the actual time for CIT.
+	 */
+	hclk_freq = clk_get_rate(host->h_clk);
+	itcfmul = CQHCI_CAP_ITCFMUL(cqhci_readl(cq_host, CQHCI_CAP));
+	switch (itcfmul) {
+	case 0x0:
+		do_div(hclk_freq, 1000);
+		break;
+	case 0x1:
+		do_div(hclk_freq, 100);
+		break;
+	case 0x2:
+		do_div(hclk_freq, 10);
+		break;
+	case 0x3:
+		break;
+	case 0x4:
+		hclk_freq = hclk_freq * 10;
+		break;
+	default:
+		host->cq_ssc1_time = 0x40;
+		return;
+	}
+
+	value = hclk_freq * timer_ns;
+	do_div(value, 1000000000);
+	host->cq_ssc1_time = value;
+}
+
 static void msdc_cqe_enable(struct mmc_host *mmc)
 {
 	struct msdc_host *host = mmc_priv(mmc);
+	struct cqhci_host *cq_host = mmc->cqe_private;
 
 	/* enable cmdq irq */
 	writel(MSDC_INT_CMDQ, host->base + MSDC_INTEN);
@@ -2462,6 +2502,9 @@ static void msdc_cqe_enable(struct mmc_host *mmc)
 	msdc_set_busy_timeout(host, 20 * 1000000000ULL, 0);
 	/* default read data timeout 1s */
 	msdc_set_timeout(host, 1000000000ULL, 0);
+
+	/* Set the send status command idle timer */
+	cqhci_writel(cq_host, host->cq_ssc1_time, CQHCI_SSC1);
 }
 
 static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
@@ -2803,6 +2846,8 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		/* cqhci 16bit length */
 		/* 0 size, means 65536 so we don't have to -1 here */
 		mmc->max_seg_size = 64 * 1024;
+		/* Reduce CIT to 0x40 that corresponds to 2.35us */
+		msdc_cqe_cit_cal(host, 2350);
 	}
 
 	ret = devm_request_irq(&pdev->dev, host->irq, msdc_irq,
-- 
2.25.1


