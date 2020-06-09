Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4197C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 15:41:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6FA72074B
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 15:41:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ph/MS2cE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cma5uxGU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6FA72074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uOWQeTcxlglxGlYvOwARYwXCPMCHq4MZJ3y+dlfiFe8=; b=ph/MS2cEkiKW5q
	YwGKaQgEAPmXPGV4wXUpgqh1kd3MA2kWaQmLekr4njhs/IVHsdiEOBdTOWOkTZBqIoMfq4t7GCfUM
	G87ogYZSbppyq929hZyNG8XnbJSvnVPiuK1lG6LOvBgsIsaja/66uYBgs9CZ7ggPFz1Ko6FgHOLD6
	1aUOnCfld+mrYdDdmxUVq0SD8VWBNW/cg0IZLPDqIrusomGHqHmFNNP6aKKxKGFyIRm3xoLN90WPE
	GXXzBPkHTntOyAbHjSauix56djvuJCzOdR1WCVxaKQ9lruJBDsfTpAbaOLu0e2k4p8OMbNOmybfsC
	h/RAVn4Wes8EU7qmD1XQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jigN1-0004er-AJ; Tue, 09 Jun 2020 15:40:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigMn-0004Tr-DQ; Tue, 09 Jun 2020 15:40:46 +0000
X-UUID: c2c22693b02c4add8b3e1c0ac994171e-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gz9jHrd19tMvfltELFNEZu5vfsrGH8nrJcXFS/mzO2E=; 
 b=cma5uxGUd077/+2UxsRe+VmTuJtu1JMw9k9F9JvC13QIKHJffg3bQO0YjHioBxHmLoV2Bij9SjwQQBwiF6WZgjyMPnFviS3t95HLVS1SFKBqdmfKd+rAQxC8qezonM0yYdgCiF4rCzD6bcm3EnOayaE4PgfuYGMKDAG+pOJlYX4=;
X-UUID: c2c22693b02c4add8b3e1c0ac994171e-20200609
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 876993373; Tue, 09 Jun 2020 07:40:44 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 08:40:34 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 23:40:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 9 Jun 2020 23:40:33 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v2] scsi: ufs: Fix imprecise time in devfreq window
Date: Tue, 9 Jun 2020 23:40:35 +0800
Message-ID: <20200609154035.1950-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_084045_461756_CF2ACA6B 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

Promise precision of devfreq windows by

1. Align time base of both devfreq_dev_status.total_time and
   devfreq_dev_status.busy_time to ktime-based time.

2. Align below timelines,
   - The beginning of devfreq window
   - The beginning of busy time in new window
   - The end of busy time in current window

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index ad4fc829cbb2..04b79ca66fdf 100644
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
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
