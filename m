Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AEDC43603
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 08:37:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC4B2073D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 08:37:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="npyBQzRV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JJ+JXQZh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC4B2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRQxhSDfgjPAAgpQUfxG0LIjJr6iPbpEToFIHeAztN0=; b=npyBQzRVE6L5Nr
	iVsULCC5QjUaKmALlQ+Q02GHavdcLxCkQjfFo72rnrPUc49eLAb947Xlxu1XOWZ5xDTlWKyEciTQi
	kMlI8VmQrlb8E3cH5TcpmJiFNg9H0TKPNeTg+SbGoSJ0FiNap8yUaWb26pr92CijYYRk1NlyqSQuv
	4h8OX1osqLQTp8WYqBNdsqm+hItYldogKWUwc2v6RHLZqjHFI1Gle7zBuvRBOPODTago4lDrqsVWY
	80KubjlCq72IPMolbZFh4JFBYtv8xs8iOue04zxNunLRTdiEpbi1RNsqMFlmT++xbqyLM5WjEs4P5
	W/2fzygLCLKh97bZLBcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieEXy-0007VG-2E; Mon, 09 Dec 2019 08:37:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieEXv-0007UA-Hx; Mon, 09 Dec 2019 08:37:36 +0000
X-UUID: af7a9372158d49eda43e9526ab55cd54-20191209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FsOPpGNcvyN3hqCpKWKad5Cxcn0GwUWSQI3FseIG2Rg=; 
 b=JJ+JXQZhVK2zvQGAqUuXloTBIHvnoLksjCyLgRgouq0Uif5uTIfVV9NwyVSv4mjvLPGrrEvtygZHfCvrr1o3b1B8KnuFICqOSMO/RJLPZqXx7tUrgKgKuBEdWKHGQx8oVTmvfvvmm+wS/IvlUtRWYGO3a3Skhut3fq80GaFBnAI=;
X-UUID: af7a9372158d49eda43e9526ab55cd54-20191209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1491707096; Mon, 09 Dec 2019 00:37:32 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 00:30:12 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 16:28:55 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 9 Dec 2019 16:29:01 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>,
 <f.fainelli@gmail.com>
Subject: [PATCH v2 2/2] scsi: ufs-mediatek: add device reset implementation
Date: Mon, 9 Dec 2019 16:29:14 +0800
Message-ID: <1575880154-6099-3-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1575880154-6099-1-git-send-email-stanley.chu@mediatek.com>
References: <1575880154-6099-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_003735_607894_CC106377 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: leon.chen@mediatek.com, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add device reset vops implementation in MediaTek UFS driver.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 27 +++++++++++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.h |  7 +++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 83e28edc3ac5..6a3ec11b16db 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -6,10 +6,12 @@
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
@@ -269,6 +271,30 @@ static int ufs_mtk_link_startup_notify(struct ufs_hba *hba,
 	return ret;
 }
 
+static void ufs_mtk_device_reset(struct ufs_hba *hba)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(MTK_SIP_UFS_CONTROL, UFS_MTK_SIP_DEVICE_RESET,
+		      0, 0, 0, 0, 0, 0, &res);
+	/*
+	 * The reset signal is active low. UFS devices shall detect
+	 * more than or equal to 1us of positive or negative RST_n
+	 * pulse width.
+	 *
+	 * To be on safe side, keep the reset low for at least 10us.
+	 */
+	usleep_range(10, 15);
+
+	arm_smccc_smc(MTK_SIP_UFS_CONTROL, UFS_MTK_SIP_DEVICE_RESET,
+		      1, 0, 0, 0, 0, 0, &res);
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
@@ -303,6 +329,7 @@ static struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.pwr_change_notify   = ufs_mtk_pwr_change_notify,
 	.suspend             = ufs_mtk_suspend,
 	.resume              = ufs_mtk_resume,
+	.device_reset        = ufs_mtk_device_reset,
 };
 
 /**
diff --git a/drivers/scsi/ufs/ufs-mediatek.h b/drivers/scsi/ufs/ufs-mediatek.h
index 19f8c42fe06f..b03f601d3a9e 100644
--- a/drivers/scsi/ufs/ufs-mediatek.h
+++ b/drivers/scsi/ufs/ufs-mediatek.h
@@ -6,6 +6,8 @@
 #ifndef _UFS_MEDIATEK_H
 #define _UFS_MEDIATEK_H
 
+#include <linux/bitops.h>
+
 /*
  * Vendor specific pre-defined parameters
  */
@@ -29,6 +31,11 @@
 #define VS_SAVEPOWERCONTROL         0xD0A6
 #define VS_UNIPROPOWERDOWNCONTROL   0xD0A8
 
+/*
+ * SiP commands
+ */
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
