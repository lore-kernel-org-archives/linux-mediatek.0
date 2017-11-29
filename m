From: RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] Support MT7622 NAND flash controller
Date: Wed, 29 Nov 2017 17:24:43 +0800
Message-ID: <1511947486-7707-1-git-send-email-rogercc.lin@mediatek.com>
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
To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: RogerCC Lin <rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

MT7622 uses an earlier NAND flash controller IP which is similar to
MT2701's, it has less sector size, less max sector number and less
parity bits. This patch can support MT7622 NAND flash controller.

The patch has been verified in UBIFS test, with F59D1G81MB on MT7622
reference board, it works correctly.

RogerCC Lin (3):
  mtd: nand: mtk: update DT bindings
  mtd: nand: mtk: Support different MTK NAND flash controller IP
  mtd: nand: mtk: Support MT7622 NAND flash controller.

 Documentation/devicetree/bindings/mtd/mtk-nand.txt |  11 +-
 drivers/mtd/nand/mtk_ecc.c                         | 137 +++++++++++++--------
 drivers/mtd/nand/mtk_ecc.h                         |  25 +++-
 drivers/mtd/nand/mtk_nand.c                        |  43 +++++--
 4 files changed, 152 insertions(+), 64 deletions(-)

-- 
1.9.1
