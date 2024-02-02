Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DF9C48291
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crjoSPBUvzypq9vNbZVcbZGQ/BU+cITu63QeHIzvCVI=; b=MSxlBwfmIr93UhryXYWInpjGNL
	3x0JIGe85OWUDb994OPfnpFt8EV/QIjkX/FzQDmsDJcb8RSaG4QuDoNAixwTOZ0nmPXtVEQZVIqvL
	g0tfBlIMEYaTsQvXWp3WS6uRblq+WID0auCESaHajOPGYlyy0SLcZZGZG2RgIyTGOSQlLmYfUskEx
	lvcpyGG2sWNxamIrO3Mtj1+uwBnBqP8VXOqXITZavOlnRGLwhByernhFYRXqOpHp2gXqD8F6SCK5H
	Djogngx4cOKafjN0QBfGcApMuxf4hfWwYRU5oWTYjZwLyuXRsD+H6zQSOx97Q06F4ydXXbWsB/avl
	+Q3TuNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVqoL-0000000B9bv-3o8H;
	Fri, 02 Feb 2024 10:30:17 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVqoI-0000000B9Zy-03zT;
	Fri, 02 Feb 2024 10:30:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CBB2E0008;
	Fri,  2 Feb 2024 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1706869810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=crjoSPBUvzypq9vNbZVcbZGQ/BU+cITu63QeHIzvCVI=;
	b=bgiZ/q6tt6U9xQrM2lAn9ElPxS3RRYyKEU/tQOGrmExnAR46AtyAOqiLLDZgH2MM0Dj/yh
	rHjGUNrraqGN0oFwlb0KxUt7gOgmbtbQWihfE/5rcjgUcGQTZFfsleE7c3CgEBnWHQD3dW
	5RrFgMm/Bwz4Ts9gsGb823rspvAdUyNCi701mUWN93gEpHVgd5/KGdbO+G70tt6ZdULF/7
	uUIPKtE2z0rTUxC2q+vhN9HOc03ozI2hQoBWs04WVqFO4K4Ra5UTJa+U7332N8rGMP91VI
	tYwCw80HLoICwDT5Jj7me5s+skZPiUD38obiHKZyqOOhMwDuRqZqMZ9UvX52Yw==
Message-ID: <5cb18ed0-784d-42d4-9462-9f7a149cb9a4@arinc9.com>
Date: Fri, 2 Feb 2024 13:30:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 5/7] net: dsa: mt7530: simplify
 mt7530_setup_port6() and change to void
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240130-for-netnext-mt7530-improvements-2-v2-0-ba06f5dd9eb0@arinc9.com>
 <20240130-for-netnext-mt7530-improvements-2-v2-5-ba06f5dd9eb0@arinc9.com>
 <Zbkc4BRORWYu79GZ@makrotopia.org>
 <77c38489-8a73-4b00-bd82-48174b4d620f@arinc9.com>
 <20240201235704.6wxbkpli3dk4pn4w@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240201235704.6wxbkpli3dk4pn4w@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_023014_485681_56F1205B 
X-CRM114-Status: GOOD (  25.96  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2.02.2024 02:57, Vladimir Oltean wrote:
> On Tue, Jan 30, 2024 at 08:46:04PM +0300, Arınç ÜNAL wrote:
>> would supposedly achieve 2 Gbps TX & 2 Gbps RX
> 
> Source? Commit 8efaa653a8a5 ("net: ethernet: mediatek: Add MT7621 TRGMII
> mode support") says "TRGMII speed is 1200MBit.".

That is for MT7621. It's claimed that TRGMII on MT7621 can only handle that
much. I already told you I'm doing the test on MT7623NI SoC.

MT7623 is ARM and more powerful. On that one, the PLL frequency can be set
all the way up to 362.5 MHz to provide 2900 Mbps (allegedly).

You can check the repository that the commit above links to for more
details:

https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/591910e127cd9c811fe9e811ddb6c7278d8ed934/linux-mt/drivers/net/ethernet/raeth/Kconfig#L141
https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/591910e127cd9c811fe9e811ddb6c7278d8ed934/linux-mt/drivers/net/ethernet/raeth/raeth_config.h#L201
https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/591910e127cd9c811fe9e811ddb6c7278d8ed934/u-boot-mt/drivers/net/rt2880_eth.c#L2178

> 
>> Unless the MediaTek SoC ethernet driver somehow caps TRGMII to 1 Gbps,
>> I consider this whole TRGMII shenanigans a scam
> 
> I laughed :)
> 
> You have to see whether the CPU isn't in fact at 100% already, becoming
> a bottleneck before the interface speed does.

I'm happy I'm entertaining you but you've got to give me a little credit.
:)

MT7621 won't even handle 1 Gbps RX & 1 Gbps TX. But if the IP traffic is
offloaded to the packet processing engine
(drivers/net/ethernet/mediatek/mtk_ppe_offload.c), there won't be any load
on the CPU.

table ip global {
	flowtable f {
		hook ingress priority 0
		devices = { wan, lan1, lan2, lan3, lan4 }
		flags offload
	}

	chain forward {
		type filter hook forward priority 0
		ip protocol { tcp, udp } flow offload @f
	}

	chain postrouting {
		type nat hook postrouting priority 0
		oifname "wan" masquerade
	}
}

MT7623 can handle 1 Gbps RX & 1 Gbps without much CPU load. It performs the
same with or without hardware flow offloading, unlike MT7621.

The way I test this:

I do the test on a single computer. I have two gigabit ports on my
motherboard. I isolate a port by putting it on another network namespace to
do the test.

Client Network
iperf client: 192.168.2.2/24
router: 192.168.2.1/24

Server Network
router: 192.168.3.2/24
iperf server: 192.168.3.1/24

iperf Client
ip a add 192.168.2.2/24 dev enp9s0
ip l set up enp9s0
ip route add 192.168.3.1 via 192.168.2.1
iperf3 -c 192.168.3.1 --bidir -t 20

iperf Server
ip netns add iperfserver
ip link set dev eno1 netns iperfserver
ip netns exec iperfserver ip a add 192.168.3.1/24 dev eno1
ip netns exec iperfserver ip l set up eno1
ip netns exec iperfserver iperf3 -s

I did say I've done thorough testing.

> 
> Also, mtk_eth_soc.c has an interesting comment "TRGMII is not permitted
> on MT7621 if using DDR2" - not sure if applicable to your setup or not.

My device has DDR3 memory. Also, with a device tree defining trgmii on a
link of MediaTek SoC MAC, that check should prevent the mtk_eth_soc driver
from configuring the MAC if the device has DDR2 memory, no?

> 
> I just got myself an ASUS RT-AX1800U (uses the mt7621_asus_rt-ax53u.dts
> device tree AFAICT) which I'll be setting up with OpenWrt in the weeks
> to come, and on which I might also be able to run some tests from time
> to time.

Doing tests on MT7621 will be useless without utilising the PPE. To use it,
you can add these to /etc/config/firewall:

config defaults
	...
	option flow_offloading '1'
	option flow_offloading_hw '1'

Or enable software flow offloading and hardware flow offloading options if
using LuCI. When both options are enabled, hardware flow offloading will be
used.

Make sure to change the PLL frequency on the MT7530 side to 150 MHz. It
operates at the standard RGMII frequency since commit 37c218d8021e ("net:
dsa: mt7530: fix corrupt frames using trgmii on 40 MHz XTAL MT7621").

For 40MHz XTAL:
0x0640 x 0d1,2 = 0x0780

For 25MHz XTAL:
0x0a00 x 0d1,2 = 0x0c00

Arınç

