Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE88606A321
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d3Fkta0V;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ZvnOz2I9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qb9kh+8hlAedErexaPzWGDtdS+d+V+1oRI5FPimnSJM=; b=d3Fkta0V4rC/xB
	zugWYLGVz23eymmyYR/LCwwVMioTBDE4bIYFelal2akWH00HpYzykN1/mme1PuzHjEJoVZjueRpDa
	JjHm/iBIil2K/4WI6F2iNOsLSEpua5z87pBENi0xLGw/n6WvPSel0FNdr30TLnTkY/EbUPNjCX1qq
	zwFn4MWuYy48UU1iov03imPWYJt/9YMDSK8Y3a5Fv2e5yZGGfAHGUckKsNlrb29SuAvEsA5/4RPgJ
	QREXIJQlHt6BYfPyOaBAMYFVmWPIb3j3azX2G29USTe5poDZrGHIePBbDo1ExYj85MwpdiNuHPVnO
	CXafPAXBvFNTMvkthcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyO8-0000000GxiM-2LkF;
	Fri, 27 Nov 2026 16:01:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyNF-0000000Gwyv-2dHC;
	Fri, 27 Nov 2026 16:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795795231;
	bh=TCBTDxMXaAk+J1v6UIoO1MSw0rX7A/UyuFV1N02QVxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZvnOz2I9dPlzw1afeUL5PmMmdht4zYntY+pxKAr11wWTku9mOfIM/FuawXE/blg4H
	 Bz+ox9j692SZ2FVULPcLpxUs//r/OvhdOfr0QOmg2LoLS/g0uFFxosDuWep0bnfC2+
	 WEI4FBRvczLiz+d9qidFqYTF+ukxN3GXrNztw0FpSBRj5chDkv5Sx/z6s9vppB5nKM
	 ZYOYTsD0eh0Beux6ss/FNf3FD2sCGZODJaXc+y1FI3uzfEU8Um6VzMeLeZLoRUut+E
	 cUlqby/md+zm9v2WeZ7mlsRGCGKTzuLtxMCMGx/H3aQkOjruDlSlULpZVejCbgzV9f
	 PyvoHGI1HZ6SA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 80A3917E0887;
	Fri, 27 Nov 2026 17:00:30 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 27 Nov 2026 17:00:09 +0100
Subject: [PATCH v16 06/23] scsi: ufs: mediatek: Rework resets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-mt8196-ufs-v16-6-6f2568f7c119@collabora.com>
References: <20261127-mt8196-ufs-v16-0-6f2568f7c119@collabora.com>
In-Reply-To: <20261127-mt8196-ufs-v16-0-6f2568f7c119@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chun-Hung Wu <chun-hung.wu@mediatek.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795795222; l=6225;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=gpiOZs3dLgZadrCpg+gnKX7G4xxS0BCF7usszYsviJw=;
 b=ke/RWfxjFAattT4hLGIuqJ+nZPymafZaGcMIU1tNnsCfjsu3qOpoQERHl3RV3fpBNSq4rql05
 fI2XITUXcOvA8TyQhh39n4Qn6E5sQv8P1SvDfcdVQf/R2beOunQB9OC
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_080033_994233_67489222 
X-CRM114-Status: GOOD (  19.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Rework the reset control getting in the driver's probe function to use
the bulk reset APIs. Use the optional variant instead of defaulting to
NULL if the resets fail, so that absent resets can be distinguished from
erroneous resets.

Also remove all remnants of the MPHY reset ever having lived in this
driver.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek-sip.h |  8 ----
 drivers/ufs/host/ufs-mediatek.c     | 79 +++++++++++++++++++------------------
 drivers/ufs/host/ufs-mediatek.h     |  7 ++--
 3 files changed, 43 insertions(+), 51 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek-sip.h b/drivers/ufs/host/ufs-mediatek-sip.h
index d627dfb4a766..256598cc3b5b 100644
--- a/drivers/ufs/host/ufs-mediatek-sip.h
+++ b/drivers/ufs/host/ufs-mediatek-sip.h
@@ -31,11 +31,6 @@ enum ufs_mtk_vcc_num {
 	UFS_VCC_MAX
 };
 
-enum ufs_mtk_mphy_op {
-	UFS_MPHY_BACKUP = 0,
-	UFS_MPHY_RESTORE
-};
-
 /*
  * SMC call wrapper function
  */
@@ -84,9 +79,6 @@ static inline void _ufs_mtk_smc(struct ufs_mtk_smc_arg s)
 #define ufs_mtk_device_pwr_ctrl(on, ufs_version, res) \
 	ufs_mtk_smc(UFS_MTK_SIP_DEVICE_PWR_CTRL, &(res), on, ufs_version)
 
-#define ufs_mtk_mphy_ctrl(op, res) \
-	ufs_mtk_smc(UFS_MTK_SIP_MPHY_CTRL, &(res), op)
-
 #define ufs_mtk_mtcmos_ctrl(op, res) \
 	ufs_mtk_smc(UFS_MTK_SIP_MTCMOS_CTRL, &(res), op)
 
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 338a1ccd9de7..7a84d4d3451c 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -94,6 +94,12 @@ static const char *const ufs_uic_dl_err_str[] = {
 	"PA_INIT"
 };
 
+static const char *const ufs_reset_names[] = {
+	"hci",
+	"crypto",
+	"unipro",
+};
+
 static bool ufs_mtk_is_boost_crypt_enabled(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -204,49 +210,46 @@ static void ufs_mtk_crypto_enable(struct ufs_hba *hba)
 static void ufs_mtk_host_reset(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-	struct arm_smccc_res res;
-
-	reset_control_assert(host->hci_reset);
-	reset_control_assert(host->crypto_reset);
-	reset_control_assert(host->unipro_reset);
-	reset_control_assert(host->mphy_reset);
-
-	usleep_range(100, 110);
+	int ret;
 
-	reset_control_deassert(host->unipro_reset);
-	reset_control_deassert(host->crypto_reset);
-	reset_control_deassert(host->hci_reset);
-	reset_control_deassert(host->mphy_reset);
+	ret = reset_control_bulk_assert(MTK_UFS_NUM_RESETS, host->resets);
+	if (ret)
+		dev_warn(hba->dev, "Host reset assert failed: %pe\n", ERR_PTR(ret));
 
-	/* restore mphy setting aftre mphy reset */
-	if (host->mphy_reset)
-		ufs_mtk_mphy_ctrl(UFS_MPHY_RESTORE, res);
-}
+	ret = phy_reset(host->mphy);
 
-static void ufs_mtk_init_reset_control(struct ufs_hba *hba,
-				       struct reset_control **rc,
-				       char *str)
-{
-	*rc = devm_reset_control_get(hba->dev, str);
-	if (IS_ERR(*rc)) {
-		dev_info(hba->dev, "Failed to get reset control %s: %ld\n",
-			 str, PTR_ERR(*rc));
-		*rc = NULL;
+	/*
+	 * Only sleep if there is no MPHY or MPHY doesn't have a reset
+	 * implemented (which already sleeps) or the PHY reset function failed
+	 * somehow, just to be safe
+	 */
+	if (!host->mphy || ret) {
+		usleep_range(100, 110);
+		if (ret && (ret != -EOPNOTSUPP))
+			dev_warn(hba->dev, "PHY reset failed: %pe\n", ERR_PTR(ret));
 	}
+
+	ret = reset_control_bulk_deassert(MTK_UFS_NUM_RESETS, host->resets);
+	if (ret)
+		dev_warn(hba->dev, "Host reset deassert failed: %pe\n", ERR_PTR(ret));
 }
 
-static void ufs_mtk_init_reset(struct ufs_hba *hba)
+static int ufs_mtk_init_reset(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	int ret, i;
+
+	for (i = 0; i < MTK_UFS_NUM_RESETS; i++)
+		host->resets[i].id = ufs_reset_names[i];
 
-	ufs_mtk_init_reset_control(hba, &host->hci_reset,
-				   "hci_rst");
-	ufs_mtk_init_reset_control(hba, &host->unipro_reset,
-				   "unipro_rst");
-	ufs_mtk_init_reset_control(hba, &host->crypto_reset,
-				   "crypto_rst");
-	ufs_mtk_init_reset_control(hba, &host->mphy_reset,
-				   "mphy_rst");
+	ret = devm_reset_control_bulk_get_optional_exclusive(hba->dev, MTK_UFS_NUM_RESETS,
+							     host->resets);
+	if (ret) {
+		dev_err(hba->dev, "Failed to get resets: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+
+	return 0;
 }
 
 static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
@@ -1269,11 +1272,9 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	if (err)
 		goto out_variant_clear;
 
-	ufs_mtk_init_reset(hba);
-
-	/* backup mphy setting if mphy can reset */
-	if (host->mphy_reset)
-		ufs_mtk_mphy_ctrl(UFS_MPHY_BACKUP, res);
+	err = ufs_mtk_init_reset(hba);
+	if (err)
+		goto out_variant_clear;
 
 	/* Enable runtime autosuspend */
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 73cdc726f290..f95f12eb9926 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -7,12 +7,14 @@
 #define _UFS_MEDIATEK_H
 
 #include <linux/bitops.h>
+#include <linux/reset.h>
 
 /*
  * MCQ define and struct
  */
 #define UFSHCD_MAX_Q_NR 8
 #define MTK_MCQ_INVALID_IRQ	0xFFFF
+#define MTK_UFS_NUM_RESETS 3
 
 /* REG_UFS_MMIO_OPT_CTRL_0 160h */
 #define EHS_EN                  BIT(0)
@@ -175,10 +177,7 @@ struct ufs_mtk_mcq_intr_info {
 struct ufs_mtk_host {
 	struct phy *mphy;
 	struct regulator *reg_va09;
-	struct reset_control *hci_reset;
-	struct reset_control *unipro_reset;
-	struct reset_control *crypto_reset;
-	struct reset_control *mphy_reset;
+	struct reset_control_bulk_data resets[MTK_UFS_NUM_RESETS];
 	struct ufs_hba *hba;
 	struct ufs_mtk_crypt_cfg *crypt;
 	struct ufs_mtk_clk mclk;

-- 
2.56.1


