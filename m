From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH V2] clockevents/drivers/mtk: Fix spurious interrupt
 leading to crash
Date: Tue, 27 Oct 2015 12:11:37 +0100
Message-ID: <562F5BE9.30200@gmail.com>
References: <1440426924.17418.11.camel@mtksdaap41>
 <1440453450-21203-1-git-send-email-daniel.lezcano@linaro.org>
 <1440508871.29634.1.camel@mtksdaap41> <55DDCC4B.7010203@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55DDCC4B.7010203@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: djkurtz@chromium.org, sboyd@codeaurora.org, tglx@linutronix.de, jamesjj.liao@mediatek.com, linux@arm.linux.org.uk, srv_heupstream@mediatek.com, arnd@arndb.de, catalin.marinas@arm.com, kernel@pengutronix.de, "open list:CLOCKSOURCE, CLOC..." <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, Kevin Hilman <khilman@kernel.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Daniel,

On 26/08/15 16:25, Daniel Lezcano wrote:
> On 08/25/2015 03:21 PM, Yingjoe Chen wrote:
>> Tested-by: Yingjoe Chen<yingjoe.chen@mediatek.com>
>
> Applied to my tree for 4.4.
>
>    -- Daniel
>

Kevin found a regression in v4.3 which will need this patch to fix it 
[1]. Can you apply it to your clockevents/4.3-fixes branch please.

Thanks,
Matthias

[1] https://lkml.org/lkml/2015/10/26/211
