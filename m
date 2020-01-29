Return-Path: <SRS0=1JTW=3S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBA5C33CB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 10:53:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 094132064C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 10:53:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a3j0SKFh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LIVUqA5r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 094132064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Di15JiWCwbyOw9nTYUPkqvkY+n/kJ+iq2c2T9uJeN7Y=; b=a3j0SKFhaMBZmQ
	AHm0Gtky9U8f1gnK2aFj8s0jBfXa3/mR7itk8s9BXjWSxSQxwldedZUblOi7f9JqbJ+fHrEx0b54F
	D8i7elOCINIY7bVKbZ8Yy3Gh3UK6PhuNEzhadXcT3RQ6W1LJCNTVN2fH2AgYYVw5q77QOCmQsS1nw
	18CWENCpRA9JzAYYfAM82J0OvTddFA9v8E3DVQ00rNq0VbLjj58KyBH8cHvDWl+N85L15L6wOlFda
	Gunt7GLRKgmdp7ENNENPBeKg/9UeRo/B9g2HdPCb+wfzTHa22ukWQR/EZKjo1XZFpmLmjC+RGDCG9
	HD8KdUX2g+d2jc17a43g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwkyQ-0004L6-SR; Wed, 29 Jan 2020 10:53:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwkxu-0003ew-LB; Wed, 29 Jan 2020 10:53:00 +0000
X-UUID: 4c0be9c439db4ddea5291f479609be3c-20200129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ihJg6nDDfiwxmrOIMOxnedl2OexPLbIqUMUcg8QFLQA=; 
 b=LIVUqA5rsg6BwvqJkFRLpEKQS21AfjCybP1q4Z49omySD9eTdninREET9XUR+EBdm1Z73qijaf0e7C98FXLOZxeQghRT+d5vdGq7bigq35gZ4pGPebgvpRv1fwknlrv7QVzSr0o9l0tlVI9ZicWHOYASWkGo/lLMOHjXuzmNqMk=;
X-UUID: 4c0be9c439db4ddea5291f479609be3c-20200129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 691205215; Wed, 29 Jan 2020 02:52:56 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 02:54:08 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 18:52:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 29 Jan 2020 18:53:00 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <beanhuo@micron.com>
Subject: [PATCH RESEND v3 4/4] scsi: ufs-mediatek: gate ref-clk during
 Auto-Hibern8
Date: Wed, 29 Jan 2020 18:52:51 +0800
Message-ID: <20200129105251.12466-5-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200129105251.12466-1-stanley.chu@mediatek.com>
References: <20200129105251.12466-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_025258_696520_83D175A1 
X-CRM114-Status: GOOD (  12.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In current UFS driver design, hba->uic_link_state will not
be changed after link enters Hibern8 state by Auto-Hibern8 mechanism.
In this case, reference clock gating will be skipped unless special
handling is implemented in vendor's callbacks.

Support reference clock gating during Auto-Hibern8 period in
MediaTek Chipsets: If link state is already in Hibern8 while
Auto-Hibern8 feature is enabled, gate reference clock in
setup_clocks callback.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 38 +++++++++++++++++++++++----------
 drivers/scsi/ufs/ufs-mediatek.h | 12 +++++++++++
 2 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index d78897a14905..0ce08872d671 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -143,6 +143,17 @@ static int ufs_mtk_setup_ref_clk(struct ufs_hba *hba, bool on)
 	return 0;
 }
 
+static u32 ufs_mtk_link_get_state(struct ufs_hba *hba)
+{
+	u32 val;
+
+	ufshcd_writel(hba, 0x20, REG_UFS_DEBUG_SEL);
+	val = ufshcd_readl(hba, REG_UFS_PROBE);
+	val = val >> 28;
+
+	return val;
+}
+
 /**
  * ufs_mtk_setup_clocks - enables/disable clocks
  * @hba: host controller instance
@@ -155,7 +166,7 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 				enum ufs_notify_change_status status)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-	int ret = -EINVAL;
+	int ret = 0;
 
 	/*
 	 * In case ufs_mtk_init() is not yet done, simply ignore.
@@ -165,19 +176,24 @@ static int ufs_mtk_setup_clocks(struct ufs_hba *hba, bool on,
 	if (!host)
 		return 0;
 
-	switch (status) {
-	case PRE_CHANGE:
-		if (!on && !ufshcd_is_link_active(hba)) {
+	if (!on && status == PRE_CHANGE) {
+		if (!ufshcd_is_link_active(hba)) {
 			ufs_mtk_setup_ref_clk(hba, on);
 			ret = phy_power_off(host->mphy);
+		} else {
+			/*
+			 * Gate ref-clk if link state is in Hibern8
+			 * triggered by Auto-Hibern8.
+			 */
+			if (!ufshcd_can_hibern8_during_gating(hba) &&
+			    ufshcd_is_auto_hibern8_enabled(hba) &&
+			    ufs_mtk_link_get_state(hba) ==
+			    VS_LINK_HIBERN8)
+				ufs_mtk_setup_ref_clk(hba, on);
 		}
-		break;
-	case POST_CHANGE:
-		if (on) {
-			ret = phy_power_on(host->mphy);
-			ufs_mtk_setup_ref_clk(hba, on);
-		}
-		break;
+	} else if (on && status == POST_CHANGE) {
+		ret = phy_power_on(host->mphy);
+		ufs_mtk_setup_ref_clk(hba, on);
 	}
 
 	return ret;
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index fccdd979d6fb..492414e5f481 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -53,6 +53,18 @@
 #define VS_SAVEPOWERCONTROL         0xD0A6
 #define VS_UNIPROPOWERDOWNCONTROL   0xD0A8
 
+/*
+ * Vendor specific link state
+ */
+enum {
+	VS_LINK_DISABLED            = 0,
+	VS_LINK_DOWN                = 1,
+	VS_LINK_UP                  = 2,
+	VS_LINK_HIBERN8             = 3,
+	VS_LINK_LOST                = 4,
+	VS_LINK_CFG                 = 5,
+};
+
 /*
  * SiP commands
  */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
