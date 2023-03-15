Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B7CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhDojsq94i9cLQDAfip+I7i9pPkgsjyfaMVNL/0rm3Q=; b=LL13Mnu9KdqaI7
	p9I0Td09B5MYw0w+pF+SdAivAqwW29xYwx5vNkqXpf+bDf0zEQGKdSL5PCcF39I+SLpaUMU758Dnf
	jpTyBIIRlHvkCXRC1O5GWiwmBHfeIdUO5Ldo2KU2Ezf/0TaCPCW3La2VWeMu1Qe9ss+AXzC7qUTOA
	elV8egPVPgoo7VWaLBUDQiCacsUL0l3roclkDzQqcgfvlN/uW+6CrPifY4/5qjF8cUUS8V7ftqDx0
	oKsjL4B17oi8CJpvhWu6VEMHjQSBvRRg34GLQlKXG3Iv0cG/D7TJ0nvY/MRRPDmLYC1GJ8DQVDk4y
	YjBH8uo4aPXtCzUFNcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNUR-00CwlN-2c;
	Wed, 15 Mar 2023 09:32:11 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcNUO-00CwkI-2Y;
	Wed, 15 Mar 2023 09:32:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678872686; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VS6slRsiNB3iuAq/TPpmAvcle3whJ6va+Nlxvn+7egcRSyFG+YV4XxNKYTP1a/N8BrBRVqXxKxHvhWn1Vy0Bre5sSOd0iaU1bmxxQ7Kz7D3w6cP5dYAfwSTKIjg8yFUUu3CX8lTBaIF2YPN68Gk8whu6hiyAi7Pbg4MvBpkFWxI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678872686; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=UhDojsq94i9cLQDAfip+I7i9pPkgsjyfaMVNL/0rm3Q=; 
	b=GzyVM+Ed3EYEovqtepcEmapZF/DKUEzv3isUTJAucwlMH4bVyLyV5P0mKV0cBZ1gOwNprbyxJYjR5syqGJiSigc0LPEEerj8Z3jsfn0bXVBR79orYQbn8LLWqtJyFjEEeAKAchYHCv6njHjkr6JzIwVE49OorKnnvcuf6rRHLP8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678872686;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UhDojsq94i9cLQDAfip+I7i9pPkgsjyfaMVNL/0rm3Q=;
	b=PY9xIXXxJOKZ5IdaNLPk1QsEZAWNNzu2m5GAv4fHYKF7XIsqd7UgptXD4fur+jhN
	0vMEnmcb99KOSi2O7+2DAOJf75B3bBoPHJoMDkLtH7i/zc5LBZPmMvAUterEJuqI0zb
	WyDFqnN3N9t4LmgNVW/Qowtkn2a0k5gzBYwQzFK0=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1678872684137451.17482730504366; Wed, 15 Mar 2023 02:31:24 -0700 (PDT)
Message-ID: <c17c272b-d1cb-8f29-5559-fea1f29f2a37@arinc9.com>
Date: Wed, 15 Mar 2023 12:31:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH net-next v13 11/16] net: dsa: mt7530: use external PCS
 driver
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <cover.1678357225.git.daniel@makrotopia.org>
 <2ac2ee40d3b0e705461b50613fda6a7edfdbc4b3.1678357225.git.daniel@makrotopia.org>
 <e99cc7d1-554d-5d4d-e69a-a38ded02bb08@arinc9.com>
 <ZBCyqdfaeF/q8oZr@makrotopia.org>
 <c07651cd-27b4-5ba4-8116-398522327d27@arinc9.com>
 <20230314195322.tsciinumrxtw64o5@skbuf>
 <3e3e6a1e-61ba-a6e8-5503-258fb8e949bb@arinc9.com>
 <20230314223413.velxur7gi7snpdei@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230314223413.velxur7gi7snpdei@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_023208_902399_27E16207 
X-CRM114-Status: GOOD (  29.39  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 15.03.2023 01:34, Vladimir Oltean wrote:
> On Tue, Mar 14, 2023 at 11:59:40PM +0300, Arınç ÜNAL wrote:
>> Look, I don't ask for renaming just for the sake of renaming things. I see a
>> benefit which would make things clearer.
>>
>> If you rather mean to, know the driver very well, by saying do 100 useful
>> commits on the driver beforehand, that makes sense. But I think I'm capable
>> of managing this. I've got the time and energy.
> 
> I'm absolutely sure that you're capable of renaming mt7530 to mt753x,
> that's outside the question. That change can be made without even paying
> too much attention to the code, which is exactly the problem. If the
> proposal is to touch mt7530_read(), mt7530_write(), mt7530_rmw()
> (which it seems to be), then that's pretty much the entire driver.
> 
> Sorry for being skeptical by default, but generally such refactoring is
> done by people who have the commitment to stay around when shit hits the
> fan. Think of it as minimizing the time wasted by others due to that
> refactoring. That could be time spent by reviewers looking at the code
> being changed while trying to identify latent bugs; could be time spent
> by someone who fixes a bug that doesn't backport all the way to stable
> kernels because it conflicts with the refactoring. Ideally, after a
> large refactoring, you would be sufficiently active to find and fix bugs
> before others do, and have an eye for problematic code. Respectfully,
> you still need to prove all these things. It also helps a lot if you
> build a working relationship with the driver maintainers, or if you gain
> their trust and become a maintainer yourself. Otherwise, more work will
> just fall on the shoulders of fallback maintainers who don't have the
> hardware. If there is a self-sustaining development community and they
> take care of everything, I really have zero problems with large
> refactoring done even by newbies. But the mt7530 maintainers have gone
> pretty silent as of late, and I, as a fallback maintainer with no
> hardware, have had to send 2 bug fixes to the mt7530 and 1 to the
> mtk_eth_soc driver in the past month, to address the reports. Give me a
> reason not to refuse more potential work :)

Now, I can find bugs if it's something that would appear on a daily use 
of the hardware, like those bugfixes you mentioned which I reported to 
you. I'm not confident in fixing them myself (yet!) due to my very 
slowly learning C but I'm willing to stick around for years to come so 
who knows what happens in a few years. I already do keep an eye on a 
very small problematic code at least.

I can be around as a maintainer to help backporting bugfixes that 
wouldn't apply cleanly due to my refactoring. So I don't add more 
workload to fallback maintainers like yourself. But that's all I can 
promise to maintain for now, not because of availability but experience, 
or rather the lack thereof.

Arınç

