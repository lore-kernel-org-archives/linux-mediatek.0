Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5980C19F28
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chpvAAxQyiBEGBZzSuwH7uoCExfe4m+RJ1pEtdCFmFg=; b=LtUNIWg4Rcjcb2kkqilTm14jCH
	xvpqoO3rbWeZDg2L5Cf74Jyv/5QW6sTZ/jB30c9479lgjVKhDQ8qN+vba/439ghRzuE64z4PmXtjE
	ANulm3YPjpFH0PCkcNLGUcPOPIInz+nQHojKzpu8JxnFRgXU4m9lmGrWgyE2+D6ogqxqPGAPkQ78/
	YRYeFVvVXUyl4OUjTSoaadxtA5sQ2+N94LX419KZCh0YEztK/VE1TM5Q9VBK0YQ56vXIaF7iL/7QM
	rWsQsL9SoLW6PSvV7h7JdpT2eHpx+Zp6YMxETta317ssC4de4axM7pOMY52KCEBM2Ek52fJDabWeb
	bNb/2t8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsyU-00F0gw-3a; Tue, 02 Aug 2022 14:34:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsyR-00F0eX-57
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 14:34:20 +0000
X-UUID: 2a9c0fd1ef4c4c55bc1b121737f8ba31-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:ea9e93e3-1f70-422e-871a-74e7006c3a70,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:d34e16d0-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 2a9c0fd1ef4c4c55bc1b121737f8ba31-20220802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 154413647; Tue, 02 Aug 2022 07:34:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 22:33:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 2 Aug 2022 22:33:39 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
Subject: [PATCH v3 1/2] ufs: core: introduce a choice of wb toggle during clock scaling
Date: Tue, 2 Aug 2022 22:32:22 +0800
Message-ID: <20220802143223.1276-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220802143223.1276-1-peter.wang@mediatek.com>
References: <20220802143223.1276-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_073419_270401_C0B84CD7 
X-CRM114-Status: GOOD (  13.40  )
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

Host driver may want to disable/enable write booster during clock scaling.
Introduce a flag UFSHCD_CAP_WB_WITH_CLK_SCALING to decouple WB and
clock scaling.

UFSHCD_CAP_WB_WITH_CLK_SCALING only valid when UFSHCD_CAP_CLK_SCALING
is set. Just like UFSHCD_CAP_HIBERN8_WITH_CLK_GATING is valid only when
UFSHCD_CAP_CLK_GATING set.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/ufs/core/ufs-sysfs.c | 3 ++-
 drivers/ufs/core/ufshcd.c    | 8 +++++---
 include/ufs/ufshcd.h         | 7 +++++++
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
index 0a088b47d557..8fa1679ffd1a 100644
--- a/drivers/ufs/core/ufs-sysfs.c
+++ b/drivers/ufs/core/ufs-sysfs.c
@@ -225,7 +225,8 @@ static ssize_t wb_on_store(struct device *dev, struct device_attribute *attr,
 	unsigned int wb_enable;
 	ssize_t res;
 
-	if (!ufshcd_is_wb_allowed(hba) || ufshcd_is_clkscaling_supported(hba)) {
+	if (!ufshcd_is_wb_allowed(hba) || (ufshcd_is_clkscaling_supported(hba)
+		&& ufshcd_can_wb_during_scaling(hba))) {
 		/*
 		 * If the platform supports UFSHCD_CAP_CLK_SCALING, turn WB
 		 * on/off will be done while clock scaling up/down.
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3d367be71728..d86826e958e6 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1301,9 +1301,11 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, bool scale_up)
 	}
 
 	/* Enable Write Booster if we have scaled up else disable it */
-	downgrade_write(&hba->clk_scaling_lock);
-	is_writelock = false;
-	ufshcd_wb_toggle(hba, scale_up);
+	if (ufshcd_can_wb_during_scaling(hba)) {
+		downgrade_write(&hba->clk_scaling_lock);
+		is_writelock = false;
+		ufshcd_wb_toggle(hba, scale_up);
+	}
 
 out_unprepare:
 	ufshcd_clock_scaling_unprepare(hba, is_writelock);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index a92271421718..4bd35d68acde 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -648,6 +648,9 @@ enum ufshcd_caps {
 	 * notification if it is supported by the UFS device.
 	 */
 	UFSHCD_CAP_TEMP_NOTIF				= 1 << 11,
+
+	/* Allow WB with clk scaling */
+	UFSHCD_CAP_WB_WITH_CLK_SCALING			= 1 << 12,
 };
 
 struct ufs_hba_variant_params {
@@ -1004,6 +1007,10 @@ static inline bool ufshcd_is_wb_allowed(struct ufs_hba *hba)
 {
 	return hba->caps & UFSHCD_CAP_WB_EN;
 }
+static inline bool ufshcd_can_wb_during_scaling(struct ufs_hba *hba)
+{
+	return hba->caps & UFSHCD_CAP_WB_WITH_CLK_SCALING;
+}
 
 #define ufshcd_writel(hba, val, reg)	\
 	writel((val), (hba)->mmio_base + (reg))
-- 
2.18.0


