Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EE4C54EBC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iF0XeBjwYTnZXjGJqxu1zDCO1Q6G7fns6hD+lzukNVk=; b=G+mWEqnbvMTx/XyPzyiOnQJ58q
	PoBU6PORLbl3G0MtjjTLZq4F6zHDIpJtR5lkQOLuJA2ujZRo+JxKqdCrVLxfXq7IrSjY1asxRPqDj
	WK5JI4Xa/p6+CSfAurRaBvOkL/Ssvg9gxHKi4hiF2PYmULjXbsCXYDqFfwjb/y5eIxNraMfGwn7lI
	ZjhR5T6/KUYpA5GOmdGIv8o30U4x7JUCIp1zFia5pa/CaIgy9lm/Egqt7W/RbegO6n8Kj04QDTJ/K
	8Afm6xXqWmFdK1Td8k0AVlxIKIlCBdw/lmb34Hh8rTHvATtelnTpL95k55so0wZmsSyJBqUa1Py+m
	SZFOMDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFble-00BjJc-BC; Wed, 11 Jan 2023 14:07:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFblU-00BjIA-7p; Wed, 11 Jan 2023 14:07:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E9006602D9C;
	Wed, 11 Jan 2023 14:07:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673446057;
	bh=n5WHHdQNBAmOfq5p8QxYo1xuR8hghbRyMcc6c0ej73E=;
	h=From:To:Cc:Subject:Date:From;
	b=ft+RLNTMPustVX31ZWVZ+VbC8cBRx/3a766ayXp+Je96O72qZb91w6D7v68FJ1NDL
	 KsXKIoRZVL4b6CmVrTmJ09ngH1dGN1MowQDAM81UCm8Vfsy36O7OTsl3egi55IDvV6
	 envsu1WpEfF5FCOQoI/tSwRMQCp1PH5R0mSDjCTs5EjD+tRatASSerY4C8QF/qGJFX
	 Lu2ho8UJ8BUTiWXUeloV2QzRIXUnb0CFLkcWxvcPCsq8NeLMZCdXgr4ikJ4pUrh8++
	 N4o15u4RBqLyukqKK7Zx8Tzb8XmYy54VBXvIDZH/3ov5gCxijHm4/Qw2YAAt5rUDzX
	 LSAWgXk4WxxnQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] arm64: dts: mediatek: mt8173-elm: Move display to ps8640 auxiliary bus
Date: Wed, 11 Jan 2023 15:07:24 +0100
Message-Id: <20230111140724.294533-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_060740_444922_B02CCC62 
X-CRM114-Status: UNSURE (   8.28  )
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

Move the display to an aux-bus subnode of the PS8640 eDP bridge.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 +++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 18e214464a2d..f9b10c7027cf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -90,18 +90,6 @@ switch-volume-up {
 		};
 	};
 
-	panel: panel {
-		compatible = "lg,lp120up1";
-		power-supply = <&panel_fixed_3v3>;
-		backlight = <&backlight>;
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&ps8640_out>;
-			};
-		};
-	};
-
 	panel_fixed_3v3: regulator1 {
 		compatible = "regulator-fixed";
 		regulator-name = "PANEL_3V3";
@@ -282,6 +270,20 @@ ps8640_out: endpoint {
 				};
 			};
 		};
+
+		aux-bus {
+			panel: panel {
+				compatible = "lg,lp120up1";
+				power-supply = <&panel_fixed_3v3>;
+				backlight = <&backlight>;
+
+				port {
+					panel_in: endpoint {
+						remote-endpoint = <&ps8640_out>;
+					};
+				};
+			};
+		};
 	};
 };
 
-- 
2.39.0


