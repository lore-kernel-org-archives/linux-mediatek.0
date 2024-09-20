Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628EFCF58F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 09:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zwo4xBU6lj3FjG+IfMoGyS13z9c2D1Xz4JKX3Twas+Y=; b=DRuiLoeEPvuzFyf6bLpAA/IJ5Y
	OrOweFQV1QidBi08sYKMi88U0ISaxscs2RMq4B6d3YQgFcaQomwXLwlp8nmfLGJUekulGLLDGrDcd
	iFiEPmdA5sHea9LLq6mA0Ns1bcqIUqw6DgxHFTCf9MZ6lWgXK6QlwpKQvUF6sWgDCJYiVXG6y4zRu
	WbUjNuJQP4f5uzTBYkb/lePdp+UIMVDUEQImQzNilr1F8bQgS2svbUCHv5Z0Srt/IgM7XnQZtwKnP
	yKZ9ZoHMK3hqe2MCdcsBD2YbRVVINmxjpeDloywFI3VjZdlo7Fmnaa8uWoaseavpfibaGH6muTyoV
	6dMqd08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZbK-0000000BsxQ-3Rq1;
	Fri, 20 Sep 2024 09:06:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZbH-0000000Bsvy-2dZr
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Sep 2024 09:06:52 +0000
X-UUID: a9cce2be772f11efba0aef63c0775dbf-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zwo4xBU6lj3FjG+IfMoGyS13z9c2D1Xz4JKX3Twas+Y=;
	b=By16Ey9m2O/BJy6VmFZjyGdrNHGkz7+z3+zU/r5tDnNryP18OdvTtztV7nGlMA4OtrisHks3o7mGSZj8dv4iTOPrBR+zn0w6quuWwGd9HRebCv6covAXWY5hanQsd4dSjD0Bx8mkIRUhXXUvKyCuuS22LLIKcEvFiFgAlO5RNIk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:37502b44-143c-408e-be86-ccbfab0e0000,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:67ec7fd0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a9cce2be772f11efba0aef63c0775dbf-20240920
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2001991126; Fri, 20 Sep 2024 02:06:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 02:06:44 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 17:06:44 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>,
	<quic_nguyenb@quicinc.com>
Subject: [PATCH v7 0/4] fix abort defect
Date: Fri, 20 Sep 2024 17:06:39 +0800
Message-ID: <20240920090643.3566-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_020651_705589_A62BB646 
X-CRM114-Status: UNSURE (   9.85  )
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

This series fixes MCQ and SDB abort defect.

V7:
 - Use a variable instead of a flag.
 - Add a check for MCQ mode when setting this variable to UFS_ERR_HANDLER.
 - Print OCS information for OCS_ABORTED and OCS_INVALID_COMMAND_STATUS.
 - Add a MediaTek quirk for handling OCS_ABORTED in SDB mode.
 - Skip notifying SCSI from ISR during SCSI abort (ufshcd_abort()).

V6:
 - Add err handler check before set flag true.

V5:
 - Change flag name.
 - Amend comment and patch description.

V4:
 - Remove nullify SQ entry abort requeue.
 - Add more comment for flag usage and set description.
 - Fix build warning.

V3:
 - Change comment and use variable(rtc) for error print
 - Change flag name and move flag set before ufshcd_clear_cmd
 - Add SDB mode clear UTRLCLR tag receive OCS_ABORTED requeue

V2:
 - Fix mcq_enabled build error.

Peter Wang (4):
  ufs: core: fix the issue of ICU failure
  ufs: core: requeue aborted request
  ufs: core: add a quirk for MediaTek SDB mode aborted
  ufs: core: skip ISR notifying scsi when ufshcd_abort

 drivers/ufs/core/ufs-mcq.c      | 21 ++++++----
 drivers/ufs/core/ufshcd.c       | 68 +++++++++++++++++++++++++--------
 drivers/ufs/host/ufs-mediatek.c |  1 +
 include/ufs/ufshcd.h            | 15 ++++++++
 4 files changed, 83 insertions(+), 22 deletions(-)

-- 
2.45.2


