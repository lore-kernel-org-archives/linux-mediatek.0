Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A94CC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 08:47:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E57B20716
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 08:47:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sYrTVk6A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uQwfVO/g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E57B20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7CAf+2+1pYDcUorvZLwbSxOBNmnYv6UWZFrUS89aks=; b=sYrTVk6AAXOPuY
	HuTALTcqfCaE+dqbOLrIHEh5RNYoLGkMWdi0FPhi5vHSAT2nrSxGYZUbn4vM1VcoYZKZqYp8+cFqv
	hxxJ1PTLsbw20p9ui/BS0XmllsjQ2ZaTQZJnZYyU2YsLMpXLNG4cNKAUrGjIKXf3OndYCLQ8zqOIg
	tbllPWpVm09dfxHkgoTzmHFFq4flZ3dkpLdntXXiv8/p9TAde5nivB2hWQEtIU77xw65weZcRhXpe
	UeDPqBCBNSG9oKhg/uVuP6uEBdu7Zrn/3BGZ49T/9OyX+QZl0U6jkmj4/fb6Si4ce7gzKhiLv8abr
	Uif5LY6XhfcvrYwmP25w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiDwa-0005FX-Ow; Fri, 20 Dec 2019 08:47:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiDvi-0004Tm-Nn; Fri, 20 Dec 2019 08:46:40 +0000
X-UUID: b258954cf4544505997651add69dcfd7-20191220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FQ9iJGiHG3tZx1pkXd4zqWoMs5/8XtOFzIai6fL+Jjs=; 
 b=uQwfVO/ghclJh1xap9nNHFy0FEPrnt7hhpewz4BoQODRk0bxxRDVW/V1WErS/blS+c+hjOGCIHp4ZLaFPbHeeS36xPt6VKSEi2kDxbh+APLeLDUM/qWj63b3akI5tWQWhVwpbPyvKnPaPvDS4Vh353GbVplEY9aJSEXfdY05aVM=;
X-UUID: b258954cf4544505997651add69dcfd7-20191220
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 532760001; Fri, 20 Dec 2019 00:46:35 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 00:36:56 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 16:35:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 20 Dec 2019 16:35:38 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>,
 <f.fainelli@gmail.com>
Subject: [PATCH v1 3/6] scsi: ufs-mediatek: introduce reference clock control
Date: Fri, 20 Dec 2019 16:36:25 +0800
Message-ID: <1576830988-22435-4-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1576830988-22435-1-git-send-email-stanley.chu@mediatek.com>
References: <1576830988-22435-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_004638_778045_6509597C 
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
Cc: leon.chen@mediatek.com, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
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
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
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
