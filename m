From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] soc: Mediatek: Enable SCPSYS power domain driver by default
Date: Thu, 19 Nov 2015 12:05:38 -0800
Message-ID: <CAMAWPa8ZcD30-06K3w1EewPMPA6LmU7bpOWbxi=VfsByyQT3Sw@mail.gmail.com>
References: <1447411835-19035-1-git-send-email-eddie.huang@mediatek.com>
	<7h4mgpdh6f.fsf@deeprootsystems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7h4mgpdh6f.fsf@deeprootsystems.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <s.hauer@pengutronix.de>, lkml <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Olof Johansson <olof@lixom.net>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Nov 13, 2015 at 7:59 AM, Kevin Hilman <khilman@kernel.org> wrote:
> Eddie Huang <eddie.huang@mediatek.com> writes:
>
>> If enable Mediatek 8173 SoC, it should also enable power domain
>> driver. Otherwise access clk subsystem register will fail.
>>
>> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
>
> Tested-by: Kevin Hilman <khilman@linaro.org>
>
> This gets the mt8173-evb booting again with arm-soc/for-next and
> mainline for me.
>
> I'll let Matthias queue this up and send it with any other fixes for
> v4.4-rc1.

Matthias, this is still broken in arm-soc.  Curious if your planning
on sending a fix?  If you prefer, with your ack, we can apply directly
to arm-soc/fixes.

Kevin
