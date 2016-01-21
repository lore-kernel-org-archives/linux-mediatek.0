From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 0/3] Add basic support for Mediatek MT7623 SoC
Date: Thu, 21 Jan 2016 11:18:53 +0100
Message-ID: <56A0B08D.7000104@openwrt.org>
References: <1452011068-28300-1-git-send-email-blogic@openwrt.org>
 <56A0AEA7.5000704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <56A0AEA7.5000704-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On 21/01/2016 11:10, Matthias Brugger wrote:
> 
> 
> On 05/01/16 17:24, John Crispin wrote:
>> MT7623 is a SoC based on 32bit ARMv7 architecture. It contains 4 CA7
>> cores.
>> MT7623 share many HW IP with MT65xx series. This patchset was tested
>> on MT7623 evaluation board, and boot to shell ok.
>>
>> This series contains document bindings, device tree including
>> interrupt, uart, timer and wdt.
>>
>> John Crispin (3):
>>    Document: DT: Add bindings for mediatek MT7623 SoC Platform
>>    ARM: dts: mediatek: add MT7623 basic support
>>    ARM: mediatek: add MT7623 smp bringup code
>>
>>   Documentation/devicetree/bindings/arm/mediatek.txt |    4 +
>>   .../devicetree/bindings/serial/mtk-uart.txt        |    1 +
>>   .../bindings/timer/mediatek,mtk-timer.txt          |    1 +
>>   arch/arm/boot/dts/Makefile                         |    1 +
>>   arch/arm/boot/dts/mt7623-evb.dts                   |   33 +++++
>>   arch/arm/boot/dts/mt7623.dtsi                      |  147
>> ++++++++++++++++++++
>>   arch/arm/mach-mediatek/Kconfig                     |    4 +
>>   arch/arm/mach-mediatek/mediatek.c                  |    1 +
>>   arch/arm/mach-mediatek/platsmp.c                   |    7 +
>>   9 files changed, 199 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/mt7623-evb.dts
>>   create mode 100644 arch/arm/boot/dts/mt7623.dtsi
>>
> 
> Applied to v4.5-next/dts and v4.5-next/soc.
> 
> I split patch 3 to fit the different branches.
> 
> Thanks,
> Matthias

thanks mate, i'll be resending the pmic, pinctrl, regulator ... patches
hopefully tomorrow. pcie will take a few days extra

	John


> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
