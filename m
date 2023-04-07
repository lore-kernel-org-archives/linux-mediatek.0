Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192D0C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 06:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OhNvpOrTiNR2wjUM2qqmnoQXR+IXyZ1HNN5qN7VtfgI=; b=HWOWFIJsL+dHffGxNDZGCMxlOZ
	aSv2bnxnBay1ALae9at1nkC9iL/gC+fdxwoNC2PSc9u3SRmElEQz1ORHyTGy0gLFWtUpL5W5iSWSf
	GuiHuRCV2Wze4TVyXvC9epPuD8aRhcD4KQ40C6JFgsuRiz3AaDArUZ4jHwJroM/oaOsUctdpLp2Nr
	oNLxSvZNk4Ss2AnKeUfRGqDO9BmrmO7NMml+zAOPYgsEnGI3soMyLOhuFmRHKJIrMO93AEhFs8kyV
	0spWSjnCuvKl9y9CSewJybqkUzyLOHcSP7pL3n9mvOLnqu8MnYMNcuXELdrRj0QGLsYSjx8zxWODV
	qpRDCeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfsO-009J2l-2g;
	Fri, 07 Apr 2023 06:47:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfsK-009J1B-2K;
	Fri, 07 Apr 2023 06:47:09 +0000
X-UUID: 000f8a6ed51011ed8687db9d93187ff1-20230406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OhNvpOrTiNR2wjUM2qqmnoQXR+IXyZ1HNN5qN7VtfgI=;
	b=n0jDbw7CZq0aNY5CLi8qZB6dtNoAwuDAggemis1VlzVEbk0/oapRuVp6fWI973xybEQSxZ+TT7RHn1ijnIl0nxd2zFPbi5R7rWRwq+wbNtctPIexlxCKs3flpFJahFxr7ogrYrgwBE17pfO15uvBsHKv4sq0AEZZLiy54uJ9QmM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:b1a53388-fb82-414c-a265-802b815054bf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:2a7c9c2a-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 000f8a6ed51011ed8687db9d93187ff1-20230406
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1189753655; Thu, 06 Apr 2023 23:47:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 14:46:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 14:46:58 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/5] Fix mediatek-drm coverity issues
Date: Fri, 7 Apr 2023 14:46:52 +0800
Message-ID: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_234708_767106_21919694 
X-CRM114-Status: UNSURE (   7.61  )
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

Add this patch series to fix these mediatek-drm coverity issues.

Jason-JH.Lin (5):
  drm/mediatek: Remove freeing not dynamic allocated memory
  drm/mediatek: Add cnt checking for coverity issue
  drm/mediatek: Add initialization for mtk_gem_obj
  drm/mediatek: Add casting before assign
  drm/mediatek: Fix dereference before null check

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   |  4 ++--
 drivers/gpu/drm/mediatek/mtk_drm_gem.c   |  4 ++--
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 29 +++++++++++-------------
 4 files changed, 17 insertions(+), 21 deletions(-)

-- 
2.18.0


