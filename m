From: Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 5/6] ARM: dts: mt6580: Add device nodes to the MT6580 dtsi file
Date: Thu, 18 Jun 2015 10:46:26 +0800
Message-ID: <1434595587-25466-6-git-send-email-scott.shu@mediatek.com>
References: <Scott Shu <srv_scott.shu@mediatek.com>
 <1434595587-25466-1-git-send-email-scott.shu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1434595587-25466-1-git-send-email-scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: scott.shu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jades.shih-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_wsdupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Miles.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mars.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, MY.Chuang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Scott Shu <scott.shu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

This adds the SCPSYS device node to the MT6580 dtsi file.
---
 arch/arm/boot/dts/mt6580.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/mt6580.dtsi b/arch/arm/boot/dts/mt6580.dtsi
index ae3cdb6..a974830 100644
--- a/arch/arm/boot/dts/mt6580.dtsi
+++ b/arch/arm/boot/dts/mt6580.dtsi
@@ -78,6 +78,11 @@
 		compatible = "simple-bus";
 		ranges;
 
+		scpsys: scpsys@10006000 {
+			compatible = "mediatek,mt6580-scpsys";
+			reg = <0x10006000 0x1000>;
+		};
+
 		timer: timer@10008000 {
 			compatible = "mediatek,mt6580-timer", "mediatek,mt6577-timer";
 			reg = <0x10008000 0x80>;
-- 
1.8.1.1.dirty
