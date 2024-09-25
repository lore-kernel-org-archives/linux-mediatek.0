Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78655C369C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yJkRtRRNHcKSL8pTC/uoggd7XBAV+ua7KNG4SIwtsGc=; b=pAqM6n1DXKS+wKiIQrIThSVJLW
	x3MMSa1F9UnnYV9p1U472DMRFNq7eUKdApoHCgcspKvGXC/GJh2wtr92uPiQlEHZWOOqeufR/4LKf
	NptDJ4O4rgOC0d5n76T0AyDozziTFFlIY30lJq/xlsLTGHlV+4MAyZXFkSK/8osetWtmGipGhnNB3
	Mhj94/fGp8cldSYetGWgM2ICGTiXqXHRbsFbSdeiEyjbA8tz+pQ5mjJvAgdhNAzGDACYlHMIuOn3D
	asoGtAmKi9DC6pQrChg6Md1HcDkReZnGHUJqFsEU1JSwt3Anmolk+boHtysFOksWUdxDsp3rN75q6
	JkYW9UZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stP08-00000004iZX-1ry6;
	Wed, 25 Sep 2024 10:12:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stP00-00000004iVb-2WEW
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 10:11:58 +0000
X-UUID: 942cb6aa7b2611efba0aef63c0775dbf-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yJkRtRRNHcKSL8pTC/uoggd7XBAV+ua7KNG4SIwtsGc=;
	b=OsPooZXrY7F6feX4PEe45mesWrueYa+L4xll7S1d+xnjsnpSvWI0N6mTm+VtKN4xrLe+pTTUzOwRlBtK/ly849hnI9DE7JhT6T6OFG620xvZahZjRiuwNLdq/HRjjJCFqTAdDCXIJ6ZGdIO/jcNFtAAqx+ZiSVrSmY1ykvwXJAs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7298fbf6-609c-4b04-a999-50521f490c25,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:97e68a9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 942cb6aa7b2611efba0aef63c0775dbf-20240925
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1892602155; Wed, 25 Sep 2024 03:11:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 03:11:47 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 18:11:47 +0800
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
Subject: [PATCH v9 0/3] fix abort defect
Date: Wed, 25 Sep 2024 17:55:43 +0800
Message-ID: <20240925095546.19492-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_031156_672265_1377E537 
X-CRM114-Status: GOOD (  10.70  )
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

V9:
 - Revise the OCS content printed.
 
V8:
 - Remove the abort variable to simplify the abort process.
 - Correct error handler successfully aborts release flow.
 - Ingore MCQ OCS: ABORTED.

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

Peter Wang (3):
  ufs: core: fix the issue of ICU failure
  ufs: core: fix error handler process for MCQ abort
  ufs: core: add a quirk for MediaTek SDB mode aborted

 drivers/ufs/core/ufs-mcq.c      | 15 ++++++++-------
 drivers/ufs/core/ufshcd.c       | 28 ++++++++++++++++++++++++++--
 drivers/ufs/host/ufs-mediatek.c |  1 +
 include/ufs/ufshcd.h            |  6 ++++++
 4 files changed, 41 insertions(+), 9 deletions(-)

-- 
2.45.2


