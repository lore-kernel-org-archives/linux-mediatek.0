From: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH 1/4] WIP: dt-bindings: mediatek: mt8183: Add #reset-cells
Date: Fri, 27 Sep 2019 17:26:54 +0800
Message-ID: <1569576417-20663-2-git-send-email-jiaxin.yu@mediatek.com>
References: <1569576417-20663-1-git-send-email-jiaxin.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1569576417-20663-1-git-send-email-jiaxin.yu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: broonie@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, linux@roeck-us.net, wim@linux-watchdog.org
Cc: alsa-devel@alsa-project.org, yong.liang@mediatek.com, "yong.liang" <yong.liang@mediatek.corp-partner.google.com>, lgirdwood@gmail.com, jiaxin.yu@mediatek.com, perex@perex.cz, tzungbi@google.com, linux-mediatek@lists.infradead.org, eason.yen@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: "yong.liang" <yong.liang@mediatek.corp-partner.google.com>

Add #reset-cells property and update example.

Signed-off-by: yong.liang <yong.liang@mediatek.com>
---
 .../devicetree/bindings/watchdog/mtk-wdt.txt        |  9 ++++++---
 .../dt-bindings/reset-controller/mt8183-resets.h    | 13 +++++++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
index 3ee625d0812f..ecb9ff784832 100644
--- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
@@ -16,11 +16,14 @@ Required properties:
 
 Optional properties:
 - timeout-sec: contains the watchdog timeout in seconds.
+- #reset-cells: Should be 1.
 
 Example:
 
-wdt: watchdog@10000000 {
-	compatible = "mediatek,mt6589-wdt";
-	reg = <0x10000000 0x18>;
+watchdog: watchdog@10007000 {
+	compatible = "mediatek,mt8183-wdt",
+		     "mediatek,mt6589-wdt";
+	reg = <0 0x10007000 0 0x100>;
 	timeout-sec = <10>;
+	#reset-cells = <1>;
 };
diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
index 8804e34ebdd4..47dadcf3fd24 100644
--- a/include/dt-bindings/reset-controller/mt8183-resets.h
+++ b/include/dt-bindings/reset-controller/mt8183-resets.h
@@ -78,4 +78,17 @@
 #define MT8183_INFRACFG_AO_I2C7_SW_RST				126
 #define MT8183_INFRACFG_AO_I2C8_SW_RST				127
 
+#define MT8183_TOPRGU_MM_SW_RST                                 1
+#define MT8183_TOPRGU_MFG_SW_RST                                2
+#define MT8183_TOPRGU_VENC_SW_RST                               3
+#define MT8183_TOPRGU_VDEC_SW_RST                               4
+#define MT8183_TOPRGU_IMG_SW_RST                                5
+#define MT8183_TOPRGU_MD_SW_RST                                 7
+#define MT8183_TOPRGU_CONN_SW_RST                               9
+#define MT8183_TOPRGU_CONN_MCU_SW_RST                           12
+#define MT8183_TOPRGU_IPU0_SW_RST                               14
+#define MT8183_TOPRGU_IPU1_SW_RST                               15
+#define MT8183_TOPRGU_AUDIO_SW_RST                              17
+#define MT8183_TOPRGU_CAMSYS_SW_RST                             18
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
-- 
2.18.0
