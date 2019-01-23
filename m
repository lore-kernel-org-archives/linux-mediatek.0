From: Nishad Kamdar <nishadkamdar@gmail.com>
Subject: [PATCH] staging: mt7621-pinctrl: Remove space after cast
Date: Wed, 23 Jan 2019 22:01:26 +0530
Message-ID: <20190123163122.GA4807@nishad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: NeilBrown <neil@brown.name>, Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Kees Cook <keescook@chromium.org>, John Crispin <blogic@openwrt.org>, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Nishad Kamdar <nishadkamdar@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

This patch removes space after a cast as it
is not needed.
Issue found by checkpatch.

Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
index 80e7067cfb79..3e959fa73703 100644
--- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
+++ b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
@@ -363,7 +363,7 @@ static int rt2880_pinmux_probe(struct platform_device *pdev)
 		}
 
 		range = devm_kzalloc(p->dev, sizeof(*range) + 4, GFP_KERNEL);
-		range->name = name = (char *) &range[1];
+		range->name = name = (char *)&range[1];
 		sprintf(name, "pio");
 		range->npins = __be32_to_cpu(*ngpio);
 		range->base = __be32_to_cpu(*gpiobase);
-- 
2.17.1
