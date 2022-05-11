Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C97C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 08:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Bkjq+Dyf/A6kwHVjkbAGuwwmzhw5zCyjwqiie/9xF8=; b=t+2dvA6W+BcDsI
	rcECqWHQ/DnjicNKR64Elm/rYgPYquQ0OtD9LUIbYcdXaWnzDgkvB/lM5/RIpu3ETNryBpZ8fBaUo
	fzkk9DUsNxulbqCWOz6QdEM7lZolEMQQCeLuUExfdpKWUWG9ovv96LKFrps4abPStSZdyVpXflMDr
	HTmNhatJcxZ7IUZvLyxMxW4XtImDNmExPEoPc6/HO9Y2PFGQwGi17FMy9qQit9mH4ua7JY0ZO/RHM
	39l4OL+lYdhKdZVbL1nomSH2xTR3o4vmRWbMoMsTnbZyk6/ZNoL7uqAKreeJJDo81vZixjgsSDlOH
	oV2/xi/oomps31kA9+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noi3T-0062gR-4m; Wed, 11 May 2022 08:50:47 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noi3H-0062dR-93; Wed, 11 May 2022 08:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
 From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=K9S0p/PZ8mVH19diTHdZftm0WUxvYRUVPKuMIoWWr6A=; b=gqqRzYAyEQaZPglJ6z5hwVhmcy
 ti0G3HCYz7sxUTKH6vXINCJA/N7H7NrCT7ghoWlveD5910asAltd71LxWbLjTQYXZJiVb+lD2XIVF
 Q5YP3XqAugpioX/H9Vuw2lQqxASCD96KfQxSsxTbfzofUXvfyy5ANESzjP4VZ1SGusDA=;
Received: from p200300daa70ef200e12105daa054647e.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:e121:5da:a054:647e] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1noi30-00040B-O3; Wed, 11 May 2022 10:50:18 +0200
Message-ID: <376b13ac-d90b-24e0-37ed-a96d8e5f80da@nbd.name>
Date: Wed, 11 May 2022 10:50:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220510094014.68440-1-nbd@nbd.name>
 <20220510123724.i2xqepc56z4eouh2@skbuf>
 <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
 <20220510165233.yahsznxxb5yq6rai@skbuf>
 <bc4bde22-c2d6-1ded-884a-69465b9d1dc7@nbd.name>
 <20220510222101.od3n7gk3cofwhbks@skbuf>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
In-Reply-To: <20220510222101.od3n7gk3cofwhbks@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_015035_612763_BFAE219E 
X-CRM114-Status: GOOD (  14.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Hi Vladimir,


On 11.05.22 00:21, Vladimir Oltean wrote:
> It sounds as if this is masking a problem on the receiver end, because
> not only does my enetc port receive the packet, it also replies to the
> ARP request.
> 
> pc # sudo tcpreplay -i eth1 arp-broken.pcap
> root@debian:~# ip addr add 192.168.42.1/24 dev eno0
> root@debian:~# tcpdump -i eno0 -e -n --no-promiscuous-mode arp
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on eno0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
> 22:18:58.846753 f4:d4:88:5e:6f:d2 > ff:ff:ff:ff:ff:ff, ethertype ARP (0x0806), length 60: Request who-has 192.168.42.1 tell 192.168.42.173, length 46
> 22:18:58.846806 00:04:9f:05:f4:ab > f4:d4:88:5e:6f:d2, ethertype ARP (0x0806), length 42: Reply 192.168.42.1 is-at 00:04:9f:05:f4:ab, length 28
> ^C
> 2 packets captured
> 2 packets received by filter
> 0 packets dropped by kernel
> 
> What MAC/driver has trouble with these packets? Is there anything wrong
> in ethtool stats? Do they even reach software? You can also use
> "dropwatch -l kas" for some hints if they do.
For some reason I can't reproduce the issue of ARPs not getting replies 
anymore.
The garbage data is still present in the ARP packets without my patch 
though. So regardless of whether ARP packets are processed correctly or 
if they just trip up on some receivers under specific conditions, I 
believe my patch is valid and should be applied.

Who knows, maybe the garbage padding even leaks some data from previous 
packets, or some other information from within the switch.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
