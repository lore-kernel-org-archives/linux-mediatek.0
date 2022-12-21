Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04337C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sKAkC8LWfN/jcdcvoGUk3sUZ7DVsqrt4wsD3pihgPRI=; b=0w/qN5F3cZiW+2Cac1TDWebU5S
	7a11dNyISTMQ1JVam7Xf1IBpAwMHJecfRzCGC9z4ujlfkMARtKVVPfJ1HUhopk496s6qKCRiXJW7x
	99RS5HTTecpdBkFFgTqfXzKCR45maW5CCQOtblUzHffRAy7W8ms6xZd17gVIgPQKmuSj6ZFOhKe67
	AaYRd9+9PqqF0kug4hw/J+YRyleEn82nhVa2IBHnTao4Rr9ivLttR05obQcRXlDAulc8AlTzfNhWP
	YL3jmShPYuUVRJVINbvXvnKKdCNRp/6nMPYQ9qc22a8hkr6UOCtwELa3hlevDxbo4/qOulykL3ico
	CH/CXXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yWY-00Enq5-Dz; Wed, 21 Dec 2022 12:48:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yTo-00Emn0-GU
	for linux-mediatek@lists.infradead.org; Wed, 21 Dec 2022 12:45:54 +0000
X-UUID: 50429362f19441c2a1a4558776e452ee-20221221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sKAkC8LWfN/jcdcvoGUk3sUZ7DVsqrt4wsD3pihgPRI=;
	b=WXyCEng8a784DBlL5JlYj3Zcfc/nvDyZv+dNdj4sc7BS1/Quyao+4d9V06m5YzR4YIMqofIz5dRbfumkR3A1RFvRmVO35ATGXHryAw1KaWYuGSjU40l4inWLLtRH43QCUGPB59+sAUt0Pg1RW2N+hEgIe+pszAcayf2HRd/WyTo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:a270fc7e-4608-4787-b9fb-d611615d3f3d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:1951028a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 50429362f19441c2a1a4558776e452ee-20221221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 562442191; Wed, 21 Dec 2022 05:45:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 21 Dec 2022 20:35:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 21 Dec 2022 20:35:40 +0800
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
Subject: [PATCH v1] ufs: core: wlun resume SSU(Acitve) fail recovery
Date: Wed, 21 Dec 2022 20:35:37 +0800
Message-ID: <20221221123537.30148-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_044552_600070_2CF0FCC9 
X-CRM114-Status: GOOD (  10.28  )
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
index e18c9f4463ec..5aaffd13e132 100644
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
+	dev = &hba->sdev_ufs_device->sdev_gendev;
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


