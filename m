Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769BBC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tZ4uLe20MrO0FdMMWxarlY5mppNaTM9jlYJASSy75lo=; b=NCpa3x+a4vpDAxqL4KZ0Oc4MMJ
	gri9+UpTpgOMnSXzuxra/s1TqJJevkJmoNEjJl0AGIjSvkOTjkd3ITulsaYoc4z/8P3d7Hraec9Zj
	ARqnMFNPVFgeyvzOu2pJsCfflGdUOQb5zj47+1Kc5DnLh1ERDYR34Y+amlbkrx47ahRIX69ReClFL
	E/eeadEPxIBGEx5z3rKi/+m33mBTz4UhmTPNRONyATOArC9I4hwJTQD1b94IJPLOknE9PlIoIyDdJ
	KD6c0Dx/LrlFror3d1LQZxQHWW6KNA2uxOLhFwlQRbJl0JUKQsDPDA/gg+0Q5s/oMwlhcIJHP2Kp6
	DeCPT3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olS1t-00D55b-F8; Thu, 20 Oct 2022 09:39:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olRux-00D0c3-G4; Thu, 20 Oct 2022 09:32:48 +0000
X-UUID: 2de56955f0da431b8b5d3f780f3af3ad-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tZ4uLe20MrO0FdMMWxarlY5mppNaTM9jlYJASSy75lo=;
	b=Ve7AnECpwN/Po8tAV+uSj+frkhjWOaxNbM/QU9pRcU+jPjqeC1W1qZSI9taLOCN0fwYnhIQhj2/AtPprrilQclR+4xuii/TZzCuiLQC4EY7C2wFDdUheWQGO1LgjlgS/7I1ZTo7EvrFD7SmkuwXqNLh3Rapx4H/6BVJKHf0zq3I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:24c4ab57-b36b-49ac-b9f7-1ac8a787c6dd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:9afe6f33-7d3c-46b3-a6e9-0ba03eeda632,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2de56955f0da431b8b5d3f780f3af3ad-20221020
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2079319925; Thu, 20 Oct 2022 02:32:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 16:52:06 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 20 Oct 2022 16:52:05 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Biao
 Huang <biao.huang@mediatek.com>, <macpaul.lin@mediatek.com>
Subject: [PATCH v4 0/1] arm64: dts: mt8195: Add Ethernet controller
Date: Thu, 20 Oct 2022 16:52:02 +0800
Message-ID: <20221020085203.1974-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_023247_613051_B31CB3DE 
X-CRM114-Status: UNSURE (   8.01  )
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

Biao Huang (1):
  arm64: dts: mt8195: Add Ethernet controller

 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 88 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 86 +++++++++++++++++++
 2 files changed, 174 insertions(+)

-- 
2.18.0



