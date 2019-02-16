From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Mediatek SoC updates for v5.1
Date: Sat, 16 Feb 2019 20:51:30 +0100
Message-ID: <CAK8P3a2c6XgS1QKFPEKUHWCNOeH1v0QoD5dPzShK81bjtqBc_A@mail.gmail.com>
References: <7c3dc195-68eb-e78d-3f7d-806546608d2c@gmail.com>
 <CAK8P3a1Y55XZkULdvaSctZwEDKEpr4eWA60UQJPsk5JzGwA0mg@mail.gmail.com>
 <1550298056.17036.9.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550298056.17036.9.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, arm-soc <arm@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Weiyi Lu <weiyi.lu@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Sat, Feb 16, 2019 at 7:21 AM Ryder Lee <ryder.lee@mediatek.com> wrote:
>
> On Fri, 2019-02-15 at 17:46 +0100, Arnd Bergmann wrote:
> > On Fri, Feb 8, 2019 at 9:00 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >
> > >   arm: mediatek: add MT7629 smp bring up code (2019-02-07 17:59:16 +0100)
> > >
> > > ----------------------------------------------------------------
> > > mt8173: minor typo in scpsys header file
> > > mt7629: add smp bringup code
> > > mt7623a: delete unused smp bringup code
> >
> > Pulled into arm/soc, but please elaborate on the mt7629 chip as I could
> > not find any information on it but would like to include some text about
> > all newly added SoCs in my pull request to Linus.
> >
> > Is this a variant of mt7623, or something else?
> >
> >      Arnd
>
> The IPs differ in MT7615 compared to MT7623.  I haven't submitted
> mt7629.dtsi as I still wait for the PCIe part be taken through the -next
> tree first.
>
> Overview
>
> MT7629 is a highly integrated wireless network router system-on-chip
> and integrates an CA7 Dual-Core operating up to 1.25GHz and DRAM
> DDR2/DDR3(L).
>
> It includes SGMII, PCIe2.0, USB2.0 and USB3.0 and implements two 2.5Gbps
> HSGMII interfaces and a 5-ports 10/100 Ethernet switch.
>
> Otherwise, The MT7761 is an 802.11n 3x3 RF chip, and the MT7762 is an
> 802.11ac 3x3 RF chip.  When the two RF chips and MT7629 are combined
> together, they provide dual-band concurrent chipset solution for WiFi
> AC1900 wireless router platform.
>

Ok, thanks a lot for the extra information!

     Arnd
