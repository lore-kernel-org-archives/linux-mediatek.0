Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A2BCA0FEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 06:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSbxHKWrd0StscxB+O/Edj0ZKxQuS08QZUMxsvboj2o=; b=qUY+XNIrBvm9x/C/F1o9O0m/Lq
	F1GBRWZ8Nr6hsSd7f4cxNtmOcPos7nwwF8uE0+Lt1b35FQsRPcdACi+1dq2IXBaxMxsEtEIY+bLGm
	XUrcE5ChzwyO3C5x/eXYoU8LObAm5whgTqmKWHF9nKJyjwI33iPx1i9y04oqWNR+/oDhTJr4650+q
	dURpSHvhU2ptPXvPVH0iaLafciIVKTFQNURNcEnTzFvWGquzxjTgA9Kj4ie7CFDefU5yECIcJnopr
	rNwlfgVW2oieLlo7M6dJTB4ONcy46tWDeJsmvtKB537/YkN5jOOIiPr0kvXcHTbBmDYJ6ePzvtgYN
	YNqTqVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnZX-0000000AlSS-0YMk;
	Tue, 26 Aug 2025 06:54:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqn5Z-0000000Agh8-3N9s
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Aug 2025 06:23:28 +0000
X-UUID: 28ea2ae0824511f09eb0dd999d3936bf-20250825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NSbxHKWrd0StscxB+O/Edj0ZKxQuS08QZUMxsvboj2o=;
	b=rdt7EbEWuhcQLplOSK/E2qDHCkRPZkjXvCO0yqZjhzR0FAWt7AnVSgdTqKTXP7gutoFlrs9pFC2SOIrK7scyuSWuRjwsnayGZNpZDpj2JwvaFuuBt/A+wDwEbxYcCG24ffxf+OcGC5nASTWjSiyYn/ABMBqAAPACP4kntEmuQA8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:7b58396b-ab49-44e9-922c-ccf786af5f40,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:f1326cf,CLOUDID:9cc7877a-966c-41bd-96b5-7d0b3c22e782,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 28ea2ae0824511f09eb0dd999d3936bf-20250825
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 376433426; Mon, 25 Aug 2025 23:23:19 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 26 Aug 2025 14:23:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 26 Aug 2025 14:23:16 +0800
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
Subject: [PATCH v2 01/10] ufs: host: mediatek: Enhance recovery on hibernation exit failure
Date: Tue, 26 Aug 2025 14:22:15 +0800
Message-ID: <20250826062314.3070425-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250826062314.3070425-1-peter.wang@mediatek.com>
References: <20250826062314.3070425-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_232325_896601_1F36626C 
X-CRM114-Status: GOOD (  13.95  )
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

This patch improves the recovery process when exiting hibernation
mode fails. It triggers the error handler and breaks the suspend
operation, ensuring that the system can recover from hibernation
errors more effectively. The error handling mechanism is activated
by setting 'force_reset' and scheduling the error handler work.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c       |  3 ++-
 drivers/ufs/host/ufs-mediatek.c | 14 +++++++++++---
 include/ufs/ufshcd.h            |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 50adfb8b335b..a74aa8804caa 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6410,13 +6410,14 @@ void ufshcd_schedule_eh_work(struct ufs_hba *hba)
 	}
 }
 
-static void ufshcd_force_error_recovery(struct ufs_hba *hba)
+void ufshcd_force_error_recovery(struct ufs_hba *hba)
 {
 	spin_lock_irq(hba->host->host_lock);
 	hba->force_reset = true;
 	ufshcd_schedule_eh_work(hba);
 	spin_unlock_irq(hba->host->host_lock);
 }
+EXPORT_SYMBOL_GPL(ufshcd_force_error_recovery);
 
 static void ufshcd_clk_scaling_allow(struct ufs_hba *hba, bool allow)
 {
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 5ef0ba4527e4..1aa14a8dc161 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1686,7 +1686,7 @@ static void ufs_mtk_dev_vreg_set_lpm(struct ufs_hba *hba, bool lpm)
 	}
 }
 
-static void ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
+static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 {
 	int ret;
 
@@ -1697,8 +1697,16 @@ static void ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 	ufs_mtk_wait_idle_state(hba, 5);
 
 	ret = ufs_mtk_wait_link_state(hba, VS_LINK_UP, 100);
-	if (ret)
+	if (ret) {
 		dev_warn(hba->dev, "exit h8 state fail, ret=%d\n", ret);
+
+		ufshcd_force_error_recovery(hba);
+
+		/* trigger error handler and break suspend */
+		ret = -EBUSY;
+	}
+
+	return ret;
 }
 
 static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
@@ -1709,7 +1717,7 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 
 	if (status == PRE_CHANGE) {
 		if (ufshcd_is_auto_hibern8_supported(hba))
-			ufs_mtk_auto_hibern8_disable(hba);
+			return ufs_mtk_auto_hibern8_disable(hba);
 		return 0;
 	}
 
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 9b3515cee711..93f91b09589d 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1507,5 +1507,6 @@ int __ufshcd_write_ee_control(struct ufs_hba *hba, u32 ee_ctrl_mask);
 int ufshcd_write_ee_control(struct ufs_hba *hba);
 int ufshcd_update_ee_control(struct ufs_hba *hba, u16 *mask,
 			     const u16 *other_mask, u16 set, u16 clr);
+void ufshcd_force_error_recovery(struct ufs_hba *hba);
 
 #endif /* End of Header */
-- 
2.45.2


