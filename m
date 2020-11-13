Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1092C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 06:36:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BA9F20738
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 06:36:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cw6iSEb/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BA9F20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3xeHHIpmsfIjYDgguUTSUI+4KaoWfaJoDT2L/Ehv54=; b=cw6iSEb/A2b2ZmdhdPJh/D8Kw+
	gNeo7WlSZ+aSdTNQAe2U6Ql7VBlwERF6B8K8b1q8hYwk+8M7dX+a85EGRGyUHat0D94IdlEMNCj32
	KQS2q4XpsC0LvaYzqAnaZDP9mNCpnVBphERl1AxjOQvRTHIa5zF/1tQxKMUb1ArhbwmUdDLYGtm81
	P9yWtiDGRf5hhllgX5NQ7RwGmmK9i2TkxkyXoPgEy8dNaRb32KxEo9k6dmRVN32ncuWI+MCTPYSy2
	w5OPRHJP1Cm9/E20IqMxVlb/5hw3lImD3Gg6TLId0Fa8janpz/seUWBnn04RnvY0w5S4gG1v5rX6Q
	9zvD6QrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdShG-0000bk-Sa; Fri, 13 Nov 2020 06:36:35 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdShC-0000b8-RW; Fri, 13 Nov 2020 06:36:31 +0000
IronPort-SDR: 6TctTulGF1gL+sBpL0IlknZ99Yw6dxVKYMIJu3fy+ScxCLq5NbEFjoVaF10nfo1U+4tLTLBiwA
 zofBxl78sY+ML/jMcf26hQi+tytcX87UyA6Z4Nqz4Gh/KhPe21AYNjvxPnPRje/HE/vbOvZeZF
 MfXXrLyyNiDNeJUZryNf5qbhWn6w8bNBFbf1CKiE+xHb2fyqA5Rq20fbNBoVGw6/VsiMKORGrB
 1ciEvBo/ncQYojrCP/PompnbIIaTtIFieuF/Q4RX9oruKQMI7MravJAuXZskjI5/oo0xawuCH/
 +BM=
X-IronPort-AV: E=Sophos;i="5.77,474,1596524400"; d="scan'208";a="29276423"
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by labrats.qualcomm.com with ESMTP; 12 Nov 2020 22:30:17 -0800
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com)
 ([192.168.140.85])
 by ironmsg01-sd.qualcomm.com with ESMTP; 12 Nov 2020 22:30:15 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id E48A321787; Thu, 12 Nov 2020 22:30:15 -0800 (PST)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 ziqichen@codeaurora.org, rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
 cang@codeaurora.org
Subject: [PATCH RFC v1 1/1] scsi: pm: Leave runtime resume along if block
 layer PM is enabled
Date: Thu, 12 Nov 2020 22:30:08 -0800
Message-Id: <1605249009-13752-2-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605249009-13752-1-git-send-email-cang@codeaurora.org>
References: <1605249009-13752-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_013631_042042_EBDC7CA8 
X-CRM114-Status: GOOD (  14.22  )
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If block layer runtime PM is enabled for one SCSI device, then there is
no need to forcibly change the SCSI device and its request queue's runtime
PM status to active in scsi_dev_type_resume(), since block layer PM shall
resume the SCSI device on the demand of bios.

Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/scsi_pm.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/scsi_pm.c b/drivers/scsi/scsi_pm.c
index 3717eea..278c27e 100644
--- a/drivers/scsi/scsi_pm.c
+++ b/drivers/scsi/scsi_pm.c
@@ -79,23 +79,22 @@ static int scsi_dev_type_resume(struct device *dev,
 	scsi_device_resume(to_scsi_device(dev));
 	dev_dbg(dev, "scsi resume: %d\n", err);
 
-	if (err == 0) {
-		pm_runtime_disable(dev);
-		err = pm_runtime_set_active(dev);
-		pm_runtime_enable(dev);
+	if (scsi_is_sdev_device(dev)) {
+		struct scsi_device *sdev;
 
+		sdev = to_scsi_device(dev);
 		/*
-		 * Forcibly set runtime PM status of request queue to "active"
-		 * to make sure we can again get requests from the queue
-		 * (see also blk_pm_peek_request()).
-		 *
-		 * The resume hook will correct runtime PM status of the disk.
+		 * If block layer runtime PM is enabled for the SCSI device,
+		 * let block layer PM handle its runtime PM routines.
 		 */
-		if (!err && scsi_is_sdev_device(dev)) {
-			struct scsi_device *sdev = to_scsi_device(dev);
+		if (sdev->request_queue->dev)
+			return err;
+	}
 
-			blk_set_runtime_active(sdev->request_queue);
-		}
+	if (err == 0) {
+		pm_runtime_disable(dev);
+		err = pm_runtime_set_active(dev);
+		pm_runtime_enable(dev);
 	}
 
 	return err;
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
