Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528D6C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 18:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZknDN+uR1T0d5Ms3oAt3CaWQxIqmKO1fghbHlDEdQ/M=; b=AVfcUX1qFyI4BV5OKrqHfjmP1M
	DvPR/gXQwpVIMLlxriBN6tEK+cZtNJRZLOLqEqyVLyMmltofuJaAHQ7RYMiRlTnr13ZEGUmXc0dRA
	AAj1oawNsvqOHRlebfgj2HIQtab+gt8c2G27HB1l/G5z8pnxJ3M5t70Tt4w/FmrHvoF3XV/WtwNCA
	joK7kloAqWicgZVyMNtybZJZDU7uMaKi8p5vGgLSCgp/MTaeijy8E//UqhagoDVloQp9kW707RnMN
	JJz7hToQUK1V8sMF8Zz4FiDCuWeqxkTWWQYxzIEW/khn2jFV8cUx8MNLHm9xap/Co08vdQB6zPnII
	57YJ0FTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4nZ7-003eOc-A3; Mon, 12 Dec 2022 18:30:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4nYw-003eMr-80; Mon, 12 Dec 2022 18:30:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA8AF611C6;
	Mon, 12 Dec 2022 18:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1996CC433F1;
	Mon, 12 Dec 2022 18:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670869800;
	bh=BJzMWseu2TKrkWXTG3+oF/opcZitJC3uFEXLhD8p4dM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iNfZF1XqOlvgflDZ5Y1E12KIZVnLW6mwFhm00J5W73WTT2k25U5hcbPzP0pMKbPUD
	 kvGGAgUZBlQroU09zGoRQyVe+theVsCvywgrBQMgCFiJzMn1626N1WvPa4FLFJLGQS
	 D7kCHk1llEQpgOMpN21x+/PTgYYaXsvZvQ6gHnqJNz6lPeFXaqPhgqp1BclTc0Bmat
	 cQWyHOhAmDssl/H5rXq7Qm5TY8IfT63qGeuIZcTRS/zJj0IE/QyQIQ1ZQRW8YsfZJV
	 v89T3p2Ceep0WuOU/CvtRpUav8zq/sLXNoPKqAMfVx0v/MvlIq565CPIXsLyza6J+8
	 xVHVOjiiDatjg==
Date: Mon, 12 Dec 2022 10:29:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, John Crispin
 <john@phrozen.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Marek Vasut <marex@denx.de>, Sean
 Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Landen
 Chao <Landen.Chao@mediatek.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Alvin
 =?UTF-8?B?xaBpcHJhZ2E=?= <alsi@bang-olufsen.dk>, Linus Walleij
 <linus.walleij@linaro.org>, UNGLinuxDriver@microchip.com, Woojung Huh
 <woojung.huh@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, Paolo Abeni <pabeni@redhat.com>, Eric
 Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, George McCollister
 <george.mccollister@gmail.com>
Subject: Re: [PATCH v5 net-next 00/10] dt-binding preparation for ocelot
 switches
Message-ID: <20221212102958.0948b360@kernel.org>
In-Reply-To: <20221210033033.662553-1-colin.foster@in-advantage.com>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_103002_376346_5F4B4E19 
X-CRM114-Status: GOOD (  16.51  )
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

On Fri,  9 Dec 2022 19:30:23 -0800 Colin Foster wrote:
> Ocelot switches have the abilitiy to be used internally via
> memory-mapped IO or externally via SPI or PCIe. This brings up issues
> for documentation, where the same chip might be accessed internally in a
> switchdev manner, or externally in a DSA configuration. This patch set
> is perparation to bring DSA functionality to the VSC7512, utilizing as
> much as possible with an almost identical VSC7514 chip.
> 
> This patch set changed quite a bit from v2, so I'll omit the background
> of how those sets came to be. Rob offered a lot of very useful guidance.
> My thanks.
> 
> At the end of the day, with this patch set, there should be a framework
> to document Ocelot switches (and any switch) in scenarios where they can
> be controlled internally (ethernet-switch) or externally (dsa-switch).

A lot of carried over review tags here, so please let me know if
there's anything that needs to be reviewed here, otherwise I'd like 
to merge the series for 6.2 by the end of the day.

