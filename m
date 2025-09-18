Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085F6CAC5A8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLaU06h1GKMNAiOkoLHMFT9Embuo7qYZ2D2vfkwmpWg=; b=3NtllFZNdaTt/HmVurKSPE4IHK
	xyPhPt5rXA7W7ABy08Y33nLuz7aZPZjphV5qpAKLwr8MDam2HLv/ABeQ6wlF8ZjUlbrGM/cS1wS+M
	uoyDCCgTjnPz8FDSs6KPwt8CuWPG+W+AitBD9gl//KhVOCa/GBbW9JNJt1GA7/S4k20kDxun3219n
	Y8mk+uVFGUMHOtu/LCux3tLHkLmi2detXVmgfLT8hlrcFAhZE7fZM51fhGSh73yH71EhJD+BMROD5
	UVnN/ETa8ixx3NqNH6341WCLO0dhg3hr/D5FQ7ieZlMYJRdHpUBEbABM/bWiWQZRf8+8CGPfMpyyf
	ZRP3gnNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3i-0000000H75i-0dyH;
	Thu, 18 Sep 2025 10:40:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3f-0000000H72I-1GBf
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 10:40:12 +0000
X-UUID: d82fcc88947b11f09f706fa2197c6ceb-20250918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dLaU06h1GKMNAiOkoLHMFT9Embuo7qYZ2D2vfkwmpWg=;
	b=pN2o8eZSz1lD8oV26XnAJ9BItdab1SWVrWolFBiCSme1sz3yGRMr8BkFYjrkhZJf8FKxyUHrXkYRmAzMDsvMn9vi5ZDbI4Hy8j7azjfBBDkVZ9lnm52s+jol7wVYHrlSYDyOwu7UQ9F2LnoALnjOn1jWPRU4Jk9xC4tdXDQBaZc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:945d7c13-aa44-44d9-9d00-94786cffac73,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:abfded84-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d82fcc88947b11f09f706fa2197c6ceb-20250918
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1377961408; Thu, 18 Sep 2025 03:40:07 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 18 Sep 2025 18:40:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 18 Sep 2025 18:40:02 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v1 04/10] ufs: host: mediatek: Handle clock scaling for high gear in PM flow
Date: Thu, 18 Sep 2025 18:36:14 +0800
Message-ID: <20250918104000.208856-5-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250918104000.208856-1-peter.wang@mediatek.com>
References: <20250918104000.208856-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_034011_343621_BF70AA8B 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

Add clock scaling down for power management flow in the UFS
Mediatek driver. If clock scaling is disabled and fixed in
high gear, ensure the clock scales down during suspend and
scales up again after resume to support high gear.
This adjustment maintains proper power management.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index f445bc720a5e..d9026a9afe17 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1784,6 +1784,9 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
 	if (ufshcd_is_clkscaling_supported(hba) && (host->clk_scale_up)) {
 		ufshcd_pm_qos_update(hba, false);
 		_ufs_mtk_clk_scale(hba, false);
+	} else if ((!ufshcd_is_clkscaling_supported(hba) &&
+		    hba->pwr_info.gear_rx >= UFS_HS_G5)) {
+		_ufs_mtk_clk_scale(hba, false);
 	}
 
 	return 0;
@@ -1816,6 +1819,9 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	if (ufshcd_is_clkscaling_supported(hba) && (host->clk_scale_up)) {
 		ufshcd_pm_qos_update(hba, true);
 		_ufs_mtk_clk_scale(hba, true);
+	} else if ((!ufshcd_is_clkscaling_supported(hba) &&
+		    hba->pwr_info.gear_rx >= UFS_HS_G5)) {
+		_ufs_mtk_clk_scale(hba, true);
 	}
 
 	if (ufshcd_is_link_hibern8(hba)) {
-- 
2.45.2


