Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BBCC55178
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:58:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CD1520838
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JCS9Vr/6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OTF+tDpo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CD1520838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0k04uuTdsYnJaTaEoUzVydLEca3KDijcgqiXBTYa1H4=; b=JCS9Vr/6Z6BGuBcKcfqmiG4uP
	/3SgQh+fFqE4dlvN3Aq4lEeLPvgpJ7R2CwRha7jTjBYznR7VepeDGiwb/ouWmjwS8xHeSeKZn8xhw
	+cKPuglSElGYNYuOfYWPM4+YKex8i6XSCiJzssazlPhdZcBJ1FJIeQbW9HYo9tJtSu1UGPJxukyHB
	gtd2cVO0754BqjVbvHdmSUNgEjSlpn4uP44KX29d2GxCvlULlMzHcGOharsFHwEX0Z5AfjPRGiiOg
	mm7dJuQXZs3wdWgu2bjSrwxZjSkejTWIN2wgT+u6pJzWA/3FKI+PVc7SEV7xIGQhaqEKRWNL6Lv0K
	kanXmuRkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY6ZW-0005gP-Tu; Thu, 29 Oct 2020 11:58:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY6ZD-0005Xp-EA; Thu, 29 Oct 2020 11:58:09 +0000
X-UUID: 163583d3457944728ceedcf1a7dab9a8-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=LOQmyP54SIzhf8yxDPWaDlmMn9uAWwzmBOlolnQyTaU=; 
 b=OTF+tDpoqgugftRV4s8Ec4GGbHKaolgxf7kL4jWevphIIVRgdjd6lXzhwPNIKw5Ub+aGFj6sALXTQ8beQrL+0rT8/HObdPxhOEq9TRv88oWmFU3f/JjzxKz+0Z5HJ2USy+UcIgEX9veoYk76ly07WvhP7GAEo6KwV7u91egeCf4=;
X-UUID: 163583d3457944728ceedcf1a7dab9a8-20201029
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1477595248; Thu, 29 Oct 2020 03:57:55 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 04:57:52 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 19:57:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Oct 2020 19:57:50 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 2/6] scsi: ufs-mediatek: Support VA09 regulator operations
Date: Thu, 29 Oct 2020 19:57:46 +0800
Message-ID: <20201029115750.24391-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201029115750.24391-1-stanley.chu@mediatek.com>
References: <20201029115750.24391-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_075807_728822_BC3D9AE6 
X-CRM114-Status: GOOD (  23.98  )
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
Cc: andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 jiajie.hao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some MediaTek UFS platforms need to control VA09 power
specifically. Provide such control according to the device
tree binding.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 137 ++++++++++++++++++++++++--------
 drivers/scsi/ufs/ufs-mediatek.h |   3 +
 2 files changed, 108 insertions(+), 32 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 0196a89055b5..795fc2961f77 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -28,6 +28,9 @@
 	arm_smccc_smc(MTK_SIP_UFS_CONTROL, \
 		      cmd, val, 0, 0, 0, 0, 0, &(res))
 
+#define ufs_mtk_va09_pwr_ctrl(res, on) \
+	ufs_mtk_smc(UFS_MTK_SIP_VA09_PWR_CTRL, on, res)
+
 #define ufs_mtk_crypto_ctrl(res, enable) \
 	ufs_mtk_smc(UFS_MTK_SIP_CRYPTO_CTRL, enable, res)
 
@@ -45,6 +48,10 @@ static struct ufs_dev_fix ufs_mtk_dev_fixups[] = {
 	END_FIX
 };
 
+static const struct ufs_mtk_host_cfg ufs_mtk_mt8183_cfg = {
+	.caps = UFS_MTK_CAP_VA09_PWR_CTRL,
+};
+
 static const struct ufs_mtk_host_cfg ufs_mtk_mt8192_cfg = {
 	.caps = UFS_MTK_CAP_BOOST_CRYPT_ENGINE,
 };
@@ -52,6 +59,7 @@ static const struct ufs_mtk_host_cfg ufs_mtk_mt8192_cfg = {
 static const struct of_device_id ufs_mtk_of_match[] = {
 	{
 		.compatible = "mediatek,mt8183-ufshci",
+		.data = &ufs_mtk_mt8183_cfg
 	},
 	{
 		.compatible = "mediatek,mt8192-ufshci",
@@ -67,6 +75,13 @@ static bool ufs_mtk_is_boost_crypt_enabled(struct ufs_hba *hba)
 	return (host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
 }
 
+static bool ufs_mtk_is_va09_supported(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	return (host->caps & UFS_MTK_CAP_VA09_PWR_CTRL);
+}
+
 static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
 {
 	u32 tmp;
@@ -300,21 +315,46 @@ static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
 	return -ETIMEDOUT;
 }
 
-static void ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
+static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct phy *mphy = host->mphy;
+	struct arm_smccc_res res;
+	int ret = 0;
 
-	if (!mphy)
-		return;
+	if (!mphy || !(on ^ host->mphy_powered_on))
+		return 0;
 
-	if (on && !host->mphy_powered_on)
+	if (on) {
+		if (host->reg_va09) {
+			ret = regulator_enable(host->reg_va09);
+			if (ret < 0)
+				goto out;
+			/* wait 200 us to stablize VA09 */
+			usleep_range(200, 210);
+			ufs_mtk_va09_pwr_ctrl(res, 1);
+		}
 		phy_power_on(mphy);
-	else if (!on && host->mphy_powered_on)
+	} else {
 		phy_power_off(mphy);
-	else
-		return;
-	host->mphy_powered_on = on;
+		if (host->reg_va09) {
+			ufs_mtk_va09_pwr_ctrl(res, 0);
+			ret = regulator_disable(host->reg_va09);
+			if (ret < 0)
+				goto out;
+		}
+	}
+out:
+	if (ret) {
+		dev_info(hba->dev,
+			 "failed to %s va09: %d\n",
+			 on ? "enable" : "disable",
+			 ret);
+	} else {
+		host->mphy_powered_on = on;
+	}
+
+	return ret;
 }
 
 static int ufs_mtk_get_host_clk(struct device *dev, const char *name,
@@ -402,7 +442,7 @@ static int ufs_mtk_init_host_clk(struct ufs_hba *hba, const char *name,
 	return ret;
 }
 
-static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
+static void ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct ufs_mtk_crypt_cfg *cfg;
@@ -410,11 +450,6 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 	struct regulator *reg;
 	u32 volt;
 
-	host->caps = host->cfg->caps;
-
-	if (!ufs_mtk_is_boost_crypt_enabled(hba))
-		return;
-
 	host->crypt = devm_kzalloc(dev, sizeof(*(host->crypt)),
 				   GFP_KERNEL);
 	if (!host->crypt)
@@ -448,13 +483,38 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 
 	cfg->reg_vcore = reg;
 	cfg->vcore_volt = volt;
-	dev_info(dev, "caps: boost-crypt");
 	return;
 
 disable_caps:
 	host->caps &= ~UFS_MTK_CAP_BOOST_CRYPT_ENGINE;
 }
 
+static void ufs_mtk_init_va09_pwr_ctrl(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	host->reg_va09 = regulator_get(hba->dev, "va09");
+	if (!host->reg_va09) {
+		dev_info(hba->dev, "failed to get va09");
+		host->caps &= ~UFS_MTK_CAP_VA09_PWR_CTRL;
+	}
+}
+
+static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	host->caps = host->cfg->caps;
+
+	if (ufs_mtk_is_boost_crypt_enabled(hba))
+		ufs_mtk_init_boost_crypt(hba);
+
+	if (ufs_mtk_is_va09_supported(hba))
+		ufs_mtk_init_va09_pwr_ctrl(hba);
+
+	dev_info(hba->dev, "caps: 0x%x", host->caps);
+}
+
 /**
  * ufs_mtk_setup_clocks - enables/disable clocks
  * @hba: host controller instance
@@ -467,8 +527,8 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 				enum ufs_notify_change_status status)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-	int ret = 0;
 	bool clk_pwr_off = false;
+	int ret = 0;
 
 	/*
 	 * In case ufs_mtk_init() is not yet done, simply ignore.
@@ -499,10 +559,10 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 		if (clk_pwr_off) {
 			ufs_mtk_boost_crypt(hba, on);
 			ufs_mtk_setup_ref_clk(hba, on);
-			ufs_mtk_mphy_power_on(hba, on);
+			phy_power_off(host->mphy);
 		}
 	} else if (on && status == POST_CHANGE) {
-		ufs_mtk_mphy_power_on(hba, on);
+		phy_power_on(host->mphy);
 		ufs_mtk_setup_ref_clk(hba, on);
 		ufs_mtk_boost_crypt(hba, on);
 	}
@@ -575,6 +635,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	 *
 	 * Enable phy clocks specifically here.
 	 */
+	ufs_mtk_mphy_power_on(hba, true);
 	ufs_mtk_setup_clocks(hba, true, POST_CHANGE);
 
 	goto out;
@@ -824,40 +885,52 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_lpm(hba);
-		if (err) {
-			/*
-			 * Set link as off state enforcedly to trigger
-			 * ufshcd_host_reset_and_restore() in ufshcd_suspend()
-			 * for completed host reset.
-			 */
-			ufshcd_set_link_off(hba);
-			return -EAGAIN;
-		}
+		if (err)
+			goto fail;
+	}
+
+	if (!ufshcd_is_link_active(hba)) {
 		/*
 		 * Make sure no error will be returned to prevent
 		 * ufshcd_suspend() re-enabling regulators while vreg is still
 		 * in low-power mode.
 		 */
 		ufs_mtk_vreg_set_lpm(hba, true);
+		err = ufs_mtk_mphy_power_on(hba, false);
+		if (err)
+			goto fail;
 	}
 
 	return 0;
+fail:
+	/*
+	 * Set link as off state enforcedly to trigger
+	 * ufshcd_host_reset_and_restore() in ufshcd_suspend()
+	 * for completed host reset.
+	 */
+	ufshcd_set_link_off(hba);
+	return -EAGAIN;
 }
 
 static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	int err;
 
+	err = ufs_mtk_mphy_power_on(hba, true);
+	if (err)
+		goto fail;
+
+	ufs_mtk_vreg_set_lpm(hba, false);
+
 	if (ufshcd_is_link_hibern8(hba)) {
-		ufs_mtk_vreg_set_lpm(hba, false);
 		err = ufs_mtk_link_set_hpm(hba);
-		if (err) {
-			err = ufshcd_link_recovery(hba);
-			return err;
-		}
+		if (err)
+			goto fail;
 	}
 
 	return 0;
+fail:
+	return ufshcd_link_recovery(hba);
 }
 
 static void ufs_mtk_dbg_register_dump(struct ufs_hba *hba)
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 2b6a1312c9bc..f668241d37f8 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -69,6 +69,7 @@ enum {
  * SiP commands
  */
 #define MTK_SIP_UFS_CONTROL               MTK_SIP_SMC_CMD(0x276)
+#define UFS_MTK_SIP_VA09_PWR_CTRL         BIT(0)
 #define UFS_MTK_SIP_DEVICE_RESET          BIT(1)
 #define UFS_MTK_SIP_CRYPTO_CTRL           BIT(2)
 #define UFS_MTK_SIP_REF_CLK_NOTIFICATION  BIT(3)
@@ -94,6 +95,7 @@ enum {
  */
 enum ufs_mtk_host_caps {
 	UFS_MTK_CAP_BOOST_CRYPT_ENGINE         = 1 << 0,
+	UFS_MTK_CAP_VA09_PWR_CTRL              = 1 << 1,
 };
 
 struct ufs_mtk_crypt_cfg {
@@ -113,6 +115,7 @@ struct ufs_mtk_host {
 	struct phy *mphy;
 	struct ufs_mtk_host_cfg *cfg;
 	struct ufs_mtk_crypt_cfg *crypt;
+	struct regulator *reg_va09;
 	enum ufs_mtk_host_caps caps;
 	struct reset_control *hci_reset;
 	struct reset_control *unipro_reset;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
