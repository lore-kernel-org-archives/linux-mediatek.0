Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19538C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 07:39:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBB62251F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 07:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFBB62251F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8T8F32CjK9/p4DQcLqPCY7/QONtL2RYa3YeIfpC9TFo=; b=KovbOjKMX2jlqOzu1vIZLgzmEc
	uhgs1EIRret2GdPOX5FFAuDckx7+c+FVcf68qT0TOh8PZ44qc+FNe52U+ph1GwmwiJHXnGeVAZ4S7
	Ei2qs2KTy3Cz7lTCE0NNyPZD5dIBAZd4Ye1M9fs413RorIFswpWdklIUkSw7I2VyvuRg41iedyOiR
	fUjTKdqDUvAkO7841oCXOSEP2Mq8jHpIp4sfJgez8S8lNqUK8ODmXp5Flc46noePMEB6mU5ysOAAI
	+cW/ndyJI7xAl5BmADltonc6n1lf4TcFcTNsFD+ZCmfhT3ViuHRWwL8SD9u/SlFb8KNQE0Gvs2NS0
	9oPcWnJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krcGc-0004VV-SD; Tue, 22 Dec 2020 07:39:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krcGR-0004Qv-3R; Tue, 22 Dec 2020 07:39:24 +0000
X-UUID: a5b1317feb474a78a491e850fbadee22-20201221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+6V6lIFsqJ/vG5aBd2DhZ1rSYXQzetjLrMmmwtf58ok=; 
 b=XZsSOxFg0t03XVzqN+NSAO9gaVH7zfrG33DueuJUgOKKh2mR5BEjo6w4V4avTxsbAUd4asZLFTTsMb/zBCS3FhIOOhpLkh5+T7Kb4SKyHLbKEwMYuIrolq7wmCFWsulfiaQZDgYlP0fwCMc/s0w1jeqekem9EdU1LfG5f60cxec=;
X-UUID: a5b1317feb474a78a491e850fbadee22-20201221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 23781397; Mon, 21 Dec 2020 23:39:18 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Dec 2020 23:29:30 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 15:29:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Dec 2020 15:29:27 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
Date: Tue, 22 Dec 2020 15:29:28 +0800
Message-ID: <20201222072928.32328-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_023923_368428_B202DEF0 
X-CRM114-Status: UNSURE (   9.43  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Flush during hibern8 is sufficient on MediaTek platforms, thus
enable UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL to skip enabling
fWriteBoosterBufferFlush during WriteBooster initialization.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 80618af7c872..c55202b92a43 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -661,6 +661,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	/* Enable WriteBooster */
 	hba->caps |= UFSHCD_CAP_WB_EN;
+	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
 	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
 
 	if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
