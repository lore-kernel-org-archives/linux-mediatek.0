From: Sergio Paracuellos <sergio.paracuellos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mt7621/mt7628 PCIe linux driver
Date: Sun, 23 Sep 2018 08:20:28 +0200
Message-ID: <CAMhs-H-CM3bb9fg2eX6G_534bmuQYcoFa+pJSuNeArXLSXO4=Q@mail.gmail.com>
References: <8fd595af-53fa-c100-c369-8c7a30eba8e3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <8fd595af-53fa-c100-c369-8c7a30eba8e3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Petr Cvek <petrcvekcz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Petr,

On Sat, Sep 22, 2018 at 11:06 PM, Petr Cvek <petrcvekcz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello,
>
> I'm trying to play with mt7628 PCIe (and it's old driver mt7620), but
> the system keeps freezing. It is probably because of bus master access
> of my PCIe cards but I don't see any memory access controls for PCIe <->
> RAM in the datasheet. The same problem is with MSI. It seems the root
> complex supports MSI (it has an MSI capability field), but there isn't
> any mention in the MT7628 datasheet too. As it seems the MT7628 PCIe is
> based on MT7621 PCIe, I went for an MT7621 datasheet, but sadly in the
> datasheet the PCIe section is missing completely.

AFAIK, MT7628 should be covered with mt7620 driver. The source code is in
arch/mips/pci/pci-mt7620.c. For initialization in really depends on
the "ralink_soc"
variable exported in arch/mips/ralink/prom.c.

You have to figure out why and where is really freezing. Does a clean kernel
boots and success on setting up PCI? A 'dmesg' would be helpful.

>
> Does anybody have a working MT7621/28 bus master setup or a more
> completed datasheet? I would like to get some information for fixing the
> mt7620 PCIe driver. It is possible the MSI/bus master is controlled by
> the undocumented bridge registers (in the pci-mt7621 they controls the
> manual oscillator settings, I've found a link quality register at
> 0x101490c4) or in a PCI config space of the root complex (around 0x700
> offset). If you have a working SoC with MSI/bus mastering (= mem access
> from card), can you send me the dump of there spaces?

The datasheet for the mt7620 contains information about PCI registers.
Linux initializes the
pci topology but master bit of command registers for endpoints is
disabled and is mission of final
card driver to enable it in order to allow memory accessing to the card.

Hope this helps.

>
> Thanks
>
> best regards,
> Petr

Best regards,
    Sergio Paracuellos
