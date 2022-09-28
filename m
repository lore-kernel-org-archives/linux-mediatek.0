Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41154C04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 09:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6EbUE9eXICSrLDk/g7xuI/oop7XTueJZWuVc89h51mU=; b=eb1YuSQfhpjYswc9RSClH9e+0w
	UzIr8ujaSoAMbQ670dd6MGWVmR1SlPsIGsRKd/7PP0jSAhb10r/x1e3uukax1WZiIetb5n94BVIdE
	QQOPLMZ+M/MmrWoW2iHhex45oTMp05IcUc761DZRfxLOyuq053ZdL4gKCqji/a5uMpmHOcFD/q3OT
	HN/4H/0oOwU6QqpOkcho04/q9zz6HjF3G7eC6HjV2DcS7haIXNQzRjiU8pc3m6NDsQ6rKc9fTwsJ4
	qOhL3mDuj0Uk3hMFkkouskAT4xwKqB7IaFOzCyYJaPHj/Xcs1XduTZByVzCblBdK/2WVBDuQjuQaS
	N6ldqF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odT6W-00F6Kt-2n; Wed, 28 Sep 2022 09:11:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odT6U-00F6JX-5w; Wed, 28 Sep 2022 09:11:43 +0000
X-UUID: 91f82b3003044a9ab3e889ded2c6efad-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6EbUE9eXICSrLDk/g7xuI/oop7XTueJZWuVc89h51mU=;
	b=prPVIhzbDU88s18OPlw9HRbyyvGMvOc0FMgzvnkrWu8rHU4VgWR3LEHtEST4NAbwff0QebA/BnWQvdEL3ZnW5MMZE4YS5qP6vUHCNcYJHLT8/i6Ymp/ZSXg6ukF14BUw4Fm7+GQ/L7mdybzXQ7kMEZMhs2RgVHkDKl7QgzCclxc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3295a041-b044-4560-a89f-e3db33b927c6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:04b84d07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 91f82b3003044a9ab3e889ded2c6efad-20220928
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1960578695; Wed, 28 Sep 2022 02:11:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 17:11:02 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Sep 2022 17:11:00 +0800
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jianguo Zhang <jianguo.zhang@mediatek.com>
Subject: [PATCH v6 0/4]  Mediatek ethernet patches for mt8188
Date: Wed, 28 Sep 2022 17:10:48 +0800
Message-ID: <20220928091052.18490-1-jianguo.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_021142_242564_ED6224E4 
X-CRM114-Status: GOOD (  10.70  )
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

Changes in v6:

v6:
1) Update commit message of patch 'dt-bindings: net: snps,dwmac: add new property snps,clk-csr'
2) Add a parse for new property 'snps,clk-csr' in patch
'net: stmmac: add a parse for new property 'snps,clk-csr''

v5:
1) Rename the property 'clk_csr' as 'snps,clk-csr' in binding
file as Krzysztof Kozlowski'comment.
2) Add DTS patch 'arm64: dts: mediatek: mt2712e: Update the name of property 'clk_csr''
as Krzysztof Kozlowski'comment.
3) Add driver patch 'net: stmmac: Update the name of property 'clk_csr''
as Krzysztof Kozlowski'comment.

v4:
1) Update the commit message of patch 'dt-bindings: net: snps,dwmac: add clk_csr property'
as Krzysztof Kozlowski'comment.

v3:
1) List the names of SoCs mt8188 and mt8195 in correct order as
AngeloGioacchino Del Regno's comment.
2) Add patch version info as Krzysztof Kozlowski'comment.

v2:
1) Delete patch 'stmmac: dwmac-mediatek: add support for mt8188' as
Krzysztof Kozlowski's comment.
2) Update patch 'dt-bindings: net: mediatek-dwmac: add support for
mt8188' as Krzysztof Kozlowski's comment.
3) Add clk_csr property to fix warning ('clk_csr' was unexpected) when
runnig 'make dtbs_check'.

v1:
1) Add ethernet driver entry for mt8188.
2) Add binding document for ethernet on mt8188.

Jianguo Zhang (4):
  dt-bindings: net: mediatek-dwmac: add support for mt8188
  dt-bindings: net: snps,dwmac: add new property snps,clk-csr
  arm64: dts: mediatek: mt2712e: Update the name of property 'clk_csr'
  net: stmmac: add a parse for new property 'snps,clk-csr'

 .../devicetree/bindings/net/mediatek-dwmac.yaml        | 10 ++++++++--
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  |  5 +++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi              |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c  |  4 +++-
 4 files changed, 17 insertions(+), 4 deletions(-)



