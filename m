From: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v6 04/14] soc: mediatek: Refactor polling timeout and documentation
Date: Thu, 20 Jun 2019 10:37:56 +0800
Message-ID: <1560998286-9189-5-git-send-email-weiyi.lu@mediatek.com>
References: <1560998286-9189-1-git-send-email-weiyi.lu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560998286-9189-1-git-send-email-weiyi.lu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>, Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Use USEC_PER_SEC to indicate the polling timeout directly.
And add documentation of scp_domain_data.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 9f52f50..f775b1b 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -21,7 +21,7 @@
 #include <dt-bindings/power/mt8173-power.h>
 
 #define MTK_POLL_DELAY_US   10
-#define MTK_POLL_TIMEOUT    (jiffies_to_usecs(HZ))
+#define MTK_POLL_TIMEOUT    USEC_PER_SEC
 
 #define MTK_SCPD_ACTIVE_WAKEUP		BIT(0)
 #define MTK_SCPD_FWAIT_SRAM		BIT(1)
@@ -108,6 +108,17 @@ enum clk_id {
 
 #define MAX_CLKS	3
 
+/**
+ * struct scp_domain_data - scp domain data for power on/off flow
+ * @name: The domain name.
+ * @sta_mask: The mask for power on/off status bit.
+ * @ctl_offs: The offset for main power control register.
+ * @sram_pdn_bits: The mask for sram power control bits.
+ * @sram_pdn_ack_bits: The mask for sram power control acked bits.
+ * @bus_prot_mask: The mask for single step bus protection.
+ * @clk_id: The basic clocks required by this power domain.
+ * @caps: The flag for active wake-up action.
+ */
 struct scp_domain_data {
 	const char *name;
 	u32 sta_mask;
-- 
1.8.1.1.dirty
