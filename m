From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RESEND,PATCH] phy: phy-mt65xx-usb3: fix test fail of HS receiver sensitivity
Date: Fri, 4 Dec 2015 10:08:56 +0800
Message-ID: <1449194936-31335-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

when use the default value 8 of RG_USB20_SQTH, the HS receiver
sensitivity test of HQA will fail, set it as 2 to fix up the
issue.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/phy/phy-mt65xx-usb3.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/phy-mt65xx-usb3.c b/drivers/phy/phy-mt65xx-usb3.c
index f30b28b..dc480d3 100644
--- a/drivers/phy/phy-mt65xx-usb3.c
+++ b/drivers/phy/phy-mt65xx-usb3.c
@@ -49,6 +49,8 @@
 #define PA6_RG_U2_ISO_EN		BIT(31)
 #define PA6_RG_U2_BC11_SW_EN		BIT(23)
 #define PA6_RG_U2_OTG_VBUSCMP_EN	BIT(20)
+#define PA6_RG_U2_SQTH		GENMASK(3, 0)
+#define PA6_RG_U2_SQTH_VAL(x)	(0xf & (x))
 
 #define U3P_U2PHYACR4		(SSUSB_SIFSLV_U2PHY_COM_BASE + 0x0020)
 #define P2C_RG_USB20_GPIO_CTL		BIT(9)
@@ -165,9 +167,10 @@ static void phy_instance_init(struct mt65xx_u3phy *u3phy,
 		writel(tmp, port_base + U3P_U2PHYDTM0);
 	}
 
-	/* DP/DM BC1.1 path Disable */
 	tmp = readl(port_base + U3P_USBPHYACR6);
-	tmp &= ~PA6_RG_U2_BC11_SW_EN;
+	tmp &= ~PA6_RG_U2_BC11_SW_EN;	/* DP/DM BC1.1 path Disable */
+	tmp &= ~PA6_RG_U2_SQTH;
+	tmp |= PA6_RG_U2_SQTH_VAL(2);
 	writel(tmp, port_base + U3P_USBPHYACR6);
 
 	tmp = readl(port_base + U3P_U3PHYA_DA_REG0);
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
