Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A33CAC5B6
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si3j8d5cgVjUsmGkTpHa4AhEh9vW1KoViw9giBVSot4=; b=0QZ0yBa0lYYVIxOlxuV97m1LTs
	PbF/UYZm2KhLUPIWsuylnVc2ku45oP2wsWtEDx8nFgeLsOKFOpnZRHl2cYWTQaidor0k4Cc+ptAwl
	xMjtZKJsopA1aZVp6Ts3xGO/mQd0F0C9k2kmKN/fmKFVRe+eOgf1AD6PRGzRYxj7bHVFWM0ZiQDfV
	s1TcQrPCKkYykhnTBQpgDpla6fBVMz7I7LEHlKdyGL8vilxAv0+bqP+QcTHqrtoQfy6jgvuSdbQ75
	9DOlLpw+ozx4a3xe5jYOUFMb/9+meTVrhGtUaBBsiXdOsrHrysvmGFXsD3+OWx20aQW6O9gy2wD/4
	LXalFFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M4G-0000000GAtA-0wYi;
	Wed, 24 Sep 2025 09:45:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M4B-0000000GAmB-3mWE
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 09:45:41 +0000
X-UUID: 3681b388992b11f09f706fa2197c6ceb-20250924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=si3j8d5cgVjUsmGkTpHa4AhEh9vW1KoViw9giBVSot4=;
	b=VBgJEDz8QI7FqPP/L6rGDF3YqOvy3UjARIN0sgC2apd+0C79ds/Hpgts7cYTpvtvCdvRLT9TRkMsycu+PBmNebb3YjUqTxLAUbqvmB5lPBnOnKfD58N2JbLxtK7lXB/QwMepxBCjRSvIPF3NzykN3ufAd6Fof6ESZymkta9CzNs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:1de3df9f-e0ac-42c7-b007-e63bd117aa3e,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:1ca6b93,CLOUDID:103ce56c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3681b388992b11f09f706fa2197c6ceb-20250924
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 754949028; Wed, 24 Sep 2025 02:45:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
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
Subject: [PATCH v2 7/8] ufs: host: mediatek: Add support for new platform with MMIO_OTSD_CTR
Date: Wed, 24 Sep 2025 17:43:29 +0800
Message-ID: <20250924094527.2992256-8-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250924094527.2992256-1-peter.wang@mediatek.com>
References: <20250924094527.2992256-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024540_007103_956D61EC 
X-CRM114-Status: GOOD (  19.71  )
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

Introduce support for a new UFS Mediatek platform by adding
the REG_UFS_UFS_MMIO_OTSD_CTRL register. This update includes
checks for legacy platforms and uses the new register to
replace debug selection and handle specific operations.
The changes ensure compatibility across different hardware
versions and prevent potential issues with debug usage on
newer platforms.

Additional updates include error logging improvements
during link setup for newer and legacy platforms, ensuring
proper event logging and debugging.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 42 +++++++++++++++++++++++++++------
 drivers/ufs/host/ufs-mediatek.h |  1 +
 2 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 3e54154d5547..8498e95e263a 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -280,6 +280,9 @@ static int ufs_mtk_hce_enable_notify(struct ufs_hba *hba,
 			      ufshcd_readl(hba, REG_UFS_XOUFS_CTRL) | 0x80,
 			      REG_UFS_XOUFS_CTRL);
 
+		if (host->legacy_ip_ver)
+			return 0;
+
 		/* DDR_EN setting */
 		if (host->ip_ver >= IP_VER_MT6989) {
 			ufshcd_rmwl(hba, UFS_MASK(0x7FFF, 8),
@@ -405,7 +408,7 @@ static void ufs_mtk_dbg_sel(struct ufs_hba *hba)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
-	if (((host->ip_ver >> 16) & 0xFF) >= 0x36) {
+	if (!host->legacy_ip_ver && host->ip_ver >= IP_VER_MT6983) {
 		ufshcd_writel(hba, 0x820820, REG_UFS_DEBUG_SEL);
 		ufshcd_writel(hba, 0x0, REG_UFS_DEBUG_SEL_B0);
 		ufshcd_writel(hba, 0x55555555, REG_UFS_DEBUG_SEL_B1);
@@ -422,6 +425,7 @@ static int ufs_mtk_wait_idle_state(struct ufs_hba *hba,
 	u64 timeout, time_checked;
 	u32 val, sm;
 	bool wait_idle;
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	/* cannot use plain ktime_get() in suspend */
 	timeout = ktime_get_mono_fast_ns() + retry_ms * 1000000UL;
@@ -432,8 +436,13 @@ static int ufs_mtk_wait_idle_state(struct ufs_hba *hba,
 
 	do {
 		time_checked = ktime_get_mono_fast_ns();
-		ufs_mtk_dbg_sel(hba);
-		val = ufshcd_readl(hba, REG_UFS_PROBE);
+		if (host->legacy_ip_ver || host->ip_ver < IP_VER_MT6899) {
+			ufs_mtk_dbg_sel(hba);
+			val = ufshcd_readl(hba, REG_UFS_PROBE);
+		} else {
+			val = ufshcd_readl(hba, REG_UFS_UFS_MMIO_OTSD_CTRL);
+			val = val >> 16;
+		}
 
 		sm = val & 0x1f;
 
@@ -465,13 +474,20 @@ static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
 {
 	ktime_t timeout, time_checked;
 	u32 val;
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	timeout = ktime_add_ms(ktime_get(), max_wait_ms);
 	do {
 		time_checked = ktime_get();
-		ufs_mtk_dbg_sel(hba);
-		val = ufshcd_readl(hba, REG_UFS_PROBE);
-		val = val >> 28;
+
+		if (host->legacy_ip_ver || host->ip_ver < IP_VER_MT6899) {
+			ufs_mtk_dbg_sel(hba);
+			val = ufshcd_readl(hba, REG_UFS_PROBE);
+			val = val >> 28;
+		} else {
+			val = ufshcd_readl(hba, REG_UFS_UFS_MMIO_OTSD_CTRL);
+			val = val >> 24;
+		}
 
 		if (val == state)
 			return 0;
@@ -1639,14 +1655,26 @@ static int ufs_mtk_device_reset(struct ufs_hba *hba)
 static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 {
 	int err;
+	u32 val;
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
 
 	err = ufshcd_hba_enable(hba);
 	if (err)
 		return err;
 
 	err = ufs_mtk_unipro_set_lpm(hba, false);
-	if (err)
+	if (err) {
+		if (host->ip_ver < IP_VER_MT6899) {
+			ufs_mtk_dbg_sel(hba);
+			val = ufshcd_readl(hba, REG_UFS_PROBE);
+		} else {
+			val = ufshcd_readl(hba, REG_UFS_UFS_MMIO_OTSD_CTRL);
+		}
+		ufshcd_update_evt_hist(hba, UFS_EVT_RESUME_ERR, (u32)val);
+		val = ufshcd_readl(hba, REG_INTERRUPT_STATUS);
+		ufshcd_update_evt_hist(hba, UFS_EVT_RESUME_ERR, (u32)val);
 		return err;
+	}
 
 	err = ufshcd_uic_hibern8_exit(hba);
 	if (err)
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index dfbf78bd8664..f96fd032371d 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -28,6 +28,7 @@
  */
 #define REG_UFS_XOUFS_CTRL          0x140
 #define REG_UFS_REFCLK_CTRL         0x144
+#define REG_UFS_UFS_MMIO_OTSD_CTRL  0x14C
 #define REG_UFS_MMIO_OPT_CTRL_0     0x160
 #define REG_UFS_EXTREG              0x2100
 #define REG_UFS_MPHYCTRL            0x2200
-- 
2.45.2


