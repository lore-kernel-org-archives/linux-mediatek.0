Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF51DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 09:24:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 803232072D
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 09:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OFdw3IMK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HEFKWHlT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 803232072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NX/A/bu5nRVlpwgpQjntX66Mb//vIo7nq8yKtC4wBXI=; b=OFdw3IMKVvUXxx
	5U3VJc7LEHXf5rqPcc7nXHHLR4RZ+r16eFSFUyHE9DJsTu/j1eT+y1dSOh6FvVDGNiyDOX1soZ0xc
	QdVrcbfrLTSLxNPUUZmFJV1kOJce2QqpSVkqG/MNfxGpR9inxsCgbiw4aMKZiomLzuO8oqAfsRYNH
	sTVLi4KjEUpE8ji9D2WEHWYlJ4TyAJoRvDOWmGGhbuBgklLvUTtINBNuRG4+rbpliFn+qhk3a0uwC
	dTyilxOlIfkwBjZwUV87YvK7fFUqa3ev+gA/r1Ec5mU8WEXrE8JnwnBx8uRyqWuJYS9rGV+6xsPB8
	XpX6xzzt4UAtD2YQctBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jebFA-0005s9-19; Fri, 29 May 2020 09:24:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jebEd-0005Nr-0U; Fri, 29 May 2020 09:23:28 +0000
X-UUID: 59152001ec6c42cabc5e7b3c07af21f8-20200529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ckHEM7GVI4e4nimxXTABhbmcvCORVQbBj1jfInkgoAg=; 
 b=HEFKWHlTSIeuubldwrrsmrXO91sFckAW6b3Ogl7IJpmuxDN1kgOIbNTJBVFsm7738Qc2TKXDPwrK24H2hZuPe8l4e9FsYvEhzKgqNGTXfxgIfVkS4GBM5DZ+rzJ8jmpR6fU9J35f7TKrnRqBrAQRj0FYC/BJB33nJ4f4e/Mcqqw=;
X-UUID: 59152001ec6c42cabc5e7b3c07af21f8-20200529
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 531215680; Fri, 29 May 2020 01:23:13 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 02:23:18 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 17:23:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 29 May 2020 17:23:10 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 3/5] scsi: ufs-mediatek: Introduce low-power mode for
 device power supply
Date: Fri, 29 May 2020 17:23:08 +0800
Message-ID: <20200529092310.1106-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200529092310.1106-1-stanley.chu@mediatek.com>
References: <20200529092310.1106-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_022327_058451_E443D51F 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: pengshun.zhao@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>,
 bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Allow device power supply to enter low-power mode if device will
do nothing to save more power.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Pengshun Zhao <pengshun.zhao@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 3c85f5e97dea..5f41b7b7db8f 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -12,6 +12,7 @@
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/soc/mediatek/mtk_sip_svc.h>
 
 #include "ufshcd.h"
@@ -521,6 +522,19 @@ static int ufs_mtk_link_set_lpm(struct ufs_hba *hba)
 	return 0;
 }
 
+static void ufs_mtk_vreg_set_lpm(struct ufs_hba *hba, bool lpm)
+{
+	if (!hba->vreg_info.vccq2)
+		return;
+
+	if (lpm & !hba->vreg_info.vcc->enabled)
+		regulator_set_mode(hba->vreg_info.vccq2->reg,
+				   REGULATOR_MODE_IDLE);
+	else if (!lpm)
+		regulator_set_mode(hba->vreg_info.vccq2->reg,
+				   REGULATOR_MODE_NORMAL);
+}
+
 static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	int err;
@@ -537,6 +551,12 @@ static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 			ufshcd_set_link_off(hba);
 			return -EAGAIN;
 		}
+		/*
+		 * Make sure no error will be returned to prevent
+		 * ufshcd_suspend() re-enabling regulators while vreg is still
+		 * in low-power mode.
+		 */
+		ufs_mtk_vreg_set_lpm(hba, true);
 	}
 
 	if (!ufshcd_is_link_active(hba))
@@ -554,6 +574,7 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		phy_power_on(host->mphy);
 
 	if (ufshcd_is_link_hibern8(hba)) {
+		ufs_mtk_vreg_set_lpm(hba, false);
 		err = ufs_mtk_link_set_hpm(hba);
 		if (err) {
 			err = ufshcd_link_recovery(hba);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
