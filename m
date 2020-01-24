Return-Path: <SRS0=meO2=3N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D97CC2D0DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 15:08:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63EF520709
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 15:08:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pGpK63F3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AW0Qss1y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63EF520709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1sUbzc9tL5iuxQUoRz1bKUYBaChMTz1+RSuUYQmWtkQ=; b=pGpK63F30ZjIbF
	qVsy6N4KpAVtxl/w1Zz2D6v4V4bBLEqEKA3Pv2sYkJ5kwzlTxRPGlpaSOgOY1aBX9hY6qaxRPluBu
	Bxfqsrk++hOJFiAFG7pSnqG0D6/pvWvDW9py3k4onhsObk+JR7caP0EYEVPdQKsN8Twuz5c21kD7W
	92t+NF6aDFBBh7IHNF5oiEVt9hTxGraZPM0Szpa+Z3cA+LmdxyELgG657u69S5ZTpBWg1yYBkkugY
	H05e0JFR6CB+rZhWlPI+83o3X0YNmSsPv8xZY3I3KZ5ovKMt9WgMbjs+P4ADbbcZBjTKjre7XjBCq
	e00Q6gUCYOuhAmDHXOiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv0Zd-0005F0-Ng; Fri, 24 Jan 2020 15:08:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv0Ys-0004Y6-Bs; Fri, 24 Jan 2020 15:07:56 +0000
X-UUID: 368778c40c1a488cbf09ce88f45b4f0f-20200124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vcvvxpJscKwYB9oZ8PPJi+Oq/SniD4zBAROoyiH/1Ms=; 
 b=AW0Qss1yC0tReCyneavSr12AKSXo1WrSgHU5KMnJZJClpmDqy0OfQkkTYfSQABj47GKoY0XKgwrRE9m/qJJ5VnaKmS21vvhOzsqamMGUEEm6hdy/KXxIiYHBR5c/+Mx903VhMgNHDaJ/COTBgAsBqkHDDsYvxTnQzO5xKNkak2U=;
X-UUID: 368778c40c1a488cbf09ce88f45b4f0f-20200124
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 878124376; Fri, 24 Jan 2020 07:07:49 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 24 Jan 2020 07:08:52 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 24 Jan 2020 23:07:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 24 Jan 2020 23:07:16 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 5/5] scsi: ufs-mediatek: gate ref-clk during Auto-Hibern8
Date: Fri, 24 Jan 2020 23:07:43 +0800
Message-ID: <20200124150743.15110-6-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200124150743.15110-1-stanley.chu@mediatek.com>
References: <20200124150743.15110-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_070754_423951_52FF16AD 
X-CRM114-Status: GOOD (  12.54  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com,
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
index d78897a14905..abf9dd75c42e 100644
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
+			    VS_LINK_HIBER8)
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
index fccdd979d6fb..c32cb42c8942 100644
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
+	VS_LINK_HIBER8              = 3,
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
