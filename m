From: Sean Wang <sean.wang@kernel.org>
Subject: Re: Re: [PATCH 0/8] adding multiple CPU-Ports
Date: Fri, 14 Dec 2018 12:31:36 -0800
Message-ID: <CAGp9Lzq4mJvRyEA8gLnOmXXdDLfP3+ouXXGE6Y_Kq93a8ZEoAQ@mail.gmail.com>
References: <20181214164847.4851-1-frank-w@public-files.de>
 <3d53d8cf-3130-17bd-8418-310dda7d93a2@gmail.com> <trinity-d5689ac9-d645-48e5-bed9-8a51826f9c50-1544809703712@3c-app-gmx-bs32>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <trinity-d5689ac9-d645-48e5-bed9-8a51826f9c50-1544809703712@3c-app-gmx-bs32>
Sender: netdev-owner@vger.kernel.org
To: frank-w@public-files.de
Cc: f.fainelli@gmail.com, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, vivien.didelot@gmail.com
List-Id: linux-mediatek@lists.infradead.org

On Fri, Dec 14, 2018 at 9:49 AM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> Hi,
>
> i can test it and of course help as far as i can...
>
> for the bridge-way this means that an unconfigured system does not have a=
 connection between the user and the cpu-ports, right? If this is the desir=
ed way imho there should be a way to default a default, so that the device =
stays connectable if there is no user-config. Or is this you mean with "pol=
icy/user configuration in DT"?
>
> currently there is a bug in Ethernet-Patches you find on my github result=
ing in tx timeout (netdev watchdog) after switching connection (port1 down,=
 reconnect cable to another port and bring this up) between interfaces. Tha=
ts the reason i only posted the dsa/dts-Part.
>
> I've contacted mediatek-Team (Ryder Lee, Marc-MC Lee, Landen Chao, Steven=
 Liu) at beginning of this week and got a Patch from Ryder (you see on top =
of my repo) which unfortunately wont fix it. Maybe anyone here sees the Pro=
blem
>

Is it a problem just present after applies those mulitple-cpus patches
you propose here? or it also happens at the native code in mainline.

> regards Frank
>
>
> > Gesendet: Freitag, 14. Dezember 2018 um 18:26 Uhr
> > Von: "Florian Fainelli" <f.fainelli@gmail.com>
> > An: "Frank Wunderlich" <frank-w@public-files.de>, "Matthias Brugger" <m=
atthias.bgg@gmail.com>, netdev@vger.kernel.org, "Sean Wang" <sean.wang@medi=
atek.com>, "Andrew Lunn" <andrew@lunn.ch>, linux-mediatek@lists.infradead.o=
rg, vivien.didelot@gmail.com
> > Betreff: Re: [PATCH 0/8] adding multiple CPU-Ports
> >
> > Hi Frank,
> >
> > On 12/14/18 8:48 AM, Frank Wunderlich wrote:
> > > some switch-chips have multiple CPU-Ports
> > >
> > > this patch-series adds basic functionality and handle the 2
> > > cpu-Ports of mt7530 on board BananaPi R2
> > >
> > > changes to mtk-ethernet-driver are not included yet,
> > > because here are still some issues with watchdog-timeouts
> > >
> > > most patches are based on OpenWRT-Patches created by
> > > John Crispin and only ported to DSA-Core 4.15+ with 2 main difference=
s:
> > >   - no change to platform-driver
> > >   - option in dts is named "default_cpu" instead of only "cpu" to
> > >     allow modification from userspace (additional patches needed)
> > >
> > > complete source (including eth-patches) is uploaded here:
> > > https://github.com/frank-w/BPI-R2-4.14/commits/4.20-gmac-test
> >
> > Andrew, Vivien and I were discussing about multi-CPU support lately and
> > we think that the best and most flexible way to allow multi-CPU ports t=
o
> > be supported is to allow enslaving the DSA master network devices (CPU
> > Ethernet controllers) into a bridge because that will inherently define
> > the mapping between ports. Enslaving the CPU port into the bridge is no=
t
> > currently allowed because processing of DSA switch tags and bridge
> > frames were done in an incorrect order, but we can easily change that.
> >
> > So for instance in a dual CPU configuration interface with eth0 and eth=
1
> > being the two DSA master network devices and then lan1 through lan3
> > through lan4 being the user-visible LAN ports and wan being the wan pot=
,
> > the set-up would look like this:
> >
> > ip link add dev br-lan type bridge
> > ip link set dev lan1 master br-lan
> > ...
> > ip link set dev lan3 master br-lan
> > ip link add dev br-wan typebridge
> > ip link set dev wan master br-wan
> >
> > That way, if you ever wanted to have more/less ports on the LAN or WAN
> > side, you could do that.
> >
> > The problem with the Device Tree approach is really that we are not
> > sticking to a strict HW description, we are encoding a policy/user
> > configuration in Device Tree.
> >
> > If that is acceptable to you, we can probably start working on some
> > patches and have you help us test them?
> >
> > >
> > > new in v2:
> > >   - added DTS-changes
> > >   - added cover-letter
> > >   - added change of dts-option (default_cpu)
> > >
> > > currently posted not to full maintainers-list for first review,
> > > will do it when patches are ready :)
> > >
> > > Frank Wunderlich (8):
> > >   net: dsa: adding fields for holding information about upstream-port
> > >   net: dsa: add helper functions
> > >   net: dsa: adding handling of second CPU-Port
> > >   net: dsa: add support for GMAC2 wired to ext
> > >   net: dsa: dsa multi cpu (mt7530.c)
> > >   net: dsa: tell GDMA when we are turning on the special tag
> > >   net: dsa: mt7530 add linking to mdio
> > >   net: dsa: changes to dts
> > >
> > >  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 29 +++++++++-
> > >  drivers/net/dsa/mt7530.c                      | 55 +++++++++++++----=
