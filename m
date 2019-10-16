From: Wen.Su@mediatek.com (Wen Su)
Date: Wed, 16 Oct 2019 17:39:43 +0800
Subject: [PATCH 1/4] dt-bindings: regulator: Add document for MT6359 regulator
In-Reply-To: <1571218786-15073-1-git-send-email-Wen.Su@mediatek.com>
References: <1571218786-15073-1-git-send-email-Wen.Su@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org
Message-ID: <1571218786-15073-2-git-send-email-Wen.Su@mediatek.com>
To: linux-mediatek@lists.infradead.org

From: "wen.su" <wen.su@mediatek.com>

add dt-binding document for MediaTek MT6359 PMIC

Signed-off-by: wen.su <wen.su at mediatek.com>
---
 .../bindings/regulator/mt6359-regulator.txt        | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mt6359-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6359-regulator.txt
new file mode 100644
index 0000000..645ceb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6359-regulator.txt
@@ -0,0 +1,59 @@
+Mediatek MT6359 Regulator
+
+Required properties:
+- compatible: "mediatek,mt6359-regulator"
+- mt6359regulator: List of regulators provided by this controller. It is named
+  according to its regulator type, buck_<name> and ldo_<name>.
+  The definition for each of these nodes is defined using the standard binding
+  for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
+
+The valid names for regulators are::
+BUCK:
+  buck_vs1, buck_vgpu11, buck_vmodem, buck_vpu, buck_vcore, buck_vs2,
+  buck_vpa, buck_vproc2, buck_vproc1, buck_vcore_sshub
+LDO:
+  ldo_vaud18, ldo_vsim1, ldo_vibr, ldo_vrf12, ldo_vusb, ldo_vsram_proc2,
+  ldo_vio18, ldo_vcamio, ldo_vcn18, ldo_vfe28, ldo_vcn13, ldo_vcn33_1_bt,
+  ldo_vcn13_1_wifi, ldo_vaux18, ldo_vsram_others, ldo_vefuse, ldo_vxo22,
+  ldo_vrfck, ldo_vbif28, ldo_vio28, ldo_vemc, ldo_vcn33_2_bt, ldo_vcn33_2_wifi,
+  ldo_va12, ldo_va09, ldo_vrf18, ldo_vsram_md, ldo_vufs, ldo_vm18, ldo_vbbck,
+  ldo_vsram_proc1, ldo_vsim2, ldo_vsram_others_sshub
+
+Example:
+	pmic {
+		compatible = "mediatek,mt6359";
+
+		mt6359regulator: mt6359regulator {
+			compatible = "mediatek,mt6359-regulator";
+
+			mt6359_vs1_buck_reg: buck_vs1 {
+				regulator-name = "vs1";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <2200000>;
+				regulator-enable-ramp-delay = <0>;
+				regulator-always-on;
+			};
+			mt6359_vgpu11_buck_reg: buck_vgpu11 {
+				regulator-name = "vgpu11";
+				regulator-min-microvolt = <400000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <200>;
+				regulator-always-on;
+				regulator-allowed-modes = <0 1 2>;
+			};
+			mt6359_vaud18_ldo_reg: ldo_vaud18 {
+				compatible = "regulator-fixed";
+				regulator-name = "vaud18";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-enable-ramp-delay = <240>;
+			};
+			mt6359_vsim1_ldo_reg: ldo_vsim1 {
+				regulator-name = "vsim1";
+				regulator-min-microvolt = <1700000>;
+				regulator-max-microvolt = <3100000>;
+				regulator-enable-ramp-delay = <480>;
+			};
+		};
+	};
+
-- 
1.9.1
