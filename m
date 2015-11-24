From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] soc: Mediatek: Enable SCPSYS power domain driver by default
Date: Tue, 24 Nov 2015 10:20:57 -0800
Message-ID: <7h4mgbp8c6.fsf@deeprootsystems.com>
References: <1447411835-19035-1-git-send-email-eddie.huang@mediatek.com>
	<7h4mgpdh6f.fsf@deeprootsystems.com>
	<CAMAWPa8ZcD30-06K3w1EewPMPA6LmU7bpOWbxi=VfsByyQT3Sw@mail.gmail.com>
	<56535C1B.1090804@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56535C1B.1090804@gmail.com> (Matthias Brugger's message of "Mon,
	23 Nov 2015 19:34:03 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, lkml <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Olof Johansson <olof@lixom.net>
List-Id: linux-mediatek@lists.infradead.org

Matthias Brugger <matthias.bgg@gmail.com> writes:

> On 19/11/15 21:05, Kevin Hilman wrote:
>> On Fri, Nov 13, 2015 at 7:59 AM, Kevin Hilman <khilman@kernel.org> wrote:
>>> Eddie Huang <eddie.huang@mediatek.com> writes:
>>>
>>>> If enable Mediatek 8173 SoC, it should also enable power domain
>>>> driver. Otherwise access clk subsystem register will fail.
>>>>
>>>> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
>>>
>>> Tested-by: Kevin Hilman <khilman@linaro.org>
>>>
>>> This gets the mt8173-evb booting again with arm-soc/for-next and
>>> mainline for me.
>>>
>>> I'll let Matthias queue this up and send it with any other fixes for
>>> v4.4-rc1.
>>
>> Matthias, this is still broken in arm-soc.  Curious if your planning
>> on sending a fix?  If you prefer, with your ack, we can apply directly
>> to arm-soc/fixes.
>>
>
> Sorry for the delay. Please apply it directly.
>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
>

Thanks, applied to arm-soc/fixes.

Kevin
