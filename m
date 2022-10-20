Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFA1C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVrXjJEGfmuc1gn25nOyrrLuiZAhQTfMb/N3tT9O3CI=; b=wiomM48pMqTy9Gb7JGOHI9A7tM
	HIRsmgjc7KlqzFMnq/1AFk80VmhuOwER7K3fPYsnOVhp8NZv4uhx9HERd6Azq/L2p+k0JTD5dO9Tx
	FSk8Ij0o7GasDjkUau8jI9DAM/Rpg2JDAMQ9nDdUUNtUsnV0UxzwnCzFj5Q2dohPpoReP0Qt6EajW
	17vGgmKsuKZqLCvNI3BHm7t90tmxrNmIR2oKKii/BAaT/iC930v7oUwk7Iinu+1CsgGRCiK53+d+S
	BZlCAHPjOR4wX8MZHhfnrhcwXfdehyXfzLifPOf6FUzj+dvh3QhActg1wCU+YozKEzmnvpjPu4rnp
	2BpVM5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olcne-001t8n-3O; Thu, 20 Oct 2022 21:09:58 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olcnR-001sxs-Aa; Thu, 20 Oct 2022 21:09:46 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id F066718849CE;
	Thu, 20 Oct 2022 21:09:40 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id D1DD725001FA;
	Thu, 20 Oct 2022 21:09:40 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id C9D209EC0002; Thu, 20 Oct 2022 21:09:40 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 20 Oct 2022 23:09:40 +0200
From: netdev@kapio-technology.com
To: Vladimir Oltean <olteanv@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien
 Didelot <vivien.didelot@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke
 Mehrtens <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan
 <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>, Christian Marangi
 <ansuelsmth@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Yuwei Wang
 <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>, Ido Schimmel
 <idosch@nvidia.com>, Florent Fourcot <florent.fourcot@wifirst.fr>, Hans
 Schultz <schultz.hans@gmail.com>, Joachim Wiberg <troglobit@gmail.com>, Amit
 Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 10/12] net: dsa: mv88e6xxx: mac-auth/MAB
 implementation
In-Reply-To: <20221020132538.reirrskemcjwih2m@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221020132538.reirrskemcjwih2m@skbuf>
User-Agent: Gigahost Webmail
Message-ID: <3e58594c1223f4591e56409cd5061de7@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_140945_545513_A80A8746 
X-CRM114-Status: GOOD (  23.96  )
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

On 2022-10-20 15:25, Vladimir Oltean wrote:
> 
> This would not have been needed if dsa_port_set_state() would have
> called dsa_port_fast_age().
> 
> Currently it only does that if dp->learning is true. From previous
> conversations I get the idea that with MAB, port learning will be 
> false.
> But I don't understand why; isn't MAB CPU-assisted learning? I'm 
> looking
> at the ocelot hardware support for this and I think it could be
> implemented using a similar mechanism, but I certainly don't want to 
> add
> more workarounds such as this in other drivers.
> 
> Are there any other ways to implement MAB other than through CPU
> assisted learning?
> 
> We could add one more dp->mab flag which tracks the "mab" brport flag,
> and extend dsa_port_set_state() to also call dsa_port_fast_age() in 
> that
> case, but I want to make sure there isn't something extremely obvious
> I'm missing about the "learning" flag.
> 

As learning is off on locked ports, see other response, your dp->mab 
flag
idea might be a way to go, just need confirmation that this is needed.


>> @@ -6572,8 +6604,10 @@ static int mv88e6xxx_port_bridge_flags(struct 
>> dsa_switch *ds, int port,
>>  	if (flags.mask & BR_MCAST_FLOOD) {
>>  		bool multicast = !!(flags.val & BR_MCAST_FLOOD);
>> 
>> +		mv88e6xxx_reg_lock(chip);
>>  		err = chip->info->ops->port_set_mcast_flood(chip, port,
>>  							    multicast);
>> +		mv88e6xxx_reg_unlock(chip);
>>  		if (err)
>>  			goto out;
>>  	}
>> @@ -6581,20 +6615,34 @@ static int mv88e6xxx_port_bridge_flags(struct 
>> dsa_switch *ds, int port,
>>  	if (flags.mask & BR_BCAST_FLOOD) {
>>  		bool broadcast = !!(flags.val & BR_BCAST_FLOOD);
>> 
>> +		mv88e6xxx_reg_lock(chip);
>>  		err = mv88e6xxx_port_broadcast_sync(chip, port, broadcast);
>> +		mv88e6xxx_reg_unlock(chip);
>>  		if (err)
>>  			goto out;
>>  	}
>> 
>> +	if (flags.mask & BR_PORT_MAB) {
>> +		chip->ports[port].mab = !!(flags.val & BR_PORT_MAB);
>> +
>> +		if (!chip->ports[port].mab)
>> +			err = mv88e6xxx_atu_locked_entry_flush(ds, port);
>> +		else
>> +			err = 0;
> 
> Again, dsa_port_fast_age() is also called when dp->learning is turned
> off in dsa_port_bridge_flags(). I don't want to see the mv88e6xxx 
> driver
> doing this manually.
> 

Maybe I am wrong, but I have only been able to trigger fast ageing by 
setting
the STP state of the port to blocked...

