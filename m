From: David Oberhollenzer <david.oberhollenzer-S6VGOU4v5edDinCvNWH78Q@public.gmane.org>
Subject: Re: [PATCH 1/2] libmtd: Add support to access OOB available size
Date: Mon, 9 Apr 2018 08:58:16 +0200
Message-ID: <99d17022-0b07-a999-b6ac-05b51df7d18d@sigma-star.at>
References: <1523243410-65424-1-git-send-email-xiaolei.li@mediatek.com>
 <1523243410-65424-2-git-send-email-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1523243410-65424-2-git-send-email-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
To: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

On 04/09/2018 05:10 AM, Xiaolei Li wrote:
> @@ -769,6 +774,8 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
>  		return -1;
>  	if (dev_read_pos_int(lib->mtd_oob_size, mtd_num, &mtd->oob_size))
>  		return -1;
> +	if (dev_read_pos_int(lib->mtd_oobavail, mtd_num, &mtd->oobavail))
> +		return -1;
>  	if (dev_read_pos_int(lib->mtd_region_cnt, mtd_num, &mtd->region_cnt))
>  		return -1;
>  	if (dev_read_hex_int(lib->mtd_flags, mtd_num, &ret))

I'm not sure if it is a good idea to do a hard fail here, since this
depends on a recent change to the kernel.

It might be preferable to catch and handle ENOENT, otherwise the next
release of mtd-utils will only work on the next kernel release onward.

Maybe mtd_oobavail could to be set to some reasonable default that
retains the current behaviour on "older" kernels?


Thanks,

David
