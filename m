Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752A5C04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 07:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vN7VnlS9L1gMz0YueHFtltYZXWMoXCWKtd69ZVpUUwE=; b=FapkE+V4N4PHyQpqheFZScXPqT
	vWTIG9XLMnvq28yTdUp6uoFM1nDKQ8brTDbOgviYtLfUDkHrcqJUli4IJWoszQH8scP/VGj/Q5hPF
	oOnkm4aGMAIRXGKvfuRPeIarM9QyAD4HZYpFCKA2ibXUdRQep1cqF+WrqU3rTPmXpAcSAQZF5dHnv
	zAppNXCVHPJuXlcszeI8t5tVEkarLprOPulqdtGW+Sg70DWIShAtefK9fJ03wchh56xqmsTumUVZl
	R7Zg6KVcLjGpj1ilKD1n9i5I0jpx4Vxq5jRQoKscti7d4sznfjzWPTAR9+B1WANogPIiOR6Rzpdce
	xEiBQUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRVS-00EXLH-HL; Wed, 28 Sep 2022 07:29:22 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRVH-00EXJ9-A5; Wed, 28 Sep 2022 07:29:12 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id D2A211883981;
	Wed, 28 Sep 2022 07:29:00 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id C75842500370;
	Wed, 28 Sep 2022 07:29:00 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id B3B719EC0019; Wed, 28 Sep 2022 07:29:00 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Wed, 28 Sep 2022 09:29:00 +0200
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@nvidia.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, davem@davemloft.net,
 kuba@kernel.org, netdev@vger.kernel.org, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot
 <vivien.didelot@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens
 <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan
 <shuah@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Yuwei Wang <wangyuweihx@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bridge@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 net-next 6/6] selftests: forwarding: add test of
 MAC-Auth Bypass to locked port tests
In-Reply-To: <YzPwwuCe0HkJpkQe@shredder>
References: <Yxmgs7Du62V1zyjK@shredder>
 <8dfc9b525f084fa5ad55019f4418a35e@kapio-technology.com>
 <20220908112044.czjh3xkzb4r27ohq@skbuf>
 <152c0ceadefbd742331c340bec2f50c0@kapio-technology.com>
 <20220911001346.qno33l47i6nvgiwy@skbuf>
 <15ee472a68beca4a151118179da5e663@kapio-technology.com>
 <Yx73FOpN5uhPQhFl@shredder>
 <086704ce7f323cc1b3cca78670b42095@kapio-technology.com>
 <Yyq6BnUfctLeerqE@shredder>
 <7a4549d645f9bbbf41e814f087eb07d1@kapio-technology.com>
 <YzPwwuCe0HkJpkQe@shredder>
User-Agent: Gigahost Webmail
Message-ID: <d020fe746b30dd048970b3668ffad498@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_002911_522059_B88C2C54 
X-CRM114-Status: GOOD (  21.71  )
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

On 2022-09-28 08:59, Ido Schimmel wrote:
> Sorry for the delay, was away.

Good to have you back. :-)

> 
> On Tue, Sep 27, 2022 at 10:33:10AM +0200, netdev@kapio-technology.com 
> wrote:
>> On 2022-09-21 09:15, Ido Schimmel wrote:
>> > 	bridge fdb add `mac_get $h2` dev br0 blackhole
>> 
>> To make this work, I think we need to change the concept, so that 
>> blackhole
>> FDB entries are added to ports connected to the bridge, thus
>>      bridge fdb add MAC dev $swpX master blackhole
>> 
>> This makes sense as the driver adds them based on the port where the 
>> SMAC is
>> seen, even though the effect of the blackhole FDB entry is switch 
>> wide.
> 
> Asking user space to associate a blackhole entry with a bridge port 
> does
> not make sense to me because unlike regular entries, blackhole entries
> do not forward packets out of this port. Blackhole routes and nexthops
> are not associated with a device either.
> 
>> Adding them to the bridge (e.g. f.ex. br0) will not work in the SW 
>> bridge as
>> the entries then are not found.
> 
> Why not found? This works:
> 
>  # bridge fdb add 00:11:22:33:44:55 dev br0 self local
>  $ bridge fdb get 00:11:22:33:44:55 br br0
>  00:11:22:33:44:55 dev br0 master br0 permanent
> 
> With blackhole support I expect:
> 
>  # bridge fdb add 00:11:22:33:44:55 dev br0 self local blackhole
>  $ bridge fdb get 00:11:22:33:44:55 br br0
>  00:11:22:33:44:55 dev br0 master br0 permanent blackhole

In my previous replies, I have notified that fdb_find_rcu() does not 
find the entry added with br0, and thus fdb_add_entry() that does the 
replace does not replace but adds a new entry. I have been thinking that 
it is because when added with br0 as dev it is added to dev br0's fdb, 
which is not the same as 'dev <Dev> master' fdb...

I think bridge fdb get works in a different way, as I know the get 
functionality gets all fdb entries from all devices and filters them (if 
I am not mistaken)...

