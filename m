From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [mediatek:v4.2-next/soc 3/3] warning: (MTK_SCPSYS) selects
 MTK_INFRACFG which has unmet direct dependencies (ARCH_MEDIATEK)
Date: Thu, 25 Jun 2015 12:11:23 +0200
Message-ID: <CABuKBeKZPMiVYk1QJ4hjA5D0QatONLTSP1cgYf1X-QWrGpxaAg@mail.gmail.com>
References: <201506250419.3sQy2jF7%fengguang.wu@intel.com>
 <CAGS+omA-1_Y1nBkURNqqKP8i3rhHNNhJRfxVJZ4BmPf3oR54LQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAGS+omA-1_Y1nBkURNqqKP8i3rhHNNhJRfxVJZ4BmPf3oR54LQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

2015-06-25 9:37 GMT+02:00 Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>:
> Hi Matthias,
>
> On Thu, Jun 25, 2015 at 4:15 AM, kbuild test robot
> <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
>>
>> tree:   https://github.com/mbgg/linux-mediatek v4.2-next/soc
>> head:   86d8467ed3bb9243fdedc5376c2b07b93b776645
>> commit: 86d8467ed3bb9243fdedc5376c2b07b93b776645 [3/3] soc: Mediatek: Add SCPSYS power domain driver
>> config: xtensa-allyesconfig (attached as .config)
>> reproduce:
>>   wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>>   chmod +x ~/bin/make.cross
>>   git checkout 86d8467ed3bb9243fdedc5376c2b07b93b776645
>>   # save the attached .config to linux build tree
>>   make.cross ARCH=xtensa
>>
>> All warnings (new ones prefixed by >>):
>>
>> warning: (MTK_SCPSYS) selects MTK_INFRACFG which has unmet direct dependencies (ARCH_MEDIATEK)
>
> I guess this is because config MTK_INFRACFG  depends on ARCH_MEDIATEK
> [0], but config MTK_SCPSYS depends on (ARCH_MEDIATEK || COMPILE_TEST).
> So, in the (COMPILE_TEST && !ARCH_MEDIATEK) case
> (xtensa-allyesconfig), MTK_INFRACFG is disabled, but selected by
> MTK_SCPSYS.
>
> [0] [PATCH 1/4] soc: mediatek: Add infracfg misc driver support
>  .. drivers/soc/mediatek/Kconfig:
> +config MTK_INFRACFG
> +       bool "MediaTek INFRACFG Support"
> +       depends on ARCH_MEDIATEK
> +       select REGMAP
>
> [1] [PATCH 3/4] soc: Mediatek: Add SCPSYS power domain driver
> drivers/soc/mediatek/Kconfig
>
> +config MTK_SCPSYS
> +       bool "MediaTek SCPSYS Support"
> +       depends on ARCH_MEDIATEK || COMPILE_TEST
> +       select REGMAP
> +       select MTK_INFRACFG
> +       select PM_GENERIC_DOMAINS if PM
>
> Can you fix-up by adding:
> +       depends on ARCH_MEDIATEK || COMPILE_TEST
> to:
> +config MTK_INFRACFG
>
> And then re-apply to your tree?
>
> I guess people want to support "COMPILE_TEST" for these config
> options, but I am not really sure.

Ok let's give this a try (I'm not sure neither).
If this is not working, I will have a look into this on Monday (I will
be in a remote area for holidays).

Cheers,
Matthias

-- 
motzblog.wordpress.com
