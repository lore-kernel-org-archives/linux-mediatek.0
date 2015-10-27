From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V2] clockevents/drivers/mtk: Fix spurious interrupt
 leading to crash
Date: Tue, 27 Oct 2015 12:47:03 +0100
Message-ID: <562F6437.1000507@linaro.org>
References: <1440426924.17418.11.camel@mtksdaap41>
 <1440453450-21203-1-git-send-email-daniel.lezcano@linaro.org>
 <1440508871.29634.1.camel@mtksdaap41> <55DDCC4B.7010203@linaro.org>
 <562F5BE9.30200@gmail.com> <562F5EA8.2070507@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <562F5EA8.2070507@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>, tglx@linutronix.de
Cc: Matthias Brugger <matthias.bgg@gmail.com>, djkurtz@chromium.org, sboyd@codeaurora.org, jamesjj.liao@mediatek.com, linux@arm.linux.org.uk, srv_heupstream@mediatek.com, arnd@arndb.de, catalin.marinas@arm.com, kernel@pengutronix.de, "open list:CLOCKSOURCE, CLOC..." <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, Kevin Hilman <khilman@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On 10/27/2015 12:23 PM, Daniel Lezcano wrote:
> On 10/27/2015 12:11 PM, Matthias Brugger wrote:
>> Hi Daniel,
>>
>> On 26/08/15 16:25, Daniel Lezcano wrote:
>>> On 08/25/2015 03:21 PM, Yingjoe Chen wrote:
>>>> Tested-by: Yingjoe Chen<yingjoe.chen@mediatek.com>
>>>
>>> Applied to my tree for 4.4.
>>>
>>>    -- Daniel
>>>
>>
>> Kevin found a regression in v4.3 which will need this patch to fix i=
t
>> [1]. Can you apply it to your clockevents/4.3-fixes branch please.
>>
>> Thanks,
>> Matthias
>>
>> [1] https://lkml.org/lkml/2015/10/26/211
>
> Hmm, I thought it wasn't impacting 4.3, so it went to 4.4.
>
> Let me look how to backport this fix without introducing a conflict w=
hen
> tip/timers/urgent will be merged to tip/timers/core.

Thomas,

do you think I can cherry-pick from tip/timers/core or clockevents/4.4=20
directly the fix to be pulled into clockevents/4.3-fixes ? That will=20
certainly raise a conflict when tip/timers/urgent will be merged to=20
tip/timers/core (a trivial conflict actually).

   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
