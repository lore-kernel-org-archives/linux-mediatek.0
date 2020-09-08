Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAE8C43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:45:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C932F2065E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oml0+vVs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HHJnF2BY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C932F2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PILwAMNzVY+XlVnMXXFUNIW9T7JvsE5WRdSsUdVv2vg=; b=Oml0+vVsr/wF5tDi5lFaKjn6C
	wmQ4BQxQndo+m+b31E683xYkhS7AzN/gQn28hW9y6XFsijagqK+Qs2v1lgpLdNWSI/WGj5CrxYk3x
	BX61Zn8cVvRzqPlA8r7oQmr3FpgZK+YicyyUiSq8gtvH4qB7XjFT9klv2U0uGiXdCV+PAicu0cLwt
	OlZ9Bi7ReqKftWGnBghJA2VC8vXlNZ/+lcb2rNuu7BKMXDTQnOcLhN9vMJird/AMRE5jWsBPPQgiA
	3bp7r1NMf+gSvFlc0qAdEBGSCm+Oa6UoVBFKTRMWkjx/U1mTBIGl+PIS1tfIP+ttuSzzBnskdBcr0
	bWXtikhpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFXNj-0004Sc-Mi; Tue, 08 Sep 2020 06:45:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFXNc-0004PL-EZ; Tue, 08 Sep 2020 06:45:25 +0000
X-UUID: fa789bdebf1d45c9bf9770eb7389d629-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GsiSLSlMLBzu8jCR1E1cgx6iwjYy7jwBAV6+lW5fHzQ=; 
 b=HHJnF2BYHhvzwAc3UFmOG0Q7h7U4S38jlwtV2c/gUH81t/dDEXBO1aQEF69C8gyqObwuSgX/BO9j+9Veys2KLsDAy7xRxWhCXZ+sd4dMLZrxTalbtn4LIDvB4KSTpmr9fotgXvip4JMisWpbhWdrn5XlqMDuVsIUE4KuSQtFhOE=;
X-UUID: fa789bdebf1d45c9bf9770eb7389d629-20200907
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 479636662; Mon, 07 Sep 2020 22:45:19 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 23:45:18 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 14:45:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Sep 2020 14:45:10 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH 2/4] scsi: ufs-mediatek: Fix HOST_PA_TACTIVATE quirk
Date: Tue, 8 Sep 2020 14:45:05 +0800
Message-ID: <20200908064507.30774-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200908064507.30774-1-stanley.chu@mediatek.com>
References: <20200908064507.30774-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_024524_651486_CA6ED730 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simply add HOST_PA_TACTIVATE quirk back since it was incorrectly
removed before.

Fixes: 47d054580a75 ("scsi: ufs-mediatek: fix HOST_PA_TACTIVATE quirk for Samsung UFS Devices")
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 7487b25fa651..887c03e8bcc0 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -672,13 +672,7 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
 
 static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 {
-	struct ufs_dev_info *dev_info = &hba->dev_info;
-	u16 mid = dev_info->wmanufacturerid;
-
 	ufshcd_fixup_dev_quirks(hba, ufs_mtk_dev_fixups);
-
-	if (mid == UFS_VENDOR_SAMSUNG)
-		hba->dev_quirks &= ~UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE;
 }
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
