Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54E6C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 06:07:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F1F6101A
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 06:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53F1F6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B/CGHneD7UCjk598MjdOm945rW6ertwXR2ntVQKFhcU=; b=IdJLsbKi429SgB
	59UnEeAFgRE+H7zr+HQhxjvNvzCWBsSoyze1Ol7j/CbZ7ug8uLPjIB90VG8DuNgcmihrBy59zn+J7
	KGzEXrbIKoykiaLT9R8u8xpyeoWcuO7zWGPbqJaRNjVEFQfXxGlmrYhqHNM0MUXrXd4lCulcDsvZh
	WJ5uNjB7E7d1uq2fUkL2RGK9B9qfYufyUJCeTYd2fTY1zHUF1mwzi9N5+O0bg317VJ3E1dRZj5C+l
	lvSbtF3rHpTW/qZ/3mGYbINwNIWbu7rRlFf1a2soYUTH9Y4gwWZN8ezppdP97O+FK1q64xjoXbvOs
	x+eKV0Nlwk8+ZdWKzQ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLJP1-0047GB-Ra; Wed, 01 Sep 2021 06:07:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLJME-0045qT-Ox
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 06:04:28 +0000
X-UUID: 26ef7bd6d9e043549ed81f5b28479dea-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IQ0ElKA4Uft+ZUvDpl3FxEF7Qn2pNsx+gH85usAgf0Y=; 
 b=De+wcO4C9PgOB3MpdTa32yIi/+zN/QQiBwqx6qnLbuiV9Rw6CFJWijwTgqNcDSYdaB8kNDvRwexaNEo+WQ86mT1sOcmfiV6P4WRLClFg0GYZsg7Ji9wpfZG/pCh+VaA3OKWr+0PvFNtK6tt4smkO52NyH9C7cyrVoiRbdPL4CKI=;
X-UUID: 26ef7bd6d9e043549ed81f5b28479dea-20210831
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 704256368; Tue, 31 Aug 2021 23:04:18 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 23:04:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 14:04:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Sep 2021 14:04:15 +0800
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
Subject: [PATCH v3] scsi: ufs: ufs-mediatek: Change dbg select by check hw
 version
Date: Wed, 1 Sep 2021 14:04:12 +0800
Message-ID: <1630476252-2031-1-git-send-email-peter.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_230422_901351_F7F0AD8B 
X-CRM114-Status: GOOD (  13.77  )
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

Mediatek UFS dbg select setting is changed in new HW version.
This patch check the HW version before set dbg select.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c |   23 +++++++++++++++++++++--
 drivers/scsi/ufs/ufs-mediatek.h |    5 +++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index d2c2516..0050e01 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -296,6 +296,25 @@ static void ufs_mtk_setup_ref_clk_wait_us(struct ufs_hba *hba,
 	host->ref_clk_ungating_wait_us = ungating_us;
 }
 
+__no_kcsan
+static void ufs_mtk_dbg_sel(struct ufs_hba *hba)
+{
+	static u32 hw_ver;
+
+	if (!hw_ver)
+		hw_ver = ufshcd_readl(hba, REG_UFS_MTK_HW_VER);
+
+	if (((hw_ver >> 16) & 0xFF) >= 0x36) {
+		ufshcd_writel(hba, 0x820820, REG_UFS_DEBUG_SEL);
+		ufshcd_writel(hba, 0x0, REG_UFS_DEBUG_SEL_B0);
+		ufshcd_writel(hba, 0x55555555, REG_UFS_DEBUG_SEL_B1);
+		ufshcd_writel(hba, 0xaaaaaaaa, REG_UFS_DEBUG_SEL_B2);
+		ufshcd_writel(hba, 0xffffffff, REG_UFS_DEBUG_SEL_B3);
+	} else {
+		ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
+	}
+}
+
 static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
 				   unsigned long max_wait_ms)
 {
@@ -305,7 +324,7 @@ static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
 	timeout = ktime_add_ms(ktime_get(), max_wait_ms);
 	do {
 		time_checked = ktime_get();
-		ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
+		ufs_mtk_dbg_sel(hba);
 		val = ufshcd_readl(hba, REG_UFS_PROBE);
 		val = val >> 28;
 
@@ -1001,7 +1020,7 @@ static void ufs_mtk_dbg_register_dump(struct ufs_hba *hba)
 			 "MPHY Ctrl ");
 
 	/* Direct debugging information to REG_MTK_PROBE */
-	ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
+	ufs_mtk_dbg_sel(hba);
 	ufshcd_dump_regs(hba, REG_UFS_PROBE, 0x4, "Debug Probe ");
 }
 
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 3f0d3bb..fc40c05 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -15,9 +15,14 @@
 #define REG_UFS_REFCLK_CTRL         0x144
 #define REG_UFS_EXTREG              0x2100
 #define REG_UFS_MPHYCTRL            0x2200
+#define REG_UFS_MTK_HW_VER          0x2240
 #define REG_UFS_REJECT_MON          0x22AC
 #define REG_UFS_DEBUG_SEL           0x22C0
 #define REG_UFS_PROBE               0x22C8
+#define REG_UFS_DEBUG_SEL_B0        0x22D0
+#define REG_UFS_DEBUG_SEL_B1        0x22D4
+#define REG_UFS_DEBUG_SEL_B2        0x22D8
+#define REG_UFS_DEBUG_SEL_B3        0x22DC
 
 /*
  * Ref-clk control
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
