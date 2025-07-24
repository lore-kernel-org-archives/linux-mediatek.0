Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9ABC83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cl73fhATm0uxKiEhFJLVD3NEvElCINCTYpW2ff64kms=; b=IVXry6gCGJwN4W
	27opoi1s32eVbofNtaZJ2ZYU8gaaLMqy+KLOP0ju9O30wv8okRH2iCcEW/DEYRwo0UzNCvEtqx+tt
	2brXWrOITXSL/EkAG006OOK9SD9R2jSSOdnRpUAGfaWx39QLc5ehu08HWetG8PbJKv57UOMN7EEDu
	NgtE9M15Ot11TeLbgkYwvqBOWxExrWT5QShxqsaWHmDgpeAa2DDspT8U3lmsT4e/D7if5Z8OkzNc5
	39weJHz9LR2+kFe//z0M31xI478qorDiFZ+/VVJE4b6KoCtDCNS2V5jurN5st0ftPnzxdDjwlGULI
	3hdykJQvSKogHLRxp2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesbb-000000077U2-3CDQ;
	Thu, 24 Jul 2025 09:51:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerVT-00000006u4j-24cj;
	Thu, 24 Jul 2025 08:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346450;
	bh=c3mbvg3u8ROaaVs8EH08ECKYZrtr/aCMlnPYd9mL1/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k4MdlrNzkD4Rmw1BMR/lF2F0uaiAwVc82OaIwwu1Fbki6DayF4jykh+gTzEPdt//d
	 0SyD4eRgRLg9R8nuQipR7l7OzJ7gF9HT27S1UsB/mb8iqofl4/h1iefpl3xr8bfiyn
	 npCe2sAd5AyQc9QoJtz+q/BLXBlGrw+B3JnmpGItPJ4RqDI9Nm6RdlvVOW+dpU7n9E
	 ANXFwEfKPieMsmX5YcWJcrHhttc0AU8vHmJpUVUX1wclqmBu3X6RPjeRJJ8cg3lgrA
	 oT/pZ0DJQPtwT11WUhafef4x4nS8GhGHYrJTiJvDFoIlKq+DU93Fx70eMOJD3fzue7
	 hPUeh9yjNFyRA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B8A8217E1110;
	Thu, 24 Jul 2025 10:40:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 32/38] arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
Date: Thu, 24 Jul 2025 10:39:08 +0200
Message-ID: <20250724083914.61351-33-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014051_682014_2196720A 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The display related IPs in MT8183 are flexible and support being
interconnected with different instances of DDP IPs forming a full
Display Data Path that ends with an actual display output, which
is board specific.

Add a common graph in the main mt8183.dtsi devicetree, which is
shared between all of the currently supported boards, and do it
such that only a very minimal amount of changes are needed to
each board - the only required change was done in mt8183-pumpkin,
using a phandle to assign the display to DPI0.

All boards featuring any display functionality will extend this
common graph to hook the display controller of the SoC to their
specific output port(s).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |   8 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 239 +++++++++++++++++-
 2 files changed, 238 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index d5fcb010e1ac..cf1d33384bf0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -531,10 +531,8 @@ &dpi0 {
 	pinctrl-0 = <&dpi_func_pins>;
 	pinctrl-1 = <&dpi_idle_pins>;
 	status = "okay";
+};
 
-	port {
-		dpi_out: endpoint {
-			remote-endpoint = <&it66121_in>;
-		};
-	};
+&dpi_out {
+	remote-endpoint = <&it66121_in>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 3c1fe80e64b9..960d8955d018 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1667,6 +1667,21 @@ mmsys: syscon@14000000 {
 			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
 				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mmsys_ep_main: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&ovl0_in>;
+				};
+
+				mmsys_ep_ext: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&ovl_2l1_in>;
+				};
+			};
 		};
 
 		dma-controller0@14001000 {
@@ -1733,6 +1748,25 @@ ovl0: ovl@14008000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL0>;
 			iommus = <&iommu M4U_PORT_DISP_OVL0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl0_in: endpoint {
+						remote-endpoint = <&mmsys_ep_main>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl0_out: endpoint {
+						remote-endpoint = <&ovl_2l0_in>;
+					};
+				};
+			};
 		};
 
 		ovl_2l0: ovl@14009000 {
@@ -1743,6 +1777,25 @@ ovl_2l0: ovl@14009000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
 			iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl_2l0_in: endpoint {
+						remote-endpoint = <&ovl0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl_2l0_out: endpoint {
+						remote-endpoint = <&rdma0_in>;
+					};
+				};
+			};
 		};
 
 		ovl_2l1: ovl@1400a000 {
@@ -1753,6 +1806,25 @@ ovl_2l1: ovl@1400a000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
 			iommus = <&iommu M4U_PORT_DISP_2L_OVL1_LARB0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl_2l1_in: endpoint {
+						remote-endpoint = <&mmsys_ep_ext>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl_2l1_out: endpoint {
+						remote-endpoint = <&rdma1_in>;
+					};
+				};
+			};
 		};
 
 		rdma0: rdma@1400b000 {
@@ -1764,6 +1836,25 @@ rdma0: rdma@1400b000 {
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
 			mediatek,rdma-fifo-size = <5120>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma0_in: endpoint {
+						remote-endpoint = <&ovl_2l0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma0_out: endpoint {
+						remote-endpoint = <&color0_in>;
+					};
+				};
+			};
 		};
 
 		rdma1: rdma@1400c000 {
@@ -1775,6 +1866,25 @@ rdma1: rdma@1400c000 {
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
 			mediatek,rdma-fifo-size = <2048>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma1_in: endpoint {
+						remote-endpoint = <&ovl_2l1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma1_out: endpoint {
+						remote-endpoint = <&dpi_in>;
+					};
+				};
+			};
 		};
 
 		color0: color@1400e000 {
@@ -1785,6 +1895,25 @@ color0: color@1400e000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					color0_in: endpoint {
+						remote-endpoint = <&rdma0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					color0_out: endpoint {
+						remote-endpoint = <&ccorr0_in>;
+					};
+				};
+			};
 		};
 
 		ccorr0: ccorr@1400f000 {
@@ -1794,6 +1923,25 @@ ccorr0: ccorr@1400f000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ccorr0_in: endpoint {
+						remote-endpoint = <&color0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ccorr0_out: endpoint {
+						remote-endpoint = <&aal0_in>;
+					};
+				};
+			};
 		};
 
 		aal0: aal@14010000 {
@@ -1803,6 +1951,25 @@ aal0: aal@14010000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_AAL0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					aal0_in: endpoint {
+						remote-endpoint = <&ccorr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					aal0_out: endpoint {
+						remote-endpoint = <&gamma0_in>;
+					};
+				};
+			};
 		};
 
 		gamma0: gamma@14011000 {
@@ -1812,6 +1979,25 @@ gamma0: gamma@14011000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					gamma0_in: endpoint {
+						remote-endpoint = <&aal0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					gamma0_out: endpoint {
+						remote-endpoint = <&dither0_in>;
+					};
+				};
+			};
 		};
 
 		dither0: dither@14012000 {
@@ -1821,6 +2007,25 @@ dither0: dither@14012000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dither0_in: endpoint {
+						remote-endpoint = <&gamma0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dither0_out: endpoint {
+						remote-endpoint = <&dsi_in>;
+					};
+				};
+			};
 		};
 
 		dsi0: dsi@14014000 {
@@ -1837,8 +2042,21 @@ dsi0: dsi@14014000 {
 			phy-names = "dphy";
 			status = "disabled";
 
-			port {
-				dsi_out: endpoint { };
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&dither0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_out: endpoint { };
+				};
 			};
 		};
 
@@ -1853,8 +2071,21 @@ dpi0: dpi@14015000 {
 			clock-names = "pixel", "engine", "pll";
 			status = "disabled";
 
-			port {
-				dpi_out: endpoint { };
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dpi_in: endpoint {
+						remote-endpoint = <&rdma1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dpi_out: endpoint { };
+				};
 			};
 		};
 
-- 
2.50.1


