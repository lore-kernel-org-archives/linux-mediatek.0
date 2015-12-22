From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH] soc: mediatek: SCPSYS: use builtin_platform_driver
Date: Tue, 22 Dec 2015 21:36:30 +0800
Message-ID: <CAGS+omDrZO8PteeFZMes0QRjG2KLhMG=qacFrho+UFPVAG=YXg@mail.gmail.com>
References: <1450437573-32079-1-git-send-email-matthias.bgg@gmail.com> <CAGS+omA822+-srskZ08pa72xVTMFbWLkaZD0za=3MCBryS6PRg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGS+omA822+-srskZ08pa72xVTMFbWLkaZD0za=3MCBryS6PRg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>, paul.gortmaker@windriver.com, =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Matthias,

One thing below is missing from this version of the patch...

> On Fri, Dec 18, 2015 at 7:19 PM, Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>> SCPSYS can't be built as module. Use builtin_platform_driver instead.
>> For this probe must not be __init and the data accessed can't be
>> __initconst. Remove this macros. To make the impact as small as possible,
>> fold scp_domain_data into scp_domain via a pointer.

[snip]

>> @@ -542,10 +533,11 @@ static const struct of_device_id of_scpsys_match_tbl[] = {
>>  };
>>
>>  static struct platform_driver scpsys_drv = {
>> +       .probe = scpsys_probe,
>>         .driver = {
>>                 .name = "mtk-scpsys",

This was in Sascha's version of the patch:

  .suppress_bind_attrs = true,

Do we still need it now that we use "builtin_platform_driver"?

>>                 .owner = THIS_MODULE,
>>                 .of_match_table = of_match_ptr(of_scpsys_match_tbl),
>>         },
>>  };
>> -builtin_platform_driver_probe(scpsys_drv, scpsys_probe);
>> +builtin_platform_driver(scpsys_drv);
>> --
>> 2.6.2
>>
