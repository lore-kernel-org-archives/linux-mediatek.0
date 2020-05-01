Return-Path: <SRS0=tJCI=6P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86245C4724C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 14:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B4CC2137B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 14:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M9IRaEEE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IZU8/YvO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B4CC2137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2abtnaQhC+9VBNzN30ujy4d750xs3ulG4fUC+a4B3fg=; b=M9IRaEEEJpfKIg
	/68h9q6gbSKQT+ANQBOcJ1PQe5ACl3h+mSLACG2hs6jMQQ5fg9MzbJQI3kz+Qx3bzOKCAahG7UyAP
	Bh96arHn66qPvwfWHLENUIk6tQ4VdGbKYggg3kJoGIiLolfMlPrlFPwWysKng7J3+NnNZp4bUaRCJ
	PDPl1FWuzG+GUzrQih8/xH1IXiAloSytWmY087gwEVS4fRkjHZ9hcGXc9jcfK0XDaw8ZSDkBHk9Aj
	b7WqO8lg19M2TscEFRYA1QgjgYRWlo0t5ZQfCSVpesiL+rQjTEIILK7daKCZV7yNMtZYIE073dmh/
	T+DZ1uyrRv6usE0h2IFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUWpt-0003eB-8I; Fri, 01 May 2020 14:40:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUWoZ-0000KB-0k; Fri, 01 May 2020 14:38:56 +0000
X-UUID: d8487ce07a944dd59aa05e14febb57b9-20200501
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8VIPLSkqrglgjQeSr66OR8BmnSuUsZPHpl18x7zMDIc=; 
 b=IZU8/YvOIE9a4e01gZpZ8v+vYpYTDojkZ9miupSb6dyc+8Ax0NLRdOw6khuHppd98ALoToetflJkAEaB5Udib70P5K5bpcRfw4ETIPYEb9L5HqD1xsQIumRgA/LO664kg+PYFlB0A2eJ08UVTN2ALYBBJLDRx8T0I8ebm6uJHnE=;
X-UUID: d8487ce07a944dd59aa05e14febb57b9-20200501
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 189929514; Fri, 01 May 2020 06:38:46 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 May 2020 07:38:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 May 2020 22:38:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 May 2020 22:38:34 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v3 5/5] scsi: ufs: cleanup WriteBooster feature
Date: Fri, 1 May 2020 22:38:35 +0800
Message-ID: <20200501143835.26032-6-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200501143835.26032-1-stanley.chu@mediatek.com>
References: <20200501143835.26032-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_073855_071429_08BD555B 
X-CRM114-Status: GOOD (  10.47  )
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
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Small cleanup as below items,

1. Use ufshcd_is_wb_allowed() directly instead of ufshcd_wb_sup()
   since ufshcd_wb_sup() just returns the result of
   ufshcd_is_wb_allowed().

2. In ufshcd_suspend(), "else if (!ufshcd_is_runtime_pm(pm_op))
   can be simplified to "else" since both have the same meaning.

This patch does not change any functionality.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 8c256f6f4a65..420d1476b3e1 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -255,7 +255,6 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, bool scale_up);
 static irqreturn_t ufshcd_intr(int irq, void *__hba);
 static int ufshcd_change_power_mode(struct ufs_hba *hba,
 			     struct ufs_pa_layer_attr *pwr_mode);
-static bool ufshcd_wb_sup(struct ufs_hba *hba);
 static int ufshcd_wb_buf_flush_enable(struct ufs_hba *hba);
 static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba);
 static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable);
@@ -287,7 +286,7 @@ static inline void ufshcd_wb_config(struct ufs_hba *hba)
 {
 	int ret;
 
-	if (!ufshcd_wb_sup(hba))
+	if (!ufshcd_is_wb_allowed(hba))
 		return;
 
 	ret = ufshcd_wb_ctrl(hba, true);
@@ -5199,11 +5198,6 @@ static void ufshcd_bkops_exception_event_handler(struct ufs_hba *hba)
 				__func__, err);
 }
 
-static bool ufshcd_wb_sup(struct ufs_hba *hba)
-{
-	return ufshcd_is_wb_allowed(hba);
-}
-
 int ufshcd_wb_get_flag_index(struct ufs_hba *hba)
 {
 	if (hba->dev_info.b_wb_buffer_type == WB_BUF_MODE_LU_DEDICATED)
@@ -5218,7 +5212,7 @@ static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable)
 	u8 index;
 	enum query_opcode opcode;
 
-	if (!ufshcd_wb_sup(hba))
+	if (!ufshcd_is_wb_allowed(hba))
 		return 0;
 
 	if (!(enable ^ hba->wb_enabled))
@@ -5274,7 +5268,7 @@ static int ufshcd_wb_buf_flush_enable(struct ufs_hba *hba)
 	int ret;
 	u8 index;
 
-	if (!ufshcd_wb_sup(hba) || hba->wb_buf_flush_enabled)
+	if (!ufshcd_is_wb_allowed(hba) || hba->wb_buf_flush_enabled)
 		return 0;
 
 	index = ufshcd_wb_get_flag_index(hba);
@@ -5296,7 +5290,7 @@ static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba)
 	int ret;
 	u8 index;
 
-	if (!ufshcd_wb_sup(hba) || !hba->wb_buf_flush_enabled)
+	if (!ufshcd_is_wb_allowed(hba) || !hba->wb_buf_flush_enabled)
 		return 0;
 
 	index = ufshcd_wb_get_flag_index(hba);
@@ -5346,7 +5340,7 @@ static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
 	int ret;
 	u32 avail_buf;
 
-	if (!ufshcd_wb_sup(hba))
+	if (!ufshcd_is_wb_allowed(hba))
 		return false;
 	/*
 	 * The ufs device needs the vcc to be ON to flush.
@@ -8231,12 +8225,12 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		 * configured WB type is 70% full, keep vcc ON
 		 * for the device to flush the wb buffer
 		 */
-		if ((hba->auto_bkops_enabled && ufshcd_wb_sup(hba)) ||
+		if ((hba->auto_bkops_enabled && ufshcd_is_wb_allowed(hba)) ||
 		    ufshcd_wb_keep_vcc_on(hba))
 			hba->dev_info.keep_vcc_on = true;
 		else
 			hba->dev_info.keep_vcc_on = false;
-	} else if (!ufshcd_is_runtime_pm(pm_op)) {
+	} else {
 		hba->dev_info.keep_vcc_on = false;
 	}
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
