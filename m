From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: NVMEM usage question
Date: Wed, 16 Mar 2016 06:50:45 +0000
Message-ID: <56E90245.1040203@linaro.org>
References: <1457956899.20370.25.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457956899.20370.25.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie Huang <eddie.huang@mediatek.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-mediatek@lists.infradead.org, andrew-ct.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org



On 14/03/16 12:01, Eddie Huang wrote:
> Hi,
>
> Mediatek PMIC chip have some spare registers used to store information.
> The value of these registers will exist until user unplug battery or
> battery depletion. One of our usage example is store battery utilization
> in these spare registers. We want to implement NVMEM driver to
> read/write sparse registers, but binding document describe NVMEM is for
> "Non-volatile memory", and for hardware like eeprom, efuse. Since the
> usage here is some kind of "battery backup memory", but not real
> non-volatile memory, is NVMEM driver suitable for this case ?

If this battery usage information can be retrieved after full power 
cycle, then there should be some sort of non volatile memory involved.

If that's the case then you can use the nvmem.

--srini


>
> Eddie
>
>
