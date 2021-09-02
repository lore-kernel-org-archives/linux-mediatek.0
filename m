Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EB3C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 07:21:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A800860FDC
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 07:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A800860FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wxzvEUuTjp3ouuKNEPOgF3DzTfPicZUSVh7O/lj0xEs=; b=dZm7GrQXXTKtcH
	tqcrxGhWqmbdbLCvQDGh2rEbWv71qEMdoswBqnV2drURkXXYeGsU/gDpvc1ZpALAh0BixN47lSzIT
	c88223ov7I+UIfpZ3avtJ7yiuxxyyMShyqn928UuUkmym0DKz/bsZcz6bzjUkIM8uD2DvrtFYWsQG
	xM/Ug0NG11P9hXGj4Q9YEsDsnkxNJyZvdPZH3zb1nKDkbkPtp3s56Lm/qDmFA4JRV+VHBBtOEl0yt
	64DtQC7xAcKzxRiPmuWRPqMoXsSaStfOqboVVxhamqGbaKEmJuksJ2vPrb+6Ji9s16wrQBOazHyVi
	wNUXJjR3MPTIfGZDD9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLh1q-008pst-F9; Thu, 02 Sep 2021 07:20:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLh1l-008psD-LO
 for linux-mediatek@lists.infradead.org; Thu, 02 Sep 2021 07:20:52 +0000
X-UUID: a43ce86f32854565a394f857101da61d-20210902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tzlA5mP+bVp+Sq9L1xKR3NllCNcLgq+AqnAvkt6gFNA=; 
 b=J8VQzWCcqKpU/ifnfbc0kTuW30uAOvSp/IN9J/wm0xHqCJyFmdZlBwTfG72dg7Dy1pzxGTGG2M2RHUutOaqNsuJFzX97fp/RWcyNvlbEWrt9RnXswErh0XhIIUSOU961XQo1JHEhQL03u+1nINN7dxyEbIuqzk6M5EZZlqlk/sw=;
X-UUID: a43ce86f32854565a394f857101da61d-20210902
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1768083111; Thu, 02 Sep 2021 00:20:47 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 00:17:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 15:17:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Sep 2021 15:17:07 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
 <martin.petersen@oracle.com>, <avri.altman@wdc.com>,
 <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
 <chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
 <powen.kao@mediatek.com>, <jonathan.hsu@mediatek.com>,
 <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Subject: [PATCH v4] scsi: ufs: ufs-mediatek: Change dbg select by check IP
 version
Date: Thu, 2 Sep 2021 15:17:06 +0800
Message-ID: <1630567026-21661-1-git-send-email-peter.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_002049_754956_BC071791 
X-CRM114-Status: GOOD (  14.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

Mediatek UFS dbg select setting is changed in new IP version.
This patch check the IP version before set dbg select.
Only set once after host reset.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c |   28 ++++++++++++++++++++++++++--
 drivers/scsi/ufs/ufs-mediatek.h |    7 +++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index d2c2516..51c2c52 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -138,6 +138,8 @@ static void ufs_mtk_host_reset(struct ufs_hba *hba)
 	reset_control_deassert(host->unipro_reset);
 	reset_control_deassert(host->crypto_reset);
 	reset_control_deassert(host->hci_reset);
+
+	host->host_reset = true;
 }
 
 static void ufs_mtk_init_reset_control(struct ufs_hba *hba,
@@ -296,6 +298,26 @@ static void ufs_mtk_setup_ref_clk_wait_us(struct ufs_hba *hba,
 	host->ref_clk_ungating_wait_us = ungating_us;
 }
 
+static void ufs_mtk_dbg_sel(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+
+	if (!host->host_reset)
+		return;
+
+	if (((host->ip_ver >> 16) & 0xFF) >= 0x36) {
+		ufshcd_writel(hba, 0x820820, REG_UFS_DEBUG_SEL);
+		ufshcd_writel(hba, 0x0, REG_UFS_DEBUG_SEL_B0);
+		ufshcd_writel(hba, 0x55555555, REG_UFS_DEBUG_SEL_B1);
+		ufshcd_writel(hba, 0xaaaaaaaa, REG_UFS_DEBUG_SEL_B2);
+		ufshcd_writel(hba, 0xffffffff, REG_UFS_DEBUG_SEL_B3);
+	} else {
+		ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
+	}
+
+	host->host_reset = false;
+}
+
 static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
 				   unsigned long max_wait_ms)
 {
@@ -305,7 +327,7 @@ static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
 	timeout = ktime_add_ms(ktime_get(), max_wait_ms);
 	do {
 		time_checked = ktime_get();
-		ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
+		ufs_mtk_dbg_sel(hba);
 		val = ufshcd_readl(hba, REG_UFS_PROBE);
 		val = val >> 28;
 
@@ -689,6 +711,8 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	ufs_mtk_mphy_power_on(hba, true);
 	ufs_mtk_setup_clocks(hba, true, POST_CHANGE);
 
+	host->ip_ver = ufshcd_readl(hba, REG_UFS_MTK_IP_VER);
+
 	goto out;
 
 out_variant_clear:
@@ -1001,7 +1025,7 @@ static void ufs_mtk_dbg_register_dump(struct ufs_hba *hba)
 			 "MPHY Ctrl ");
 
 	/* Direct debugging information to REG_MTK_PROBE */
-	ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
+	ufs_mtk_dbg_sel(hba);
 	ufshcd_dump_regs(hba, REG_UFS_PROBE, 0x4, "Debug Probe ");
 }
 
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 3f0d3bb..f482cbe 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -15,9 +15,14 @@
 #define REG_UFS_REFCLK_CTRL         0x144
 #define REG_UFS_EXTREG              0x2100
 #define REG_UFS_MPHYCTRL            0x2200
+#define REG_UFS_MTK_IP_VER          0x2240
 #define REG_UFS_REJECT_MON          0x22AC
 #define REG_UFS_DEBUG_SEL           0x22C0
 #define REG_UFS_PROBE               0x22C8
+#define REG_UFS_DEBUG_SEL_B0        0x22D0
+#define REG_UFS_DEBUG_SEL_B1        0x22D4
+#define REG_UFS_DEBUG_SEL_B2        0x22D8
+#define REG_UFS_DEBUG_SEL_B3        0x22DC
 
 /*
  * Ref-clk control
@@ -113,6 +118,8 @@ struct ufs_mtk_host {
 	bool ref_clk_enabled;
 	u16 ref_clk_ungating_wait_us;
 	u16 ref_clk_gating_wait_us;
+	u32 ip_ver;
+	bool host_reset;
 };
 
 #endif /* !_UFS_MEDIATEK_H */
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
