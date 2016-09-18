From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] ARM: mediatek: clean up mach-mediatek/Makefile
Date: Mon, 19 Sep 2016 03:11:13 +0900
Message-ID: <1474222273-23116-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: linux-arm-kernel@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-mediatek@lists.infradead.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Kbuild descends into arch/arm/mach-mediatek/Makefile only when
CONFIG_ARCH_MEDIATEK is enabled.  So, obj-$(CONFIG_ARCH_MEDIATEK)
is always equivalent to obj-y in this Makefile.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/mach-mediatek/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-mediatek/Makefile b/arch/arm/mach-mediatek/Makefile
index 2116460..dadae67 100644
--- a/arch/arm/mach-mediatek/Makefile
+++ b/arch/arm/mach-mediatek/Makefile
@@ -1,4 +1,2 @@
-ifeq ($(CONFIG_SMP),y)
-obj-$(CONFIG_ARCH_MEDIATEK) += platsmp.o
-endif
-obj-$(CONFIG_ARCH_MEDIATEK) += mediatek.o
+obj-$(CONFIG_SMP)	+= platsmp.o
+obj-y			+= mediatek.o
-- 
1.9.1
