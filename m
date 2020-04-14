Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955FFC2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 06:17:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A2C42072D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 06:17:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TMM/YdZD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A2C42072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0lp5HKUjzQlAIzWpnrw+dnrMrvH/5pss5Cai1dRsWWo=; b=TMM
	/YdZD0Gnb1872UqAz5IxisM3kAWO40OkYOEBg0KCLu+VfBqTwdf1OglTcdNzXdrY4a98a0cb/RxDr
	XJ9urhxlGy6/H2lknaiuZbFeeIkUoTLRAV7BFmISL+5kFjCOR2wsBffC0DXSGW6+qXCyYQ7ZoOZGJ
	peravtLk3s80QcsDrzCS0wDXQXU6POrnfWmQbjySCf2n0Ag9hganWbIa4JpUEFx/QgowGGfVrVuPl
	b644qfhjj4uruG/ELd14y0q8MsN7QqVQnYyx94khcf7jQIm2MNNjSJG2Z6nwrNPbkir+7+VoRBEUt
	IPPikB+Ti0p/9+eLbTcDSEg0WyoK/+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOEsw-0003eV-Bf; Tue, 14 Apr 2020 06:17:26 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOEsS-0003CP-Em; Tue, 14 Apr 2020 06:16:57 +0000
IronPort-SDR: GF+nhx7pQG5Eg2UGkLUudbnUbCQzLoEq+k3j4XEYypW5RCLFBgcA1kgW9dhsR/G1jrHiUQ2pfu
 y4tcVGbk6/oBJWG/HWuxHpiLGKh9Ujh2QzIpFKwO4FTUc9if6Jr1WeBNWUL8yJBUeC7UTcoM4I
 EU3QbUOhpMpT4IGo408k+3dMtD18YNm202DnGiZZMz/bjvXUZXWPNiP6Af9mYJeKv8p8sA8IAg
 RkJvlbQEnfZRQhOTMM1/o3dSLhfBAtguxNZPkYk9V2FZOW2VIEAUIFEJj87g44rsDN4GvnGP68
 L2Y=
X-IronPort-AV: E=Sophos;i="5.72,381,1580803200"; d="scan'208";a="46834943"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by labrats.qualcomm.com with ESMTP; 13 Apr 2020 23:14:56 -0700
Received: from pacamara-linux.qualcomm.com ([192.168.140.135])
 by ironmsg03-sd.qualcomm.com with ESMTP; 13 Apr 2020 23:14:54 -0700
Received: by pacamara-linux.qualcomm.com (Postfix, from userid 359480)
 id CE87E3B21; Mon, 13 Apr 2020 23:14:54 -0700 (PDT)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH v2 1/1] scsi: ufs: full reinit upon resume if link was off
Date: Mon, 13 Apr 2020 23:14:48 -0700
Message-Id: <1586844892-22720-1-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_231656_536438_8C03D31E 
X-CRM114-Status: GOOD (  11.79  )
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
 Venkat Gopalakrishnan <venkatg@codeaurora.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Asutosh Das <asutoshd@codeaurora.org>

During suspend, if the link is put to off, it would require
a full initialization during resume. This patch resets and
restores both the host and the card during initialization,
otherwise, host only reset and restore may fail occasionally.

Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Acked-by: Stanley Chu <stanley.chu@mediatek.com>

Change since v1:
- Incorporated Alim's comments.

---
 drivers/scsi/ufs/ufshcd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 64e42ef..90313c8 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8048,9 +8048,13 @@ static int ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		else
 			goto vendor_suspend;
 	} else if (ufshcd_is_link_off(hba)) {
-		ret = ufshcd_host_reset_and_restore(hba);
 		/*
-		 * ufshcd_host_reset_and_restore() should have already
+		 * A full initialization of the host and the device is
+		 * required since the link was put to off during suspend.
+		 */
+		ret = ufshcd_reset_and_restore(hba);
+		/*
+		 * ufshcd_reset_and_restore() should have already
 		 * set the link state as active
 		 */
 		if (ret || !ufshcd_is_link_active(hba))
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
