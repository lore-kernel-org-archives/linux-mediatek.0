Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C2AC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ko1tkIvljQ+hiNqM+fv8WaKuqu0yP4amrfOkT2qbZqU=; b=q0cxSDJXSTsuEiuT2tDZDjm1qq
	x/oaKrVLG6w57TsmBycvW2Rpn01Jesm/JA4wLeMpuWlFEfFmgtzs++OteSobqCO/N1xFv7X5Nks9Q
	Xe0y2qH0JEB3udNX1LDV1lSdxL/uoNiNTw4d8mtULwoPJ67wr/a6jvO/XXYk7UKOyWwjbN/JMdB4z
	XZTUtflhqne0LE2P3NWH3N0A02S8/rG3z15nN7ex3iMYQbpHPUUQXfVJv/jZsZJtEGpSML6J7bNaA
	WV/ktckgEkDRXE63Nt+iovMZ/WymX4/jOnj4khqgHiQYIYX2TRzB+q1GmdOxWyB34FSf8myVokqH0
	S8ZT0M4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfleU-005BFm-1w;
	Fri, 24 Mar 2023 17:56:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfld9-005AKh-2u;
	Fri, 24 Mar 2023 17:55:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 203D2660313D;
	Fri, 24 Mar 2023 17:55:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680508;
	bh=zcA2d+WMjPM5RJNJ1o3VT548PHPHu4fUWaFnh1gs35U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bN4oZOHDWzZiuTOaLStwTgAlblFyL2N3cadGKb/dBD6JhvBXMTOdc78M9UzYzFTQG
	 iYerpa8Uj6N2nWE7alPZVrM5DHJcGhthgTyLBVpvYSa5TO45f+rRp5wMhi3gn/gjl2
	 fB9854j6KARrK0pBMxYGspYJ9//Gh1dDh9WFF0nRKxRgiKJTfz74uK1cwwebJW0Vzk
	 kDPZ1Up0lEX0kne7pqh2fM2kzRPow07hTEJILKAjpv76bbqfZmAs/DZp1gP8wMyR9x
	 4fWYyNUP0pklXdV6pLqvMFovNVPCTYg3CPYomWd+e1px0E5B3snTAe7d4pFd2Zt1Mb
	 75BobpW+mdVmg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 09/18] arm64: dts: mediatek: mt6795: Add support for the CMDQ/GCE mailbox
Date: Fri, 24 Mar 2023 18:54:47 +0100
Message-Id: <20230324175456.219954-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105512_142531_36E0CEED 
X-CRM114-Status: UNSURE (   9.34  )
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

In preparation for adding multimedia blocks, add the CMDQ/GCE mailbox.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index d63efb32e6bb..0f903e8fe70f 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/mediatek,mt6795-clk.h>
+#include <dt-bindings/gce/mediatek,mt6795-gce.h>
 #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
 #include <dt-bindings/power/mt6795-power.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
@@ -401,6 +402,15 @@ fhctl: clock-controller@10209f00 {
 			status = "disabled";
 		};
 
+		gce: mailbox@10212000 {
+			compatible = "mediatek,mt6795-gce", "mediatek,mt8173-gce";
+			reg = <0 0x10212000 0 0x1000>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_INFRA_GCE>;
+			clock-names = "gce";
+			#mbox-cells = <2>;
+		};
+
 		gic: interrupt-controller@10221000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.40.0


