Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4877EEE49B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9B5gKjOEPiOOStjLAPxB+tM/isvMol7/cjHa3Fam3g=; b=1xzLxCtNyEgZpZ+AK+N/wxf0dc
	z/5Ajhb5DFbYpX1vIryLSdtqJ3uL6Xba9jr4aFLsGuyqQ1KxFpeUJnkYWeFPsd2BuOT0/CtZeAPAD
	HUtaQDfIs35IGdh/EWAR8kejpr305ZHe8SgoNUa0W2gBmouRSQ3uSoF7toqqNQeIYyqaBhpiZ1fBX
	IujE6GyDYn2HBF25Y7hFM31ewkjphix5u/Lkr5vtijIv9oAI/loVX2AIiV0O529LknGEW1YWS7MqS
	5B6RSDJwM3Kx1wD2Mg88/xtBJMefPNBPEO6n4s19GaNKprxPhcF0LOEFil3kLnImZEc5s28LBcv1N
	vtJwbAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkCp-00044Z-0n;
	Wed, 23 Aug 2023 09:31:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYkCl-00043T-2T
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Aug 2023 09:31:13 +0000
X-UUID: ba4e1d7a419711ee912e1518a6540028-20230823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=D9B5gKjOEPiOOStjLAPxB+tM/isvMol7/cjHa3Fam3g=;
	b=PuTy4LEPziZ5Kin4734GFpT+unRRbGd1A3S58E/gzIMeiCMfTtkiifKXFW/mT2dTmkYbbIFt8e75JTNtMmCr1KsPjNhrAFIaQ8yF/7C7Wb2MuXLzK2jyLlAxlcebHJfcYr1NWvs8uN55pX3eSfZ9FzB3MXtoUx3M8SwiZAwuBdw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:a2d3a79d-7323-4b90-b329-eac8669ab6a9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:c81a2fc2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ba4e1d7a419711ee912e1518a6540028-20230823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 779031735; Wed, 23 Aug 2023 02:30:41 -0700
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
Subject: [PATCH v1 3/3] ufs: core: fix abnormal scale up after scale down
Date: Wed, 23 Aug 2023 17:29:48 +0800
Message-ID: <20230823092948.22734-4-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230823092948.22734-1-peter.wang@mediatek.com>
References: <20230823092948.22734-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_023111_807068_111589EE 
X-CRM114-Status: GOOD (  11.41  )
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

When no active_reqs, devfreq_monitor(Thread A) will suspend clock scaling.
But it may have racing with clk_scaling.suspend_work(Thread B) and
actually not suspend clock scaling(requue after suspend).
Next time after polling_ms, devfreq_monitor read
clk_scaling.window_start_t = 0 then scale up clock abnormal.

Below is racing step:
	devfreq->work (Thread A)
	devfreq_monitor
		update_devfreq
		.....
			ufshcd_devfreq_target
			queue_work(hba->clk_scaling.workq,
1			   &hba->clk_scaling.suspend_work)
		.....
5	queue_delayed_work(devfreq_wq, &devfreq->work,
			msecs_to_jiffies(devfreq->profile->polling_ms));

2	hba->clk_scaling.suspend_work (Thread B)
	ufshcd_clk_scaling_suspend_work
		__ufshcd_suspend_clkscaling
			devfreq_suspend_device(hba->devfreq);
3				cancel_delayed_work_sync(&devfreq->work);
4			hba->clk_scaling.window_start_t = 0;
	.....

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 017f32b3a789..d3b913d389f4 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1431,6 +1431,13 @@ static int ufshcd_devfreq_target(struct device *dev,
 		return 0;
 	}
 
+	/* Skip scaling clock when clock scaling is suspended */
+	if (hba->clk_scaling.is_suspended) {
+		spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
+		dev_warn(hba->dev, "clock scaling is suspended, skip");
+		return 0;
+	}
+
 	if (!hba->clk_scaling.active_reqs)
 		sched_clk_scaling_suspend_work = true;
 
-- 
2.18.0


