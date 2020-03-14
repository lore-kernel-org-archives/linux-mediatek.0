Return-Path: <SRS0=LjRj=47=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D28EC10DCE
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Mar 2020 03:17:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019252067C
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Mar 2020 03:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s6cRYKmT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="B3sbXdyo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019252067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kp12iCW9WSYw7h28LCgZAiDPdb2bwa4a0d8HN0hCVcg=; b=s6cRYKmTimFvZZ
	VT/JE6E3UZfqai9l0oDHYsdv/DburhNzPnWs3mIsVQ57AoCJ0jkzRuYvRO8C6Y15MnOWHDlXBSG+m
	lhxOGwn0XyuioCTj3laqQB+FG63dtT9oWt49K5Kle5EYtcL2RNLoW+YwzAaBxXayLDqTH+3lIUaOZ
	r+FKpVGRAdKClnZKSHnvK8oF0yH4aj/qBaGZtS/1ni2EmR2pUCTx/weTqIHRr4uObZhvQwQ9o9ieh
	onw1pXTqjp1kr+a0hmbcC12rD1oLedTTeXRuZPkrQ/dS9c3kj9m2ml9qF6ox4SCnjmT+iaCn2Y55B
	sHAhXKITRVOoXe9Movgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCxII-0003r5-0Q; Sat, 14 Mar 2020 03:16:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCxHh-0003N9-DN; Sat, 14 Mar 2020 03:16:23 +0000
X-UUID: 118a4855d39240c6a24944c84ddb37b7-20200313
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=C2K4Cop7Wb0RFGven4yS2g1JnnYfQ0FnAQYy/7x6fJg=; 
 b=B3sbXdyotBQj1L/y27wG3lh0Uksf7RPvHiB0QpCGs4q653rsbekwFx6g73ucZGZ2NLQojzCC4zqmcK4pZKKEFP1IxvAzXQOUy8LsSbKUOJH2rjNO+1/Da/+pvVKEN3fL65nAEdj++G6jMt7M5zXQWYtGP+XJItSkw3EvAH34OYc=;
X-UUID: 118a4855d39240c6a24944c84ddb37b7-20200313
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1927450065; Fri, 13 Mar 2020 19:16:12 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 20:16:23 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 14 Mar 2020 11:13:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 14 Mar 2020 11:15:58 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 2/2] scsi: ufs-mediatek: add error recovery for suspend and
 resume
Date: Sat, 14 Mar 2020 11:16:00 +0800
Message-ID: <20200314031600.10616-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200314031600.10616-1-stanley.chu@mediatek.com>
References: <20200314031600.10616-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5F831230383B796E830BE403768E4242EE53CFA2BA907BF921702FA6DC027FB22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_201621_459724_4C870AD5 
X-CRM114-Status: GOOD (  10.65  )
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

Once fail happens during suspend and resume flow if the desired low
power link state is H8, link recovery is required for MediaTek UFS
controller.

For resume flow, since power and clocks are already enabled before
invoking vendor's resume callback, simply using ufshcd_link_recovery()
inside callback is fine.

For suspend flow, the device power enters low power mode or is disabled
before suspend callback, thus ufshcd_link_recovery() can not be directly
used in callback. To leverage host reset flow during ufshcd_suspend(),
set link as off state enforcedly to let ufshcd_host_reset_and_restore()
be executed by ufshcd_suspend().

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index c0fd7d2e4d0d..f19e9a64d490 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -499,8 +499,14 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_lpm(hba);
-		if (err)
+		if (err) {
+			/* Set link as off state enforcedly to trigger
+			 * ufshcd_host_reset_and_restore() in ufshcd_suspend()
+			 * for completed host reset.
+			 */
+			ufshcd_set_link_off(hba);
 			return -EAGAIN;
+		}
 	}
 
 	if (!ufshcd_is_link_active(hba))
@@ -519,8 +525,10 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	if (ufshcd_is_link_hibern8(hba)) {
 		err = ufs_mtk_link_set_hpm(hba);
-		if (err)
+		if (err) {
+			err = ufshcd_link_recovery(hba);
 			return err;
+		}
 	}
 
 	return 0;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
