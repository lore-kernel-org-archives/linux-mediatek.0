Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1489DC7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 17:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dxQK2hEMGOO4n71nmEJ0/3GKd1uTS+Ys9UMnp+oUaHs=; b=chY39EhusFm8FE2zjJjvMi+wYJ
	ZowY/aMqFVGrUBPFaq/Lv3Gbyf5dczeQelIjYe+4EfO8su81TW5LMnbQk3YCa/of+NTHMfbC3RC6p
	fZS5JAcaNaRlzTHSzpJHMxcHl+4kl4oWYqkG1n9g5Zws7OwaGJZeDB0uMrLJOm8Jzt90GEZWKSz6s
	dvHpo6QavzPJkbsI7ZhJTUEY/FvZ1A8PUUk4Msi67nIg6koP4v9EWpARCUDhOZ8Line/+feSw1C+t
	t0f3TaHJ0xoe1jdlJzFPidoBJIX1icQsMpOBCnBEmd8Qm94YgA3hamdKagaRTJhlBZMnO1d2LQvYy
	HpYH+4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ltW-004Np2-2X;
	Thu, 01 Jun 2023 17:15:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ltT-004NnB-0L;
	Thu, 01 Jun 2023 17:15:24 +0000
X-UUID: e15e923e009f11ee83ed1395ce914268-20230601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dxQK2hEMGOO4n71nmEJ0/3GKd1uTS+Ys9UMnp+oUaHs=;
	b=GnYY9sNCMpLAsdey6cencKQ83cZExVaL8n+pPhpjp9aiU8qvl6HzvsnaX7ksmnTRkWkhKIqSyOXTqavJChN14GqwW+ZNkfRoOmsxgabxS1t/46py/hYTL+0ADcMOyTqzJOupRZD6m3dAxM9NU2VBQv4T0qNOsy+BKxoFwX9pSKo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:61d1e2cf-7aac-4a7b-8b1b-f852f159cef6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:95
X-CID-INFO: VERSION:1.1.25,REQID:61d1e2cf-7aac-4a7b-8b1b-f852f159cef6,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:95
X-CID-META: VersionHash:d5b0ae3,CLOUDID:6099493d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:230602011516OP2YXXXY,BulkQuantity:2,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: e15e923e009f11ee83ed1395ce914268-20230601
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 552964025; Thu, 01 Jun 2023 10:15:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 2 Jun 2023 01:15:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Jun 2023 01:15:15 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 0/2] Add dynamic connector selection mechanism
Date: Fri, 2 Jun 2023 01:15:11 +0800
Message-ID: <20230601171513.8533-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_101523_157440_23F4250F 
X-CRM114-Status: UNSURE (   8.76  )
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

To support DSI and eDP as main display connector without modifying
mtk-drm driver, we add the dynamic connector selection mechanism.

Change in v4:
1. Change variable naming of connector routes number from conn_route_num to num_conn_routes.
2. Chnage he encoder_index function return valuew from int to unsigned int.

Change in v3:
1. Change max_num comparison statement to max().

Change in v2:
1. rebase on linux-next: next-20230426
2. Fix alphabetical order and max_num condition check problem.

Change in v1:
1. based on mediatek-drm maintainer's tree / mediatek-drm-next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Jason-JH.Lin (2):
  drm/mediatek: Add ability to support dynamic connector selection
  drm/mediatek: Add DSI support for mt8188 vdosys0

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   2 +
 drivers/gpu/drm/mediatek/mtk_dpi.c          |   9 ++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 111 +++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  28 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   8 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  49 +++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   8 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c          |   9 ++
 9 files changed, 218 insertions(+), 11 deletions(-)

-- 
2.18.0


