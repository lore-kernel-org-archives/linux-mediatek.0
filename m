Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FEDC05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihNmFpQKjqQ5VbBZh3XwrquHXWjY149avb1j5NXXF8Y=; b=ieTTVclI15X/0ei+SgYV+m/316
	5rpgRHcy3D7MUjDaDlHoJre1OR7HE24AxTgTAF+KJVTBcbN++16MFWUiYs/elK4V55lCIYzzLGsrF
	AqMM5jOy88JW2CxL1fBJmq/Ltf5e3q9BJRHX04C7hQQwmLWI0FlBSkYIh5CFchSCezaqx7Xbmcmq/
	R6SSggxWp789g4bEpdubCspFChKpUxh4M0zuv6G0MaWKdZcTX8R9kxGYmbtt+TxH7tmU7vE9NkSo9
	0WR7DR8gaq09uHgsZ9FdwVFtMzDBcg9CPzHWqT5PWfSQCSpNaFeTjHpdKkTw0NPx7ENXoWRjZ77d7
	WZx//htA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcJk-00GdhS-80; Thu, 02 Feb 2023 16:20:08 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNcIs-00GdKs-3u; Thu, 02 Feb 2023 16:19:15 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id C5A801883528;
	Thu,  2 Feb 2023 16:19:07 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id BABFF250007B;
	Thu,  2 Feb 2023 16:19:07 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id B0E8191201E4; Thu,  2 Feb 2023 16:19:07 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
MIME-Version: 1.0
Date: Thu, 02 Feb 2023 17:19:07 +0100
From: netdev@kapio-technology.com
To: Ido Schimmel <idosch@idosch.org>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens
 <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 "maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>, Sean Wang <sean.wang@mediatek.com>, Landen
 Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Cl=C3=A9m?=
 =?UTF-8?Q?ent_L=C3=A9ger?= <clement.leger@bootlin.com>, Jiri Pirko
 <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu
 <roopa@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Russell King
 <linux@armlinux.org.uk>, Christian Marangi <ansuelsmth@gmail.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:RENESAS RZ/N1
 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>, "moderated
 list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Subject: Re: [PATCH net-next 0/5] ATU and FDB synchronization on locked ports
In-Reply-To: <Y9vaIOefIf/gI0BR@shredder>
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <Y9lrIWMnWLqGreZL@shredder>
 <e2535b002be9044958ab0003d8bd6966@kapio-technology.com>
 <Y9vaIOefIf/gI0BR@shredder>
User-Agent: Gigahost Webmail
Message-ID: <3cecf4425b0e6f38646e25e40fd8f0fd@kapio-technology.com>
X-Sender: netdev@kapio-technology.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_081914_362159_540FB9EF 
X-CRM114-Status: GOOD (  16.56  )
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

On 2023-02-02 16:43, Ido Schimmel wrote:
> On Thu, Feb 02, 2023 at 08:37:08AM +0100, netdev@kapio-technology.com 
> wrote:
>> On 2023-01-31 20:25, Ido Schimmel wrote:
>> >
>> > Will try to review tomorrow, but it looks like this set is missing
>> > selftests. What about extending bridge_locked_port.sh?
>> 
>> I knew you would take this up. :-)
>> But I am not sure that it's so easy to have selftests here as it is 
>> timing
>> based and it would take the 5+ minutes just waiting to test in the 
>> stadard
>> case, and there is opnly support for mv88e6xxx driver with this patch 
>> set.
> 
> The ageing time is configurable: See commit 081197591769 ("selftests:
> net: bridge: Parameterize ageing timeout"). Please add test cases in 
> the
> next version.

When I was looking at configuring the ageing time last time, my finding 
was that the ageing time could not be set very low as there was some 
part in the DSA layer etc, and confusion wrt units. I think the minimum 
secured was like around 2 min. (not validated), which is not that much 
of an improvement for fast testing. If you know what would be a good low 
timeout to set, I would like to know.

