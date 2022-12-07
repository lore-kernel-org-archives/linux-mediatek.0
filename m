Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDB7C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 09:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ud7YIAEYaWGEcoDTTgKxmMn9Mr1u/rV/keE/O8rmB3k=; b=Qqv+t1C+lBEayrLdy0Wwd9bgFb
	/buS2/VviyF73iVPx/Dj9f+PeIvC0TVZlReEMCmz3ZpQaRaeYTluK0p7ix+iZNpnqckiGlBb5aj/Q
	PXtukGOHlXLq/U3niZaFo7Q6BXo+n0ErDYbS//qiajkUUN3bKplqI395dejFFNwROjhkCdcxGk00Z
	Z7p5e6wrVse2egSMnFVf2IqWsTlVi5RosPEuS3SHnpDGK2LkZGSIR4EBG/rPp9ztBVI+oD5i+uC4q
	89Wp6ujoWf2qj3svKOGbXKDKVVjJZ5fmsNVkThjGvZzrdnINvQMPZ7m/KTb4AV2uknCiZbZSNusMT
	P8qb1bcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qzC-00GSzH-JO; Wed, 07 Dec 2022 09:45:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qz7-00GSp6-Bf; Wed, 07 Dec 2022 09:45:04 +0000
X-UUID: 37abe7b06b454f1184ded1c81f85768b-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ud7YIAEYaWGEcoDTTgKxmMn9Mr1u/rV/keE/O8rmB3k=;
	b=rZdMKVFJYQk4ohbSK+QTEhOe7P4cprK11Fu+0mW1jpSXYrs8CGWmHR6DHDtV4B8I3Ot72FitsnpE0UCwhnf4xTZz8RfVF17T1YXgmqtjV6BUDdRKk+3yFpxVLSj3thAdmxVxwmCSXWARu1tMlgy7vdDTIk/+vzelstQ7i1+JR4c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:acef2420-df10-4dc6-a7f7-b88e0a17a777,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:d4e2cd16-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 37abe7b06b454f1184ded1c81f85768b-20221207
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1820725532; Wed, 07 Dec 2022 02:44:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 16:44:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 16:44:13 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, mtk18742
	<moudy.ho@mediatek.com>
Subject: [PATCH v2 00/12] add support MDP3 on MT8195 platform
Date: Wed, 7 Dec 2022 16:44:00 +0800
Message-ID: <20221207084412.14075-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_014501_441295_DCB32639 
X-CRM114-Status: GOOD (  13.23  )
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

From: mtk18742 <moudy.ho@mediatek.com>

Changes since v1:
- Depend on :
  [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/?series=698872
  [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684959
- Fix compilation failure due to use of undeclared identifier in file "mtk-mdp3-cmdq.c"

Hello,

This patch is used to add support for MDP3 on the MT8195 platform that
contains more picture quality components, and can arrange more pipelines
through two sets of MMSYS and MUTEX respectively.

Moudy Ho (12):
  dt-binding: mediatek: add bindings for MediaTek 8195 MDP3 components
  arm64: dts: mediatek: mt8195: add MDP3 nodes
  media: platform: mtk-mdp3: add support second sets of MMSYS
  media: platform: mtk-mdp3: add support second sets of MUTEX
  media: platform: mtk-mdp3: introduce more pipelines from 8195
  media: platform: mtk-mdp3: introduce more MDP3 components
  media: platform: mtk-mdp3: add checks for dummy components
  media: platform: mtk-mdp3: avoid multiple driver registrations
  media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
  media: platform: mtk-mdp3: add 8195 platform configuration
  media: platform: mtk-mdp3: add 8195 shared memory configurations
  media: platform: mtk-mdp3: add 8195 component settings

 .../bindings/media/mediatek,mdp3-aal.yaml     |  64 ++
 .../bindings/media/mediatek,mdp3-color.yaml   |  64 ++
 .../bindings/media/mediatek,mdp3-fg.yaml      |  64 ++
 .../bindings/media/mediatek,mdp3-hdr.yaml     |  63 ++
 .../bindings/media/mediatek,mdp3-merge.yaml   |  64 ++
 .../bindings/media/mediatek,mdp3-ovl.yaml     |  64 ++
 .../bindings/media/mediatek,mdp3-pad.yaml     |  64 ++
 .../bindings/media/mediatek,mdp3-rdma.yaml    |   5 +-
 .../bindings/media/mediatek,mdp3-split.yaml   |  76 ++
 .../bindings/media/mediatek,mdp3-stitch.yaml  |  64 ++
 .../bindings/media/mediatek,mdp3-tcc.yaml     |  63 ++
 .../bindings/media/mediatek,mdp3-tdshp.yaml   |  64 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 398 +++++++++
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
 .../mediatek/mdp3/mt8183/mdp3-plat-mt8183.h   |  46 +-
 .../mediatek/mdp3/mt8195/mdp3-comp-mt8195.h   | 283 ++++++
 .../mediatek/mdp3/mt8195/mdp3-plat-mt8195.h   | 652 ++++++++++++++
 .../platform/mediatek/mdp3/mtk-img-ipi.h      |   4 +
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 257 +++++-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 834 +++++++++++++++++-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  86 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    |  94 +-
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  21 +
 33 files changed, 3529 insertions(+), 114 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-aal.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-color.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-merge.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-ovl.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-pad.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-split.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_color.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mt8195/mdp3-comp-mt8195.h
 create mode 100644 drivers/media/platform/mediatek/mdp3/mt8195/mdp3-plat-mt8195.h

-- 
2.18.0


