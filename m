Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70269C87FC3
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcOjwtMlG2/ZE27D7DchzNbeN5aQFbstlowGPrCW6Gs=; b=SVM63OoVq4psjpL53fyeO9UQt4
	i3fQMFZ+yYxqI/85E6kIH0w6PPLeJN+gtkATGDCsTGztHzNjl9Z+a+2OhT3DUAjLDkv4tZEFFOEqW
	IcPMyfNzMO0XJXv3m5qTSLbOV8zNnrYV7ig2rOKvjinh9Ra5Ue5k4F4x3WcpjAfLxX0aaRp1hID80
	cfRC9hyCH4SyLR01Ud9N1oNmjy4+ADsADCH73eL3g8rLYY0CKX1529GFONzqkzjj0CTuBoB8LNB6+
	mVEogOUVHr2Bz6IQlki1Q8qj4iX48XHLpIUqvBL2gWG/soPeAtPo6KEupjl6n3+w5adyVh+000JNT
	soxZCZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciQG-0000000CJKu-07wt;
	Fri, 18 Jul 2025 10:34:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchoW-0000000CFAp-1hik
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Jul 2025 09:55:37 +0000
X-UUID: 56c286de63bd11f09f706fa2197c6ceb-20250718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rcOjwtMlG2/ZE27D7DchzNbeN5aQFbstlowGPrCW6Gs=;
	b=fSWFkQLHoAWXKxQEiPou0Qf60VcLObr4UkLshByhxpC4TUrR4wRMBwV8/HGgXo80/5PVKVk9YNYTDUy4va0lLJ9OLsHf3gZyLoEJqCEfe/D0jvfYdGmB/iC4NJkKuU8Mb3gV2fv//8Phbwkl2cJmow4cIuMcyrlZBQIgElqTVOI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:e212c203-0832-4b88-8420-c58fe5edf647,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:ddde9584-a7ec-4748-8ac1-dca5703e241f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 56c286de63bd11f09f706fa2197c6ceb-20250718
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 797037311; Fri, 18 Jul 2025 02:55:30 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Jul 2025 17:55:26 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Jul 2025 17:55:26 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v2 2/9] ufs: host: mediatek: Add DDR_EN setting
Date: Fri, 18 Jul 2025 17:51:45 +0800
Message-ID: <20250718095524.682599-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250718095524.682599-1-peter.wang@mediatek.com>
References: <20250718095524.682599-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_025536_448834_DA9BB207 
X-CRM114-Status: GOOD (  11.97  )
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

On MT6989 and later platforms, control of DDR_EN has been switched from
SPM to EMI. To prevent abnormal access to DRAM, it is necessary to wait
for 'ddren_ack' or assert 'ddren_urgent' after sending 'ddren_req'.

This patch introduces the DDR_EN configuration in the UFS initialization
flow, utilizing the assertion of 'ddren_urgent' to maintain performance.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Naomi Chu <naomi.chu@mediatek.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c |  7 +++++++
 drivers/ufs/host/ufs-mediatek.h | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 14f0130da653..53702e74947a 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -267,6 +267,13 @@ static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 		ufshcd_writel(hba,
 			      ufshcd_readl(hba, REG_UFS_XOUFS_CTRL) | 0x80,
 			      REG_UFS_XOUFS_CTRL);
+
+		/* DDR_EN setting */
+		if (host->ip_ver >= IP_VER_MT6989) {
+			ufshcd_rmwl(hba, UFS_MASK(0x7FFF, 8),
+				0x453000, REG_UFS_MMIO_OPT_CTRL_0);
+		}
+
 	}
 
 	return 0;
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 05d76a6bd772..474fdec0a880 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -192,4 +192,16 @@ struct ufs_mtk_host {
 /* MTK RTT support number */
 #define MTK_MAX_NUM_RTT 2
 
+/* UFSHCI MTK ip version value */
+enum {
+	/* UFS 3.1 */
+	IP_VER_MT6878    = 0x10420200,
+
+	/* UFS 4.0 */
+	IP_VER_MT6897    = 0x10440000,
+	IP_VER_MT6989    = 0x10450000,
+
+	IP_VER_NONE      = 0xFFFFFFFF
+};
+
 #endif /* !_UFS_MEDIATEK_H */
-- 
2.45.2


