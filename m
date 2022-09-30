Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E6EC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RE6j14FZmC70ZSj+X4HL6L8PGHBAC/LiKU19rwPhT/8=; b=j5RurZPl072b48Zrm++IVzHvX5
	lAAi+UAoZC0e5EvvoMlKreRSjDJK3wUV2H+eHLn1nrL8B9G/V+qSFRkITlkCnjroqTlW1sIz/jU+J
	nAtqj639rqPOwA9gLsMHPunZRhVMC93Qgf8U9vyZQHo6BpXYlCIC3Qqm4luXMyfLrsc/lf6P+1cG2
	4Ta6mWJOo+g891gA96LiXlUthvCmFFJVcujAO5Nm/uQq58OYQWIVCeA2bt2x3N9GG58vwaf0eM4oA
	uzVFTXuKrhSdppjlD6VgHRBg3xvYsODsW3YQ1tCAcTV9qJ13A9BtKM8mec9smyEeDAyP1HqEpsOmP
	mtZzhmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHWS-00A0GW-4J; Fri, 30 Sep 2022 15:01:52 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHU1-009ylF-8m; Fri, 30 Sep 2022 14:59:24 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id 1745C1884494;
	Fri, 30 Sep 2022 14:59:14 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 028A62500015;
	Fri, 30 Sep 2022 14:59:14 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id F0E8B9EC0007; Fri, 30 Sep 2022 14:59:13 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Fri, 30 Sep 2022 16:59:13 +0200
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@nvidia.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens
 <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan
 <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>, Christian Marangi
 <ansuelsmth@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Yuwei Wang
 <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>, Florent Fourcot
 <florent.fourcot@wifirst.fr>, Hans Schultz <schultz.hans@gmail.com>, Joachim
 Wiberg <troglobit@gmail.com>, Amit Cohen <amcohen@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bridge@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 net-next 0/9] Extend locked port feature with FDB
 locked flag (MAC-Auth/MAB)
In-Reply-To: <Yzb3oNGNtq4GCS3M@shredder>
References: <20220928150256.115248-1-netdev@kapio-technology.com>
 <20220929091036.3812327f@kernel.org>
 <12587604af1ed79be4d3a1607987483a@kapio-technology.com>
 <20220929112744.27cc969b@kernel.org>
 <ab488e3d1b9d456ae96cfd84b724d939@kapio-technology.com>
 <Yzb3oNGNtq4GCS3M@shredder>
User-Agent: Gigahost Webmail
Message-ID: <16d6db15df0a875e442456ff56234b98@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_075921_501177_BB91113F 
X-CRM114-Status: GOOD (  21.39  )
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

On 2022-09-30 16:05, Ido Schimmel wrote:
> On Fri, Sep 30, 2022 at 07:42:37AM +0200, netdev@kapio-technology.com 
> wrote:
>> Obviously my method of selecting all switchcore drivers with 
>> sub-options
>> under menuconfig was not sufficient, and I didn't know of the 
>> allmodconfig
>> option, otherwise I would have used it.
> 
> You can see build issues on patchwork:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20220928150256.115248-6-netdev@kapio-technology.com/
> 
> Also:
> 
> https://docs.kernel.org/next/process/maintainer-netdev.html#what-level-of-testing-is-expected-before-i-submit-my-change
> 
> https://docs.kernel.org/next/process/maintainer-netdev.html#can-i-reproduce-the-checks-from-patchwork-on-my-local-machine
> 
> https://docs.kernel.org/next/process/maintainer-netdev.html#running-all-the-builds-and-checks-locally-is-a-pain-can-i-post-my-patches-and-have-the-patchwork-bot-validate-them
> 
>> So the question is if I should repost the fixed patch-set or I need to 
>> make
>> a new version?
> 
> A new fixed version (v7) is required, but wait for this version to be
> reviewed first.
> 
>> Anyhow I hope that there will not be problems when running the 
>> selftests, as
>> I have not been able to do so with my system, so there can be more 
>> that
>> needs to be changed.
> 
> It's not really acceptable to post tests that you haven't run... What
> exactly is the issue? You should be able to run the tests with veth
> pairs in a VM.

It is only the blackhole test that I have not been able to run as is, 
but I have stepped it manually as far as I could.
My environment has changed lately and in that context the building of 
the selftests fails and I don't know why,I just get some error 
messagesabout missing header files, and setting up a whole system like 
f.ex. linuxfromscratch with the necessary libs and tools to run it in a 
VM is too time consuming a task at the moment.

If there is some freely available system for the purpose out there 
besides my own system based on Buildroot that does not work now, please 
let me know...

