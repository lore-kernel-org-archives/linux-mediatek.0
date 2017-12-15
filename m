From: <sean.wang@mediatek.com>
Subject: [PATCH v3 net-next 3/3] net: dsa: mediatek: update MAINTAINERS entry with MediaTek switch driver
Date: Fri, 15 Dec 2017 12:47:02 +0800
Message-ID: <1e859a1b831307c478d6e0928dcd8f6fceb4056c.1513312600.git.sean.wang@mediatek.com>
References: <cover.1513312600.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1513312600.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net, andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

I work for MediaTek and maintain SoC targeting to home gateway and
also will keep extending and testing the function from MediaTek
switch.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c86781b..90ca7f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8728,6 +8728,13 @@ L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/ethernet/mediatek/
 
+MEDIATEK SWITCH DRIVER
+M:	Sean Wang <sean.wang@mediatek.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/dsa/mt7530.*
+F:	net/dsa/tag_mtk.c
+
 MEDIATEK JPEG DRIVER
 M:	Rick Chang <rick.chang@mediatek.com>
 M:	Bin Liu <bin.liu@mediatek.com>
-- 
2.7.4
