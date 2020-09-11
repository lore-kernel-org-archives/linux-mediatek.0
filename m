Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944DEC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:50:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37D6D221E5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 03:50:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bbU4jgOm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ugV0ZgGT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37D6D221E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mTcn6mwhnJ/g77Bw1Vc08OGQsqvf+fzksjNd9gvDHdw=; b=bbU4jgOmFU5Uk8EkKXEUAVRt5
	ontDlORa89G/4cF32Vy9Wnj075bNB/soVZnzMq82YGyJ23lTMLvOooR3MUn2BEn5bud0oDhG+Bdot
	jiw/wyw4m3F4B5OOZg6MvmNBEnjJfoK3XhLh02+VkQdXQ3H3rPxsTDfUjvhQ5nss/KuFY/lmX+wnp
	4sEEsU0oebcrH95QyPdWuG+1s+Sp21scw3zxBToU5ubk9IcX2wszyPssj1eEFqoTKcK5bh/jPvYYM
	VPJOKcIKQDdeJIR6+uTVzKflUUpOxeEStNf9ybd/Uv2bAfbwulewxOKoIJjl8aFFSepqSv2dMANVD
	mcPt/T/MQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGa4g-0007Kn-Sf; Fri, 11 Sep 2020 03:50:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGa4Q-0007D5-MY; Fri, 11 Sep 2020 03:49:56 +0000
X-UUID: c0317598424345a4b090ce0d2bfadd43-20200910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DyVs6ZIEDLwe1bQI5yBUIuAZEwUjGoYCgpxKg68T8x8=; 
 b=ugV0ZgGT0jM8ryx+GdGaFCI4OrML5CByodRvkMrk/TKmaYvbBav9Kn+09xyMyfKo7cOuXxAlU4uiskO129S3ezO7pETlgGxXJ0ex3Ghlx7vbS8nkKlTMc+Trca7m5EPX45Pc5lq2H58wazau7B4MLFgRCPEd678niWps7K2zwWw=;
X-UUID: c0317598424345a4b090ce0d2bfadd43-20200910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1574658896; Thu, 10 Sep 2020 19:35:01 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 20:24:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 11:24:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Sep 2020 11:24:50 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <robh@kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH 1/2] scsi: ufs-mediatek: Support performance mode for inline
 encryption engine
Date: Fri, 11 Sep 2020 11:24:48 +0800
Message-ID: <20200911032449.21577-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200911032449.21577-1-stanley.chu@mediatek.com>
References: <20200911032449.21577-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 96D0A24FB338C7B4A1F0089785CC669FB6C20EB81A0CC8E925F63CF5CE713F872000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_234954_914408_A24C8E3E 
X-CRM114-Status: GOOD (  22.40  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, HenryC.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 arvin.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some MediaTek UFS platforms support high-performance mode that inline
encryption engine can be boosted while UFS is not clock-gated.

The high-performance mode will be enabled if all below conditions are
well-declaired in device tree,

1. Proper platform-specific compatible string which enables the host
   capability "UFS_MTK_CAP_BOOST_CRYPT_ENGINE".

2. "dvfsrc-vcore" node is available in this platform.

3. Clock mux and clock parents of inline encryption engine for both
   "low-power mode" and "high-performance mode".

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 178 ++++++++++++++++++++++++++++++--
 drivers/scsi/ufs/ufs-mediatek.h |  22 ++++
 2 files changed, 194 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 3ec44dfa2567..f6250b54f0a0 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -10,6 +10,7 @@
 #include <linux/bitfield.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -44,6 +45,28 @@ static struct ufs_dev_fix ufs_mtk_dev_fixups[] = {
 	END_FIX
 };
 
+static const struct ufs_mtk_host_cfg ufs_mtk_mt8192_cfg = {
+	.caps = UFS_MTK_CAP_BOOST_CRYPT_ENGINE,
+};
+
+static const struct of_device_id ufs_mtk_of_match[] = {
+	{
+		.compatible = "mediatek,mt8183-ufshci",
+	},
+	{
+		.compatible = "mediatek,mt8192-ufshci",
+		.data = &ufs_mtk_mt8192_cfg
+	},
+	{},
+};
+
+static bool ufs_mtk_is_boost_crypt_enabled(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	return (host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
+}
+
 static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
 {
 	u32 tmp;
@@ -294,6 +317,139 @@ static void ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 	host->mphy_powered_on = on;
 }
 
+static int ufs_mtk_get_host_clk(struct device *dev, const char *name,
+				struct clk **clk_out)
+{
+	struct clk *clk;
+	int err = 0;
+
+	clk = devm_clk_get(dev, name);
+	if (IS_ERR(clk))
+		err = PTR_ERR(clk);
+	else
+		*clk_out = clk;
+
+	return err;
+}
+
+static void ufs_mtk_boost_crypt(struct ufs_hba *hba, bool boost)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	struct ufs_mtk_crypt_cfg *cfg;
+	struct regulator *reg;
+	int volt, ret;
+
+	if (!ufs_mtk_is_boost_crypt_enabled(hba))
+		return;
+
+	cfg = host->crypt;
+	volt = cfg->vcore_volt;
+	reg = cfg->reg_vcore;
+
+	ret = clk_prepare_enable(cfg->clk_crypt_mux);
+	if (ret) {
+		dev_info(hba->dev, "clk_prepare_enable(): %d\n",
+			 ret);
+		return;
+	}
+
+	if (boost) {
+		ret = regulator_set_voltage(reg, volt, INT_MAX);
+		if (ret) {
+			dev_info(hba->dev,
+				 "failed to set vcore to %d\n", volt);
+			goto out;
+		}
+
+		ret = clk_set_parent(cfg->clk_crypt_mux,
+				     cfg->clk_crypt_perf);
+		if (ret) {
+			dev_info(hba->dev,
+				 "failed to set clk_crypt_perf\n");
+			regulator_set_voltage(reg, 0, INT_MAX);
+			goto out;
+		}
+	} else {
+		ret = clk_set_parent(cfg->clk_crypt_mux,
+				     cfg->clk_crypt_lp);
+		if (ret) {
+			dev_info(hba->dev,
+				 "failed to set clk_crypt_lp\n");
+			goto out;
+		}
+
+		ret = regulator_set_voltage(reg, 0, INT_MAX);
+		if (ret) {
+			dev_info(hba->dev,
+				 "failed to set vcore to MIN\n");
+		}
+	}
+out:
+	clk_disable_unprepare(cfg->clk_crypt_mux);
+
+	dev_info(hba->dev, "boost %d, %d\n", boost, ret);
+}
+
+static int ufs_mtk_init_host_clk(struct ufs_hba *hba, const char *name,
+				 struct clk **clk)
+{
+	int ret;
+
+	ret = ufs_mtk_get_host_clk(hba->dev, name, clk);
+	if (ret) {
+		dev_info(hba->dev, "%s: failed to get %s: %d", __func__,
+			 name, ret);
+	}
+
+	return ret;
+}
+
+static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	struct ufs_mtk_crypt_cfg *cfg;
+	struct device *dev = hba->dev;
+	struct regulator *reg;
+
+	host->caps = host->cfg->caps;
+
+	if (!ufs_mtk_is_boost_crypt_enabled(hba))
+		return;
+
+	host->crypt = devm_kzalloc(dev, sizeof(*(host->crypt)),
+				   GFP_KERNEL);
+	if (!host->crypt)
+		goto disable_caps;
+
+	reg = devm_regulator_get_optional(dev, "dvfsrc-vcore");
+	if (IS_ERR(reg)) {
+		dev_info(dev, "failed to get dvfsrc-vcore: %ld",
+			 PTR_ERR(reg));
+		goto disable_caps;
+	}
+
+	cfg = host->crypt;
+	if (ufs_mtk_init_host_clk(hba, "crypt_mux",
+				  &cfg->clk_crypt_mux))
+		goto disable_caps;
+
+	if (ufs_mtk_init_host_clk(hba, "crypt_lp",
+				  &cfg->clk_crypt_lp))
+		goto disable_caps;
+
+	if (ufs_mtk_init_host_clk(hba, "crypt_perf",
+				  &cfg->clk_crypt_perf))
+		goto disable_caps;
+
+	cfg->reg_vcore = reg;
+	cfg->vcore_volt = 600000;
+	dev_info(dev, "caps: boost-crypt");
+	return;
+
+disable_caps:
+	host->caps &= ~UFS_MTK_CAP_BOOST_CRYPT_ENGINE;
+}
+
 /**
  * ufs_mtk_setup_clocks - enables/disable clocks
  * @hba: host controller instance
@@ -336,12 +492,14 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 		}
 
 		if (clk_pwr_off) {
+			ufs_mtk_boost_crypt(hba, on);
 			ufs_mtk_setup_ref_clk(hba, on);
 			ufs_mtk_mphy_power_on(hba, on);
 		}
 	} else if (on && status == POST_CHANGE) {
 		ufs_mtk_mphy_power_on(hba, on);
 		ufs_mtk_setup_ref_clk(hba, on);
+		ufs_mtk_boost_crypt(hba, on);
 	}
 
 	return ret;
@@ -359,8 +517,9 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
  */
 static int ufs_mtk_init(struct ufs_hba *hba)
 {
-	struct ufs_mtk_host *host;
+	const struct of_device_id *id;
 	struct device *dev = hba->dev;
+	struct ufs_mtk_host *host;
 	int err = 0;
 
 	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
@@ -373,6 +532,18 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	host->hba = hba;
 	ufshcd_set_variant(hba, host);
 
+	/* Get host capability and platform data */
+	id = of_match_device(ufs_mtk_of_match, dev);
+	if (!id) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	if (id->data) {
+		host->cfg = (struct ufs_mtk_host_cfg *)id->data;
+		ufs_mtk_init_host_caps(hba);
+	}
+
 	err = ufs_mtk_bind_mphy(hba);
 	if (err)
 		goto out_variant_clear;
@@ -782,11 +953,6 @@ static int ufs_mtk_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id ufs_mtk_of_match[] = {
-	{ .compatible = "mediatek,mt8183-ufshci"},
-	{},
-};
-
 static const struct dev_pm_ops ufs_mtk_pm_ops = {
 	.suspend         = ufshcd_pltfrm_suspend,
 	.resume          = ufshcd_pltfrm_resume,
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 5c32d5f52759..2b6a1312c9bc 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -89,9 +89,31 @@ enum {
 	TX_CLK_GATE_EN          = 3,
 };
 
+/*
+ * Host capability
+ */
+enum ufs_mtk_host_caps {
+	UFS_MTK_CAP_BOOST_CRYPT_ENGINE         = 1 << 0,
+};
+
+struct ufs_mtk_crypt_cfg {
+	struct regulator *reg_vcore;
+	struct clk *clk_crypt_perf;
+	struct clk *clk_crypt_mux;
+	struct clk *clk_crypt_lp;
+	int vcore_volt;
+};
+
+struct ufs_mtk_host_cfg {
+	enum ufs_mtk_host_caps caps;
+};
+
 struct ufs_mtk_host {
 	struct ufs_hba *hba;
 	struct phy *mphy;
+	struct ufs_mtk_host_cfg *cfg;
+	struct ufs_mtk_crypt_cfg *crypt;
+	enum ufs_mtk_host_caps caps;
 	struct reset_control *hci_reset;
 	struct reset_control *unipro_reset;
 	struct reset_control *crypto_reset;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
