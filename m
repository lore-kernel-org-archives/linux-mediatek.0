Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB3F606A691
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xyFE4l+j;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nlOYuejX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gL9XtGiL8UqOi3giPFiUoUPRKJcNDH0bSiP7V6ata2Y=; b=xyFE4l+jQYQ7ay
	o2mC3udF2s2DptsGw9DSSYrcA8Cde4vOCry+nHxyOCygHIfAywijggBg+hTLdLlZ8bk6xGRqRXNZe
	pRJLPDSoyT+kc5C1f0tZeht0Lu2Uc9FNiqMyEb+IW+SObBykq/+ukckjWZtLFkSK441Hl98c900Ey
	U/GpoV5oojkhnDi0XGhMSEPGAJajXxSYP0k1QEi49I+K37yhW6rcyCKqbnIG+Qc3eisEyYrZG4yTz
	Tz2O+iYljDkmJOaCLOhK0UpqtVFfXSEQ5NoqZLLxSjOSCcj5T/FZtb+wmXjUXam3mFZTefp4tIGPu
	Yjbg1DlGNZnWya0fkeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyOs-0000000Gxyl-49o8;
	Fri, 27 Nov 2026 16:02:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyNI-0000000Gx0u-1l2d;
	Fri, 27 Nov 2026 16:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795795234;
	bh=AX1MgNrkXV30HYICTDlMeZVstNOhcDo3d9TqapqCFog=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nlOYuejXdhuM8i+SIlM5gUKcKLB7GJ+maSNtM6ssr0aJ8nXHIKfoN4OgBvsvl5E9P
	 s7qU+7Zy53A81dI4ygI0kzdaAMx8cqhAwx/uQSET48tOs5TUjJQy0Xe5WyvzIijgj9
	 Hdt8QvWwMmxe9uGd9mxrgkCiP1Ek8K0PDK/EoqH1sHoxNCGyDjF6UTfC0Xnq7CImcU
	 HHIO6IlbxCi2tz+z3iO5HNdCJ57iNxg8+qNucs7axGPoiUelkpOnKve9HMYmr2TSS4
	 3xPs4uEgKzvpSw9PpEhseOLPm8TqPqHf4cdh4QKIL+afmIPBPc+62eaa1UYQXj+3Xi
	 WKBvEKLwGrCWQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4457217E090C;
	Fri, 27 Nov 2026 17:00:33 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 27 Nov 2026 17:00:11 +0100
Subject: [PATCH v16 08/23] scsi: ufs: mediatek: Add dual 0.9V supply
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-mt8196-ufs-v16-8-6f2568f7c119@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795795222; l=5211;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=AX1MgNrkXV30HYICTDlMeZVstNOhcDo3d9TqapqCFog=;
 b=fKUV6HxJYp6HEm6xxnS/DNNQwBVRDs4jLtdtDVv4CachY+ycuf7cNEPEND7DRjmzHoilNvIVu
 eBOqBkyxlG7B5SWEnAnpYmA38XWdMo09tPsiHLUKKiWUcRict8dI7hG
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_080036_637326_F5ACD88C 
X-CRM114-Status: GOOD (  17.61  )
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

The MT8196 SoC has an additional pin in comparison of the MT8183 SoC,
that is used to feed the host controller with a 0.9V supply.

In preparation of this SoC support, add in platform data and
driver the management a second optional 0.9V regulator named
"avdd09-1".

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 99 +++++++++++++++++++++++++++++++----------
 drivers/ufs/host/ufs-mediatek.h |  1 +
 2 files changed, 76 insertions(+), 24 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index e1fb3c442236..3ebc169b6878 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -41,6 +41,7 @@ static void _ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up);
 
 struct ufs_mtk_soc_data {
 	bool has_avdd09;
+	bool has_avdd09_1;
 };
 
 static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
@@ -513,20 +514,43 @@ static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
 static int ufs_mtk_09v_off(struct ufs_mtk_host *host, bool allow_pwr_on)
 {
 	struct arm_smccc_res res;
-	int ret;
+	int ret, ret2;
 
-	if (!host->reg_avdd09)
+	if (!host->reg_avdd09 && !host->reg_avdd09_1)
 		return 0;
 
 	ufs_mtk_va09_pwr_ctrl(res, 0);
-	ret = regulator_disable(host->reg_avdd09);
-	if (ret) {
-		dev_err(host->hba->dev, "Failed to disable avdd09-supply: %pe\n",
-			ERR_PTR(ret));
-		if (allow_pwr_on)
-			ufs_mtk_va09_pwr_ctrl(res, 1);
 
-		return ret;
+	if (host->reg_avdd09) {
+		ret = regulator_disable(host->reg_avdd09);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to disable avdd09-supply: %pe\n",
+				ERR_PTR(ret));
+			if (allow_pwr_on)
+				ufs_mtk_va09_pwr_ctrl(res, 1);
+
+			return ret;
+		}
+	}
+
+	if (host->reg_avdd09_1) {
+		ret = regulator_disable(host->reg_avdd09_1);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to disable avdd09-1-supply: %pe\n",
+				ERR_PTR(ret));
+
+			if (allow_pwr_on) {
+				if (host->reg_avdd09) {
+					ret2 = regulator_enable(host->reg_avdd09);
+					if (ret2)
+						dev_err(host->hba->dev,
+							"Failed to re-enable avdd09-supply: %pe\n",
+							ERR_PTR(ret2));
+				}
+				ufs_mtk_va09_pwr_ctrl(res, 1);
+			}
+			return ret;
+		}
 	}
 
 	return 0;
@@ -537,14 +561,28 @@ static int ufs_mtk_09v_on(struct ufs_mtk_host *host)
 	struct arm_smccc_res res;
 	int ret;
 
-	if (!host->reg_avdd09)
+	if (!host->reg_avdd09 && !host->reg_avdd09_1)
 		return 0;
 
-	ret = regulator_enable(host->reg_avdd09);
-	if (ret) {
-		dev_err(host->hba->dev, "Failed to enable avdd09-supply: %pe\n",
-			ERR_PTR(ret));
-		return ret;
+	if (host->reg_avdd09) {
+		ret = regulator_enable(host->reg_avdd09);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to enable avdd09-supply: %pe\n",
+				ERR_PTR(ret));
+			return ret;
+		}
+	}
+
+	if (host->reg_avdd09_1) {
+		ret = regulator_enable(host->reg_avdd09_1);
+		if (ret) {
+			dev_err(host->hba->dev, "Failed to enable avdd09-1-supply: %pe\n",
+				ERR_PTR(ret));
+			if (host->reg_avdd09)
+				regulator_disable(host->reg_avdd09);
+
+			return ret;
+		}
 	}
 
 	ufs_mtk_va09_pwr_ctrl(res, 1);
@@ -1246,20 +1284,33 @@ static int ufs_mtk_get_supplies(struct ufs_mtk_host *host)
 	struct device *dev = host->hba->dev;
 	const struct ufs_mtk_soc_data *data = of_device_get_match_data(dev);
 
-	if (!data || !data->has_avdd09)
+	if (!data)
 		return 0;
 
-	host->reg_avdd09 = devm_regulator_get_optional(dev, "avdd09");
-	if (IS_ERR(host->reg_avdd09)) {
-		if (PTR_ERR(host->reg_avdd09) == -ENODEV) {
+	if (data->has_avdd09) {
+		host->reg_avdd09 = devm_regulator_get_optional(dev, "avdd09");
+		if (IS_ERR(host->reg_avdd09)) {
+			if (PTR_ERR(host->reg_avdd09) != -ENODEV) {
+				return dev_err_probe(dev,
+						     PTR_ERR(host->reg_avdd09),
+						     "Failed to get avdd09 regulator: %pe\n",
+						     host->reg_avdd09);
+			}
 			host->reg_avdd09 = NULL;
-			return 0;
 		}
+	}
 
-		return dev_err_probe(dev,
-				     PTR_ERR(host->reg_avdd09),
-				     "Failed to get avdd09 regulator: %pe\n",
-				     host->reg_avdd09);
+	if (data->has_avdd09_1) {
+		host->reg_avdd09_1 = devm_regulator_get_optional(dev, "avdd09-1");
+		if (IS_ERR(host->reg_avdd09_1)) {
+			if (PTR_ERR(host->reg_avdd09_1) != -ENODEV) {
+				return dev_err_probe(dev,
+						     PTR_ERR(host->reg_avdd09_1),
+						     "Failed to get avdd09-1 regulator: %pe\n",
+						     host->reg_avdd09_1);
+			}
+			host->reg_avdd09_1 = NULL;
+		}
 	}
 
 	return 0;
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index c63740b98e85..477fb9e36555 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -176,6 +176,7 @@ struct ufs_mtk_mcq_intr_info {
 struct ufs_mtk_host {
 	struct phy *mphy;
 	struct regulator *reg_avdd09;
+	struct regulator *reg_avdd09_1;
 	struct reset_control_bulk_data resets[MTK_UFS_NUM_RESETS];
 	struct ufs_hba *hba;
 	struct ufs_mtk_crypt_cfg *crypt;

-- 
2.56.1


