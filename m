Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76E6C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 12:12:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6953A61154
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 12:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6953A61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+qjV+rGZUfaEB4ZDEgYxPj+Xx2WDZXGYK2vPYP8yIDc=; b=lTSeYg9V98l71j
	45ZIAh1oThCXSujyDIW03yzyOA2O6CBT3CzXwWfeNrN/EhdLwYBq5VjkcvfjqFKLXEYGX03L8RriF
	cuyIcdz/4D0jHIpZ6hHQ3q8ev97vfR+UEzStcBDhXtngaFOjoU+G7xIxISiHslgM7HpKpuFDXftA6
	wTI2nzTxR6Cw/A84bPEr5TwRjAYc6By/VVP8T/XDnss9MWrdYgG5NQ60f8CQzUwiauroWrfBU59YZ
	NWQG8c+7XBIbzEAO+/nXNkaVW1B9woRIwnhZS/PxU0sBfPXihyPKsogHPyZzexeniKwPLAehyR1Mi
	WSpHgoCa+fZFUhv3OKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKg8h-00HCnA-GK; Mon, 30 Aug 2021 12:11:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKg8b-00HClt-IK
 for linux-mediatek@lists.infradead.org; Mon, 30 Aug 2021 12:11:46 +0000
X-UUID: 65402f66318b45bfbe07b8db6c1c198a-20210830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WQh5XrMegI8lghZ21WLZBtBMr6DtReWARCDOo/uomAg=; 
 b=PO4A6IQEwh0mrRel3qSSqfGs5/ZAfzOkDqEGKCQ7DgaffGQr57eW1Du0fK0ewbjDROC7K2xhKM/9usNHh0+RxF71xb97qYp9q3+wBUM6pMo1RCs0s1lMTlIoBPyY4/hLPjg3JflE0l7uBsku7qRBwv+DzsQPJwv8ZfoqM9O0XR0=;
X-UUID: 65402f66318b45bfbe07b8db6c1c198a-20210830
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1219875255; Mon, 30 Aug 2021 05:11:35 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 05:11:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 20:11:32 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 30 Aug 2021 20:11:32 +0800
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
Subject: [PATCH v1] scsi: ufs: ufs-mediatek: Change dbg select by check hw
 version
Date: Mon, 30 Aug 2021 20:11:26 +0800
Message-ID: <1630325486-11741-1-git-send-email-peter.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_051142_456761_EAAE5278 
X-CRM114-Status: GOOD (  13.23  )
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
 drivers/scsi/ufs/ufs-mediatek.c |   22 ++++++++++++++++++++--
 drivers/scsi/ufs/ufs-mediatek.h |    4 ++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index d2c2516..c7c18d8 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -296,6 +296,24 @@ static void ufs_mtk_setup_ref_clk_wait_us(struct ufs_hba *hba,
 	host->ref_clk_ungating_wait_us = ungating_us;
 }
 
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
@@ -305,7 +323,7 @@ static int ufs_mtk_wait_link_state(struct ufs_hba *hba, u32 state,
 	timeout = ktime_add_ms(ktime_get(), max_wait_ms);
 	do {
 		time_checked = ktime_get();
-		ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
+		ufs_mtk_dbg_sel(hba);
 		val = ufshcd_readl(hba, REG_UFS_PROBE);
 		val = val >> 28;
 
@@ -1001,7 +1019,7 @@ static void ufs_mtk_dbg_register_dump(struct ufs_hba *hba)
 			 "MPHY Ctrl ");
 
 	/* Direct debugging information to REG_MTK_PROBE */
-	ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
+	ufs_mtk_dbg_sel(hba);
 	ufshcd_dump_regs(hba, REG_UFS_PROBE, 0x4, "Debug Probe ");
 }
 
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 3f0d3bb..10da6e3 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -18,6 +18,10 @@
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
