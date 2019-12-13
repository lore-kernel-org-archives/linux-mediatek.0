Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE83C43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:12:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D74F22527
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:12:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sh9ebu4C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Db5yipWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D74F22527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhLbeqqE0tEDKYyPJCqBH2+XE/o5GjyMEOsBRNIn7ko=; b=sh9ebu4CHjtbN6
	IdZouHZK4Ksq9fPvQvq4LDl6KHvTXLIjQ6rf1J9BKtb5LXKg6YFIxL7b4h4/oIPnGoq865d8PSM7J
	F+JGDa8OIRBM3aw/ZukhKXoEdOj2dslGAiLV6qU0CENGH/fDxLqFs/jp76cYi4lZPWx6bE0h3cWEA
	9ZYY7RCh53M/QIZz31W+rM9wIDAq9bIMnLfulZElPFOt2HMfGDt+ZLgOzqgBUqZC8pdWjLwkhTxBV
	uowdOipl/fsAuTqcJ12fS54MrBQ6SugymvmiS6Pmo2sA9p3rNWTwH+wqRd61Ve5/UeQ4KTA6hm+Tw
	GIT+Rstvq1AZmSR96LIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifg3J-000078-J0; Fri, 13 Dec 2019 08:11:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifg3G-00005Y-1W; Fri, 13 Dec 2019 08:11:55 +0000
X-UUID: 0f4604af9b8647369d4ae136b1cec1f4-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XhTCXQMz9W16QzlMSFeAKscL9UN80OVD7nIAnDiOOmE=; 
 b=Db5yipWKuqgNE3knz/yBjVKvN05hRBb7UotvnXqeLVIz8v8oPmH7ZAPsAtgDaJlkiHPR3Boz4O8iilY8dJBIU7WTNswFzt847Bz6Jyc8iE4qVezUQcgTUclzK1xWs8yEEMRHueqe1rgOQcHp94Wi6Oqb38TF28nZ6IJLmMYtc5s=;
X-UUID: 0f4604af9b8647369d4ae136b1cec1f4-20191213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1571896366; Fri, 13 Dec 2019 00:11:47 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 00:12:02 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 16:11:18 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 13 Dec 2019 16:11:05 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>
Subject: [PATCH v1 1/4] scsi: ufs-mediatek: introduce reference clock control
Date: Fri, 13 Dec 2019 16:11:32 +0800
Message-ID: <1576224695-22657-2-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1576224695-22657-1-git-send-email-stanley.chu@mediatek.com>
References: <1576224695-22657-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_001154_091153_B4B01934 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
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

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 64 ++++++++++++++++++++++++++++++---
 drivers/scsi/ufs/ufs-mediatek.h | 20 +++++++++--
 2 files changed, 78 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 6a3ec11b16db..690483c78212 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -18,6 +18,11 @@
 #include "unipro.h"
 #include "ufs-mediatek.h"
 
+#define ufs_mtk_ref_clk_notify(on, res) \
+	arm_smccc_smc(MTK_SIP_UFS_CONTROL, \
+		      UFS_MTK_SIP_REF_CLK_NOTIFICATION, \
+		      on, 0, 0, 0, 0, 0, &(res))
+
 static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
 {
 	u32 tmp;
@@ -83,6 +88,49 @@ static int ufs_mtk_bind_mphy(struct ufs_hba *hba)
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
@@ -107,12 +155,16 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 
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
 
@@ -299,8 +351,10 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	if (ufshcd_is_link_hibern8(hba))
+	if (ufshcd_is_link_hibern8(hba)) {
 		phy_power_off(host->mphy);
+		ufs_mtk_setup_ref_clk(hba, false);
+	}
 
 	return 0;
 }
@@ -309,8 +363,10 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
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
index b03f601d3a9e..14f8a8357c09 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -6,7 +6,21 @@
 #ifndef _UFS_MEDIATEK_H
 #define _UFS_MEDIATEK_H
 
-#include <linux/bitops.h>
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
 
 /*
  * Vendor specific pre-defined parameters
@@ -34,7 +48,8 @@
 /*
  * SiP commands
  */
-#define UFS_MTK_SIP_DEVICE_RESET    BIT(1)
+#define UFS_MTK_SIP_DEVICE_RESET          BIT(1)
+#define UFS_MTK_SIP_REF_CLK_NOTIFICATION  BIT(3)
 
 /*
  * VS_DEBUGCLOCKENABLE
@@ -55,6 +70,7 @@ enum {
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
