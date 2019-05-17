From: xiaolei li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 0/4] MTK NAND driver improvements and fixes
Date: Fri, 17 May 2019 09:32:47 +0800
Message-ID: <1558056767.26455.98.camel@mhfsdcap03>
References: <20190507102541.34341-1-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190507102541.34341-1-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: richard-/L3Ra7n9ekc@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Miquel,

Sorry to bother you, but may I ask if it is fine to accept this patch
set now, patches all with your review.

Thanks,
Xiaolei

On Tue, 2019-05-07 at 18:25 +0800, Xiaolei Li wrote:
> The following patch set mainly contains:
> * Fix low level time calculation of read/write cycle to meet tRC_min
>   and tWC_min requirements.
> * Refine RE# pulse width calculation and data sampling to improve read
>   performance.
> * Add CS validity check.
> * Fix oob buffer pointer wrongly setting.
> 
> Changes on v3 relative to:
> --------------------
> 
> tree    : https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/
> branch  : nand/next
> commit  :
>         'commit 1c14fe2167ef ("mtd: nandsim: switch to exec_op interface")
> 
> Patch v3:
> ---------
> - Fix some comment style.
> - Format patch base branch: nand/next
> - Pend to sent patch "mtd: rawnand: mtk: Setup empty page threshold
>   correctly", because it seems that we should confirm this change has no
>   side effect and need more test.
> 
> Patch v2:
> ---------
> - Fix type
> - Reference correct faulty patch
> - Refine code to do calculation and condition in separate steps
> - Fix empty threshold calculation
> 
> Tests:
> ------
> 
> * ubifs and jffs2 are validated on NAND device MT29F16G08ADBCA by
>   'dd' command.
> * all drivers/mtd/tests/* pass.
> * speed test:
>   eraseblock write speed is 11087 KiB/s
>   eraseblock read speed is 19986 KiB/s
>   page write speed is 10689 KiB/s
>   page read speed is 18724 KiB/s
>   2 page write speed is 10611 KiB/s
>   2 page read speed is 18713 KiB/s
>   erase speed is 103696 KiB/s
>   2x multi-block erase speed is 354248 KiB/s
>   4x multi-block erase speed is 350459 KiB/s
>   8x multi-block erase speed is 356173 KiB/s
>   16x multi-block erase speed is 356173 KiB/s
>   32x multi-block erase speed is 358120 KiB/s
>   64x multi-block erase speed is 356173 KiB/s
> 
> Xiaolei Li (4):
>   mtd: rawnand: mtk: Correct low level time calculation of r/w cycle
>   mtd: rawnand: mtk: Improve data sampling timing for read cycle
>   mtd: rawnand: mtk: Add validity check for CE# pin setting
>   mtd: rawnand: mtk: Fix wrongly assigned OOB buffer pointer issue
> 
>  drivers/mtd/nand/raw/mtk_nand.c | 84 +++++++++++++++++++++++++++------
>  1 file changed, 70 insertions(+), 14 deletions(-)
> 
