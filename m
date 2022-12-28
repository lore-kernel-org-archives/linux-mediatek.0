Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B68C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 07:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZQtki9cjS456yItlFDFoypb+Uyo9A59Q46rWl6WroCI=; b=iu03fD9N5xO3AyJneSfZehSKka
	Iy+YceaqPaldSAlX9AjlWQP62shpulzdzCzI7Ex3xGODYsq07b/Y8db7/CCjpg2Cgg9zI4+HF0+7u
	C1stjPsA18PU8e7BP/8yLHF/VyPqQsyIUnpBeGh65GBxKtO7CElb6O3vgyHSjpR7gTGXNqtHgSWvN
	qV2Zz0FBMVing2ouuRRVoFaIecTc2YmIdU2EOy+fug8RGgbZXNlO5VpL2AUoxQ13OToQjj/xiXYxf
	+sTUGC+HdU7JSCE4eFGGzS3W7PP7lr18Cc8AiveFwfRhudx5a7FaRXOouEQGN/TOsphPq+JpnOeXA
	1wa+JpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQeI-002fV0-SF; Wed, 28 Dec 2022 07:14:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQdu-002fIl-Pc; Wed, 28 Dec 2022 07:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ZQtki9cjS456yItlFDFoypb+Uyo9A59Q46rWl6WroCI=; b=TVeYpb57T/57SvCvPHjMqoXvJD
	FyPEmrBYwCMcmPQ6CjleL/l62LP/tSvtoRsRDr7CJfW1tZNhqVFq2+KTOQ18Gt6o5cEQvQZ/1fsrI
	HerFLMzfemLI/FEjjjZmIOFKpHNAvrqIFUivVkF/cM4qs0Pep2KStQ7PNF/d27fG51trFNONSlyjv
	am4nFFC+233oCTkjHrnExcEYiLqVUciUxB4SooSA3yDObznfBtPW/ILQW+xgFDa/20WaaRDrtcjrg
	vwxvD+74X6kalwvEptUy2vEQc7J4pE8Ft8xG0+29kHKxKSds2QKFmWN5uIIU2jb9EX1dc002QxPHz
	XM0pNoLg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pAQdm-00FvA7-0O;
	Wed, 28 Dec 2022 07:14:22 +0000
X-UUID: 2e96ee1f2bc1425381189f18caad6e03-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZQtki9cjS456yItlFDFoypb+Uyo9A59Q46rWl6WroCI=;
	b=ZJ5pz0GIDQbrDthYBJYUie0s0wZziX9EHivHKAsIJdMcyf9PQyb1DIy3tKI7FtzFwH65pY+zcaeLBG9ZMOwAmHwnXQCCEswoD51/40n7oMVaBRugC+Fs+R23iNajxvawHSqqcDuBfvlWP4qwhWggQaZIyR5yXfj59e+rijnCjas=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e6dc92e6-4b41-4e91-a062-27c20379da08,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:1dcb9c8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2e96ee1f2bc1425381189f18caad6e03-20221228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1714733650; Wed, 28 Dec 2022 00:14:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 14:33:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 28 Dec 2022 14:33:32 +0800
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
 Huang" <biao.huang@mediatek.com>, <macpaul.lin@mediatek.com>
Subject: [PATCH v6 0/2] arm64: dts: mt8195: Add Ethernet controller
Date: Wed, 28 Dec 2022 14:33:28 +0800
Message-ID: <20221228063331.10756-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_071419_140011_34D516CA 
X-CRM114-Status: UNSURE (   9.63  )
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

 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  | 81 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 86 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 26 ------
 3 files changed, 167 insertions(+), 26 deletions(-)

-- 
2.18.0



