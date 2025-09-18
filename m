Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40516CAC59A
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWBeRQFRAHGhBtLzpD8SDHSTn9exvx8PF7SkxuX7uUQ=; b=UEJfK7QzYis0WVhF5sbNAa9chc
	WEEGjwjrXANm4VLWl6cm3ysmw8Jjei5f3m/rs+0souDxu8iuxuslY9sR6i1+MaMl59ez4wiAwcAr6
	kB8Z6xC8mLfB0dqndYcoveaise0hX2Z6oIUVxDYDPpyy1dYX0g1vhwztULFMvJkGDhoRhxML1mvg6
	HgBM71GdU5FdrqtAJYVN9VFHja381Whj8lIzKCeISYQT9M3pgzuBhDbtQGrLPGrQABNjing+FOxWD
	bujFkHOjMVfW4fFJfHXAnxXuffvNcn5n8wbEQuwvIvnorPW5WVxXCg0KZjvwuxTz80WavqIwoUARO
	d7Z2D+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3p-0000000H7E6-0RBC;
	Thu, 18 Sep 2025 10:40:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3i-0000000H70g-2NXo
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 10:40:15 +0000
X-UUID: d99bdf26947b11f09f706fa2197c6ceb-20250918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NWBeRQFRAHGhBtLzpD8SDHSTn9exvx8PF7SkxuX7uUQ=;
	b=ehVLr41b6eow3oTIaiMcK9YQ0MoadhdICBb7ZfAQKF48j5jbdnpa/mHGJ7+ZkVP7BOnJwTyVCbwEaArwPRgRu9mUi5nC3jVmFqhWu33O93YZ6VqY7uCd2LyeUnKvHVjbnrvLG2GhqsqaUKPzJWffR89AJRCU4LnqmVyWwZuJ1/8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:5b5c1446-9370-46ec-af7d-d5c29e1189f0,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:1ca6b93,CLOUDID:67c170f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d99bdf26947b11f09f706fa2197c6ceb-20250918
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 410296838; Thu, 18 Sep 2025 03:40:10 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 18 Sep 2025 18:40:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 18 Sep 2025 18:40:03 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v1 08/10] ufs: host: mediatek: Remove duplicate function
Date: Thu, 18 Sep 2025 18:36:18 +0800
Message-ID: <20250918104000.208856-9-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250918104000.208856-1-peter.wang@mediatek.com>
References: <20250918104000.208856-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_034014_625013_2CD6B112 
X-CRM114-Status: GOOD (  12.63  )
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
index c56c85b55ba4..5aa42b8caa3b 100644
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
index 7df475ebd06d..27a88f0966ac 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1502,5 +1502,6 @@ int ufshcd_update_ee_control(struct ufs_hba *hba, u16 *mask,
 void ufshcd_force_error_recovery(struct ufs_hba *hba);
 void ufshcd_pm_qos_update(struct ufs_hba *hba, bool on);
 void ufshcd_enable_intr(struct ufs_hba *hba, u32 intrs);
+u32 ufshcd_us_to_ahit(unsigned int timer);
 
 #endif /* End of Header */
-- 
2.45.2


