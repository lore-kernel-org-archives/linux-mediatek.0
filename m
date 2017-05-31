From: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 0/4] Mediatek MT2712 NAND FLASH Controller driver
Date: Wed, 31 May 2017 16:26:37 +0800
Message-ID: <1496219201-45414-1-git-send-email-xiaolei.li@mediatek.com>
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
To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

The following patch-set adds support for Mediatek MT2712 NAND FLASH
Controller.

Changes on v5 relative to:
--------------------

tree    : https://github.com/bbrezillon/linux-0day
branch  : nand/next
commit  :
        'commit 2b12c057cc28 ("mtd: nand: brcmnand: Check flash #WP pin
         status before nand erase/program")'

Patch v5:
---------
- rename variable j as closest_spare in function mtk_nfc_set_spare_per_sector
- remove unneeded parenthesis
- add define MTK_NFC_MIN_SPARE to check whether there is no entry that is
  less than *sps.

Patch v4:
---------
- remove spare size array sort. iterate over all entries of spare size
  table and pick the best one.

Patch v3:
---------
- separate patches into 4.
- rename struct mtk_ecc_devdata and struct mtk_nfc_devdata to struct
  mtk_ecc_caps and struct mtk_nfc_caps respectively.
- add variables const u8 *ecc_strength and u8 num_ecc_strength into struct
  mtk_ecc_caps, and remove u8 max_ecc_strength.
- rename variabl u32 temp in function mtk_ecc_probe to u32 max_eccdata_size.
- remove ECC_CNFG_xBIT define, use a for loop to do ecc hw configuration.
- remove const u32 *spare_format from struct mtk_nfc_caps, and add variables
  u8 num_spare_size and u8 pageformat_spare_shift.
- remove PAGEFMT_SPARE_ define, use a for loop to do nfc hw configuration.
- sort spare size array before setting spare size.
- fix coding style issue.

Patch v2:
---------
- sperate patches into 3.
- refine DT bindings documentation about NFC and ECC compatible.
- use ecc->devdata->encode_parity_reg0 and ecc->devdata->err_mask
  directly, but hide them in define.

Tests:
------

* ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA
  by 'dd' command.
* all drivers/mtd/tests/* pass.
* speed test:
  eraseblock write speed is 8318 KiB/s
  eraseblock read speed is 11374 KiB/s
  page write speed is 8155 KiB/s
  page read speed is 11290 KiB/s
  2 page write speed is 8217 KiB/s
  2 page read speed is 11354 KiB/s
  erase speed is 116472 KiB/s
  2x multi-block erase speed is 352978 KiB/s
  4x multi-block erase speed is 359750 KiB/s
  8x multi-block erase speed is 361484 KiB/s
  16x multi-block erase speed is 364116 KiB/s
  32x multi-block erase speed is 364116 KiB/s
  64x multi-block erase speed is 364116 KiB/s

Xiaolei Li (4):
  mtd: nand: mediatek: update DT bindings
  mtd: nand: mediatek: refine register NFI_PAGEFMT setting
  mtd: nand: mediatek: add support for different MTK NAND FLASH
    Controller IP
  mtd: nand: mediatek: add support for MT2712 NAND FLASH Controller

 Documentation/devicetree/bindings/mtd/mtk-nand.txt |   5 +-
 drivers/mtd/nand/mtk_ecc.c                         | 218 ++++++++++-----------
 drivers/mtd/nand/mtk_ecc.h                         |   2 +-
 drivers/mtd/nand/mtk_nand.c                        | 187 +++++++++---------
 4 files changed, 206 insertions(+), 206 deletions(-)

--
1.9.1
