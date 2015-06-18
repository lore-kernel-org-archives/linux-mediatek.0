From: Scott Shu <scott.shu@mediatek.com>
Subject: [RESEND PATCH 6/6] ARM: dts: mt6580: enable basic SMP bringup for mt6580
Date: Fri, 19 Jun 2015 02:01:21 +0800
Message-ID: <1434650481-39421-7-git-send-email-scott.shu@mediatek.com>
References: <Scott Shu <srv_scott.shu@mediatek.com>
 <1434650481-39421-1-git-send-email-scott.shu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434650481-39421-1-git-send-email-scott.shu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: yingjoe.chen@mediatek.com, robh+dt@kernel.org, matthias.bgg@gmail.com, linux@arm.linux.org.uk, rchintakuntla@cavium.com, lorenzo.pieralisi@arm.com, marc.ceeeee@gmail.com, heiko@sntech.de, catalin.marinas@arm.com, arnd@arndb.de, galak@codeaurora.org
Cc: srv_wsdupstream@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Scott Shu <scott.shu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Add arch timer node to enable arch-timer support. MT6580 firmware
doesn't correctly setup arch-timer frequency and CNTVOFF, add
properties to workaround this.

This set cpu enable-method to enable SMP.
---
 arch/arm/boot/dts/mt6580.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/mt6580.dtsi b/arch/arm/boot/dts/mt6580.dtsi
index a974830..a7071b38 100644
--- a/arch/arm/boot/dts/mt6580.dtsi
+++ b/arch/arm/boot/dts/mt6580.dtsi
@@ -23,26 +23,31 @@
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		enable-method = "mediatek,mt6580-smp";
 
 		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x0>;
+			clock-frequency = <1700000000>;
 		};
 		cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x1>;
+			clock-frequency = <1700000000>;
 		};
 		cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x2>;
+			clock-frequency = <1700000000>;
 		};
 		cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a7";
 			reg = <0x3>;
+			clock-frequency = <1700000000>;
 		};
 
 	};
@@ -72,6 +77,21 @@
 		};
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
+					  IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <13000000>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.8.1.1.dirty
