Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4EBC00A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbDNE8CaIR5oPHXo8vPk6k44+EGdNnuv3F3hxI5LgU4=; b=Rqt9+AjDzdc/peXRxJ1AFfYstM
	pG4d85O7sGWKXGmJ+es77KVPGT5/SIX0ww/kA/gCjVfXNFrDWPSRUdmcBPxkqr15ZxJd14seWZ68O
	BXz6LXxdpmTOWxdWg/japM3BJXvjjFuucWpMftcsmUzoPrE9ZJwKWeI3do8O/YWvYtlGiGm6o8/Km
	1ilDVex4kFZOuh/doALnX9sS2ER08hwft6U2s5YvXUhzCxcdh8E5phWCHrvBjKVCaD8i5nNRXqYZ8
	2J3FEwnpbbUzQVfBZVDOScT6yUwKdzWAvejobfU6gImLMEoAzcdD15cA+PL3WXsDA1NE1iTeDrBbg
	Au497iLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwK4c-00000007xNY-3Q5q;
	Mon, 15 Apr 2024 11:00:30 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwK4Q-00000007xHF-2ZwM;
	Mon, 15 Apr 2024 11:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713178817;
	bh=GYrCUPwSvlfdLE3J9cAWMICwrZAfevrC39qq1M3MwBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eq/oqtzsKhzm/e3vxtVhS55RESGLn+Ddl8y80dqEKsuG6pKTbx5+aJJPrTlmF26AD
	 rsZFw3fWFe0MXm2fcEejmYUWIoaxf3+5o2Rs76lsXtITNRyk3/W6WbDxPK+GHvfJjd
	 nZAx1wB9aDhyTnuuce58GgljfpmcRzwSLvmCFdkI/U1TTxpm9vtwk3P/fjCbVTyyZb
	 gkaPIcIOzbfg1qxbldztxpRxQrYrtkc5WGmOkUKmHgWPAtcseZb5EvbEgNc8CRSqUl
	 w2z7UHohRBjtxrAtrkqLraFrIQ73J96o67/AzRHp4mnRgXmTrK4n8hHLeeQSsL/B0x
	 MwfJvGiyunFng==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 158803781107;
	Mon, 15 Apr 2024 11:00:16 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/8] scsi: ufs: ufs-mediatek: Remove useless mediatek,ufs-support-va09 property
Date: Mon, 15 Apr 2024 13:00:05 +0200
Message-ID: <20240415110012.148871-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
References: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_040018_808755_7B2E5EE5 
X-CRM114-Status: GOOD (  16.90  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove checking the mediatek,ufs-support-va09 property to decide
whether to try to support the VA09 regulator handling and change
the ufs_mtk_init_va09_pwr_ctrl() function to make it call
devm_regulator_get_optional(): if the regulator is present, then
we set the UFS_MTK_CAP_VA09_PWR_CTRL, effectively enabling the
handling of the VA09 regulator based on that.

Also, make sure to pass the return value of the call to
devm_regulator_get_optional() to the probe function, so that
if it returns a probe deferral, the appropriate action will be
taken.

While at it, remove the error print (disguised as info...) when
the va09 regulator was not found.

Fixes: ac8c2459091c ("scsi: ufs-mediatek: Decouple features from platform bindings")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 34 +++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 0b0c923b1d7b..e4643ac49033 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -622,27 +622,38 @@ static void ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
 	return;
 }
 
-static void ufs_mtk_init_va09_pwr_ctrl(struct ufs_hba *hba)
+static int ufs_mtk_init_va09_pwr_ctrl(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	int ret;
 
-	host->reg_va09 = regulator_get(hba->dev, "va09");
-	if (IS_ERR(host->reg_va09))
-		dev_info(hba->dev, "failed to get va09");
-	else
-		host->caps |= UFS_MTK_CAP_VA09_PWR_CTRL;
+	host->reg_va09 = devm_regulator_get_optional(hba->dev, "va09");
+	if (IS_ERR(host->reg_va09)) {
+		ret = PTR_ERR(host->reg_va09);
+
+		/* Return an error only if this is a deferral */
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		return 0;
+	}
+
+	host->caps |= UFS_MTK_CAP_VA09_PWR_CTRL;
+	return 0;
 }
 
-static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
+static int ufs_mtk_init_host_caps(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 	struct device_node *np = hba->dev->of_node;
+	int ret;
 
 	if (of_property_read_bool(np, "mediatek,ufs-boost-crypt"))
 		ufs_mtk_init_boost_crypt(hba);
 
-	if (of_property_read_bool(np, "mediatek,ufs-support-va09"))
-		ufs_mtk_init_va09_pwr_ctrl(hba);
+	ret = ufs_mtk_init_va09_pwr_ctrl(hba);
+	if (ret)
+		return ret;
 
 	if (of_property_read_bool(np, "mediatek,ufs-disable-ah8"))
 		host->caps |= UFS_MTK_CAP_DISABLE_AH8;
@@ -663,6 +674,7 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 		host->caps |= UFS_MTK_CAP_RTFF_MTCMOS;
 
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
+	return 0;
 }
 
 static void ufs_mtk_scale_perf(struct ufs_hba *hba, bool scale_up)
@@ -985,7 +997,9 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	}
 
 	/* Initialize host capability */
-	ufs_mtk_init_host_caps(hba);
+	err = ufs_mtk_init_host_caps(hba);
+	if (err)
+		goto out;
 
 	ufs_mtk_init_mcq_irq(hba);
 
-- 
2.44.0


