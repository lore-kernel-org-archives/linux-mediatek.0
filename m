Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691DDCAC5B7
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmkhDaikzvljJHWaXtO7a719Lo6SlnD6KO3rjUjKuHA=; b=Jcf4vVaIqydVV4eWYLgeqooRGc
	uxbaWpbX5/r/PZM10m4lWKeJIbRQ4WEuM+xTDZFRT8CfZkUCUhnfkeBcxvO5Bac0HXY5C79qUzXPI
	wWTlXB5fFjCm2chHvQSrxTHVjnwX/qdr/VNX6eQ1KBbf7NeDj19xoXi6Ai2wdt4PO+smXAkX9EInA
	03zhTinOJiw7Ax+ST3NogTMIexAMVfPEtrg5ip4gPR/qILd3QTSIdi9tAEl9e4HSLVNrHmd0Sx+Jb
	AxC6N+YWSXiALrox085O+jt0GQ4P+yMwcuQtXp8Q+wsjrogkZITK/XFq0EnfowPbJWwEPOkdZUK04
	BKrhuGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M4F-0000000GAsX-300j;
	Wed, 24 Sep 2025 09:45:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M4B-0000000GAjb-288g
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 09:45:41 +0000
X-UUID: 361af030992b11f09f706fa2197c6ceb-20250924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TmkhDaikzvljJHWaXtO7a719Lo6SlnD6KO3rjUjKuHA=;
	b=PQxTed1cVWxE6ExEYKJ7ESW+0xg29/2mpLk5KZVfvdgIB/ZiDYZcOlMgTe7R15OrkJs7dRIrrcY2SD4CFHXmak11HvfnFgg+7dYNo+6sFbsW8kWjko7b0etcIHsCMH5Cnhhv8AMStGzGj9Pw8QXlluwpMMDfu99N1p7POnW1ZfI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:1b6882e0-6856-44ed-a6d2-083637e755d5,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:1ca6b93,CLOUDID:dbdecc21-c299-443d-bb51-d77d2f000e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 361af030992b11f09f706fa2197c6ceb-20250924
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 375096857; Wed, 24 Sep 2025 02:45:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 24 Sep 2025 17:45:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 24 Sep 2025 17:45:28 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v2 1/8] ufs: host: mediatek: Correct clock scaling with PM QoS flow
Date: Wed, 24 Sep 2025 17:43:23 +0800
Message-ID: <20250924094527.2992256-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250924094527.2992256-1-peter.wang@mediatek.com>
References: <20250924094527.2992256-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024539_604910_69C1E0CA 
X-CRM114-Status: GOOD (  15.11  )
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

Correct clock scaling with PM QoS during suspend and resume.
Ensure PM QoS is released during suspend if scaling up and
re-applied after resume. This prevents performance issues
and maintains proper power management.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c       |  3 ++-
 drivers/ufs/host/ufs-mediatek.c | 10 ++++++++++
 include/ufs/ufshcd.h            |  1 +
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c9eb89dccd1e..436e2a16363c 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1075,13 +1075,14 @@ void ufshcd_pm_qos_exit(struct ufs_hba *hba)
  * @hba: per adapter instance
  * @on: If True, vote for perf PM QoS mode otherwise power save mode
  */
-static void ufshcd_pm_qos_update(struct ufs_hba *hba, bool on)
+void ufshcd_pm_qos_update(struct ufs_hba *hba, bool on)
 {
 	if (!hba->pm_qos_enabled)
 		return;
 
 	cpu_latency_qos_update_request(&hba->pm_qos_req, on ? 0 : PM_QOS_DEFAULT_VALUE);
 }
+EXPORT_SYMBOL_GPL(ufshcd_pm_qos_update);
 
 /**
  * ufshcd_set_clk_freq - set UFS controller clock frequencies
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 758a393a9de1..009031fee744 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1744,6 +1744,7 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 {
 	int err;
 	struct arm_smccc_res res;
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	if (status == PRE_CHANGE) {
 		if (ufshcd_is_auto_hibern8_supported(hba))
@@ -1773,6 +1774,10 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 
 	ufs_mtk_sram_pwr_ctrl(false, res);
 
+	/* Release pm_qos if in scale-up mode during suspend */
+	if (ufshcd_is_clkscaling_supported(hba) && (host->clk_scale_up))
+		ufshcd_pm_qos_update(hba, false);
+
 	return 0;
 fail:
 	/*
@@ -1788,6 +1793,7 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	int err;
 	struct arm_smccc_res res;
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	if (hba->ufshcd_state != UFSHCD_STATE_OPERATIONAL)
 		ufs_mtk_dev_vreg_set_lpm(hba, false);
@@ -1798,6 +1804,10 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (err)
 		goto fail;
 
+	/* Request pm_qos if in scale-up mode after resume */
+	if (ufshcd_is_clkscaling_supported(hba) && (host->clk_scale_up))
+		ufshcd_pm_qos_update(hba, true);
+
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_hpm(hba);
 		if (err)
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index ea0021f067c9..53b837b024ce 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1483,5 +1483,6 @@ int ufshcd_write_ee_control(struct ufs_hba *hba);
 int ufshcd_update_ee_control(struct ufs_hba *hba, u16 *mask,
 			     const u16 *other_mask, u16 set, u16 clr);
 void ufshcd_force_error_recovery(struct ufs_hba *hba);
+void ufshcd_pm_qos_update(struct ufs_hba *hba, bool on);
 
 #endif /* End of Header */
-- 
2.45.2


