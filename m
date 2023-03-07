Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45A0C6FD1E
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 06:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sYDNQt8w5f/hpcyHLM6tkzNVvP8hC8vvC4a39yv5l74=; b=bfnf2+7uFjMIZRVOPXdN7UCJwD
	2qx2FUOqhyEGVG3Qje/UmFPihcBaAzYRrZSxgxzBse7VZrq1N42p5HfaLnrRcGUIgAsmT/j7XeseB
	J6sk3yuGQdLp3gxaW6YvooKW4t/AH3m0R7HfcM5WyzPuRb0dKGHZEQhmdwprGcvvMQJ8EObAypHjg
	NOWxIrmimkpIvPJ7YcDUpySALf3COlW6/+VlZP4HEdG1CXQs0owYGT3Ch/U797Q6tUdMnvo1wIk1P
	BAiEJH2kPBDj+mltEvPYlynf9WStcyQGpCcvifXXhBuFpBnQzLOhI2KkWYzzlISKW5SyY8Y9GFbRn
	pTkiOfYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZRES-00GQtY-0B; Tue, 07 Mar 2023 06:55:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZREN-00GQru-IH; Tue, 07 Mar 2023 06:55:29 +0000
X-UUID: 05ef3f4cbcb511eda08d4d6090ec5a5c-20230306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sYDNQt8w5f/hpcyHLM6tkzNVvP8hC8vvC4a39yv5l74=;
	b=X2a2vdl5eitw7Mk1iy4WrWq8HVy0mfgHZRIymFnzA3cHWcO2LAPTVHktD6jh6ul75/Fc/yVVpUSfEZQBouSiXTBQuBkSOcd5YJN/55Zh8CIrLhrBY/FTOB8AbC9Gi0Fnqx7fGoQ3cJQkQDvBW2cVxsL64cxyRN0XES/Ul4usQbM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:b9e9d998-d0c6-4210-a7dc-d9e2206a1269,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:55fc9027-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 05ef3f4cbcb511eda08d4d6090ec5a5c-20230306
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 58981415; Mon, 06 Mar 2023 23:55:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 7 Mar 2023 14:55:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 7 Mar 2023 14:55:16 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<eddie.huang@mediatek.com>, <mason.zhang@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>
Subject: [PATCH v4 0/5] Several UFS MCQ Code Changes 
Date: Tue, 7 Mar 2023 14:54:41 +0800
Message-ID: <20230307065448.15279-1-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_225527_632381_876669AF 
X-CRM114-Status: UNSURE (   9.59  )
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

v3 -> v4
- Rebase on latest scsi-next/staging
- Drop "scsi: ufs: core: Remove redundant check" since it's already fixed
- Improve commit message as suggested by Manivannan Sadhasivam
- Fix patch check error

v2 -> v3
- Remove "scsi: ufs: core: Add hwq print for debug". 
	send later when error handling is ready.
- Rename patch title to match convention "scsi: ufs: ufs-mediatek:..."
- Add explanation for (nr_hw_queues = MAXQ + 1)
- Remove dummy line

v1 -> v2:
- Add 2 new patches
	- Update MTK driver for mcq
	- Export symbols for MTK driver
- Fix commit message in "scsi: ufs: core: Fix mcq nr_hw_queues"
- Split name change and fix into two patches

Po-Wen Kao (5):
  scsi: ufs: core: Fix mcq tag calcualtion
  scsi: ufs: core: Rename symbol sizeof_utp_transfer_cmd_desc()
  scsi: ufs: core: Fix mcq nr_hw_queues
  scsi: ufs: core: Export symbols for MTK driver module
  scsi: ufs: ufs-mediatek: Add MCQ support for MTK platform

 drivers/ufs/core/ufs-mcq.c      |   8 +-
 drivers/ufs/core/ufshcd-priv.h  |   2 -
 drivers/ufs/core/ufshcd.c       |  11 +-
 drivers/ufs/host/ufs-mediatek.c | 192 +++++++++++++++++++++++++++++++-
 drivers/ufs/host/ufs-mediatek.h |  33 ++++++
 include/ufs/ufshcd.h            |   7 +-
 6 files changed, 241 insertions(+), 12 deletions(-)

-- 
2.18.0


