Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4597FC64E7C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 10:17:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1363221FA
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 10:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1363221FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esx2HIveRIaqCB1lSHrIr6UH5GVTzfSfCr9raV2JbEI=; b=VDSVt0GrqrvGkJsvg2GQYCGMa/
	fLA2+AaZrc7Sgs5a333uUvdIr50+rBuNUrXd2oty8rVKp7/pfo7C/hARCk4emOpzZ3VJqzrGWGKm+
	kCbMqsFYvygnwqs7DqgAcaZpOYpRAN4XjRLjaX5sjsleZfQabTnnWbRNUSYYf9Hp+0CIsWbwLQGZw
	0d9oVZYIBlMEOYHFefq/rA0tUXCVX38sLa3OEHCeBLoYqZq95yyWNtefh6kx+t0Echh6u8b9SsvtT
	hETaHaLZ3Z11VLnbEbeNtu5HJwjYZr/dSslYoQrq77c16WrQswlr/hQeBXnSEaxgpyKlU+omxOj34
	4jID88qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkPBu-0000aq-MP; Wed, 02 Dec 2020 10:16:54 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkPBp-0000XR-C6; Wed, 02 Dec 2020 10:16:50 +0000
IronPort-SDR: 9UxQbMwQrfGuYT9lIOj5WjTrjhFzSwzyG6QEhDWBrSD49wqaGUZEdP3dCnlByAeE5xCMYfPpZS
 mnYuhMQcNvnTQkHrhxhgA9lCdYKB4i9ti8RTSlmxIzHbi610pP8lOpFumlvvCaH+2oWMMkEKXe
 DXpxqrM8QgAaGo+WBlvGXnYr+3jl4KSxI5WQupW2cjDSTORT6dGe1YD60puHOQJ0Kmct4cfHCg
 iXowTCd7Hx++wVosUPvdikOkOZeylp9RAnH4UO06K2lAO8BwCqPB9d/Ga10BX9uSViV1FFvaZU
 yOs=
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="47540141"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by labrats.qualcomm.com with ESMTP; 02 Dec 2020 02:16:49 -0800
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg03-sd.qualcomm.com with ESMTP; 02 Dec 2020 02:16:48 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id EF2002108B; Wed,  2 Dec 2020 02:16:48 -0800 (PST)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH V6 3/3] scsi: ufs: Print host regs in IRQ handler when AH8
 error happens
Date: Wed,  2 Dec 2020 02:16:33 -0800
Message-Id: <1606904194-20806-4-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606904194-20806-1-git-send-email-cang@codeaurora.org>
References: <1606904194-20806-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_051649_566722_7A64501E 
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
index e21b40c..e8e6e68 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6058,7 +6058,8 @@ static irqreturn_t ufshcd_check_errors(struct ufs_hba *hba)
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
