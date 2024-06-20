Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB42C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLLOldd2EM09oMcwodphQFaWTlUkilxWOiEM6iDPc7s=; b=yaKD1ckww50W7tJX2wRu7QyCyj
	Q0iwSstf7YaDXcwh2Q00u5+IWw0/2Pw4aH3EknxxM4xhPAGvdy+nFX7rBkcAa0jvPCGijSJeyT5mT
	EBTBBVSvVN5OYtFdDiPV7QXcAqQ4WydSi0EbFQd5FKQvNBJoE5Yz/7jIqMbwnW20pBuodrsXQNM4I
	sf7FhRtmLh7bIpkDgtTkRymt14j+5XV3gS30op+29USDOIgBY7BfsL8bFbIpGLQiaz72Vyf5uyxLX
	gPr76KoPQpIRCige0cN8VGcGRjwwGE8n1E1Vs8a+Hxv0pWKrI0ms35VB5QlDke1Ty65tndVtN6xlP
	cH1vGh0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEr9-00000004XHB-0sN3;
	Thu, 20 Jun 2024 10:17:27 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEqp-00000004X63-0zLa;
	Thu, 20 Jun 2024 10:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718878625;
	bh=5/xHxmoCi6QI9LdIQBj0+iaTN+SgQB2ZeW/Ik0I59PE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e0O0VqeuzYslp1aUxg/9cFnisu00u+IzNyVfwcQZhRfJWcyf/4njYTb6reh1R7zR5
	 y6HIBpL0SSlYcWjXBdSU8O0zcCz7ww++qLzS2KWRWQCYTd7t5oLaZs3qX/c10nBI7S
	 ITdeI4jDg89jdJK+jp7QDkKs0krWRDXw4Qgc4VYORDHp799aCfpPcrjk9gWaD1BUEn
	 p4k3eehOasHDUVxktjeyGAxqgGYA7EurfPaJ6NrKNMVkJwYCNq8bX7BS1b7FUtO00i
	 CYru2O03U9TwN15rwyBzkPXg/qzISY8MEY9GvqeJ05kv/FgSqXACfIbcCrNDQpec69
	 W3nUYwheeuE7w==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D8F9B3780698;
	Thu, 20 Jun 2024 10:17:04 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/2] arm: dts: mediatek: Declare drive-strength numerically
Date: Thu, 20 Jun 2024 12:16:56 +0200
Message-ID: <20240620101656.1096374-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620101656.1096374-1-angelogioacchino.delregno@collabora.com>
References: <20240620101656.1096374-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_031707_427245_4D7C8B5B 
X-CRM114-Status: UNSURE (   9.75  )
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

On some devicetrees, the drive-strength property gets assigned a
MTK_DRIVE_(x)_mA definition, which matches with (x).

For example, MTK_DRIVE_8mA equals to 8 and MTK_DRIVE_30mA equals
to 30.

Also keeping in mind that the drive-strength property is, by
(binding) definition, taking a number in milliamperes unit,
change all devicetrees to avoid the usage of any MTK_DRIVE_(x)
definition.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/mediatek/mt2701-evb.dts |  2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi    | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt2701-evb.dts b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
index 9c7325f18933..4c76366aa938 100644
--- a/arch/arm/boot/dts/mediatek/mt2701-evb.dts
+++ b/arch/arm/boot/dts/mediatek/mt2701-evb.dts
@@ -231,7 +231,7 @@ pins1 {
 				 <MT2701_PIN_238_EXT_SDIO1__FUNC_EXT_SDIO1>,
 				 <MT2701_PIN_237_EXT_SDIO2__FUNC_EXT_SDIO2>,
 				 <MT2701_PIN_236_EXT_SDIO3__FUNC_EXT_SDIO3>;
-			drive-strength = <MTK_DRIVE_4mA>;
+			drive-strength = <4>;
 			bias-pull-up;
 		};
 	};
diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index f0b4a09004b3..814586abc297 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -1143,13 +1143,13 @@ pins-cmd-dat {
 				 <MT7623_PIN_121_MSDC0_DAT0_FUNC_MSDC0_DAT0>,
 				 <MT7623_PIN_116_MSDC0_CMD_FUNC_MSDC0_CMD>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_2mA>;
+			drive-strength = <2>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
 		};
 
 		pins-clk {
 			pinmux = <MT7623_PIN_117_MSDC0_CLK_FUNC_MSDC0_CLK>;
-			drive-strength = <MTK_DRIVE_2mA>;
+			drive-strength = <2>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
 		};
 
@@ -1167,14 +1167,14 @@ pins-cmd-dat {
 				 <MT7623_PIN_110_MSDC1_DAT3_FUNC_MSDC1_DAT3>,
 				 <MT7623_PIN_105_MSDC1_CMD_FUNC_MSDC1_CMD>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_4mA>;
+			drive-strength = <4>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
 		};
 
 		pins-clk {
 			pinmux = <MT7623_PIN_106_MSDC1_CLK_FUNC_MSDC1_CLK>;
 			bias-pull-down;
-			drive-strength = <MTK_DRIVE_4mA>;
+			drive-strength = <4>;
 		};
 
 		pins-wp {
@@ -1197,13 +1197,13 @@ pins-cmd-dat {
 				 <MT7623_PIN_110_MSDC1_DAT3_FUNC_MSDC1_DAT3>,
 				 <MT7623_PIN_105_MSDC1_CMD_FUNC_MSDC1_CMD>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_4mA>;
+			drive-strength = <4>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
 		};
 
 		pins-clk {
 			pinmux = <MT7623_PIN_106_MSDC1_CLK_FUNC_MSDC1_CLK>;
-			drive-strength = <MTK_DRIVE_4mA>;
+			drive-strength = <4>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
 		};
 	};
@@ -1211,7 +1211,7 @@ pins-clk {
 	nand_pins_default: nanddefault {
 		pins-ale {
 			pinmux = <MT7623_PIN_116_MSDC0_CMD_FUNC_NALE>;
-			drive-strength = <MTK_DRIVE_8mA>;
+			drive-strength = <8>;
 			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
 		};
 
@@ -1226,13 +1226,13 @@ pins-dat {
 				 <MT7623_PIN_115_MSDC0_RSTB_FUNC_NLD8>,
 				 <MT7623_PIN_119_MSDC0_DAT2_FUNC_NLD2>;
 			input-enable;
-			drive-strength = <MTK_DRIVE_8mA>;
+			drive-strength = <8>;
 			bias-pull-up;
 		};
 
 		pins-we {
 			pinmux = <MT7623_PIN_117_MSDC0_CLK_FUNC_NWEB>;
-			drive-strength = <MTK_DRIVE_8mA>;
+			drive-strength = <8>;
 			bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
 		};
 	};
-- 
2.45.2


