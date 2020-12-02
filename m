Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9465C64E7C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 12:04:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50AAD221FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 12:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50AAD221FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ak3zHhWvWHmZhC8hB0TfbexlKIN6nYY1YBpzN0Yg+hE=; b=GTJKwXLu62WryzoUoLdA/MbuJ+
	mTUrLo5zDgGcua9UlbTV03jAA7+fbvkM0JMNq+8qZWCCeWCF+9cmrPi4Nwhisqg7vn5+YnSdBNWt2
	O4Oa66bQ83xtJWdBDWG/aRw2uYfO4hyjLrk1z4FYX+z2NVEIbvFpq8KGGurxcJAsYI4Rv0SUWaDD7
	YfzDwEfPZag6LHG4nIFa31D+JmfLsfGa2WyDwp5I/kqi/ra3CGlB4n1QxPNxSjfF0APr0es8+ArkU
	wdqRcomRgoV9FxBEWStez5J90NSknvf3QJtDEdTfZ/paMjMX8S7erOKGsmexAj64nYTGhgtsoQ3Fg
	+TdJDxog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkQrx-0000j1-Ca; Wed, 02 Dec 2020 12:04:25 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkQrr-0000gU-NA; Wed, 02 Dec 2020 12:04:20 +0000
IronPort-SDR: g9jAffxBAYy8vjgsNRxjoVmXcn5jzUqBIOPo+H+d7pjKM2N0MQAF2P1J+MMaQ/geTBFjFRX5N9
 rK3I9UUZsXvLNovXuvQHgp/Izv6AO8JuuKNSyyYANy1cb44xHKhqe9W6DBfOwQOTkLRGCh4J51
 qdiZvDUvYqfghv6zpkCMouOtSMX/g3+jsUm77ag86NmDJ2G2+cfOHcl3nqngSzCG/yWWL7bzJT
 Qy8fgXj3ciDGjyrW4/ehRsFpDhCam+ijFEVM8YE/2TD8ybE9S4Emsm3of/3rKgdYoKNX9Zy4m+
 E/w=
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="47540559"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by labrats.qualcomm.com with ESMTP; 02 Dec 2020 04:04:18 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg03-sd.qualcomm.com with ESMTP; 02 Dec 2020 04:04:18 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id F3E5F2106D; Wed,  2 Dec 2020 04:04:17 -0800 (PST)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH V7 3/3] scsi: ufs: Print host regs in IRQ handler when AH8
 error happens
Date: Wed,  2 Dec 2020 04:04:03 -0800
Message-Id: <1606910644-21185-4-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606910644-21185-1-git-send-email-cang@codeaurora.org>
References: <1606910644-21185-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_070419_994076_89F02AF6 
X-CRM114-Status: GOOD (  10.31  )
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
 open list <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When AH8 error happens, all the regs and states are dumped in err handler.
Sometime we need to look into host regs right after AH8 error happens,
which is before leaving the IRQ handler.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Bao D. Nguyen <nguyenb@codeaurora.org>
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Hongwu Su<hongwus@codeaurora.org>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 26c1fa0..4561601 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6060,7 +6060,8 @@ static irqreturn_t ufshcd_check_errors(struct ufs_hba *hba)
 		hba->saved_uic_err |= hba->uic_error;
 
 		/* dump controller state before resetting */
-		if ((hba->saved_err & (INT_FATAL_ERRORS)) ||
+		if ((hba->saved_err &
+		     (INT_FATAL_ERRORS | UFSHCD_UIC_HIBERN8_MASK)) ||
 		    (hba->saved_uic_err &&
 		     (hba->saved_uic_err != UFSHCD_UIC_PA_GENERIC_ERROR))) {
 			dev_err(hba->dev, "%s: saved_err 0x%x saved_uic_err 0x%x\n",
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
