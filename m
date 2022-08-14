Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9A5C25B0F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Aug 2022 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NojDq6UvQtU8cGmtwkIGPc/vEHn5+OXV+gUCqdGPZog=; b=k3dHr486ajkWdUVOJuQUl74beA
	N2Xp/MN5uCZx/ft847CGvMeIsOeo9MsI0kx4tKXFGoodZt3H+hZaOYYOYmVRHn5SVaAA4dzbmxGjE
	kgkX7qrkr9w8+gNtxvqfa2IKC4qd+wMlUcoisIgkxyv6PH8p9elVb+GaDD8bHPU67SYJNtwcBolZE
	U6d4f8dhHefyoFz2QLz3Xpm/ESeR0qNG9YrxXReTE/fJFivgiEhAwZ/7uz0BaetS13y6smPWeBrv0
	nTtut/Iz5HSLazMAiB1RrN1Y9bU9yEFHjvsKw8JX5Y5gGwu7Er+42ce29FG6aDhPfb9+rccjueRrK
	DrLjyK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNFcA-007R8y-EL; Sun, 14 Aug 2022 15:33:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNFa1-007PWp-Is; Sun, 14 Aug 2022 15:31:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B22160C43;
	Sun, 14 Aug 2022 15:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23144C433C1;
	Sun, 14 Aug 2022 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660491068;
	bh=dt0BS2f9ek9t8KbWEO8Bu16vd6SbZkTKMNwAzrHuyl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mCfSQcX0LwFhupOmt+HrhSvWnZIJStW9VXOZ67AozprFqhcNdy+UAL8Qw75UXBwUz
	 Jtr6X+8uilCy6P0IJFcYVQtpvL8KeXBa08r2ZXbhlxGgVzg1n/vNJxyWooQh6vdVfu
	 yG30rnyN+1OiylbUGmFmJPMorIcAePjg7haIqZinTPs4UL8rbARiZaqLW9ZAPUL+hO
	 5BDq3bjHqcFzmgwr7cl3Fl8fPMN1rwaoaMqW8OU1FexnHHuDgfCKY7gOaA9LCFTh2m
	 89SpVLywgOy87Ve93lu00ulb+z6qNU8UhdBlW/WQ6Pyrlzq9QvQDREoKjCnipLGc67
	 vmYPNW9sHV9Yg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Po-Wen Kao <powen.kao@mediatek.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	beanhuo@micron.com,
	bvanassche@acm.org,
	avri.altman@wdc.com,
	peter.wang@mediatek.com,
	linmq006@gmail.com,
	ye.guojin@zte.com.cn,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.18 15/56] scsi: ufs: ufs-mediatek: Fix the timing of configuring device regulators
Date: Sun, 14 Aug 2022 11:29:45 -0400
Message-Id: <20220814153026.2377377-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814153026.2377377-1-sashal@kernel.org>
References: <20220814153026.2377377-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_083109_738794_B9EB94CE 
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
index 86a938075f30..266ceed34751 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -1033,7 +1033,6 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 		 * ufshcd_suspend() re-enabling regulators while vreg is still
 		 * in low-power mode.
 		 */
-		ufs_mtk_vreg_set_lpm(hba, true);
 		err = ufs_mtk_mphy_power_on(hba, false);
 		if (err)
 			goto fail;
@@ -1057,12 +1056,13 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
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
@@ -1227,9 +1227,57 @@ static int ufs_mtk_remove(struct platform_device *pdev)
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


