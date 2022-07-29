Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76C7C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 02:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQPxhecMMGrqgnvl1RYt1P0R5Uvv2aKASwgCAn7Phe8=; b=ke6DEQyDPSL5euRQkhSTVRuxJC
	mtZK2EEuO1hZzOdcxHViKhhLn2Ubu5CxH5a8tVztfOZvR0yGu+UvoG+hBmZqQkiyZQQEAWEe0qSkk
	LddGnqgzRUS+5dDvMF43O8c2JoRpjd166uZPJeEDs7rH9lnWk+dqB9BFBwX9wAVWhEZ3ddAGWPU40
	YdRT4Tc+POih6woOmTH/MlwbOcXqCfPHyh612eVdvoqxLOpquKVleOjXCDSvuGV2+0OiThRfq9/AH
	5az+j2vQibMdf3LbNtAr+4L5mTzamBCs3EzJgYqCZc+qhUxDK8i9cSAt+mW/EQppxdaBuCuwPJYjg
	zMyaoK2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHFNo-00H0Kd-PS; Fri, 29 Jul 2022 02:05:44 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHFNb-00H00v-Gf
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 02:05:32 +0000
Received: by mail-pl1-x634.google.com with SMTP id t2so3359076ply.2
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 19:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PQPxhecMMGrqgnvl1RYt1P0R5Uvv2aKASwgCAn7Phe8=;
        b=j5nWXS2yN3xRH2vvBgQIilwdiWeecYwiAszsfvGo+ZmflzeozdenVJVOoJC3cMeVft
         u8Tz3VEhWSLetIg9GQz+LzvknUDQRMDxjFVGfJY/e2dpb2EqATSyuAiRKBaABEYbHjj+
         6LtNUvOF+Q1uVxleFDiUoCe80JQv6a9RO5U9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PQPxhecMMGrqgnvl1RYt1P0R5Uvv2aKASwgCAn7Phe8=;
        b=1addt8nzJcTjRL+B08n3zDFONveamnbQeujL7vAP21ZYgz5oPoGvDRCyT5k6ZmxJ1R
         bvN+S29++s55z9GqTqtH9qzJ8/bJX7lSTy9aPWsaAQfgK3t+eG8n3JYvR5aSWa8dzil0
         67vckUnztTjmNVuNDBAdUe9EKR0CVTSbCWXb9aQeh7rM56LwgFVODH7jAdu3JjZsTeM+
         HslJWkOPUW9H9XjaeFRqlhWIgcIxViRzkDGFoRbVWCptAz5EJtIgKcUUMFYvu6KL+3eq
         R64VVBl4zEBD4isOBlb5IeeI2ltHOyGrcbJaFb4BqPufFo4R27IxnCfdLFHc8wS0MWVv
         Q+mA==
X-Gm-Message-State: ACgBeo0XCwTPCN2KImmHcY9wKnmvc+iiOdL2AQ6vur4fGJ0OtubPz4RC
	v6W0Sj9oYlXRsQTSQ/m3d+fsgA==
X-Google-Smtp-Source: AA6agR7BCdlcbu27dD6NFwhWH1isDT1btrN6hUxN8jMKdBhGXsxNwG/13hDnNDx3sjS3iFqZ3ECLwA==
X-Received: by 2002:a17:902:cec1:b0:16d:c4f2:66c5 with SMTP id d1-20020a170902cec100b0016dc4f266c5mr1664693plg.20.1659060329435;
        Thu, 28 Jul 2022 19:05:29 -0700 (PDT)
Received: from dlunevwfh.roam.corp.google.com (n122-107-196-14.sbr2.nsw.optusnet.com.au. [122.107.196.14])
        by smtp.gmail.com with ESMTPSA id y124-20020a62ce82000000b005258df7615bsm1571901pfg.0.2022.07.28.19.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 19:05:29 -0700 (PDT)
From: Daniil Lunev <dlunev@chromium.org>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniil Lunev <dlunev@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Avri Altman <avri.altman@wdc.com>,
	Bean Huo <beanhuo@micron.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Daejun Park <daejun7.park@samsung.com>,
	Eric Biggers <ebiggers@google.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH v3 1/2] ufs: add function to check CRYPTO capability
Date: Fri, 29 Jul 2022 12:05:07 +1000
Message-Id: <20220729120216.v3.1.I6b7934b96fff0d5ea22531e57c0a11f0ccd1acd8@changeid>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220729020508.4147751-1-dlunev@chromium.org>
References: <20220729020508.4147751-1-dlunev@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_190531_564466_BBBB79F3 
X-CRM114-Status: GOOD (  16.59  )
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

To align with other capability check functions.

Signed-off-by: Daniil Lunev <dlunev@chromium.org>

 drivers/ufs/core/ufshcd-crypto.c | 8 ++++----
 drivers/ufs/host/ufs-mediatek.c  | 2 +-
 drivers/ufs/host/ufs-qcom-ice.c  | 4 ++--
 drivers/ufs/host/ufshcd-pci.c    | 2 +-
 include/ufs/ufshcd.h             | 5 +++++
 5 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-crypto.c b/drivers/ufs/core/ufshcd-crypto.c
index 198360fe5e8e1..f819488bbde14 100644
--- a/drivers/ufs/core/ufshcd-crypto.c
+++ b/drivers/ufs/core/ufshcd-crypto.c
@@ -118,7 +118,7 @@ static int ufshcd_crypto_keyslot_evict(struct blk_crypto_profile *profile,
 
 bool ufshcd_crypto_enable(struct ufs_hba *hba)
 {
-	if (!(hba->caps & UFSHCD_CAP_CRYPTO))
+	if (!ufshcd_is_crypto_supported(hba))
 		return false;
 
 	/* Reset might clear all keys, so reprogram all the keys. */
@@ -165,7 +165,7 @@ int ufshcd_hba_init_crypto_capabilities(struct ufs_hba *hba)
 	 * hasn't advertised that crypto is supported.
 	 */
 	if (!(hba->capabilities & MASK_CRYPTO_SUPPORT) ||
-	    !(hba->caps & UFSHCD_CAP_CRYPTO))
+	    !ufshcd_is_crypto_supported(hba))
 		goto out;
 
 	hba->crypto_capabilities.reg_val =
@@ -225,7 +225,7 @@ void ufshcd_init_crypto(struct ufs_hba *hba)
 {
 	int slot;
 
-	if (!(hba->caps & UFSHCD_CAP_CRYPTO))
+	if (!ufshcd_is_crypto_supported(hba))
 		return;
 
 	/* Clear all keyslots - the number of keyslots is (CFGC + 1) */
@@ -235,6 +235,6 @@ void ufshcd_init_crypto(struct ufs_hba *hba)
 
 void ufshcd_crypto_register(struct ufs_hba *hba, struct request_queue *q)
 {
-	if (hba->caps & UFSHCD_CAP_CRYPTO)
+	if (ufshcd_is_crypto_supported(hba))
 		blk_crypto_register(&hba->crypto_profile, q);
 }
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index beabc3ccd30b3..4bdf6a709126d 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -182,7 +182,7 @@ static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 			ufs_mtk_host_reset(hba);
 		}
 
-		if (hba->caps & UFSHCD_CAP_CRYPTO)
+		if (ufshcd_is_crypto_supported(hba))
 			ufs_mtk_crypto_enable(hba);
 
 		if (host->caps & UFS_MTK_CAP_DISABLE_AH8) {
diff --git a/drivers/ufs/host/ufs-qcom-ice.c b/drivers/ufs/host/ufs-qcom-ice.c
index 745e48ec598f8..180a015b6973d 100644
--- a/drivers/ufs/host/ufs-qcom-ice.c
+++ b/drivers/ufs/host/ufs-qcom-ice.c
@@ -161,7 +161,7 @@ static void qcom_ice_optimization_enable(struct ufs_qcom_host *host)
 
 int ufs_qcom_ice_enable(struct ufs_qcom_host *host)
 {
-	if (!(host->hba->caps & UFSHCD_CAP_CRYPTO))
+	if (!ufshcd_is_crypto_supported(host->hba))
 		return 0;
 	qcom_ice_low_power_mode_enable(host);
 	qcom_ice_optimization_enable(host);
@@ -189,7 +189,7 @@ int ufs_qcom_ice_resume(struct ufs_qcom_host *host)
 {
 	int err;
 
-	if (!(host->hba->caps & UFSHCD_CAP_CRYPTO))
+	if (!ufshcd_is_crypto_supported(host->hba))
 		return 0;
 
 	err = qcom_ice_wait_bist_status(host);
diff --git a/drivers/ufs/host/ufshcd-pci.c b/drivers/ufs/host/ufshcd-pci.c
index 04166bda41daa..c06ccef348065 100644
--- a/drivers/ufs/host/ufshcd-pci.c
+++ b/drivers/ufs/host/ufshcd-pci.c
@@ -89,7 +89,7 @@ static int ufs_intel_hce_enable_notify(struct ufs_hba *hba,
 				       enum ufs_notify_change_status status)
 {
 	/* Cannot enable ICE until after HC enable */
-	if (status == POST_CHANGE && hba->caps & UFSHCD_CAP_CRYPTO) {
+	if (status == POST_CHANGE && ufshcd_is_crypto_supported(hba)) {
 		u32 hce = ufshcd_readl(hba, REG_CONTROLLER_ENABLE);
 
 		hce |= CRYPTO_GENERAL_ENABLE;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index a92271421718e..ddbf470f8f455 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1005,6 +1005,11 @@ static inline bool ufshcd_is_wb_allowed(struct ufs_hba *hba)
 	return hba->caps & UFSHCD_CAP_WB_EN;
 }
 
+static inline bool ufshcd_is_crypto_supported(struct ufs_hba *hba)
+{
+	return hba->caps & UFSHCD_CAP_CRYPTO;
+}
+
 #define ufshcd_writel(hba, val, reg)	\
 	writel((val), (hba)->mmio_base + (reg))
 #define ufshcd_readl(hba, reg)	\
-- 
2.31.0


