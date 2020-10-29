Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4506C55178
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:59:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C179207BC
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 11:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MJenFI4v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FAKT7Ewg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C179207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=33QaXvl2hsLRxBDOkGN+sXEKQI5n+fpsnRTZNrZxMco=; b=MJenFI4vCR8Y9Pq0zXOOoL0u3
	2I8jKNV/50uaXNZaTC5utgxe4poNwxe2YWvHlQvQzbBC8IcMez82IpAlkTk9jejbykAU1smmVWlJI
	Kk6KfNU7TYgOzjCcdjki/TJZBiXgRe6RN+EN5TBk6UmAx9ys26CfWHDxrd68M9+g7Ns7WieQZpKLL
	zXmw+alB+724aisWsXTU+Mt1nZfZXguOWQOAETB67ichkV63qQ3vA+1CIVKgLhwP83gyxcGXg/t95
	/S02sZQlD+ulIhuTgU/DiXsI1yLGBgShlHFm0/hZC77nSUwywignHlzxk+Q+oHu0yfZjpvisgF8wg
	EV4cIv3HQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY6a5-0005t0-Ai; Thu, 29 Oct 2020 11:59:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY6ZI-0005bt-Sc; Thu, 29 Oct 2020 11:58:15 +0000
X-UUID: 65dbebb777c84110ab04a6b3ffe9914e-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HeeKNn+hQW8XODZCU/LTYqxhkckI4DcNy1WSOsuzDMM=; 
 b=FAKT7EwgbAkGTJCryVs3RDLog4qfxNTD+Opdp3z2BmO2ZI3cnk9/DR9/DqAB4iKbtaIMNkwNA6a8rioWEC+tff2HjK2XjcLLnseh0m5XB4hUaP70fQvEPfYjIVl19cL98oOsdapmAh7zfWsG99CA+upeHTgetQXkCVRbzjlbJfY=;
X-UUID: 65dbebb777c84110ab04a6b3ffe9914e-20201029
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1964829015; Thu, 29 Oct 2020 03:58:02 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 04:58:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 19:57:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Oct 2020 19:57:50 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 3/6] scsi: ufs-mediatek: Decouple features from platform
 bindings
Date: Thu, 29 Oct 2020 19:57:47 +0800
Message-ID: <20201029115750.24391-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201029115750.24391-1-stanley.chu@mediatek.com>
References: <20201029115750.24391-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4B0DD959D98AD8440F99078E8B624C59E8A59EA804EB313BF528C24E31A296DF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_075813_141385_B7548CE3 
X-CRM114-Status: GOOD (  17.25  )
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

UFS proprietary features (including features introduced later) in
MediaTek UFS platforms have complicated combinations among different
platforms.

To ease code readability and maintenance, decouple all proprietary
features from platform bindings. Each feature would be enabled only
if specific property string is defined in device tree node.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 49 ++++++++++-----------------------
 drivers/scsi/ufs/ufs-mediatek.h | 11 ++------
 2 files changed, 18 insertions(+), 42 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 795fc2961f77..fa7d0e4eeb0d 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -48,23 +48,8 @@ static struct ufs_dev_fix ufs_mtk_dev_fixups[] = {
 	END_FIX
 };
 
-static const struct ufs_mtk_host_cfg ufs_mtk_mt8183_cfg = {
-	.caps = UFS_MTK_CAP_VA09_PWR_CTRL,
-};
-
-static const struct ufs_mtk_host_cfg ufs_mtk_mt8192_cfg = {
-	.caps = UFS_MTK_CAP_BOOST_CRYPT_ENGINE,
-};
-
 static const struct of_device_id ufs_mtk_of_match[] = {
-	{
-		.compatible = "mediatek,mt8183-ufshci",
-		.data = &ufs_mtk_mt8183_cfg
-	},
-	{
-		.compatible = "mediatek,mt8192-ufshci",
-		.data = &ufs_mtk_mt8192_cfg
-	},
+	{ .compatible = "mediatek,mt8183-ufshci" },
 	{},
 };
 
@@ -72,14 +57,14 @@ static bool ufs_mtk_is_boost_crypt_enabled(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return (host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
+	return !!(host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
 }
 
 static bool ufs_mtk_is_va09_supported(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	return (host->caps & UFS_MTK_CAP_VA09_PWR_CTRL);
+	return !!(host->caps & UFS_MTK_CAP_VA09_PWR_CTRL);
 }
 
 static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
@@ -326,7 +311,7 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 		return 0;
 
 	if (on) {
-		if (host->reg_va09) {
+		if (ufs_mtk_is_va09_supported(hba)) {
 			ret = regulator_enable(host->reg_va09);
 			if (ret < 0)
 				goto out;
@@ -337,7 +322,7 @@ static int ufs_mtk_mphy_power_on(struct ufs_hba *hba, bool on)
 		phy_power_on(mphy);
 	} else {
 		phy_power_off(mphy);
-		if (host->reg_va09) {
+		if (ufs_mtk_is_va09_supported(hba)) {
 			ufs_mtk_va09_pwr_ctrl(res, 0);
 			ret = regulator_disable(host->reg_va09);
 			if (ret < 0)
@@ -483,10 +468,10 @@ static void ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
 
 	cfg->reg_vcore = reg;
 	cfg->vcore_volt = volt;
-	return;
+	host->caps |= UFS_MTK_CAP_BOOST_CRYPT_ENGINE;
 
 disable_caps:
-	host->caps &= ~UFS_MTK_CAP_BOOST_CRYPT_ENGINE;
+	return;
 }
 
 static void ufs_mtk_init_va09_pwr_ctrl(struct ufs_hba *hba)
@@ -494,22 +479,21 @@ static void ufs_mtk_init_va09_pwr_ctrl(struct ufs_hba *hba)
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	host->reg_va09 = regulator_get(hba->dev, "va09");
-	if (!host->reg_va09) {
+	if (!host->reg_va09)
 		dev_info(hba->dev, "failed to get va09");
-		host->caps &= ~UFS_MTK_CAP_VA09_PWR_CTRL;
-	}
+	else
+		host->caps |= UFS_MTK_CAP_VA09_PWR_CTRL;
 }
 
 static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	struct device_node *np = hba->dev->of_node;
 
-	host->caps = host->cfg->caps;
-
-	if (ufs_mtk_is_boost_crypt_enabled(hba))
+	if (of_property_read_bool(np, "mediatek,ufs-boost-crypt"))
 		ufs_mtk_init_boost_crypt(hba);
 
-	if (ufs_mtk_is_va09_supported(hba))
+	if (of_property_read_bool(np, "mediatek,ufs-support-va09"))
 		ufs_mtk_init_va09_pwr_ctrl(hba);
 
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
@@ -597,17 +581,14 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	host->hba = hba;
 	ufshcd_set_variant(hba, host);
 
-	/* Get host capability and platform data */
 	id = of_match_device(ufs_mtk_of_match, dev);
 	if (!id) {
 		err = -EINVAL;
 		goto out;
 	}
 
-	if (id->data) {
-		host->cfg = (struct ufs_mtk_host_cfg *)id->data;
-		ufs_mtk_init_host_caps(hba);
-	}
+	/* Initialize host capability */
+	ufs_mtk_init_host_caps(hba);
 
 	err = ufs_mtk_bind_mphy(hba);
 	if (err)
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index f668241d37f8..0e76429f69d6 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -106,20 +106,15 @@ struct ufs_mtk_crypt_cfg {
 	int vcore_volt;
 };
 
-struct ufs_mtk_host_cfg {
-	enum ufs_mtk_host_caps caps;
-};
-
 struct ufs_mtk_host {
-	struct ufs_hba *hba;
 	struct phy *mphy;
-	struct ufs_mtk_host_cfg *cfg;
-	struct ufs_mtk_crypt_cfg *crypt;
 	struct regulator *reg_va09;
-	enum ufs_mtk_host_caps caps;
 	struct reset_control *hci_reset;
 	struct reset_control *unipro_reset;
 	struct reset_control *crypto_reset;
+	struct ufs_hba *hba;
+	struct ufs_mtk_crypt_cfg *crypt;
+	enum ufs_mtk_host_caps caps;
 	bool mphy_powered_on;
 	bool unipro_lpm;
 	bool ref_clk_enabled;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
