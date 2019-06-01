From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH net-next v1 0/6] Add MT7629 ethernet support
Date: Sat, 1 Jun 2019 08:03:09 +0800
Message-ID: <1559347395-14058-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nbd-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

MT7629 inlcudes two sets of SGMIIs used for external switch or PHY, and embedded
switch (ESW) via GDM1, GePHY via GMAC2, so add several patches in the series to
make the code base common with the old SoCs.

The patch 1, 3 and 6, adds extension for SGMII to have the hardware configured
for 1G, 2.5G and AN to fit the capability of the target PHY. In patch 6 could be
an example showing how to use these configurations for underlying PHY speed to
match up the link speed of the target PHY.

The patch 4 is used for automatically configured the hardware path from GMACx to
the target PHY by the description in deviceetree topology to determine the
proper value for the corresponding MUX.

The patch 2 and 5 is for the update for MT7629 including dt-binding document and
its driver.

Sean Wang (6):
  dt-bindings: clock: mediatek: Add an extra required property to
    sgmiisys
  dt-bindings: net: mediatek: Add support for MediaTek MT7629 SoC
  net: ethernet: mediatek: Extend SGMII related functions
  net: ethernet: mediatek: Integrate hardware path from GMAC to PHY
    variants
  net: ethernet: mediatek: Add MT7629 ethernet support
  arm64: dts: mt7622: Enlarge the SGMII register range

 .../arm/mediatek/mediatek,sgmiisys.txt        |   2 +
 .../devicetree/bindings/net/mediatek-net.txt  |  14 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   3 +-
 drivers/net/ethernet/mediatek/Makefile        |   3 +-
 drivers/net/ethernet/mediatek/mtk_eth_path.c  | 323 ++++++++++++++++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  97 +++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h   | 177 +++++++++-
 drivers/net/ethernet/mediatek/mtk_sgmii.c     | 105 ++++++
 8 files changed, 647 insertions(+), 77 deletions(-)
 create mode 100644 drivers/net/ethernet/mediatek/mtk_eth_path.c
 create mode 100644 drivers/net/ethernet/mediatek/mtk_sgmii.c

-- 
2.17.1
