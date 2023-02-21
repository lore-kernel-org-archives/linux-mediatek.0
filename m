Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7CBC61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 15:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WYX6AEWrKRUziBpjt/Fwbvd9u6qdg42EY2Jx5icApRg=; b=K0xvLTKOieOzQx4PItnfRbV/jW
	j+Pwpwe0+r60J74qw4lMaue46nncjiVa9mrT6LBqvJF6lipBErnby7+Ul0oLv3sbbungagPoPwNo9
	xbnTb5MFwaFDQKMgBgbndbg3QcCL7ROX9XgJM4T1jS5/QMci627oYUalUHgSaayASR2jb5mDHnxeS
	HVzrVSxPbQMKKnTkTGVmTZnuSWpj2Nt3sFZlrQXpn1tnkKxQZhUCA+XIf5DE+mD0hK/P/BSuAWfyW
	KPmRS4OKjMSSL6GWGmNgT8tJ9Ud/394JNib/G45uchoQ8zLcd+NZghPbVFEQI0hHkBwfPR2IUE678
	hxQywjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUmY-008krd-Op; Tue, 21 Feb 2023 15:42:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUki-008jcZ-3W; Tue, 21 Feb 2023 15:40:25 +0000
X-UUID: 0afebcccb1fe11edbbe3f76fe852e059-20230221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WYX6AEWrKRUziBpjt/Fwbvd9u6qdg42EY2Jx5icApRg=;
	b=nDgx6MSWCTZbOScBDzkxcuLItNdNO/h0SgZ7GuAvuUckP/Y0CKZCD3anxE+ZjffiiZy9q2wm18mkU5K7Mtxv77yo7XkwYpvqfZ93wPzHANV+gbo/zNprcMzI4IeC0a8pibtrTeJIWVl2ZilM6AeYNaSkGz3jAiFTZp6gJNEFehI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:0b34d9b8-bd81-48f1-9e96-1ee01e5f2bb7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:27bd22b1-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 0afebcccb1fe11edbbe3f76fe852e059-20230221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 86474234; Tue, 21 Feb 2023 08:40:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 21 Feb 2023 23:30:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 21 Feb 2023 23:30:15 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <cc.chou@mediatek.com>,
	<eddie.huang@mediatek.com>, <mason.zhang@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/4] Serveral UFS MCQ code changes 
Date: Tue, 21 Feb 2023 23:29:13 +0800
Message-ID: <20230221152919.25837-1-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_074024_447026_8D0CE845 
X-CRM114-Status: UNSURE (   6.65  )
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

Hi,

Here are patches that fixes issues known to us as well as a new util
function (ufshcd_mcq_print_hwqs()) that prints hwq is introduced.

Po-Wen Kao (4):
  scsi: ufs: core: Fix mcq tag calcualtion
  scsi: ufs: core: Fix mcq nr_hw_queues
  scsi: ufs: core: Add hwq print for debug
  scsi: ufs: core: Remove redundant check

 drivers/ufs/core/ufs-mcq.c     | 36 +++++++++++++++++++++++++++++++---
 drivers/ufs/core/ufshcd-priv.h |  9 +++++++++
 drivers/ufs/core/ufshcd.c      | 28 ++++++++++++++------------
 include/ufs/ufshcd.h           |  2 +-
 include/ufs/ufshci.h           | 12 ++++++++++++
 5 files changed, 71 insertions(+), 16 deletions(-)

-- 
2.18.0


