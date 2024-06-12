Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370D2C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rgvK6tvAwEac4inpFacUSnKukUEOa7RqQhbKlC0FOA=; b=HjufSKG8opTzMMVZPnGq+/ObUa
	Z0SVB3ilAvAA//wvJ0HUomV9+7WIOefbMx+lnc8pA34WTBJoSl2BToSN1j2wCt3nz5I8U3r3dX1a5
	IhG7ZzVY9lG3lBmm97umGglhf1RJz2q9aOrJOO3eljb1iOq8N9XWmC/26NOQ6AHCX3YAgTngii7m0
	QDjh6dnfTGF397GFNICnkEO0oi92xuO05XhXoFzDy5A5Gb1JW0Z4bOyZxcpk1X+I0S3pDmAkZ2Eiw
	F/mtyON/F9y4Ij0MhoKZLD9CCv75mZLfGrIVPWP/+x0Ty8eFrFIDYAIIdj4j+ct5+BYyIv33UrACy
	vVty+SBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIdn-0000000BU6j-3T3O;
	Wed, 12 Jun 2024 07:43:31 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIdg-0000000BU0o-3W3W;
	Wed, 12 Jun 2024 07:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718178203;
	bh=2rsptygWifRO/c0OTQta4XS0LqTtMDZVNSsQpMH8z8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=2D5ReFgCJ0rNdPab1qhWShJZEjGyFXubQVbypSqm26hV10K6fOnoNldYMD6Ir5B4l
	 dhCMjArm9ltXzjdeHpguPw2v2UyAy76xgyegFOSHz/rdRkH8suCc5jghYAHa8w1ao6
	 ESRPhlV+Zt5W+60sq1HDzpbHxXor5LAsKO7NdV4F5zvlFqUvGdZ4VfqAqHi2aH8W6Y
	 cbjJKL3Ft2B5QnPEaNz38u0AdIr6vNnW/0/sgY4+wg+aT9mbcPIWDWwJPsYg1+adMa
	 LorIwLHrd+g4dbAxr+Kf6b35R4UPipa2nxO8g63zgDEsBdQjihbFcLpgOprtotdaao
	 OF7sbDCP+beAQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4E45437820A9;
	Wed, 12 Jun 2024 07:43:22 +0000 (UTC)
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
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	michael@walle.cc
Subject: [PATCH v5 1/8] scsi: ufs: ufs-mediatek: Remove useless mediatek,ufs-support-va09 property
Date: Wed, 12 Jun 2024 09:43:02 +0200
Message-ID: <20240612074309.50278-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
References: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_004325_155132_D751A538 
X-CRM114-Status: GOOD (  16.57  )
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
index c7a0ab9b1f59..47c7d34b9be9 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -623,27 +623,38 @@ static void ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
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
@@ -664,6 +675,7 @@ static void ufs_mtk_init_host_caps(struct ufs_hba *hba)
 		host->caps |= UFS_MTK_CAP_RTFF_MTCMOS;
 
 	dev_info(hba->dev, "caps: 0x%x", host->caps);
+	return 0;
 }
 
 static void ufs_mtk_scale_perf(struct ufs_hba *hba, bool scale_up)
@@ -986,7 +998,9 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	}
 
 	/* Initialize host capability */
-	ufs_mtk_init_host_caps(hba);
+	err = ufs_mtk_init_host_caps(hba);
+	if (err)
+		goto out;
 
 	ufs_mtk_init_mcq_irq(hba);
 
-- 
2.45.2


