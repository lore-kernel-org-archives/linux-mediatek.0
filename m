Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10968C47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 06:41:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40866120F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 06:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C40866120F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hnIzkyffpIemdceQmS7+ibLU7CuXgYmpQv1N6dZfRao=; b=3PNmaupw7WsBM2
	mRb0UaqArjRQenduf1+umwUb9IAUuGmda8SrepuYkh98DKyYo378nMwsBjtCgotlu2TTnLyhgqtAA
	RqvXahvSDZXuDp+l3HOFy8e9R+1e2IcMEOwwdxepa1Hz5dbt5suan303aLiO6/RLZ5zBvPxNiOsLS
	yYR/yMZNqqYSwjqpkjX1ANRWnqICTzi9LFzOAkwB/Ht/774n2wj4EX9qVVA4m8DnKLsDjIidRRVE/
	FzWRnJyQEAPPpp0NjqP2RedsWttlj8O4R2E+6oMeutagyLdSitO/5hyFIrko47G3c/jySmnGZhIYX
	oiQ8KWICRX3V/6r1kkTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqrta-00Bw0r-3M; Wed, 09 Jun 2021 06:40:58 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqrtM-00Bvzb-Rn; Wed, 09 Jun 2021 06:40:46 +0000
IronPort-SDR: xD2eZaohPZeG4KU0pQSvgHxwAEOLtyzjPOMOF3vdv/PoVtXqLgCs7AH8RukZUs42DQX72FXlMt
 A7/nIBkIQvZa2Byr9zBggnawlJU1Pm587Vp3npX2+8wjuWIwXfdQGhXcZ6wqy9Cc+vrMT1xj24
 Gm3MNqEJIiJzxc9c7rWFd46ATTM4xEg7fBEuR4x3LAxAn9fjAT/NLoTs4xEoB81WeRoCR8gsl5
 tB0/xXzuRQ4cjk0xD2A5G4h/o77XsJkEJcZVoy0Mh0teg2p7euUFj83GxqOizdX0+p/YD58mXC
 eV0=
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="29778252"
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by labrats.qualcomm.com with ESMTP; 08 Jun 2021 23:40:43 -0700
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com)
 ([192.168.140.85])
 by ironmsg02-sd.qualcomm.com with ESMTP; 08 Jun 2021 23:40:42 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 687E321B1D; Tue,  8 Jun 2021 23:40:42 -0700 (PDT)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 ziqichen@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com, cang@codeaurora.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Bean Huo <beanhuo@micron.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org (open list),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v2 1/1] scsi: ufs: Fix a possible use before initialization
 case
Date: Tue,  8 Jun 2021 23:39:34 -0700
Message-Id: <1623220779-22030-1-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_234044_947364_3BC4FC22 
X-CRM114-Status: GOOD (  11.65  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In ufshcd_exec_dev_cmd(), if error happens before lrpb is initialized,
then we should bail out instead of letting trace record the error.

Fixes: a45f937110fa6 ("scsi: ufs: Optimize host lock on transfer requests send/compl paths")
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
---
Change since V1:
- Use codeaurora mail in Signed-off-by tag.

 drivers/scsi/ufs/ufshcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index fe1b5f4..0d54ab7 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -2972,7 +2972,7 @@ static int ufshcd_exec_dev_cmd(struct ufs_hba *hba,
 
 	if (unlikely(test_bit(tag, &hba->outstanding_reqs))) {
 		err = -EBUSY;
-		goto out;
+		goto out_put_tag;
 	}
 
 	init_completion(&wait);
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
