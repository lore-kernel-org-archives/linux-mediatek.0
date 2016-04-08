From: Henry Chen <henryc.chen@mediatek.com>
Subject: [PATCH v2 2/3] mfd: mt6397: Checking for null before irq_domain_remove.
Date: Fri, 8 Apr 2016 14:58:48 +0800
Message-ID: <1460098729-25549-2-git-send-email-henryc.chen@mediatek.com>
References: <1460098729-25549-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460098729-25549-1-git-send-email-henryc.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <blogic@openwrt.org>, Sascha Hauer <s.hauer@pengutronix.de>, Flora Fu <flora.fu@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Henry Chen <henryc.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

It is possible that pmic->irq_domain will be NULL in fail_irq error handling.
Check before calling irq_domain_remove.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 drivers/mfd/mt6397-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index a879223..15050cb 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -312,7 +312,8 @@ static int mt6397_probe(struct platform_device *pdev)
 
 fail_irq:
 	if (ret) {
-		irq_domain_remove(pmic->irq_domain);
+		if (pmic->irq_domain)
+			irq_domain_remove(pmic->irq_domain);
 		dev_err(&pdev->dev, "failed to add child devices: %d\n", ret);
 	}
 
-- 
1.8.1.1.dirty
