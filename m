Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BBAC83F1A
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 03:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jpp0D6ahLCY9ZcROn41fc2M+etc1qjW0yfnCgAab/W4=; b=zuG1rvvTL4DL2KF8sOZCWhfeDq
	Mt7eNNFSFYITXhszIjqZQ1OC3s7RAFBOb7lH9tnntfJ0cZ9TB6fuyxjqG9ljQiEUUB5vDahYQHvDp
	F5z+cN7TP3zbdJ/6QTRq+atpSu0jKaKYDNGqDvKFUDJEfL4NnjwfUATlmRjFwFEAp+yNGtrjUHMPc
	4NBxwc2Ux4TJW4/ikC9jvJvePcItgvy7axKuZv/zMv1REzDhi502e/4Yxpz9A4OcXeH8VdctiAPeq
	6kl+VT12DlE9/4s+wGs310youUy9B1h4Dyoj4q23wF4RQ1DWqUlPN3BS9suG5TAT1KnolN4mdAxZd
	43RBQtvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3NE-000000018Yz-1LDs;
	Tue, 22 Jul 2025 03:09:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3N5-000000018TV-39F7
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 03:08:53 +0000
X-UUID: 2df17b4a66a911f09f706fa2197c6ceb-20250721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jpp0D6ahLCY9ZcROn41fc2M+etc1qjW0yfnCgAab/W4=;
	b=RQ8eYkhuIqQgl8BLIWWZT3zLU0J2rZmuynyqlh8d8vvQ2wWDlG3ziNfOnFHvSEPnbmqFmy0qFmDRgUbwTqg70AvU/XujLImflz77H9JLxf1WT8vldnGp0aLwOylC5UZT8ew9JnWspLoQ3NL/7ZAZVqez4Yn3q3d6YoInpH4pKJ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:9ef6b82a-a3c0-477a-99dd-3d6ae3af03e0,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:5dce1b50-93b9-417a-b51d-915a29f1620f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2df17b4a66a911f09f706fa2197c6ceb-20250721
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 147833797; Mon, 21 Jul 2025 20:08:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Jul 2025 11:08:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Jul 2025 11:08:42 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v4 0/9] ufs: host: mediatek: Provide features and fixes in MediaTek platforms
Date: Tue, 22 Jul 2025 11:07:15 +0800
Message-ID: <20250722030841.1998783-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_200851_940979_417A5154 
X-CRM114-Status: UNSURE (   5.89  )
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

This series fixes some defects and provide features in MediaTek UFS drivers.

Changes since v3:
1. Fix comment message in patch:
  ufs: host: mediatek: Simplify boolean conversion

Peter Wang (7):
  ufs: host: mediatek: Simplify boolean conversion
  ufs: host: mediatek: Change ref-clk timeout policy
  ufs: host: mediatek: Handle broken RTC based on DTS setting
  ufs: host: mediatek: Set IRQ affinity policy for MCQ mode
  ufs: host: mediatek: Add clock scaling query function
  ufs: host: mediatek: Support clock scaling with Vcore binding
  ufs: host: mediatek: Support FDE (AES) clock scaling

Naomi Chu (1):
  ufs: host: mediatek: Add DDR_EN setting

Alice Chao (1):
  ufs: host: mediatek: Add more UFSCHI hardware versions

 drivers/ufs/host/ufs-mediatek.c | 329 ++++++++++++++++++++++++++++----
 drivers/ufs/host/ufs-mediatek.h |  32 ++++
 2 files changed, 328 insertions(+), 33 deletions(-)

-- 
2.45.2


