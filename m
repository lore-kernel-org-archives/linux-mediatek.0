Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F56C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 20:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVb4tiMdT2faXd9FacvIsPER+ODtFm7SXnJKt/bIKr0=; b=y2/zQgRIyugCir1HkhpnV39pxb
	ygXTEfgOxAi4EazMxEnyTiUagzBvwuJj8tGMoBgJ2B99sUoUcJE2ty2BMhrdt8DkVDQJWgv0TpWzf
	+6cIeYmPaIZCsksbQ3hpULKL7y/P8tiyu1Tt4pOuuiWwkzGtC4eEUrIW5svtvZL8o6m685q5MFJku
	d6JJ4wpLZyePC+5VbL+2JeKsFl42UDhDI+uA+yXE6cBqnyHjsQPqUW3cdnylTZ6gHmY3OqPHAucDw
	7eU6AUmq7tgchu2SaKtG26hZZXwAjOHcrPMjd1GVRnKkRwq4Rw+pteiRINDpjshURNpgCnYwYk2Tt
	942sBw5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZe3F-002OvI-4N; Tue, 07 Mar 2023 20:36:49 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZe32-002Oqv-4g; Tue, 07 Mar 2023 20:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BVb4tiMdT2faXd9FacvIsPER+ODtFm7SXnJKt/bIKr0=; b=XGkkYfMl0eR2Y5wzxKDMDPNrn6
	+rpYYkyAcD+KC/5LdUYdjbbzDP670KJnpZC8xkvFvh47FJPVoC7PHNTwgCmmKukCe5q8dYb6edElx
	CRu9TxI/bt8+LUNptGEYi6cAxXM526j2XXdeBPT/O7+jny9MlxoCJ7uNlgqOzjpnyjs0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pZe2A-006haZ-W3; Tue, 07 Mar 2023 21:35:42 +0100
Date: Tue, 7 Mar 2023 21:35:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Klaus Kudielka <klaus.kudielka@gmail.com>
Cc: Michael Walle <michael@walle.cc>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-aspeed@lists.ozlabs.org,
	Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
Message-ID: <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
References: <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
 <20230116-net-next-remove-probe-capabilities-v2-4-15513b05e1f4@walle.cc>
 <449bde236c08d5ab5e54abd73b645d8b29955894.camel@gmail.com>
 <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_123636_203549_BEF82622 
X-CRM114-Status: UNSURE (   7.99  )
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

> Summary: Still 4 calls to mdio_bus_scan_c22, but also *2* calls to mdio_bus_scan_c45, approx. 190*100 reads by the switch driver

Those calls to mdio_bus_scan_c45 are caused by 743a19e38d02 net: dsa:
mv88e6xxx: Separate C22 and C45 transactions.

Some families of the mv88e6xxx do support C45 bus transactions. That
includes the 6171 you have. Before, we never scanned the C45 bus, but
now we do.

But something does not add up. Doing an additional c45 scan should
only double the number of reads by the switch driver.

The only part of a c45 scan which is not linear is
mv88e6xxx_g2_smi_phy_wait() which is implemented by
mv88e6xxx_wait_mask(). That loops reading a register waiting for a bit
to change. Maybe print out the value of i, and see if it is looping
more times for C45 than C22?

     Andrew

