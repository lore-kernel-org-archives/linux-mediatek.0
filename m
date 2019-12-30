Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C1EC2D0C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 05:34:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8533D20718
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 05:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xgawe4UV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oNPS4xmp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8533D20718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYhv306OrEgWSp75wE2mkPpx12cbOqA0TT6ub9g2E64=; b=Xgawe4UVvfuKqx
	OEaWdvXsZJNseSQhuWBzswNWF8UEBWUpPrfHua1zYNmW/H4JQb2aHe7xppXyN6R19pNlFVsezE8K0
	r5W+HQKEyo5rPI1O/tC/vHH+GEPW2IeV7YUgdllYpEheF562ULju0YgL2n2/2Yr7t59JPLNlpt9Bk
	8w2XpMlEjpFTokd18BpGw2jAxhDsw+TQY3vfmwIQkxn/B14eNLby1xKA7UisDE3vTG1y3qNdDTjHS
	3h3UH/hwJByWU36iJqNn3t3a1eTXnirOZzGc9MuKbRNVkegK0VUbRC+ljSG5ExGBOdqEsZUvauJBx
	+Vqj6+No+tn1sXYXppsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilnhE-00006B-Jx; Mon, 30 Dec 2019 05:34:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilnft-0007AB-4V; Mon, 30 Dec 2019 05:33:07 +0000
X-UUID: 611f8ea592ec43c38366e0660ab19176-20191229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CT6J6Mos8F012MHJEi2dQQCWX4KKKCdgeXYgBRHOS3k=; 
 b=oNPS4xmpH1QbfA/e8MS3EK28wTDCCkRqJxxug7ZWJq/zPG8nSgCOASSfCEFz7Ofdaywx56/0quWdpRJtG3wuG0QiRX7fmXgnNDfPlR1PtGSYhIkjcNV+1Y0DdY2iOm1B1eXMkdIEJktoip0KkHB+1mjaF+TOPVe9B+ERV3K7MlI=;
X-UUID: 611f8ea592ec43c38366e0660ab19176-20191229
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1039479302; Sun, 29 Dec 2019 21:32:59 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 29 Dec 2019 21:33:14 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 13:32:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 30 Dec 2019 13:31:37 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>,
 <bvanassche@acm.org>, <f.fainelli@gmail.com>
Subject: [PATCH v2 3/6] scsi: ufs-mediatek: introduce reference clock control
Date: Mon, 30 Dec 2019 13:32:27 +0800
Message-ID: <1577683950-1702-4-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1577683950-1702-1-git-send-email-stanley.chu@mediatek.com>
References: <1577683950-1702-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_213305_230867_49AB0681 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: leon.chen@mediatek.com, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce reference clock control in MediaTek Chipset in order
to disable it if it is not necessary by UFS device to save system power.

Currently reference clock can be disabled during system suspend, runtime
suspend and clock-gating after link enters hibernate state.

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Bean Huo <beanhuo@micron.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 62 ++++++++++++++++++++++++++++++---
 drivers/scsi/ufs/ufs-mediatek.h | 22 ++++++++++--
 2 files changed, 78 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 37e2c91fc452..fc5ba21ec02a 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -22,6 +22,9 @@
 	arm_smccc_smc(MTK_SIP_UFS_CONTROL, \
 		      cmd, val, 0, 0, 0, 0, 0, &(res))
 
+#define ufs_mtk_ref_clk_notify(on, res) \
+	ufs_mtk_smc(UFS_MTK_SIP_REF_CLK_NOTIFICATION, on, res)
+
 #define ufs_mtk_device_reset_ctrl(high, res) \
 	ufs_mtk_smc(UFS_MTK_SIP_DEVICE_RESET, high, res)
 
@@ -90,6 +93,49 @@ static int ufs_mtk_bind_mphy(struct ufs_hba *hba)
 	return err;
 }
 
+static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	struct arm_smccc_res res;
+	unsigned long timeout;
+	u32 value;
+
+	if (host->ref_clk_enabled == on)
+		return 0;
+
+	if (on) {
+		ufs_mtk_ref_clk_notify(on, res);
+		ufshcd_writel(hba, REFCLK_REQUEST, REG_UFS_REFCLK_CTRL);
+	} else {
+		ufshcd_writel(hba, REFCLK_RELEASE, REG_UFS_REFCLK_CTRL);
+	}
+
+	/* Wait for ack */
+	timeout = jiffies + msecs_to_jiffies(REFCLK_REQ_TIMEOUT_MS);
+	do {
+		value = ufshcd_readl(hba, REG_UFS_REFCLK_CTRL);
+
+		/* Wait until ack bit equals to req bit */
+		if (((value & REFCLK_ACK) >> 1) == (value & REFCLK_REQUEST))
+			goto out;
+
+		usleep_range(100, 200);
+	} while (time_before(jiffies, timeout));
+
+	dev_err(hba->dev, "missing ack of refclk req, reg: 0x%x\n", value);
+
+	ufs_mtk_ref_clk_notify(host->ref_clk_enabled, res);
+
+	return -ETIMEDOUT;
+
+out:
+	host->ref_clk_enabled = on;
+	if (!on)
+		ufs_mtk_ref_clk_notify(on, res);
+
+	return 0;
+}
+
 /**
  * ufs_mtk_setup_clocks - enables/disable clocks
  * @hba: host controller instance
@@ -114,12 +160,16 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 
 	switch (status) {
 	case PRE_CHANGE:
-		if (!on)
+		if (!on) {
+			ufs_mtk_setup_ref_clk(hba, on);
 			ret = phy_power_off(host->mphy);
+		}
 		break;
 	case POST_CHANGE:
-		if (on)
+		if (on) {
 			ret = phy_power_on(host->mphy);
+			ufs_mtk_setup_ref_clk(hba, on);
+		}
 		break;
 	}
 
@@ -305,8 +355,10 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	if (ufshcd_is_link_hibern8(hba))
+	if (ufshcd_is_link_hibern8(hba)) {
 		phy_power_off(host->mphy);
+		ufs_mtk_setup_ref_clk(hba, false);
+	}
 
 	return 0;
 }
@@ -315,8 +367,10 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	if (ufshcd_is_link_hibern8(hba))
+	if (ufshcd_is_link_hibern8(hba)) {
+		ufs_mtk_setup_ref_clk(hba, true);
 		phy_power_on(host->mphy);
+	}
 
 	return 0;
 }
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index ce68ce25fdd7..31b7fead19eb 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -9,6 +9,22 @@
 #include <linux/bitops.h>
 #include <linux/soc/mediatek/mtk_sip_svc.h>
 
+/*
+ * Vendor specific UFSHCI Registers
+ */
+#define REG_UFS_REFCLK_CTRL         0x144
+
+/*
+ * Ref-clk control
+ *
+ * Values for register REG_UFS_REFCLK_CTRL
+ */
+#define REFCLK_RELEASE              0x0
+#define REFCLK_REQUEST              BIT(0)
+#define REFCLK_ACK                  BIT(1)
+
+#define REFCLK_REQ_TIMEOUT_MS       3
+
 /*
  * Vendor specific pre-defined parameters
  */
@@ -35,8 +51,9 @@
 /*
  * SiP commands
  */
-#define MTK_SIP_UFS_CONTROL         MTK_SIP_SMC_CMD(0x276)
-#define UFS_MTK_SIP_DEVICE_RESET    BIT(1)
+#define MTK_SIP_UFS_CONTROL               MTK_SIP_SMC_CMD(0x276)
+#define UFS_MTK_SIP_DEVICE_RESET          BIT(1)
+#define UFS_MTK_SIP_REF_CLK_NOTIFICATION  BIT(3)
 
 /*
  * VS_DEBUGCLOCKENABLE
@@ -57,6 +74,7 @@ enum {
 struct ufs_mtk_host {
 	struct ufs_hba *hba;
 	struct phy *mphy;
+	bool ref_clk_enabled;
 };
 
 #endif /* !_UFS_MEDIATEK_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
