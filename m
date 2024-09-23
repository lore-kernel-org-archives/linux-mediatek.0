Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7622ACF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TTktZ6zh7dUMwYiHLZ3lOy4Zva+vrBP4sje0RFE/uJI=; b=vItumMPYZ90ifKsvOBaOlXVPg8
	98dZ0sl60sKh+Y12pMfBjRLpkbF3i87uV4wrcTiT55RFou0g1Ns1QxVVMl6qxdvHRsp2tL2SOkCCY
	JNk1Mv5OOnliMcHAkekAn0818jHFq/NfO/9X1bUNNkgx2PXtfNu+jF64uazWwqPi16gtKFwkAUrbG
	R+QkUUlN2TOXNom49VGSrWJtRym9aE6JreWZQIeFTaIH97o6Nzr3CyD21S2EMw6WI01d3Fg3tZdJn
	dAvL6h0QYOdN6jRoj1WSPx31+KVosD1SAKze0DwKetSz2gpSJd5wNHNWy5ALXCj7cC8F1Ro1O634o
	/QqvV3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sse30-0000000Gc9I-2Jmz;
	Mon, 23 Sep 2024 08:03:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sse2x-0000000Gc7m-432w
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 08:03:53 +0000
X-UUID: 5ca7891c798211efb3adad29d29602c1-20240923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TTktZ6zh7dUMwYiHLZ3lOy4Zva+vrBP4sje0RFE/uJI=;
	b=idoHr4XZQi+z/7/haNp7c+rN1TrPCQOY0sxeuw3gXDTX/+OIEjQov/rnYBU3/miRbQ/eepGHXT8SOjyyniyF4HM5BNOkgxmDYUVWMyswMcZV+sSew4Hd+HaNZ+5f7eXdaLv/MQDmGIchm5tOpulMeKlmsx78AgZhdTlIDR+3dqE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:de9a4da3-22f2-4cf7-bf39-e9440a1ff534,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:d1161a18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5ca7891c798211efb3adad29d29602c1-20240923
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 880414116; Mon, 23 Sep 2024 01:03:47 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Sep 2024 16:03:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Sep 2024 16:03:45 +0800
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
Subject: [PATCH v8 0/3] fix abort defect
Date: Mon, 23 Sep 2024 16:03:41 +0800
Message-ID: <20240923080344.19084-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_010352_036837_4A2BC64D 
X-CRM114-Status: UNSURE (   9.76  )
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


