Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3385C4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 18:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2ATmObSzV4eeYzY6CoQyZq/5jRI5DOKZsLmwWQtw3M=; b=bQKfbJoF55b02AeWvJ6bEckEjN
	cWJ3OUPJiTlQN9e3vYF6g7j8++o19Lunm0TsnHK9iEw33LxQ+2nuLvO7lI5q3qPj+gdDN2scMqw+6
	//rTPrpZX4noq05yfTqfcTD5pLcAGcQ/DT0npVUYlFPY/bwP6jbUMueHLYk9rasZ68cTcI8OqcQbq
	+wldrxKT5OPvHDI4nY9NGD3uVmijckx8mPmVGtDBAg1pjZWktOk4beMM4toMuN3oZsqnvRv1FK0/E
	d8JkD0BX58k7eH5DaBA2VI4xXUGbsw8NGaYbvJWBSjjI2g3N4lFjm7a1JzLN4Z/J5LA9tX7yeWH1a
	dNNahe8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxvN-0000000Clya-1JVm;
	Fri, 02 Feb 2024 18:06:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxvK-0000000ClxT-0S0O;
	Fri, 02 Feb 2024 18:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h2ATmObSzV4eeYzY6CoQyZq/5jRI5DOKZsLmwWQtw3M=; b=ObLXNAjPuveYNFk2FxXGhxn30h
	0eMSF4JCx6nTaY5ps/qixLTdCG9nttzdB4vmXGfi1dhc0Lm+mlwVLIWjISDlCqhO22LkaLGM8bRh/
	ZgYJoAqIqdCU+b140Zls+zIInP9AYeteqn0e438kukRymDf+y9BygXSO56Ns6K0YplJGZTdhFXtIC
	BS/gtnnwuIyYzoiBscjrIpTLWBj2/+4QkfR240j+qXMWhfZQ70gc8xr6EOfY1JO9UwgV5e8J0pJSu
	2qjd4ciq2AFp+ipZLyExm5XZlqn4LncSrUUE+8wnVh/el1JEDBepA1dxdRX4ycLyI1kQ/W8q0qDBu
	MhuO8W/A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59614)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rVxv3-0006Kg-2u;
	Fri, 02 Feb 2024 18:05:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rVxuy-0008VK-P4; Fri, 02 Feb 2024 18:05:36 +0000
Date: Fri, 2 Feb 2024 18:05:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
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
Message-ID: <Zb0u8NY0q6ay17j5@shell.armlinux.org.uk>
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-1-63d5adae99ca@arinc9.com>
 <ZbzUotyQm/FyKK7G@shell.armlinux.org.uk>
 <e3b4add6-425c-46ca-9da5-8713055fc422@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3b4add6-425c-46ca-9da5-8713055fc422@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_100558_177479_7EB4353E 
X-CRM114-Status: GOOD (  28.91  )
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

On Fri, Feb 02, 2024 at 08:44:39PM +0300, Arınç ÜNAL wrote:
> On 2.02.2024 14:40, Russell King (Oracle) wrote:
> > While reviewing this change, but not related to it, I notice that this
> > function sets the TX delay based on the RGMII interface mode. This isn't
> > correct. I've explained why this is this many times in the past, but
> > essentially it comes down to the model:
> > 
> > 
> > phy-mode in NIC node	Network driver	PCB		PHY
> > rgmii			no delays	delays		no delays
> > rgmii-id		no delays	no delays	tx/rx delays
> > rgmii-txid		no delays	no delays	tx delays
> > rgmii-rxid		no delays	no delays	rx delays
> > 
> > Then we have rx-internal-delay-ps and tx-internal-delay-ps in the NIC
> > node which define the RGMII delays at the local end and similar
> > properties for the PHY node.
> > 
> > 
> > So, if we take the view that, when a switch is connected to a NIC in
> > RGMII mode, then the phy-mode specified delays still should not impact
> > the local NIC.
> > 
> > Now, for the switch, we specify the phy-mode in the port node as well.
> > Consider the case of a switch port connected to a RGMII PHY. This has
> > to operate in exactly the same way as a normal NIC - that is, the
> > RGMII delays at the port should be ignored as it's the responsibility
> > of a PHY.
> > 
> > The final scenario to examine is the case of a RGMII switch port
> > connected to a NIC. The NIC's phy-mode has no way to be communicated
> > to DSA or vice versa, so neither phy-mode can impact the other side
> > of the RGMII link, but should only place the link into RGMII mode.
> > Given everything I've said above, the only way to configure RGMII
> > delays is via the rx-internal-delay-ps and tx-internal-delay-ps
> > properties. So, DSA drivers should _not_ be configuring their ports
> > with RGMII delays based on the RGMII phy interface mode.
> > 
> > The above is my purely logically reasoned point of view on this
> > subject. Others may have other (to me completely illogical)
> > interpretations that can only lead to interoperability issues.
> 
> I will address this with the next patch series. Thank you for explaining it
> in detail.

This is a good time to point out not to rush with the next patch
series, as my email will _likely_ provoke some additional discussion
from Andrew and/or Vladimir. So please give it a few days (maybe
around the middle of next week) to give them time to consider my
email and respond.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

