From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 1/3] Document: DT: Add bindings for mediatek MT7623 SoC
 Platform
Date: Tue,  5 Jan 2016 17:24:26 +0100
Message-ID: <1452011068-28300-2-git-send-email-blogic@openwrt.org>
References: <1452011068-28300-1-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1452011068-28300-1-git-send-email-blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Steven=20Liu=20=28=E5=8A=89=E4=BA=BA=E8=B1=AA=29?= <steven.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

This adds a DT binding documentation for the MT7623 SoC from Mediatek.

Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 Documentation/devicetree/bindings/arm/mediatek.txt             |    4 ++++
 Documentation/devicetree/bindings/serial/mtk-uart.txt          |    1 +
 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt |    1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index 618a9199..40e9d32 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -10,6 +10,7 @@ compatible: Must contain one of
    "mediatek,mt6589"
    "mediatek,mt6592"
    "mediatek,mt6795"
+   "mediatek,mt7623"
    "mediatek,mt8127"
    "mediatek,mt8135"
    "mediatek,mt8173"
@@ -29,6 +30,9 @@ Supported boards:
 - Evaluation board for MT6795(Helio X10):
     Required root node properties:
       - compatible = "mediatek,mt6795-evb", "mediatek,mt6795";
+- Evaluation board for MT7623:
+    Required root node properties:
+      - compatible = "mediatek,mt7623-evb", "mediatek,mt7623";
 - MTK mt8127 tablet moose EVB:
     Required root node properties:
       - compatible = "mediatek,mt8127-moose", "mediatek,mt8127";
diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index 2d47add..474f0cf 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -2,6 +2,7 @@
 
 Required properties:
 - compatible should contain:
+  * "mediatek,mt7623-uart" for MT7623 compatible UARTS
   * "mediatek,mt8135-uart" for MT8135 compatible UARTS
   * "mediatek,mt8127-uart" for MT8127 compatible UARTS
   * "mediatek,mt8173-uart" for MT8173 compatible UARTS
diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 64083bc..6bacda1b3 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -5,6 +5,7 @@ Required properties:
 - compatible should contain:
 	* "mediatek,mt6580-timer" for MT6580 compatible timers
 	* "mediatek,mt6589-timer" for MT6589 compatible timers
+	* "mediatek,mt7623-timer" for MT7623 compatible timers
 	* "mediatek,mt8127-timer" for MT8127 compatible timers
 	* "mediatek,mt8135-timer" for MT8135 compatible timers
 	* "mediatek,mt8173-timer" for MT8173 compatible timers
-- 
1.7.10.4
