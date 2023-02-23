Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9185BC64ED6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GEcfKLC4qBFQtVKfOBmpbt6Vx+1YFodMzmUJx79oJJE=; b=puG961HQEwFPNUBlY/d8Ru1swF
	LMP/umfZUrf7HZR5gigjm4KiTn0VS+hBF5INg+P1Nh7bl0URUbxuXFpJD+d10NZzrd/jEu4+GBgQM
	l4SLo/RsoHBuWMdalQiASUInyJMZg8pagv7I/P+PrLREJYQ01vD21/mGySUFnsIb4qRJtDOJ9HIR5
	L91JrItjtAPiAEa/79OaDhSNJEuF+B1pckQnr/GIOANvRP4gEdNFnK8qdxLgHmcMBdl9WvzIBQpTQ
	S6HLZ3CJf0VxB+eBQDTnsDegl/v1Opt0X0maiM4HU9V45sJuzpZvPyd4EqmKZmEjC7t1uZko6aw4U
	+D80jecA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVDWF-00H1Qc-2C; Thu, 23 Feb 2023 15:28:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVDWC-00H1OG-Du; Thu, 23 Feb 2023 15:28:25 +0000
X-UUID: b1ef5dc0b38e11edbbe3f76fe852e059-20230223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GEcfKLC4qBFQtVKfOBmpbt6Vx+1YFodMzmUJx79oJJE=;
	b=tWEKHGFTzylMhp5YryiwKU4tOrgqWf1r1bd8BOHk4XohZhukG+FCTBpZLCbJv8+YKpTyJp80QQIvjEHriDUZXh26Fdnc+ENJ42E6Ow1P+5x5hnN7KP5T9TAXBuhm8KWOEYdvBwWnCMF9qrmeulQYYPXt7qVQLJ5yFcN1NBquK7Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:18544ed0-7028-4189-bbc2-1f15673b2a47,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:34ddeff3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: b1ef5dc0b38e11edbbe3f76fe852e059-20230223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 486488714; Thu, 23 Feb 2023 08:28:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 23 Feb 2023 23:28:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 23 Feb 2023 23:28:14 +0800
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
Subject: [PATCH v3 0/6] Several UFS MCQ Code Changes
Date: Thu, 23 Feb 2023 23:27:50 +0800
Message-ID: <20230223152757.13606-1-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_072824_499409_1D4BD9AC 
X-CRM114-Status: UNSURE (   7.89  )
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

Po-Wen Kao (6):
  scsi: ufs: core: Fix mcq tag calcualtion
  scsi: ufs: core: Rename symbols
  scsi: ufs: core: Fix mcq nr_hw_queues
  scsi: ufs: core: Remove redundant check
  scsi: ufs: core: Export symbols for MTK driver module
  scsi: ufs: ufs-mediatek: Add MCQ support for MTK platform

 drivers/ufs/core/ufs-mcq.c      |   8 +-
 drivers/ufs/core/ufshcd-priv.h  |   2 -
 drivers/ufs/core/ufshcd.c       |  13 ++-
 drivers/ufs/host/ufs-mediatek.c | 193 +++++++++++++++++++++++++++++++-
 drivers/ufs/host/ufs-mediatek.h |  33 ++++++
 include/ufs/ufshcd.h            |   7 +-
 6 files changed, 243 insertions(+), 13 deletions(-)

-- 
2.18.0


