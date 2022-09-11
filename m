Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD1BC6FA83
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Sep 2022 09:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UkHqcQc6EB7R+gqoYnIAnWqnQ7Dky2Y23diYXxg+aM=; b=AIekhwFm+tw8vNKiPKOLXQmGg3
	cn3moXBKjqyskAggdexeLgTPkS0CFMCG1iHsPeYo0wWQNXVCjkB+TYdRZWWf1Evf/troS5zVROzKf
	ESmVYPjioR4zF0mth/V9KBnZrloUSUJ3Y/2HCj5qVLAmkPUs+hpa7zLp5xXkntvaSi8Ws4gtRsLLh
	6B5rn6zW/9RXIKoO1F3My++UjvbjY4A5+WzXRbTH6DXJVlFBTHOQ6MqaeYkdy2UG9dLFjk1VEdCFu
	g8GjRZZ+KXx2NVmtos3d7bTBpkx9QZbe9D9mzkUxzPv2OxirZ7fyDY9bOcMF5d1JcgqbGER6/swhC
	9v72q7lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXJCP-00HJru-4V; Sun, 11 Sep 2022 09:24:21 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXJCE-00HJi3-Fn; Sun, 11 Sep 2022 09:24:11 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 0ECF71883A1B;
	Sun, 11 Sep 2022 09:23:56 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id EC96825032B7;
	Sun, 11 Sep 2022 09:23:55 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id E32589EC0002; Sun, 11 Sep 2022 09:23:55 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Sun, 11 Sep 2022 11:23:55 +0200
From: netdev@kapio-technology.com
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Ido Schimmel <idosch@nvidia.com>, davem@davemloft.net, kuba@kernel.org,
 netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kurt Kanzenbach
 <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung Huh
 <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Sean Wang
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
In-Reply-To: <20220911001346.qno33l47i6nvgiwy@skbuf>
References: <YwzPJ2oCYJQHOsXD@shredder>
 <69db7606896c77924c11a6c175c4b1a6@kapio-technology.com>
 <YwzjPcQjfLPk3q/k@shredder>
 <f1a17512266ac8b61444e7f0e568aca7@kapio-technology.com>
 <YxNo/0+/Sbg9svid@shredder>
 <5cee059b65f6f7671e099150f9da79c1@kapio-technology.com>
 <Yxmgs7Du62V1zyjK@shredder>
 <8dfc9b525f084fa5ad55019f4418a35e@kapio-technology.com>
 <20220908112044.czjh3xkzb4r27ohq@skbuf>
 <152c0ceadefbd742331c340bec2f50c0@kapio-technology.com>
 <20220911001346.qno33l47i6nvgiwy@skbuf>
User-Agent: Gigahost Webmail
Message-ID: <15ee472a68beca4a151118179da5e663@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_022410_723439_6011720A 
X-CRM114-Status: GOOD (  21.29  )
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

On 2022-09-11 02:13, Vladimir Oltean wrote:
> On Fri, Sep 09, 2022 at 03:11:56PM +0200, netdev@kapio-technology.com 
> wrote:
>> > > > On Wed, Sep 07, 2022 at 11:10:07PM +0200, netdev@kapio-technology.com wrote:
>> > > > > I am at the blackhole driver implementation now, as I suppose that the
>> > > > > iproute2 command should work with the mv88e6xxx driver when adding blackhole
>> > > > > entries (with a added selftest)?
>> > > > > I decided to add the blackhole feature as new ops for drivers with functions
>> > > > > blackhole_fdb_add() and blackhole_fdb_del(). Do you agree with that approach?
>> > > >
>> > > > I assume you are talking about extending 'dsa_switch_ops'?
>> > >
>> > > Yes, that is the idea.
>> > >
>> > > > If so, it's up to the DSA maintainers to decide.
>> >
>> > What will be the usefulness of adding a blackhole FDB entry from user
>> > space?
>> 
>> With the software bridge it could be used to signal a untrusted host 
>> in
>> connection with a locked port entry attempt. I don't see so much use 
>> other
>> that test purposes with the driver though.
> 
> Not a huge selling point, to be honest. Can't the blackhole flag remain
> settable only in the device -> bridge direction, with user space just
> reading it?

That is possible, but it would of course not make sense to have 
selftests of the feature as that would not work unless there is a driver 
with this capability (now just mv88e6xxx).

