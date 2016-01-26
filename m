From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH V3 2/2] regulator: mt6323: Add support for MT6323
 regulator
Date: Tue, 26 Jan 2016 11:59:59 +0100
Message-ID: <56A751AF.3030601@openwrt.org>
References: <1453722989-41622-1-git-send-email-blogic@openwrt.org>
 <1453722989-41622-2-git-send-email-blogic@openwrt.org>
 <1453804890.17181.93.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453804890.17181.93.camel@tiscali.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Henry Chen <henryc.chen@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 26/01/2016 11:41, Paul Bolle wrote:
> John,
> 
> On ma, 2016-01-25 at 12:56 +0100, John Crispin wrote:
>> --- /dev/null
>> +++ b/drivers/regulator/mt6323-regulator.c
> 
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
> 
> This states this file is licensed GPL v2 only.
> 
>> +MODULE_LICENSE("GPL");
> 
> And, according to include/linux/module.h, this means "GNU Public License
> v2 or later".
> 
> So I think there's a (subtle) mismatch between the license ident used
> for this driver and the comment above.
> 
> Thanks,
> 
> 
> Paul Bolle
> 

Hi Paul,

thanks, good catch. luckily i had not sent the next version of the
series yet ;)

	John

	John
