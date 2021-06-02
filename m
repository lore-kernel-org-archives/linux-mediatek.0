Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F115C47080
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 02:42:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09C9613C1
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 02:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E09C9613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FpO2eI5Xoaks4qEml4rD8/Mhkih329nnqn/kVMOqs8o=; b=CqKbxIYwS1n+sd
	eVBf7bZX2xI1eXsn4Lq3WNfoPwy3GcV2CTovjvR5vUY+KUSEvyDkoCHOmYt5lx32C8AP3bHceJDHJ
	yX139Ou4WZi2Wub1cUrHCRkyDqkcSnDBrTpyNNegYWXDlJRdvep94PBC4De3Gu4qnvBrAi8HqxeiK
	yyt5nym03zJbVxbwFZLZT3Dy91VPY2Yt+zHtXFzKqM5s9fv7drpa/3t/NaukAQY+aCg+olRnBP7d5
	K1qX6ytcFW+rRcwvoHyPq7zyX9gbrLcPV7Eb08qN5t8JSlU6IU9Rgm2TC7sve1bpmX+UfuTkRWVHs
	69auodAED7OL6eOK58eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loGps-001e9e-9R; Wed, 02 Jun 2021 02:42:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loGpn-001e95-F2
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 02:42:22 +0000
X-UUID: 243e45615d004f29a558daa2e52c4aa1-20210601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=LNZzoFsHA2pR66KpYJjaklg2wSffM/fe9dcYEvMAcDg=; 
 b=fzzfgxJOhEfZEpzZ9F+kG8zdugLHxMBCbv+3hSSHeh04aOE28PhJXEd/yG4n1e6n4vmIbBU2HdnFgsRQ1wtmk9xRfuyrhz2cWZo0VPoBB6TF7V7m8haRhXEA+ejA5o79O0NgtuYY2w9so3rj2LEB/ML/dQ1MMWJIdJGWBN0513o=;
X-UUID: 243e45615d004f29a558daa2e52c4aa1-20210601
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <peter.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 717071458; Tue, 01 Jun 2021 19:42:14 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 19:42:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 10:42:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Jun 2021 10:42:05 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
 <martin.petersen@oracle.com>, <avri.altman@wdc.com>,
 <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
 <alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
 <chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>
Subject: [PATCH v2] scsi: ufs-mediatek: create device link of reset control
Date: Wed, 2 Jun 2021 10:42:00 +0800
Message-ID: <1622601720-22466-1-git-send-email-peter.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_194221_080631_95EDCE72 
X-CRM114-Status: GOOD (  14.30  )
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

Mediatek UFS reset function is relied on Reset Control provided
by reset-ti-syscon. To make Reset Control work properly, select
reset-ti-syscon to ensure it being built with ufs-mediatek together.
In addition, establish device link to wait until reset-ti-syscon
initialization is done during UFS probing flow.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/scsi/ufs/Kconfig        |    1 +
 drivers/scsi/ufs/ufs-mediatek.c |   29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

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
index a981f26..d27e65e 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -1067,9 +1067,38 @@ static int ufs_mtk_probe(struct platform_device *pdev)
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
+		goto skip_reset;
+	}
+	reset_pdev = of_find_device_by_node(reset_node);
+	if (!reset_pdev) {
+		dev_notice(dev, "find reset_pdev fail\n");
+		goto skip_reset;
+	}
+	link = device_link_add(dev, &reset_pdev->dev,
+		DL_FLAG_AUTOPROBE_CONSUMER);
+	if (!link) {
+		dev_notice(dev, "add reset device_link fail\n");
+		goto skip_reset;
+	}
+	/* supplier is not probed */
+	if (link->status == DL_STATE_DORMANT) {
+		err = -EPROBE_DEFER;
+		goto out;
+	}
 
+skip_reset:
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
