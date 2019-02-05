From: Frederic Chen <frederic.chen@mediatek.com>
Subject: [RFC PATCH V0 3/7] [media] dt-bindings: mt8183: Added CAM-SMEM
 dt-bindings
Date: Tue, 5 Feb 2019 14:42:42 +0800
Message-ID: <1549348966-14451-4-git-send-email-frederic.chen@mediatek.com>
References: <1549348966-14451-1-git-send-email-frederic.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1549348966-14451-1-git-send-email-frederic.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, christie.yu@mediatek.com, zwisler@chromium.org, linux-mediatek@lists.infradead.org, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

From: Jungo Lin <jungo.lin@mediatek.com>

This patch adds the DT binding documentation for the shared memory
between Pass 1 unit of the camera ISP system and the co-processor
in Mediatek SoCs.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
---
 .../bindings/media/mediatek,cam_smem.txt           | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,cam_smem.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek,cam_smem.txt b/Documentation/devicetree/bindings/media/mediatek,cam_smem.txt
new file mode 100644
index 0000000..d0d9c17
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,cam_smem.txt
@@ -0,0 +1,32 @@
+Mediatek Camera ISP Pass 1 Shared Memory Device
+
+Mediatek Camera ISP Pass 1 Shared Memory Device is used to manage shared
+memory among CPU, Camera ISP Pass 1 hardware and coprocessor. The Camera
+ISP Pass 1 is a hardware unit for processing image signal from the image
+sensor. Camera ISP Pass 1 is responsible for RAW processing and 3A tuning.
+
+It is associated with a reserved memory region
+(Please see Documentation\devicetree\bindings\reserved-memory\mediatek,
+reserve-memory-cam_smem.txt) and and provides the context to
+allocate memory with dma addresses.
+
+Required properties:
+- compatible: Should be "mediatek,cam_smem"
+
+- iommus: should point to the respective IOMMU block with master port
+  as argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+
+- mediatek,larb: must contain the local arbiters in the current SOCs, see
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  for details.
+
+Example:
+	cam_smem: cam_smem {
+		compatible = "mediatek,cam_smem";
+		mediatek,larb = <&larb3>,
+				<&larb6>;
+		iommus = <&iommu M4U_PORT_CAM_LSCI0>,
+				<&iommu M4U_PORT_CAM_LSCI1>,
+				<&iommu M4U_PORT_CAM_BPCI>;
+	};
-- 
1.9.1
