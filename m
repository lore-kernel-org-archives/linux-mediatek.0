Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0D3C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gf2uM0Bh0M26MY5V/7xnzHJb4sel33qU1Jq/CiiBVmM=; b=jjlKgJ/qkYTbg0pSFigZOEK4LU
	SSbkDgdD8AfTdtG2n4HXyHjp/UjMI96LHYR5vTmf+qbhvqkv5c4aQYFMqF74MoIFwEujce9IrzIRL
	Qe77soQhP1OsGyK6C2i/1/Ja2Mr7gDFtvXnfxt4dSlr3DLuBmTwRPpc1WMwEVq3zKQ+HVn6/JVRC6
	Q18nCVfepWgjJxMKdY+R+I8yIIMp8YS4gsnlgqXvxa4CWYNUu7aWvURX8umkw7a5l/eoZm4khbctS
	cboIMD/DI+ER9EYKj5BRWf9M54jOsuwMn9VpgkFJyxKYZkiFf6ZOCvkQTMCEP6ZLFvNiOUYLXxgPC
	LSkmxavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8e9r-005bhC-Hc; Fri, 23 Dec 2022 09:16:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8e6y-005Zrp-Nm
	for linux-mediatek@lists.infradead.org; Fri, 23 Dec 2022 09:13:06 +0000
X-UUID: 62dc2d3b6fb5410c9f19b3f9f7283e6d-20221223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gf2uM0Bh0M26MY5V/7xnzHJb4sel33qU1Jq/CiiBVmM=;
	b=L1G8VYFUWkwFej9EB70NfdJwo2NZr2hBfnRlB0PL3W1NNs02ATDd9bmsQdsBfbGa6T2wymxZaTm7VZTpiMh72mcRLq+D+srSuapb2Lz4HJ9QLFoLedMSzBBHYUfByYV54PMFMYgTYlp/Y9nyrAEbKQLS1DDPzUMYkzYE6GEuR8I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:d7cfab33-32c6-46a7-a4a4-15212de03edd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:015bc5f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 62dc2d3b6fb5410c9f19b3f9f7283e6d-20221223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1750730143; Fri, 23 Dec 2022 02:12:35 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 23 Dec 2022 16:42:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Dec 2022 16:42:00 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>
Subject: [PATCH v2] ufs: core: wlun resume SSU(Acitve) fail recovery
Date: Fri, 23 Dec 2022 16:41:58 +0800
Message-ID: <20221223084158.10069-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_011304_898393_976C0D10 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

When wlun resume SSU(Active) timeout, scsi try eh_host_reset_handler.
But ufshcd_eh_host_reset_handler hang at wait flush_work(&hba->eh_work).
And ufshcd_err_handler hang at wait rpm resume.
Do link recovery only in this case. Below is IO hang stack dump.

<ffffffdd78e02b34> schedule+0x110/0x204
<ffffffdd78e0be60> schedule_timeout+0x98/0x138
<ffffffdd78e040e8> wait_for_common_io+0x130/0x2d0
<ffffffdd77d6a000> blk_execute_rq+0x10c/0x16c
<ffffffdd78126d90> __scsi_execute+0xfc/0x278
<ffffffdd7813891c> ufshcd_set_dev_pwr_mode+0x1c8/0x40c
<ffffffdd78137d1c> __ufshcd_wl_resume+0xf0/0x5cc
<ffffffdd78137ae0> ufshcd_wl_runtime_resume+0x40/0x18c
<ffffffdd78136108> scsi_runtime_resume+0x88/0x104
<ffffffdd7809a4f8> __rpm_callback+0x1a0/0xaec
<ffffffdd7809b624> rpm_resume+0x7e0/0xcd0
<ffffffdd7809a788> __rpm_callback+0x430/0xaec
<ffffffdd7809b644> rpm_resume+0x800/0xcd0
<ffffffdd780a0778> pm_runtime_work+0x148/0x198

<ffffffdd78e02b34> schedule+0x110/0x204
<ffffffdd78e0be10> schedule_timeout+0x48/0x138
<ffffffdd78e03d9c> wait_for_common+0x144/0x2dc
<ffffffdd7758bba4> __flush_work+0x3d0/0x508
<ffffffdd7815572c> ufshcd_eh_host_reset_handler+0x134/0x3a8
<ffffffdd781216f4> scsi_try_host_reset+0x54/0x204
<ffffffdd78120594> scsi_eh_ready_devs+0xb30/0xd48
<ffffffdd7812373c> scsi_error_handler+0x260/0x874

<ffffffdd78e02b34> schedule+0x110/0x204
<ffffffdd7809af64> rpm_resume+0x120/0xcd0
<ffffffdd7809fde8> __pm_runtime_resume+0xa0/0x17c
<ffffffdd7815193c> ufshcd_err_handling_prepare+0x40/0x430
<ffffffdd7814cce8> ufshcd_err_handler+0x1c4/0xd4c

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index e18c9f4463ec..de20cf587fa1 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7363,9 +7363,27 @@ static int ufshcd_eh_host_reset_handler(struct scsi_cmnd *cmd)
 	int err = SUCCESS;
 	unsigned long flags;
 	struct ufs_hba *hba;
+	struct device *dev;
 
 	hba = shost_priv(cmd->device->host);
 
+	/*
+	 * If __ufshcd_wl_suspend get fail and runtime_status = RPM_RESUMING,
+	 * do link recovery only. Because schedule eh work will get dead lock
+	 * in ufshcd_rpm_get_sync to wait wlun resume, but wlun resume get
+	 * error and wait eh work finish.
+	 */
+	dev = &hba->ufs_device_wlun->sdev_gendev;
+	if (dev->power.runtime_status == RPM_RESUMING) {
+		err = ufshcd_link_recovery(hba);
+		if (err) {
+			dev_err(hba->dev, "WL Device PM: status:%d, err:%d\n",
+				dev->power.runtime_status,
+				dev->power.runtime_error);
+		}
+		return err;
+	}
+
 	spin_lock_irqsave(hba->host->host_lock, flags);
 	hba->force_reset = true;
 	ufshcd_schedule_eh_work(hba);
-- 
2.18.0


