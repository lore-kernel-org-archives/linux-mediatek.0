Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85654ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NNHvafX++FyyRnITHQ1PF1LKAfoK7GM352PgfzZKO4=; b=ESRcuJ3Rocl8ItuIqf9Y5smHCI
	W+OXLQi25X5l7zFn2F5GlgKAQxzu7f31/vQ0C4JBzR3vdfvvUl6G9DrmEkY/TIwR76p5Rdjwm9wt1
	5dLAQ+g4tVktJt7aWZj36jcePB8nZ9rHvYgFvFf9aSg0+iy2KwZqxdN469FZ8hiRuEqXKownHVzrc
	nzc27gKKmVny6BIUnCqRgdQUtcj3uJLTTBHDPjyeIGOdgt6Iigs2PLZHOuZqLAR6xDtRp/J0gUc5H
	zM+DQxP3Ixd4/x9QpWJZgYoqK3BGJ0+HVzlZsO7NOdimWzkwICPK75T2kL3sQwtoWkGh8N6fqb6iA
	P1IBQtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSaYQ-006Qhq-9h; Mon, 29 Aug 2022 08:55:34 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSaY9-006Qab-OI; Mon, 29 Aug 2022 08:55:21 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 00ECB18848CB;
	Mon, 29 Aug 2022 08:55:16 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id EC9B325032B7;
	Mon, 29 Aug 2022 08:55:15 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id DE5709EC0003; Mon, 29 Aug 2022 08:55:15 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Mon, 29 Aug 2022 10:55:15 +0200
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
Message-ID: <c1123f1b242ea037867a5ec7130232f4@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_015518_186617_53F8380D 
X-CRM114-Status: GOOD (  19.79  )
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

> # bridge link set dev swp1 learning on locked on
> # bridge link set dev swp2 learning on locked on

As we must think in how most drivers work, which I am not knowledgeable 
of, I think that it is probably the best to think of the way mv88e6xxx 
works as an outlier.
If that is true, then I think the best option is to go with:
#bridge link set dev $swp1 learning off locked on
#bridge link set dev $swp2 learning off locked on

Then the cleanup side will just be:
#bridge link set dev $swp1 locked off
#bridge link set dev $swp2 locked off

The state 'learning off' is then consistent with the behavior of both 
the bridge and driver after the cleanup.

