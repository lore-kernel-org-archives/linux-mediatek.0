Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44393C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 03:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iZDnSTAwSwS5YygcvAX7evJZgTWzUfa5p+Ju9s2xDIg=; b=n8wNQRB+PLXTBYOQ8II/hPgEFl
	6jJgNSQhtipWEu0ycxRyIaUNLemRZAGXl0GjjfDtHFxZVEsvIXmPac5mIT6LlY5gq/gdy15C03qFL
	JI/R4GU0zaGZkKzZ32kSisrOpBsS85P66tS7ENBWLQuZetA6exEeCan5m8HXOvch5vBf1mjHNEu9b
	mvMiB8K+kLK9DAYHksXOzU9/9/Y/jM4y5bXHXOM5LMQ++8jwPpx2wBQBgV1KYmKHJTL3xh2n5MGdb
	XDbRNAy8tpCBgkh+YQEv4iIjdX0aq/KgxzuY6RZ+qVMYtNHoRjp+Yf2Co2+LaaqoXfr5Gqrapr1ek
	pC2kDrmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfkO-00AaJe-EK; Wed, 22 Feb 2023 03:24:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUfkL-00AaJ2-MU; Wed, 22 Feb 2023 03:24:46 +0000
X-UUID: 70fc368cb26011edbbe3f76fe852e059-20230221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=iZDnSTAwSwS5YygcvAX7evJZgTWzUfa5p+Ju9s2xDIg=;
	b=XhUhG/V5axryGi6dJv0l9iR+eIfrEMEb1v0rE4gbUEJ5JfJblhbjtrI88hSrS5RfFoWVGqv7MpsIjTKEBxAKuyMpBkFhpG/lT08ZsQJZ4pSUU1K4tL9sLNAsfGSOONQTBuzaoGm363AoxRz6z3vzXy4shb067mqgBsz36ITIOyg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:195bb351-4185-4840-b61b-506153b66059,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:25b5999,CLOUDID:cb7b4f26-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 70fc368cb26011edbbe3f76fe852e059-20230221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1152624418; Tue, 21 Feb 2023 20:24:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 22 Feb 2023 11:04:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 22 Feb 2023 11:04:36 +0800
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
Subject: [PATCH v2 0/7] Several UFS MCQ Code Changes
Date: Wed, 22 Feb 2023 11:04:17 +0800
Message-ID: <20230222030427.957-1-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_192445_754244_2CE6F606 
X-CRM114-Status: UNSURE (   8.18  )
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

v1 -> v2:
- Add 2 new patches
	- Update MTK driver for mcq
	- Export symbols for MTK driver
- Fix commit message in "scsi: ufs: core: Fix mcq nr_hw_queues"
- Split name change and fix into two patches

Po-Wen Kao (7):
  scsi: ufs: core: Fix mcq tag calcualtion
  scsi: ufs: core: Rename symbols
  scsi: ufs: core: Fix mcq nr_hw_queues
  scsi: ufs: core: Add hwq print for debug
  scsi: ufs: core: Remove redundant check
  scsi: ufs: core: Export symbols for MTK driver module
  scsi: ufs: mtk-host: Add MCQ support for MTK platform

 drivers/ufs/core/ufs-mcq.c      |  39 ++++++-
 drivers/ufs/core/ufshcd-priv.h  |  11 +-
 drivers/ufs/core/ufshcd.c       |  31 ++---
 drivers/ufs/host/ufs-mediatek.c | 193 +++++++++++++++++++++++++++++++-
 drivers/ufs/host/ufs-mediatek.h |  33 ++++++
 include/ufs/ufshcd.h            |   8 +-
 include/ufs/ufshci.h            |  12 ++
 7 files changed, 306 insertions(+), 21 deletions(-)

-- 
2.18.0


