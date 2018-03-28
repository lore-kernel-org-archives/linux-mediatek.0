From: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] mtd: Fix some function description mismatches in mtdcore.c
Date: Wed, 28 Mar 2018 17:13:57 +0800
Message-ID: <1522228438-64034-2-git-send-email-xiaolei.li@mediatek.com>
References: <1522228438-64034-1-git-send-email-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1522228438-64034-1-git-send-email-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

In mtdcore.c, some function descriptions do not match function
definitions. Just fix these mismatches.

Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/mtd/mtdcore.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 28553c8..413ea9b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -419,7 +419,7 @@ int mtd_wunit_to_pairing_info(struct mtd_info *mtd, int wunit,
 EXPORT_SYMBOL_GPL(mtd_wunit_to_pairing_info);
 
 /**
- * mtd_wunit_to_pairing_info - get wunit from pairing information
+ * mtd_pairing_info_to_wunit - get wunit from pairing information
  * @mtd: pointer to new MTD device info structure
  * @info: pairing information struct
  *
@@ -1525,9 +1525,9 @@ int mtd_ooblayout_get_databytes(struct mtd_info *mtd, u8 *databuf,
 EXPORT_SYMBOL_GPL(mtd_ooblayout_get_databytes);
 
 /**
- * mtd_ooblayout_get_eccbytes - set data bytes into the oob buffer
+ * mtd_ooblayout_set_databytes - set data bytes into the oob buffer
  * @mtd: mtd info structure
- * @eccbuf: source buffer to get data bytes from
+ * @databuf: source buffer to get data bytes from
  * @oobbuf: OOB buffer
  * @start: first ECC byte to set
  * @nbytes: number of ECC bytes to set
@@ -1559,7 +1559,7 @@ int mtd_ooblayout_count_freebytes(struct mtd_info *mtd)
 EXPORT_SYMBOL_GPL(mtd_ooblayout_count_freebytes);
 
 /**
- * mtd_ooblayout_count_freebytes - count the number of ECC bytes in OOB
+ * mtd_ooblayout_count_eccbytes - count the number of ECC bytes in OOB
  * @mtd: mtd info structure
  *
  * Works like mtd_ooblayout_count_bytes(), except it count ECC bytes.
-- 
1.9.1
