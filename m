From: <sean.wang@mediatek.com>
Subject: [PATCH] rtc: mt7622: fix module autoloading for OF platform drivers
Date: Mon, 26 Mar 2018 18:05:52 +0800
Message-ID: <4231c0b6038764f68324297a40b18b15ecda5a92.1522055289.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it, alexandre.belloni@free-electrons.com
Cc: linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

It's required to create a modules.alias via MODULE_DEVICE_TABLE helper
for the OF platform driver. Otherwise, module autoloading cannot work.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/rtc/rtc-mt7622.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt7622.c b/drivers/rtc/rtc-mt7622.c
index d79b9ae..147252f 100644
--- a/drivers/rtc/rtc-mt7622.c
+++ b/drivers/rtc/rtc-mt7622.c
@@ -307,6 +307,7 @@ static const struct of_device_id mtk_rtc_match[] = {
 	{ .compatible = "mediatek,soc-rtc" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, mtk_rtc_match);
 
 static int mtk_rtc_probe(struct platform_device *pdev)
 {
-- 
2.7.4
