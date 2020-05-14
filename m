Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824F2C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 01:28:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 749B4205CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 01:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g0Li3qhy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 749B4205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DaGZ+eqO2cMxravyw1WkIeuhcG5b2AEhhTiktvCBYX0=; b=g0Li3qhy26lQEv
	8z4n0qjrQQ4vc2/EWhqGBT42QXeYb8kgl9ntJvtb4774VaVtn3etYsX3h2nNe36KpVy0HvcWbFCyX
	H0IwxSRt4wlU4YkbBgZZF8HbTiu2oSJGFrmJZtokyLQVad8gs2HRRlrOpfsOOywQc+GJbVV9ICQ+K
	zlwFBjx4FhtPAA3+pqIdml+VNnCDVeDkngDvM321V19Imo8+e8+/bSRPnW/d7Lg1Nh29Ks61ZAc1R
	nIyXgGH9SCtJ11jJKCcq/4JYJcLpf+1/1gqnfLiWYnkoZ5BMS1cvarehPDTL5pb5kAqlTQajy4zP3
	011SV5ssOPLkpQOgzoxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ2fg-0001Ee-2m; Thu, 14 May 2020 01:28:24 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ2fX-00015n-Ah; Thu, 14 May 2020 01:28:16 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CF1FBDA80C84152DD1C9;
 Thu, 14 May 2020 09:27:52 +0800 (CST)
Received: from huawei.com (10.67.174.156) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Thu, 14 May 2020
 09:27:43 +0800
From: ChenTao <chentao107@huawei.com>
To: <stanley.chu@mediatek.com>, <jejb@linux.ibm.com>,
 <martin.petersen@oracle.com>, <matthias.bgg@gmail.com>
Subject: [PATCH -next] scsi: ufs-mediatek: Make ufs_mtk_fixup_dev_quirks static
Date: Thu, 14 May 2020 09:26:55 +0800
Message-ID: <20200514012655.127202-1-chentao107@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.67.174.156]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_182815_527773_803CF46A 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: linux-scsi@vger.kernel.org, chentao107@huawei.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, alim.akhtar@samsung.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the following warning:

drivers/scsi/ufs/ufs-mediatek.c:585:6: warning:
symbol 'ufs_mtk_fixup_dev_quirks' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: ChenTao <chentao107@huawei.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index c543142554d3..73e4a4f9a3a2 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -582,7 +582,7 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
 	return 0;
 }
 
-void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
+static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 {
 	struct ufs_dev_info *dev_info = &hba->dev_info;
 	u16 mid = dev_info->wmanufacturerid;
-- 
2.22.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
