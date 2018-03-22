From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] staging: mt7621-gpio: mt7621: make symbol gc_map static
Date: Thu, 22 Mar 2018 02:09:25 +0000
Message-ID: <1521684565-76447-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <blogic@openwrt.org>, NeilBrown <neil@brown.name>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Fixes the following sparse warning:

drivers/staging/mt7621-gpio/gpio-mt7621.c:47:3: warning:
 symbol 'gc_map' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/mt7621-gpio/gpio-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-gpio/gpio-mt7621.c b/drivers/staging/mt7621-gpio/gpio-mt7621.c
index 5c57abe..d00c1cd 100644
--- a/drivers/staging/mt7621-gpio/gpio-mt7621.c
+++ b/drivers/staging/mt7621-gpio/gpio-mt7621.c
@@ -38,7 +38,7 @@ enum mediatek_gpio_reg {
 static int mediatek_gpio_irq;
 static struct irq_domain *mediatek_gpio_irq_domain;
 
-struct mtk_gc {
+static struct mtk_gc {
 	struct gpio_chip chip;
 	spinlock_t lock;
 	int bank;
