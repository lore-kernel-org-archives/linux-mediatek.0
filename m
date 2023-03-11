Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B27BC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 15:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1cjWa/ZkeQ8ynLS3HKj8W+1nV4bPBS6kn+zz6pEL5o=; b=QOaQpN9B9XfkOWY65/74f6HVDs
	aTtdPFyVdrByd8rk9o/pDmFOnqLUr5IeKBmUEisQqX+NAFcHXheyDLluAGVEiWRyVf95k5ECkBIpE
	PaKqpcAvS5rIu2BZYfrSTCNuFshw3M9ISsi+lbXpZBeXhyBS1gK/Y4kS1ToVQql9SULODS2RcsReM
	kGGCHQAVNQwP4hQkZ78DfiRdRcpEogfAL2wIA1S6+5xfM/oikf5QDZixbbRhPFeegVAFNL2kJfBYP
	o1i1pbRB1atjVz85w1S535IfMTO7WGsJsE+eSDO830C+yvez1RmlpyDrQXbkR+QMf2oqV1cp+HLaO
	R0tjJ25A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb1Kh-000naR-Qk; Sat, 11 Mar 2023 15:40:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb1KX-000nY8-Aq; Sat, 11 Mar 2023 15:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=L1cjWa/ZkeQ8ynLS3HKj8W+1nV4bPBS6kn+zz6pEL5o=; b=lDIfeYMpfdi1Shz/zgmeAVzusF
	x0OEDGQ7Z6xWJV0WYKAedb45mhigl1d3v7Rp4+oxS6/c7dG4Gtq5h8DXWBlX2hNo1fHCotl1eOB/J
	GWSyM2lJOXImtgRMI7Ct7afh4KEiz7rG2+6+STKjo44VLsu9aDw855+FMSxYMvtefYn8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pb1Jo-0074HD-9X; Sat, 11 Mar 2023 16:39:36 +0100
Date: Sat, 11 Mar 2023 16:39:36 +0100
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
Message-ID: <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
References: <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_074021_397671_5DA01BE5 
X-CRM114-Status: GOOD (  15.48  )
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

On Sat, Mar 11, 2023 at 07:49:23AM +0100, Klaus Kudielka wrote:
> On Sat, 2023-03-11 at 00:49 +0100, Andrew Lunn wrote:
> > > Yes, that helps. Primarily, because mdiobus_scan_bus_c45 now is called only once,
> > > and at least some things are done in parallel.
> > 
> > Great. Could you cook up a proper patch and submit it?
> 
> I can give it a try. The commit message will be from my perspective,
> and the change Suggested-By you.

The commit message is fine.

I have one more idea which can speed things up. The scanning of the
MDIO bus works in two different ways depending on if there is a DT
node, describing what should be found on the bus. For mv88e6xxx, using
DT is optional. Some boards do, some don't.

If there is a DT node, only the addresses listed in DT are scanned.

If there is no DT node, by default, all 32 addresses on the bus are
scanned. However, DSA makes another assumption. There is a one to one
mapping between port number and PHY address on the MDIO bus. Port 0
uses MDIO address 0. Port 7 uses MDIO address 7 etc. If you have an 8
port switch, there is no point scanning addresses 8 to 31, they will
never be used.

The mdio bus structure has a member phy_mask. This is a bitmap. If bit
N is set, address N is not scanned. So i suggest you extend
mv88e6xxx_mdio_register() to set phy_mask based on
mv88e6xxx_num_ports(chip).

	Andrew

