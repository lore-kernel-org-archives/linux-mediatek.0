From: Jungo Lin <jungo.lin@mediatek.com>
Subject: [RFC V1 05/12] dts: arm64: mt8183: Add ISP Pass 1 nodes
Date: Thu, 28 Mar 2019 17:56:40 +0800
Message-ID: <1553767007-11909-6-git-send-email-jungo.lin@mediatek.com>
References: <jungo.lin@mediatek.com>
 <1553767007-11909-1-git-send-email-jungo.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1553767007-11909-1-git-send-email-jungo.lin@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tfiga@chromium.org, hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, ryan.yu@mediatek.com, Jerry-ch.Chen@mediatek.com, frankie.chiu@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, christie.yu@mediatek.com, seraph.huang@mediatek.com, zwisler@chromium.org, linux-mediatek@lists.infradead.org, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Add nodes for Pass 1 unit of Mediatek's camera ISP system.
Pass 1 unit embedded in Mediatek SoCs, works with the
co-processor to process image signal from the image sensor
and output RAW data.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c73f7ff..7df39bd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -382,5 +382,47 @@
 			reg = <0 0x1a000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		cam_smem: cam_smem {
+			compatible = "mediatek,mt8183-cam_smem";
+			mediatek,larb = <&larb3>,
+					<&larb6>;
+			iommus = <&iommu M4U_PORT_CAM_LSCI0>,
+				 <&iommu M4U_PORT_CAM_LSCI1>,
+				 <&iommu M4U_PORT_CAM_BPCI>;
+		};
+
+		camisp: camisp@1a000000 {
+			compatible = "mediatek,mt8183-camisp", "syscon";
+			reg = <0 0x1a000000 0 0x1000>,
+			      <0 0x1a003000 0 0x1000>,
+			      <0 0x1a004000 0 0x2000>,
+			      <0 0x1a006000 0 0x2000>;
+			reg-names = "camisp",
+				    "cam1",
+				    "cam2",
+				    "cam3";
+			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_LOW>,
+				     <GIC_SPI 255 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "cam1",
+					  "cam2",
+					  "cam3";
+			iommus = <&iommu M4U_PORT_CAM_LSCI0>,
+				 <&iommu M4U_PORT_CAM_LSCI1>,
+				 <&iommu M4U_PORT_CAM_BPCI>;
+			#clock-cells = <1>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
+			/* Camera CCF */
+			clocks = <&camsys CLK_CAM_CAM>,
+				 <&camsys CLK_CAM_CAMTG>;
+			clock-names = "CAMSYS_CAM_CGPDN",
+				      "CAMSYS_CAMTG_CGPDN";
+			mediatek,larb = <&larb3>,
+					<&larb6>;
+			mediatek,scp = <&scp>;
+			smem_device = <&cam_smem>;
+		};
+
 	};
 };
-- 
1.9.1
