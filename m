Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027B7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlb49Ey2eOFCdFTii48jVDGT4eEUJ8R4qplRGxWBowY=; b=0rrXQzG0dvhpYK59QZsNXuM6Zy
	p3HHHXDQKU6vaQASh5IN/3DKt78SfWYWlqXqHrAK/hMM5mTPy/mfUwdZS65WuKAmLtTsDisguNIHx
	mvQoNSN0h4hufYkjsNUYoyPCQozEJ6Tm29xfp58Q6bs0pRZI1bJRE2wKurk9tNc9O/UC+2OeYXKHI
	NqST48hcQsncPNYN5zQSCuBHEjBzyJf4wzmn3KzJ3iGUw6dsrhWIEu5/GTcTxV3ir6OhZD8anaOAD
	EfvKj3kCxtZYt43/lors8dMmkbwe+Xn4BPlILETxtbXkt58rpOB8SdC7SV5rJdRDTv78V3eNpQq41
	SuRuI6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHhq-00A530-MW; Fri, 30 Sep 2022 15:13:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeHhe-00A4yK-Gh; Fri, 30 Sep 2022 15:13:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A0FFF6238E;
	Fri, 30 Sep 2022 15:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80030C433D6;
	Fri, 30 Sep 2022 15:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664550805;
	bh=+Iv0NzKlgcI3YuZ72jkDhgpQgSqXaS755YKw8LTmiNA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XkoFjbyO6CW1DbTlNWFGtVO9HyfAwNyqnM7bj0FCzAeVWV1wdElbRGHr9u4ID99V8
	 MhlQhz8bKq2Ir5c7GCTbzBVRDV99nc4nWLKsesOmqqugh8j3K6kvw185RHbjWB5Wws
	 TF1/3B4nymXTjZnEO/iLHJFxi82VYWboEwUe5sXbABcuRkoKD8iBzG+uUWKPgwZzbn
	 ZQNPsvZ5IE6P1Pqy+Br1Y05hlXEwQ6fH08cljj1EoNbQV1ePaQYRMRr4vAnE2/f20a
	 fqvHcX8cUtelATR+IlJE8NXU+iLgF5JOMgHl8tEIH36V04asdi5xA7b/xXwmlae2NN
	 eX/3++IfC2QJg==
Date: Fri, 30 Sep 2022 08:13:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@kapio-technology.com, davem@davemloft.net,
 netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Andrew
 Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir
 Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
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
 <florent.fourcot@wifirst.fr>, Hans Schultz <schultz.hans@gmail.com>,
 Joachim Wiberg <troglobit@gmail.com>, Amit Cohen <amcohen@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bridge@lists.linux-foundation.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 net-next 0/9] Extend locked port feature with FDB
 locked flag (MAC-Auth/MAB)
Message-ID: <20220930081322.2835f41b@kernel.org>
In-Reply-To: <YzcFbH5lX3l1K8Fu@shredder>
References: <20220928150256.115248-1-netdev@kapio-technology.com>
	<20220929091036.3812327f@kernel.org>
	<12587604af1ed79be4d3a1607987483a@kapio-technology.com>
	<20220929112744.27cc969b@kernel.org>
	<ab488e3d1b9d456ae96cfd84b724d939@kapio-technology.com>
	<Yzb3oNGNtq4GCS3M@shredder>
	<20220930075204.608b6351@kernel.org>
	<YzcFbH5lX3l1K8Fu@shredder>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_081326_670836_EC731710 
X-CRM114-Status: GOOD (  16.87  )
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

On Fri, 30 Sep 2022 18:04:12 +0300 Ido Schimmel wrote:
> On Fri, Sep 30, 2022 at 07:52:04AM -0700, Jakub Kicinski wrote:
> > On Fri, 30 Sep 2022 17:05:20 +0300 Ido Schimmel wrote:  
> > > You can see build issues on patchwork:  
> > 
> > Overall a helpful response, but that part you got wrong.
> > 
> > Do not point people to patchwork checks, please. It will only encourage
> > people to post stuff they haven't build tested themselves.
> > 
> > It's documented:
> > 
> > https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#running-all-the-builds-and-checks-locally-is-a-pain-can-i-post-my-patches-and-have-the-patchwork-bot-validate-them  
> 
> Did you read my reply? I specifically included this link so that you
> won't tell me I'm encouraging people to build test their patches by
> posting to netdev.

Yeah, I noticed the link after, but I think my point stands. 

You show someone the patchwork checks and then at the end of the "also"
section put a link on how it's not okay to abuse it. Not a clear enough
instruction.

*never* point people to the patchwork checks, *please*

