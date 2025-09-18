Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8CFCAC597
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=89KtbKiNREmrdsQot1mJ4yJfL+mn0r1STI29XAdntf4=; b=2RcnoEtTshdUH5uoLogDoMJOYo
	QpRmbwQSIaG6/1Aqbo3q1UzckNNaOwDqnbukz4bvmrgSwDZmTjjQWUnHjAl0EJOgqpKoSjkjyH8xl
	ewNHNncT1XuoKOS2uSNdImTpSt9DxoDm+YuVWkBJtgWZc5rmweHXwgCnWPmivECg3NacMnMDrN+3N
	iWBmPLPSJ63NoRZRT7vLX9i03Iq85RWMx3PipP6dRTkJOPinpSMoSUQdZBdY07I8bGHJrgjruMUG0
	AATyBmCqcVtSwoGLFqBtMLXystFcIY9YXaBjCMu+ohVwoI4tXeC21VufOP0XwZE7V1RVoqLUwrlvN
	8Yt40+UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3f-0000000H72o-2OG9;
	Thu, 18 Sep 2025 10:40:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC3d-0000000H70g-3hYp
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 10:40:11 +0000
X-UUID: d6c4bc96947b11f09f706fa2197c6ceb-20250918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=89KtbKiNREmrdsQot1mJ4yJfL+mn0r1STI29XAdntf4=;
	b=G3vfInSD6oji6AqkB8yZR3XX5IAo62ynhx38g649DvTBLrLeWKHo9hSvyTBrFOXGsJnHTtuo4OMk3KO9ZKXes55nc8K7L365WFbUC40sR76vp2XHygI0gZf+FY2q2k9Z8zcWpQ0Y7EIbpw+vdJWXhdJVj5G6prShMSPbBGBZ3AI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:65c79b13-7469-4f09-b510-475c3ab2a4e6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:ef28b26c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d6c4bc96947b11f09f706fa2197c6ceb-20250918
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2030763173; Thu, 18 Sep 2025 03:40:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 18 Sep 2025 18:40:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 18 Sep 2025 18:40:02 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<yi-fan.peng@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: [PATCH v1 00/10] Enhance UFS Mediatek Driver
Date: Thu, 18 Sep 2025 18:36:10 +0800
Message-ID: <20250918104000.208856-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_034009_932614_8564798D 
X-CRM114-Status: UNSURE (   7.62  )
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

Improves the UFS Mediatek driver by fixing runtime suspend
deadlocks, correcting clock scaling with PM QoS, and adjusting
power management flows. It addresses shutdown/suspend race 
conditions, enables MCQ mode interrupts, and removes redundant
functions. Support for new platforms is added with the 
MMIO_OTSD_CTRL register, and MT6991 performance is optimized
with MRTT and random improvements. These changes collectively 
enhance driver performance, stability, and compatibility.

Peter Wang (8):
  ufs: host: mediatek: Fix runtime suspend error deadlock
  ufs: host: mediatek: Correct clock scaling with PM QoS flow
  ufs: host: mediatek: Adjust clock scaling for PM flow
  ufs: host: mediatek: Handle clock scaling for high gear in PM flow
  ufs: host: mediatek: Adjust sync length for FASTAUTO mode
  ufs: host: mediatek: Fix shutdown/suspend race condition
  ufs: host: mediatek: Remove duplicate function
  ufs: host: mediatek: Add support for new platform with MMIO_OTSD_CTR

Alice Chao (1):
  ufs: host: mediatek: Enable interrupts for MCQ mode

Naomi Chu (1):
  ufs: host: mediatek: Support new feature for MT6991

 drivers/ufs/core/ufs-sysfs.c    |   3 +-
 drivers/ufs/core/ufshcd-priv.h  |   5 --
 drivers/ufs/core/ufshcd.c       |  18 +----
 drivers/ufs/host/ufs-mediatek.c | 134 ++++++++++++++++++++++++++------
 drivers/ufs/host/ufs-mediatek.h |   7 ++
 include/ufs/ufshcd.h            |  20 +++++
 include/ufs/unipro.h            |   7 +-
 7 files changed, 150 insertions(+), 44 deletions(-)

-- 
2.45.2


