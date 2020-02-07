Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBD0C2D0B1
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 07:04:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 905DF222C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 07:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DxGMK7ps";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IDDf/v7q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 905DF222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VS3JoSodlj6YpwBaR3/BObV1d+dKQpBtZYfY+uESXjM=; b=DxGMK7psppLKCQ
	f4AvTJnPFyQHNtthvMJLQkt93706cbms2z16Lj+/6EHsFZlOu7Y3jbc+2Rg6XAY09J1/STT0of6RB
	jI8C3atU+RHRypfC79r6EVfPzWJ/gmIhIXlN2dcBOZcdPQWGc/EwybdUl6TjHXwkEbN+PbRzLovqb
	Z0KQgH48Gucc4ltxDZcUd/NU4z2Nht8ce+JCnMooeMR9rKlhc1wf/Je8N78cYcpRTeeoZqPe9H4n5
	bD3XcetKNSgXz8b4Flal92L3Z38Izby5P79LDsLvV5godDnaaxJM7p3koN8nwEHIuFNxNlg3Hd3xG
	Sk/jbk3VBj1KSLwL270A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izxgm-0005iH-1Y; Fri, 07 Feb 2020 07:04:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izxgL-0005I7-WE; Fri, 07 Feb 2020 07:04:07 +0000
X-UUID: 45292e0e3fe94d3d99ea0416fd57c0cd-20200206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6jM/oR06razYnFBu9+gewGY3eZHYhaG1HA0jqsKM5V0=; 
 b=IDDf/v7qRZ49wRCyJyBLD3I7xIp+7uXiIecE3zVt8vnkCZwYZILvjE8S/1gqiUr1V3kKHCpfNTDY4+wbwY2PvtiCEi5xcs0uENPZRlOm6rl2PVW3IL5aYR8Wn4FLNjr7aOy0hIeCE4tDrzMMHu97XEU9uJrZ36aUBRZqmv1HNfc=;
X-UUID: 45292e0e3fe94d3d99ea0416fd57c0cd-20200206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 132922902; Thu, 06 Feb 2020 23:04:01 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 6 Feb 2020 23:04:42 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Feb 2020 15:02:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 7 Feb 2020 15:04:28 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <beanhuo@micron.com>
Subject: [PATCH v1 2/2] scsi: ufs: introduce common function to disable host
 TX LCC
Date: Fri, 7 Feb 2020 15:03:57 +0800
Message-ID: <20200207070357.17169-3-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200207070357.17169-1-stanley.chu@mediatek.com>
References: <20200207070357.17169-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_230406_036390_9088D049 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Many vendors would like to disable host TX LCC during initialization
flow. Introduce a common function for all users to make drivers easier to
read and maintained. This patch does not change any functionality.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/cdns-pltfrm.c  | 2 +-
 drivers/scsi/ufs/ufs-hisi.c     | 2 +-
 drivers/scsi/ufs/ufs-mediatek.c | 2 +-
 drivers/scsi/ufs/ufs-qcom.c     | 4 +---
 drivers/scsi/ufs/ufshcd-pci.c   | 2 +-
 drivers/scsi/ufs/ufshcd.h       | 5 +++++
 6 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/ufs/cdns-pltfrm.c b/drivers/scsi/ufs/cdns-pltfrm.c
index 56a6a1ed5ec2..da065a259f6e 100644
--- a/drivers/scsi/ufs/cdns-pltfrm.c
+++ b/drivers/scsi/ufs/cdns-pltfrm.c
@@ -192,7 +192,7 @@ static int cdns_ufs_link_startup_notify(struct ufs_hba *hba,
 	 * and device TX LCC are disabled once link startup is
 	 * completed.
 	 */
-	ufshcd_dme_set(hba, UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE), 0);
+	ufshcd_disable_host_tx_lcc(hba);
 
 	/*
 	 * Disabling Autohibern8 feature in cadence UFS
diff --git a/drivers/scsi/ufs/ufs-hisi.c b/drivers/scsi/ufs/ufs-hisi.c
index 5d6487350a6c..074a6a055a4c 100644
--- a/drivers/scsi/ufs/ufs-hisi.c
+++ b/drivers/scsi/ufs/ufs-hisi.c
@@ -235,7 +235,7 @@ static int ufs_hisi_link_startup_pre_change(struct ufs_hba *hba)
 	ufshcd_writel(hba, reg, REG_AUTO_HIBERNATE_IDLE_TIMER);
 
 	/* Unipro PA_Local_TX_LCC_Enable */
-	ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(0x155E, 0x0), 0x0);
+	ufshcd_disable_host_tx_lcc(hba);
 	/* close Unipro VS_Mk2ExtnSupport */
 	ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(0xD0AB, 0x0), 0x0);
 	ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(0xD0AB, 0x0), &value);
diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 8f73c860f423..9d05962feb15 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -318,7 +318,7 @@ static int ufs_mtk_pre_link(struct ufs_hba *hba)
 	 * to make sure that both host and device TX LCC are disabled
 	 * once link startup is completed.
 	 */
-	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE), 0);
+	ret = ufshcd_disable_host_tx_lcc(hba);
 	if (ret)
 		return ret;
 
diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index c69c29a1ceb9..c2e703d58f63 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -554,9 +554,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 		 * completed.
 		 */
 		if (ufshcd_get_local_unipro_ver(hba) != UFS_UNIPRO_VER_1_41)
-			err = ufshcd_dme_set(hba,
-					UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE),
-					0);
+			err = ufshcd_disable_host_tx_lcc(hba);
 
 		break;
 	case POST_CHANGE:
diff --git a/drivers/scsi/ufs/ufshcd-pci.c b/drivers/scsi/ufs/ufshcd-pci.c
index 3b19de3ae9a3..8f78a8151499 100644
--- a/drivers/scsi/ufs/ufshcd-pci.c
+++ b/drivers/scsi/ufs/ufshcd-pci.c
@@ -44,7 +44,7 @@ static int ufs_intel_disable_lcc(struct ufs_hba *hba)
 
 	ufshcd_dme_get(hba, attr, &lcc_enable);
 	if (lcc_enable)
-		ufshcd_dme_set(hba, attr, 0);
+		ufshcd_disable_host_tx_lcc(hba);
 
 	return 0;
 }
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 81c71a3e3474..8f516b205c32 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -914,6 +914,11 @@ static inline bool ufshcd_is_hs_mode(struct ufs_pa_layer_attr *pwr_info)
 		pwr_info->pwr_tx == FASTAUTO_MODE);
 }
 
+static inline int ufshcd_disable_host_tx_lcc(struct ufs_hba *hba)
+{
+	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_LOCAL_TX_LCC_ENABLE), 0);
+}
+
 /* Expose Query-Request API */
 int ufshcd_query_descriptor_retry(struct ufs_hba *hba,
 				  enum query_opcode opcode,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
