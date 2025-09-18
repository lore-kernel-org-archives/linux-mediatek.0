Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011E6CAC5AE
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndr++jp+26DFR/R5ApsAQ+s693GcWtCYReKXOnDLZQM=; b=hhjzSxtUKSytZnUNXAR46LYK/V
	8Mz+wzx0ISIFRF44DOEadUW8EJMmIe6BBniCHo8nKn4HX64IOReTMOQD4dHYQcAvgYZ+NWE8MLnD+
	+wGGGBdKt7agg1hiT3qEPcwp9uHjs2QDLlZdMhP0Fw+Fxvky/EawVUYxrsqGMcs/H+wkH7Y7ZTqFh
	YbhVDNTlaEjBmeafb/3fHi45h4vsqGZP4aujAzVvdFvcWHN5jTiTVAGi62HYNuPzxT2zaQRFmlt9H
	BOhXtYkBYwSJj3WxTAosW4qraOSQR4ozIHgRD4x+rqJDmFiWl47R4HBo7fDK735qW+jGtaMXlWQhG
	gtXjtTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3m-0000000H7AC-0C0y;
	Thu, 18 Sep 2025 10:40:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3i-0000000H75s-1PCW
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 10:40:15 +0000
X-UUID: da517ad4947b11f09f706fa2197c6ceb-20250918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ndr++jp+26DFR/R5ApsAQ+s693GcWtCYReKXOnDLZQM=;
	b=lFUrvZNqscQypiiCJPuxWrFrJ8uU8C102qTdtexMrDgIuHnRKUkxYnZeGuga9tWnlnGFph4C8HAyxdFPUrNZif91PmnqDBxJkV6QUKeQmO8nYgaFat6m9B2A9X6SufYx4GxoinXN5Pnnh2JLoRZ8N1/XIs1Bv/g8o7BCQgHNBlU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:762a6014-2b99-47b9-bfc9-922f61e08476,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:64c170f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: da517ad4947b11f09f706fa2197c6ceb-20250918
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 808409367; Thu, 18 Sep 2025 03:40:11 -0700
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
Subject: [PATCH v1 10/10] ufs: host: mediatek: Support new feature for MT6991
Date: Thu, 18 Sep 2025 18:36:20 +0800
Message-ID: <20250918104000.208856-11-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250918104000.208856-1-peter.wang@mediatek.com>
References: <20250918104000.208856-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_034014_386651_1E978141 
X-CRM114-Status: GOOD (  10.86  )
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

From: Naomi Chu <naomi.chu@mediatek.com>

Add support for the MT6991 platform by enabling MRTT settings
and random performance improvements. These enhancements aim
to optimize performance and efficiency on the MT6991 hardware.

Enable multi-Round Trip Time (MRTT) for improved data handling.
Enable random performance improvement features to boost
overall system responsiveness.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Naomi Chu <naomi.chu@mediatek.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 6 ++++++
 drivers/ufs/host/ufs-mediatek.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 0cc372e0ac75..f62f08cdfcbc 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -289,6 +289,12 @@ static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 				0x453000, REG_UFS_MMIO_OPT_CTRL_0);
 		}
 
+		if (host->ip_ver >= IP_VER_MT6991_A0) {
+			/* Enable multi-rtt */
+			ufshcd_rmwl(hba, MRTT_EN, MRTT_EN, REG_UFS_MMIO_OPT_CTRL_0);
+			/* Enable random performance improvement */
+			ufshcd_rmwl(hba, RDN_PFM_IMPV_DIS, 0, REG_UFS_MMIO_OPT_CTRL_0);
+		}
 	}
 
 	return 0;
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 32687dd12527..db9f21ef481c 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -23,6 +23,9 @@
 #define MCQ_MULTI_INTR_EN       BIT(2)
 #define MCQ_CMB_INTR_EN         BIT(3)
 #define MCQ_AH8                 BIT(4)
+#define MON_EN                  BIT(5)
+#define MRTT_EN                 BIT(25)
+#define RDN_PFM_IMPV_DIS        BIT(28)
 
 #define MCQ_INTR_EN_MSK         (MCQ_MULTI_INTR_EN | MCQ_CMB_INTR_EN)
 
-- 
2.45.2


