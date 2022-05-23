Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B45AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+W0ixK1yHqIIG6oOp2V9iAaI6kNk07DBd5FmpQW7lwM=; b=NwxSEu9D6g3Ug2
	yvi+QUs1aR6IKciGiHf+wqth+UC+XQanI22sY4h0aOi7ypOV/PgZKJDM3GZ6s0NzT6JJ2WibMh0V3
	rZhhHv+oS+usgy23ZvjYCl8kJmuzkqMCwe5WRF4m3Vrh7Wp3/CZDstmJTUEWTvSFKE5BRekNFS3Bb
	A3LS7EJu7hhTmWbdEwiUTwc7gLs7M5BC7ZWp4WgmyVO88n7lgEFsBd9Q5HS8Mf4ZxOOHvSPn5t0ta
	+vT1/7edK2EwC8PDu7AxKny1UgJzb6hMsFbpj1AblhrPJUbSZDuVTTahJg4xew6wRVwJ4WCr7MhdP
	zunVJYB3/Cm3YZZUMASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4KN-002pLe-0y; Mon, 23 May 2022 09:26:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2og-002A7b-PR; Mon, 23 May 2022 07:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=/4cz8NoD3bRO7q1ldwuAAvFZEAfbv21dlwQHyqaR1YI=; b=UDGUqNLVqdy0qoOBqAeEnEaZQa
 Fi2mWzOddmgruHDWmxyMNqWnm68cheRFh82kxCbLpccRUjaPYwmwSwRgqNoHPPxUqHVezT59+JotI
 0Du25jhLtOEm7lL9iOfhNvbMXcuFkg0LbOYs84QEaLIFQ4+rzJUgwCM3k7eGzs0//D7zmI1DbaaWu
 mnf8ifTbXk+xzVfS4WqAV25Cns2o2EizxATXQtU4oV2H6QYZiXwFmM+PM2l5lIz/nX+ykkKs3h++P
 vjrhky3j1qzMyqYiAYabPXKMZQA+dtQ4MyvYLvjhxodNbyDJSNDmfNVfEgMRhcOrJzwAs1/JF2QV6
 e4A02EKg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt1CG-000sqF-46; Mon, 23 May 2022 06:05:43 +0000
X-UUID: 31db124dfe344af7a454197933110576-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:82005fce-e529-43f0-818f-663cd7905ae8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:ada73e7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 31db124dfe344af7a454197933110576-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1552650645; Sun, 22 May 2022 23:04:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 23:00:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 14:00:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 23 May 2022 14:00:57 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <nfraprado@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v8 00/19] Cleanup MediaTek clk reset drivers and support SoCs
Date: Mon, 23 May 2022 14:00:37 +0800
Message-ID: <20220523060056.24396-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070541_293417_3F594536 
X-CRM114-Status: GOOD (  12.26  )
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

Changes for v8:
1. Use 'enum mtk_reset_version' to replace u8 in patch 5 and 6.
2. Use lowercase '0xc' in patch 7.
3. Drop "simple-mfd" in patch 16 because it's for original reset controller.
4. v8 is based on linux-next next-20220520 and Chen-Yu's series[1].

Changes for v7:
1. v7 is based on linux-next next-20220519 and Chen-Yu's series[1].
2. Add support for MT8186.

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=643003

Changes for v6:
1. Add a new patch to support inuput argument index mode.
2. Revise definition in reset.h to index.

Rex-BC Chen (19):
  clk: mediatek: reset: Add reset.h
  clk: mediatek: reset: Fix written reset bit offset
  clk: mediatek: reset: Refine and reorder functions in reset.c
  clk: mediatek: reset: Extract common drivers to update function
  clk: mediatek: reset: Merge and revise reset register function
  clk: mediatek: reset: Revise structure to control reset register
  clk: mediatek: reset: Support nonsequence base offsets of reset
    registers
  clk: mediatek: reset: Support inuput argument index mode
  clk: mediatek: reset: Change return type for clock reset register
    function
  clk: mediatek: reset: Add new register reset function with device
  clk: mediatek: reset: Add reset support for simple probe
  dt-bindings: arm: mediatek: Add #reset-cells property for
    MT8192/MT8195
  dt-bindings: reset: mediatek: Add infra_ao reset index for
    MT8192/MT8195
  clk: mediatek: reset: Add infra_ao reset support for MT8192/MT8195
  arm64: dts: mediatek: Add infra #reset-cells property for MT8192
  arm64: dts: mediatek: Add infra #reset-cells property for MT8195
  dt-bindings: reset: mediatek: Add infra_ao reset index for MT8186
  dt-bindings: arm: mediatek: Add #reset-cells property for MT8186
  clk: mediatek: reset: Add infra_ao reset support for MT8186

 .../mediatek/mediatek,mt8186-sys-clock.yaml   |   3 +
 .../mediatek/mediatek,mt8192-sys-clock.yaml   |   3 +
 .../mediatek/mediatek,mt8195-sys-clock.yaml   |   3 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   1 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  15 +-
 drivers/clk/mediatek/clk-mt2701-eth.c         |  10 +-
 drivers/clk/mediatek/clk-mt2701-g3d.c         |  10 +-
 drivers/clk/mediatek/clk-mt2701-hif.c         |  10 +-
 drivers/clk/mediatek/clk-mt2701.c             |  22 +-
 drivers/clk/mediatek/clk-mt2712.c             |  22 +-
 drivers/clk/mediatek/clk-mt7622-eth.c         |  10 +-
 drivers/clk/mediatek/clk-mt7622-hif.c         |  12 +-
 drivers/clk/mediatek/clk-mt7622.c             |  22 +-
 drivers/clk/mediatek/clk-mt7629-eth.c         |  10 +-
 drivers/clk/mediatek/clk-mt7629-hif.c         |  12 +-
 drivers/clk/mediatek/clk-mt8135.c             |  22 +-
 drivers/clk/mediatek/clk-mt8173.c             |  22 +-
 drivers/clk/mediatek/clk-mt8183.c             |  18 +-
 drivers/clk/mediatek/clk-mt8186-infra_ao.c    |  23 ++
 drivers/clk/mediatek/clk-mt8192.c             |  29 +++
 drivers/clk/mediatek/clk-mt8195-infra_ao.c    |  24 +++
 drivers/clk/mediatek/clk-mtk.c                |   7 +
 drivers/clk/mediatek/clk-mtk.h                |   9 +-
 drivers/clk/mediatek/reset.c                  | 198 +++++++++++++-----
 drivers/clk/mediatek/reset.h                  |  82 ++++++++
 include/dt-bindings/reset/mt8186-resets.h     |   5 +
 include/dt-bindings/reset/mt8192-resets.h     |   8 +
 include/dt-bindings/reset/mt8195-resets.h     |   6 +
 28 files changed, 523 insertions(+), 95 deletions(-)
 create mode 100644 drivers/clk/mediatek/reset.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
