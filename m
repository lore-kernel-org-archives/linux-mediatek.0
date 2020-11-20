Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCBFC63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 08:37:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E781A22249
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 08:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SJvqZiZF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E781A22249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tIhYDcPA98dyQ/XA/J5eAvE62nnBUXTHzKg8lYfTW1Y=; b=SJvqZiZF1C8f6SzKCDt8YVJaFT
	crKh//qsgxl/CKwkb/hNX3AYLdU1dR6cnQ9fxPMA0F1FjwjtmkASE2C3Ron8nM1RvLGAwOSeYeb7J
	f/QaPaUjyhj4h2k1MIWmMeQYjjl5qdWLNgKbrhnBJn+9f1CUaP39Y9wcR12PI7ZrndvCq6duxh0OD
	ziMpTeM59qZN+UujSE6lKL40iVYDYkglNnhxXkcupQKDTUNJJ4w6onRCnzJKbBih7vG9whngkNYc6
	LHk2G/wQIu+od+lIwS2nshk9NVVusPdkELxrwHZbhePI0GF+HjzBzata3lL4HrDfWTCOqQTUjWQYJ
	lrtz49PQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg1vC-0000F0-Gq; Fri, 20 Nov 2020 08:37:34 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg1v8-0000Cx-6h; Fri, 20 Nov 2020 08:37:31 +0000
IronPort-SDR: 35AcR+M7M+hd8eMihQgueRi4jX/bEC4baNV0C2/YDDjIwIpT8iImrAL71rDqQLMHIV9CAgmqVN
 Wcw6IeVn7GhBI402CzUv63Mcfd7rXwZdkBQE0yut24d9odSJIXepkMaMy5d8y2hOEmwovC1Y/K
 MLCPvNnCa/hyl6BCwfmdjYBqLyLjr4AX/AAZSi8t2w0WX0xyHNgeEdF/ymL9a58UXIApCLu6Lm
 +zhHSJhgMVtx0DCi7YxAxVOWu2x3LV59EMYhXEs2fGd8CEd64h2Sm0HOmaOhGE5FO+mUWLqY2/
 jP4=
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; d="scan'208";a="47489928"
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by labrats.qualcomm.com with ESMTP; 20 Nov 2020 00:37:27 -0800
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com)
 ([192.168.140.85])
 by ironmsg02-sd.qualcomm.com with ESMTP; 20 Nov 2020 00:37:25 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 02FBD217B5; Fri, 20 Nov 2020 00:37:25 -0800 (PST)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 ziqichen@codeaurora.org, rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
 cang@codeaurora.org
Subject: [PATCH RFC v2 1/1] scsi: pm: Leave runtime PM status alone during
 system resume/thaw/restore
Date: Fri, 20 Nov 2020 00:37:22 -0800
Message-Id: <1605861443-11459-1-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_033730_410530_4DF8C1E3 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Runtime resume is handled by runtime PM framework, no need to forcibly
set runtime PM status to RPM_ACTIVE during system resume/thaw/restore.

Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Can Guo <cang@codeaurora.org>
---

Changes since v1:
- Incorporated Bart's comments

---
 drivers/scsi/scsi_pm.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/scsi/scsi_pm.c b/drivers/scsi/scsi_pm.c
index 3717eea..908f27f 100644
--- a/drivers/scsi/scsi_pm.c
+++ b/drivers/scsi/scsi_pm.c
@@ -79,25 +79,6 @@ static int scsi_dev_type_resume(struct device *dev,
 	scsi_device_resume(to_scsi_device(dev));
 	dev_dbg(dev, "scsi resume: %d\n", err);
 
-	if (err == 0) {
-		pm_runtime_disable(dev);
-		err = pm_runtime_set_active(dev);
-		pm_runtime_enable(dev);
-
-		/*
-		 * Forcibly set runtime PM status of request queue to "active"
-		 * to make sure we can again get requests from the queue
-		 * (see also blk_pm_peek_request()).
-		 *
-		 * The resume hook will correct runtime PM status of the disk.
-		 */
-		if (!err && scsi_is_sdev_device(dev)) {
-			struct scsi_device *sdev = to_scsi_device(dev);
-
-			blk_set_runtime_active(sdev->request_queue);
-		}
-	}
-
 	return err;
 }
 
@@ -165,11 +146,8 @@ static int scsi_bus_resume_common(struct device *dev,
 		 */
 		if (strncmp(scsi_scan_type, "async", 5) != 0)
 			async_synchronize_full_domain(&scsi_sd_pm_domain);
-	} else {
-		pm_runtime_disable(dev);
-		pm_runtime_set_active(dev);
-		pm_runtime_enable(dev);
 	}
+
 	return 0;
 }
 
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
