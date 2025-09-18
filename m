Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A4ECAC5A8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9kx9Cz89mIWhNYqARZDDZQSchK51bIxPXqqgs5VMw0=; b=X9hF7QchxuavYVAVoPfSFI5jET
	4pa8pu/Ob3rrtOSEWndU8sdF57vxT6O0f0KtZB0qGeHvVm4KZAxkuKRB+YBhUQDgfVd9nrRZzzRO8
	3iDnJ1Jmcnn9YQOs01fK4yHDkXpAZ3vylqgcnXLyYkTp57bzYrRg26TFmcrQGVHTpChXQfQ+vbdNf
	LCeKctSuU0qF29j2tHhIWx6hyj1wEoRZvSXug5G9HDM9LnGCcg9XBFsGe6ahnoyB97W7Qt6Z7kR1g
	uHsTcmdiFq4mSut4ggsA4EgFXckXor+gpc2vaDbkeqQwjOCGUiZ79ibH389ltf8Zn/RLkoH9LfOtM
	HpZ86bng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3l-0000000H79D-21mf;
	Thu, 18 Sep 2025 10:40:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3h-0000000H73M-38ZP
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 10:40:14 +0000
X-UUID: d9f6a672947b11f09f706fa2197c6ceb-20250918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=N9kx9Cz89mIWhNYqARZDDZQSchK51bIxPXqqgs5VMw0=;
	b=UsDi0dzBAFM+P0p9yXz+FtyIjgM2knL439G0vsKxHnotKP0MslyIkbtDFEjQP4Y4A/FHfLOoEmO2TQwDvTQV8laEghbknX/CEZDxmAl0tvV7Z8w4GVYZT5XhIKBQ9Na+H8oaLa1iaIRFIcHzwijDM/aPQFqr2U24cpCDnNRIDoo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:a6136dd7-f31d-4462-afd9-d41221ea14a1,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:1ca6b93,CLOUDID:2f29b26c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d9f6a672947b11f09f706fa2197c6ceb-20250918
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 887759526; Thu, 18 Sep 2025 03:40:10 -0700
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
Subject: [PATCH v1 09/10] ufs: host: mediatek: Add support for new platform with MMIO_OTSD_CTR
Date: Thu, 18 Sep 2025 18:36:19 +0800
Message-ID: <20250918104000.208856-10-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250918104000.208856-1-peter.wang@mediatek.com>
References: <20250918104000.208856-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_034013_827850_8F4A3F43 
X-CRM114-Status: GOOD (  19.07  )
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
index 5aa42b8caa3b..0cc372e0ac75 100644
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
index 73ab67448e87..32687dd12527 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -31,6 +31,7 @@
  */
 #define REG_UFS_XOUFS_CTRL          0x140
 #define REG_UFS_REFCLK_CTRL         0x144
+#define REG_UFS_UFS_MMIO_OTSD_CTRL  0x14C
 #define REG_UFS_MMIO_OPT_CTRL_0     0x160
 #define REG_UFS_EXTREG              0x2100
 #define REG_UFS_MPHYCTRL            0x2200
-- 
2.45.2


