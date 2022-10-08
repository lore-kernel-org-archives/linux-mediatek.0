Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E47C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Oct 2022 11:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OF/hTp+ABwK+temkMFdR0yLky5OMDtwq89l36tacv+4=; b=F9FSmiahQ2hwZ7BCxhZ88KRiFd
	FzKMolKs1LXPf7r0V7SGYHDi00r+uFEFaeDCTrSNAsWF4CvvAoB+2y+d4sh5ylEP+KoLLMx3pn0Rp
	JQmsWVz3/EEpA8ZXkxLLZQb/N61msturCvs05Fpi+EqoCQY4GVoRIqvXN3urtrhnx3FNr2NuZJZqh
	NmSURNimi3+3eO6ZWuaWsVtmccrPWjALgMp/cHf4mapDuJScKH0J1VoHHMYjJEgV0GYfTxu+Es1Bz
	gXpFFknHWIH/RH3mYFlJWiuHiBfkQWqztkgSLmSgStBStfQp+1ow9+UpkR091yyLFeqQO7ACv1lrv
	4JhWQx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh86J-00CwWV-An; Sat, 08 Oct 2022 11:34:39 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh866-00CwV4-C6; Sat, 08 Oct 2022 11:34:27 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 1067E1884502;
	Sat,  8 Oct 2022 11:34:17 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 062492503DE3;
	Sat,  8 Oct 2022 11:34:17 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id F11D99120FED; Sat,  8 Oct 2022 11:34:16 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Sat, 08 Oct 2022 13:34:16 +0200
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
 <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Yuwei Wang <wangyuweihx@gmail.com>, Petr
 Machata <petrm@nvidia.com>, Florent Fourcot <florent.fourcot@wifirst.fr>,
 Hans Schultz <schultz.hans@gmail.com>, Joachim Wiberg <troglobit@gmail.com>,
 Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 net-next 9/9] selftests: forwarding: add test of
 MAC-Auth Bypass to locked port tests
In-Reply-To: <YzrmaixRZ3k/alPh@shredder>
References: <20220928150256.115248-1-netdev@kapio-technology.com>
 <20220928150256.115248-10-netdev@kapio-technology.com>
 <YzrmaixRZ3k/alPh@shredder>
User-Agent: Gigahost Webmail
Message-ID: <c25d21e4f3a8d825a4ceb3069b05c6d9@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_043426_614782_71727847 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

On 2022-10-03 15:40, Ido Schimmel wrote:
>> +locked_port_station_move()
>> +{
>> +	local mac=a0:b0:c0:c0:b0:a0
>> +
>> +	RET=0
>> +	check_locked_port_support || return 0
>> +
>> +	bridge link set dev $swp1 locked on
> 
> It is quite pointless to check that an entry cannot roam to a port that
> has learning disabled... Need:
> 
> bridge link set dev $swp1 locked on learning on
> 
>> +
>> +	$MZ $h1 -q -t udp -a $mac -b rand
>> +	bridge fdb show dev $swp1 | grep "$mac vlan 1" | grep -q "master 
>> br0"
> 
> bridge fdb get ...
> 
> Same in other places
> 

It seems that the output of 'bridge fdb get' does not respect the dev it 
is given as input and outputs the (MAC,vlan) when found on another 
dev...

