Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 06:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TvN1Xpmu72gLLyiYqknINuFHXcEH+Oc3uesehj4zHZw=; b=b1oFhyuMKyGedH
	HgGN+Oxd0W6u/7Zy86c+KunKoCW9C6ykBWItcJaA7wSrGHxQzMSWhZLsG3oBxtiSi/DJxquGFMvTl
	GAHOzkqOCYim0XjtLJcarYkdUGybSWcl8v082kGwCbMdA7ifeYt3zAYCLKWPX80ss8YOJwG3glS7M
	U1rpY2+8/QzXn3FWfVPEvwb/mPSUph36YO9AUU/q35PwkMpCkMTZaW671Dho7Oz2LZE/lcWh1ofqc
	o03fS46MMBfhcFyCeREiKRufO1cs5sXJSwqXt70yNM+gSbisSdFU1Gi3XNAO58JO4MCbRun9nrkPL
	eWs7jWQj2aM/jqLbTpwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmfK-00GUFh-B7; Fri, 22 Apr 2022 06:21:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmTx-00GOr5-Qm; Fri, 22 Apr 2022 06:09:31 +0000
X-UUID: 6ad0474f9cae4a9daee2758ccca9429e-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:25e07079-ae70-401f-9332-fb31b7d161f3, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:ea7cbdef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6ad0474f9cae4a9daee2758ccca9429e-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1238714557; Thu, 21 Apr 2022 23:09:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 23:01:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Apr 2022 14:01:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 14:01:53 +0800
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
Subject: [PATCH V3 00/17] Cleanup MediaTek clk reset drivers and support
 MT8192/MT8195
Date: Fri, 22 Apr 2022 14:01:35 +0800
Message-ID: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_230929_934736_43B68400 
X-CRM114-Status: GOOD (  11.16  )
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

Rex-BC Chen (17):
  clk: mediatek: reset: Add reset.h
  clk: mediatek: reset: Fix written reset bit offset
  clk: mediatek: reset: Refine and reorder functions in reset.c
  clk: mediatek: reset: Extract common drivers to update function
  clk: mediatek: reset: Merge and revise reset register function
  clk: mediatek: reset: Revise structure to control reset register
  clk: mediatek: reset: Add return for clock reset register function
  clk: mediatek: reset: Add new register reset function with device
  clk: mediatek: reset: Add support for input offset and bit from DT
  clk: mediatek: reset: Add reset support for simple probe
  dt-bindings: arm: mediatek: Add #reset-cells property for MT8192-sys-clock
  dt-binding: mt8192: Add infra_ao reset bit
  dt-bindings: arm: mediatek: Add #reset-cells property for MT8195-sys-clock
  dt-binding: mt8195: Add infra_ao reset bit
  clk: mediatek: reset: Add infra_ao reset support for MT8192
  clk: mediatek: reset: Add infra_ao reset support for MT8195
  arm64: dts: mediatek: Add infra #reset-cells property for MT8192

 .../mediatek/mediatek,mt8192-sys-clock.yaml   |   3 +
 .../mediatek/mediatek,mt8195-sys-clock.yaml   |   3 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   1 +
 drivers/clk/mediatek/clk-mt2701-eth.c         |   8 +-
 drivers/clk/mediatek/clk-mt2701-g3d.c         |   8 +-
 drivers/clk/mediatek/clk-mt2701-hif.c         |   8 +-
 drivers/clk/mediatek/clk-mt2701.c             |  19 +-
 drivers/clk/mediatek/clk-mt2712.c             |  19 +-
 drivers/clk/mediatek/clk-mt7622-eth.c         |   8 +-
 drivers/clk/mediatek/clk-mt7622-hif.c         |  10 +-
 drivers/clk/mediatek/clk-mt7622.c             |  19 +-
 drivers/clk/mediatek/clk-mt7629-eth.c         |   8 +-
 drivers/clk/mediatek/clk-mt7629-hif.c         |  10 +-
 drivers/clk/mediatek/clk-mt8135.c             |  19 +-
 drivers/clk/mediatek/clk-mt8173.c             |  19 +-
 drivers/clk/mediatek/clk-mt8183.c             |   8 +-
 drivers/clk/mediatek/clk-mt8192.c             |  11 +
 drivers/clk/mediatek/clk-mt8195-infra_ao.c    |   8 +
 drivers/clk/mediatek/clk-mtk.c                |   7 +
 drivers/clk/mediatek/clk-mtk.h                |   9 +-
 drivers/clk/mediatek/reset.c                  | 202 +++++++++++++-----
 drivers/clk/mediatek/reset.h                  |  36 ++++
 include/dt-bindings/reset/mt8192-resets.h     |  10 +
 include/dt-bindings/reset/mt8195-resets.h     |   7 +
 24 files changed, 381 insertions(+), 79 deletions(-)
 create mode 100644 drivers/clk/mediatek/reset.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
