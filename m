From: Chris Coffey <cmc@babblebit.net>
Subject: [PATCH] staging: mt7621-eth: Fix sparse warning in ethtool.c
Date: Wed, 28 Mar 2018 22:18:48 +0100
Message-ID: <20180328211848.11085-1-cmc@babblebit.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devel@driverdev.osuosl.org, Chris Coffey <cmc@babblebit.net>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Include the local ethtool.h header file in mtk_eth_soc.h so
implementation files have centralized access to it.

This fixes the following sparse warning:

drivers/staging/mt7621-eth/ethtool.c:213:6: warning: symbol
'mtk_set_ethtool_ops' was not declared. Should it be static?

Signed-off-by: Chris Coffey <cmc@babblebit.net>
---
 drivers/staging/mt7621-eth/mtk_eth_soc.c | 1 -
 drivers/staging/mt7621-eth/mtk_eth_soc.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-eth/mtk_eth_soc.c b/drivers/staging/mt7621-eth/mtk_eth_soc.c
index cbc7339843..0574e71573 100644
--- a/drivers/staging/mt7621-eth/mtk_eth_soc.c
+++ b/drivers/staging/mt7621-eth/mtk_eth_soc.c
@@ -35,7 +35,6 @@
 
 #include "mtk_eth_soc.h"
 #include "mdio.h"
-#include "ethtool.h"
 
 #define	MAX_RX_LENGTH		1536
 #define MTK_RX_ETH_HLEN		(VLAN_ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN)
diff --git a/drivers/staging/mt7621-eth/mtk_eth_soc.h b/drivers/staging/mt7621-eth/mtk_eth_soc.h
index 443f88d8af..01deeddfdd 100644
--- a/drivers/staging/mt7621-eth/mtk_eth_soc.h
+++ b/drivers/staging/mt7621-eth/mtk_eth_soc.h
@@ -23,6 +23,7 @@
 #include <linux/ethtool.h>
 #include <linux/version.h>
 #include <linux/atomic.h>
+#include "ethtool.h"
 
 /* these registers have different offsets depending on the SoC. we use a lookup
  * table for these
-- 
2.11.0
