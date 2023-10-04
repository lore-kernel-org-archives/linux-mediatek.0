Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33313E8FDC3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 02:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JdWTdcNDf6wAkZfZYuOCwB5rWSf13DfxWBpKBToyRMo=; b=SJrWCO71rzap3/Y6L7BlcGOoWl
	RVtafQnTDpBtszcGnZgz7W/3jqwbusJ44emoLFcf2vRChEFjU47Kre7geUFaGrqcj1jkPyUpAFwPX
	w0ILGXCEomuO1bhVR8FGv8vZATUKAIzVPpV/fMhGAZTkhwGpjFQU3l5ik+DKP1YF0eoeiRy2rn3gA
	Yb+m5vBr8moXsL99z9I3zm0oyehs4ykA9vLghs9PMLAW7Q0uwYk9HcSriJWjuZV2SuMFcywCtVYk3
	B2nTpdXtCDwt1QsHyU5+gP+3VpoS8/pvmY990mOxSVfq10MJ55q85929XlkBScPD1ir22ilI5WSbR
	8/Pg2ilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnrop-00Fnl8-32;
	Wed, 04 Oct 2023 02:40:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnrok-00FnhB-2g;
	Wed, 04 Oct 2023 02:40:56 +0000
X-UUID: 6d5b38a2625f11ee9b7791016c24628a-20231003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JdWTdcNDf6wAkZfZYuOCwB5rWSf13DfxWBpKBToyRMo=;
	b=ky0IVuSTqUc+50rLm/PE5H3MMqUYGtg1KLHLyplRoUTSDTRo15kcS40evY+da04pFZQHliKgmKWxHFeW9iu0N9IutTqQYkERXsNHQ0521aaErrohxoWQp3XHXsJ125xqtC5BCWijeosecFt3No8f2e/DpTykHlWu5jcZAlUL+pY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:0fda097e-8b8a-451d-b574-bb354705b94e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:75aea814-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 6d5b38a2625f11ee9b7791016c24628a-20231003
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 64337221; Tue, 03 Oct 2023 19:40:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 4 Oct 2023 10:40:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 4 Oct 2023 10:40:14 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v11 0/9] Add connector dynamic selection capability
Date: Wed, 4 Oct 2023 10:40:04 +0800
Message-ID: <20231004024013.18956-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.549800-8.000000
X-TMASE-MatchedRID: HECydOu7ZluU2fVedEQUO1z+axQLnAVBIaLR+2xKRDIxBvTc7v9+ZyU0
	V2udwSKC5M3BSxL9NtlFAm5O+Q5wcPZomtZBUIXQhK8o4aoss8qMjqpeR/YVDUS/boWSGMtdh2d
	ZdoWeP4Xmp24rTXZI/g46Ehxwo1ljiahd50YTr4qUa50su1E7WywJzaIVMjGtFJMC9vnfmol576
	my5IxjutODPn6/D3UTG9zI5/9pjDck8jpRZkMC+UhwlOfYeSqx4b+uxQ/rA9Zo5YsPsbyLXemo2
	1PNMyiqvOj79KHQcVbDRpsDfF9TvaddX1GSqEt8H5YQyOg71ZZ9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO0kL2NLniq3NQMhYXjNgfyh2JQ90sLLhV+6bmWwRthZFvQbLU9mGnJb
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.549800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BBB2A75DEB64F3BF7A1745AE399587A67CF5AF5AF913BF2AD4CB2219F16CC1032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_194054_892677_6C3BF91E 
X-CRM114-Status: GOOD (  11.85  )
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
mtk-drm driver, we add connector dynamic selection capability.

Change in v11:
1. move some global variable to a scope.
2. move mtk_drm_crtc_update_output() after pm_runtime_resume_and_get().
3. move return 0 when error occurred into mtk_drm_find_comp_in_ddp_conn_path().

Change in v10:
1. rebase to Linux 6.6-rc3.
2. separate the common part of adding encoder_index interface for ddp_comp
   to a single patch.
3. separate the DP_INTF0 support dynamic selection to a single patch.
4. add the array size while allocating ddp_comp array in mtk_crtc.
5. add some comment for marking encoder_index to -1.

Change in v9:
1. change subject title and [PATCH v11 5/7] title.
2. separate [PATCH v11 4/7]
   and [PATCH v11 5/7].
3. fix typo and some grammar problems in commit message.

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

Jason-JH.Lin (9):
  drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0 driver data
  drm/mediatek: Add crtc path enum for all_drm_priv array
  drm/mediatek: Fix using wrong drm private data to bind mediatek-drm
  drm/mediatek: Add encoder_index interface for mtk_ddp_comp_funcs
  drm/mediatek: Add connector dynamic selection capability
  drm/mediatek: dpi: Support dynamic connector selection
  drm/mediatek: Support dynamic selection of DP_INTF0 on MT8188 VDOSYS0
  drm/mediatek: dsi: Support dynamic connector selection
  drm/mediatek: Support dynamic selection of DSI0 on MT8188 VDOSYS0

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 +
 drivers/gpu/drm/mediatek/mtk_dpi.c          |  9 +++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 72 ++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 32 ++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 +++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 45 ++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      | 15 ++++-
 drivers/gpu/drm/mediatek/mtk_dsi.c          |  9 +++
 9 files changed, 182 insertions(+), 15 deletions(-)

-- 
2.18.0


