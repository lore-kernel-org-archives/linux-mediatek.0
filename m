Return-Path: <SRS0=zMKO=7Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2048C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 05:29:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9289820812
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 05:29:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s7g8hapI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OigtWWGO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9289820812
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VkqZXoJR2Sr21YAmT13iR6Jt0KjI5Vr4VlK4EUDzaoM=; b=s7g8hapIUR+1lS
	st/j4NU3FVX21XQP8XJPp4iXgKI7D8ott01Uv6FVcnpo8BIkJsQzrnNUQ46krB1bD1qm2dGO0RYEX
	ENrR345gOgU9em2BiFmPLbnmk/wouMCC+RRu34dFeFTWGrOiXHlZCYKqe+0bYbBfvG3nkJVSmwiXZ
	BOl8LcKTcPsR9cW19P+BJQcrA3PqDwlBUL2HW08LtC0tXZMFw5DKvjgga8FhAbnj1pUBKW9Z/vSLB
	FVO+XdeOaIK6xHXZhs8Svp2Q+fLBW/Xu+dpJzpSePZS+Ft+//jLhTEBTGR3OoMS3U5Ehshr/q2jiC
	XPmgi6FRqMFt3bt/BFjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjFmY-00011B-6L; Thu, 11 Jun 2020 05:29:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjFmQ-0000wg-QF; Thu, 11 Jun 2020 05:29:36 +0000
X-UUID: e35137679caa4ed89bc005927b969447-20200610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1ILMwubnJQNPNAjEKJe3Og6tiFfzI6Q6shWaNu3nPh8=; 
 b=OigtWWGO4cCp1tK5BSPHrT/5XYGMOAJlqXwLjX4JX68TjxpOAtkRWyITFcjuSPaGgniR/cM62wNPz3VMa8sIUvc37/W1J6f2e+jLCAKrpuXy5ejfsxIUNarNEYuBzaRS6brb4g0kQGgjVNFvuMTW7K0pcmpMfk5MzFZbO2OBszI=;
X-UUID: e35137679caa4ed89bc005927b969447-20200610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 601360220; Wed, 10 Jun 2020 21:29:23 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 22:21:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Jun 2020 13:21:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 11 Jun 2020 13:21:09 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v4] scsi: ufs: Fix imprecise load calculation in devfreq window
Date: Thu, 11 Jun 2020 13:21:09 +0800
Message-ID: <20200611052109.22700-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 15808926AE20E5473D36ADD8ADA4232D6CE1F132A283B18C20BE289C9826830A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_222935_053533_089ACEA9 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The UFS load calculation is based on "total_time" and "busy_time" in a
devfreq window. However, the source of time is different for both
parameters: "busy_time" is assigned from "jiffies" thus has different
accuracy from "total_time" which is assigned from ktime_get().

Besides, the time of window boundary is not exactly the same as
the starting busy time in this window if UFS is actually busy
in the beginning of the window. A similar accuracy error may also
happen for the end of busy time in current window.

To guarantee the precision of load calculation, we need to

1. Align time accuracy of both devfreq_dev_status.total_time and
   devfreq_dev_status.busy_time. For example, use "ktime_get()"
   directly.

2. Align below timelines,
   - The beginning time of devfreq windows
   - The beginning of busy time in a new window
   - The end of busy time in the current window

Fixes: a3cd5ec55f6c ("scsi: ufs: add load based scaling of UFS gear")
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index ad4fc829cbb2..bf5aaf334ccd 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1314,6 +1314,7 @@ static int ufshcd_devfreq_get_dev_status(struct device *dev,
 	unsigned long flags;
 	struct list_head *clk_list = &hba->clk_list_head;
 	struct ufs_clk_info *clki;
+	ktime_t curr_t;
 
 	if (!ufshcd_is_clkscaling_supported(hba))
 		return -EINVAL;
@@ -1321,6 +1322,7 @@ static int ufshcd_devfreq_get_dev_status(struct device *dev,
 	memset(stat, 0, sizeof(*stat));
 
 	spin_lock_irqsave(hba->host->host_lock, flags);
+	curr_t = ktime_get();
 	if (!scaling->window_start_t)
 		goto start_window;
 
@@ -1332,18 +1334,17 @@ static int ufshcd_devfreq_get_dev_status(struct device *dev,
 	 */
 	stat->current_frequency = clki->curr_freq;
 	if (scaling->is_busy_started)
-		scaling->tot_busy_t += ktime_to_us(ktime_sub(ktime_get(),
+		scaling->tot_busy_t += ktime_to_us(ktime_sub(curr_t,
 					scaling->busy_start_t));
 
-	stat->total_time = jiffies_to_usecs((long)jiffies -
-				(long)scaling->window_start_t);
+	stat->total_time = ktime_to_us(curr_t) - scaling->window_start_t;
 	stat->busy_time = scaling->tot_busy_t;
 start_window:
-	scaling->window_start_t = jiffies;
+	scaling->window_start_t = ktime_to_us(curr_t);
 	scaling->tot_busy_t = 0;
 
 	if (hba->outstanding_reqs) {
-		scaling->busy_start_t = ktime_get();
+		scaling->busy_start_t = curr_t;
 		scaling->is_busy_started = true;
 	} else {
 		scaling->busy_start_t = 0;
@@ -1877,6 +1878,7 @@ static void ufshcd_exit_clk_gating(struct ufs_hba *hba)
 static void ufshcd_clk_scaling_start_busy(struct ufs_hba *hba)
 {
 	bool queue_resume_work = false;
+	ktime_t curr_t = ktime_get();
 
 	if (!ufshcd_is_clkscaling_supported(hba))
 		return;
@@ -1892,13 +1894,13 @@ static void ufshcd_clk_scaling_start_busy(struct ufs_hba *hba)
 			   &hba->clk_scaling.resume_work);
 
 	if (!hba->clk_scaling.window_start_t) {
-		hba->clk_scaling.window_start_t = jiffies;
+		hba->clk_scaling.window_start_t = ktime_to_us(curr_t);
 		hba->clk_scaling.tot_busy_t = 0;
 		hba->clk_scaling.is_busy_started = false;
 	}
 
 	if (!hba->clk_scaling.is_busy_started) {
-		hba->clk_scaling.busy_start_t = ktime_get();
+		hba->clk_scaling.busy_start_t = curr_t;
 		hba->clk_scaling.is_busy_started = true;
 	}
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
