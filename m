Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E84AECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxP8xhIlTMO7Mz2Pz5R04VN4vzYbcTpBhEPBZ+h69/c=; b=NjvGHgFV0pLwdQ7OvxE3o/ITNu
	UCVZMmznZKpaeUN8/mf/QoxuNt+4JB+Hg7L9VMG+TP21JegJtW7dQV/n+ESK5qNV8qkATk3G7qhtC
	ailMR5AIoSO/pxMjiKkRuRMRmzZbUYIf9N0G/B911RUhQEVOlIoQw5a9s8cZyBgPrQA1JkqIBZWp6
	BEqW0yArDNHiWPrEDB51tMf2I/Hq4IcqKmuITqb90CCuu3rfPcIZT89i48sALyS+/cfDvgglODXCa
	GN2u2ux2kVrgK0MkJ5kSvdWKs/SWBiDjuCcaZlimaJFywbtTASYINJnFIf7lmEJDcHRW+dJpdcOMZ
	j7qcpdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShOi-00BeDn-5j; Mon, 29 Aug 2022 16:14:00 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oShIw-00BbrV-9b; Mon, 29 Aug 2022 16:08:04 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 6948518848F2;
	Mon, 29 Aug 2022 16:08:00 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 5CC5025032B7;
	Mon, 29 Aug 2022 16:08:00 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 4FD1A9EC0002; Mon, 29 Aug 2022 16:08:00 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Mon, 29 Aug 2022 18:07:59 +0200
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
In-Reply-To: <YwpgvkojEdytzCAB@shredder>
References: <20220826114538.705433-1-netdev@kapio-technology.com>
 <20220826114538.705433-7-netdev@kapio-technology.com>
 <YwpgvkojEdytzCAB@shredder>
User-Agent: Gigahost Webmail
Message-ID: <b28717f593461865bbfa6bf12e99a2a1@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_090802_889794_97FF8370 
X-CRM114-Status: GOOD (  10.68  )
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

On 2022-08-27 20:21, Ido Schimmel wrote:
> On Fri, Aug 26, 2022 at 01:45:38PM +0200, Hans Schultz wrote:

>> +	$MZ $h2 -q -t udp -a $mac -b rand
>> +	bridge fdb show dev $swp2 | grep -q "$mac vlan 1 master br0"
>> +	check_err $? "Locked port station move: Entry not found on unlocked 
>> port"
> 
> Looks like this is going to fail with offloaded data path as according
> to fdb_print_flags() in iproute2 both the "extern_learn" and "offload"
> flags will be printed before "master".
> 

The output shows like:
74:e1:e1:2c:4f:18 dev eth8 vlan 1 master br0 extern_learn offload sticky 
locked blackhole

"sticky" will of course become "permanent", but I can still make it more 
resilient by piping grep.

I suppose that I will keep the "sticky_no_roaming" test even though it 
is not really needed here anymore?

