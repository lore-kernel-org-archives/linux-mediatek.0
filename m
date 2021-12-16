Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E41C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sz66f1x3mDORq+cXCz28WAJrPauyEXdODc+msoxADIw=; b=4lXIsWPRdWW40N
	UVkSlmLeSc/44AEoKJqad21NuK9lxkb33b0A2Qm3JqjmxURWHzYAOLPL4EYSfJdb+a67hugAIg/si
	N3z6s8qkP2GbcWt9LirR+21ugIMzs/tbgCv3RpQhTlZPGLuAt7mO8qqevorVXKkVvmzC7Rk+qapPk
	vSacNSZVxnoj7R5chMZkc0+0Qk02nVxSFlbAYhZ5wWbXTmU9HDu8f7q6l8skUX4HeOmQNThhOs96l
	T/R80CCCnM+ehIG64id4UBHKVeKN2Suw4d1pnHrw4EAOS80DLyOu3RPMucuafTwx0fbnUqnI2CFsA
	bWDYlslLDxnk4KuDiPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxjr1-003i6c-Jm; Thu, 16 Dec 2021 06:02:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxjqX-003hu0-5f; Thu, 16 Dec 2021 06:02:30 +0000
X-UUID: 34247537592a4e94a23acbb28c786302-20211215
X-UUID: 34247537592a4e94a23acbb28c786302-20211215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 157265360; Wed, 15 Dec 2021 23:02:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Dec 2021 21:53:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Dec 2021 13:53:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Dec 2021 13:53:28 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <srv_heupstream@mediatek.com>,
 <macpaul.lin@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <dkirjanov@suse.de>
Subject: [PATCH net-next v10 0/6] MediaTek Ethernet Patches on MT8195 
Date: Thu, 16 Dec 2021 13:53:22 +0800
Message-ID: <20211216055328.15953-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_220229_250491_136D2016 
X-CRM114-Status: GOOD (  14.32  )
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

Changes in v10:
1. add detailed description in "arm64: dts: mt2712: update ethernet
   device node" to make the modifications clearer as Matthias's coments.
2. modify dt-binding description as Rob's comments, and "make dtbs_check" runs
   pass locally with "arm64: dts: mt2712: update ethernet device node"
   in this series.

Changes in v9:
1. remove oneOf for 1 entry as Rob's comments.
2. add new clocks to the end of existing clocks to simplify
   the binding as Rob's comments.

Changes in v8:
1. add acked-by in "stmmac: dwmac-mediatek: add platform level clocks
   management" patch

Changes in v7:
1. fix uninitialized warning as Jakub's comments.

Changes in v6:
1. update commit message as Jakub's comments.
2. split mt8195 eth dts patch("arm64: dts: mt8195: add ethernet device
   node") from this series, since mt8195 dtsi/dts basic patches is still
   under reviewing.
   https://patchwork.kernel.org/project/linux-mediatek/list/?series=579071
   we'll resend mt8195 eth dts patch once all the dependent patches are
   accepted.

Changes in v5:
1. remove useless inclusion in dwmac-mediatek.c as Angelo's comments.
2. add acked-by in "net-next: stmmac: dwmac-mediatek: add support for
   mt8195" patch

Changes in v4:
1. add changes in commit message in "net-next: dt-bindings: dwmac:
   Convert mediatek-dwmac to DT schema" patch.
2. remove ethernet-controller.yaml since snps,dwmac.yaml already include it.

Changes in v3:
1. Add prefix "net-next" to support new IC as Denis's suggestion.
2. Split dt-bindings to two patches, one for conversion, and the other for
   new IC.
3. add a new patch to update device node in mt2712-evb.dts to accommodate to
   changes in driver.
4. remove unnecessary wrapper as Angelo's suggestion.
5. Add acked-by in "net-next: stmmac: dwmac-mediatek: Reuse more common
   features" patch.

Changes in v2:
1. fix errors/warnings in mediatek-dwmac.yaml with upgraded dtschema tools

This series include 5 patches:
1. add platform level clocks management for dwmac-mediatek
2. resue more common features defined in stmmac_platform.c
3. add ethernet entry for mt8195

Biao Huang (6):
  stmmac: dwmac-mediatek: add platform level clocks management
  stmmac: dwmac-mediatek: Reuse more common features
  arm64: dts: mt2712: update ethernet device node
  net: dt-bindings: dwmac: Convert mediatek-dwmac to DT schema
  stmmac: dwmac-mediatek: add support for mt8195
  net: dt-bindings: dwmac: add support for mt8195

 .../bindings/net/mediatek-dwmac.txt           |  91 ------
 .../bindings/net/mediatek-dwmac.yaml          | 176 ++++++++++
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts   |   1 +
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  14 +-
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 306 ++++++++++++++++--
 5 files changed, 469 insertions(+), 119 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
 create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml

--
2.18.0



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
