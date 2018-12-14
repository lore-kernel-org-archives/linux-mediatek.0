From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 0/8] adding multiple CPU-Ports
Date: Fri, 14 Dec 2018 09:26:24 -0800
Message-ID: <3d53d8cf-3130-17bd-8418-310dda7d93a2@gmail.com>
References: <20181214164847.4851-1-frank-w@public-files.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181214164847.4851-1-frank-w@public-files.de>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, linux-mediatek@lists.infradead.org, vivien.didelot@gmail.com
List-Id: linux-mediatek@lists.infradead.org

Hi Frank,

On 12/14/18 8:48 AM, Frank Wunderlich wrote:
> some switch-chips have multiple CPU-Ports
> 
> this patch-series adds basic functionality and handle the 2
> cpu-Ports of mt7530 on board BananaPi R2
> 
> changes to mtk-ethernet-driver are not included yet,
> because here are still some issues with watchdog-timeouts
> 
> most patches are based on OpenWRT-Patches created by
> John Crispin and only ported to DSA-Core 4.15+ with 2 main differences:
>   - no change to platform-driver
>   - option in dts is named "default_cpu" instead of only "cpu" to
>     allow modification from userspace (additional patches needed)
> 
> complete source (including eth-patches) is uploaded here:
> https://github.com/frank-w/BPI-R2-4.14/commits/4.20-gmac-test

Andrew, Vivien and I were discussing about multi-CPU support lately and
we think that the best and most flexible way to allow multi-CPU ports to
be supported is to allow enslaving the DSA master network devices (CPU
Ethernet controllers) into a bridge because that will inherently define
the mapping between ports. Enslaving the CPU port into the bridge is not
currently allowed because processing of DSA switch tags and bridge
frames were done in an incorrect order, but we can easily change that.

So for instance in a dual CPU configuration interface with eth0 and eth1
being the two DSA master network devices and then lan1 through lan3
through lan4 being the user-visible LAN ports and wan being the wan pot,
the set-up would look like this:

ip link add dev br-lan type bridge
ip link set dev lan1 master br-lan
...
ip link set dev lan3 master br-lan
ip link add dev br-wan typebridge
ip link set dev wan master br-wan

That way, if you ever wanted to have more/less ports on the LAN or WAN
side, you could do that.

The problem with the Device Tree approach is really that we are not
sticking to a strict HW description, we are encoding a policy/user
configuration in Device Tree.

If that is acceptable to you, we can probably start working on some
patches and have you help us test them?

> 
> new in v2:
>   - added DTS-changes
>   - added cover-letter
>   - added change of dts-option (default_cpu)
> 
> currently posted not to full maintainers-list for first review,
> will do it when patches are ready :)
> 
> Frank Wunderlich (8):
>   net: dsa: adding fields for holding information about upstream-port
>   net: dsa: add helper functions
>   net: dsa: adding handling of second CPU-Port
>   net: dsa: add support for GMAC2 wired to ext
>   net: dsa: dsa multi cpu (mt7530.c)
>   net: dsa: tell GDMA when we are turning on the special tag
>   net: dsa: mt7530 add linking to mdio
>   net: dsa: changes to dts
> 
>  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 29 +++++++++-
>  drivers/net/dsa/mt7530.c                      | 55 +++++++++++++------
>  drivers/net/dsa/mt7530.h                      |  4 ++
>  include/net/dsa.h                             | 22 ++++++++
>  net/dsa/dsa2.c                                | 36 ++++++++++++
>  net/dsa/dsa_priv.h                            |  5 ++
>  net/dsa/slave.c                               |  3 +-
>  7 files changed, 135 insertions(+), 19 deletions(-)
> 


-- 
Florian
