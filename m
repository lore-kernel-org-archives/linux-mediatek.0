From: Nishad Kamdar <nishadkamdar@gmail.com>
Subject: [PATCH] staging: mt7621-pinctrl: Test devm_kzalloc for failure while
 improving the code
Date: Tue, 29 Jan 2019 21:15:12 +0530
Message-ID: <20190129154507.GA25365@nishad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>
Cc: NeilBrown <neil@brown.name>, Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

This patch tests the return of devm_kzalloc for failure and
improves the code.

Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
index 3e959fa73703..9b52d44abef1 100644
--- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
+++ b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
@@ -350,7 +350,6 @@ static int rt2880_pinmux_probe(struct platform_device *pdev)
 	for_each_compatible_node(np, NULL, "ralink,rt2880-gpio") {
 		const __be32 *ngpio, *gpiobase;
 		struct pinctrl_gpio_range *range;
-		char *name;
 
 		if (!of_device_is_available(np))
 			continue;
@@ -362,9 +361,10 @@ static int rt2880_pinmux_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 
-		range = devm_kzalloc(p->dev, sizeof(*range) + 4, GFP_KERNEL);
-		range->name = name = (char *)&range[1];
-		sprintf(name, "pio");
+		range = devm_kzalloc(p->dev, sizeof(*range), GFP_KERNEL);
+		if (!range)
+			return -ENOMEM;
+		range->name = "pio";
 		range->npins = __be32_to_cpu(*ngpio);
 		range->base = __be32_to_cpu(*gpiobase);
 		range->pin_base = range->base;
-- 
2.17.1
