From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 4/7] [DSA] add support for GMAC2 wired to ext
Date: Tue, 11 Dec 2018 20:33:11 +0100
Message-ID: <20181211193314.10695-4-frank-w@public-files.de>
References: <20181211193314.10695-1-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181211193314.10695-1-frank-w@public-files.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: linux-mediatek@lists.infradead.org

based on
https://github.com/openwrt/openwrt/blob/master/target/linux/mediatek/patches-4.14/0032-net-dsa-mediatek-add-support-for-GMAC2-wired-to-ext-.patch

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/dsa/mt7530.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index a5de9bffe5be..a6a15a063e3e 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1277,6 +1277,11 @@ mt7530_setup(struct dsa_switch *ds)
 	val = mt7530_read(priv, MT7530_MHWTRAP);
 	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
 	val |= MHWTRAP_MANUAL;
+	if (!dsa_is_cpu_port(ds, 5)) {
+		val |= MHWTRAP_P5_DIS;
+		val |= MHWTRAP_P5_MAC_SEL;
+		val |= MHWTRAP_P5_RGMII_MODE;
+	}
 	mt7530_write(priv, MT7530_MHWTRAP, val);
 
 	/* Enable and reset MIB counters */
-- 
2.17.1
