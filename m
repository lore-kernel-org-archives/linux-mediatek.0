Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7405CC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 12:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SNCyKo7BJ06ez7HIFpg2DZDI4Pi9Scjoe6iZS/AjYgQ=; b=mwutnOKqyN1rGc4hzpwB+hnaTv
	Njs8M887+mvhBh+a4WmIymEKY3Mt+9HqKtzdkEOIqFMq4DCh2S759A9EwSlx7zfOKmc5fC1tIjKwQ
	/FO/wl7JSKjzTcuyOziDHYqS/XdCdCEMeA+8R4zes5UROvMTioXJ8dhybXJWngPQxXKoUdPIO8B6E
	+dsTrLJWQ+4qdwf6M4aItN7PQOiQooMgGdg5AJ3dMlmvjMrFVH7/f7sMvCWqVVSyDKZrPnojAASYg
	cvvWZFdS4k+KQQTzfJzAUi0Xbp3yYWh13aarCaqEVCjBegvn4xrHjINnO6qQBq7ldLnRR+CNjOb1/
	fRmwk5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQ8X-002Lus-DC; Thu, 06 Oct 2022 12:38:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQ8U-002Lra-7O; Thu, 06 Oct 2022 12:37:59 +0000
X-UUID: 99e578689072486ea818a358d8545d71-20221006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SNCyKo7BJ06ez7HIFpg2DZDI4Pi9Scjoe6iZS/AjYgQ=;
	b=EpJCcbljFGcKkSNUxcY4eDsJ4MzKMvHGl+Wpy4FkvxIqQTra4up+qAgRyzelrOxFI/B++zT8L/5sVXVIjH55UU0YHzis+F9DfCp9svdiTfxdiPMtkE0WDQu2WdJ/zwNLeBTiqZUQW5Ti68h2uOuZfkM7rykld/MisIO8G3ozamM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:8e6a89bd-bc90-4400-a231-99e09a7257ba,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:cf51bab8-daef-48a8-8c50-40026d6a74c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 99e578689072486ea818a358d8545d71-20221006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2124833125; Thu, 06 Oct 2022 05:37:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 6 Oct 2022 20:07:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 6 Oct 2022 20:07:16 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/8] MediaTek watchdog: Convert mtk-wdt.txt to dt-schema
Date: Thu, 6 Oct 2022 20:07:07 +0800
Message-ID: <20221006120715.24815-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_053758_307160_94FFF798 
X-CRM114-Status: GOOD (  10.13  )
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

Based on tag: next-20221006 linux-next/master, We use [1] and [2] as
references to send a new series.

This series converts mtk-wdt.txt to dt-schema and contains
 - Fix watchdog compatibles for MT8186, MT7986 and MT8195,
 - Fix the watchdog name of mt8516
 - Add mt6795 and MT8173 watchdog compatible
 - Add support for toprgu reset on the MediaTek Helio X10 MT6795 SoC.

Changes since [1]:
 - Drop "timeout-sec: true" and use unevaluatedProperties

[1] https://lore.kernel.org/all/20221005113517.70628-1-angelogioacchino.delregno@collabora.com/
[2] https://lore.kernel.org/all/20220422121017.23920-3-allen-kh.cheng@mediatek.com/

Allen-KH Cheng (3):
  arm64: dts: mediatek: mt7986: Fix watchdog compatible
  arm64: dts: mediatek: mt8516: Fix the watchdog node name
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT8173

AngeloGioacchino Del Regno (5):
  arm64: dts: mediatek: mt8186: Fix watchdog compatible
  arm64: dts: mediatek: mt8195: Fix watchdog compatible
  dt-bindings: watchdog: mediatek: Convert mtk-wdt to json-schema
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6795
  watchdog: mtk_wdt: Add support for MT6795 Helio X10 watchdog and
    toprgu

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 80 +++++++++++++++++++
 .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  3 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  2 +-
 drivers/watchdog/mtk_wdt.c                    |  6 ++
 7 files changed, 90 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt

-- 
2.18.0


