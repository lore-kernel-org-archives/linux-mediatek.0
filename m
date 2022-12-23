Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF0FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 01:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ojNCFZMfwHgV4Zifc3iXtDUJt3Q1OA+X19/cUTABYk=; b=0I5AQxu9MoupNQo+pfAIoPE2jM
	4enJmm1SPsjhcFeyCFzKBHktzyzjrA0iTrcDZWDjiIRhiBoCHTgRUgkHgKsbDdwviYRt4Ln/qw8iz
	2r4o/g1b7zrAqANmK/95SbnwLEDCGzUvoKQKCJn8yIARX6EhFwMo0yazifyf2x3Htb1aq4BUgAbH+
	Q1aNFufkYiqPJevS1bBsxmbFYJEHuJSG3M4Y5c7xqTflX0kHWXVf7RLh6xsXfnW4hzgbsZO5P9kyo
	Gr/cq1jbjiKuQH36+dcPid6gNTe7Qr4vMC4OspFvmrV5bjeGp+WMHHpB2uEfneKUUEx0paeXHgT55
	zdgTATKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8XHe-001nnP-9D; Fri, 23 Dec 2022 01:55:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8XHI-001nf9-08; Fri, 23 Dec 2022 01:55:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18A1F61D01;
	Fri, 23 Dec 2022 01:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E47C433D2;
	Fri, 23 Dec 2022 01:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671760512;
	bh=7+FMQzhkdUuBY613R/cYs3AH1Nhez93yWDo3mNZV11k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UEUyNKx2i1LZAVFYds1BlBgyPm/Ik7cpS8U7LfeCdyg6rN34F2MxFbpWcB99oJhWY
	 z3PCM+xeXJc8le1cBwEWvQgHqE+zizdVCc4EUggVJTBdAm0up55elIPXsA9sD3udvn
	 egfjkJqY68Ty9hr//Cwd/0R2imFrjdY7DYeYlQVxFgF9Q0OUNI4ahLOXrdlwppZIB6
	 IGhXVuGjgxPiqZ+dXPaQBHuwYPZJmwzRe0TKQx92R0ZBjDHgjG9XG1UG2kB1/5SaK9
	 lLwTXBmiVtso4HCVs5oQGkXY15JlAV0Smt/mRzag40XxsQXH3LS8gDdBUvVpwnDEtY
	 scu31Ntzcd6dQ==
Date: Thu, 22 Dec 2022 17:55:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Rob Herring <robh@kernel.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, John Crispin <john@phrozen.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, Vivien
 Didelot <vivien.didelot@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>, Alvin =?UTF-8?B?xaBpcHJhZ2E=?=
 <alsi@bang-olufsen.dk>, Linus Walleij <linus.walleij@linaro.org>,
 UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kurt Kanzenbach
 <kurt@linutronix.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Paolo Abeni <pabeni@redhat.com>, Eric
 Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, George McCollister
 <george.mccollister@gmail.com>
Subject: Re: [PATCH v5 net-next 04/10] dt-bindings: net: dsa: utilize base
 definitions for standard dsa switches
Message-ID: <20221222175510.7ca0b563@kernel.org>
In-Reply-To: <Y6S5Ple5SURq0QSU@colin-ia-desktop>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
	<20221210033033.662553-5-colin.foster@in-advantage.com>
	<1df417b5-a924-33d4-a302-eb526f7124b4@arinc9.com>
	<Y5TJw+zcEDf2ItZ5@euler>
	<c1e40b58-4459-2929-64f3-3e20f36f6947@arinc9.com>
	<20221212165147.GA1092706-robh@kernel.org>
	<Y5d5F9IODF4xhcps@COLIN-DESKTOP1.localdomain>
	<Y6S5Ple5SURq0QSU@colin-ia-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_175516_155699_C758B725 
X-CRM114-Status: GOOD (  11.22  )
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

On Thu, 22 Dec 2022 12:08:30 -0800 Colin Foster wrote:
> Heads up on my plan for this. I plan to re-submit this on Monday after
> the merge window with the change where I move the $ref: dsa-port.yaml#
> to outside the allOf: section, and remove the object type as the above
> code suggests. Hopefully that's the right step to take.

FWIW in case you mean Mon, Dec 26th and net-next -- we extended 
the period of net-next being closed until Jan:
https://lore.kernel.org/all/20221215092531.133ce653@kernel.org/

