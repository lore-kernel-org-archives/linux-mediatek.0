Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16744C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 11:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2e11fdlYimzxanotCMZ//yK0OaCfhOPvMnVKjiAt5Jc=; b=kDMu65nC4UINrU
	aUy55BPSiQ5kvXHU4kYIXN7gGgVPCfOQpQXkQRksACw8hG6jNKteeALDgPnQBwZjvCe1Gz94hcozL
	f8PBBu81unFs6uL8z/gZn1YEqWyVoVqvrA0qIVN+SRhN3BIN1zMH9Sl/LF7jY0dzgqmpBrnDiGRJF
	ywqZCKnpW9h4m3wAlII2Fm5CQFvW3zrMIHcHqlX8GaAmR+oGXClXffyYdg2Em1r1d6bJn3/Ckcxcx
	uh2u83lIZqKFlk5Dx9rjF9/T3mo8N2fNpj7QL9ZKflj5pDo65yPu4o6OhpyCyf780w8onCNuSXx1T
	nbMyo0S5U7ficgUFmQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk2ll-006cVX-QI; Thu, 28 Apr 2022 11:57:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk2l7-006cAD-9O; Thu, 28 Apr 2022 11:56:34 +0000
X-UUID: ab1836492cfe4496afdc11987fdf637b-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:96cfd609-3927-480e-b625-6ec527fc5e54, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:5765d4c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ab1836492cfe4496afdc11987fdf637b-20220428
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1209315956; Thu, 28 Apr 2022 04:56:25 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 04:56:23 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 19:56:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Apr 2022 19:56:21 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V5 00/16] Cleanup MediaTek clk reset drivers and support
 MT8192/MT8195
Date: Thu, 28 Apr 2022 19:56:03 +0800
Message-ID: <20220428115620.13512-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_045633_354868_B9444834 
X-CRM114-Status: GOOD (  15.03  )
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

In this series, we cleanup MediaTek clock reset drivers in clk/mediatek
folder. MediaTek clock reset driver is used to provide reset control
of modules controlled in clk, like infra_ao.

Changes for V5:
1. Add all infra reset bits for MT8192 and MT8195.
2. Fix reviewers' comments.

Changes for V4:
1. Abandon the implementation of reset-cell = 2, and use reset index to
   determine which reset bit is used.
2. Add documentation for enum/structure/function in reset.h.
3. Combine binding/drvier support patch for MT8192 and MT8195.
4. The MT8195 DTS is accepted by Matthias, and I add new DTS patch to
   support infracfg_ao reset for MT8195. The DTS of MT8195 is still
   not merged into mainline. Please refer to [1].

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=for-next&id=37f2582883be7218dc69f9af135959a8e93de223

Changes for V3:
1. Modify drivers for reviewers' comments.
2. Add dt-binding patch for MT8192/MT8195 infra.
3. Add reset property of infra node for MT8192.
4. Use original function for simple operation.

Changes for V2:
1. Modify drivers for reviewers' comments.
2. Use simple reset to replace v1.
3. Recover v2 to set_clr.
4. Separate error handling to another patch.
5. Add support for input offset and bit from DT.
6. Add support for MT8192 and MT8195.

Rex-BC Chen (16):
  clk: mediatek: reset: Add reset.h
  clk: mediatek: reset: Fix written reset bit offset
  clk: mediatek: reset: Refine and reorder functions in reset.c
  clk: mediatek: reset: Extract common drivers to update function
  clk: mediatek: reset: Merge and revise reset register function
  clk: mediatek: reset: Revise structure to control reset register
  clk: mediatek: reset: Support nonsequence base offsets of reset registers
  clk: mediatek: reset: Change return type for clock reset register function
  clk: mediatek: reset: Add new register reset function with device
  clk: mediatek: reset: Add reset support for simple probe
  dt-bindings: arm: mediatek: Add #reset-cells property for MT8192/MT8195
  dt-bindings: reset: mediatek: Add infra_ao reset bit for MT8195
  dt-bindings: reset: mediatek: Add infra_ao reset bit for MT8192
  clk: mediatek: reset: Add infra_ao reset support for MT8192/MT8195
  arm64: dts: mediatek: Add infra #reset-cells property for MT8192
  arm64: dts: mediatek: Add infra #reset-cells property for MT8195

 .../mediatek/mediatek,mt8192-sys-clock.yaml   |   3 +
 .../mediatek/mediatek,mt8195-sys-clock.yaml   |   3 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   1 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  13 +-
 drivers/clk/mediatek/clk-mt2701-eth.c         |  10 +-
 drivers/clk/mediatek/clk-mt2701-g3d.c         |  10 +-
 drivers/clk/mediatek/clk-mt2701-hif.c         |  10 +-
 drivers/clk/mediatek/clk-mt2701.c             |  22 ++-
 drivers/clk/mediatek/clk-mt2712.c             |  22 ++-
 drivers/clk/mediatek/clk-mt7622-eth.c         |  10 +-
 drivers/clk/mediatek/clk-mt7622-hif.c         |  12 +-
 drivers/clk/mediatek/clk-mt7622.c             |  22 ++-
 drivers/clk/mediatek/clk-mt7629-eth.c         |  10 +-
 drivers/clk/mediatek/clk-mt7629-hif.c         |  12 +-
 drivers/clk/mediatek/clk-mt8135.c             |  22 ++-
 drivers/clk/mediatek/clk-mt8173.c             |  22 ++-
 drivers/clk/mediatek/clk-mt8183.c             |  18 +-
 drivers/clk/mediatek/clk-mt8192.c             |  18 ++
 drivers/clk/mediatek/clk-mt8195-infra_ao.c    |  15 ++
 drivers/clk/mediatek/clk-mtk.c                |   7 +
 drivers/clk/mediatek/clk-mtk.h                |   9 +-
 drivers/clk/mediatek/reset.c                  | 172 ++++++++++++------
 drivers/clk/mediatek/reset.h                  |  77 ++++++++
 include/dt-bindings/reset/mt8192-resets.h     | 163 +++++++++++++++++
 include/dt-bindings/reset/mt8195-resets.h     | 170 +++++++++++++++++
 25 files changed, 759 insertions(+), 94 deletions(-)
 create mode 100644 drivers/clk/mediatek/reset.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
