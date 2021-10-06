Return-Path: <SRS0=2J9p=O2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB43C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Oct 2021 03:10:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41F861139
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Oct 2021 03:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F41F861139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRVccSWF1pOyEA18l5KVb4sv+L5shJNuW6iXLYh4pyM=; b=456vHEiran7eKH
	9/hfbnU8tBXN98tQDDVZgt+Y5LW1zED15bmJ9C/jZP9J+UnAzqd/AwSscDDpAWhTxv+fk/a7lZOXn
	LTV+G3WszIZr3r1YszvBaasy9K9MH1YZMgHf2jIKJpeLDuqGI9jQfPWJrFtC0Aq31qYioGUVwD1CH
	zJjg4lCw7vq7UgPr4PCMeH5Zy48jaURRQ0dH+i6StygyNLVgis9sxZqqa2mdcic7irLl/pV7vNa55
	qEInyvRmh1yhrfWl/eZVThUygwOuvM6EsoOfu5MkmXT0aZMPunv1Nm1zMlfjCcBZhUDnBlGQubB62
	b77dpBpP+6/Rya2wIh+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXxJv-00CfV5-8f; Wed, 06 Oct 2021 03:10:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXxJr-00CfTl-Uz
 for linux-mediatek@lists.infradead.org; Wed, 06 Oct 2021 03:10:13 +0000
X-UUID: eddebd361dd548f6b03eb5a8319ac351-20211005
X-UUID: eddebd361dd548f6b03eb5a8319ac351-20211005
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 283734972; Tue, 05 Oct 2021 20:10:04 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Oct 2021 20:10:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 6 Oct 2021 11:10:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 Oct 2021 11:10:01 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
 <martin.petersen@oracle.com>, <avri.altman@wdc.com>,
 <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
 <chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
 <powen.kao@mediatek.com>, <jonathan.hsu@mediatek.com>,
 <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <mikebi@micron.com>
Subject: [PATCH v3 2/2] scsi: ufs: ufs-mediatek: disable auto-hibern8 before
 suspend
Date: Wed, 6 Oct 2021 11:09:59 +0800
Message-ID: <20211006030959.20533-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211006030959.20533-1-peter.wang@mediatek.com>
References: <20211006030959.20533-1-peter.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_201012_015248_F1242493 
X-CRM114-Status: GOOD (  17.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

Mediatek UFS design need disable auto-hibern8 before suspend.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/scsi/ufs/ufs-exynos.c   |  6 ++-
 drivers/scsi/ufs/ufs-hisi.c     |  6 ++-
 drivers/scsi/ufs/ufs-mediatek.c | 68 ++++++++++++++++++++++++++++++++-
 drivers/scsi/ufs/ufs-mediatek.h | 20 ++++++++++
 drivers/scsi/ufs/ufs-qcom.c     |  6 ++-
 5 files changed, 102 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-exynos.c b/drivers/scsi/ufs/ufs-exynos.c
index a14dd8ce56d4..b2ec9e20b14d 100644
--- a/drivers/scsi/ufs/ufs-exynos.c
+++ b/drivers/scsi/ufs/ufs-exynos.c
@@ -1176,10 +1176,14 @@ static void exynos_ufs_hibern8_notify(struct ufs_hba *hba,
 	}
 }
 
-static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
+static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
+	enum ufs_notify_change_status status)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
+	if (status == PRE_CHANGE)
+		return 0;
+
 	if (!ufshcd_is_link_active(hba))
 		phy_power_off(ufs->phy);
 
diff --git a/drivers/scsi/ufs/ufs-hisi.c b/drivers/scsi/ufs/ufs-hisi.c
index 6b706de8354b..8c7e8d321746 100644
--- a/drivers/scsi/ufs/ufs-hisi.c
+++ b/drivers/scsi/ufs/ufs-hisi.c
@@ -396,10 +396,14 @@ static int ufs_hisi_pwr_change_notify(struct ufs_hba *hba,
 	return ret;
 }
 
-static int ufs_hisi_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
+static int ufs_hisi_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
+	enum ufs_notify_change_status status)
 {
 	struct ufs_hisi_host *host = ufshcd_get_variant(hba);
 
+	if (status == PRE_CHANGE)
+		return 0;
+
 	if (pm_op == UFS_RUNTIME_PM)
 		return 0;
 
diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index d2d7e76c5ec8..d1696db70ce8 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -311,6 +311,46 @@ static void ufs_mtk_dbg_sel(struct ufs_hba *hba)
 	}
 }
 
+static void ufs_mtk_wait_idle_state(struct ufs_hba *hba,
+			    unsigned long retry_ms)
+{
+	u64 timeout, time_checked;
+	u32 val, sm;
+	bool wait_idle;
+
+	timeout = sched_clock() + retry_ms * 1000000UL;
+
+
+	/* wait a specific time after check base */
+	udelay(10);
+	wait_idle = false;
+
+	do {
+		time_checked = sched_clock();
+		ufs_mtk_dbg_sel(hba);
+		val = ufshcd_readl(hba, REG_UFS_PROBE);
+
+		sm = val & 0x1f;
+
+		/*
+		 * if state is in H8 enter and H8 enter confirm
+		 * wait until return to idle state.
+		 */
+		if ((sm >= VS_HIB_ENTER) && (sm <= VS_HIB_EXIT)) {
+			wait_idle = true;
+			udelay(50);
+			continue;
+		} else if (!wait_idle)
+			break;
+
+		if (wait_idle && (sm == VS_HCE_BASE))
+			break;
+	} while (time_checked < timeout);
+
+	if (wait_idle && sm != VS_HCE_BASE)
+		dev_info(hba->dev, "wait idle tmo: 0x%x\n", val);
+}
+
 static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
 				   unsigned long max_wait_ms)
 {
@@ -949,11 +989,37 @@ static void ufs_mtk_vreg_set_lpm(struct ufs_hba *hba, bool lpm)
 				   REGULATOR_MODE_NORMAL);
 }
 
-static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
+static void ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
+{
+	unsigned long flags;
+	int ret;
+
+	/* disable auto-hibern8 */
+	spin_lock_irqsave(hba->host->host_lock, flags);
+	ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
+	spin_unlock_irqrestore(hba->host->host_lock, flags);
+
+	/* wait host return to idle state when auto-hibern8 off */
+	ufs_mtk_wait_idle_state(hba, 5);
+
+	ret = ufs_mtk_wait_link_state(hba, VS_LINK_UP, 100);
+	if (ret)
+		dev_warn(hba->dev, "exit h8 state fail, ret=%d\n", ret);
+}
+
+static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
+	enum ufs_notify_change_status status)
 {
 	int err;
 	struct arm_smccc_res res;
 
+	if (status == PRE_CHANGE) {
+		if (!ufshcd_is_auto_hibern8_supported(hba))
+			return 0;
+		ufs_mtk_auto_hibern8_disable(hba);
+		return 0;
+	}
+
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_lpm(hba);
 		if (err)
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 524c8e2c1e6f..c96b9b529ee2 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -54,6 +54,26 @@ enum {
 	VS_LINK_CFG                 = 5,
 };
 
+/*
+ * Vendor specific host controller state
+ */
+enum {
+	VS_HCE_RESET                = 0,
+	VS_HCE_BASE                 = 1,
+	VS_HCE_OOCPR_WAIT           = 2,
+	VS_HCE_DME_RESET            = 3,
+	VS_HCE_MIDDLE               = 4,
+	VS_HCE_DME_ENABLE           = 5,
+	VS_HCE_DEFAULTS             = 6,
+	VS_HIB_IDLEEN               = 7,
+	VS_HIB_ENTER                = 8,
+	VS_HIB_ENTER_CONF           = 9,
+	VS_HIB_MIDDLE               = 10,
+	VS_HIB_WAITTIMER            = 11,
+	VS_HIB_EXIT_CONF            = 12,
+	VS_HIB_EXIT                 = 13,
+};
+
 /*
  * SiP commands
  */
diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 9d9770f1db4f..82cc55744afc 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -589,11 +589,15 @@ static void ufs_qcom_device_reset_ctrl(struct ufs_hba *hba, bool asserted)
 	gpiod_set_value_cansleep(host->device_reset, asserted);
 }
 
-static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
+static int ufs_qcom_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
+	enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct phy *phy = host->generic_phy;
 
+	if (status == PRE_CHANGE)
+		return 0;
+
 	if (ufs_qcom_is_link_off(hba)) {
 		/*
 		 * Disable the tx/rx lane symbol clocks before PHY is
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
