From: Frank Wunderlich <frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org>
Subject: Re: Aw: Re: Re: BUG: devm_regulator_get returns EPROBE_DEFER
 (5.3-rc5..next-20190822) for bpi-r2/mt7623/mt7530
Date: Fri, 23 Aug 2019 17:07:40 +0200
Message-ID: <3545020D-0E15-4DD9-BAA4-D9D51DD32018@public-files.de>
References: <trinity-584a4b1c-18c9-43ae-8c1a-5057933ad905-1566501837738@3c-app-gmx-bs43>
 <20190822193015.GK23391@sirena.co.uk>
 <trinity-5d117f0d-9f34-4a2b-8a12-1cd34152c108-1566505724458@3c-app-gmx-bs43>
 <20190823100424.GL23391@sirena.co.uk>
 <trinity-2f905f45-85d8-4343-8613-31dda5f7556f-1566561616610@3c-app-gmx-bs11>
 <0fcdea56-c6fc-993d-1520-be40ff03df2d@gmail.com>
Reply-To: frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <0fcdea56-c6fc-993d-1520-be40ff03df2d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?ISO-8859-1?Q?Ren=E9_van_Dorst?= <opensource-91nzXlUTePbQT0dZR+AlfA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hsin-Hsiung Wang <hsin-hsiung.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi

Am 23. August 2019 16:43:47 MESZ schrieb Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>On 23/08/2019 14:00, Frank Wunderlich wrote:
>> in working version i only get this message in dmesg which
>> looks like a device-binding:
>> 
>> mt6323-regulator mt6323-regulator: Chip ID = 0x2023

>> mt6397 1000d000.pwrap:mt6323: unsupported chip: 0x0

>These are commit IDs from linux-next. At least file from 20190822
>should
>pinpoint you to the correct commits.
>
>@frank: please don't use commit IDs from linux-next as the history
>get's
>rewritten every day and the IDs can change. Better search the tree to
>which they
>got applied and use the commit IDs from there (stating, of course,
>which tree
>you are looking at).

Is there any easy way to get the right tree?

Can you give me an example bases on this commit? I thought adding the commit-subject is enough to find it also in a dynamic tree

>Looking at commit
>a4872e80ce7d ("mfd: mt6397: Extract IRQ related code from core driver")
>
>you can see that it doesn't just move the code but also adds new logic
>in
>mt6397_irq_init(). :(

I take a look at this function,thank you pointing to it

>It seems your chip_id is not supported yet. So you will have to find
>out which
>one it is and add it to the switch.

have posted it above ;) (0x2023)
