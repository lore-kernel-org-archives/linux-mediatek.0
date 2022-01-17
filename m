Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A6AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ic7HHvEffdv98QukJwGNJRj0I4olpbdBiKtFq/s2FAg=; b=P9SEtBaPf9rDe1
	edVWhphKROPTEaQHvE7428PNypAOg//yeqpG5B9h/surcZCPU8Yk5d3WDnkhlLmjLK/y+QEoBNfYv
	t8P0ruVw3Sm+aYK2vidCCROtqkD0kZUFVrX1P2/xB2LwXTb1EENZhws9JupcBv33XZ2yEpn1Nbrrg
	6RQgwc56q3DqhFHi6JC9EjTqbGDk3CYSdMZXxyxiNivERD3kohNnttIiHi99+OjEDKwrIpLq4jCAm
	UxYJWn0pO7NC3M4r70UM6qIsCwPyuU4TDauPW1/Z3AIhwcbzGZ2Ovv5zopTJWBV/7qBdYKAV1S/lv
	ZGd6yjRcGb8f9Gsv2QeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9L73-00DYcE-QZ; Mon, 17 Jan 2022 06:03:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L6l-00DYUz-SY; Mon, 17 Jan 2022 06:03:13 +0000
X-UUID: 9bcd66e2c43d4f2dae232101a5c7c2fb-20220116
X-UUID: 9bcd66e2c43d4f2dae232101a5c7c2fb-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2143126771; Sun, 16 Jan 2022 23:03:10 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 17 Jan 2022 13:53:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 13:53:07 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 00/14] Add mdp support for mt8195
Date: Mon, 17 Jan 2022 13:52:40 +0800
Message-ID: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_220311_936665_892A0CD1 
X-CRM114-Status: GOOD (  13.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add a chip independence architecture to make
mt8195 mdp driver compatible with previous soc.

Add dual-pipe feature and memory reconfiguration
to increase mdp performance.

Add below patch to support MDP driver on MT8195
  [PATCH v1 1/14] soc: mediatek: mmsys: expand MDP enum for chip independence
    architecture
  [PATCH v1 2/14] soc: mediatek: mutex: expand parameter for mdp mutex function
  [PATCH v1 3/14] soc: mediatek: mmsys: support mt8195 vppsys0/1
  [PATCH v1 4/14] soc: mediatek: mutex: support mt8195 vppsys0/1
  [PATCH v1 5/14] media: platform: mtk-mdp3: add chip independence architecture
  [PATCH v1 6/14] media: platform: mtk-mdp3: Modify mtk-img-ipi.h for MT8195 SCP
  [PATCH v1 7/14] media: platform: mtk-mdp3: Add platform configuration for MT8195
  [PATCH v1 8/14] media: platform: mtk-mdp3: Add engine setting for MT8195
  [PATCH v1 9/14] media: platform: mtk-mdp3: Add support MT8195
  [PATCH v1 10/14] media: platform: mtk-mdp3: Add dual pipe feature support
  [PATCH v1 11/14] media: platform: mtk-mdp3: Revise frame change criteria
  [PATCH v1 12/14] media: platform: mtk-mdp3: Reconfigure shared memory
  [PATCH v1 13/14] arm64: dts: mt8195: add mdp3 node
  [PATCH v1 14/14] dt-bindings: media: mediatek: mdp3: add yaml for new modules added in
    mt8195

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |    2 +
 .../bindings/media/mediatek,mdp3-aal.yaml     |   56 +
 .../bindings/media/mediatek,mdp3-color.yaml   |   56 +
 .../bindings/media/mediatek,mdp3-fg.yaml      |   55 +
 .../bindings/media/mediatek,mdp3-hdr.yaml     |   55 +
 .../bindings/media/mediatek,mdp3-merge.yaml   |   54 +
 .../bindings/media/mediatek,mdp3-ovl.yaml     |   53 +
 .../bindings/media/mediatek,mdp3-pad.yaml     |   56 +
 .../bindings/media/mediatek,mdp3-rdma.yaml    |   28 +
 .../bindings/media/mediatek,mdp3-rsz.yaml     |    2 +
 .../bindings/media/mediatek,mdp3-split.yaml   |   58 +
 .../bindings/media/mediatek,mdp3-stitch.yaml  |   53 +
 .../bindings/media/mediatek,mdp3-tcc.yaml     |   54 +
 .../bindings/media/mediatek,mdp3-tdshp.yaml   |   61 +
 .../bindings/media/mediatek,mdp3-wrot.yaml    |    3 +
 .../bindings/soc/mediatek/mediatek,mutex.yaml |    6 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  633 +++++++
 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h |   24 +
 .../media/platform/mtk-mdp3/mdp_reg_color.h   |   29 +
 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h  |   23 +
 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h |   31 +
 .../media/platform/mtk-mdp3/mdp_reg_merge.h   |   23 +
 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h |   24 +
 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h |   20 +
 .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   31 +
 drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |    2 +
 .../media/platform/mtk-mdp3/mdp_reg_tdshp.h   |  116 ++
 .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   18 +
 drivers/media/platform/mtk-mdp3/mt8183_mdp.h  |  411 +++++
 drivers/media/platform/mtk-mdp3/mt8195_mdp.h  |  683 ++++++++
 drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  219 ++-
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  782 +++++++--
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |    4 +
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1453 +++++++++++++++--
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |   90 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  118 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   42 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |   27 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  356 ++--
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |  292 ++--
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.c    |  106 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-vpu.h    |    9 +
 drivers/soc/mediatek/mt8195-mmsys.h           |   23 +
 drivers/soc/mediatek/mtk-mmsys.c              |   22 +
 drivers/soc/mediatek/mtk-mmsys.h              |    3 +
 drivers/soc/mediatek/mtk-mutex.c              |   79 +-
 include/linux/soc/mediatek/mtk-mmsys.h        |   92 +-
 include/linux/soc/mediatek/mtk-mutex.h        |    2 +-
 48 files changed, 5648 insertions(+), 791 deletions(-)
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
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_color.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_merge.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mt8183_mdp.h
 create mode 100644 drivers/media/platform/mtk-mdp3/mt8195_mdp.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
