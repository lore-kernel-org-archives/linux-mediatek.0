From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH V2] clockevents/drivers/mtk: Fix spurious interrupt
 leading to crash
Date: Fri, 4 Sep 2015 15:15:53 +0800
Message-ID: <1441350953.12270.6.camel@mtksdaap41>
References: <1440426924.17418.11.camel@mtksdaap41>
		 <1440453450-21203-1-git-send-email-daniel.lezcano@linaro.org>
	 <1440508871.29634.1.camel@mtksdaap41> <55DDCC4B.7010203@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55DDCC4B.7010203@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: djkurtz@chromium.org, sboyd@codeaurora.org, tglx@linutronix.de, jamesjj.liao@mediatek.com, linux@arm.linux.org.uk, srv_heupstream@mediatek.com, arnd@arndb.de, catalin.marinas@arm.com, kernel@pengutronix.de, matthias.bgg@gmail.com, "open list:CLOCKSOURCE, CLOC..." <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2015-08-26 at 16:25 +0200, Daniel Lezcano wrote:
> On 08/25/2015 03:21 PM, Yingjoe Chen wrote:
> > Tested-by: Yingjoe Chen<yingjoe.chen@mediatek.com>
> 
> Applied to my tree for 4.4.
> 
>    -- Daniel
> 

Hi Daniel,

I can't find this patch in
https://git.linaro.org/people/daniel.lezcano/linux.git
Is this tree public now? Where can I see it?

Also, will you take patch[1] "clocksource: mediatek: Use GPT as sched
clock source" in your tree?

Joe.C

[1]:
http://lists.infradead.org/pipermail/linux-mediatek/2015-July/001547.html
