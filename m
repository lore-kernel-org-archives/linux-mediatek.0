Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E32CAC5B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 09:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=drF1fdmkMoWlGNql8tAYPyTbYL9ZuOc9JcTmIddHJ9c=; b=lKH/qQo96c5Pqey187CaIZy1Bt
	UoRLN/DaNWoJFQt71MBmc4OrXQNEUz5KMpDna1ThInlvkydpzi8HeC1FzXg28GuycHUoz01WoKET6
	mkZriOZR3mseZPzY4DBLGyU4nTqOCY6ZQ+3HmzC1FmDdGUtlHKrk7CP2HhDIQDLkwWobrCqR3Okkt
	P2AeA6qER5no+y2w5tObRB7o2qDZ+XWE0/a0qb04K0awPoTzjPvZWD+zgz5cOPo58s9uFlifxC771
	QMyFp7mKJIN41/PAdXBeY3nyCyMWQmIMgVOlW+laYyMBZ++VgYGYo7XURKDbMUjtLy7z7ru6Ymz/1
	bZ5i2Qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M48-0000000GAhg-2yHj;
	Wed, 24 Sep 2025 09:45:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1M46-0000000GAeW-1Pez
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 09:45:35 +0000
X-UUID: 35cb7834992b11f09f706fa2197c6ceb-20250924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=drF1fdmkMoWlGNql8tAYPyTbYL9ZuOc9JcTmIddHJ9c=;
	b=L5HvVvlDLuWnT4r7LS2babqlB5U66a2NUslSbkSSCjpVsNEs9IiRLIvy/rUrJgUfa3s0A+Ce5/vi9Wvf4Xt4ap9Z/MddS/6mzyxYgodVbER8lHhWSdSncIdjJbVlJJ+voYFmcJ2znb2uVykSaV0KCrkta8+dvGIoyTQ2QYnYb90=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:45e75ff1-0013-42c9-8228-4d05dc35c1d4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:a6dca3f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 35cb7834992b11f09f706fa2197c6ceb-20250924
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 299383285; Wed, 24 Sep 2025 02:45:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 24 Sep 2025 17:45:28 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 24 Sep 2025 17:45:28 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v2 0/8] Enhance UFS Mediatek Driver
Date: Wed, 24 Sep 2025 17:43:22 +0800
Message-ID: <20250924094527.2992256-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_024534_391526_18364D27 
X-CRM114-Status: UNSURE (   7.54  )
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

Improves the UFS Mediatek driver by correcting clock scaling 
with PM QoS, and adjusting power management flows. It addresses
shutdown/suspend race conditions, and removes redundant
functions. Support for new platforms is added with the 
MMIO_OTSD_CTRL register, and MT6991 performance is optimized
with MRTT and random improvements. These changes collectively 
enhance driver performance, stability, and compatibility.

Changes since v1:
1. Remove two patches that will be fixed in UFS core.
  ufs: host: mediatek: Fix runtime suspend error deadlock
  ufs: host: mediatek: Enable interrupts for MCQ mode
2. Use hba->shutting_down instead of ufshcd_is_user_access_allowed

Peter Wang (7):
  ufs: host: mediatek: Correct clock scaling with PM QoS flow
  ufs: host: mediatek: Adjust clock scaling for PM flow
  ufs: host: mediatek: Handle clock scaling for high gear in PM flow
  ufs: host: mediatek: Adjust sync length for FASTAUTO mode
  ufs: host: mediatek: Fix shutdown/suspend race condition
  ufs: host: mediatek: Remove duplicate function
  ufs: host: mediatek: Add support for new platform with MMIO_OTSD_CTR

Naomi Chu (1):
  ufs: host: mediatek: Support new feature for MT6991

 drivers/ufs/core/ufs-sysfs.c    |   3 +-
 drivers/ufs/core/ufshcd.c       |   3 +-
 drivers/ufs/host/ufs-mediatek.c | 119 ++++++++++++++++++++++++++------
 drivers/ufs/host/ufs-mediatek.h |   4 ++
 include/ufs/ufshcd.h            |   2 +
 include/ufs/unipro.h            |   7 +-
 6 files changed, 115 insertions(+), 23 deletions(-)

-- 
2.45.2


