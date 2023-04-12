Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225B1C77B72
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZwlhye0B3WdgeiPJFEuAuWDr27/o6foB6BG3zgXAcU=; b=IWTkTMGpOIUB1BSoM1zuybUmTD
	UptbRi8Hg0C5WhO/+EF4sQt8aNyvKNUNkLKFIuS7v88B3ZDQz7Tg+Qvy8PWtFjC6yg0bv9yyo+C3d
	lQ1SIH908zdMFeKDQQHCqxJMT4TCfyovwA+Zn1T1YhYDYfcfhJt80ZUzEWekMfrbidNRa4MrAmEw+
	jBIxQQP1HWBGewTHXk8/IxCe3LMKl68J8XDWAHRSRuviAkhpgaizt1O4AF8elgDXxCYEvCAkqIdh/
	jr4sOWM4Rcf/vqFkWsboI06UjLafFZcxb1AEi7hxFe/ZrgoLStNaH5oLeRHxOZBjotiqm3J0za6U4
	bgMXLMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYgw-002qpC-3B;
	Wed, 12 Apr 2023 11:31:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYeC-002o4q-1v;
	Wed, 12 Apr 2023 11:28:25 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 04496660328E;
	Wed, 12 Apr 2023 12:28:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298899;
	bh=VzMpC2ylIvPbeGRaM8hTndNXA0jJmN7L511Odi3RhPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NXvDtQJ37lxvR/koYZz67/GC+4r1u9X0Qh/yvf8gDT6BI9s/W+l4B0js3i6aGEQpb
	 4U+O5sQJBxuWwmFqisqL4TrC3Eghy10zEK0IzMV73BsVJcphsVZTBHBt1JrHgerCrA
	 55LDUQ9x6w9zIbc5nbZaDtp50KHbE/tXfA/heWMSShd8dHZIaKDziqcYCMcxAFxakU
	 9QdIQoLtXP0CYrbZlFWhPD4vgrrUteqwW+cZyjKBBfZfNwV8aWqtnJeDLfZjGrz10a
	 JQoruXQ0qNStVKMPgLuVft6us1VVthVll1SqrStJpmjY8mb1Lm51Y7c2NZRgPWwh/z
	 sZdyM2NTdjcew==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	xinlei.lee@mediatek.com,
	houlong.wei@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 24/27] arm64: dts: mediatek: mt6795-xperia-m5: Add MT6331 Combo PMIC
Date: Wed, 12 Apr 2023 13:27:36 +0200
Message-Id: <20230412112739.160376-25-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042820_796739_60B90B33 
X-CRM114-Status: GOOD (  11.41  )
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

This smartphone uses the Helio X10 standard MT6331+MT6332 combo PMICs:
include the mt6331 devicetree and add the required interrupt.

Note that despite there being two interrupts, one for MT6331 and one
for MT6332, in configurations using the companion PMIC, the interrupt
of the latter fires for both events on MT6331 and for ones on MT6332,
while the interrupt for the main PMIC fires only for events of the
main PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index a0e01a756f03..debe0f2553d9 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
 #include "mt6795.dtsi"
+#include "mt6331.dtsi"
 
 / {
 	model = "Sony Xperia M5";
@@ -219,6 +220,15 @@ pins-tx {
 	};
 };
 
+&pmic {
+	/*
+	 * Smartphones, including the Xperia M5, are equipped with a companion
+	 * MT6332 PMIC: when this is present, the main MT6331 PMIC will fire
+	 * an interrupt on the companion, so we use the MT6332 IRQ GPIO.
+	 */
+	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &uart0 {
 	status = "okay";
 
-- 
2.40.0


