Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF56EC47258
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 23:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yX5+XCrARod+VsoOp+tq6jnm8t8QU2YLMp+hsOIWWk=; b=4z6+BQNFnvHNUbCAJKJSfQk4wp
	HgVWVd1EqocoCx8UlsTRS3r/uWRAQ4/JP1H3vN50IaBveeicBKgF2Gqpzl3SBWrKq50Vdj1+s0hvC
	3rISiJeEjCQymk5JB8lELcZkoz9WGkLedS3OoAeMjcNyIZigl52gxyIgSi68xwAvAt/fYWKCqp8CY
	vNrh+oqvZri14HRBaxiAQm0qKUFvRX4DvEG7wve36bSdV8k1Xp4HfIBxAr9ytuDXczvP7cC70Zlnn
	ZNvCvlWFOXyu0NPef2y2v8zStzBficdQvZ50u9AUemAuCdraDTXmzazaf+tICDZh5flTW0icZUfvY
	WYeauK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSPzk-000npf-1X;
	Tue, 23 Jan 2024 23:15:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSPzh-000np4-0o;
	Tue, 23 Jan 2024 23:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7yX5+XCrARod+VsoOp+tq6jnm8t8QU2YLMp+hsOIWWk=; b=d3OhwnX3Vuxy17BtXJOMDM36JV
	ooC8IcgtZCGs4yIn/8R2LlAh2pKkLVmTZsRqKetcoqJG3C109ilqxUjwDIQIY0jq9shUqNXbIXS86
	P/uLuyzEC9ryf7SUfoR71L7HyQZ5b6vhFmTypOlMLhaDQ/zvfn8RZUpVZ7eatF98x2To=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rSPzV-005t58-FR; Wed, 24 Jan 2024 00:15:37 +0100
Date: Wed, 24 Jan 2024 00:15:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	richardcochran@gmail.com, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/8] net: phy: Introduce Qualcomm IPQ5018 internal PHY
 driver
Message-ID: <5ce729ad-549a-48f6-b261-ee8cb91e6474@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556D5568546D6DA4313209EC9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <2c6c0d72-5d4e-4ec4-beb6-d30852108a67@lunn.ch>
 <TYZPR01MB5556D035D9A13962844BB553C9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <e1fd863a-6725-4180-8ad3-faeb44c09238@lunn.ch>
 <TYZPR01MB55567CE79D7F08C738A81683C9742@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR01MB55567CE79D7F08C738A81683C9742@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_151549_291169_26AA32B6 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

> After rechecking the vendor code, you are right. The only special thing of
> this device is that it's a combined device of UNIPHY and at803x general phy.
> So it needs the UNIPHY initialization sequence. But for the PHY part, it's
> almost same as others, just has some special registers. I will merge it into
> at803x driver.

The UNIPHY is a separate driver, its a generic PHY driver? Can we keep
them separate for this internal PHY as well?

The initialisation sequence is what is going to be most 'interesting'
here. How UNIPHY, this PHY and the GCC all come together to make it
work. But for the moment, i think its best the PHY driver controls its
own clock input and reset, using standard Linux APIs, once the driver
has probed via compatible IDs.

       Andrew

