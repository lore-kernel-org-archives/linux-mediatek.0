From: Henry Chen <henryc.chen@mediatek.com>
Subject: [PATCH] soc: mediatek: PMIC wrap: Extend th wainting time to 10ms.
Date: Tue, 12 Jul 2016 17:44:36 +0800
Message-ID: <1468316676-14901-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Read data fails sometimes because of a timeout that PMIC cannot transfer data
to PMIC wrap on time, extend the wainting time to 10ms to reduce the failed
rate.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index a003ba2..a5f1093 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -583,7 +583,7 @@ static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
 {
 	unsigned long timeout;
 
-	timeout = jiffies + usecs_to_jiffies(255);
+	timeout = jiffies + usecs_to_jiffies(10000);
 
 	do {
 		if (time_after(jiffies, timeout))
-- 
1.8.1.1.dirty
