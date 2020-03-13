Return-Path: <SRS0=2fV0=46=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F82C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:03:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5F9520746
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tB1EucYM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iCHsI1XA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5F9520746
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ebTP1lRHJ20B6cnKEbi4xOAuRlwHPCVMhuuxDBNsH0=; b=tB1EucYMrymFGb
	YYl8zsWzlEggXL4AFO33hclREyPGElGmKFqsjXVC0JFfQPzQlMU42rfcuGHAYrljzoLIb8RLACsLr
	NT66jO2HAe/5AbSakf/2T/SyJblLgNuVzmoIZmFu7IQPEz2d+EU7Krc9GcfTlk8/kWLRpcy8EdNf6
	3+TAG9YxfVCCESxiEo+st3SyzOPA4adEOjVFYEzARyx/kylNjC1dLwai63C6A+ZnOaNvrAyMSmtN0
	oWBtas9BBZcMzKnWFyn3oZXhEZf9IAyhtmQQhDNCrVmHpGm9zlYMpGU7eiY2ElAehUqndGHV5/Zmn
	2dpuj8RQkCaLocy3DBbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCgDj-0008Ta-TE; Fri, 13 Mar 2020 09:03:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCgCR-00072n-LW; Fri, 13 Mar 2020 09:01:49 +0000
X-UUID: aa0209d61cf643c2b2501dedeb3a1ee5-20200313
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5GP+rWEB4Ry+EREqzXdiuDUuJlQ0dpJ3Jx7HxcM2j1c=; 
 b=iCHsI1XA9UuKuL8dMTzTrCf5hfz/GttOrkp0YoYuhsm9Kq9RaQbZEv49hEVjc9I2rTsxLOjakGbRlXwajbV8Brt1t85eAzIWslVzJINuiVeLkOEkgjy20DThOJKn2Sv1HZDO41LKOYquYvxLc8jajI6p+ztEaaayV7p9p1M/XSc=;
X-UUID: aa0209d61cf643c2b2501dedeb3a1ee5-20200313
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1268159264; Fri, 13 Mar 2020 01:01:44 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 02:01:57 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 16:58:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 13 Mar 2020 17:00:32 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v4 3/8] scsi: ufs: use an enum for host capabilities
Date: Fri, 13 Mar 2020 17:00:58 +0800
Message-ID: <20200313090103.15390-4-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200313090103.15390-1-stanley.chu@mediatek.com>
References: <20200313090103.15390-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 746D601E7189448243DD6ED4F47D36CD3759AD0F6EE8D10DB828FC3623A144642000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_020147_752490_A4EA0D51 
X-CRM114-Status: GOOD (  10.17  )
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

Use an enum to specify the host capabilities instead of #defines inside the
structure definition.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Can Guo <cang@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd.h | 65 ++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 5cf79d2319a6..fec004cd8054 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -501,6 +501,43 @@ enum ufshcd_quirks {
 	UFSHCD_QUIRK_BROKEN_UFS_HCI_VERSION		= 1 << 5,
 };
 
+enum ufshcd_caps {
+	/* Allow dynamic clk gating */
+	UFSHCD_CAP_CLK_GATING				= 1 << 0,
+
+	/* Allow hiberb8 with clk gating */
+	UFSHCD_CAP_HIBERN8_WITH_CLK_GATING		= 1 << 1,
+
+	/* Allow dynamic clk scaling */
+	UFSHCD_CAP_CLK_SCALING				= 1 << 2,
+
+	/* Allow auto bkops to enabled during runtime suspend */
+	UFSHCD_CAP_AUTO_BKOPS_SUSPEND			= 1 << 3,
+
+	/*
+	 * This capability allows host controller driver to use the UFS HCI's
+	 * interrupt aggregation capability.
+	 * CAUTION: Enabling this might reduce overall UFS throughput.
+	 */
+	UFSHCD_CAP_INTR_AGGR				= 1 << 4,
+
+	/*
+	 * This capability allows the device auto-bkops to be always enabled
+	 * except during suspend (both runtime and suspend).
+	 * Enabling this capability means that device will always be allowed
+	 * to do background operation when it's active but it might degrade
+	 * the performance of ongoing read/write operations.
+	 */
+	UFSHCD_CAP_KEEP_AUTO_BKOPS_ENABLED_EXCEPT_SUSPEND = 1 << 5,
+
+	/*
+	 * This capability allows host controller driver to automatically
+	 * enable runtime power management by itself instead of waiting
+	 * for userspace to control the power management.
+	 */
+	UFSHCD_CAP_RPM_AUTOSUSPEND			= 1 << 6,
+};
+
 /**
  * struct ufs_hba - per adapter private structure
  * @mmio_base: UFSHCI base register address
@@ -653,34 +690,6 @@ struct ufs_hba {
 	struct ufs_clk_gating clk_gating;
 	/* Control to enable/disable host capabilities */
 	u32 caps;
-	/* Allow dynamic clk gating */
-#define UFSHCD_CAP_CLK_GATING	(1 << 0)
-	/* Allow hiberb8 with clk gating */
-#define UFSHCD_CAP_HIBERN8_WITH_CLK_GATING (1 << 1)
-	/* Allow dynamic clk scaling */
-#define UFSHCD_CAP_CLK_SCALING	(1 << 2)
-	/* Allow auto bkops to enabled during runtime suspend */
-#define UFSHCD_CAP_AUTO_BKOPS_SUSPEND (1 << 3)
-	/*
-	 * This capability allows host controller driver to use the UFS HCI's
-	 * interrupt aggregation capability.
-	 * CAUTION: Enabling this might reduce overall UFS throughput.
-	 */
-#define UFSHCD_CAP_INTR_AGGR (1 << 4)
-	/*
-	 * This capability allows the device auto-bkops to be always enabled
-	 * except during suspend (both runtime and suspend).
-	 * Enabling this capability means that device will always be allowed
-	 * to do background operation when it's active but it might degrade
-	 * the performance of ongoing read/write operations.
-	 */
-#define UFSHCD_CAP_KEEP_AUTO_BKOPS_ENABLED_EXCEPT_SUSPEND (1 << 5)
-	/*
-	 * This capability allows host controller driver to automatically
-	 * enable runtime power management by itself instead of waiting
-	 * for userspace to control the power management.
-	 */
-#define UFSHCD_CAP_RPM_AUTOSUSPEND (1 << 6)
 
 	struct devfreq *devfreq;
 	struct ufs_clk_scaling clk_scaling;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
