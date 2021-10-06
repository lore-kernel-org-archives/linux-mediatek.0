Return-Path: <SRS0=2J9p=O2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2FDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Oct 2021 05:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1E260F22
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Oct 2021 05:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B1E260F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4jvnfdSUOEYhgNkPXi45CDhKNboE4y1+5KNpQz57Paw=; b=4uXPDc7ExvOD7z
	nwVBUmri8Fqe/sTsR1wUw9cZLl9kNjuX3ZwzooiD+ECgHd5P5GsvgjnjTnYii6C1sART3xFC3aHKI
	RzP6t3jEWG/r2itJY7Whoq9A0f2tsNZm1hICGY4J5GLqVOzGkcVvFBqNHmwTS1DtYmyt02ia4aTeN
	NyvzzTKQCqRGPrGO+/NrUJs2BoM9PY4laKZZpcD56xKpjN5WJFCpW6BI5hgZkq4i/zMHUcolAkduZ
	tVmduT9EJUxSeQibx3Ge3ZJHoWhEt8elUZZzCmhQAt8jYqtgJ0awaULNU+F0cvI38do9w0VuwSfj7
	jtekH1EhlwrQ2AZlC8eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXznG-00CtZi-H4; Wed, 06 Oct 2021 05:48:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXznC-00CtZ5-RJ
 for linux-mediatek@lists.infradead.org; Wed, 06 Oct 2021 05:48:40 +0000
X-UUID: 2ccbf937b39642f2827bdaf2d4cd9a95-20211005
X-UUID: 2ccbf937b39642f2827bdaf2d4cd9a95-20211005
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1697295385; Tue, 05 Oct 2021 22:48:36 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Oct 2021 22:47:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 6 Oct 2021 13:47:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 Oct 2021 13:47:07 +0800
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
Subject: [PATCH v4] scsi: ufs: support vops pre suspend for mediatek to
 disable auto-hibern8
Date: Wed, 6 Oct 2021 13:47:05 +0800
Message-ID: <20211006054705.21885-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_224838_921415_773A692E 
X-CRM114-Status: GOOD (  20.96  )
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
This patch introduce an solution to do pre suspned before SSU
(sleep) command.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/scsi/ufs/ufs-exynos.c   |  6 ++-
 drivers/scsi/ufs/ufs-hisi.c     |  6 ++-
 drivers/scsi/ufs/ufs-mediatek.c | 68 ++++++++++++++++++++++++++++++++-
 drivers/scsi/ufs/ufs-mediatek.h | 20 ++++++++++
 drivers/scsi/ufs/ufs-qcom.c     |  6 ++-
 drivers/scsi/ufs/ufshcd.c       |  9 ++++-
 drivers/scsi/ufs/ufshcd.h       |  8 ++--
 7 files changed, 114 insertions(+), 9 deletions(-)

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
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 188de6f91050..73eb626fa88f 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8897,6 +8897,10 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	flush_work(&hba->eeh_work);
 
+	ret = ufshcd_vops_suspend(hba, pm_op, PRE_CHANGE);
+	if (ret)
+		goto enable_scaling;
+
 	if (req_dev_pwr_mode != hba->curr_dev_pwr_mode) {
 		if (pm_op != UFS_RUNTIME_PM)
 			/* ensure that bkops is disabled */
@@ -8924,7 +8928,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	 * vendor specific host controller register space call them before the
 	 * host clocks are ON.
 	 */
-	ret = ufshcd_vops_suspend(hba, pm_op);
+	ret = ufshcd_vops_suspend(hba, pm_op, POST_CHANGE);
 	if (ret)
 		goto set_link_active;
 	goto out;
@@ -9052,7 +9056,8 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 set_old_link_state:
 	ufshcd_link_state_transition(hba, old_link_state, 0);
 vendor_suspend:
-	ufshcd_vops_suspend(hba, pm_op);
+	ufshcd_vops_suspend(hba, pm_op, PRE_CHANGE);
+	ufshcd_vops_suspend(hba, pm_op, POST_CHANGE);
 out:
 	if (ret)
 		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index f0da5d3db1fa..e90320253d96 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -344,7 +344,8 @@ struct ufs_hba_variant_ops {
 					enum ufs_notify_change_status);
 	int	(*apply_dev_quirks)(struct ufs_hba *hba);
 	void	(*fixup_dev_quirks)(struct ufs_hba *hba);
-	int     (*suspend)(struct ufs_hba *, enum ufs_pm_op);
+	int     (*suspend)(struct ufs_hba *, enum ufs_pm_op,
+					enum ufs_notify_change_status);
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
 	int	(*phy_initialization)(struct ufs_hba *);
@@ -1300,10 +1301,11 @@ static inline void ufshcd_vops_fixup_dev_quirks(struct ufs_hba *hba)
 		hba->vops->fixup_dev_quirks(hba);
 }
 
-static inline int ufshcd_vops_suspend(struct ufs_hba *hba, enum ufs_pm_op op)
+static inline int ufshcd_vops_suspend(struct ufs_hba *hba, enum ufs_pm_op op,
+				enum ufs_notify_change_status status)
 {
 	if (hba->vops && hba->vops->suspend)
-		return hba->vops->suspend(hba, op);
+		return hba->vops->suspend(hba, op, status);
 
 	return 0;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
