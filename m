Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58492C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PwVw5OAPVEkY9FRmK3zAX0nij1780x7iU90JamL0eBs=; b=ZEiDE8UWqunDX7cpJHqRR/TA2D
	qqzxt8lZ2knH6lbH1PcpshEOx1+S7feiTQnfcCYUPm+fx4IIsocpbdJeUe4LTCw5p/3XdyKI5qLjU
	aTTmDueasITPcVXD0WN8gR6v2Iu3i86F2dERiTc0laRABb+Ja5mpMdRtitdCF5919xQenTBGMHbvJ
	0NTCIRxjz2LUQY8xezyyxi0K0U9pa921eZepDl0nVfHB6TrU1lZKz6LTZ95WNEYxnmAH989ntlyuU
	p//bKSRUNlXZcTEGx1CrYfaFdbqnA4QbuIlgC+cRMRr7Z06FsqSjn3d9ZlwQM++8YwGerbiQObdza
	VwXOHtQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXYq-008PH8-SQ; Thu, 21 Jul 2022 14:53:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXVa-008LNV-Gr; Thu, 21 Jul 2022 14:50:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E4FA6601AB6;
	Thu, 21 Jul 2022 15:50:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658415032;
	bh=PxVOdo3kmX5GhVqhInInTAsKF/mvybao/JRyPYM/wN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RhMOLexbI/J6DRhKHUs3stBIJKE/U0o04dE0zkTOM8ggsKjwROG3afPQVz3bBcBLn
	 DyG80nCcYt0gd95FjWIlKFtR+tfw1RiqGkalb+s2hsDMyZMKrYOnKa07et2ve5DeKf
	 xjTTtD7xsPUvgIRolrMlScGWAEx6qFZoCJKaZ/OI9E9l83Fi/mVGzefABXYiNwv7Zm
	 AZLaLaOH5vHLsEjbrT1ygFY0j0Vz3XG60IKql3D2fYGcdIfgumuVHHSdbcm+Z8pXqj
	 4bVbgL/N7jm2jvpwbce0dWTmXDklRN6nHPsiXzsB8l1rxnedzKFOoO064YFSb+HlMM
	 AOp8vyH7e3KcA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 7/8] arm64: dts: mediatek: cherry: Enable keyboard PWM backlight
Date: Thu, 21 Jul 2022 16:50:16 +0200
Message-Id: <20220721145017.918102-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com>
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_075034_711762_D69FAF06 
X-CRM114-Status: UNSURE (   9.87  )
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

Add a pwm-leds node to enable the PWM controlled keyboard backlight.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ca9955a97f8f..9086a440a995 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include "mt8195.dtsi"
 #include "mt6359.dtsi"
 
@@ -31,6 +32,18 @@ dmic_codec: dmic-codec {
 		wakeup-delay-ms = <50>;
 	};
 
+	led-controller {
+		compatible = "pwm-leds";
+
+		keyboard_backlight: keyboard-backlight {
+			default-state = "off";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+			label = "cros_ec::kbd_backlight";
+			max-brightness = <1023>;
+			pwms = <&cros_ec_pwm 3>;
+		};
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
-- 
2.35.1


