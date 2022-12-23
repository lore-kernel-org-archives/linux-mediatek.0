Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B39AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 02:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e1O1KT0IELVuvQ4jwoar6k/o9u/peKrbv63m8NebjRo=; b=i1v3FWWK5JFyT+05rZo0tJN7Pt
	8oZK+ujKOW9sc4q1FCZWSeYxPdQWEHZp9JnRxCtCdpONwCa968l2ayNh6cBecUfu59te+T5jgEkyv
	QMlmHDyCLAQDcb5Ujxj9yt1U9sQoe7HyZDivDsJ4TOGPoXlStK/oLZWIbGFkH9ubUTMzMRCq2C6RM
	RetFrTqoMBhU36tN5L1zqslS1OOqOryI1uM9W1QtyhFu5C5So9hD78BtU8/C5KomQnN/p+f3lvErp
	xM3MZ+ZvxWrhasVYWHXHWH1b8we14/1qPlOvKMIRKM0JJ2znaFH+F50JFnK1VCZLkZmMyA94p0f7V
	hFuu6pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8XMu-001q68-Fs; Fri, 23 Dec 2022 02:01:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8XMf-001pui-S3; Fri, 23 Dec 2022 02:00:51 +0000
X-UUID: aa46716e467f4d15b2d175834fcb55f1-20221222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=e1O1KT0IELVuvQ4jwoar6k/o9u/peKrbv63m8NebjRo=;
	b=luwIoBvairtyDWyr9g8RQhCnl+m8V1GaRC8AE8SIjE0CFbke+ujVGoRNKEsQQ/RdSjmSEXhhRGjjhUOfW7CpIk50Y+5G/RGlQ6YzCPnnnbpO/S3uA4azRyydUNn/MwHsE19gMJBO6Xb9EMkjNl55liC/cUXqaJ3SUxLIVkXhSps=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:654e36db-44d6-45e8-88fe-69830b6ff507,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:1e64298a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: aa46716e467f4d15b2d175834fcb55f1-20221222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 829436380; Thu, 22 Dec 2022 19:00:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Dec 2022 09:50:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 23 Dec 2022 09:50:38 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Biao
 Huang <biao.huang@mediatek.com>, <macpaul.lin@mediatek.com>
Subject: [PATCH v5 0/2] arm64: dts: mt8195: Add Ethernet controller
Date: Fri, 23 Dec 2022 09:50:27 +0800
Message-ID: <20221223015029.24978-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_180049_957243_0BCB60B0 
X-CRM114-Status: UNSURE (   9.25  )
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
1. reorder the clocks as Angelo's comments
2. add a driver patch to fix rgmii-id issue, then we can
use a ususal way rgmii/rgmii-id as Andrew's comments.

Changes in v4:
1. remove {address,size}-cells = <0> to avoid warning as Angelo's feedback.
2. Add reviewd-by as Angelo's comments.

Changes in v3:
1. move stmmac-axi-config, rx-queues-config, tx-queues-configs inside ethernet node
as Angelo's comments.
2. add {address,size}-cells = <0> in ethernet node as Angelo's comments.

Changes in v2:
1. modify pinctrl node used by ethernet to match rules in pinctrl-mt8195.yaml,
which is pointed by Krzysztof.
2. remove "mac-address" property in ethernet node as comments of Krzysztof.

Changes in v1:
add dts node for MT8195 Ethernet controller

Biao Huang (2):
  stmmac: dwmac-mediatek: enable 2ns delay only for special cases
  arm64: dts: mt8195: Add Ethernet controller

 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  | 81 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 86 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  7 +-
 3 files changed, 173 insertions(+), 1 deletion(-)

-- 
2.18.0



