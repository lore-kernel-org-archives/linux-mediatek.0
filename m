Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5424AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 11:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DbI+VFEpwZQBeOIPO4jcqRrPafQmJp0JARcLwtkfCNY=; b=ICPEBYAOC9oI5aaimcxnb6zJMI
	40lYH9KMpAvy4j7SA4hhg31yod3x20F7nYV5z/FsqB4Yy/IKcWKrTcdjPmVmfqnsvamIIOHvxjTSF
	vP1HdM2lVMAf2CJjo3R6oD4ADlTXVyrdLnwZiGdVsIvCB7wSrE0aVa5FzLLutXD6R15LY8tmKLG83
	HFgIo6m2FOlxvnY5iGrOGpqTGjDnYpv7AbWz9YjXnxD170pq8a7gZ0n6PbVxyJgC1n8r7sPXVwIer
	UKUQqYdCM7pilbIbMKl5NvNbbch/Wo2aadgvzhjkHpE7a49EnIZ+hz0GP4GJ7XegJ7ns6w9zcFB/o
	2JTLHPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olq2e-007Khp-Vu; Fri, 21 Oct 2022 11:18:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olq2b-007Kfw-Jc; Fri, 21 Oct 2022 11:18:19 +0000
X-UUID: b8cbc2c7e9eb4adaa94805b0f0d27e7b-20221021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DbI+VFEpwZQBeOIPO4jcqRrPafQmJp0JARcLwtkfCNY=;
	b=tRxGjD1q6KdYTofUgVF8TCEV/cd+LsdFL+mQ/4j+Ub8CdwfXVA7J5e0lCyCSOIU5D+GTT+z6EtiXJS8tYXUeaZT8WwLjP0A0xQ37hPzJ6Hbv2Eu3Wt2fU0JoPnSOSvi78VbMBQd1quT/DDzzzVYiwjOjvgOT1ndOJt+sDKVTIp8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:326b754d-a181-4aae-a7c3-fe48de71b008,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:cb7344e4-e572-4957-be22-d8f73f3158f9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b8cbc2c7e9eb4adaa94805b0f0d27e7b-20221021
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 686083761; Fri, 21 Oct 2022 04:18:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 21 Oct 2022 18:48:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 21 Oct 2022 18:48:05 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <sboyd@kernel.org>, <mturquette@baylibre.com>, <matthias.bgg@gmail.com>,
	<p.zabel@pengutronix.de>
CC: <runyang.chen@mediatek.com>, <miles.chen@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<nfraprado@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v6 0/3] Move mediatek system clock reset to reset folder
Date: Fri, 21 Oct 2022 18:48:01 +0800
Message-ID: <20221021104804.21391-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_041817_671479_DAE3EC9D 
X-CRM114-Status: GOOD (  12.68  )
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

This series move mediatek system clock reset to drivers/reset/mediatek.

Changes for v6:
1. Separate patches.
   a. Move data and drivers to reset/mediatek.
   b. Implement auxiliary bus driver in clk/mediatek/clk-mtk.c.
   c. Implement auxiliary bus interface in reset/mediatek.
2. This version is based on 6.1-rc1.

Changes for v5:
1. Replace reset-mtxxxx.h with reset-mtxxxx.c and after using this,
   we don't need to add many "#if #endif" in reset-mediatek-sysclk.c.
2. Use mediatek clock common KConfig to control whether to build in
   reset-mtxxxx.c.
3. Rebased on linux-next-1007.

Changes for v4:
1. Rebased oo linux-next-1004.
2. Move reset data which are scattered around the mediatek drivers to
   reset-mtxxxx.h.
3. Add reset data of mt6795.

Version for this series:
v5 : https://lore.kernel.org/all/20221007104842.13164-1-rex-bc.chen@mediatek.com/
v4 : https://lore.kernel.org/all/20221005051145.29676-1-rex-bc.chen@mediatek.com/
v3 : https://lore.kernel.org/all/20220929121031.17523-1-rex-bc.chen@mediatek.com/
v2 : https://lore.kernel.org/all/20220923045738.2027-1-rex-bc.chen@mediatek.com/
v1 : https://lore.kernel.org/all/20220922141107.10203-1-rex-bc.chen@mediatek.com/
RFC: https://lore.kernel.org/all/20220527090355.7354-1-rex-bc.chen@mediatek.com/

Bo-Chen Chen (3):
  reset: mediatek: Move MediaTek system clock reset to reset/mediatek
  clk: mediatek: Add auxiliary bus support for sysclk reset
  reset: mediatek: Add auxiliary bus support for sysclk

 drivers/clk/mediatek/Kconfig                  |   2 +
 drivers/clk/mediatek/Makefile                 |   2 +-
 drivers/clk/mediatek/clk-mt2701-eth.c         |  10 +-
 drivers/clk/mediatek/clk-mt2701-g3d.c         |  10 +-
 drivers/clk/mediatek/clk-mt2701-hif.c         |  10 +-
 drivers/clk/mediatek/clk-mt2701.c             |  22 +-
 drivers/clk/mediatek/clk-mt2712.c             |  22 +-
 drivers/clk/mediatek/clk-mt6795-infracfg.c    |  22 +-
 drivers/clk/mediatek/clk-mt6795-pericfg.c     |  20 +-
 drivers/clk/mediatek/clk-mt7622-eth.c         |  10 +-
 drivers/clk/mediatek/clk-mt7622-hif.c         |  12 +-
 drivers/clk/mediatek/clk-mt7622.c             |  22 +-
 drivers/clk/mediatek/clk-mt7629-eth.c         |  10 +-
 drivers/clk/mediatek/clk-mt7629-hif.c         |  12 +-
 drivers/clk/mediatek/clk-mt8135.c             |  23 +-
 drivers/clk/mediatek/clk-mt8173.c             |  22 +-
 drivers/clk/mediatek/clk-mt8183.c             |  15 +-
 drivers/clk/mediatek/clk-mt8186-infra_ao.c    |  23 +-
 drivers/clk/mediatek/clk-mt8192.c             |  27 +-
 drivers/clk/mediatek/clk-mt8195-infra_ao.c    |  28 +-
 drivers/clk/mediatek/clk-mtk.c                |  62 ++-
 drivers/clk/mediatek/clk-mtk.h                |   8 +-
 drivers/clk/mediatek/reset.c                  | 233 -----------
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/mediatek/Kconfig                |   6 +
 drivers/reset/mediatek/Makefile               |  13 +
 .../reset/mediatek/reset-mediatek-sysclk.c    | 389 ++++++++++++++++++
 drivers/reset/mediatek/reset-mt2701.c         | 102 +++++
 drivers/reset/mediatek/reset-mt2712.c         |  42 ++
 drivers/reset/mediatek/reset-mt6795.c         |  61 +++
 drivers/reset/mediatek/reset-mt7622.c         |  91 ++++
 drivers/reset/mediatek/reset-mt7629.c         |  62 +++
 drivers/reset/mediatek/reset-mt8135.c         |  43 ++
 drivers/reset/mediatek/reset-mt8173.c         |  43 ++
 drivers/reset/mediatek/reset-mt8183.c         |  31 ++
 drivers/reset/mediatek/reset-mt8186.c         |  39 ++
 drivers/reset/mediatek/reset-mt8192.c         |  43 ++
 drivers/reset/mediatek/reset-mt8195.c         |  44 ++
 .../linux/reset/reset-mediatek-sysclk.h       |  61 +--
 40 files changed, 1142 insertions(+), 557 deletions(-)
 delete mode 100644 drivers/clk/mediatek/reset.c
 create mode 100644 drivers/reset/mediatek/Kconfig
 create mode 100644 drivers/reset/mediatek/Makefile
 create mode 100644 drivers/reset/mediatek/reset-mediatek-sysclk.c
 create mode 100644 drivers/reset/mediatek/reset-mt2701.c
 create mode 100644 drivers/reset/mediatek/reset-mt2712.c
 create mode 100644 drivers/reset/mediatek/reset-mt6795.c
 create mode 100644 drivers/reset/mediatek/reset-mt7622.c
 create mode 100644 drivers/reset/mediatek/reset-mt7629.c
 create mode 100644 drivers/reset/mediatek/reset-mt8135.c
 create mode 100644 drivers/reset/mediatek/reset-mt8173.c
 create mode 100644 drivers/reset/mediatek/reset-mt8183.c
 create mode 100644 drivers/reset/mediatek/reset-mt8186.c
 create mode 100644 drivers/reset/mediatek/reset-mt8192.c
 create mode 100644 drivers/reset/mediatek/reset-mt8195.c
 rename drivers/clk/mediatek/reset.h => include/linux/reset/reset-mediatek-sysclk.h (60%)

-- 
2.18.0


