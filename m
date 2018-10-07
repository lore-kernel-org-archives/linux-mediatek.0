From: Petr Cvek <petrcvekcz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mt7621/mt7628 PCIe linux driver
Date: Sun, 7 Oct 2018 15:25:30 +0200
Message-ID: <283247bf-fa56-875a-6669-eddd6142d399@gmail.com>
References: <8fd595af-53fa-c100-c369-8c7a30eba8e3@gmail.com>
 <CAMhs-H-CM3bb9fg2eX6G_534bmuQYcoFa+pJSuNeArXLSXO4=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAMhs-H-CM3bb9fg2eX6G_534bmuQYcoFa+pJSuNeArXLSXO4=Q@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sergio Paracuellos <sergio.paracuellos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello,

sorry for a late reaction and thanks for your input. It took me two
weeks to get MT7628 ethernet driver to start working (so I could use the
current kernel version).

Dne 23.9.2018 v 08:20 Sergio Paracuellos napsal(a):
> Hi Petr,
> 
> On Sat, Sep 22, 2018 at 11:06 PM, Petr Cvek <petrcvekcz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello,
>>
>> I'm trying to play with mt7628 PCIe (and it's old driver mt7620), but
>> the system keeps freezing. It is probably because of bus master access
>> of my PCIe cards but I don't see any memory access controls for PCIe <->
>> RAM in the datasheet. The same problem is with MSI. It seems the root
>> complex supports MSI (it has an MSI capability field), but there isn't
>> any mention in the MT7628 datasheet too. As it seems the MT7628 PCIe is
>> based on MT7621 PCIe, I went for an MT7621 datasheet, but sadly in the
>> datasheet the PCIe section is missing completely.
> 
> AFAIK, MT7628 should be covered with mt7620 driver. The source code is in
> arch/mips/pci/pci-mt7620.c. For initialization in really depends on
> the "ralink_soc"
> variable exported in arch/mips/ralink/prom.c.
> 

I was able to fix some of the problems. But still there are still
missing pieces.

The PCI driver (from pci-mt7620.c) isn't working in the vanilla version.
It has a lot of problems:
- Wrong access to the reset register (the wrong writing function used)
- IO access is not working at all. There is a function call missing to
setting MMIO base. The indirect access base register has a wrong value
and I've had to force code some other IOPORT related stuff.
- Forcing BAR0 is irrelevant for a root complex and it interferes with
kernel resources assignment.
- Cards other than 01:00.0 will have no IRQ set (and the drivers will fail).
- Some minor problem like using the mdelay vs msleep.


> You have to figure out why and where is really freezing. Does a clean kernel
> boots and success on setting up PCI? A 'dmesg' would be helpful.
> 
>>
>> Does anybody have a working MT7621/28 bus master setup or a more
>> completed datasheet? I would like to get some information for fixing the
>> mt7620 PCIe driver. It is possible the MSI/bus master is controlled by
>> the undocumented bridge registers (in the pci-mt7621 they controls the
>> manual oscillator settings, I've found a link quality register at
>> 0x101490c4) or in a PCI config space of the root complex (around 0x700
>> offset). If you have a working SoC with MSI/bus mastering (= mem access
>> from card), can you send me the dump of there spaces?
> 
> The datasheet for the mt7620 contains information about PCI registers.
> Linux initializes the
> pci topology but master bit of command registers for endpoints is
> disabled and is mission of final
> card driver to enable it in order to allow memory accessing to the card.
> 

But even with things (above) in the driver fixed, there will be still
questions for the documentation left:
- No MSI support or at least documentation for implementation (I could
do it myself probably). The MSI functionality is IMO required for PCIe
hosts, the MT7628 root complex itself has MSI capability.
- The 3.10 kernel from linux-mips.org had a support for spread spectrum
and manual PLL setting (no documentation for these registers too).
- No additional documentation for the interrupt of the controller
events. It could be useful to have its behavior because the PCIe
controller resets itself when it loses the link connection (and the
mention of this behavior could be useful to have in the datasheet too).
- Can the PCIe device/bus-master card access all 4 GiB of the MT7628
address space? What about 64bit address access?
- Does MT7628 support PCIe device mode (as observed from the hardware
behavior, when it sets it's own config space to a device/wireless
network class, from the residual mentions in the datasheet, from PCIe
device oriented registers and from similarities with MT SoCs which
support PCIe host/device mode)
- No documentation if there are any PCIe resistive terminations on chip
(I cannot get a connection without external resistors)
- I would like to have the documentation of 0x101490c4 register as it is
link quality oriented (which I've had to reverse engineer from hw
behavior when I was searching for a solution to resistor termination
problem).

> Hope this helps.

Well in a way it did ;-).

BTW the idea about merging with MT7621 is from TODO file from MT7621 driver:

https://elixir.bootlin.com/linux/v4.19-rc5/source/drivers/staging/mt7621-pci/TODO#L8

... and from that 3.10 kernel where all ralink/mediatek PCIe drivers
were in a single file (it seems the controllers are really similar).

> 
> Best regards,
>     Sergio Paracuellos
> 

cheers,
Petr
