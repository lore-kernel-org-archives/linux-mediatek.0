Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44661C34022
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 01:54:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16EB7214D8
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 01:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XqJtlYFG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Y8gnB20+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16EB7214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itTPGB2S2y5UJYYtsUJU0pleRw/aLlxaLLI5g/pAEQo=; b=XqJtlYFGEHCLqX
	SB4Q0fb+k6UB2jbBTyG9sth+0jE3kQcWlm5EJeUW9zY/TDqzprbORrKeF5BpzqNTDuHA2FNXV7UV4
	7iXZoUqtNpus9xX0Kcx4Rcu441jh6Hp1PsqgHwIUe53RtKz7PskO2++nrH00jINf9SZBlneF1VunU
	ZHyVjXSut77rILgXuTnfIjvjsd1Zm2mpuhP1EM6ldhCxpRlWnXzjX1AIkRYNV516dxLLVsCCuyEvb
	soy2L2GG1lTPJrENFrpKdF75bUH7iGYqyUrTwJdEoQQLrHeCOAQGaE/0bUxE4Ej7UqfntoLEgHGRP
	oR+7isEQgXiOiPi0PDNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3s5V-0002ch-Tp; Tue, 18 Feb 2020 01:54:13 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3s5T-0002Wv-Jp; Tue, 18 Feb 2020 01:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zi/r8mbt3ArBElcGWaOvulYaFWwCLLGqTvQ8tW82sm8=; b=Y8gnB20+kMGP6TPFsLqUZ+xR9
 pCvJWoL/yMGmbYUsAEci98dSssqiYXl4OWUljCcU4eHFI8HrQCM0++2E5GNyHqVKjF59duOtOrG2A
 ak+/ETbJituUu0nCLLaNL3q8KWuEg83+5Jr0P5e6yFYEkCdNP7nmktmOafEQVvpd4xS495RiBcrZr
 SQf9jBeY3cMkdURtEJ+9F1sGUl1I31qIPpR4+wWdsAC5X8htuiLH78zBGcApEm+A+TQsKl4dXTA8S
 /a3RN+Kh/upi1G0HG8YWCUk9PP/pXQiOAV8BAolOaw353yla1DrrL7QVVQkQu/nvyh0s+GhK5fOK9
 gnx8OUMcg==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:41782)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j3s4u-0004Jk-S6; Tue, 18 Feb 2020 01:53:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j3s4l-0006oC-Qv; Tue, 18 Feb 2020 01:53:27 +0000
Date: Tue, 18 Feb 2020 01:53:27 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [CFT 1/8] net: phylink: propagate resolved link config via
 mac_link_up()
Message-ID: <20200218015327.GD25745@shell.armlinux.org.uk>
References: <20200217172242.GZ25745@shell.armlinux.org.uk>
 <E1j3k7e-00071q-3R@rmk-PC.armlinux.org.uk>
 <16f6912c-84a9-f1ab-6688-6a55ebf34270@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16f6912c-84a9-f1ab-6688-6a55ebf34270@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_175411_662951_80534695 
X-CRM114-Status: GOOD (  12.25  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-doc@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Felix Fietkau <nbd@openwrt.org>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 17, 2020 at 01:54:19PM -0800, Florian Fainelli wrote:
> 
> 
> On 2/17/2020 9:23 AM, Russell King wrote:
> > Propagate the resolved link parameters via the mac_link_up() call for
> > MACs that do not automatically track their PCS state.
> > 
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > ---
> 
> [snip]
> 
> 
> > -static void macb_mac_link_up(struct phylink_config *config, unsigned int mode,
> > -			     phy_interface_t interface, struct phy_device *phy)
> > +static void macb_mac_link_up(struct phylink_config *config,
> > +			     struct phy_device *phy,
> > +			     unsigned int mode, phy_interface_t interface,
> > +			     int speed, int duplex,
> > +			     bool tx_pause, bool rx_pause)
> 
> I have not been able to find an answer so I will ask this question, why
> not pass a const struct phylink_link_state reference here instead of
> splitting those link settings as individual function parameters? Or
> maybe introduce a phylink_link_settings comprised of all of those 4
> settings and embed it within phylink_link_state as well?

History of mac_config() has shown that passing something like
struct phylink_link_state results in stuff that should not be used
being used inspite of documentation saying otherwise.  Passing
just the appropriate state ensures that stuff which should not
be used can't be got at.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
