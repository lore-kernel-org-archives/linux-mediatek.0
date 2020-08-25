Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DD2C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:15:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A420320639
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 02:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ABc366XU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fS26dOhW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A420320639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l45ScDIB86cXYyO1a0qNTeMvW8nuyrDDAAjpUlku/Z0=; b=ABc366XUZxc27dqMb2ebJkFIC
	vSKlg9qalaUfw3/go9b+tA300OC3BJazM+vmXNFWmFFFVZl1NuJJCBY7vBQUdRusEJrab1bDvSX6c
	RJexADrm1XHfOBsDb6jMEq4Yfay/ZuzIs31eslVwDMxeLpQKWBuK/xC1lIeYzXHm4fXmWynTysXRJ
	iuvPbacwgIo7jSVYrtZVh9iLlSId411xQ7trNKjiwVD6cOL4si/tXY44Qa/JmvLpEY0FVcbZ05nZ3
	9aotKZ3kYICRgcszXow6KTvX0PNRkLclOTCesFqmspZ9AvBRSu9riStOsduusALHFLwbkYn6tHUWA
	lJznUBzPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOUs-0006rO-LI; Tue, 25 Aug 2020 02:15:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOU5-0006Ve-A4; Tue, 25 Aug 2020 02:14:50 +0000
X-UUID: db75d72cbb684a66a6e38fc0fcd214d9-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7b50htfKegwBuO1CDPzSAHxdaD+p7o4BKhO7e2hNWOo=; 
 b=fS26dOhWcAbBE6m39qdpOBdTCXV+U1WaYJYyUYTnFq3SsPuRQYYn1O5C1LWTdIm03KN6JtVR65l2MvJiYQazrgH4DGO2+2LK9xFfnQHWwVXSLI7jIVwfZ197L3Es8icMdp3BK4CtrZHXnK+FzcPGojDRvpqyA4vNzV43DviwfZQ=;
X-UUID: db75d72cbb684a66a6e38fc0fcd214d9-20200824
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 257675831; Mon, 24 Aug 2020 18:14:43 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 19:04:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 10:04:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Aug 2020 10:04:40 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 4/6] phy: phy-qcom-apq8064-sata: convert to
 readl_relaxed_poll_timeout()
Date: Tue, 25 Aug 2020 10:03:05 +0800
Message-ID: <1598320987-25518-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A5EAD1C8FD2955FE87DADAE9B2E41C9C6E073672D0E9B9753269DF5A26EC82042000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_221449_519746_0513302F 
X-CRM114-Status: GOOD (  13.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rikard
 Falkeborn <rikard.falkeborn@gmail.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use readl_relaxed_poll_timeout() to simplify code, rename local function
read_poll_timeout() as poll_timeout() to avoid repeated definition

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
index febe0ae..ce91ae7 100644
--- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
+++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -72,18 +73,12 @@ struct qcom_apq8064_sata_phy {
 };
 
 /* Helper function to do poll and timeout */
-static int read_poll_timeout(void __iomem *addr, u32 mask)
+static int poll_timeout(void __iomem *addr, u32 mask)
 {
-	unsigned long timeout = jiffies + msecs_to_jiffies(TIMEOUT_MS);
+	u32 val;
 
-	do {
-		if (readl_relaxed(addr) & mask)
-			return 0;
-
-		usleep_range(DELAY_INTERVAL_US, DELAY_INTERVAL_US + 50);
-	} while (!time_after(jiffies, timeout));
-
-	return (readl_relaxed(addr) & mask) ? 0 : -ETIMEDOUT;
+	return readl_relaxed_poll_timeout(addr, val, (val & mask),
+					DELAY_INTERVAL_US, TIMEOUT_MS * 1000);
 }
 
 static int qcom_apq8064_sata_phy_init(struct phy *generic_phy)
@@ -137,21 +132,21 @@ static int qcom_apq8064_sata_phy_init(struct phy *generic_phy)
 	writel_relaxed(0x05, base + UNIPHY_PLL_LKDET_CFG2);
 
 	/* PLL Lock wait */
-	ret = read_poll_timeout(base + UNIPHY_PLL_STATUS, UNIPHY_PLL_LOCK);
+	ret = poll_timeout(base + UNIPHY_PLL_STATUS, UNIPHY_PLL_LOCK);
 	if (ret) {
 		dev_err(phy->dev, "poll timeout UNIPHY_PLL_STATUS\n");
 		return ret;
 	}
 
 	/* TX Calibration */
-	ret = read_poll_timeout(base + SATA_PHY_TX_IMCAL_STAT, SATA_PHY_TX_CAL);
+	ret = poll_timeout(base + SATA_PHY_TX_IMCAL_STAT, SATA_PHY_TX_CAL);
 	if (ret) {
 		dev_err(phy->dev, "poll timeout SATA_PHY_TX_IMCAL_STAT\n");
 		return ret;
 	}
 
 	/* RX Calibration */
-	ret = read_poll_timeout(base + SATA_PHY_RX_IMCAL_STAT, SATA_PHY_RX_CAL);
+	ret = poll_timeout(base + SATA_PHY_RX_IMCAL_STAT, SATA_PHY_RX_CAL);
 	if (ret) {
 		dev_err(phy->dev, "poll timeout SATA_PHY_RX_IMCAL_STAT\n");
 		return ret;
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
