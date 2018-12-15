From: "Frank Wunderlich" <frank-w@public-files.de>
Subject: Aw: Re:  Re: [PATCH 0/8] adding multiple CPU-Ports
Date: Sat, 15 Dec 2018 11:01:44 +0100
Message-ID: <trinity-38c07b55-8979-4266-8e43-d7e33e384189-1544868104616@3c-app-gmx-bs07>
References: <20181214164847.4851-1-frank-w@public-files.de>
 <3d53d8cf-3130-17bd-8418-310dda7d93a2@gmail.com>
 <trinity-d5689ac9-d645-48e5-bed9-8a51826f9c50-1544809703712@3c-app-gmx-bs32>
 <0d78bf87-8f91-6936-6366-5900f9070383@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <0d78bf87-8f91-6936-6366-5900f9070383@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, vivien.didelot@gmail.com
List-Id: linux-mediatek@lists.infradead.org

Hi,

> Von: "Florian Fainelli" <f.fainelli@gmail.com>
> 
> Yes, this is what I mean with DT is dictating policy. If you have a
> properly working DSA switch driver, then all ports are segregated from
> one another and there is no cross talk, so there is no risk of e.g:
> exposing LAN devices to the WAN accidentally.

how can i test this with single CPU-Port? this is one intention to get second cpu-port working.

> > currently there is a bug in Ethernet-Patches you find on my github resulting in tx timeout (netdev watchdog) after switching connection (port1 down, reconnect cable to another port and bring this up) between interfaces. Thats the reason i only posted the dsa/dts-Part.
> 
> Strange, that sounds like a separate issue does not it?

i expect this issue is not in this Patch-Series, but i want to be honest that i not fixed the issue i've found while testing. but the dsa-mapping seems correct and i've seen no packetloss while testing over eth0 and eth1 (Ping with 1000+ packets and "normal" traffic), only with iperf.

here are many people which may help me to get it solved and i don't expect that my patch-series will me merged to mainline in the current state. It is just to get feedback to (my) current way, but of course i want to get it working in mainline anyhow :)

i don't want to steal anybodys time, but in this specific part i need some help. I've spend much time to get Johns Patches working so far in 4.20.

after googling around (and writing with andrew and ryder) the problem seems to be in interrupt-handling of second port or in this patch (which seems to be needed as far as i understand johns Patches): https://github.com/frank-w/BPI-R2-4.14/commit/150fa665aa1d482a8360d2ad00271f62da3a9b05 ("add BQL-related changes").

this issue seems to be only triggered if i make much traffic (iperf) and switching the testing port multiple times (wan=>lan=>wan).

> Von: "Sean Wang" <sean.wang@kernel.org>
> Is it a problem just present after applies those mulitple-cpus patches
> you propose here? or it also happens at the native code in mainline.

as i wrote here above i guess the problem is not in dsa-code i've posted (but i cannot be sure so i've added the hint)....more in BQL/DMA-handling of ethernet-driver, but i currently not know if it's in mainline-driver or after my patches. I do not full understand the interrupt-/packet-handling in driver...i've only ported Johns Patches to the new (dsa-) Framework.
Imho i cannot test with this dsa-patches alone, because it seems that modifications of ethernet-driver is also necessary...correct me please if i'm wrong.

i've tested same in 4.14 with johns Patches (https://github.com/frank-w/BPI-R2-4.14/tree/4.14-main/) and cannot trigger this issue there.

btw. your email-account is still bouncing (@sean).

> > I've contacted mediatek-Team (Ryder Lee, Marc-MC Lee, Landen Chao, Steven Liu) at beginning of this week and got a Patch from Ryder (you see on top of my repo) which unfortunately wont fix it. Maybe anyone here sees the Problem
> 
> Keep in mind that multi-CPU port is more of an optimization than a real
> necessity in most cases. If you have a single switch that spans multiple
> LAN/WAN ports and multiple CPU ports, the only advantage of assigning
> WAN to a specific CPU port and LAN ports to a specific CPU port is to
> effectively double the bandwidth, both within the switch and within the
> SoC's architecture (permitted it is designed that way). There is still,
> unless there is a NAT-P accelerator a need to perform IP routing in
> software...

right, imho if i make a software-bridge over dsa-user-ports (e.g. bridging lan0-lan3) the traffic from one lan-port goes to the SOC and back over 1 CPU-Lane, so if these lan-Ports are each 1 GBit (and there is nearly the maximum traffic) and CPU-Lane has 2GBit full-duplex (TRGMII) boost, 2 Ports are enough to make the CPU-Lane "close" and no additional Traffic is left for the other 3 Ports (wan + 2 x lan). Thats my main motivation getting the second lane working.

regards Frank
