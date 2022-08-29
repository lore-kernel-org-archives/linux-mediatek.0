Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4879ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 08:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGtUkxuqt12+nyi8VJdBTsgZCfoYZPZxi8bljkJlfUU=; b=vyftuAMjpuPV76j1tH/r4gMIVD
	njTCWG2nDx18i1WEW/YgFdaWfLddf13+eFvVpI3tSTVQ4zMNnKIpCUxecsIrxuvT7c/fNuSO2nT/m
	Ncapabcqhm4xBLnL/J1xqm7y01AvqTWZQ9v7DqS01oJDNPTEqMU+WRoe6JBHSXUqmxbo7k4etvc0Q
	F5y1WR1SghnSQda6uVJN4NnnbkoCRV3QQkm6qICFb68RdKq34ndqKjZSIhqYvOvfdmIN52IEvCKYu
	Be/LCXuUQAsPbqVtZ5mCdggvVw/G2ZdF2n5kkBKyIsWZuzQnOJNRCxJRSsPz91U4VcPR8CDxDiIMn
	cjdGG6kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZlA-005xtO-Gk; Mon, 29 Aug 2022 08:04:40 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZkx-005xiX-Bw; Mon, 29 Aug 2022 08:04:29 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 8D99C1883996;
	Mon, 29 Aug 2022 08:04:25 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 82C7625032B7;
	Mon, 29 Aug 2022 08:04:25 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 72B209EC0004; Mon, 29 Aug 2022 08:04:25 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Mon, 29 Aug 2022 10:04:25 +0200
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
Subject: Re: [PATCH v5 net-next 1/6] net: bridge: add locked entry fdb flag to
 extend locked port feature
In-Reply-To: <YwxwPJOx/n5SHZM5@shredder>
References: <20220826114538.705433-1-netdev@kapio-technology.com>
 <20220826114538.705433-2-netdev@kapio-technology.com>
 <Ywo16vHMqxxszWzX@shredder>
 <dd9a4156fe421f6be3a49f5b928ef77e@kapio-technology.com>
 <YwxwPJOx/n5SHZM5@shredder>
User-Agent: Gigahost Webmail
Message-ID: <7e4b58a75ece9cce4c841c33d7d66265@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_010427_607295_0936DC91 
X-CRM114-Status: GOOD (  15.98  )
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

On 2022-08-29 09:52, Ido Schimmel wrote:
> On Sun, Aug 28, 2022 at 12:23:30PM +0200, netdev@kapio-technology.com 
> wrote:
>> On 2022-08-27 17:19, Ido Schimmel wrote:
>> > On Fri, Aug 26, 2022 at 01:45:33PM +0200, Hans Schultz wrote:
>> > >
>> > >  	nbp_switchdev_frame_mark(p, skb);
>> > > @@ -943,6 +946,10 @@ static int br_setport(struct net_bridge_port
>> > > *p, struct nlattr *tb[],
>> > >  	br_set_port_flag(p, tb, IFLA_BRPORT_NEIGH_SUPPRESS,
>> > > BR_NEIGH_SUPPRESS);
>> > >  	br_set_port_flag(p, tb, IFLA_BRPORT_ISOLATED, BR_ISOLATED);
>> > >  	br_set_port_flag(p, tb, IFLA_BRPORT_LOCKED, BR_PORT_LOCKED);
>> > > +	br_set_port_flag(p, tb, IFLA_BRPORT_MAB, BR_PORT_MAB);
>> > > +
>> > > +	if (!(p->flags & BR_PORT_LOCKED))
>> > > +		p->flags &= ~BR_PORT_MAB;
>> 
>> The reason for this is that I wanted it to be so that if you have MAB
>> enabled (and locked of course) and unlock the port, it will 
>> automatically
>> clear both flags instead of having to first disable MAB and then 
>> unlock the
>> port.
> 
> User space can just do:
> 
> # bridge link set dev swp1 locked off mab off
> 
> I prefer not to push such logic into the kernel and instead fail
> explicitly. I won't argue if more people are in favor.

I shall do it as you suggest. It sounds fair. :-)

