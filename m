Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62D2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYm/msFogKcs/9RazfkJCMhP1Bp3LI2LpcxbJjAht/o=; b=OLbhTK8BlFLGoH
	U6GhusItIealODdbuva+i2rN49OWWmQyFE805ee5EhJ2uk1LfDXtyhK0xg+NHfAN6W5p8Kr/SLJu9
	3+6G8+60lodVYvSpqk/HfyY5zxcKZJafGplOQDpW1vs4+ZwF2vvkSgxfhzePitu+sQzfL6uaqAFI1
	dBfTdBwStKoT4e4qVFtSt0kk7P6pd4eTMg5WCcKeRRxUkG3C/cjaDX4WT1qBr2FrOSHqDLHLOi7PL
	wGPev/7jau2bYJRoMxlrURfdLcfFSA6/dJbaCW3+lm7I8CuWbvK/R+u2Sp97fj9YBMHBjMKYiuLLp
	hF6F4ivHM24fAXrQOaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njhHm-001RCV-Rj; Wed, 27 Apr 2022 13:00:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njhFD-001QFk-PW; Wed, 27 Apr 2022 12:58:17 +0000
X-UUID: 04a6ebac5d40483090e3215c0bdefc89-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:74d0c743-9dad-47d2-a4f0-c125fa2f765b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:90d4b0c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 04a6ebac5d40483090e3215c0bdefc89-20220427
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 859118792; Wed, 27 Apr 2022 05:58:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 05:48:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 27 Apr 2022 20:48:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 20:48:15 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <ryder.lee@kernel.org>, "Sam
 Shih" <sam.shih@mediatek.com>, Vic Wu <vic.wu@mediatek.com>
Subject: [PATCH 5/5] arm64: dts: mt7986: add crypto related device nodes
Date: Wed, 27 Apr 2022 20:47:41 +0800
Message-ID: <20220427124741.18245-6-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220427124741.18245-1-sam.shih@mediatek.com>
References: <20220427124741.18245-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_055811_907562_8BE72114 
X-CRM114-Status: UNSURE (   9.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds crypto engine support for MT7986.

Signed-off-by: Vic Wu <vic.wu@mediatek.com>
Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |  4 ++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 15 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |  4 ++++
 3 files changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index de6475078568..714a4e73fe0b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -43,6 +43,10 @@
 	};
 };
 
+&crypto {
+	status = "okay";
+};
+
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index ff685900baa4..6de9b941a513 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -200,6 +200,21 @@
 			status = "disabled";
 		};
 
+		crypto: crypto@10320000 {
+			compatible = "inside-secure,safexcel-eip97";
+			reg = <0 0x10320000 0 0x40000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ring0", "ring1", "ring2", "ring3";
+			clocks = <&infracfg CLK_INFRA_EIP97_CK>;
+			clock-names = "infra_eip97_ck";
+			assigned-clocks = <&topckgen CLK_TOP_EIP_B_SEL>;
+			assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>;
+			status = "disabled";
+		};
+
 		uart0: serial@11002000 {
 			compatible = "mediatek,mt7986-uart",
 				     "mediatek,mt6577-uart";
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
index 6bd477e1f484..d4078feb4aad 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -43,6 +43,10 @@
 	};
 };
 
+&crypto {
+	status = "okay";
+};
+
 &pio {
 	spi_flash_pins: spi-flash-pins {
 		mux {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
