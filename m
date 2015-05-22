From: tip-bot for Axel Lin <tipbot@zytor.com>
Subject: [tip:irq/core] irqchip: mtk-sysirq:
  Make mtk_sysirq_of_init return error if ioremap fails
Date: Fri, 22 May 2015 02:10:06 -0700
Message-ID: <tip-e1a96fb861b0781c8ef66a76d0fc6fb6f628f84c@git.kernel.org>
References: <1432220254.29544.1.camel@ingics.com>
Reply-To: jason@lakedaemon.net, linux-kernel@vger.kernel.org,
	  tglx@linutronix.de, hpa@zytor.com,
	  linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
	  mingo@kernel.org, axel.lin@ingics.com, matthias.bgg@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432220254.29544.1.camel@ingics.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Cc: jason@lakedaemon.net, tglx@linutronix.de, linux-kernel@vger.kernel.org, axel.lin@ingics.com, mingo@kernel.org, matthias.bgg@gmail.com, yingjoe.chen@mediatek.com, linux-mediatek@lists.infradead.org, hpa@zytor.com
List-Id: linux-mediatek@lists.infradead.org

Commit-ID:  e1a96fb861b0781c8ef66a76d0fc6fb6f628f84c
Gitweb:     http://git.kernel.org/tip/e1a96fb861b0781c8ef66a76d0fc6fb6f628f84c
Author:     Axel Lin <axel.lin@ingics.com>
AuthorDate: Thu, 21 May 2015 22:57:34 +0800
Committer:  Thomas Gleixner <tglx@linutronix.de>
CommitDate: Fri, 22 May 2015 11:06:47 +0200

irqchip: mtk-sysirq: Make mtk_sysirq_of_init return error if ioremap fails

PTR_ERR(NULL) returns 0 so current code returns 0 if ioremap fails, fix it.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org <linux-mediatek@lists.infradead.org>
Cc: Jason Cooper <jason@lakedaemon.net>
Link: http://lkml.kernel.org/r/1432220254.29544.1.camel@ingics.com
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/irqchip/irq-mtk-sysirq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 04de2d4..15c1303 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -144,7 +144,7 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 	chip_data->intpol_base = ioremap(res.start, size);
 	if (!chip_data->intpol_base) {
 		pr_err("mtk_sysirq: unable to map sysirq register\n");
-		ret = PTR_ERR(chip_data->intpol_base);
+		ret = -ENXIO;
 		goto out_free;
 	}
 
