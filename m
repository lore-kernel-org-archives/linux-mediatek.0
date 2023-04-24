Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B084C7618E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 14:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VBNgfPox3XxLAEflJ4BDzAmRzKjHNDFwIAfMD7sjnM4=; b=bKzqsogNc2n0D8HN7S15/mysGn
	ixnRq9J4aVSUgDuMenJjMf8PEjyUsrjP2/b6x25wNDsKBZ9q9sOgkwUfWUE+5z4VJSXBhX5+tLB2s
	nwzbCNlrc/QGxY5pUOei68pGOuXkh7SZts36KIrIua5SOWtkRb5f1UbPabbzqO31heBwAtH/M3gwy
	QZcglXgoTNbDmveGFc8s4kFUCYa6CkxRouBQCBFjsW6ntyVNr5MSRLwFosIbS7M7TJYFpi1/a2NtB
	hG3tOtcLDy/dcGC7IFzNMMuznUXM2mjCziBb2o2EsFwFJhlrlE/P16F0wULL5sgv9I+EWKcBefDBv
	yAWVhq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqwsH-00GXBF-3B;
	Mon, 24 Apr 2023 14:09:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqwsG-00GX9Q-0m;
	Mon, 24 Apr 2023 14:09:01 +0000
X-UUID: 8a2df55ee2a911ed8687db9d93187ff1-20230424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VBNgfPox3XxLAEflJ4BDzAmRzKjHNDFwIAfMD7sjnM4=;
	b=j+BpRzbUvJCEoCyEGCX84C4rXisrSxbFELkIPfYAiOoLiKFpwRASQ3Yydxs3lWI8Ypzt94SZXDAbGZ2oe6XExX2AqA8S2Ppt4v/U81tgNqGCnbilpQQKGQ6r8J5aGMGykQ7qQx2G8VoeepaqZlzD0SUwQxEvG88gCe/y5/JiPXA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:0f846cac-4f10-4aaf-8472-63681af62f61,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:8021f9eb-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 8a2df55ee2a911ed8687db9d93187ff1-20230424
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 641290294; Mon, 24 Apr 2023 07:08:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 24 Apr 2023 22:08:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 24 Apr 2023 22:08:48 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<eddie.huang@mediatek.com>, <mason.zhang@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>
Subject: [PATCH v5 0/3] Several UFS MCQ Code Changes
Date: Mon, 24 Apr 2023 22:08:32 +0800
Message-ID: <20230424140839.22358-1-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_070900_288291_BAA5DB9B 
X-CRM114-Status: GOOD (  10.55  )
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

v4 -> v5
- Send MTK driver MCQ support as independent patch and address Bart's 
comment there
    "[PATCH v1 0/2] Add MCQ support for MTK platform"

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


Po-Wen Kao (3):
  scsi: ufs: core: Fix mcq tag calcualtion
  scsi: ufs: core: Rename symbol sizeof_utp_transfer_cmd_desc()
  scsi: ufs: core: Fix mcq nr_hw_queues

 drivers/ufs/core/ufs-mcq.c | 5 +++--
 drivers/ufs/core/ufshcd.c  | 8 ++++----
 include/ufs/ufshcd.h       | 2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.18.0


