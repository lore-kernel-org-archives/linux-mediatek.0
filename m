From: Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 2/2] mfd: mt6397: use DEFINE_RES_* helpers to define RTC resources
Date: Tue, 18 Jun 2019 17:43:47 +0200
Message-ID: <20190618154347.16991-2-fparent@baylibre.com>
References: <20190618154347.16991-1-fparent@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618154347.16991-1-fparent@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>
List-Id: linux-mediatek@lists.infradead.org

Use the DEFINE_RES_{MEM,IRQ} to define the RTC reosurce for the MT6397
PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/mfd/mt6397-core.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 190ed86ad93e..1e315712870b 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -23,16 +23,8 @@
 #define MT6397_CID_CODE		0x97
 
 static const struct resource mt6397_rtc_resources[] = {
-	{
-		.start = MT6397_RTC_BASE,
-		.end   = MT6397_RTC_BASE + MT6397_RTC_SIZE,
-		.flags = IORESOURCE_MEM,
-	},
-	{
-		.start = MT6397_IRQ_RTC,
-		.end   = MT6397_IRQ_RTC,
-		.flags = IORESOURCE_IRQ,
-	},
+	DEFINE_RES_MEM(MT6397_RTC_BASE, MT6397_RTC_SIZE),
+	DEFINE_RES_IRQ(MT6397_IRQ_RTC),
 };
 
 static const struct resource mt6323_keys_resources[] = {
-- 
2.20.1
