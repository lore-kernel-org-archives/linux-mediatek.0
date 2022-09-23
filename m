Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A47C6FA93
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 06:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7a6TXtGwrN+ddyunijlRltrO1PPqJO136ORbWQvPVUM=; b=aVrER/FD6G6Ya5RMrlNlhZ4UL/
	R1VaHZbRZEONW0veqCO0+kId6j/EdKlepXcTEMRDh7n7DMzhAa8ufC7O18DzhTkklf1dYvniynpk3
	tUx7DJxAQB1d8h78iQ7h2ytujuK6imz4RcMRALtkcMZbfh7pv+T2sDl3eJe/vY+PZ1MsAM9m8vC3+
	MIitnVUJTLRb/Qab+rcFyDklPF1ZXh2QKKbjxrnkfA2xduLIPccBTu4fwjWz2UthFqlDi28vtxhP/
	pJsXCxEOPxH2mjndlH4IY5ZMRoODcFtExckcIQ11WcZEM/UrA6KQ+kWd06BZPp2M920dYZc5WhPZH
	iA8jmglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obc8G-002Rkn-PD; Fri, 23 Sep 2022 06:25:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obc7w-002RdV-8K; Fri, 23 Sep 2022 06:25:33 +0000
X-UUID: 4000092833424b59b8554708926f2180-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7a6TXtGwrN+ddyunijlRltrO1PPqJO136ORbWQvPVUM=;
	b=uKRdN+7Azt0Fii6zp3G2U46TkWyi8KCXLSSeKh+5R16g0IbWXu4k6v3h0Rja2bCnWsP61W/9WAONQ3pOczgmbkbfwflKDo8x0egaWTANJDX4S58RaJ5GANky/eqBxiwx7cvlEZSXPzgiBnGSNzzObuFtgIzGLtSwNFoAzOWE6EE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:bba3745a-0c68-40d9-a9db-6195f59aa3aa,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:73f3f9e3-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4000092833424b59b8554708926f2180-20220922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianguo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 4219176; Thu, 22 Sep 2022 23:19:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 13:28:41 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Sep 2022 13:28:41 +0800
From: Jianguo Zhang <jianguo.zhang@mediatek.com>
To: "David S . Miller" <davem@davemloft.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
	<joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, Biao Huang
	<biao.huang@mediatek.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jianguo Zhang <jianguo.zhang@mediatek.com>
Subject: [PATCH v5 0/4]  Mediatek ethernet patches for mt8188
Date: Fri, 23 Sep 2022 13:28:24 +0800
Message-ID: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_232532_321981_D0BC5742 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

Changes in v5:

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
  dt-bindings: net: snps,dwmac: add clk_csr property
  arm64: dts: mediatek: mt2712e: Update the name of property 'clk_csr'
  net: stmmac: Update the name of property 'clk_csr'

 .../devicetree/bindings/net/mediatek-dwmac.yaml        | 10 ++++++++--
 Documentation/devicetree/bindings/net/snps,dwmac.yaml  |  5 +++++
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi              |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c  |  2 +-
 4 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.25.1



