Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EE6C10F1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 08:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IPGQmZl67fWarfOJM9Asudt96++ZIvDDltr53ZIq8sY=; b=fccn6UtOhYpDUBCgh9FuOYMsW1
	c9g+aHQcj1UP4N5KK8SlXDQWzdbtgaBDKfM36Nv0SqJyGA5mawcYsBLZy/Vz826lwEh8LpIlPYKUH
	Yg+c99vBecDc1G6DbCL9Azabb14tJCGV3bChVvyaX/o3m5fQJ7SrYHopmVWCoTIkpGMzORShrSDKH
	QzXvcJ4H/kdC+SR3ujpC/T265FUv2Gv1dVcLcUyKX082exWlxsNcI/kAjIrYVmaQsKGwKtq2zmuUS
	XMDQ8MUe8MVfS2UAtOEX10Co7MlQZAzhNMcfLY/iZQdL3IA2GXxioIt9ETHdr1M0dBeSESR8tIZyW
	X3m4wNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5Fa-00BJwB-2m; Tue, 27 Dec 2022 08:23:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5AY-00BHT5-Hw; Tue, 27 Dec 2022 08:18:44 +0000
X-UUID: ec75957c0f074dc09e0e694fcf9fb54c-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IPGQmZl67fWarfOJM9Asudt96++ZIvDDltr53ZIq8sY=;
	b=KdxnwrmGRNJYPJrVKNgF5NrVNJs2fCZ3Cv3HKp97HzhNO5SUAJIh0Xad9pzTUFIX6AA0lSvjGSm3Z5xwdHkpyvjCkYUPWvt4m3yzKErZrJ9+H8GM1LiA43z1NLhutdvPUO0f+pJqJNGeFOvxAZi4anwf4VqSieqGYF1IKrboPv8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:6e4e10d6-23fd-4a54-905d-b0366e59d7e3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:6bca12f4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ec75957c0f074dc09e0e694fcf9fb54c-20221227
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 216446241; Tue, 27 Dec 2022 01:18:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Dec 2022 15:48:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Dec 2022 15:48:00 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 0/2] Change mmsys compatible for mt8195 mediatek-drm
Date: Tue, 27 Dec 2022 15:47:57 +0800
Message-ID: <20221227074759.5216-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_001842_621930_98EAFCB4 
X-CRM114-Status: GOOD (  12.91  )
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

For previous MediaTek SoCs, such as MT8173, there are 2 display HW
pipelines binding to 1 mmsys with the same power domain, the same
clock driver and the same mediatek-drm driver.

For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
2 different power domains, different clock drivers and different
mediatek-drm drivers.

Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
and they makes VDOSYS0 supports PQ function while they are not
including in VDOSYS1.

Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
component). It makes VDOSYS1 supports the HDR function while it's not
including in VDOSYS0.

To summarize0:
Only VDOSYS0 can support PQ adjustment.
Only VDOSYS1 can support HDR adjustment.

Therefore, we need to separate these two different mmsys hardwares to
2 different compatibles for MT8195.
---
Change in v7:
1. Rebase on v6.2-rc1.
2. Squash patch 1 and 2 in v6.

Change in v6:
1. Add old driver data for mediatek-drm driver with deprecated compatible name.

Change in v5:
1. Add oneOf item to deprecate mediatek,mt8195-mmsys.

Change in v4:
1. Deprecate original mediatek,mt8195-mmsys at the first item.

Change in v3:
1. Keep the original compatible "mediatek,mt8195-mmsys" and add
   "mediatek,mt8195-vdosys0" into the same item to make the tree
   fallback compatible.

Change in v2:
1. Remove Ack tag in the first patch
2. Change the compatible name changing patch to one revert patch and
   one add vdosys0 support patch.
---

Jason-JH.Lin (2):
  drm/mediatek: change mmsys compatible for mt8195 mediatek-drm
  soc: mediatek: remove DDP_DOMPONENT_DITHER from enum

 drivers/gpu/drm/mediatek/mtk_disp_rdma.c |   6 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 128 +++--------------------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h   |   6 --
 include/linux/soc/mediatek/mtk-mmsys.h   |   3 +-
 4 files changed, 21 insertions(+), 122 deletions(-)

-- 
2.18.0


