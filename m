Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AB8C87FC8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jul 2025 10:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNDYjuNCpy3sI2xuHA1ztVuzRIYbl3OZCMKwHJY3wNM=; b=zycDjVXCq2PNUOuI20H/GwWXqc
	+DNKZTQjqAkbEnSkCLlXEeV3+m6RoQKtqfBFJcJrW+2pmuHZOlQ7xXRErqMeXZuJSbtAGKeSJSsr0
	GInNPrnkZIz7QAmSfyiItaMz8y6zvdPWjhwHHYxzHRkc6AKJF348vZw1PNt1HfSXZ665UeDhq/KRK
	asCCqG94e5ahCDGmGzt2+df0Xpwzzr5S0iirtFxUcMJT7adZZkiAlgYqjx/OXHc+FfOXTp3X1pze5
	DJGKkVDiYzYlu9je/ceXq33l2bMxHTfSV2esxChYK2V552h0giTTpruq60/ALPU8ZNbx0xEr8qQ1F
	Nzqd1mOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uciQI-0000000CJOt-2zNJ;
	Fri, 18 Jul 2025 10:34:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uchoc-0000000CFEE-1hBq
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Jul 2025 09:55:43 +0000
X-UUID: 582e62e063bd11f09f706fa2197c6ceb-20250718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vNDYjuNCpy3sI2xuHA1ztVuzRIYbl3OZCMKwHJY3wNM=;
	b=YVYAeEN/V8FSwWCfNQwBI6VrBirvNAuJvULg3I247gn3Cg2eXLVoy8OfX1xTUoCzH5Izn+0IhsDFrtXGBIfSD1qGw0Lvjf3bnFZKMVexhtZUuYuqaVmXOlHzPfCzeC4YIeiysb03sjDCHOLUwUUBvrOD76si9eaqH4Yndy//NAA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:696d101b-dba2-49d7-9ab8-7673cdda22c6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:f3de9584-a7ec-4748-8ac1-dca5703e241f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 582e62e063bd11f09f706fa2197c6ceb-20250718
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 849884829; Fri, 18 Jul 2025 02:55:32 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Jul 2025 17:55:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Jul 2025 17:55:27 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v2 6/9] ufs: host: mediatek: Add more UFSCHI hardware versions
Date: Fri, 18 Jul 2025 17:51:49 +0800
Message-ID: <20250718095524.682599-7-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250718095524.682599-1-peter.wang@mediatek.com>
References: <20250718095524.682599-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_025542_443184_606BA677 
X-CRM114-Status: GOOD (  18.04  )
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

From: Alice Chao <alice.chao@mediatek.com>

This patch introduces a function for version control to distinguish
between new and old platforms. It updates the handling of hardware
IP versions, ensuring correct version comparisons by adjusting the
version format for specific projects.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Alice Chao <alice.chao@mediatek.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 47 ++++++++++++++++++++++++++++++++-
 drivers/ufs/host/ufs-mediatek.h | 12 +++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index cb7f15f6d422..0e5859bdd919 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -838,6 +838,51 @@ static void ufs_mtk_mcq_set_irq_affinity(struct ufs_hba *hba, unsigned int cpu)
 	dev_info(hba->dev, "set irq %d affinity to CPU: %d\n", irq, _cpu);
 }
 
+static bool ufs_mtk_is_legacy_chipset(struct ufs_hba *hba, u32 hw_ip_ver)
+{
+	bool is_legacy = false;
+
+	switch (hw_ip_ver) {
+	case IP_LEGACY_VER_MT6893:
+	case IP_LEGACY_VER_MT6781:
+		/* can add other legacy chipset ID here accordingly */
+		is_legacy = true;
+		break;
+	default:
+		break;
+	}
+	dev_info(hba->dev, "legacy IP version - 0x%x, is legacy : %d", hw_ip_ver, is_legacy);
+
+	return is_legacy;
+}
+
+/*
+ * HW version format has been changed from 01MMmmmm to 1MMMmmmm, since
+ * project MT6878. In order to perform correct version comparison,
+ * version number is changed by SW for the following projects.
+ * IP_VER_MT6983	0x00360000 to 0x10360000
+ * IP_VER_MT6897	0x01440000 to 0x10440000
+ * IP_VER_MT6989	0x01450000 to 0x10450000
+ * IP_VER_MT6991	0x01460000 to 0x10460000
+ */
+static void ufs_mtk_get_hw_ip_version(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	u32 hw_ip_ver;
+
+	hw_ip_ver = ufshcd_readl(hba, REG_UFS_MTK_IP_VER);
+
+	if (((hw_ip_ver & (0xFF << 24)) == (0x1 << 24)) ||
+	    ((hw_ip_ver & (0xFF << 24)) == 0)) {
+		hw_ip_ver &= ~(0xFF << 24);
+		hw_ip_ver |= (0x1 << 28);
+	}
+
+	host->ip_ver = hw_ip_ver;
+
+	host->legacy_ip_ver = ufs_mtk_is_legacy_chipset(hba, hw_ip_ver);
+}
+
 static void ufs_mtk_get_controller_version(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -1112,7 +1157,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	ufs_mtk_setup_clocks(hba, true, POST_CHANGE);
 
-	host->ip_ver = ufshcd_readl(hba, REG_UFS_MTK_IP_VER);
+	ufs_mtk_get_hw_ip_version(hba);
 
 	goto out;
 
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index d78c68676274..ba93ef7588c3 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -181,6 +181,7 @@ struct ufs_mtk_host {
 	u16 ref_clk_ungating_wait_us;
 	u16 ref_clk_gating_wait_us;
 	u32 ip_ver;
+	bool legacy_ip_ver;
 
 	bool mcq_set_intr;
 	bool is_mcq_intr_enabled;
@@ -197,13 +198,24 @@ struct ufs_mtk_host {
 /* UFSHCI MTK ip version value */
 enum {
 	/* UFS 3.1 */
+	IP_VER_MT6983    = 0x10360000,
 	IP_VER_MT6878    = 0x10420200,
 
 	/* UFS 4.0 */
 	IP_VER_MT6897    = 0x10440000,
 	IP_VER_MT6989    = 0x10450000,
+	IP_VER_MT6899    = 0x10450100,
+	IP_VER_MT6991_A0 = 0x10460000,
+	IP_VER_MT6991_B0 = 0x10470000,
+	IP_VER_MT6993    = 0x10480000,
 
 	IP_VER_NONE      = 0xFFFFFFFF
 };
 
+enum ip_ver_legacy {
+	IP_LEGACY_VER_MT6781 = 0x10380000,
+	IP_LEGACY_VER_MT6879 = 0x10360000,
+	IP_LEGACY_VER_MT6893 = 0x20160706
+};
+
 #endif /* !_UFS_MEDIATEK_H */
-- 
2.45.2


