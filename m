From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [net-next] phylib: Add device reset GPIO support causes DSA
 MT7530 acquires reset-gpios fails
Date: Mon, 18 Dec 2017 11:21:29 -0800
Message-ID: <5cf08589-b4e4-3b4c-cc3e-c6100492155f@gmail.com>
References: <1513320903.28444.65.camel@mtkswgap22>
 <20171215101014.GB4213@lunn.ch> <1513569684.24235.12.camel@mtkswgap22>
 <20171218080120.GD30815@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171218080120.GD30815@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Sean Wang <sean.wang@mediatek.com>
Cc: sergei.shtylyov@cogentembedded.com, vivien.didelot@savoirfairelinux.com, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, richard.leitner@skidata.com, geert+renesas@glider.be
List-Id: linux-mediatek@lists.infradead.org

On 12/18/2017 12:01 AM, Andrew Lunn wrote:
> Hi Sean
> 
>> It probably can't. Because before the GPIO line is manipulated to reset,
>> certain power control should be handled such as power sources from
>> external PMIC to let devices actually enter the proper state.
>>
>> So, I thought the kind of reset should be better controlled by the
>> specific driver, not by generic core.
> 
> Yes, the driver should do it in that case.
> 
> So we have a few choices:
> 
> 1) Change the name of one of the properties
> 
> 2) Make the new code look at the compatible string, any only apply a
>    reset if it is a PHY.
> 
> 3) Make the new code only hold the gpio when it needs it. Same for the
>    driver, so that they both can reset the device.
> 
> Any other ideas? Any preferences? 2) and 3) are probably simpler to
> do, less backwards compatibility issues. 3) potentially could cause
> issues when a device is reset in the wrong context, because of
> external PMIC etc. So i'm thinking 2).

We could also add some sort of flag that indicates whether the reset
should be managed by the core, or the driver, I would have to double
check there is not a chicken and egg problem and that the driver probe
is early enough this can happen...
-- 
Florian
