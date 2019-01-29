From: Nishad Kamdar <nishadkamdar@gmail.com>
Subject: [PATCH] MIPS: Select PINCTRL_RT2880 when RALINK is enabled
Date: Tue, 29 Jan 2019 20:55:27 +0530
Message-ID: <20190129152522.GA24872@nishad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Joe Perches <joe@perches.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org, Nishad Kamdar <nishadkamdar@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

This patch selects config PINCTRL_RT2880 when config RALINK is
enabled as per drivers/staging/mt7621-pinctrl/TODO list. PINCTRL
is also selected when RALINK is enabled to avoid config dependency
warnings.

Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 arch/mips/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e2fc88da0223..cea529cf6284 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -623,6 +623,8 @@ config RALINK
 	select CLKDEV_LOOKUP
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
+	select PINCTRL
+	select PINCTRL_RT2880
 
 config SGI_IP22
 	bool "SGI IP22 (Indy/Indigo2)"
-- 
2.17.1
