From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 0/1] Re-license MTK NAND driver
Date: Thu, 25 Apr 2019 12:47:36 +0200
Message-ID: <60757393-f040-b194-9594-e8a387792695@gmail.com>
References: <20190425015552.42638-1-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190425015552.42638-1-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org
Cc: daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yellowriver2010-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Adding Boris new email address.

On 25/04/2019 03:55, Xiaolei Li wrote:
> Hello,
> 
> Currently, MTK NAND driver is licensed as GPL. And we would like to
> modify and publish it in bootloader with MIT license. So, here we send
> this RFC patch to solicit ACKs from MTK NAND driver authors and
> contributors whether we can re-license MTK NAND driver as dual MIT/GPL.
> 
> Thanks and looking forward to your reply,
> Xiaolei
> 
> Patch v2:
> ---------
> - Add Ryder, Rafal, Wen in CC list.
> - Introduce why we want to re-license MTK NAND driver.
> 
> Xiaolei Li (1):
>   mtd: rawnand: mtk: Re-license MTK NAND driver as Dual MIT/GPL
> 
>  drivers/mtd/nand/raw/mtk_ecc.c  | 12 ++----------
>  drivers/mtd/nand/raw/mtk_ecc.h  |  4 +---
>  drivers/mtd/nand/raw/mtk_nand.c | 12 ++----------
>  3 files changed, 5 insertions(+), 23 deletions(-)
> 
> --
> 2.18.0
> 
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
