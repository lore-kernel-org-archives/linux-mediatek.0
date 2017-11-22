From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] media: mtk-vcodec: add missing MODULE_LICENSE/DESCRIPTION
Date: Tue, 21 Nov 2017 23:51:57 -0800
Message-ID: <835d88de-989e-03c7-e647-819f8f200f1b@infradead.org>
References: <20171120062607.124734-1-jc@linux.com>
 <201711221521.lmq1l8ci%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <201711221521.lmq1l8ci%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
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
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jesse Chan <jc-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org>
Cc: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 11/21/17 23:41, kbuild test robot wrote:
> Hi Jesse,
> 
> Thank you for the patch! Yet something to improve:

missing
#include <linux/module.h>

Jesse, did you build all of these driver changes?


> [auto build test ERROR on linuxtv-media/master]
> [also build test ERROR on v4.14 next-20171121]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Jesse-Chan/media-mtk-vcodec-add-missing-MODULE_LICENSE-DESCRIPTION/20171122-124620
> base:   git://linuxtv.org/media_tree.git master
> config: xtensa-allmodconfig (attached as .config)
> compiler: xtensa-linux-gcc (GCC) 4.9.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=xtensa 
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c:55:16: error: expected declaration specifiers or '...' before string constant
>     MODULE_LICENSE("GPL v2");
>                    ^
>    drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c:56:20: error: expected declaration specifiers or '...' before string constant
>     MODULE_DESCRIPTION("Mediatek video codec driver");
>                        ^
> 
> vim +55 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
> 
>     54	
>   > 55	MODULE_LICENSE("GPL v2");
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 


-- 
~Randy
