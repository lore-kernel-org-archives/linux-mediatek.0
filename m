Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212FAEE49A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSg2e73VclKyIcN/NYbriQbZxkef6F8tmT/HnNPPCUk=; b=EuRy86fLJk2zCUdTiEAAg4w9G7
	BVgfz3rvQatsKajxlUvoYwht1RlsxiOxq7XQhhu5ZeTWJX6S3z6/XZd3wXkf6i++LVQGWh+DzonIm
	aagpmiQVrZ2zqYdOL1uHa5/kFhdR/D4aUoOmsRM3zi88xCQMQJFsCCFuJbxZKEWcaXZMqAGWqCnIR
	O+LQzoGYhq0b01aEOehPFo52ii3aMmpOOsKWir3gB6Ptp+H5Rz4FCZGwnXRnf5NBLyGxvdsBfa8yH
	1bX348VWi+oUxAfzsFll8g6EXfIFMj0SzyQ7yiygN51ihq6m3OYRVk+QtzmN/9tBCqsNlxqlRhkTw
	YTvZgkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkCn-00044I-2p;
	Wed, 23 Aug 2023 09:31:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkCk-000435-2Z
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 09:31:12 +0000
X-UUID: b9171452419711ee912e1518a6540028-20230823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GSg2e73VclKyIcN/NYbriQbZxkef6F8tmT/HnNPPCUk=;
	b=AZxuVmDyMJax7/izRGWTWzPW09wIdqJshdGOfJRNH6NoutMCINOmG3qHNdy6BZ2IS8mHMk9kWhXT75S5S2L/lcHqa/9zuyq3xJUKogvnDGQl+iqBXpGihZkmrrg8AxFZNd7vZp+4vbsYZqG+N4D3Ga0N5XOA+3ASfmG1l+HPrsE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:4e2d39ee-1cc8-4131-b183-7f561e4ef656,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:c11a2fc2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b9171452419711ee912e1518a6540028-20230823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1308922298; Wed, 23 Aug 2023 02:30:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Aug 2023 17:29:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Aug 2023 17:29:50 +0800
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
Subject: [PATCH v1 2/3] ufs: core: fix abnormal scale up after last cmd finish
Date: Wed, 23 Aug 2023 17:29:47 +0800
Message-ID: <20230823092948.22734-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230823092948.22734-1-peter.wang@mediatek.com>
References: <20230823092948.22734-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_023110_839854_DFB6E26F 
X-CRM114-Status: GOOD (  10.12  )
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
 drivers/ufs/core/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index e3672e55efae..017f32b3a789 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1385,9 +1385,10 @@ static void ufshcd_clk_scaling_suspend_work(struct work_struct *work)
 		return;
 	}
 	hba->clk_scaling.is_suspended = true;
+	hba->clk_scaling.window_start_t = 0;
 	spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
 
-	__ufshcd_suspend_clkscaling(hba);
+	devfreq_suspend_device(hba->devfreq);
 }
 
 static void ufshcd_clk_scaling_resume_work(struct work_struct *work)
-- 
2.18.0


