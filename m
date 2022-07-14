Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9838CCA480
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yTPM/N9FoHrkSvIHQMtyVtdczakVbHwoxP6MZCC+ExQ=; b=VP+endMjhaKjbGG9htaRfHlk6s
	RborTSppFn+LNrbeODDF77H8ge91kRz+fGCPg6RyAQgMXzsrQd7Vci5hH6mBS1YN7wSGpShEGTo9z
	0H3EZQwBDvFWtu6B4TTjBnXnhMQY5bmecdXSnq6PhsfD5nam/C822RQdrTJto+JvJcrDYOSlZsi1S
	SkkanpOoimd7Fk5NU6buHXlT1a6KutIWMIlF4RahBtQfLZuGUuzgbUuEzkf2e/Qj/vCz6lelIEMFQ
	Bn/rjXw/mGM2BO3AKi9h9Cp3g2DqvJCkiio01yabAsxA1u3/TBKSfWcsDUd8DOWwm2o1TDLkJ5zoM
	/At1m5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oByJb-00EQBz-Kg; Thu, 14 Jul 2022 12:51:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oByJV-00EQ4Y-1X; Thu, 14 Jul 2022 12:51:30 +0000
X-UUID: 3c9a15b4a59e4617b9dbb8b6c5852339-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:13bc7e36-3895-4ad5-b8ec-841be44f32f3,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:8ea74d64-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3c9a15b4a59e4617b9dbb8b6c5852339-20220714
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 623239335; Thu, 14 Jul 2022 05:51:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 14 Jul 2022 20:50:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 14 Jul 2022 20:50:46 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Chen-Yu Tsai" <wenst@chromium.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 0/4] dt-bindings: watchdog: mediatek: Convert binding to YAML
Date: Thu, 14 Jul 2022 20:50:40 +0800
Message-ID: <20220714125044.20403-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_055129_119121_BD9B30B1 
X-CRM114-Status: UNSURE (   9.71  )
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

Based on tag: next-20220712, linux-next/master

Add some PATCHs to fix dtbs_check warnings.

changes since v1:
 - fix dtbs_check warnings in dts
 - use enum instead of multiple const values
 - remove timeout-sec
 - rewrite examples
 - rename schema to mediatek,wdt.yaml

Allen-KH Cheng (4):
  dt-bindings: watchdog: mediatek: Convert binding to YAML
  arm64: dts: mediatek: Remove mt6589 wdt fallback string from mt7986
  arm64: dts: mediatek: Remove mt6589 wdt fallback string from mt8195
  arm64: dts: mediatek: Fix the watchdog node name

 .../bindings/watchdog/mediatek,wdt.yaml       | 64 +++++++++++++++++++
 .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ------------
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  3 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  2 +-
 5 files changed, 67 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt

-- 
2.18.0


