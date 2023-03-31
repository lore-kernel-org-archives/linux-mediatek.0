Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080AEC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ecLS1onq9N2tyzQwhBARY6nRh+ymSPgudwkh/n94Fw=; b=tQLWdVs1tXOmO8YPxyESYcyY+D
	KlrEd7uOHFLYgPi5MgX6Il27VKygXghkNV4Z1VACpHfvQTetLhq1mCsDywTgz2HifB4FbOk5LLGoK
	5TLDDsej0PIfsjny6AH2tCo/APkHQHu+yeIIO8zBL0qq0R81NkTDDbA3Q00AbCXJevdL2DJ/DMFb+
	rQL4273WCY+P1LbAZhm6JY/PhWp9o/4Zn117jxvvTK7bGoZA/h01uKy/gqzGNFtL41/qbC+QK65sn
	3NOwIGQGaEGtnThtlU1dgVOfbTU0FJDy4SBAuE8FCKnfR6gJ7tr7PdwdUKuT8wHpGxbGHrAMGvgH1
	MzV9xUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piEAw-007OdE-2S;
	Fri, 31 Mar 2023 12:48:14 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piEAk-007Npb-1A;
	Fri, 31 Mar 2023 12:48:03 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 920C21883AFB;
	Fri, 31 Mar 2023 12:45:52 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 83E4D25004E1;
	Fri, 31 Mar 2023 12:45:52 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 757369B403F7; Fri, 31 Mar 2023 12:45:52 +0000 (UTC)
X-Screener-Id: e32ae469fa6e394734d05373d3a705875723cf1e
Received: from fujitsu (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
	by smtp.gigahost.dk (Postfix) with ESMTPSA id C93F09B403E4;
	Fri, 31 Mar 2023 12:45:51 +0000 (UTC)
From: Hans Schultz <netdev@kapio-technology.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Ido Schimmel <idosch@nvidia.com>, davem@davemloft.net, kuba@kernel.org,
 netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Andrew
 Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens
 <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 "maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?=
 <clement.leger@bootlin.com>, Jiri Pirko <jiri@resnulli.us>, Ivan Vecera
 <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, Christian Marangi
 <ansuelsmth@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:RENESAS RZ/N1
 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>, "moderated
 list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>, "open
 list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 net-next 6/6] selftests: forwarding: add dynamic FDB
 test
In-Reply-To: <20230331093732.s6loozkdhehewlm4@skbuf>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-7-netdev@kapio-technology.com>
 <ZBgdAo8mxwnl+pEE@shredder> <87a5zzh65p.fsf@kapio-technology.com>
 <ZCMYbRqd+qZaiHfu@shredder> <874jq22h2u.fsf@kapio-technology.com>
 <20230330192714.oqosvifrftirshej@skbuf>
 <871ql5mjjp.fsf@kapio-technology.com>
 <20230331093732.s6loozkdhehewlm4@skbuf>
Date: Fri, 31 Mar 2023 14:43:11 +0200
Message-ID: <87tty1nlb4.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_054802_553677_AA9A7F0F 
X-CRM114-Status: GOOD (  16.70  )
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

On Fri, Mar 31, 2023 at 12:37, Vladimir Oltean <olteanv@gmail.com> wrote:
>
> So, by running the command I posted in the earlier email, you actually
> run it on the physical DSA user port interfaces, and it should pass
> there too.

Okay, that sounds like a good idea which I have not done before. I am
seeing how I can install Debian in an Qemu or VMWare setup to be able to
test that way.

> This is based on the equivalency principle between the
> software and the hardware data paths that I was talking about.
>
> If you're actively and repeatedly making an effort to work with your eyes
> closed, and then build strawmen around the fact that you don't see, then
> you're not going to get very friendly reactions from people, me included,
> who explain things to you that pertain to your due diligence. This is
> because these people know the things that they're explaining to you out
> of their own due diligence, and, as a result, are not easily fooled by
> your childish excuses.

I am not coming with excuses here, and certainly not childish ones at
that either. I am just pointing out that on my device the tests don't
run well because of memory shortage and my reasoning why I think it is
so.
I will as long as the system is as it is with these selftests, just run
single subtests at a time on target, but if I have new phy problems like
the one you have seen I have had before, then testing on target becomes
off limits.

