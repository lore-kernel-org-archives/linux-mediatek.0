Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A297C4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 20:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGnc/m8wZ5VekXMjEDlGv2LgOYZxP0Ar/ku6T9fE9Us=; b=NJZmSC4rSHyM7de17C6BVdT7o2
	4uT3oCEGQhN1AT4ht+QvZmAG7fPgAYv7bFi/qTs0OwfVC1+n1XK9KwfhLuYm04PtT+NgREI2HMKSM
	QwJ1aGG0NBMcAWC5KNe6drywxYVLt3xFgP/ZQjEb0jPw4EG6xFctAmyYY4M0jlit4Zc+mhbgOUn+A
	LhQ5AH/O6jCYvkSRoGbDxC5FG9FN9ZVjJyTXBOCAomSg2CXQq6ypyD+r3QDATjNBblk2C01LlLIGq
	8IPH+gbysbjX9RI8qeI2oVpY8U1Np8ijcuKF3ZifFF9yvXq4vilKnRsYSHGyzjaHLHA7nvBg721Ga
	dS1OEeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW07t-0000000DNSn-1gGi;
	Fri, 02 Feb 2024 20:27:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW07H-0000000DNEB-0FNA;
	Fri, 02 Feb 2024 20:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=WGnc/m8wZ5VekXMjEDlGv2LgOYZxP0Ar/ku6T9fE9Us=; b=AG
	mPciXsoxeRmPl2pgCQEew0vyueQo9nP5a9cQdrR+vatsm8Rr4aFOl3MqKSocFSSE/Orl8uXD6DN+s
	tZ17BYJL9sHXLLpXE/s7ECOaxX/7daK9ZtTjQDXczWjFuEWK588nEvNGnj111BYTG/AaTEMBvnC6b
	+BzMRtZQ4btiEDE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rW06l-006qZX-8r; Fri, 02 Feb 2024 21:25:55 +0100
Date: Fri, 2 Feb 2024 21:25:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 1/7] net: dsa: mt7530: empty default case on
 mt7530_setup_port5()
Message-ID: <59e88b15-da57-4cff-83b3-91e38a185461@lunn.ch>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-1-63d5adae99ca@arinc9.com>
 <ZbzUotyQm/FyKK7G@shell.armlinux.org.uk>
 <e3b4add6-425c-46ca-9da5-8713055fc422@arinc9.com>
 <Zb0u8NY0q6ay17j5@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zb0u8NY0q6ay17j5@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_122627_262707_4E3FB8E3 
X-CRM114-Status: GOOD (  31.73  )
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

On Fri, Feb 02, 2024 at 06:05:36PM +0000, Russell King (Oracle) wrote:
> On Fri, Feb 02, 2024 at 08:44:39PM +0300, Arınç ÜNAL wrote:
> > On 2.02.2024 14:40, Russell King (Oracle) wrote:
> > > While reviewing this change, but not related to it, I notice that this
> > > function sets the TX delay based on the RGMII interface mode. This isn't
> > > correct. I've explained why this is this many times in the past, but
> > > essentially it comes down to the model:
> > > 
> > > 
> > > phy-mode in NIC node	Network driver	PCB		PHY
> > > rgmii			no delays	delays		no delays
> > > rgmii-id		no delays	no delays	tx/rx delays
> > > rgmii-txid		no delays	no delays	tx delays
> > > rgmii-rxid		no delays	no delays	rx delays
> > > 
> > > Then we have rx-internal-delay-ps and tx-internal-delay-ps in the NIC
> > > node which define the RGMII delays at the local end and similar
> > > properties for the PHY node.
> > > 
> > > 
> > > So, if we take the view that, when a switch is connected to a NIC in
> > > RGMII mode, then the phy-mode specified delays still should not impact
> > > the local NIC.
> > > 
> > > Now, for the switch, we specify the phy-mode in the port node as well.
> > > Consider the case of a switch port connected to a RGMII PHY. This has
> > > to operate in exactly the same way as a normal NIC - that is, the
> > > RGMII delays at the port should be ignored as it's the responsibility
> > > of a PHY.

Not quite. It is unusual, but there are a few MAC drivers which do act
on phy-mode, to configure MAC delays. However, if they do this, they
then mask the value of phy-mode passed to the PHY in order to avoid
double delays. Its not something i recommend, we prefer the PHYs do
the delays. And it something i strongly suggest we avoid in DSA.

> > > The final scenario to examine is the case of a RGMII switch port
> > > connected to a NIC.

This should also extend to a port connected to a port of another
switch. For Marvell switches, these are so called DSA ports.

> > > The NIC's phy-mode has no way to be communicated
> > > to DSA or vice versa, so neither phy-mode can impact the other side
> > > of the RGMII link, but should only place the link into RGMII mode.
> > > Given everything I've said above, the only way to configure RGMII
> > > delays is via the rx-internal-delay-ps and tx-internal-delay-ps
> > > properties. So, DSA drivers should _not_ be configuring their ports
> > > with RGMII delays based on the RGMII phy interface mode.

Marvell goes against this. rx-internal-delay-ps and
tx-internal-delay-ps are pretty new, when compared to the age of
mv88e6xxx. I had the problem of a FEC connected to an mv88e6xxx using
RGMII and i needed to somehow configure RGMII delays, or packets did
not get through. So mv88e6xxx will apply phy-mode to ports being used
in CPU or DSA mode. So in the case of the FEC->switch, rgmii-id is
used by the switch. For DSA->DSA, there are DT blobs with rgmii-txid
on both ends of the link, which results in the needed delays.

> > > The above is my purely logically reasoned point of view on this
> > > subject. Others may have other (to me completely illogical)
> > > interpretations that can only lead to interoperability issues.

Now that rx-internal-delay-ps and tx-internal-delay-ps actually exist,
these are the best ways to handle such delays, for new drivers. But we
cannot change old drivers without causing regressions.

       Andrew

