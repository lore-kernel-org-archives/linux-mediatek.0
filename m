Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD06C38142
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 01:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdtp96MkQqNFQz6JJRJ1cbL+HbsHJDeQaX0Fm7hkhL0=; b=LVBRHacZ9XSTAmgKQ9Oec0TMtz
	c7vFkW+61YUVqp8yPJixkoMgtFuMhF0yNNb+Zhx2RGo9tEiy/uTGrP4e9TL+C4ur7DRntw9FY736j
	D8/Z0rEAqvzJMA8tbQF/n8QidS9O3PDvGmTT0Xxe3teeUUNRXC+ahWXm2h04SvJaypbFfr5BK1N7H
	0ZP0Sejp8qwNLPIofnUsGfvb7PEG1pUvmRVM06j83TjJI6M/tJGHcxXQcJLo2ouBD1vSY9rqs6280
	qAFiFNu50e+REFUgajxrMd3kVwCn7hIEjKLlLrLP/4gmr/IF2LDyuo5NJKWnqg1Qie0bb4wngGt9g
	/RceYFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHx5W-00GROa-3w; Wed, 18 Jan 2023 01:18:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHx5E-00GRLP-66; Wed, 18 Jan 2023 01:17:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91B03615BF;
	Wed, 18 Jan 2023 01:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50EDEC433D2;
	Wed, 18 Jan 2023 01:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674004662;
	bh=FGOiyRzcJoEHKdMm+kbK+YBbd8BVEKp07glKSiqMg5M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QbeEAIQw7uP/CRIUHrwWm1uUqA0LznQ6bZkZCm/JvVzO+chR72Aco1aIqOwMEMO6A
	 nBojp92S1Dz6EWGVhbEqXnr2gR1nDDCg1BvKgFHpWbYSepjNRH/Y/8jrAVBM+iwkX5
	 HJdlwLQF+HWFHnVGGr0vEm2GmGJw5zhl0oOL6KxGZo1YkpRav1MK6etkZ44IQEhchi
	 ys/UxjqQtx//40gat0FDCYAyyq+pPU/BaAhpVXg2/scFUUHc+hUK6WNuwBEXmm5NCW
	 cvWuhnpp8XPzu/obuWLLL3faKEfzlFEgRT48oZuIESimcnHSBlKaDsX86cFMQE22Of
	 l8V+vvA4V+WDQ==
Date: Tue, 17 Jan 2023 17:17:40 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Felix
 Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 2/6] net: mdio: Rework scanning of bus ready
 for quirks
Message-ID: <20230117171740.3a9e6f8d@kernel.org>
In-Reply-To: <20230116-net-next-remove-probe-capabilities-v1-2-5aa29738a023@walle.cc>
References: <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
	<20230116-net-next-remove-probe-capabilities-v1-2-5aa29738a023@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_171744_340730_2B53C7D4 
X-CRM114-Status: GOOD (  12.34  )
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

On Mon, 16 Jan 2023 13:55:14 +0100 Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> Some C22 PHYs do bad things when there are C45 transactions on the
> bus. In order to handle this, the bus needs to be scanned first for
> C22 at all addresses, and then C45 scanned for all addresses.
> 
> The Marvell pxa168 driver scans a specific address on the bus to find
> its PHY. This is a C22 only device, so update it to use the c22
> helper.

clang says:

drivers/net/phy/mdio_bus.c:708:11: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
        while (--i >= 0) {
                 ^
drivers/net/phy/mdio_bus.c:620:7: note: initialize the variable 'i' to silence this warning
        int i, err;
             ^
              = 0

