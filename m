Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED55C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VkE+9Be2IZo1wTEmkjQlAica3O0qe2SLkKytbv3x8GQ=; b=EAPeoxO4BYJQIDyNklMpW9b/BP
	L0a8pUNMTYdoZ+TyrvaD+aIanLNM1RoihII6dggyOBohz0wVtaTmEreY7kESDWmdiJ9cD3NwgWNsE
	7456TgYzFvTYbOhuv8Uf7DfTsXThyoCfR7KLLs4GmhD5VQCCEmiCXXwCO/xphYetZlG7jySbMeMQ3
	oqyDNaedXBajQIQlvTjPjlOILig4fgtdK2iDktDgYM9c0pCEijPCpQJzlBaVfXeWytmHWJDQKk3q2
	AQgAwdDp2vbDlJGpCwErS/bBPFz1khFiRf9SilFF0CQOR6csUQMkL8g1fTf4BMQkPJAHA9te8crXf
	Y67nBOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD48T-009T1d-DA; Wed, 04 Jan 2023 13:48:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzw3-007zLl-8e; Wed, 04 Jan 2023 09:19:48 +0000
X-UUID: 5f3a2bdc95ef44a7ba9457efee64c669-20230104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VkE+9Be2IZo1wTEmkjQlAica3O0qe2SLkKytbv3x8GQ=;
	b=Ae830jSL6ytkRP7GkDoR/7DK7kT51c1AsQ4kSARGMoIu0lBlWXDJHTXgVgykchLkqy11wBhmOsBsAr/8b/C1hzpIOEh4EIZA+bA2ZRKvSEvRt3XEZbd2VWOWsdk8sC7oEkrL+A4zirEojKV7kaZiTP3DQrtQajMOt6+oDY1q4PQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:b21c583d-fc6a-4def-a8b9-4b5eb6222eb0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:09771b1,CLOUDID:40bb368b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 5f3a2bdc95ef44a7ba9457efee64c669-20230104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 552212840; Wed, 04 Jan 2023 02:19:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 4 Jan 2023 16:59:02 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 4 Jan 2023 16:59:00 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Biao
 Huang" <biao.huang@mediatek.com>, <macpaul.lin@mediatek.com>,
	<netdev@vger.kernel.org>
Subject: [PATCH v7 0/2] arm64: dts: mt8195: Add Ethernet controller
Date: Wed, 4 Jan 2023 16:58:55 +0800
Message-ID: <20230104085857.2410-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_011947_372450_9087356E 
X-CRM114-Status: GOOD (  11.69  )
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

Changes in v7:
1. move mdio node to .dtsi, and remove the compatible
property in ethernet-phy node as Andrew's comments.
2. add netdev@ to cc list as Jakub's reminder.

Changes in v6:
1. add reviewed-by as Angelo's comments
2. remove fix_mac_speed in driver as Andrew's comments.

Changes in v5:
1. reorder the clocks as Angelo's comments
2. add a driver patch to fix rgmii-id issue, then we can
use a ususal way rgmii/rgmii-id as Andrew's comments.

Changes in v4:
1. remove {address,size}-cells = <0> to avoid warning as Angelo's feedback.
2. Add reviewd-by as Angelo's comments.

Changes in v3:
1. move stmmac-axi-config, rx-queues-config, tx-queues-configs inside ethernet
node as Angelo's comments.
2. add {address,size}-cells = <0> in ethernet node as Angelo's comments.

Changes in v2:
1. modify pinctrl node used by ethernet to match rules in pinctrl-mt8195.yaml,
which is pointed by Krzysztof.
2. remove "mac-address" property in ethernet node as comments of Krzysztof.

Changes in v1:
add dts node for MT8195 Ethernet controller

Biao Huang (2):
  stmmac: dwmac-mediatek: remove the dwmac_fix_mac_speed
  arm64: dts: mt8195: Add Ethernet controller

 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  | 77 ++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 92 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 26 ------
 3 files changed, 169 insertions(+), 26 deletions(-)

-- 
2.18.0



