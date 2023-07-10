Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EE2EB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 03:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5E6GCSOPPeBzjt5eT4wC80eT9w6Zqzi9GNxqzu2QMCg=; b=rhH4IJkwLUdiI2V0rhiFGpiov/
	X3wz+qDSCTkm1jLHwJESuy6Yq7qC8VAalajkUPdK6uJ9puRkJVENfl8VpAIg8qEK3wpe7mvh7Ycgn
	NPnA9PDYLcOdiIwf6qtTTv9sXQ/7AFFxryiogEkJDVdr20UhLApwSt3orLPj6CgsBl6ENQT5ur0+U
	ahSRoUDoU/v2t6Xml7DlKErK7ZfOOSNqA+JnxrOe8sHaf5OhZ6hzRwxngJbIkXT3+Upv/Ba+4J3Ax
	FQw90QswfrbYWDKTm3z3x17+Idw8ymomXCjyM7fIMdGW4CIJFYu3elxd2eOrw0wJHwA+tcx87O+3Q
	b9xVgvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIi40-00ALFW-2O;
	Mon, 10 Jul 2023 03:59:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIi3x-00ALEC-1I;
	Mon, 10 Jul 2023 03:59:50 +0000
X-UUID: 327270ce1ed611ee83ed1395ce914268-20230709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5E6GCSOPPeBzjt5eT4wC80eT9w6Zqzi9GNxqzu2QMCg=;
	b=h9K3SN9KOhIuaGNeM3ANipS58SZXUpH47+Q0u6Ry98DZIV6byAItB60XUqVdOcPOvb2qjHq1z7TjkpRZ4zwqE/NgMmCt9+9ttm/ujUNwu16Vt3CceXtTHx9WubGzf5wBjTdeRXC82GuJp1szV/19ghYSV0xLBhBKo6vo4n3NHBg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:cada36b5-28bb-4604-9d40-f84c81c1782b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:01c9525,CLOUDID:58d40b0e-c22b-45ab-8a43-3004e9216b56,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 327270ce1ed611ee83ed1395ce914268-20230709
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 964568447; Sun, 09 Jul 2023 20:59:41 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 10 Jul 2023 11:39:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 10 Jul 2023 11:39:06 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 0/2] Add dynamic connector selection mechanism
Date: Mon, 10 Jul 2023 10:52:45 +0800
Message-ID: <20230710025247.20365-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_205949_448456_BC191C99 
X-CRM114-Status: UNSURE (   8.75  )
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

Change in v6:
1. remove max_ddp_comp_nr.

Change in v5:
1. Change conn_routes array to single component enum id.

Change in v4:
1. Change variable naming from conn_route_num to num_conn_routes.
2. Change he encoder_index function return valuew from int to unsigned int.

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

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 +
 drivers/gpu/drm/mediatek/mtk_dpi.c          |  9 +++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 84 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 27 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 38 ++++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  7 ++
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  9 +++
 9 files changed, 180 insertions(+), 9 deletions(-)

-- 
2.18.0


