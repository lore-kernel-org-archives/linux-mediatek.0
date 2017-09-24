From: Elscha <elscha@freenet.de>
Subject: [Patch] ARM/Mediatek SoC: Remove useless dependency from UX500_SOC_ID
 to COMPILE_TEST
Date: Sun, 24 Sep 2017 17:58:48 +0200
Message-ID: <59C7D638.9070702@freenet.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Remove useless dependency from UX500_SOC_ID to COMPILE_TEST

* This dependency is ignored by the Kbuild scripts (more precisely in
   drivers/soc/Makefile, line 25). Thus, enabling COMPILE_TEST if ARCH_U8500
   is disabled has no effect.
* Further, this code file depends on an ARM specific header (e.g. cputype.h
   in line 18 is specific to the ARM and Unicore32 architectures). Thus,
   compiling this file on other architectures than ARM will result in
   compilation errors.

Signed-off-by:  Sascha El-Sharkawy<elscha@freenet.de>
---
  drivers/soc/ux500/Kconfig |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ux500/Kconfig b/drivers/soc/ux500/Kconfig
index 025a44a..49ed883 100644
--- a/drivers/soc/ux500/Kconfig
+++ b/drivers/soc/ux500/Kconfig
@@ -1,6 +1,6 @@
  config UX500_SOC_ID
  	bool "SoC bus for ST-Ericsson ux500"
-	depends on ARCH_U8500 || COMPILE_TEST
+	depends on ARCH_U8500
  	default ARCH_U8500
  	help
  	  Include support for the SoC bus on the ARM RealView platforms
