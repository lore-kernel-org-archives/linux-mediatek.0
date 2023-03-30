Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4884C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 10:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYKnv/cm3OHLOIgIhE5IFukRanSlMRutnIxRUco4BuA=; b=RHpNjTiRhFdWhwSJDY5XmYu+9q
	ws6/g9up3auO9cRkVGr9Zf7KZGv5R4Bv2owjgUqvXqWmQZZlYKYazSJY78wXXMgwjnfcvAEHn2mr6
	+e2dUVvaHtqmfXLviHEcfJPML/MvKA4TR7SwN/GJwl9zN6qaah1E8bJNDFLoGlypjsyyriPS0h2tG
	/Pg62KvIuoBaUKdN5lTWEh3uDCbN1K582So+gTHFr027jiY/i9o4wge9Bb344b9NwUEa5nijHpsWA
	5GKg+vSVLxWN14DIbH7YZTEMmJxe8nztggHYeYzkklro/LPol3VpthCYyABP2aR4+djdSw+iTH33h
	O5RA3Lbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phpbj-003TrO-1m;
	Thu, 30 Mar 2023 10:34:15 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phpbf-003TUy-0Y;
	Thu, 30 Mar 2023 10:34:12 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 550331883A12;
	Thu, 30 Mar 2023 10:31:57 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 3F89F2500389;
	Thu, 30 Mar 2023 10:31:57 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 342579B403F6; Thu, 30 Mar 2023 10:31:57 +0000 (UTC)
X-Screener-Id: e32ae469fa6e394734d05373d3a705875723cf1e
Received: from fujitsu (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
	by smtp.gigahost.dk (Postfix) with ESMTPSA id 821C49B403E4;
	Thu, 30 Mar 2023 10:31:56 +0000 (UTC)
From: Hans Schultz <netdev@kapio-technology.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke
 Mehrtens <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
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
In-Reply-To: <ZCUuMosWbyq1pK8R@shredder>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-7-netdev@kapio-technology.com>
 <ZBgdAo8mxwnl+pEE@shredder> <87a5zzh65p.fsf@kapio-technology.com>
 <ZCMYbRqd+qZaiHfu@shredder> <87fs9ollmn.fsf@kapio-technology.com>
 <ZCUuMosWbyq1pK8R@shredder>
Date: Thu, 30 Mar 2023 12:29:18 +0200
Message-ID: <87mt3u7csh.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_033411_379763_3C9AB8C6 
X-CRM114-Status: GOOD (  22.06  )
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

On Thu, Mar 30, 2023 at 09:37, Ido Schimmel <idosch@nvidia.com> wrote:
> On Tue, Mar 28, 2023 at 09:30:08PM +0200, Hans Schultz wrote:
>> 
>> Sorry, but I have sent you several emails telling you about the problems
>> I have with running the selftests due to changes in the phy etc. Maybe
>> you have just not received all those emails?
>> 
>> Have you checked spamfilters?
>> 
>> With the kernels now, I cannot even test with the software bridge and
>> selftests as the compile fails - probably due to changes in uapi headers
>> compared to what the packages my system uses expects.
>
> My spam filters are fine. I saw your emails where you basically said
> that you are too lazy to setup a VM to test your patches and that your
> time is more valuable than mine, which is why I should be testing them.
> Stop making your problems our problems. It's hardly the first time. If
> you are unable to test your patches, then invest the time in fixing your
> setup instead of submitting completely broken patches and making it our
> problem to test and fix them. I refuse to invest time in reviewing /
> testing / reworking your submissions as long as you insist on doing less
> than the bare minimum.
>
> Good luck

I never said or indicated that my time is more valuable than yours. I
have a VM to run these things that some have spent countless hours to
develop with the right tools etc installed and set up. Fixing that
system will take quite many hours for me, so I am asking for some simple
assistance from someone who already has a system running supporting the
newest kernel.

Alternatively if there is an open sourced system available that would be
great.

As this patch-set is for the community and some companies that would
like to use it and not for myself, I am asking for some help from the
community with a task that when someone has the system in place should
not take more than 15-20 minutes, maybe even less.

