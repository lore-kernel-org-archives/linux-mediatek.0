Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23664C54E64
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Mar 2024 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+d8jAmmQE7faFpsW3herBD/76TvmpU8bwHDK9j4rTvU=; b=QSDNzYVM3i2FLMDwN8MQndzQ+7
	4amSn3g6ujG6JD9uAPri0Mq2g8c0WoO0AW/S2ptR2Z51RcFn8/MfO00yQVMS/4MTvnfh3fSLxlROD
	4R5i2oeaKCFhdtxMg2kRoMoHVQDqULwKSGx6GBY1pAWcjvekZvWg3eg+Hte/o4ZfycM8y+/d/Q20w
	/lyC3U16LwPnQoSK8HIhrdFIN87PEY4CX3Z6fnWgTTDy6RbjNjhLz7GF/rBiaD3jO57k8GRPMczvf
	Ns9wclaigX6d6ivl6frHoI6XnRUVqkuNziLW6qJ9XbRHrT6LYHfo0irzAtMp4C+QeG/Qw19TaXV+l
	+KOYmN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpnIY-0000000Dcu4-0xvN;
	Thu, 28 Mar 2024 10:47:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpnIU-0000000DcsM-1QuP
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Mar 2024 10:47:51 +0000
X-UUID: 9b9467c2ecf011ee96d5dfc950b7243d-20240328
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+d8jAmmQE7faFpsW3herBD/76TvmpU8bwHDK9j4rTvU=;
	b=NnwWYe4HxcmPAshbxE20XZvVLvUWuYZ5bG7oBNyzBU159NTGgTJBL9AG/6hJ2Bhyslq/YP9W1xjVemwKECQTOS67wx9GciV/QtfZ2Po56k6zI0+S8nXpAvh3r8mQ80KcuVEwhMgx/Q7bbZ56yysKB4DpcyAyKJ/3uRazAi7xSls=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:e9668d94-824a-45a1-b28e-d6f5035fd2be,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:bf4f0a82-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 9b9467c2ecf011ee96d5dfc950b7243d-20240328
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 898071265; Thu, 28 Mar 2024 03:47:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Mar 2024 18:47:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Mar 2024 18:47:09 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>
Subject: [PATCH v1] ufs: core: wlun suspend dev/link state error recovery
Date: Thu, 28 Mar 2024 18:47:07 +0800
Message-ID: <20240328104707.1452-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.288900-8.000000
X-TMASE-MatchedRID: xKwqdG8zLkeAAYHsHSPDcxn0UD4GU5IqKx5ICGp/WtEmu2XKsBcW8RUO
	nrDGROOdLqWDA5QpvGM5QOj/9mEf0+DjmHulaCpRKaMQ6tw7oDJMkOX0UoduuQqiCYa6w8tv0Qx
	Bl5kNTSd1q3E60KR9HnTv9Bst6w/PDPIzF4wRfrAURSScn+QSXt0H8LFZNFG7MGpgBNI6BaNY5I
	+rbevWdKNDgm1wxJWZIPSOkUPcWW/DBPCKp6l351POE1CXbZ+DBXd/blXpfhH2zj3Yg/gmLw4CB
	GNcrlBpQPJfIrUZGpaAhOcaQrQ0U1GyRcoeF18qmKP0zzpTAeGwod8xOMKmvMCBO+zxAW5pftwZ
	3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.288900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7B89F9B1F6D6CAFDEF7C7BA0769095B830BEC2CA89DDEB27F3B0471B6AAED0562000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_034750_431099_4AD1BBDE 
X-CRM114-Status: GOOD (  13.40  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

When wl suspend error occurs, for example, BKOP or SSU timeout, the host
triggers an error handler and returns -EBUSY to break the wl suspend process.
However, it is possible for the runtime PM to enter wl suspend again before
the error handler has finished, and return -EINVAL because the device is
in an error state. To address this, ensure that the rumtime PM waits for the
error handler to finish, or trigger the error handler in such cases,
because returning -EINVAL can cause the I/O to hang.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index e30fd125988d..0a32f423f6a0 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9791,7 +9791,10 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	/* UFS device & link must be active before we enter in this function */
 	if (!ufshcd_is_ufs_dev_active(hba) || !ufshcd_is_link_active(hba)) {
-		ret = -EINVAL;
+		/*  Wait err handler finish or tirgger err recovery in this case */
+		if (!ufshcd_eh_in_progress(hba))
+			ufshcd_force_error_recovery(hba);
+		ret = -EBUSY;
 		goto enable_scaling;
 	}
 
-- 
2.18.0


