Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F828FA373D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 09:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qq8RjMgXogy/lokTmygbzLiOdV9vWqQa8eNri7KPqGk=; b=rgN0E+796irAys9d91V+//afej
	oiMsBnU6f8wEioDYk8CillUSH7c9jHYbayOhy8jEd9qObyqj+MUjiFD9cxmrjGgFFqXdBAL9fZsEM
	ADPfeEEB1Yifdh6HM9XyGefITvy/6fZ8568Xirt4lB3SlP4exAEGa6VYuaiBNaNHH9kN6Xhfx5XeX
	TmL5wAoYiLxceDn3I1xTUQO/qa3Ky+GfeyK4xBM9bvs0f04UCG6FfPVmrS+DAmCXnuH+S1tOCsIeN
	OaobrglgCeui29x4zAXWbpXGvUspXUa/bXpcYZJTD+ClUqFbOX6tvM2a0WSIx6bp46+9SU0pdrq7G
	o/n/Otng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzbi-00CgEu-Dd; Thu, 27 Oct 2022 09:55:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzbY-00CgAu-LB; Thu, 27 Oct 2022 09:55:19 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C776166028CF;
	Thu, 27 Oct 2022 10:55:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666864515;
	bh=XOuhqy5hOPdqpQ8sIzWrIZYqHoZW6wPK8VwlJ/w9e6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UnwvIyUa4IWPVyjXR2fNMiz5qjQnnEkogRbBxsht2kmsemjK7xKOR5FEVXYwQhd1m
	 q3i0iQb7IdfQ7FG4cCSv4IVm8mkyKZPzyyX+g5zxMXa9nOcge6UGnm+f6IVeMCDQoQ
	 8UTG+p4fGQhBkH6DJpnG54buzqNtEbS3xJRULPDF5eJvP9ZBJW39DkbCMtypU8+Pok
	 1LcyLAY4DzjxiEWKF2leT5/LsJgtZhBEShdLwPHnYcPSrayWGcaL32xyd0jmSOFWg4
	 4c5GCCPSTd1tR0FAOBuEpQ1zoqdO1BJJyIpLBKGVnrYyWZmetKCDZIAtkRiQFLH7EX
	 15LqX6tlkEWsQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sam.shih@mediatek.com,
	andrew@lunn.ch,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/6] arm64: dts: mediatek: mt6795: Replace UART dummy clocks with pericfg
Date: Thu, 27 Oct 2022 11:55:00 +0200
Message-Id: <20221027095504.37432-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
References: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_025517_944761_9484B7D2 
X-CRM114-Status: GOOD (  10.14  )
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

The UART nodes had a dummy clock for early bringup, as it is
expected that these are left on by the bootloader: now that
the pericfg clock controller is supported, we can replace
them with the real clocks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 1801cafd9c13..60a07410ff63 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -314,7 +314,8 @@ uart0: serial@11002000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x400>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&clk26m>;
+			clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 
@@ -323,7 +324,8 @@ uart1: serial@11003000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11003000 0 0x400>;
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&clk26m>;
+			clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 
@@ -332,7 +334,8 @@ uart2: serial@11004000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11004000 0 0x400>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&clk26m>;
+			clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 
@@ -341,7 +344,8 @@ uart3: serial@11005000 {
 				     "mediatek,mt6577-uart";
 			reg = <0 0x11005000 0 0x400>;
 			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&clk26m>;
+			clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
+			clock-names = "baud", "bus";
 			status = "disabled";
 		};
 	};
-- 
2.37.2


