From: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/5] Improve MTK NAND driver
Date: Fri, 23 Jun 2017 15:12:23 +0800
Message-ID: <1498201948-39088-1-git-send-email-xiaolei.li@mediatek.com>
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
To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jie.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

The following patch set mainly contains:
* optimize ecc irq setting
* remove redundant code in nfi/ecc resume functions
* support ->setup_data_interface() hook, to optimize driver performance

Changes relative to:
--------------------

tree    : https://github.com/bbrezillon/linux-0day
branch  : nand/next
commit  :
        'commit c25030acf920 ("mtd: nand: denali: avoid magic numbers and
         rename for clarification")'

Tests:
------

* suspend/resume function check through commands:
  echo mem > /sys/power/state
  cat /sys/kernel/debug/suspend_stats
* ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA
  by 'dd' command and iozone.
* all drivers/mtd/tests/* pass.
* speed test:
  eraseblock write speed is 10520 KiB/s
  eraseblock read speed is 17714 KiB/s
  page write speed is 10365 KiB/s
  page read speed is 17506 KiB/s
  2 page write speed is 10439 KiB/s
  2 page read speed is 17626 KiB/s
  erase speed is 64427 KiB/s
  2x multi-block erase speed is 324435 KiB/s
  4x multi-block erase speed is 331659 KiB/s
  8x multi-block erase speed is 332332 KiB/s
  16x multi-block erase speed is 333008 KiB/s
  32x multi-block erase speed is 334367 KiB/s
  64x multi-block erase speed is 333008 KiB/s

Xiaolei Li (5):
  mtd: nand: mtk: fix incorrect register setting order about ecc irq
  mtd: nand: mtk: disable ecc irq when writing page with hwecc
  mtd: nand: mtk: remove unneeded mtk_nfc_hw_init from mtk_nfc_resume
  mtd: nand: mtk: remove unneeded mtk_ecc_hw_init from mtk_ecc_resume
  mtd: nand: mtk: add ->setup_data_interface() hook

 drivers/mtd/nand/mtk_ecc.c  | 26 ++++++-------
 drivers/mtd/nand/mtk_nand.c | 92 ++++++++++++++++++++++++++++++++++++---------
 2 files changed, 88 insertions(+), 30 deletions(-)

--
1.9.1
