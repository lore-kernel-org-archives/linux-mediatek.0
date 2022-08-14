Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0214EC25B08
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Aug 2022 15:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGfhEEZj1fG5i+oCLpJfgPrzYa0QKISERU+b1htcWM8=; b=D/JwRYMJ74zCtsnUzWyoMYPXS5
	2CjG+u12BrKAbCzoke7gxzsYlBEDdKZXX4fY+sZfC9rl++NIluVulB4dhBsAeBHRoF6Myib6fkexS
	BGCqUJ+NGYTWD4tAOF9FirDma3NlG7IuGhiN5If/HeMW0xE4UydXfhWBlk3I1E/fcBT8z82SmHGq+
	0s4AjldCygVDdi+JypbzroFWeTlioPsXALiYePD9VmNnZfsdximsoyNM3kmtdJ2k/lkkmPrvUMVkb
	5+t5p4iKAlOqKPULzVZDT/ElDT3CfKcyidMhooo0uBIQKtP4cXEfpLxuagbJwLPiXk8VbbpEQwDRy
	iusQ0S4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNFlS-007X1V-WA; Sun, 14 Aug 2022 15:42:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNFc6-007R4t-9V; Sun, 14 Aug 2022 15:33:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ED034B80B77;
	Sun, 14 Aug 2022 15:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115A2C433C1;
	Sun, 14 Aug 2022 15:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660491195;
	bh=ItqQFXDDWb3IjtNXUtXeNW31x5hR5NXcdcX8U4BxumU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eaZrOWReU06aGK+4odM8jnGDb4ei7lUG9o/+ZCGgIAuXQF6wsk4Fiy9PlojsxJunv
	 f+Rx+JroRl/mJuaV6e6bmG0y1nM6Y5eAFayEPLXb89CPBspTQw/0hos03Fykh51D4+
	 vPypSPDQiGfmf3Agte4tarMkeuHUlqJdzrCgj0f+K9tOlEcvjXUuHQ2zeImtHTpzCp
	 GsCXv6tQHFtbY2zOud3OTQhjINYLSpPGB8LiJQcGzqsvpQviYf5tX5I2CX++r31+uP
	 X9S+TmCWfvjP3OxFexeMlzn7sbyYJiomvQssqtVhXjUG2AMJ0/o4I7lbg44G2zhnTQ
	 ii8OoOzfmJ5xQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Po-Wen Kao <powen.kao@mediatek.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	bvanassche@acm.org,
	beanhuo@micron.com,
	avri.altman@wdc.com,
	peter.wang@mediatek.com,
	linmq006@gmail.com,
	ye.guojin@zte.com.cn,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 12/46] scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators
Date: Sun, 14 Aug 2022 11:32:13 -0400
Message-Id: <20220814153247.2378312-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814153247.2378312-1-sashal@kernel.org>
References: <20220814153247.2378312-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_083318_772182_2614CCAD 
X-CRM114-Status: GOOD (  15.78  )
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

From: Po-Wen Kao <powen.kao@mediatek.com>

[ Upstream commit 3fd23b8dfb54d9b74eba6dfdd3225db3ac116785 ]

Currently the LPM configurations of device regulators may not work since
VCC is not disabled yet while ufs_mtk_vreg_set_lpm() is executed.

Fix this by changing the timing of invoking ufs_mtk_vreg_set_lpm().

Link: https://lore.kernel.org/r/20220616053725.5681-5-stanley.chu@mediatek.com
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufs-mediatek.c | 58 ++++++++++++++++++++++++++++++---
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 4e53857605de..9f1d69d33149 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -949,7 +949,6 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		 * ufshcd_suspend() re-enabling regulators while vreg is still
 		 * in low-power mode.
 		 */
-		ufs_mtk_vreg_set_lpm(hba, true);
 		err = ufs_mtk_mphy_power_on(hba, false);
 		if (err)
 			goto fail;
@@ -973,12 +972,13 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	int err;
 
+	if (hba->ufshcd_state != UFSHCD_STATE_OPERATIONAL)
+		ufs_mtk_vreg_set_lpm(hba, false);
+
 	err = ufs_mtk_mphy_power_on(hba, true);
 	if (err)
 		goto fail;
 
-	ufs_mtk_vreg_set_lpm(hba, false);
-
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_hpm(hba);
 		if (err)
@@ -1139,9 +1139,57 @@ static int ufs_mtk_remove(struct platform_device *pdev)
 	return 0;
 }
 
+int ufs_mtk_system_suspend(struct device *dev)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	int ret;
+
+	ret = ufshcd_system_suspend(dev);
+	if (ret)
+		return ret;
+
+	ufs_mtk_vreg_set_lpm(hba, true);
+
+	return 0;
+}
+
+int ufs_mtk_system_resume(struct device *dev)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+
+	ufs_mtk_vreg_set_lpm(hba, false);
+
+	return ufshcd_system_resume(dev);
+}
+
+int ufs_mtk_runtime_suspend(struct device *dev)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	int ret = 0;
+
+	ret = ufshcd_runtime_suspend(dev);
+	if (ret)
+		return ret;
+
+	ufs_mtk_vreg_set_lpm(hba, true);
+
+	return 0;
+}
+
+int ufs_mtk_runtime_resume(struct device *dev)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+
+	ufs_mtk_vreg_set_lpm(hba, false);
+
+	return ufshcd_runtime_resume(dev);
+}
+
 static const struct dev_pm_ops ufs_mtk_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(ufshcd_system_suspend, ufshcd_system_resume)
-	SET_RUNTIME_PM_OPS(ufshcd_runtime_suspend, ufshcd_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(ufs_mtk_system_suspend,
+				ufs_mtk_system_resume)
+	SET_RUNTIME_PM_OPS(ufs_mtk_runtime_suspend,
+			   ufs_mtk_runtime_resume, NULL)
 	.prepare	 = ufshcd_suspend_prepare,
 	.complete	 = ufshcd_resume_complete,
 };
-- 
2.35.1


