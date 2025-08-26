Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F049CA0FF4
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 06:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsBQTWT6oTlw0J4E7huShQnOrzlUhx7A4QbdvoqLunY=; b=p5IlaQwX+JGZExzRgdeQkfuXl3
	twnBx7lG9fQbz2F2AYozCcwCXYCeNL1USa/3kF8QAAMb2LWbcwH5OvUbtPz9X0LBTcEufu2XXs22E
	A+/MNRHrEN6bwNv1j8GwbHp1FfkLsKN210rQwXO/AmrFRVg9EKOrAo/sHMDhNG8IL8L07LVD9yPDj
	J1qkpr1+oIMOCHxnpdmeFkEHKYOMuk/nI8Buja5daeLBz7K+UWYb3u2SF1ZGRi6u+MUSUtke00Zgu
	0WdjMWCwLk/MR778AMLTdiwHbn/NnXlUinx/68yMbw/2ahgcdW9No6zoCo6B/sugstOiVjLJ46Ukp
	ME/Q5ZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnZW-0000000AlRV-1GAA;
	Tue, 26 Aug 2025 06:54:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn5Z-0000000Aggn-2sD9
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Aug 2025 06:23:26 +0000
X-UUID: 29ded810824511f09f706fa2197c6ceb-20250825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dsBQTWT6oTlw0J4E7huShQnOrzlUhx7A4QbdvoqLunY=;
	b=L7aiUnmNvl5K7/8G0Z4qHhjoz6AurKuGYm2cVgwPm8vaE44RJU91h/mYAxAgAVfIlHVNc7+lViqCUXaNv5TNCAQJTRF2Z2aCFVCdTQKRoefGJud6eB+Jg9MrCctEd8JXl8AiQCAXToB8/JLsbo3l1lupNvpbzggaBMl/gACJgS4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:127cdac0-f2e5-4631-a67e-0f29f5332ed8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:525a8320-786d-4870-a017-e7b4f3839b3f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 29ded810824511f09f706fa2197c6ceb-20250825
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1085236464; Mon, 25 Aug 2025 23:23:21 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 26 Aug 2025 14:23:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 26 Aug 2025 14:23:18 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <sanjeev.y@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v2 06/10] ufs: host: mediatek: Disable auto-hibern8 during power mode changes
Date: Tue, 26 Aug 2025 14:22:20 +0800
Message-ID: <20250826062314.3070425-7-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250826062314.3070425-1-peter.wang@mediatek.com>
References: <20250826062314.3070425-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_232325_762319_A23B99B1 
X-CRM114-Status: GOOD (  13.79  )
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

This patch ensures that auto-hibern8 is disabled when changing power
modes to prevent unintended entry into auto-hibern8 during these
transitions. The original auto-hibern8 timer value is restored
after the power mode change is complete, maintaining system stability
and preventing potential issues during power state transitions.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 53 +++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 5d2de4fc370b..e42e9b97810c 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1429,19 +1429,49 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 	return ret;
 }
 
+static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
+{
+	int ret;
+
+	/* disable auto-hibern8 */
+	ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
+
+	/* wait host return to idle state when auto-hibern8 off */
+	ufs_mtk_wait_idle_state(hba, 5);
+
+	ret = ufs_mtk_wait_link_state(hba, VS_LINK_UP, 100);
+	if (ret) {
+		dev_warn(hba->dev, "exit h8 state fail, ret=%d\n", ret);
+
+		ufshcd_force_error_recovery(hba);
+
+		/* trigger error handler and break suspend */
+		ret = -EBUSY;
+	}
+
+	return ret;
+}
+
 static int ufs_mtk_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status stage,
 				const struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
 {
 	int ret = 0;
+	static u32 reg;
 
 	switch (stage) {
 	case PRE_CHANGE:
+		if (ufshcd_is_auto_hibern8_supported(hba)) {
+			reg = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
+			ufs_mtk_auto_hibern8_disable(hba);
+		}
 		ret = ufs_mtk_pre_pwr_change(hba, dev_max_params,
 					     dev_req_params);
 		break;
 	case POST_CHANGE:
+		if (ufshcd_is_auto_hibern8_supported(hba))
+			ufshcd_writel(hba, reg, REG_AUTO_HIBERNATE_IDLE_TIMER);
 		break;
 	default:
 		ret = -EINVAL;
@@ -1686,29 +1716,6 @@ static void ufs_mtk_dev_vreg_set_lpm(struct ufs_hba *hba, bool lpm)
 	}
 }
 
-static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
-{
-	int ret;
-
-	/* disable auto-hibern8 */
-	ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
-
-	/* wait host return to idle state when auto-hibern8 off */
-	ufs_mtk_wait_idle_state(hba, 5);
-
-	ret = ufs_mtk_wait_link_state(hba, VS_LINK_UP, 100);
-	if (ret) {
-		dev_warn(hba->dev, "exit h8 state fail, ret=%d\n", ret);
-
-		ufshcd_force_error_recovery(hba);
-
-		/* trigger error handler and break suspend */
-		ret = -EBUSY;
-	}
-
-	return ret;
-}
-
 static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	enum ufs_notify_change_status status)
 {
-- 
2.45.2


