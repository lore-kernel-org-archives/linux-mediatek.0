From: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/3] Fix Jffs2 type flash erase problem
Date: Tue, 10 Apr 2018 15:36:54 +0800
Message-ID: <1523345817-42627-1-git-send-email-xiaolei.li@mediatek.com>
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
To: david.oberhollenzer-S6VGOU4v5edDinCvNWH78Q@public.gmane.org, boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Jffs2 clean marker is not written actually, because OOB write length is
set to 0 when do mtd_write(). So, "-j" option of flash_erase is usless now.

This patch adds support to access OOB available size. Then, user can write
clean marker to OOB free area with the minimum size between OOB available
size and 8. This is the same with Jffs2 itself. Please refer the function
jffs2_write_nand_cleanmarker() in the kernel file fs/jffs2/wbuf.c.

And this patch depends on the reviewing patch "mtd: Add sysfs attribute for
mtd OOB available size"[1].

Changes on v2 relative to:
--------------------
tree	: https://github.com/sigma-star/mtd-utils
branch	: master
commit	:
	'commit 80de29a464c7 ("mkfs.ubifs: Allow root entry in device
	 table")'

Patch v2:
---------
- Add legacy_get_mtd_oobavail() and legacy_get_mtd_oobavail1() functions.
- Refine the logic to access OOB available size. First, access
  /sys/class/mtd/mtdX/oobavail. If not exist, then try ioctl "ECCGETLAYOUT".
  If none of them work, then set 0 as default.
- Fix some function description mismatches.

Tests:
------
* do "flash_erase -j" operation on SLC NAND MT29F16G08ADBCA, which page
  size is 4096, oob size is 224.
* mount jffs2 file system, do "dd" test, and there is no problem.

[1] https://patchwork.kernel.org/patch/10319475/

Xiaolei Li (3):
  libmtd: Add support to access OOB available size
  libmtd_legacy: Fix some function description mismatches
  misc-utils: flash_erase: Fix Jffs2 type flash erase problem

 include/libmtd.h         |  2 ++
 lib/libmtd.c             | 14 +++++++++++++
 lib/libmtd_int.h         |  5 +++++
 lib/libmtd_legacy.c      | 51 ++++++++++++++++++++++++++++++++++++++++++++----
 misc-utils/flash_erase.c |  9 +++++----
 5 files changed, 73 insertions(+), 8 deletions(-)

-- 
1.9.1
