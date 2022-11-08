Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9024C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 04:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TmcwPpePh2o2R1cu1Xx4sjnrEBCskr0XJYevHgHULgE=; b=CCuZEgPnRSO340GauINYUmBynk
	xonKzV2N5MedZE8DDCCf2DKM/ElwEwxe2yo9EUDgwDtk7z91NBC3IsenXNKYq0gk9wJGj6XSsc6in
	sSnxmaldjX4yQJBh4x3G/RdWcNVTegzirszo9Q7EGIwr7JtqdZydl6NLylEyXCJUihZ2igmtkZ+sy
	AYz/rSJlBhPkIH0SeznmC31m22HwZKuQd5I0fioB4OervoQXPyQPRxd0wzA8/jSCYSxX32/G4ct3y
	kP/KSh3f3N3ZpMRdnTAm/WXBIVAzWdnl6HtRExe5EIoMBf135uA2j0BJc0IfouIgP5DOEBDV2t7eO
	j0aCzeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osFpI-002YUj-K8; Tue, 08 Nov 2022 04:03:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osFpD-002YSi-Oy; Tue, 08 Nov 2022 04:03:01 +0000
X-UUID: 9a784040bb4b488dbb8b752bfa09cd2d-20221107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TmcwPpePh2o2R1cu1Xx4sjnrEBCskr0XJYevHgHULgE=;
	b=HOx2k7zpiFz6XsI9Me1fAA+wMQ1Hcyph/F4xrzGuZEpNmr2J9TsfhBQo3IG4oUB6QBUJabxYO4qxMjG7xGXI2+ybop20sKkrc64svraKSlNC2xx/ujd8yGnPvNt3d9A5Cvh+7gCTZnYdJLQFaGsaIexHUKjU+OaUuPjVJQWDya8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:b912d63c-69ae-4c9a-8ecc-0f2d2a1bb0ef,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-55
X-CID-META: VersionHash:62cd327,CLOUDID:578dfaf3-a19e-4b45-8bfe-6a73c93611e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9a784040bb4b488dbb8b752bfa09cd2d-20221107
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1465181583; Mon, 07 Nov 2022 21:02:47 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 8 Nov 2022 11:32:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 8 Nov 2022 11:32:10 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <nfraprado@collabora.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH v5 0/7] MediaTek watchdog: Convert mtk-wdt.txt to dt-schema
Date: Tue, 8 Nov 2022 11:32:02 +0800
Message-ID: <20221108033209.22751-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_200259_860749_8FB0992A 
X-CRM114-Status: GOOD (  11.25  )
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

Based on git/groeck/linux-staging.git, watchdog-next. 
We use [1] and [2] as references to send a new series.

This series converts mtk-wdt.txt to dt-schema and contains
- Fix watchdog compatibles for MT7986, MT8186, MT8188 and MT8195,
- Fix the watchdog name of mt8516
- Add mt6795 and MT8173 watchdog compatible

Changes since v4:
 - Drop label for watchdog node in mt8516

Changes since v3:
 - Drop label for watchdog example in yaml

Changes since v2:
 - Drop merged patch from series
 - Rebase to watchdog-next (for mt8188)

Changes since v1:
 - Drop "items" for a single enum·

Changes since [1]:
  - Update the commit message with some details
 - Drop "timeout-sec: true" and use unevaluatedProperties
[1] https://lore.kernel.org/all/20221005113517.70628-1-angelogioacchino.delregno@collabora.com/
[2] https://lore.kernel.org/all/20220422121017.23920-3-allen-kh.cheng@mediatek.com/

Allen-KH Cheng (3):
  arm64: dts: mediatek: mt7986: Fix watchdog compatible
  arm64: dts: mediatek: mt8516: Fix the watchdog node name
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT8173

AngeloGioacchino Del Regno (4):
  arm64: dts: mediatek: mt8186: Fix watchdog compatible
  arm64: dts: mediatek: mt8195: Fix watchdog compatible
  dt-bindings: watchdog: mediatek: Convert mtk-wdt to json-schema
  dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6795

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 80 +++++++++++++++++++
 .../devicetree/bindings/watchdog/mtk-wdt.txt  | 43 ----------
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  3 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  2 +-
 6 files changed, 84 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt

-- 
2.18.0


