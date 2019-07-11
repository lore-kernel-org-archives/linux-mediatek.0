From: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 1/3] dt-bindings: soc: Add MT8183 emi dt-bindings
Date: Thu, 11 Jul 2019 15:10:00 +0800
Message-ID: <1562829002-24650-2-git-send-email-xixi.chen@mediatek.com>
References: <1562829002-24650-1-git-send-email-xixi.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1562829002-24650-1-git-send-email-xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Add emi dt-bindings of MT8183 in binding document.

Signed-off-by: Xi Chen <xixi.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../bindings/memory-controllers/mediatek,emi.txt           | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,emi.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,emi.txt b/Documentation/devicetree/bindings/memory-controllers/mediatek,emi.txt
new file mode 100644
index 0000000..14676d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,emi.txt
@@ -0,0 +1,14 @@
+EMI (External Memory Interface)
+  EMI is a HW module which processing memory read/write requests to DRAM.
+It makes memory access more efficiently .
+
+Required properties:
+- compatible : must be one of :
+	"mediatek,mt8183-emi"
+- reg : the central emi register base and size of the EMI HW.
+
+Example:
+	emi@10219000 {
+		compatible = "mediatek,mt8183-emi";
+		reg = <0 0x10219000 0 0x1000>; /* CEN EMI */
+	};
-- 
1.9.1
