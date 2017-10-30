From: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2] Improve MTK ECC Engine driver
Date: Mon, 30 Oct 2017 10:39:55 +0800
Message-ID: <1509331196-29412-1-git-send-email-xiaolei.li@mediatek.com>
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
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, rogercc.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

This patch-set is mainly to improve MTK ECC Engine driver, include
- remove dummy ECC IRQ disable setting
- fix infinite ECC decode IRQ issue

Changes on v2 relative to:
--------------------

tree    : https://github.com/bbrezillon/linux-0day
branch  : nand/next
commit  :
        'commit 1f3df4dc088d927683b292118cd8b4eaaf1af573
        Author: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
        Date:   Mon Oct 16 11:51:55 2017 +0200'

Patch v2:
---------
- keep writel(0, ecc->regs + ECC_IRQ_REG(op)) in mtk_ecc_disable(), and
  remove writel(0, ecc->regs + ECC_IRQ_REG(op)) from irq handler. It's
  usually the caller who decides when the IRQ should be enabled/disable.
- add readw(ecc->regs + ECC_DECIRQ_STA) in mtk_ecc_disable() in case there
  is a timeout to wait decode IRQ.

Tests:
------

* ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA
  by 'dd' command.
* all drivers/mtd/tests/* pass.

Xiaolei Li (1):
  mtd: nand: mtk: fix infinite ECC decode IRQ issue

 drivers/mtd/nand/mtk_ecc.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

-- 
1.9.1
