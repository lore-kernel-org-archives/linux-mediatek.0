Return-Path: <SRS0=jjMD=22=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00C0C00523
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 04:56:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82E7721775
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jan 2020 04:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UIDPZYyj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sxFDcAXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82E7721775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VR2YzFVnIjM213XUoXaslOMYfgvdP6weE26/mFMrJhw=; b=UIDPZYyj07xNzD
	kWg8LAI2Mm17Ie6Mp8Ea7YKVgpOLfulPAiQywPlncScA6FvY6xJ586yuYNGNh/wm0kKjbw6HPgimn
	pwAIxrTrQnQxQwUkYIubexfi8K5iLADUVuzMVbF8uN2jaFA1va98ohYbLA49iYXBCchSEX0kf3Kfo
	TajyqgqHN84g6FLaa+1/DHGzjmQFhgMgBsKgZwm98GS6bFtWSLF7vhwoKRkyQjczTzVXwafvStbfF
	NqPwK/hBbIY0f+zt2kZrLRojq1TZnMREDSqp46OguJblwFjVft6W71ktfqUtmCPqFkXpPqPtvouQq
	/6DmNleXmHOUuFhV9ZCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inxxS-0000mc-Ee; Sun, 05 Jan 2020 04:56:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inxx5-0000Ly-1U; Sun, 05 Jan 2020 04:55:49 +0000
X-UUID: 58c8ebfcda6845048e64aa01df892443-20200104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=YGh3xGeqTpgiFQjArHGM6gr1I1wCDGexssGbJbNSies=; 
 b=sxFDcAXdur18XAQ9CUx9A09JQmNrVZNeQpSjIEj9mSwxFczZHzMxfjJ/7g4tDkaelf6G6FzDxrNUMYe2cWmEhxXgy6Bz5ZQrx9aKetiLYDpT4S/+QcUOW3u7U4DvR4h9cvO9mwgdsCf7u2UbuXLwEfFIXAsStK3sYSCn0ANapWc=;
X-UUID: 58c8ebfcda6845048e64aa01df892443-20200104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 763140428; Sat, 04 Jan 2020 20:55:42 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 4 Jan 2020 20:56:08 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 12:54:38 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sun, 5 Jan 2020 12:53:59 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 3/3] scsi: ufs-mediatek: add apply_dev_quirks variant
 operation
Date: Sun, 5 Jan 2020 12:55:18 +0800
Message-ID: <1578200118-29547-4-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1578200118-29547-1-git-send-email-stanley.chu@mediatek.com>
References: <1578200118-29547-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B9DC6888F24F8BFE6100FFBAB54341996EE2D2938860AB7865CCA8ECF7A19D6A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200104_205547_091937_FA2895A4 
X-CRM114-Status: UNSURE (   7.70  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add vendor-specific variant callback "apply_dev_quirks"
in MediaTek UFS driver.

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Asutosh Das <asutoshd@codeaurora.org>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Bean Huo <beanhuo@micron.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 41f80eeada46..8d999c0e60fe 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -16,6 +16,7 @@
 
 #include "ufshcd.h"
 #include "ufshcd-pltfrm.h"
+#include "ufs_quirks.h"
 #include "unipro.h"
 #include "ufs-mediatek.h"
 
@@ -405,6 +406,15 @@ static int ufs_mtk_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	return 0;
 }
 
+static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba,
+				    struct ufs_dev_desc *card)
+{
+	if (card->wmanufacturerid == UFS_VENDOR_SAMSUNG)
+		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TACTIVATE), 6);
+
+	return 0;
+}
+
 /**
  * struct ufs_hba_mtk_vops - UFS MTK specific variant operations
  *
@@ -417,6 +427,7 @@ static struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.setup_clocks        = ufs_mtk_setup_clocks,
 	.link_startup_notify = ufs_mtk_link_startup_notify,
 	.pwr_change_notify   = ufs_mtk_pwr_change_notify,
+	.apply_dev_quirks    = ufs_mtk_apply_dev_quirks,
 	.suspend             = ufs_mtk_suspend,
 	.resume              = ufs_mtk_resume,
 	.device_reset        = ufs_mtk_device_reset,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
