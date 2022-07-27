Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD7EC19F28
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 03:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VRZNQyOkJs4UUNmd3rRdWmL0dpq4L3GNAXqHjplj6BU=; b=kFfsHL7wvkJ0XD7sb/ikK85MVc
	sB67zCRua6uD2y0qhvn+bVjIFIlksPGtk0nChbbk4IcTsKAwlTeWHaJHJXbHMMf3nB86iTeTTUMNd
	k2LxpFGJs2v+tYUFk+QqF3piHhsNum2BHBC/8uuZ2zC/sEM95BqGXHkBTiVY4zoMwY4SXEEhVCHKS
	kHzfXkBD+LBjP8dilH8FEqTLHfOUVzH0hYJXbH9ywDR9UfXy1WZRpdkmYFnXUF1O+FVKzLbTY3rUO
	L3j8qtYPOM5IdY04rwk9nQ/d2WpAKEHTHl2l0/YsWqzNWMVuPWs9yOxR8su9dDVUE3L4CIIPRbVXc
	RgaMv6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGY9g-008YYD-31; Wed, 27 Jul 2022 03:56:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGY9d-008YVR-GQ
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 03:56:14 +0000
X-UUID: 673d1cda3ca84d98821ab0c8d9fe8b89-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a0e6a352-3e1b-435b-8f9c-d501f78dd1f1,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:dc5a0cd4-912a-458b-a623-74f605a77e93,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 673d1cda3ca84d98821ab0c8d9fe8b89-20220726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 821399587; Tue, 26 Jul 2022 20:56:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 27 Jul 2022 11:05:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 27 Jul 2022 11:05:28 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH v5] ufs: core: correct ufshcd_shutdown flow
Date: Wed, 27 Jul 2022 11:05:26 +0800
Message-ID: <20220727030526.31022-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_205613_646345_115FBA5F 
X-CRM114-Status: GOOD (  11.01  )
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

After ufshcd_wl_shutdown set device power off and link off,
ufshcd_shutdown could turn off clock/power.

Also remove pm_runtime_get_sync.
The reason why here can remove pm_runtime_get_sync is because,
(1) ufshcd_wl_shutdown -> pm_runtime_get_sync, will resume hba->dev too.
(2) device resume(turn on clk/power) is not required, even if device is in RPM_SUSPENDED.

Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
Cc: <stable@vger.kernel.org> # 5.15.x
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c7b337480e3e..d13c76983555 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9462,12 +9462,8 @@ EXPORT_SYMBOL(ufshcd_runtime_resume);
 int ufshcd_shutdown(struct ufs_hba *hba)
 {
 	if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba))
-		goto out;
-
-	pm_runtime_get_sync(hba->dev);
+		ufshcd_suspend(hba);
 
-	ufshcd_suspend(hba);
-out:
 	hba->is_powered = false;
 	/* allow force shutdown even in case of errors */
 	return 0;
-- 
2.18.0


