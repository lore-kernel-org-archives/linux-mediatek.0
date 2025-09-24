Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA551CAC5A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEtB/jeXGm36SGW9vystyOKcTh+yx2yGuulGhP8QtBc=; b=SwnI+nQoAw9Au7DJ/cbTnluJFR
	1o2k+8rHw7uzgbah3QYcCLdN7rYHrDYl+DHU5BCavlr62u0fDTgJ9C2NIay7x4fzRu/yEFqvwt9j+
	Kmld8kn2n2UOdkR7Kinoo9T99OkadcSYsOqzax/vniwIZFl2qStNu8tTFk8Z4YVI8ozv1IwZETy4T
	3o1fbXkLcHvIImwVvYCcawZqP5mdK5zd7Gac/sdROToBlI8Yes3RZTpWnFSigEzM9QRN0/MuNu8wO
	j1Oc7UucIuTUM+7katRm2RuYyUUHHsDgMAOZfYBH4eh3ayMvdbWpLOVkf0AbPTPBxm2XfBNyO/F2F
	UKMknbRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M4L-0000000GB05-1tJg;
	Wed, 24 Sep 2025 09:45:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M4D-0000000GAoB-012I
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 09:45:43 +0000
X-UUID: 37a6f296992b11f09f706fa2197c6ceb-20250924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PEtB/jeXGm36SGW9vystyOKcTh+yx2yGuulGhP8QtBc=;
	b=gcxZM7jICqzQObbMB/R41yV/krgDu4XDdnDI7O+CxFUFTxtxCO9f83XlDtJ7wPRkFtHeRIS8SD5X4kmLbeDMO5U1OzKHF5cZJO/HmsPP1kLcTc1PYPiG/ZJUdDowdOSC2AGhpbV0NKyzOgVyPKkwUlQZazNChivsYk8fOfZ9a2k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:bb0a3d91-0e08-4c63-ba39-e2d7d67f4990,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:1ca6b93,CLOUDID:d6dca3f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 37a6f296992b11f09f706fa2197c6ceb-20250924
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1253034565; Wed, 24 Sep 2025 02:45:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 24 Sep 2025 17:45:29 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 24 Sep 2025 17:45:29 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v2 6/8] ufs: host: mediatek: Remove duplicate function
Date: Wed, 24 Sep 2025 17:43:28 +0800
Message-ID: <20250924094527.2992256-7-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250924094527.2992256-1-peter.wang@mediatek.com>
References: <20250924094527.2992256-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024541_135624_DCEDE06C 
X-CRM114-Status: GOOD (  13.27  )
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

Remove the duplicate ufs_mtk_us_to_ahit function in the UFS
Mediatek driver and export the existing ufshcd_us_to_ahit
function for shared use. This change reduces redundancy
and maintains consistency across the codebase.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/ufs/core/ufs-sysfs.c    |  3 ++-
 drivers/ufs/host/ufs-mediatek.c | 14 +-------------
 include/ufs/ufshcd.h            |  1 +
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
index 4bd7d491e3c5..0fb236ce7f4c 100644
--- a/drivers/ufs/core/ufs-sysfs.c
+++ b/drivers/ufs/core/ufs-sysfs.c
@@ -235,7 +235,7 @@ static int ufshcd_ahit_to_us(u32 ahit)
 }
 
 /* Convert microseconds to Auto-Hibernate Idle Timer register value */
-static u32 ufshcd_us_to_ahit(unsigned int timer)
+u32 ufshcd_us_to_ahit(unsigned int timer)
 {
 	unsigned int scale;
 
@@ -245,6 +245,7 @@ static u32 ufshcd_us_to_ahit(unsigned int timer)
 	return FIELD_PREP(UFSHCI_AHIBERN8_TIMER_MASK, timer) |
 	       FIELD_PREP(UFSHCI_AHIBERN8_SCALE_MASK, scale);
 }
+EXPORT_SYMBOL_GPL(ufshcd_us_to_ahit);
 
 static int ufshcd_read_hci_reg(struct ufs_hba *hba, u32 *val, unsigned int reg)
 {
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index c00e62adbbda..3e54154d5547 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1109,18 +1109,6 @@ static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
 	}
 }
 
-/* Convert microseconds to Auto-Hibernate Idle Timer register value */
-static u32 ufs_mtk_us_to_ahit(unsigned int timer)
-{
-	unsigned int scale;
-
-	for (scale = 0; timer > UFSHCI_AHIBERN8_TIMER_MASK; ++scale)
-		timer /= UFSHCI_AHIBERN8_SCALE_FACTOR;
-
-	return FIELD_PREP(UFSHCI_AHIBERN8_TIMER_MASK, timer) |
-	       FIELD_PREP(UFSHCI_AHIBERN8_SCALE_MASK, scale);
-}
-
 static void ufs_mtk_fix_ahit(struct ufs_hba *hba)
 {
 	unsigned int us;
@@ -1143,7 +1131,7 @@ static void ufs_mtk_fix_ahit(struct ufs_hba *hba)
 			break;
 		}
 
-		hba->ahit = ufs_mtk_us_to_ahit(us);
+		hba->ahit = ufshcd_us_to_ahit(us);
 	}
 
 	ufs_mtk_setup_clk_gating(hba);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 53b837b024ce..ff0143502413 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1484,5 +1484,6 @@ int ufshcd_update_ee_control(struct ufs_hba *hba, u16 *mask,
 			     const u16 *other_mask, u16 set, u16 clr);
 void ufshcd_force_error_recovery(struct ufs_hba *hba);
 void ufshcd_pm_qos_update(struct ufs_hba *hba, bool on);
+u32 ufshcd_us_to_ahit(unsigned int timer);
 
 #endif /* End of Header */
-- 
2.45.2


