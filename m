Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23ED6C2D0C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 05:34:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA71D20718
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 05:34:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n2mzuUHJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p0BakxZe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA71D20718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4ysA5rr0WM1LOPbhL07dBA9wil8NPbRxu1I8R287eI=; b=n2mzuUHJScczRW
	MfYQ/jWwqNBQzr1EP31hrJ8omj3/8RpGv8f3tvUqbmtHZl9DfpCczPTHPcICxN2s6W8Cf25MUm7oC
	4OAQ7tnP4QOKueZlBi/baULhbXbwqGN5pPZCW68q2cI/oqTRD7C6y8dmRw9xAibPuzuEuVvb7FTXm
	5q+FH4hiTA3h/5JmqBX3Wa4GfZd3oPuVKzCjGvWJuLJshwNclX3abqECSJxSqGUupj3pddIdf1xgt
	jf2GLs5miGYN+TdvX3gATpfhFMGdaVcantNiUtjfp5oRnos4g7grz6gG+LW2WdfQBlvGHXAwt/UL7
	2XXzJ9Xy3evX/sLHiz5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilnhD-0008WK-6g; Mon, 30 Dec 2019 05:34:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilnft-00078k-4A; Mon, 30 Dec 2019 05:33:07 +0000
X-UUID: b8ed36d208384a9b893b5dd49df283f6-20191229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lASBnsWC43Rfu6UB24oYUGd0P99a4d4L+O1D0Rkd/kg=; 
 b=p0BakxZeyUmy4+OrwLlFFIwnpTpmvnZoVDazX1F0Qg56PJUrh4Igyn+7zc/wiknx5mQ0oteUBYquY5u82KvZrWyON6GOpYkVhDMZPYlyze4V3+rt/a1TO5V9Ut/QFQFIF9JyFsfjsIwm3Xrq2ig3b4fqUYxE9YosmZj8SUyTaPE=;
X-UUID: b8ed36d208384a9b893b5dd49df283f6-20191229
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1674888027; Sun, 29 Dec 2019 21:32:59 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 29 Dec 2019 21:33:13 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 13:32:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 30 Dec 2019 13:31:31 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>,
 <bvanassche@acm.org>, <f.fainelli@gmail.com>
Subject: [PATCH v2 2/6] scsi: ufs-mediatek: add device reset implementation
Date: Mon, 30 Dec 2019 13:32:26 +0800
Message-ID: <1577683950-1702-3-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1577683950-1702-1-git-send-email-stanley.chu@mediatek.com>
References: <1577683950-1702-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_213305_191609_45571C6C 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: leon.chen@mediatek.com, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add device reset vops implementation in MediaTek UFS driver.

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Bean Huo <beanhuo@micron.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 33 +++++++++++++++++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.h |  9 +++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 83e28edc3ac5..37e2c91fc452 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -6,16 +6,25 @@
  *	Peter Wang <peter.wang@mediatek.com>
  */
 
+#include <linux/arm-smccc.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
 
 #include "ufshcd.h"
 #include "ufshcd-pltfrm.h"
 #include "unipro.h"
 #include "ufs-mediatek.h"
 
+#define ufs_mtk_smc(cmd, val, res) \
+	arm_smccc_smc(MTK_SIP_UFS_CONTROL, \
+		      cmd, val, 0, 0, 0, 0, 0, &(res))
+
+#define ufs_mtk_device_reset_ctrl(high, res) \
+	ufs_mtk_smc(UFS_MTK_SIP_DEVICE_RESET, high, res)
+
 static void ufs_mtk_cfg_unipro_cg(struct ufs_hba *hba, bool enable)
 {
 	u32 tmp;
@@ -269,6 +278,29 @@ static int ufs_mtk_link_startup_notify(struct ufs_hba *hba,
 	return ret;
 }
 
+static void ufs_mtk_device_reset(struct ufs_hba *hba)
+{
+	struct arm_smccc_res res;
+
+	ufs_mtk_device_reset_ctrl(0, res);
+
+	/*
+	 * The reset signal is active low. UFS devices shall detect
+	 * more than or equal to 1us of positive or negative RST_n
+	 * pulse width.
+	 *
+	 * To be on safe side, keep the reset low for at least 10us.
+	 */
+	usleep_range(10, 15);
+
+	ufs_mtk_device_reset_ctrl(1, res);
+
+	/* Some devices may need time to respond to rst_n */
+	usleep_range(10000, 15000);
+
+	dev_info(hba->dev, "device reset done\n");
+}
+
 static int ufs_mtk_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 {
 	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
@@ -303,6 +335,7 @@ static struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.pwr_change_notify   = ufs_mtk_pwr_change_notify,
 	.suspend             = ufs_mtk_suspend,
 	.resume              = ufs_mtk_resume,
+	.device_reset        = ufs_mtk_device_reset,
 };
 
 /**
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 19f8c42fe06f..ce68ce25fdd7 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -6,6 +6,9 @@
 #ifndef _UFS_MEDIATEK_H
 #define _UFS_MEDIATEK_H
 
+#include <linux/bitops.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
+
 /*
  * Vendor specific pre-defined parameters
  */
@@ -29,6 +32,12 @@
 #define VS_SAVEPOWERCONTROL         0xD0A6
 #define VS_UNIPROPOWERDOWNCONTROL   0xD0A8
 
+/*
+ * SiP commands
+ */
+#define MTK_SIP_UFS_CONTROL         MTK_SIP_SMC_CMD(0x276)
+#define UFS_MTK_SIP_DEVICE_RESET    BIT(1)
+
 /*
  * VS_DEBUGCLOCKENABLE
  */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
