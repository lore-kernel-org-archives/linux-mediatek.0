From: Harvey Hunt <Harvey.Hunt@imgtec.com>
Subject: Re: [V4 1/2] phy: ralink-usb: add driver for Mediatek/Ralink
Date: Thu, 10 Aug 2017 17:00:17 +0100
Message-ID: <21122b7e-dd7d-1a83-f4c4-2fbd64622e8e@imgtec.com>
References: <1502271340-29001-1-git-send-email-harvey.hunt@imgtec.com>
 <F7B73EAF-B32D-4FBC-BE9D-855954027CC0@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <F7B73EAF-B32D-4FBC-BE9D-855954027CC0@imgtec.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, kishon@ti.com
Cc: John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi James,

On 09/08/17 23:23, James Hogan wrote:
> On 9 August 2017 10:35:39 BST, Harvey Hunt <harvey.hunt@imgtec.com> wrote:
>> From: John Crispin <john@phrozen.org>
>>
>> Add a driver to setup the USB phy on Mediatek/Ralink SoCs.
>> The driver is trivial and only sets up power and host mode.
>>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-mediatek@lists.infradead.org
>> ---
>> Changes in V4
>> * Remove Allwinner from comment
>> * Depend on COMPILE_TEST
>>
>> Changes in V3
>> * Separate DT bindings
>> * Update Kconfig text
>> * Modify John's email address
>> * Rebase onto v4.13-rc3
>>
>> Changes in V2
>> * remove refcounting
>> * drop empty functions
>> * dont use static globals
>> * use explicit compatible strings
>>
>> drivers/phy/Kconfig          |   8 ++
>> drivers/phy/Makefile         |   1 +
>> drivers/phy/phy-ralink-usb.c | 173
>> +++++++++++++++++++++++++++++++++++++++++++
>> 3 files changed, 182 insertions(+)
>> create mode 100644 drivers/phy/phy-ralink-usb.c
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index c1807d4..8fb5260 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -41,6 +41,14 @@ config PHY_PISTACHIO_USB
>> 	help
>> 	  Enable this to support the USB2.0 PHY on the IMG Pistachio SoC.
>>
>> +config PHY_RALINK_USB
>> +	tristate "Ralink USB PHY driver"
>> +	select GENERIC_PHY
>> +	depends on RALINK || COMPILE_TEST
> 
> given that the driver includes a asm/mach-ralink header, the COMPILE_TEST bit may break x86 allmodconfig?
> 
> maybe the header should be moved out of arch/mips or it should depend on MIPS only (so a mips allmodconfig catches it, but cant be enabled on x86 even with COMPILE_TEST=y)
> 
> cheers
> James
> 
[...]

Well spotted - the build does indeed fail for ARCH=x86 allmodconfig.

I could either use:

depends on RALINK || (COMPILE_TEST && MIPS)

or just drop the COMPILE_TEST altogether, as I don't know how many 
people are running compile test only on MIPS.

Thanks,

Harvey
