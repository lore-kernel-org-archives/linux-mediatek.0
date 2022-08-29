Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF4FECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 08:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaIeDABoo7JeM6aEcm+r83lRD/2+upZspuIW69ML63c=; b=nURWQuhJidNWol0Yi9Pym7HWRl
	pVd0g6vBHA34ULoOSg+12NzIP8WhjXEbgaggF74h4bLBKDQKbS5Le7Hw9hoI2QKDUrdCKUe+ZMBLn
	LGzsamimNIjGA157+J5LYpSPCZH5Vyd5G1gzasRbalflO7m4kKMbPSjwPRj+ziA2jZvCyNJmtKCXy
	/7seWD8G76d/eVCFJdTwTLHD5A7OPnPu6FF7kuN30AGbFl65pSgwhe+BYzS6xmnG/fqFx/BQDkQlZ
	wlUdo95nuWB07c/g8e+DYYDwOi6PQY9mqAW3PDkkBW8d7CKBpXkqzlYxOgmL5l3EEJRf8j15P3Zig
	ZidBdeqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZiI-005wCw-Ps; Mon, 29 Aug 2022 08:01:42 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZi2-005w1Z-Ja; Mon, 29 Aug 2022 08:01:28 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 939241884923;
	Mon, 29 Aug 2022 08:01:18 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 6632225032B7;
	Mon, 29 Aug 2022 08:01:18 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 5AE9C9EC0002; Mon, 29 Aug 2022 08:01:18 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Mon, 29 Aug 2022 10:01:18 +0200
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@nvidia.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt
 Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung
 Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, Christian Marangi
 <ansuelsmth@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Yuwei Wang
 <wangyuweihx@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 net-next 6/6] selftests: forwarding: add test of
 MAC-Auth Bypass to locked port tests
In-Reply-To: <YwxtVhlPjq+M9QMY@shredder>
References: <20220826114538.705433-1-netdev@kapio-technology.com>
 <20220826114538.705433-7-netdev@kapio-technology.com>
 <YwpgvkojEdytzCAB@shredder>
 <7654860e4d7d43c15d482c6caeb6a773@kapio-technology.com>
 <YwxtVhlPjq+M9QMY@shredder>
User-Agent: Gigahost Webmail
Message-ID: <2967ccc234bb672f5440a4b175b73768@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_010126_964355_5C2F01D3 
X-CRM114-Status: GOOD (  28.94  )
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

On 2022-08-29 09:40, Ido Schimmel wrote:
> On Sun, Aug 28, 2022 at 02:00:29PM +0200, netdev@kapio-technology.com 
> wrote:
>> On 2022-08-27 20:21, Ido Schimmel wrote:
>> > On Fri, Aug 26, 2022 at 01:45:38PM +0200, Hans Schultz wrote:
>> > > +locked_port_mab()
>> > > +{
>> > > +	RET=0
>> > > +	check_locked_port_support || return 0
>> > > +
>> > > +	ping_do $h1 192.0.2.2
>> > > +	check_err $? "MAB: Ping did not work before locking port"
>> > > +
>> > > +	bridge link set dev $swp1 locked on
>> > > +	bridge link set dev $swp1 learning on
>> >
>> > "locked on learning on" is counter intuitive and IMO very much a
>> > misconfiguration that we should have disallowed when the "locked" option
>> > was introduced. It is my understanding that the only reason we are even
>> > talking about it is because mv88e6xxx needs it for MAB for some reason.
>> 
>> As the way mv88e6xxx implements "learning off" is to remove port 
>> association
>> for ingress packets on a port, but that breaks many other things such 
>> as
>> refreshing ATU entries and violation interrupts, so it is needed and 
>> the
>> question is then what is the worst to have 'learning on' on a locked 
>> port or
>> to have the locked port enabling learning in the driver silently?
>> 
>> Opinions seem to differ. Note that even on locked ports without MAB, 
>> port
>> association on ingress is still needed in future as I have a dynamic 
>> ATU
>> patch set coming, that uses age out violation and hardware refreshing 
>> to let
>> the hardware keep the dynamic entries as long as the authorized 
>> station is
>> sending, but will age the entry out if the station keeps silent for 
>> the
>> ageing time. But that patch set is dependent on this patch set, and I 
>> don't
>> think I can send it before this is accepted...
> 
> Can you explain how you envision user space to work once everything is
> merged? I want to make sure we have the full picture before more stuff
> is merged. From what you describe, I expect the following:
> 
> 1. Create topology, assuming two unauthorized ports:
> 
> # ip link add name br0 type bridge no_linklocal_learn 1 (*)
> # ip link set dev swp1 master br0
> # ip link set dev swp2 master br0
> # bridge link set dev swp1 learning on locked on
> # bridge link set dev swp2 learning on locked on

The final decision on this rests with you I would say. Actually I forgot 
to remove the port association in the driver in this version.

> # ip link set dev swp1 up
> # ip link set dev swp2 up
> # ip link set dev br0 up
> 
> 2. Assuming h1 behind swp1 was authorized using 802.1X:
> 
> # bridge fdb replace $H1_MAC dev swp1 master dynamic

With the new MAB flag 'replace' is not needed when MAB is not enabled.

> 
> 3. Assuming 802.1X authentication failed for h2 behind swp2, enable 
> MAB:
> 
> # bridge link set dev swp2 mab on
> 
> 4. Assuming $H2_MAC is in our allow list:
> 
> # bridge fdb replace $H2_MAC dev swp2 master dynamic
> 
> Learning is on in order to refresh the dynamic entries that user space
> installed.

Yes, port association is needed for those reasons. :-)

> 
> (*) Need to add support for this option in iproute2. Already exposed
> over netlink (see 'IFLA_BR_MULTI_BOOLOPT').

Should I do that in this patch set?

