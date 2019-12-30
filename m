Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BB2C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 08:21:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EFD620748
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 08:21:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jkOHfjHM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XBrCAvj1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EFD620748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6and6r0OPZRXKpDS0pIurrKRljslRG0W4nz6gfp1Dcg=; b=jkOHfjHMl/6Xni
	+A+rAwQcylAhf7rqqO58E07F+MnaEWeR4hsln4Vyfs3yOPlDIULlM+vbCpYq/J05XJsTdigy0szPc
	PnEGcxVSfGw7STUkGtAgB9s+7roejtzMP6gJl3R3we+7tkP002kfguj99HM7PkYCIFLgbWaDz+Vlf
	JXyVvh+Sq5NVuEg9QYeJhuoDc+v+Rr3lOetj5fLqs292Ssl/8aTvC1dG1Yip4Qfbch4hOhYQdsrAq
	GiLwIvbK7Xz76cqPclmGv92K01Wt2XeTP3dvB6mSvWu3VnXeBI7GUZ6v0HRSQ2ouSM3bt/xLekXl5
	Pk0YAdFH4amBvYxXgNEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilqJG-00040i-1L; Mon, 30 Dec 2019 08:21:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilqJC-00040K-ED; Mon, 30 Dec 2019 08:21:51 +0000
X-UUID: d45579a75ee345dcb69f50d72223f7f7-20191230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5R6N7XJB2+tt8KF/gBYonmpANV9A07p3yQjPCAKO6yg=; 
 b=XBrCAvj1Y7v/dHdJfMKsAXYfnMrqUs6JqpkhGnp/MW3C/mKEw4LvObiMIzhT3rHflsi6uRQiz0g7bf1bTnUB6ISykKtsNjZKaMkUPsuTCcFoocOY75+FbEhuBkzBX/qDPfY8+eqf4RBi12pHXsP6uE5Z7p93AoIXkKsFS6wdptI=;
X-UUID: d45579a75ee345dcb69f50d72223f7f7-20191230
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 633997492; Mon, 30 Dec 2019 00:21:48 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 00:12:50 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 16:11:42 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 30 Dec 2019 16:12:01 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>,
 <bvanassche@acm.org>, <subhashj@codeaurora.org>
Subject: [PATCH v1 1/2] scsi: ufs: set device as default active power mode
 during initialization only
Date: Mon, 30 Dec 2019 16:12:25 +0800
Message-ID: <1577693546-7598-2-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1577693546-7598-1-git-send-email-stanley.chu@mediatek.com>
References: <1577693546-7598-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_002150_485428_774987BA 
X-CRM114-Status: UNSURE (   9.48  )
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
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Currently ufshcd_probe_hba() always sets device status as "active".
This shall be by an assumption that device is already in active state
during the boot stage before kernel.

However, if link is configured as "off" state and device is requested
to enter "sleep" or "powerdown" power mode during suspend flow, device
will NOT be waken up to "active" power mode during resume flow because
device is already set as "active" power mode in ufhcd_probe_hba().

Fix it by setting device as default active power mode during
initialization only, and skipping changing mode during PM flow
in ufshcd_probe_hba().

Fixes: 7caf489b99a4 (scsi: ufs: issue link starup 2 times if device isn't active)
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Bean Huo <beanhuo@micron.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Subhash Jadavani <subhashj@codeaurora.org>
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index ed02a704c1c2..9abb7085a5d0 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6986,7 +6986,8 @@ static int ufshcd_probe_hba(struct ufs_hba *hba)
 	ufshcd_tune_unipro_params(hba);
 
 	/* UFS device is also active now */
-	ufshcd_set_ufs_dev_active(hba);
+	if (!hba->pm_op_in_progress)
+		ufshcd_set_ufs_dev_active(hba);
 	ufshcd_force_reset_auto_bkops(hba);
 	hba->wlun_dev_clr_ua = true;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
