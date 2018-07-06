From: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH] mt76: mt76x0_burst_read_regs() can be static
Date: Fri, 6 Jul 2018 22:48:58 +0800
Message-ID: <20180706144857.GA29077@lkp-wsm-ep1>
References: <1530875029-26274-13-git-send-email-sgruszka@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1530875029-26274-13-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jakub Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>, Michal Schmidt <mschmidt-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org


Fixes: c1f1ff1a3d63 ("mt76: Kconfig and Makefile for mt76x0 driver")
Signed-off-by: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 mcu.c |    4 ++--
 phy.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
index aafa3f3..0c9da79 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.c
@@ -341,8 +341,8 @@ int mt76x0_burst_write_regs(struct mt76x0_dev *dev, u32 offset,
 					data + cnt, n - cnt);
 }
 
-int mt76x0_burst_read_regs(struct mt76x0_dev *dev, u32 base,
-			   struct mt76_reg_pair *data, int n)
+static int mt76x0_burst_read_regs(struct mt76x0_dev *dev, u32 base,
+				  struct mt76_reg_pair *data, int n)
 {
 	const int max_vals_per_cmd = INBAND_PACKET_MAX_LEN / 4 - 1;
 	struct sk_buff *skb;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
index 0830280..e52a506 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
@@ -986,7 +986,7 @@ mt76x0_rf_init(struct mt76x0_dev *dev)
 	rf_set(dev, MT_RF(0, 4), 0x80);
 }
 
-void mt76x0_ant_select(struct mt76x0_dev *dev)
+static void mt76x0_ant_select(struct mt76x0_dev *dev)
 {
 	/* Single antenna mode. */
 	mt76_rmw(dev, MT_WLAN_FUN_CTRL, BIT(5), BIT(6));
