Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4836DCA0ECE
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 07:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gZL7iqex1BPiM40l8UbNLUZwiQSnwgB+HQLPiQ5jV+M=; b=g7YPt9bNlmClQUNVOskl+O+I6N
	p1lG+ZGTKq2VGL7pQj0VtLk7DifC7Hc7EnBkym/7TDtBjVYvqnV93k/2Ziu6R+WmoJc+viDbBtpZo
	PBi4y+hShUo/3k+wmmRYrSzLUSB9Oq0HWpy/a6JrNppp5cdF/XnsbZfB7tR8V3hUuJ6TyjJQDVEyE
	nYiPjXs4rCpLBYPs8d1IxBVFp8fyX7cy1ET2IhWVN3+VnCE4d4HX+UxBVQH4iLBsRMShoZs0r9pbA
	pQODU+1dRLjyTVGPk95JDwjh83d96MWGF4VuY/F3Jk1WGKjoLYsWq2Xt2c7d+k8nKUzQgukB3U8tJ
	Q8WxHACw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyHp-002TI7-2a;
	Tue, 12 Sep 2023 07:58:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfyHl-002TDF-0p;
	Tue, 12 Sep 2023 07:58:15 +0000
X-UUID: 1cf04d0e514211ee9b7791016c24628a-20230912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gZL7iqex1BPiM40l8UbNLUZwiQSnwgB+HQLPiQ5jV+M=;
	b=bcxWN8/scLaZewZDbFomX/jP/je0hghwI+mJXKwTOVFVrDOBiL8j/f9wGaC2bULZFti09F5DokcooQxBpIYJcZ/x8YScaB9kuccyfNIaA8NUgDnMntvxLXnR2wrVa2yMt+Z3GY/PoeSN4WZ/LmRuTPjU2DDfa5g/pZQOr9WZtjk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:7df5dd1f-d9ab-4834-8aeb-020be6a340f5,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:bfa9edc2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1cf04d0e514211ee9b7791016c24628a-20230912
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 791302956; Tue, 12 Sep 2023 00:58:09 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Sep 2023 15:58:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Sep 2023 15:58:06 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Moudy
 Ho <moudy.ho@mediatek.com>
Subject: [PATCH v5 00/14] add support MDP3 on MT8195 platform
Date: Tue, 12 Sep 2023 15:57:51 +0800
Message-ID: <20230912075805.11432-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_005813_297365_DDD6698A 
X-CRM114-Status: GOOD (  15.14  )
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

Changes since v4:
- Rebase on v6.6-rc1
- Remove any unnecessary DTS settings.
- Adjust the usage of MOD and clock in blending components.

Changes since v3:
- Depend on :
  [1] https://patchwork.kernel.org/project/linux-media/list/?series=719841
- Suggested by Krzysztof, integrating all newly added bindings for
  the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
- Revise MDP3 nodes with generic names.

Changes since v2:
- Depend on :
  [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711592
  [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711618
- Suggested by Rob to revise MDP3 bindings to pass dtbs check
- Add parallel paths feature.
- Add blended components settings.

Changes since v1:
- Depend on :
  [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/?series=698872
  [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684959
- Fix compilation failure due to use of undeclared identifier in file "mtk-mdp3-cmdq.c"

Hello,

This patch is used to add support for MDP3 on the MT8195 platform that
contains more picture quality components, and can arrange more pipelines
through two sets of MMSYS and MUTEX respectively.

Moudy Ho (14):
  arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
  arm64: dts: mediatek: mt8195: add MDP3 nodes
  media: platform: mtk-mdp3: add support second sets of MMSYS
  media: platform: mtk-mdp3: add support second sets of MUTEX
  media: platform: mtk-mdp3: introduce more pipelines from MT8195
  media: platform: mtk-mdp3: introduce more MDP3 components
  media: platform: mtk-mdp3: add checks for dummy components
  media: platform: mtk-mdp3: avoid multiple driver registrations
  media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
  media: platform: mtk-mdp3: add support for blending multiple
    components
  media: platform: mtk-mdp3: add mt8195 platform configuration
  media: platform: mtk-mdp3: add mt8195 shared memory configurations
  media: platform: mtk-mdp3: add mt8195 MDP3 component settings
  media: platform: mtk-mdp3: add support for parallel pipe to improve
    FPS

 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   6 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 378 ++++++++
 .../platform/mediatek/mdp3/mdp_cfg_data.c     | 729 ++++++++++++++-
 .../platform/mediatek/mdp3/mdp_reg_aal.h      |  25 +
 .../platform/mediatek/mdp3/mdp_reg_color.h    |  31 +
 .../media/platform/mediatek/mdp3/mdp_reg_fg.h |  23 +
 .../platform/mediatek/mdp3/mdp_reg_hdr.h      |  31 +
 .../platform/mediatek/mdp3/mdp_reg_merge.h    |  25 +
 .../platform/mediatek/mdp3/mdp_reg_ovl.h      |  25 +
 .../platform/mediatek/mdp3/mdp_reg_pad.h      |  21 +
 .../platform/mediatek/mdp3/mdp_reg_rdma.h     |  24 +
 .../platform/mediatek/mdp3/mdp_reg_rsz.h      |   2 +
 .../platform/mediatek/mdp3/mdp_reg_tdshp.h    |  34 +
 .../platform/mediatek/mdp3/mdp_reg_wrot.h     |   8 +
 .../platform/mediatek/mdp3/mdp_sm_mt8195.h    | 283 ++++++
 .../platform/mediatek/mdp3/mtk-img-ipi.h      |   4 +
 .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   2 +
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 447 +++++++--
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |   1 +
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 860 +++++++++++++++++-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  93 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 103 ++-
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  33 +-
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  15 +
 .../platform/mediatek/mdp3/mtk-mdp3-regs.c    |  18 +
 .../platform/mediatek/mdp3/mtk-mdp3-regs.h    |   1 +
 .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |   3 +-
 27 files changed, 3051 insertions(+), 174 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_color.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h

-- 
2.18.0


