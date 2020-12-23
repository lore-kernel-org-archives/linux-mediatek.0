Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D2BC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:17:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D662335A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9D662335A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6f1zYIw9XhBRhJImiu8XscPvjHtehjhb6/N6hrD3gzA=; b=j9oO3/82yXCB2FjZFwys0nuGQ
	Zx6WmG/4dOjknYGSkj1gU3Ocfj5CgHpBQxm3lvFO+tLXaRJsptOEB82s8VRxunBcEmOm5RSJZRmm3
	s4X4wWfbdXJjuzwTTofex37P3VsFr68Ug57FLsGc3y+WX8DBsJZ/yFK8vQA4H2SrQcBONM+GZZz7k
	0I9YZnFKw/Ly0B1S4XT6alV2HLUdakVKTRA1B2hYT1IR0t/Qhz67IHKKSA7APDg+NercCKdAPkeVm
	Q9rzMixHbjgIpFp9vha/RrtUd0Pwi8w+lUBRmWE+TLx63tGwkK5FabJPIKBi+/0mGd5faSxoczVRK
	4hm0KnAaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krtiJ-0007F9-PT; Wed, 23 Dec 2020 02:17:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krtiD-0007Cj-JH; Wed, 23 Dec 2020 02:17:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C951221E5;
 Wed, 23 Dec 2020 02:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689832;
 bh=yYA+MGHW/+TtHZWGYi2rBWDMZ0naSYSzdR8S3kuTsrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zx88YomxhB5Kw3zBAtaWmBB89/MDI996ICvSEIdBZOwjXIC0HGzfMjdtAY1NMb85g
 igmGvEjO97wKIMgFBJ65iDmEeZaJoch8Kb08niOkvZPLHSNvBmTwrVaIGO4f+VtFG2
 8jbWOA83UvJy0r7wWUkCBusH+todr5v/fwfPRzdAXehUYXWYu7W7BT5NS/AwA4Youz
 1Nsysa+Gr/bEj9+Ro3L6ZpnL9ZD+qdykaulDcEvuwdLSzgaRoOU0ekbZnHIMzz6E4h
 0C3tNJZVqC8VN3zNpjDGbIERrTMqJQNXp7SfpGS8No0gTfT/VuEUpcU/8IJwoehvcY
 Tx1i+DMNRe/3Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 034/217] scsi: ufs: Allow an error return value
 from ->device_reset()
Date: Tue, 22 Dec 2020 21:13:23 -0500
Message-Id: <20201223021626.2790791-34-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_211713_886853_AA33D60A 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-arm-msm@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 Asutosh Das <asutoshd@codeaurora.org>, Can Guo <cang@codeaurora.org>,
 linux-mediatek@lists.infradead.org, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Bean huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Adrian Hunter <adrian.hunter@intel.com>

[ Upstream commit 151f1b664ffbb847c7fbbce5a5b8580f1b9b1d98 ]

It is simpler for drivers to provide a ->device_reset() callback
irrespective of whether the GPIO, or firmware interface necessary to do the
reset, is discovered during probe.

Change ->device_reset() to return an error code.  Drivers that provide the
callback, but do not do the reset operation should return -EOPNOTSUPP.

Link: https://lore.kernel.org/r/20201103141403.2142-3-adrian.hunter@intel.com
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Bean huo <beanhuo@micron.com>
Reviewed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufs-mediatek.c |  4 +++-
 drivers/scsi/ufs/ufs-qcom.c     |  6 ++++--
 drivers/scsi/ufs/ufshcd.h       | 11 +++++++----
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 8df73bc2f8cb2..914a827a93ee8 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -743,7 +743,7 @@ static int ufs_mtk_link_startup_notify(struct ufs_hba *hba,
 	return ret;
 }
 
-static void ufs_mtk_device_reset(struct ufs_hba *hba)
+static int ufs_mtk_device_reset(struct ufs_hba *hba)
 {
 	struct arm_smccc_res res;
 
@@ -764,6 +764,8 @@ static void ufs_mtk_device_reset(struct ufs_hba *hba)
 	usleep_range(10000, 15000);
 
 	dev_info(hba->dev, "device reset done\n");
+
+	return 0;
 }
 
 static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index f9d6ef3565407..a244c8ae1b4eb 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1421,13 +1421,13 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
  *
  * Toggles the (optional) reset line to reset the attached device.
  */
-static void ufs_qcom_device_reset(struct ufs_hba *hba)
+static int ufs_qcom_device_reset(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 
 	/* reset gpio is optional */
 	if (!host->device_reset)
-		return;
+		return -EOPNOTSUPP;
 
 	/*
 	 * The UFS device shall detect reset pulses of 1us, sleep for 10us to
@@ -1438,6 +1438,8 @@ static void ufs_qcom_device_reset(struct ufs_hba *hba)
 
 	gpiod_set_value_cansleep(host->device_reset, 0);
 	usleep_range(10, 15);
+
+	return 0;
 }
 
 #if IS_ENABLED(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index e0f00a42371c5..de97971e2d865 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -318,7 +318,7 @@ struct ufs_hba_variant_ops {
 	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
 	void	(*dbg_register_dump)(struct ufs_hba *hba);
 	int	(*phy_initialization)(struct ufs_hba *);
-	void	(*device_reset)(struct ufs_hba *hba);
+	int	(*device_reset)(struct ufs_hba *hba);
 	void	(*config_scaling_param)(struct ufs_hba *hba,
 					struct devfreq_dev_profile *profile,
 					void *data);
@@ -1181,9 +1181,12 @@ static inline void ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
 static inline void ufshcd_vops_device_reset(struct ufs_hba *hba)
 {
 	if (hba->vops && hba->vops->device_reset) {
-		hba->vops->device_reset(hba);
-		ufshcd_set_ufs_dev_active(hba);
-		ufshcd_update_reg_hist(&hba->ufs_stats.dev_reset, 0);
+		int err = hba->vops->device_reset(hba);
+
+		if (!err)
+			ufshcd_set_ufs_dev_active(hba);
+		if (err != -EOPNOTSUPP)
+			ufshcd_update_reg_hist(&hba->ufs_stats.dev_reset, err);
 	}
 }
 
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
