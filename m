Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB68606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G7GENunO;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VedXyzOn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=coLUNGKcs5QZu+CEy6r1bdnwCNGnhuOWAdgkv/APfOo=; b=G7GENunOSnQ6Wf
	dhHkTtqGwykHB1vo7vt2qMX1CbrP1PrvZn/anDFr4mksMLXehl1COUqO2XueNtamWl1pgdDmzrqKh
	4gSLRAZ+JhvdevLO8o66RjQnU21PCBWCsGStrWtHDDTTEi+8FTtN5gwvqzsf/Kfia8H/XFtiWos1Z
	GinpXejk2pF0H7+5lJHML8+OpCFLmkiHK8C96fwQ0Q3Rkb0T3Lk5sHEMBVq4EdM6vkBNSYL7wBM3U
	8Yg1DSqHUkjhcK/UX9lmEGJBp6NEyO8QaERls1yezMOhHpeRy6T7BT3nQnzqr4PeEKkE7ebwU1jZW
	/fMajw5UtTEKPkqD4tMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyPq-0000000GylA-25kU;
	Fri, 27 Nov 2026 16:03:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyNQ-0000000Gx5l-2TBq;
	Fri, 27 Nov 2026 16:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795795242;
	bh=RXK2LxxN390Quj52vGREAFDzN8dihSsEQh6iBN4tr/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VedXyzOnUu+sc2PGt2ebUJ7Y+sQglpaO6g26deeuEN/VUctTlMBDAObR+ir+d/9/C
	 6sXOGcy59OBhAEUN/69JEbwf7II6kYCiphCKRYguKWXMGWx0s0UWCSZ+IyjldE6dnX
	 XlUSaf1BlLlKckXRypAG4l9JPwLPCCyKV3SqEdxEy0BPmJ4PUA5Ox4A6ZVsPQnqhce
	 wiBO26VqRN72d1zeq1MbBgppQrgTIK4nXrUU5wJcKssTSjorGUChDwNRaq83Eg+sjj
	 YxALgsX27IYMGElkigUzgiX7DRxnLaFznUOq72ksGUMOt5jRdx5GvuRWeNspLznhnJ
	 P43EGfhI43lNQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75E5D17E0CF4;
	Fri, 27 Nov 2026 17:00:41 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 27 Nov 2026 17:00:17 +0100
Subject: [PATCH v16 14/23] scsi: ufs: mediatek: Use the common PHY
 framework
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-mt8196-ufs-v16-14-6f2568f7c119@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795795222; l=7120;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=CV3CIBHtDEi7kAWo0AI8sSc9Ba1rqwMc3ZaCBO0bKq4=;
 b=YZV7Gd1Bj65uZGoh5AY1Qvu6OUjcdQQTZbGGawfaSpcbt55TxX1AA8SfnxfI9Q4oHtH2on4MK
 bVOqKzi2XhlAaAQk2AmOrhzjCs+t/30TaOO88zYcBKEgPZWlJHSPnTq
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_080044_825065_6DEDF31A 
X-CRM114-Status: GOOD (  23.78  )
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

There is no need to reinvent the PHY framework, especially not its OF
parsing.

Change the code to simply use the PHY framework to acquire the device's
PHY in the ufshcd init, so that it's device linked to the right device.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 129 ++++++++++------------------------------
 drivers/ufs/host/ufs-mediatek.h |   1 -
 2 files changed, 31 insertions(+), 99 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 33ed5e6dabfe..9d7e4bc96203 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -296,44 +296,6 @@ static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 	return 0;
 }
 
-static int ufs_mtk_bind_mphy(struct ufs_hba *hba)
-{
-	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-	struct device *dev = hba->dev;
-	struct device_node *np = dev->of_node;
-	int err = 0;
-
-	host->mphy = devm_of_phy_get_by_index(dev, np, 0);
-
-	if (host->mphy == ERR_PTR(-EPROBE_DEFER)) {
-		/*
-		 * UFS driver might be probed before the phy driver does.
-		 * In that case we would like to return EPROBE_DEFER code.
-		 */
-		err = -EPROBE_DEFER;
-		dev_info(dev,
-			 "%s: required phy hasn't probed yet. err = %d\n",
-			__func__, err);
-	} else if (IS_ERR(host->mphy)) {
-		err = PTR_ERR(host->mphy);
-		if (err != -ENODEV) {
-			dev_info(dev, "%s: PHY get failed %d\n", __func__,
-				 err);
-		}
-	}
-
-	if (err)
-		host->mphy = NULL;
-	/*
-	 * Allow unbound mphy because not every platform needs specific
-	 * mphy control.
-	 */
-	if (err == -ENODEV)
-		err = 0;
-
-	return err;
-}
-
 static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -1255,13 +1217,21 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	ufs_mtk_init_mcq_irq(hba);
 
-	err = ufs_mtk_bind_mphy(hba);
-	if (err)
+	host->mphy = devm_phy_optional_get(dev, NULL);
+	if (IS_ERR(host->mphy)) {
+		err = dev_err_probe(dev, PTR_ERR(host->mphy), "Failed to get PHY\n");
+		goto out_variant_clear;
+	}
+
+	err = phy_init(host->mphy);
+	if (err) {
+		dev_err_probe(dev, err, "Failed to initialize PHY\n");
 		goto out_variant_clear;
+	}
 
 	err = ufs_mtk_init_reset(hba);
 	if (err)
-		goto out_variant_clear;
+		goto out_phy_exit;
 
 	/* Enable runtime autosuspend */
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
@@ -1300,7 +1270,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	err = ufs_mtk_get_supplies(host);
 	if (err)
-		goto out_variant_clear;
+		goto out_phy_exit;
 
 	/*
 	 * ufshcd_vops_init() is invoked after
@@ -1311,7 +1281,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	 */
 	err = ufs_mtk_mphy_power_on(hba, true);
 	if (err)
-		goto out_variant_clear;
+		goto out_phy_exit;
 
 	if (ufs_mtk_is_rtff_mtcmos(hba)) {
 		/* First Restore here, to avoid backup unexpected value */
@@ -1327,6 +1297,8 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	return 0;
 
+out_phy_exit:
+	phy_exit(host->mphy);
 out_variant_clear:
 	ufshcd_set_variant(hba, NULL);
 	return err;
@@ -1336,8 +1308,15 @@ static void ufs_mtk_exit(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	if (host)
-		ufs_mtk_mphy_power_on(hba, false);
+	if (!host)
+		return;
+
+	ufs_mtk_mphy_power_on(hba, false);
+
+	phy_exit(host->mphy);
+
+	/* Set MPHY to null so it is not used anymore */
+	host->mphy = NULL;
 }
 
 static int ufs_mtk_negotiate_pwr_mode(struct ufs_hba *hba,
@@ -2420,48 +2399,15 @@ MODULE_DEVICE_TABLE(of, ufs_mtk_of_match);
  */
 static int ufs_mtk_probe(struct platform_device *pdev)
 {
-	int err;
+	struct device *dev = &pdev->dev;
 	struct ufs_hba *hba;
-	struct platform_device *phy_pdev = NULL;
-	struct device *dev = &pdev->dev, *phy_dev = NULL;
-	struct device_node *phy_node = NULL;
-	struct ufs_mtk_host *host;
-
-	/* find phy node */
-	phy_node = of_parse_phandle(dev->of_node, "phys", 0);
-
-	if (phy_node) {
-		phy_pdev = of_find_device_by_node(phy_node);
-		if (!phy_pdev)
-			goto skip_phy;
-		phy_dev = &phy_pdev->dev;
-
-		pm_runtime_set_active(phy_dev);
-		pm_runtime_enable(phy_dev);
-		pm_runtime_get_sync(phy_dev);
-
-		put_device(phy_dev);
-		dev_info(dev, "phys node found\n");
-	} else {
-		dev_notice(dev, "phys node not found\n");
-	}
+	int ret;
 
-skip_phy:
-	/* perform generic probe */
-	err = ufshcd_pltfrm_init(pdev, &ufs_hba_mtk_vops);
-	if (err) {
-		dev_err(dev, "probe failed %d\n", err);
-		goto out;
-	}
+	ret = ufshcd_pltfrm_init(pdev, &ufs_hba_mtk_vops);
+	if (ret)
+		return dev_err_probe(dev, ret, "Generic platform probe failed\n");
 
 	hba = platform_get_drvdata(pdev);
-	if (!hba)
-		goto out;
-
-	if (phy_node && phy_dev) {
-		host = ufshcd_get_variant(hba);
-		host->phy_dev = phy_dev;
-	}
 
 	/*
 	 * Because the default power setting of VSx (the upper layer of
@@ -2470,16 +2416,12 @@ static int ufs_mtk_probe(struct platform_device *pdev)
 	 */
 	ufs_mtk_dev_vreg_set_lpm(hba, false);
 
-out:
-	of_node_put(phy_node);
-	return err;
+	return 0;
 }
 
 /**
  * ufs_mtk_remove - set driver_data of the device to NULL
  * @pdev: pointer to platform device handle
- *
- * Always return 0
  */
 static void ufs_mtk_remove(struct platform_device *pdev)
 {
@@ -2536,9 +2478,8 @@ static int ufs_mtk_system_resume(struct device *dev)
 static int ufs_mtk_runtime_suspend(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
-	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct arm_smccc_res res;
-	int ret = 0;
+	int ret;
 
 	ret = ufshcd_runtime_suspend(dev);
 	if (ret)
@@ -2548,25 +2489,17 @@ static int ufs_mtk_runtime_suspend(struct device *dev)
 
 	if (ufs_mtk_is_rtff_mtcmos(hba))
 		ufs_mtk_mtcmos_ctrl(false, res);
-
-	if (host->phy_dev)
-		pm_runtime_put_sync(host->phy_dev);
-
 	return 0;
 }
 
 static int ufs_mtk_runtime_resume(struct device *dev)
 {
 	struct ufs_hba *hba = dev_get_drvdata(dev);
-	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct arm_smccc_res res;
 
 	if (ufs_mtk_is_rtff_mtcmos(hba))
 		ufs_mtk_mtcmos_ctrl(true, res);
 
-	if (host->phy_dev)
-		pm_runtime_get_sync(host->phy_dev);
-
 	ufs_mtk_dev_vreg_set_lpm(hba, false);
 
 	return ufshcd_runtime_resume(dev);
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 477fb9e36555..bde2b53f5798 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -196,7 +196,6 @@ struct ufs_mtk_host {
 	bool is_mcq_intr_enabled;
 	int mcq_nr_intr;
 	struct ufs_mtk_mcq_intr_info mcq_intr_info[UFSHCD_MAX_Q_NR];
-	struct device *phy_dev;
 };
 
 /* MTK delay of autosuspend: 500 ms */

-- 
2.56.1


