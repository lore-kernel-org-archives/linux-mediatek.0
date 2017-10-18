From: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [RFC 12/12] ARM64: dts: marvell: use reworked NAND controller driver
 on Armada 7K/8K
Date: Wed, 18 Oct 2017 16:36:29 +0200
Message-ID: <20171018143629.29302-13-miquel.raynal__40667.7395724275$1508337830$gmane$org@free-electrons.com>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20171018143629.29302-1-miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Kamal Dasu <kdasu.kdev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hanna Hawa <hannah-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ofer Heifetz <oferh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Change the bindings to use the reworked Marvell NAND controller driver.
Also adapt the nand controller node organization to distinguish which
property is relevant for the controller, and which one is NAND chip
specific. Expose the partitions as a subnode of the NAND chip.

Remove the 'marvell,nand-enable-arbiter' property, inefective with
Armada boards.

Signed-off-by: Miquel Raynal <miquel.raynal-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     | 47 +++++++++++++---------
 .../boot/dts/marvell/armada-cp110-master.dtsi      |  6 +--
 .../arm64/boot/dts/marvell/armada-cp110-slave.dtsi |  6 +--
 3 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
index 3cb4e81f6415..cd0290613eea 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -144,32 +144,41 @@
 	};
 };
 
-&cpm_nand {
+&cpm_nand_controller {
 	/*
 	 * SPI on CPM and NAND have common pins on this board. We can
-	 * use only one at a time. To enable the NAND (whihch will
+	 * use only one at a time. To enable the NAND (which will
 	 * disable the SPI), the "status = "okay";" line have to be
 	 * added here.
 	 */
-	num-cs = <1>;
 	pinctrl-0 = <&nand_pins>, <&nand_rb>;
 	pinctrl-names = "default";
-	nand-ecc-strength = <4>;
-	nand-ecc-step-size = <512>;
-	marvell,nand-enable-arbiter;
-	nand-on-flash-bbt;
-
-	partition@0 {
-		label = "U-Boot";
-		reg = <0 0x200000>;
-	};
-	partition@200000 {
-		label = "Linux";
-		reg = <0x200000 0xe00000>;
-	};
-	partition@1000000 {
-		label = "Filesystem";
-		reg = <0x1000000 0x3f000000>;
+
+	nand@0 {
+		reg = <0>;
+		marvell,rb = <0>;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+
+		partitions {
+
+			partition@0 {
+				label = "U-Boot";
+				reg = <0 0x200000>;
+			};
+
+			partition@200000 {
+				label = "Linux";
+				reg = <0x200000 0xe00000>;
+			};
+
+			partition@1000000 {
+				label = "Filesystem";
+				reg = <0x1000000 0x3f000000>;
+			};
+
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
index f203f7300194..c209f2f93b6c 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
@@ -268,14 +268,14 @@
 				status = "disabled";
 			};
 
-			cpm_nand: nand@720000 {
+			cpm_nand_controller: nand@720000 {
 				/*
 				 * Due to the limiation of the pin available
 				 * this controller is only usable on the CPM
 				 * for A7K and on the CPS for A8K.
 				 */
-				compatible = "marvell,armada-8k-nand",
-					     "marvell,armada370-nand";
+				compatible = "marvell,armada-8k-nand-controller",
+					     "marvell,armada370-nand-controller";
 				reg = <0x720000 0x54>;
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
index 7d78767d3024..22789485d77e 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
@@ -269,14 +269,14 @@
 				status = "disabled";
 			};
 
-			cps_nand: nand@720000 {
+			cps_nand_controller: nand@720000 {
 				/*
 				 * Due to the limiation of the pin available
 				 * this controller is only usable on the CPM
 				 * for A7K and on the CPS for A8K.
 				 */
-				compatible = "marvell,armada370-nand",
-					     "marvell,armada370-nand";
+				compatible = "marvell,armada-8k-nand-controller",
+					     "marvell,armada370-nand-controller";
 				reg = <0x720000 0x54>;
 				#address-cells = <1>;
 				#size-cells = <1>;
-- 
2.11.0
