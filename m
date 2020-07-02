Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64566C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 04:19:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E1BA20737
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 04:19:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BheSJZqz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aV2nyORk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E1BA20737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WRq/zS5lBBQNn/MBm9HDWUH3NaydeQZwNXpnvayg46M=; b=BheSJZqzImVI51N1XWxTxtD6bW
	4f2XvDtyw/9B+h2uXKoaZCmBpQRAZ1u0u0eL3ogJPcXDshPsE0GYJpQssfsS7S7vxKhPpMKWDgBH8
	aLsWYTB3mRCxgHa5SVJ/b1rJwRKKdyQr5hNvehdgIXylgTttKG2AE/T18ClsLjgQW7W/D8LdHdg/V
	4eHnUcdwkszTUGehi1uzUazAGW61lbwiasaq2LXvRP0lzTlJG0KPZe30nDMJIltECKkt9gd9MDHdm
	rgOdGgR9aerWm5Q6qxILZb1E4t0YGQl4Bp6Qw8VXD4S6H4k3jfXQRptpA15NLf1llGQyuemkeOZrI
	Jw3xnj2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqqgu-0000h5-D2; Thu, 02 Jul 2020 04:19:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqqgp-0000fx-KL; Thu, 02 Jul 2020 04:19:13 +0000
X-UUID: 016dba6020554468909231701579e81d-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/qeQiCFhQmAtM64O6dojVLSgPjBT9w/q1FMAsMB08+A=; 
 b=aV2nyORkzJYYiT6Gs1BsnJsWPTb2nM169cI40FCjrhWNY7q7VUcQqNxIplVbcPhfOKgzI54TCWo79ZxZpsXeQRRmpvjtwMAvcBI9dRoHJOplsTyRV50akMpQ/uFqvazZwa5jptrsmtUh0RfUC3Sy/UdBecZB6Dsnie8d8wm6z30=;
X-UUID: 016dba6020554468909231701579e81d-20200701
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 494651527; Wed, 01 Jul 2020 20:18:58 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 21:18:58 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 12:18:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Jul 2020 12:18:50 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <bvanassche@acm.org>
Subject: [PATCH v2] scsi: ufs: Cleanup completed request without interrupt
 notification
Date: Thu, 2 Jul 2020 12:18:50 +0800
Message-ID: <20200702041850.28028-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: C1DD82904CC95CD3D55608FC5688E3E24E6DF85F9CF1A10FBA16024867C278752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_001911_837994_BC1E4E3F 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If somehow no interrupt notification is raised for a completed request
and its doorbell bit is cleared by host, UFS driver needs to cleanup
its outstanding bit in ufshcd_abort().

Otherwise, system may crash by below abnormal flow:

After this request is requeued by SCSI layer with its
outstanding bit set, the next completed request will trigger
ufshcd_transfer_req_compl() to handle all "completed outstanding
bits". In this time, the "abnormal outstanding bit" will be detected
and the "requeued request" will be chosen to execute request
post-processing flow. This is wrong and blk_finish_request() will
BUG_ON because this request is still "alive".

It is worth mentioning that before ufshcd_abort() cleans the timed-out
request, driver needs to check again if this request is really not
handled by __ufshcd_transfer_req_compl() yet because it is possible
that its interrupt comes very lately before the cleaning.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index cadfa9006972..0f4f3255e403 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6462,7 +6462,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 			/* command completed already */
 			dev_err(hba->dev, "%s: cmd at tag %d successfully cleared from DB.\n",
 				__func__, tag);
-			goto out;
+			goto cleanup;
 		} else {
 			dev_err(hba->dev,
 				"%s: no response from device. tag = %d, err %d\n",
@@ -6496,9 +6496,14 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 		goto out;
 	}
 
+cleanup:
+	spin_lock_irqsave(host->host_lock, flags);
+	if (!test_bit(tag, hba->outstanding_reqs)) {
+		spin_unlock_irqrestore(host->host_lock, flags);
+		goto out;
+	}
 	scsi_dma_unmap(cmd);
 
-	spin_lock_irqsave(host->host_lock, flags);
 	ufshcd_outstanding_req_clear(hba, tag);
 	hba->lrb[tag].cmd = NULL;
 	spin_unlock_irqrestore(host->host_lock, flags);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
