Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E74CD4F3F
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qcqdQLGnJwQ9IWM0XvcmqWOeyNJDxCuYHdRP3yE0vdg=; b=UoQPDfIaEnTcSaVV0no2HYZJ5J
	7/mf+Fgh7CE3pz5sP6fGxY66xoPV/FPTtI4pzVBzS+N4bFJrdbtMPtHV9C5uA6rQsmyu5TeKTpmQH
	boT36Bhhnxc0pQv/18uvyHH02sfYRiErfRFHl8LraTBKVZmw4c8oLBnPNS+ygg9KTM4BObUxqB1KH
	OyGOgO1S18TcTOqdljL5Je5yCYO76OzhsC+FNhtEQLWgWQ9GEpSd4MLFjCDAC/zx8ki1ChxQMuL/P
	mP52zWy9Vh7fmTJJn9IdgB6Eaw3Tnpr0v4c0dKdJzuse0Y/DooJoDPJlSYdSKz85QPphE+24dUYYm
	MoqoqHkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcK2-008YQ0-0L;
	Fri, 22 Sep 2023 09:19:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjcJz-008YOq-0s
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Sep 2023 09:19:36 +0000
X-UUID: 22de07f8592911ee86758d4a7c00f3a0-20230922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qcqdQLGnJwQ9IWM0XvcmqWOeyNJDxCuYHdRP3yE0vdg=;
	b=E+xy1NyXjn6PrE2iTTXa3p2zkgj9a878kImsi+pwg1rte3SoKUa/7PLA0G3NhZyLG9eH7bO8ySrHIArDqtlHOD4/GW33Tgdfz0VJjhTSZ+T0TUq7xlsqi6S6IqU4WR9sjCbq0AF0XuS8n+2k+21UnJ81G+jIbNGFa39uryYWJxo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:9ae801ae-c603-46e3-ae6b-03121b76fd0a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:3ff501f0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 22de07f8592911ee86758d4a7c00f3a0-20230922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1774480859; Fri, 22 Sep 2023 02:19:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Sep 2023 17:09:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Sep 2023 17:09:27 +0800
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
Subject: [PATCH v4] ufs: core: wlun send SSU timeout recovery
Date: Fri, 22 Sep 2023 17:09:25 +0800
Message-ID: <20230922090925.16339-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.982800-8.000000
X-TMASE-MatchedRID: txJkgVt2LQAMQLXc2MGSbEKcYi5Qw/RVaN2KuTwsCwIGW3hFnC9N1XVi
	1hAU/d+eLiiu988wpnv6XP0KNPsN+xXfDcvxC40Q0Xw0ILvo/uV+tO36GYDlsruqk4cq52pz8R2
	RsKRNAl33RDlj++r10gG2ORx9EyapKc+6Aaw3enmrVklnbP5Jtn0tCKdnhB58k4rY1r+vswgXvQ
	kGi3tjz/cUt5lc1lLgKIzdZS3ou0VdapCFctH5mztQi+7lSI5rwZ0T5XtkfJU3aoddqzyCx4n1e
	G2gg2874wIzy1FxdIepc9J68nhiqzCNDviRubGL7vDnv6TdpFN5lSmbrC6fdtr/To2FgNrjDLMI
	OOVTHz12N6Rg5qIpOg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.982800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 92A5003FB4379992D2F7C2A8E2E74F946772B8A721DC03AF86064008815A6C5F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_021935_314905_58D17D75 
X-CRM114-Status: UNSURE (   9.55  )
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

When runtime pm send SSU times out, the SCSI core invokes
eh_host_reset_handler, which hooks function ufshcd_eh_host_reset_handler
schedule eh_work and stuck at wait flush_work(&hba->eh_work).
However, ufshcd_err_handler hangs in wait rpm resume.
Do link recovery only in this case.
Below is IO hang stack dump in kernel-6.1

kworker/4:0     D
<ffffffd7d31f6fb4> __switch_to+0x180/0x344
<ffffffd7d31f779c> __schedule+0x5ec/0xa14
<ffffffd7d31f7c3c> schedule+0x78/0xe0
<ffffffd7d31fefbc> schedule_timeout+0xb0/0x15c
<ffffffd7d31f8120> io_schedule_timeout+0x48/0x70
<ffffffd7d31f8e40> do_wait_for_common+0x108/0x19c
<ffffffd7d31f837c> wait_for_completion_io_timeout+0x50/0x78
<ffffffd7d2876bc0> blk_execute_rq+0x1b8/0x218
<ffffffd7d2b4297c> scsi_execute_cmd+0x148/0x238
<ffffffd7d2da7358> ufshcd_set_dev_pwr_mode+0xe8/0x244
<ffffffd7d2da7e40> __ufshcd_wl_resume+0x1e0/0x45c
<ffffffd7d2da7b28> ufshcd_wl_runtime_resume+0x3c/0x174
<ffffffd7d2b4f290> scsi_runtime_resume+0x7c/0xc8
<ffffffd7d2ae1d48> __rpm_callback+0xa0/0x410
<ffffffd7d2ae0128> rpm_resume+0x43c/0x67c
<ffffffd7d2ae1e98> __rpm_callback+0x1f0/0x410
<ffffffd7d2ae014c> rpm_resume+0x460/0x67c
<ffffffd7d2ae1450> pm_runtime_work+0xa4/0xac
<ffffffd7d22e39ac> process_one_work+0x208/0x598
<ffffffd7d22e3fc0> worker_thread+0x228/0x438
<ffffffd7d22eb038> kthread+0x104/0x1d4
<ffffffd7d22171a0> ret_from_fork+0x10/0x20

scsi_eh_0       D
<ffffffd7d31f6fb4> __switch_to+0x180/0x344
<ffffffd7d31f779c> __schedule+0x5ec/0xa14
<ffffffd7d31f7c3c> schedule+0x78/0xe0
<ffffffd7d31fef50> schedule_timeout+0x44/0x15c
<ffffffd7d31f8e40> do_wait_for_common+0x108/0x19c
<ffffffd7d31f8234> wait_for_completion+0x48/0x64
<ffffffd7d22deb88> __flush_work+0x260/0x2d0
<ffffffd7d22de918> flush_work+0x10/0x20
<ffffffd7d2da4728> ufshcd_eh_host_reset_handler+0x88/0xcc
<ffffffd7d2b41da4> scsi_try_host_reset+0x48/0xe0
<ffffffd7d2b410fc> scsi_eh_ready_devs+0x934/0xa40
<ffffffd7d2b41618> scsi_error_handler+0x168/0x374
<ffffffd7d22eb038> kthread+0x104/0x1d4
<ffffffd7d22171a0> ret_from_fork+0x10/0x20

kworker/u16:5   D
<ffffffd7d31f6fb4> __switch_to+0x180/0x344
<ffffffd7d31f779c> __schedule+0x5ec/0xa14
<ffffffd7d31f7c3c> schedule+0x78/0xe0
<ffffffd7d2adfe00> rpm_resume+0x114/0x67c
<ffffffd7d2adfca8> __pm_runtime_resume+0x70/0xb4
<ffffffd7d2d9cf48> ufshcd_err_handler+0x1a0/0xe68
<ffffffd7d22e39ac> process_one_work+0x208/0x598
<ffffffd7d22e3fc0> worker_thread+0x228/0x438
<ffffffd7d22eb038> kthread+0x104/0x1d4
<ffffffd7d22171a0> ret_from_fork+0x10/0x20

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index c2df07545f96..7608d75bb4fe 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7713,9 +7713,29 @@ static int ufshcd_eh_host_reset_handler(struct scsi_cmnd *cmd)
 	int err = SUCCESS;
 	unsigned long flags;
 	struct ufs_hba *hba;
+	struct device *dev;
 
 	hba = shost_priv(cmd->device->host);
 
+	/*
+	 * If runtime pm send SSU and got timeout, scsi_error_handler
+	 * stuck at this function to wait flush_work(&hba->eh_work).
+	 * And ufshcd_err_handler(eh_work) stuck at wait runtime pm active.
+	 * Do ufshcd_link_recovery instead shedule eh_work can prevent
+	 * dead lock happen.
+	 */
+	dev = &hba->ufs_device_wlun->sdev_gendev;
+	if ((dev->power.runtime_status == RPM_RESUMING) ||
+		(dev->power.runtime_status == RPM_SUSPENDING)) {
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


