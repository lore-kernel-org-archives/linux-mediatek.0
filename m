Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F05C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 18:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vZIxcWR779ldyt1fvZOQIpom6NbLwQbTa9jDKIb5dmY=; b=shz7lOwuU7zH7kil1YITN9pJGM
	0T58F/D++38rEpr0jiLDOGNOoZ+GjfVjUrMG+pPChuuVTfyZgRsHXwDlrBJuwa/WLtc1XJIoDeKxe
	LJfgPjK/b3sXT1Avfqq0QmV0NkgjS4Yk9XFIptcBzpszLgWu/skDIyWVLJzbZu9ZFgPQ0LUW1PQ9G
	y9q4Q5AJN6Krm8s3B4ebe1znG9d7TeNqPSW2Huprxc6K58x7VgRtVSjnZhMV8sfD6zlin1t107ESE
	Kuj0a412fMX9e6K7kJs8Y9MPqUQq/g2/llnuDa6nmjxETXw+D11n6hmNBhc4Vx6QnpEGjerODaO4h
	25qf+jFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVCU-00Dlc3-Ij; Thu, 05 Jan 2023 18:42:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDF34-00FhvO-7R; Thu, 05 Jan 2023 01:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=vZIxcWR779ldyt1fvZOQIpom6NbLwQbTa9jDKIb5dmY=; b=jTmI6w82xSCZhqyvIJZd+8tUk4
	OYT6RInlywIjq78e88iw+VTC5GO9xOO49/JDOvDZRklijOO4GyxC+bOCxWrN2p9z3wjZAtkRdWRJH
	K7AKKEfnxMl3F/CvZljuppgV5ktTWEoEPfgiioKeS+mnqoxPdQD+Xwv7HS3w8p/B+Ir1jOX+b//vb
	27XHNa5J1jovSqkweoSyDOdyD+DV8bnrLigWt+09Rf1dSBAZIu2aZQc3X3g1vTdcNIQEClsngAhOD
	jtPmFli8bBWSxR9LrS74e8Y1hEh2mJcca+yFf42aM7fl3KFQ8v9jqvqaTKFtVJ2QmM5BDrYRqrGP2
	6Zhq3LZA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDF2s-0018mI-2W;
	Thu, 05 Jan 2023 01:27:53 +0000
X-UUID: 2e9c32d7bd194b2fae5852247c367110-20230104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vZIxcWR779ldyt1fvZOQIpom6NbLwQbTa9jDKIb5dmY=;
	b=WMUzEngBUooNAQ2d02YpgjogtZTRM5Iax8vItJF6pWHhh/ozTndrTOUgZQj4pPE/vtvd29o+qZWpHNRZc2SxZzh62QKG4RbLQZYWeDvO/KIFmd/7fVdfbaVGZJkdCfaNvNrJYwupOq6XTMf5IAo9tQF6wFEwBpF5KfMlLgT9+cw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:f82c31ef-cecb-4109-a203-289213de6252,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:09771b1,CLOUDID:6bdbaa53-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 2e9c32d7bd194b2fae5852247c367110-20230104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 219379218; Wed, 04 Jan 2023 18:27:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 09:07:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 09:07:14 +0800
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
Subject: [PATCH v8 0/2] arm64: dts: mt8195: Add Ethernet controller
Date: Thu, 5 Jan 2023 09:07:10 +0800
Message-ID: <20230105010712.10116-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_012751_659358_60D15051 
X-CRM114-Status: UNSURE (   9.94  )
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

Changes in v8:
1. add reviewed-by as Andrew's comments.

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
2.25.1



