From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>
Subject: [PATCH net 5/5] net: wireless: mt76: fix similar warning reported by kbuild test robot
Date: Fri, 10 May 2019 11:35:18 +0200
Message-ID: <1557480918-9627-6-git-send-email-ynezz@true.cz>
References: <1557480918-9627-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1557480918-9627-1-git-send-email-ynezz-knWk7/PSn+s@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

This patch fixes following (similar) warning reported by kbuild test robot:

 In function ‘memcpy’,
  inlined from ‘smsc75xx_init_mac_address’ at drivers/net/usb/smsc75xx.c:778:3,
  inlined from ‘smsc75xx_bind’ at drivers/net/usb/smsc75xx.c:1501:2:
  ./include/linux/string.h:355:9: warning: argument 2 null where non-null expected [-Wnonnull]
  return __builtin_memcpy(p, q, size);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/net/usb/smsc75xx.c: In function ‘smsc75xx_bind’:
  ./include/linux/string.h:355:9: note: in a call to built-in function ‘__builtin_memcpy’

I've replaced the offending memcpy with ether_addr_copy, because I'm
100% sure, that of_get_mac_address can't return NULL as it returns valid
pointer or ERR_PTR encoded value, nothing else.

I'm hesitant to just change IS_ERR into IS_ERR_OR_NULL check, as this
would make the warning disappear also, but it would be confusing to
check for impossible return value just to make a compiler happy.

I'm now changing all occurencies of memcpy to ether_addr_copy after the
of_get_mac_address call, as it's very likely, that we're going to get
similar reports from kbuild test robot in the future.

Fixes: d31a36b5f407 ("net: wireless: support of_get_mac_address new ERR_PTR error")
Reported-by: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Petr Štetiar <ynezz-knWk7/PSn+s@public.gmane.org>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 04964937a3af..b7a49ae6b327 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -95,7 +95,7 @@
 
 	mac = of_get_mac_address(np);
 	if (!IS_ERR(mac))
-		memcpy(dev->macaddr, mac, ETH_ALEN);
+		ether_addr_copy(dev->macaddr, mac);
 #endif
 
 	if (!is_valid_ether_addr(dev->macaddr)) {
-- 
1.9.1
