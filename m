Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18796C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7qt8AK2AmU2IuNwbLo0Pf7LfqvMEGSD2wIsPm5TzfMI=; b=cDpAwO0idsKBAEtiUBEi/Y7e4Z
	Qe+DcYSVextAJYvSUtH3ahp8UNxUVWljPD4ibpODKGJRBQS0OC2w+sVtLZXCkqvpcFN5LiXIiTKoO
	m8/HdRM65Rzq8jFy99LNQpTHaL42Da8lY0vkPPAxGkyZsQiI8SqTqezSiz5veQyGXGOwtfiwS8Dbd
	RwdfBhtYCngewpmWT2HQPeRNOSEMA6Y4XdZZwnp2zoLKkjZtvp66iYfk0rNf7VHh6J/FOeUGcD4cF
	bAWI81S7zj1alDsS1Mqb8vrfDXLCt7bR8kg0ZqXW1Q8a+ptgldWL0MgkQPl4jP95DrcZ/fu9k8Asw
	PTkg3dlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRD9e-0057bI-0c;
	Wed, 02 Aug 2023 14:48:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRD9a-0057ZF-1f;
	Wed, 02 Aug 2023 14:48:48 +0000
X-UUID: abc6abd2314311ee83ed1395ce914268-20230802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7qt8AK2AmU2IuNwbLo0Pf7LfqvMEGSD2wIsPm5TzfMI=;
	b=OG620t+X43cgYUqbDGdWh1jWwfLkgv4BR0/TJYfWPesTyIJZTvwKg5Xp5oCrGifXLWbw2Th6PauDzVJTQmBahf9OAzqAiwoKeWWhDpt9BVABFGaEWZo6EYtQg2HVMijxBkWC/twhRjOPZux8uZiwCd/m9v7B1BvUgr0+qCYE4FQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:d063ae3b-8ac2-4bb0-9fe3-3b9fb3befce5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.30,REQID:d063ae3b-8ac2-4bb0-9fe3-3b9fb3befce5,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:1fcc6f8,CLOUDID:7baa13b4-a467-4aa9-9e04-f584452e3794,B
	ulkID:230802224806EJ08305Y,BulkQuantity:3,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULS,
	TF_CID_SPAM_SNR,TF_CID_SPAM_SDM
X-UUID: abc6abd2314311ee83ed1395ce914268-20230802
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 678183366; Wed, 02 Aug 2023 07:48:40 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 2 Aug 2023 22:48:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 2 Aug 2023 22:48:03 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eugen Hristev
	<eugen.hristev@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 0/8] Add dynamic connector selection mechanism
Date: Wed, 2 Aug 2023 22:47:54 +0800
Message-ID: <20230802144802.751-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_074846_559732_20410C9C 
X-CRM114-Status: GOOD (  11.18  )
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

Change in v8:
1. add mtk_drm_crtc_path enum to replace array index of all_drm_priv.
2. separate add encoder_index function to another patch.
3. separate add dpi and dsi encoder_index function implementation to
   another patch.
4. separate add dsi conn_routes support to another patch.
5. set encoder_index to -1 if comp->dev doesn't not exist and add
   (encoder_index >= 0) checking before assigning conn_routes.
6. move conn_routes statement to the end of mtk_drm_crtc_create.

Change in v7:
1. separate 2 fixes patch from v6.
2. remove unnecessary null checking and variable.
3. move ddp_comp checking to crtc create.

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

Jason-JH.Lin (8):
  drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0 driver data
  drm/mediatevk: Add crtc path enum for all_drm_priv array
  drm/mediatek: Fix using wrong drm private data to bind mediatek-drm
  drm/mediatek: Add encoder_index function to mtk_ddp_comp_funcs
  drm/mediatek: dpi: Support dynamic connector selection
  drm/mediatek: Add ability to support dynamic connector selection
  drm/mediatek: dsi: Support dynamic connector selection
  drm/mediatek: Support DSI on MT8188 VDOSYS0

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 +
 drivers/gpu/drm/mediatek/mtk_dpi.c          |  9 +++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 81 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 29 +++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 44 ++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      | 15 +++-
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  9 +++
 9 files changed, 188 insertions(+), 14 deletions(-)

-- 
2.18.0


