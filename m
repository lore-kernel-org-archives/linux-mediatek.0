From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH 7/9] ARM: mediatek: move mach-mediatek/ to
 platforms/mediatek/
Date: Sun,  3 Apr 2016 23:39:25 +0900
Message-ID: <1459694367-18635-8-git-send-email-yamada.masahiro@socionext.com>
References: <1459694367-18635-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1459694367-18635-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Marcus Cooper <codekipper@gmail.com>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>, Russell King <linux+etnaviv@arm.linux.org.uk>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Olof Johansson <olof@lixom.net>, Maxime Ripard <maxime.ripard@free-electrons.com>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/Kconfig                                          | 2 --
 arch/arm/Makefile                                         | 1 -
 arch/arm/platforms/Kconfig                                | 1 +
 arch/arm/platforms/Makefile                               | 1 +
 arch/arm/{mach-mediatek => platforms/mediatek}/Kconfig    | 0
 arch/arm/{mach-mediatek => platforms/mediatek}/Makefile   | 0
 arch/arm/{mach-mediatek => platforms/mediatek}/mediatek.c | 0
 arch/arm/{mach-mediatek => platforms/mediatek}/platsmp.c  | 0
 8 files changed, 2 insertions(+), 3 deletions(-)
 rename arch/arm/{mach-mediatek => platforms/mediatek}/Kconfig (100%)
 rename arch/arm/{mach-mediatek => platforms/mediatek}/Makefile (100%)
 rename arch/arm/{mach-mediatek => platforms/mediatek}/mediatek.c (100%)
 rename arch/arm/{mach-mediatek => platforms/mediatek}/platsmp.c (100%)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 51e2663..38d9cb7 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -781,8 +781,6 @@ source "arch/arm/mach-mv78xx0/Kconfig"
 
 source "arch/arm/mach-imx/Kconfig"
 
-source "arch/arm/mach-mediatek/Kconfig"
-
 source "arch/arm/mach-mxs/Kconfig"
 
 source "arch/arm/mach-netx/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 923be10..17ccd3f 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -187,7 +187,6 @@ machine-$(CONFIG_ARCH_MOXART)		+= moxart
 machine-$(CONFIG_ARCH_MV78XX0)		+= mv78xx0
 machine-$(CONFIG_ARCH_MVEBU)		+= mvebu
 machine-$(CONFIG_ARCH_MXC)		+= imx
-machine-$(CONFIG_ARCH_MEDIATEK)		+= mediatek
 machine-$(CONFIG_ARCH_MXS)		+= mxs
 machine-$(CONFIG_ARCH_NETX)		+= netx
 machine-$(CONFIG_ARCH_NOMADIK)		+= nomadik
diff --git a/arch/arm/platforms/Kconfig b/arch/arm/platforms/Kconfig
index ce6ed8a..069b6a2 100644
--- a/arch/arm/platforms/Kconfig
+++ b/arch/arm/platforms/Kconfig
@@ -1,5 +1,6 @@
 # This is sorted alphabetically by directory pathname.
 
+source "arch/arm/platforms/mediatek/Kconfig"
 source "arch/arm/platforms/rockchip/Kconfig"
 source "arch/arm/platforms/socfpga/Kconfig"
 source "arch/arm/platforms/sunxi/Kconfig"
diff --git a/arch/arm/platforms/Makefile b/arch/arm/platforms/Makefile
index bf88c66e..3b0a4e7 100644
--- a/arch/arm/platforms/Makefile
+++ b/arch/arm/platforms/Makefile
@@ -1,5 +1,6 @@
 # This list sorted alphanumerically by CONFIG_* macro name.
 
+obj-$(CONFIG_ARCH_MEDIATEK)		+= mediatek/
 obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
 obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/platforms/mediatek/Kconfig
similarity index 100%
rename from arch/arm/mach-mediatek/Kconfig
rename to arch/arm/platforms/mediatek/Kconfig
diff --git a/arch/arm/mach-mediatek/Makefile b/arch/arm/platforms/mediatek/Makefile
similarity index 100%
rename from arch/arm/mach-mediatek/Makefile
rename to arch/arm/platforms/mediatek/Makefile
diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/platforms/mediatek/mediatek.c
similarity index 100%
rename from arch/arm/mach-mediatek/mediatek.c
rename to arch/arm/platforms/mediatek/mediatek.c
diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/platforms/mediatek/platsmp.c
similarity index 100%
rename from arch/arm/mach-mediatek/platsmp.c
rename to arch/arm/platforms/mediatek/platsmp.c
-- 
1.9.1
