Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC25C83F01
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 13:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpMcaEyrAdaGuO54jgsDq+62Am9F9en4DBy1lZ6dSgs=; b=Xg/LYC34mXHlNf56hu5sIZ1YZ/
	qCneZVxBpdTh2liNu01vmfEmPbvORWZCpR/6K8E6L/BUsrZCTQ9T5y6bOEHsFuR18MK2//qSGqEu9
	TPcIggaky12XZMc3m5gd4so1ctd4eShVYy5P2+/Rl0HJ458ZEAqAw+364TzvvqhqT7xXVvPT1vI4t
	PMm1lr9DunfP2nG4pHKu9D1AyP0n0zpjapLs80yKmByqC8GGgngBfdKBvHGGym+8oQXbPA2O+EJBq
	lQi3RuP2+8YUbe3yXDqubcdFzb8KoZ5BxobNY6iu2UOjryA3FfEgJYN2QfKdfiSvQf+7coZSOcMSV
	J6bnP2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbhal-00FMLt-1v;
	Thu, 31 Aug 2023 13:20:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbhai-00FMLW-3A
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Aug 2023 13:20:10 +0000
X-UUID: 1914a684480111ee86758d4a7c00f3a0-20230831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vpMcaEyrAdaGuO54jgsDq+62Am9F9en4DBy1lZ6dSgs=;
	b=fBp5ulhT2YSuGFVmKl4wdQHtdK0ASEt4GtzWGweQwqdK1EenS9ZzmmRvt96nMHAJrQ0xiUkpswPXqw4NJw3bN1pvj4zJ958cSRpjrgJOOrZ3DWokIA3VeZNiF8yF8TN7mPfXYfU9flkUwj750Ya79kMPLop+4B4ZPVb2AhNBAOU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:9094cbaf-b187-4672-b604-d19e52b88a43,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:c5ad6813-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 1914a684480111ee86758d4a7c00f3a0-20230831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1446147599; Thu, 31 Aug 2023 06:20:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 31 Aug 2023 21:08:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 31 Aug 2023 21:08:30 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>
Subject: [PATCH v2 2/3] ufs: core: fix abnormal scale up after last cmd finish
Date: Thu, 31 Aug 2023 21:08:25 +0800
Message-ID: <20230831130826.5592-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230831130826.5592-1-peter.wang@mediatek.com>
References: <20230831130826.5592-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_062009_049310_9B97505D 
X-CRM114-Status: GOOD (  11.26  )
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

When ufshcd_clk_scaling_suspend_work(Thread A) running and new command
coming, ufshcd_clk_scaling_start_busy(Thread B) may get host_lock
after Thread A first time release host_lock. Then Thread A second time
get host_lock will set clk_scaling.window_start_t = 0 which scale up
clock abnormal next polling_ms time.
Also inlines another __ufshcd_suspend_clkscaling calls.

Below is racing step:
1	hba->clk_scaling.suspend_work (Thread A)
	ufshcd_clk_scaling_suspend_work
2		spin_lock_irqsave(hba->host->host_lock, irq_flags);
3		hba->clk_scaling.is_suspended = true;
4		spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
		__ufshcd_suspend_clkscaling
7			spin_lock_irqsave(hba->host->host_lock, flags);
8			hba->clk_scaling.window_start_t = 0;
9			spin_unlock_irqrestore(hba->host->host_lock, flags);

	ufshcd_send_command (Thread B)
		ufshcd_clk_scaling_start_busy
5			spin_lock_irqsave(hba->host->host_lock, flags);
			....
6			spin_unlock_irqrestore(hba->host->host_lock, flags);

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index e3672e55efae..057549b0e586 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -275,7 +275,6 @@ static inline void ufshcd_add_delay_before_dme_cmd(struct ufs_hba *hba);
 static int ufshcd_host_reset_and_restore(struct ufs_hba *hba);
 static void ufshcd_resume_clkscaling(struct ufs_hba *hba);
 static void ufshcd_suspend_clkscaling(struct ufs_hba *hba);
-static void __ufshcd_suspend_clkscaling(struct ufs_hba *hba);
 static int ufshcd_scale_clks(struct ufs_hba *hba, bool scale_up);
 static irqreturn_t ufshcd_intr(int irq, void *__hba);
 static int ufshcd_change_power_mode(struct ufs_hba *hba,
@@ -1385,9 +1384,10 @@ static void ufshcd_clk_scaling_suspend_work(struct work_struct *work)
 		return;
 	}
 	hba->clk_scaling.is_suspended = true;
+	hba->clk_scaling.window_start_t = 0;
 	spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
 
-	__ufshcd_suspend_clkscaling(hba);
+	devfreq_suspend_device(hba->devfreq);
 }
 
 static void ufshcd_clk_scaling_resume_work(struct work_struct *work)
@@ -1564,16 +1564,6 @@ static void ufshcd_devfreq_remove(struct ufs_hba *hba)
 	dev_pm_opp_remove(hba->dev, clki->max_freq);
 }
 
-static void __ufshcd_suspend_clkscaling(struct ufs_hba *hba)
-{
-	unsigned long flags;
-
-	devfreq_suspend_device(hba->devfreq);
-	spin_lock_irqsave(hba->host->host_lock, flags);
-	hba->clk_scaling.window_start_t = 0;
-	spin_unlock_irqrestore(hba->host->host_lock, flags);
-}
-
 static void ufshcd_suspend_clkscaling(struct ufs_hba *hba)
 {
 	unsigned long flags;
@@ -1586,11 +1576,12 @@ static void ufshcd_suspend_clkscaling(struct ufs_hba *hba)
 	if (!hba->clk_scaling.is_suspended) {
 		suspend = true;
 		hba->clk_scaling.is_suspended = true;
+		hba->clk_scaling.window_start_t = 0;
 	}
 	spin_unlock_irqrestore(hba->host->host_lock, flags);
 
 	if (suspend)
-		__ufshcd_suspend_clkscaling(hba);
+		devfreq_suspend_device(hba->devfreq);
 }
 
 static void ufshcd_resume_clkscaling(struct ufs_hba *hba)
-- 
2.18.0


