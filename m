Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA0EC77B73
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 10:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Za6ndI+MEe04AGEZDtIym5+jQuU3s03LuT4qImN10tE=; b=o/JFzTUBn9WKJI
	dPZ46IVQUv7CXu1l0MyPaAoZ4r5OhV6J9k2I3hFWGdPBSD2cswXsG8pXbKre2XHVbWsZqVu5WIBpq
	DT8HWF9ITc5YJnK1Yk1hUfNTHnRPT7zrX2rc8oLvQE0DRRMn06X/uXHZGMZ4FnJ7m6trVZNaeAdLh
	UW43OER15v1jNsjKpphVp7WYNTM3nBZWIcolk//l/1ptbAp6+h7PTPyQrbM0skH5kfGcCTvVeuaIj
	dyMDOVOmrSUBLl3JFU8lTAQUmUmkugdUgPXVmL2kUd46+Xg/rTJzRQNrtzviW/UNsxCKiRIwEzOye
	cTiaQPaar9aNruvpV0VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5kZl-00Bmxt-1F;
	Sun, 04 Jun 2023 10:03:05 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5kZi-00Bmwt-0o;
	Sun, 04 Jun 2023 10:03:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685872952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J8patjHW9ynL8BHuov7mXyIPxdNaQB4XOgPZQbfzqaeMFVaWFCtmA8kh1hF+025LELepaeK0POwe5a8c5+WbTPXXDo3/M86+GMA6z9p+joNGIGqv52dZ1PMQAQdJBhXfcylPgkULLD4DD2ayrokEnF9kRnE9WSaX1vpqAp/LTig=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685872952; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Za6ndI+MEe04AGEZDtIym5+jQuU3s03LuT4qImN10tE=; 
	b=iHfk098mpTG1ZWNHI67m0NYYESxapk35H5G8x8AqApV997bYoEDqdv/Ub+GizUsNrZaZDCzy45kBoH5grcqKqDjVEM5mNIFYANAUUze2ymFV2H27A06evvMV1Nup3ascLytQ1QIi8QGmYHdZy4viVV+ON9/sNQMPOVVmxN+JoYo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685872952;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Za6ndI+MEe04AGEZDtIym5+jQuU3s03LuT4qImN10tE=;
	b=FWtOOdjKi8oCtbl/ZrcE+FbvWQlToqcMkyOkdsmPn62ajmAt5GELk1lwNQ+jAkAa
	6Rxi2w8lVQXA9XC1NRLYZwG+PISeXhluC7io4HxRWLbpxeX0dwGlYtacU2svYx5CBJ3
	w81L5/uf3wb/WEOY12OsCCC3bNZ3oqTa34m7k0og=
Received: from [192.168.99.249] (178-147-169-233.haap.dm.cosmote.net [178.147.169.233]) by mx.zohomail.com
	with SMTPS id 1685872950208345.1966686433153; Sun, 4 Jun 2023 03:02:30 -0700 (PDT)
Message-ID: <886ae203-1aca-0cb3-cf32-416984a7c37c@arinc9.com>
Date: Sun, 4 Jun 2023 13:02:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 29/30] net: dsa: introduce
 preferred_default_local_cpu_port and use on MT7530
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-30-arinc.unal@arinc9.com>
 <20230522121532.86610-30-arinc.unal@arinc9.com>
 <20230526171755.nk643aphoojvhjpg@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230526171755.nk643aphoojvhjpg@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_030302_322149_26E1C178 
X-CRM114-Status: GOOD (  28.04  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26.05.2023 20:17, Vladimir Oltean wrote:
> On Mon, May 22, 2023 at 03:15:31PM +0300, arinc9.unal@gmail.com wrote:
>> From: Vladimir Oltean <olteanv@gmail.com>
>>
>> When multiple CPU ports are being used, the numerically smallest CPU port
>> becomes the port all user ports become affine to. This may not be the best
>> choice for all switches as there may be a numerically greater CPU port with
>> more bandwidth than the numerically smallest one.
>>
>> Such switches are MT7530 and MT7531BE, which the MT7530 DSA subdriver
>> controls. Port 5 of these switches has got RGMII whilst port 6 has got
>> either TRGMII or SGMII.
>>
>> Therefore, introduce the preferred_default_local_cpu_port operation to the
>> DSA subsystem and use it on the MT7530 DSA subdriver to prefer port 6 as
>> the default CPU port.
>>
>> To prove the benefit of this operation, I (Arınç) have done a bidirectional
>> speed test between two DSA user ports on the MT7531BE switch using iperf3.
>> The user ports are 1 Gbps full duplex and on different networks so the SoC
>> MAC would have to do 2 Gbps TX and 2 Gbps RX to deliver full speed.
> 
> I think the real argument would sound like this:
> 
> Since the introduction of the OF bindings, DSA has always had a policy
> that in case multiple CPU ports are present in the device tree, the
> numerically first one is always chosen.
> 
> The MT7530 switch family has 2 CPU ports, 5 and 6, where port 6 is
> preferable because it has higher bandwidth.
> 
> The MT7530 driver developers had 3 options:
> - to modify DSA when the driver was introduced, such as to prefer the
>    better port
> - to declare both CPU ports in device trees as CPU ports, and live with
>    the sub-optimal performance resulting from not preferring the better
>    port
> - to declare just port 6 in the device tree as a CPU port
> 
> Of course they chose the path of least resistance (3rd option), kicking
> the can down the road. The hardware description in the device tree is
> supposed to be stable - developers are not supposed to adopt the
> strategy of piecemeal hardware description, where the device tree is
> updated in lockstep with the features that the kernel currently supports.
> 
> Now, as a result of the fact that they did that, any attempts to modify
> the device tree and describe both CPU ports as CPU ports would make DSA
> change its default selection from port 6 to 5, effectively resulting in
> a performance degradation visible to users as can be seen below vvvvv
> 
>>
>> Without preferring port 6:
>>
>> [ ID][Role] Interval           Transfer     Bitrate         Retr
>> [  5][TX-C]   0.00-20.00  sec   374 MBytes   157 Mbits/sec  734    sender
>> [  5][TX-C]   0.00-20.00  sec   373 MBytes   156 Mbits/sec    receiver
>> [  7][RX-C]   0.00-20.00  sec  1.81 GBytes   778 Mbits/sec    0    sender
>> [  7][RX-C]   0.00-20.00  sec  1.81 GBytes   777 Mbits/sec    receiver
>>
>> With preferring port 6:
>>
>> [ ID][Role] Interval           Transfer     Bitrate         Retr
>> [  5][TX-C]   0.00-20.00  sec  1.99 GBytes   856 Mbits/sec  273    sender
>> [  5][TX-C]   0.00-20.00  sec  1.99 GBytes   855 Mbits/sec    receiver
>> [  7][RX-C]   0.00-20.00  sec  1.72 GBytes   737 Mbits/sec   15    sender
>> [  7][RX-C]   0.00-20.00  sec  1.71 GBytes   736 Mbits/sec    receiver
>>
>> Using one port for WAN and the other ports for LAN is a very popular use
>> case which is what this test emulates.
> 
> As such, this change proposes that we retroactively modify stable
> kernels to keep the mt7530 driver preferring port 6 even with device
> trees where the hardware is more fully described.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> 
>>
>> This doesn't affect the remaining switches, MT7531AE and the switch on the
>> MT7988 SoC. Both CPU ports of the MT7531AE switch have got SGMII and there
>> is only one CPU port on the switch on the MT7988 SoC.
>>
>> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
> 
> See the difference in intent?

Yeah, nicely put.

Arınç

