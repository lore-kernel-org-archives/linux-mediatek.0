From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] soc: mediatek: Add compile dependency to pmic-wrapper
Date: Wed, 27 May 2015 14:31:05 +0200
Message-ID: <1432729865-32319-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, s.hauer@pengutronix.de, flora.fu@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

The pmic-wrapper calls the reset controller. If CONFIG_RESET_CONTROLLER
is not set, compilation fails with:
drivers/soc/mediatek/mtk-pmic-wrap.c: In function =E2=80=98pwrap_probe=E2=
=80=99:
drivers/soc/mediatek/mtk-pmic-wrap.c:836:2: error: implicit declaration=
 of function =E2=80=98devm_reset_control_get=E2=80=99 [-Werror=3Dimplic=
it-function-declaration]

This patch sets the dependency in the Kconfig file.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfi=
g
index bcdb22d..3c18503 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -4,6 +4,7 @@
 config MTK_PMIC_WRAP
 	tristate "MediaTek PMIC Wrapper Support"
 	depends on ARCH_MEDIATEK
+	depends on RESET_CONTROLLER
 	select REGMAP
 	help
 	  Say yes here to add support for MediaTek PMIC Wrapper found
--=20
1.9.1
