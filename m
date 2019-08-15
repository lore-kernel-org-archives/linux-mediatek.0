From: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] net: ethernet: mediatek: Add MT7628/88 SoC support
Date: Thu, 15 Aug 2019 11:08:05 +0200
Message-ID: <9bbc449b-bff2-448a-6b95-cc712c9353b8@denx.de>
References: <20190717125345.Horde.JcDE_nBChPFDDjEgIRfPSl3@www.vdorst.com>
 <a92d7207-80b2-e88d-d869-64c9758ef1da@denx.de>
 <20190814092621.Horde.epvj8zK96-aCiV70YB5Q7II@www.vdorst.com>
 <3ff9a0fc-f5ff-3798-4409-ed5b900e0b05@denx.de>
 <20190814130856.Horde.wzHL8_VRawJ8NIIk--BD18e@www.vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190814130856.Horde.wzHL8_VRawJ8NIIk--BD18e@www.vdorst.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Daniel Golle <daniel@makrotopia.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Rene,

On 14.08.19 15:08, René van Dorst wrote:
> Quoting Stefan Roese <sr@denx.de>:
> 
>> Hi Rene,
>>
>> On 14.08.19 11:26, René van Dorst wrote:
> 
> <snip>
> 
>>> Great, Thanks for addressing this issue.
>>>
>>> I hope we can collaborate to also support mt76x8 in my PHYLINK
>>> patches [0][1].
>>> I am close to posting V2 of the patches but I am currently waiting on some
>>> fiber modules to test the changes better.
>>
>> I do have a "hackish" DSA driver for the integrated switch (ESW) in my
>> tree. If time permits, I'll work on upstreaming this one as well. And
>> yes, hopefully we can collaborate on your PHYLINK work too.
> 
> It is not only the switch driver but also the Mediatek ethernet driver that is
> converted to PHYLINK. So we have a conflict in each others work.

Yes, I am aware of this.
  
> I don't no what the right way is to go but I was thinking about 2 options
> 
> 1. Lets say your work goes in first. I rebase my patches on your changes.
>      We collaborate to create an extra PHYLINK patch ontop of my work
> for your SOC.
> 2. My patches goes in first and you adapt your patches to that.
> 
> What do you think?

It really depends on the timing, when the patches arrive in the kernel
(net-next). If yours makes it first, I'll rebase my patch on top of
your work. Otherwise you will need to rebase yours.
  
> I have latest changes here [0].
> 
> Also my modules did arrive so I can test my changes.

Thanks,
Stefan
