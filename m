Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBEDC61DF7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 13:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJbMIZRCMofK6MZ4isF8/iUf2VBiJ5P5Iw0KAhDaB/s=; b=QiQagAT6iY0C2/nKA5hZ/nRIfS
	9LD+I2fxARkASzuhotOH2H9+RmYjiWTs0ClvRKzyKLg0Q69+kfOIK+DRVzxFnhL/efsdQdmSt3e3E
	mTkTazof3AGL0tyx44Wk1W8nJTcIAG+OylXyn1C8a8JrDfytm/3gpNlJq4GM19w3f7wT6JYpECxI1
	3+PEbzCOm7FVVy5Gi3DL/OwbGVap0lDh5g2LxRe+8G9D8gV1rAnKgGQxzHDuNJHcwh8VtDaHEHatY
	hZlDA+SzjoPoDiN7bhJVUqj99V0XvxOymDkF2N0YqXKfdRz29/5d/+Sswcqih5FbM1t/05Vx4J5el
	FhhvNZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r69uV-004uPN-0d;
	Thu, 23 Nov 2023 13:38:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r69uM-004uJF-1K;
	Thu, 23 Nov 2023 13:38:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5318DCE293C;
	Thu, 23 Nov 2023 13:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E51CC4339A;
	Thu, 23 Nov 2023 13:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700746695;
	bh=KAXGKMe2WBFft3tNq3FpiQGsTc/R5/rmU8Cl5gayixE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BhN61ErzqtMja4ZFFmQQN/xzpcG0fK/ObB0YFgMn1t1PGix45506/KGgqWs9ohzmp
	 teG1YFzyk9oQHh3zwqPYA0hlBtfBusl0Z6r345MOhJnm8rvM4KB48x0iaNk4nldz/u
	 ZS9+xmE2mHJ2uXcQThWf2D8dspHlyDLqj7SjTHHtbjnWOocfW8x7aUWleDr2BtpDjB
	 e5xvjFGDf3TbYpIGlY/vHoscApV9jwAZHzjyfe70iG1Z11sj2tcDmNKKqaVZtAr0qI
	 GXIDyaX0p2WxIBxhNqyYA3+ZN7Nm5yJgt1gk1jWhI4PR5du6I3bNv6b+7Svp2m+9wn
	 NxEvBWQHWjUjA==
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Xinlei Lee <xinlei.lee@mediatek.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8195: add DSI and MIPI DPHY nodes
Date: Thu, 23 Nov 2023 14:37:48 +0100
Message-Id: <20231123133749.2030661-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123133749.2030661-1-mwalle@kernel.org>
References: <20231123133749.2030661-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_053818_905171_858AA9C6 
X-CRM114-Status: UNSURE (   9.51  )
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

Add the two DSI controller node and the associated DPHY nodes.
Individual boards have to enable them in the board device tree.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 54c674c45b49..0621bb461967 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1714,6 +1714,26 @@ u2port3: usb-phy@0 {
 			};
 		};
 
+		mipi_tx0: dsi-phy@11c80000 {
+			compatible = "mediatek,mt8195-mipi-tx", "mediatek,mt8183-mipi-tx";
+			reg = <0 0x11c80000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-output-names = "mipi_tx0_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		mipi_tx1: dsi-phy@11c90000 {
+			compatible = "mediatek,mt8195-mipi-tx", "mediatek,mt8183-mipi-tx";
+			reg = <0 0x11c90000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-output-names = "mipi_tx1_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		i2c5: i2c@11d00000 {
 			compatible = "mediatek,mt8195-i2c",
 				     "mediatek,mt8192-i2c";
@@ -2737,6 +2757,20 @@ dither0: dither@1c007000 {
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x7000 0x1000>;
 		};
 
+		dsi0: dsi@1c008000 {
+			compatible = "mediatek,mt8195-dsi", "mediatek,mt8183-dsi";
+			reg = <0 0x1c008000 0 0x1000>;
+			interrupts = <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DSI0>,
+				 <&vdosys0 CLK_VDO0_DSI0_DSI>,
+				 <&mipi_tx0>;
+			clock-names = "engine", "digital", "hs";
+			phys = <&mipi_tx0>;
+			phy-names = "dphy";
+			status = "disabled";
+		};
+
 		dsc0: dsc@1c009000 {
 			compatible = "mediatek,mt8195-disp-dsc";
 			reg = <0 0x1c009000 0 0x1000>;
@@ -2746,6 +2780,20 @@ dsc0: dsc@1c009000 {
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x9000 0x1000>;
 		};
 
+		dsi1: dsi@1c012000 {
+			compatible = "mediatek,mt8195-dsi", "mediatek,mt8183-dsi";
+			reg = <0 0x1c012000 0 0x1000>;
+			interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DSI1>,
+				 <&vdosys0 CLK_VDO0_DSI1_DSI>,
+				 <&mipi_tx1>;
+			clock-names = "engine", "digital", "hs";
+			phys = <&mipi_tx1>;
+			phy-names = "dphy";
+			status = "disabled";
+		};
+
 		merge0: merge@1c014000 {
 			compatible = "mediatek,mt8195-disp-merge";
 			reg = <0 0x1c014000 0 0x1000>;
-- 
2.39.2


