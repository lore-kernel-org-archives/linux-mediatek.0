Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EDDD44171
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2024 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HtWbveE8HR0QV6YE5r/k4BhXZ/k8t/AZvqKgT84aTvA=; b=ugaPWrTyXxcGnMIgYipGLTA8Vu
	U39UHWs6fXtNuJRCDYZ+OtZBKuUbKl97o9BGk7nJbz/zSAKURaknHzG9Ae+17dGNe6n0fxdkd2len
	7bSrblluY/PUhXUJ4GxMPszrnWQHTPBt0afVlXcuoNKqDWEm5d2khPfpcBWHa7Dwf3LBYn1Q8OVYk
	nHzioJGSlwEFA6On3AdO0XSm7x0AnYeJwhz9R4hHJane46E2DLhDE+tsIQsB/waQhkx7Nyw6lXur9
	6SVzfixgBCMeUMuzaISBAL/CDTf1KhF9sLb7T2486PsfqiYS7HxRwYZISNE/LGrcFtjfG3eYaMOPR
	aYNPTqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhVY-0000000EzbH-2aPc;
	Wed, 20 Nov 2024 10:00:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhQm-0000000EyhX-0ajO
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Nov 2024 09:55:29 +0000
X-UUID: 8eae2008a72511ef9048ed6ed365623b-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HtWbveE8HR0QV6YE5r/k4BhXZ/k8t/AZvqKgT84aTvA=;
	b=eqaYBbIgj+osh7jfaEzUX1bI65BqBplxML4250w9mYcebWjS5jHlu1FGLWYfV/Cmss2LFlZ5iM9+Qmhw0uc5TuIueN/lhd6WNdqGuToMlN558fSYZcaSYK/+7oZ9ePPvjVhvtNMwCe3vXe3EFBOwm7ldrc3ERbmxhkyyVcDSjuM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:6594bdc9-12f1-4076-a003-e29b50f14b80,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:464815b,CLOUDID:a32b84a0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8eae2008a72511ef9048ed6ed365623b-20241120
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 22108765; Wed, 20 Nov 2024 02:55:22 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 01:55:19 -0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 17:55:19 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>,
	<draviv@codeaurora.org>, <stable@vger.kernel.org>
Subject: [PATCH v1] ufs: core: add missing post notify for power mode change
Date: Wed, 20 Nov 2024 17:55:18 +0800
Message-ID: <20241120095518.23690-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_015528_187439_7EAA7688 
X-CRM114-Status: GOOD (  12.42  )
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

When the power mode change is successful but the power mode
hasn't actually changed, the post notification was missed.
Similar to the approach with hibernate/clock scale/hce enable,
having pre/post notifications in the same function will
make it easier to maintain.

Fixes: 7eb584db73be ("ufs: refactor configuring power mode")
Cc: stable@vger.kernel.org #6.11.x
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index abbe7135a977..814402e93a1e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -4651,9 +4651,6 @@ static int ufshcd_change_power_mode(struct ufs_hba *hba,
 		dev_err(hba->dev,
 			"%s: power mode change failed %d\n", __func__, ret);
 	} else {
-		ufshcd_vops_pwr_change_notify(hba, POST_CHANGE, NULL,
-								pwr_mode);
-
 		memcpy(&hba->pwr_info, pwr_mode,
 			sizeof(struct ufs_pa_layer_attr));
 	}
@@ -4682,6 +4679,10 @@ int ufshcd_config_pwr_mode(struct ufs_hba *hba,
 
 	ret = ufshcd_change_power_mode(hba, &final_params);
 
+	if (!ret)
+		ufshcd_vops_pwr_change_notify(hba, POST_CHANGE, NULL,
+					&final_params);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(ufshcd_config_pwr_mode);
-- 
2.18.0


