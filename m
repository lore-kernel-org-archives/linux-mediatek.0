Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FFAC47082
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 12:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20FB76135A
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 12:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20FB76135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vimjZpvtlv3f0rSAjQCGxyCvwLtJW099YF/uvbC1xyM=; b=v/ncUI4na+R7GV
	p///QxdpLex3Zurpu09Q7gegpDH1O7y7vOzSITt2BsYwjuExHjhvMVPHP1DwEl3V23EAIDqVLhU3P
	ZceG7Q8PwFTJKR4SlvENntgF5HRzblpBOJFm1Ft6kKMQdwSvxFP5ACciptkCnWpSqZ+jmQAmlDeU1
	fPhA9Ajvh7+cDN5jR+RawT6D5/2RkHm8BLaQuW2Grv2pXitk74SFCshIflvza9mQeUDqTnfMDayrM
	NMNYnNOM+KNHS9i277DUyIzbMT3wEMB7zTG7qMX2HC/nRw3YB529Hfz2oMgYRM4fj2HYaPFFZqtQO
	exKK4U2Y7oBCcKxQoafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnh8v-00CBRv-P4; Mon, 31 May 2021 12:35:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnh8q-00CBP0-TI
 for linux-mediatek@lists.infradead.org; Mon, 31 May 2021 12:35:39 +0000
X-UUID: 878261746ac0488299f5d33705526483-20210531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=sp2/VtRsqMUAtH37Pm+hQjv/NRo+wl+oBVcJTSzUJJI=; 
 b=VkBiOgJPRMTNHDyH3mgdYdR2q7+B7AMUcNjJZatrGoyZ82T2IMYxOck/JduTCrtYAvp2tP5eJqSQrYPZMM3NDJ8lNRXY2AHMNpvodl/EJHJ4No5yPl/isLaH3vxjEHxmF4hlX+bcQSsOS31PVDGJRW44nEh/cI6vp7FhXUIFHSk=;
X-UUID: 878261746ac0488299f5d33705526483-20210531
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1321916461; Mon, 31 May 2021 05:35:26 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 05:25:24 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 20:25:23 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 31 May 2021 20:25:23 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
 <martin.petersen@oracle.com>, <avri.altman@wdc.com>,
 <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
 <chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>
Subject: [PATCH v1] scsi: ufs-mediatek: create device link of reset control
Date: Mon, 31 May 2021 20:25:19 +0800
Message-ID: <1622463919-18413-1-git-send-email-peter.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_053536_978394_5C941909 
X-CRM114-Status: GOOD (  14.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

Mediatek ufs reset control use reset-ti-syscon module.
So ufs probe should wait reset-ti-syscon module init first.
Else medaitek ufs get reset control fail.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/scsi/ufs/Kconfig        |    1 +
 drivers/scsi/ufs/ufs-mediatek.c |   31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
index 07cf415..2d13795 100644
--- a/drivers/scsi/ufs/Kconfig
+++ b/drivers/scsi/ufs/Kconfig
@@ -115,6 +115,7 @@ config SCSI_UFS_MEDIATEK
 	tristate "Mediatek specific hooks to UFS controller platform driver"
 	depends on SCSI_UFSHCD_PLATFORM && ARCH_MEDIATEK
 	select PHY_MTK_UFS
+	select RESET_TI_SYSCON
 	help
 	  This selects the Mediatek specific additions to UFSHCD platform driver.
 	  UFS host on Mediatek needs some vendor specific configuration before
diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index a981f26..73e8caf 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -1067,9 +1067,40 @@ static int ufs_mtk_probe(struct platform_device *pdev)
 {
 	int err;
 	struct device *dev = &pdev->dev;
+	struct device_node *reset_node;
+	struct platform_device *reset_pdev;
+	struct device_link *link;
+
+	reset_node = of_find_compatible_node(NULL, NULL,
+					     "ti,syscon-reset");
+	if (!reset_node) {
+		dev_notice(dev, "find ti,syscon-reset fail\n");
+		err = -ENODEV;
+		goto out;
+	}
+	reset_pdev = of_find_device_by_node(reset_node);
+	if (!reset_pdev) {
+		dev_notice(dev, "find reset_pdev fail\n");
+		err = -ENODEV;
+		goto out;
+	}
+	link = device_link_add(dev, &reset_pdev->dev,
+		DL_FLAG_AUTOPROBE_CONSUMER);
+	if (!link) {
+		dev_notice(dev, "add reset device_link fail\n");
+		err = -ENODEV;
+		goto out;
+	}
+	/* supplier is not probed */
+	if (link->status == DL_STATE_DORMANT) {
+		err = -EPROBE_DEFER;
+		goto out;
+	}
 
 	/* perform generic probe */
 	err = ufshcd_pltfrm_init(pdev, &ufs_hba_mtk_vops);
+
+out:
 	if (err)
 		dev_info(dev, "probe failed %d\n", err);
 
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
