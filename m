Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E843C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 07:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4lrcr2V9SwW0FxC3tsb5mEe2CZFIpwemHRFP+ckNTd8=; b=oKYl6eMTiqJKl6gU+y3UtfBVCc
	vmBrXe8FV8PMi23bcx4EkaeRXvSVGp65DJ36Dp2ZFXdHDf3jzsJOaoLglWYmMPV+lEBMSlnsicwfj
	Ul1Zt17n+SlQF4yPHfur6/7WdxEVrrjtcBZPGHi4YjovdB+laaDh6BUxadMnKbkEy71y7HVzZDHOi
	5ycJiHDcH2rhjmtDzVdImi/2/IDFa5+ZmaxnAISW4LDOCRraI2iixAKMuHmnC8xVoXsSolPo3Ii34
	L6kYW2JyH/2IRSDwv7FHNiqSQbfYLAFUNbx5eCs6nhSXQQNMaIrf/yUEn+yz6cOzECY5Uj3clTmBV
	6mTuVDLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEQvo-0025Lr-Si; Thu, 21 Jul 2022 07:49:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEQvm-0025Kq-1q
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 07:49:11 +0000
X-UUID: 785c9c8ccf6341e3b75854c7722620d4-20220721
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:c391d333-4f94-48c9-8b3c-c9fcddfe2e9a,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
	TION:release,TS:105
X-CID-META: VersionHash:0f94e32,CLOUDID:92dd9133-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:801,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 785c9c8ccf6341e3b75854c7722620d4-20220721
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1416595990; Thu, 21 Jul 2022 00:49:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 21 Jul 2022 14:58:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jul 2022 14:58:34 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Subject: [PATCH v3] scsi: ufs: correct ufshcd_shutdown flow
Date: Thu, 21 Jul 2022 14:58:33 +0800
Message-ID: <20220721065833.26887-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_004910_121616_E936D5BB 
X-CRM114-Status: GOOD (  11.81  )
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

From: Peter Wang <peter.wang@mediatek.com>

Both ufshcd_shtdown and ufshcd_wl_shutdown could run concurrently.
And it have race condition when ufshcd_wl_shutdown on-going and
clock/power turn off by ufshcd_shutdown.

The normal case:
ufshcd_wl_shutdown -> ufshcd_shtdown
ufshcd_shtdown should turn off clock/power.

The abnormal case:
ufshcd_shtdown -> ufshcd_wl_shutdown
Wait ufshcd_wl_shutdown set device to power off and turn off clock/power.
If timeout happen, means device still in active mode, cannot turn off
clock/power directly. Skip and keep clock/power on in this case.

Also remove pm_runtime_get_sync because shutdown is focus on
turn off clock/power. We don't need turn on(resume) and turn off.
The second reason is ufshcd_wl_shutdown call ufshcd_rpm_get_sync
already, if ufshcd_shtdown wait ufshcd_wl_shutdown finish,
hba->dev is already resume and no need pm_runtime_get_sync.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c7b337480e3e..47b639fd28b9 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -58,6 +58,9 @@
 /* Task management command timeout */
 #define TM_CMD_TIMEOUT	100 /* msecs */
 
+/* Shutdown wait devcie into power off timeout */
+#define UFS_SHUTDOWN_TIMEOUT	500 /* msecs */
+
 /* maximum number of retries for a general UIC command  */
 #define UFS_UIC_COMMAND_RETRIES 3
 
@@ -9461,10 +9464,15 @@ EXPORT_SYMBOL(ufshcd_runtime_resume);
  */
 int ufshcd_shutdown(struct ufs_hba *hba)
 {
-	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
-		goto out;
+	unsigned long timeout;
 
-	pm_runtime_get_sync(hba->dev);
+	/* Wait ufshcd_wl_shutdown clear ufs state */
+	timeout = jiffies + msecs_to_jiffies(UFS_SHUTDOWN_TIMEOUT);
+	while (!ufshcd_is_ufs_dev_poweroff(hba) || !ufshcd_is_link_off(hba)) {
+		if (time_after(jiffies, timeout))
+			goto out;
+		msleep(1);
+	}
 
 	ufshcd_suspend(hba);
 out:
-- 
2.18.0


