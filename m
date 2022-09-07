Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8727DC6FA8A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 21:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOpqQckQvaqtnlGkcXV6685y4tknkRwthwV0Ap0jxF0=; b=IxTsdjWvYWOifAsu67d9gYA7Sf
	i0uSCz9nbpQl/SYt+vhbLG0eIPTN50b7bNBKVAAlZXwgbLL70rOes6uZ415sdzTzA331ANniwLiM+
	fJElOh092VR/jTN6l2E8mhyVlVRVkoiy8fxG/pGpOjk44aPGaDxXwYjSqWD9n9UPWJb/n1aWWetNI
	3QtywU6OmVF95LRIFThP6t8cffS7XqyjorO1VKkRCiXt8XIj5hxV/3w1MXPykq53MZHdHBLfgqEPZ
	bWyW8uOFuadyDhAarMmXNO0r6p584qENG1rDSPkwLH9mAVPMAC5+1AVE+cYeN59Vl/x68drGx3Vd2
	yMqPvlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW2LV-009zJi-Vm; Wed, 07 Sep 2022 21:12:30 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW2LI-009xjU-A7; Wed, 07 Sep 2022 21:12:18 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id E956A1884A6C;
	Wed,  7 Sep 2022 21:10:07 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id CD0D525032B7;
	Wed,  7 Sep 2022 21:10:07 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id BF8139EC0006; Wed,  7 Sep 2022 21:10:07 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Wed, 07 Sep 2022 23:10:07 +0200
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
In-Reply-To: <YxNo/0+/Sbg9svid@shredder>
References: <YwpgvkojEdytzCAB@shredder>
 <7654860e4d7d43c15d482c6caeb6a773@kapio-technology.com>
 <YwxtVhlPjq+M9QMY@shredder>
 <2967ccc234bb672f5440a4b175b73768@kapio-technology.com>
 <Ywyj1VF1wlYqlHb6@shredder>
 <9e1a9eb218bbaa0d36cb98ff5d4b97d7@kapio-technology.com>
 <YwzPJ2oCYJQHOsXD@shredder>
 <69db7606896c77924c11a6c175c4b1a6@kapio-technology.com>
 <YwzjPcQjfLPk3q/k@shredder>
 <f1a17512266ac8b61444e7f0e568aca7@kapio-technology.com>
 <YxNo/0+/Sbg9svid@shredder>
User-Agent: Gigahost Webmail
Message-ID: <5cee059b65f6f7671e099150f9da79c1@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_141216_528326_FEF6CE34 
X-CRM114-Status: GOOD (  37.21  )
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

On 2022-09-03 16:47, Ido Schimmel wrote:
> On Mon, Aug 29, 2022 at 06:13:14PM +0200, netdev@kapio-technology.com 
> wrote:
>> On 2022-08-29 18:03, Ido Schimmel wrote:
>> > On Mon, Aug 29, 2022 at 05:08:23PM +0200, netdev@kapio-technology.com
>> > wrote:
>> > > On 2022-08-29 16:37, Ido Schimmel wrote:
>> > > > On Mon, Aug 29, 2022 at 02:04:42PM +0200, netdev@kapio-technology.com
>> > > > wrote:
>> > > > > On 2022-08-29 13:32, Ido Schimmel wrote:
>> > > > > Port association is needed for MAB to work at all on mv88e6xxx, but
>> > > > > for
>> > > > > 802.1X port association is only needed for dynamic ATU entries.
>> > > >
>> > > > Ageing of dynamic entries in the bridge requires learning to be on as
>> > > > well, but in these test cases you are only using static entries and
>> > > > there is no reason to enable learning in the bridge for that. I prefer
>> > > > not to leak this mv88e6xxx implementation detail to user space and
>> > > > instead have the driver enable port association based on whether
>> > > > "learning" or "mab" is on.
>> > > >
>> > >
>> > > Then it makes most sense to have the mv88e6xxx driver enable port
>> > > association when then port is locked, as it does now.
>> >
>> > As you wish, but like you wrote "802.1X port association is only needed
>> > for dynamic ATU entries" and in this case user space needs to enable
>> > learning (for refresh only) so you can really key off learning on
>> > "learning || mab". User space can decide to lock the port and work with
>> > static entries and then learning is not required.
>> 
>> I will of course remove all "learning on" in the selftests, which is 
>> what I
>> think you are referring to. In the previous I am referring to the code 
>> in
>> the driver itself which I understand shall turn on port association 
>> with
>> locked ports, e.g. no need for "learning on" when using the feature in
>> general outside selftests...
> 
> "learning on" is needed when dynamic FDB entries are used to authorize
> hosts. Without learning being enabled, the bridge driver (or the
> underlying hardware) will not refresh the entries during forwarding and
> they will age out, resulting in packet loss until the hosts are
> re-authorized.
> 
> Given the current test cases only use static entries, there is no need
> to enable learning on locked ports. This will change when test cases 
> are
> added with dynamic entries.
> 
> Regarding mv88e6xxx, my understanding is that you also need learning
> enabled for MAB (I assume for the violation interrupts). Therefore, for
> mv88e6xxx, learning can be enabled if learning is on or MAB is on.
> Enabling it based on whether the port is locked or not seems 
> inaccurate.

Given that 'learning on' is needed for hardware refreshing of ATU 
entries (mv88e6xxx), and that will in the future be needed in general, I 
think it is best to enable it when a port is locked. Also the matter is 
that the locked feature needs to modify the register that contains the 
PAV. So I see it as natural that it is done there, as it will eventually 
have to be done there.
That the selftests do not need it besides when activating MAB, I think, 
is a special case.

I am at the blackhole driver implementation now, as I suppose that the 
iproute2 command should work with the mv88e6xxx driver when adding 
blackhole entries (with a added selftest)?
I decided to add the blackhole feature as new ops for drivers with 
functions blackhole_fdb_add() and blackhole_fdb_del(). Do you agree with 
that approach?

