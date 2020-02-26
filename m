Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DC3C4BA21
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 19:12:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6C1B222C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 19:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SPSa6KfK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="wN0aYjMT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6C1B222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ul0YgcysWsB66jQO4pzGflDJ80mKsPB4VmGkgx2DrQE=; b=SPSa6KfKHTzS6k
	9frIs1r/STNUT0FnL4CvWL/D3FrZzycMgWYeJnQNthQBq9QoZF7N03Cv+HxbVbfttmIDO5Ox6WjEx
	Gd+j/YJ/pTSKe+y0qD865EE86J8S49EsrgXlqPbuq+C2vdPWj7I54o1aXIG+Qvn7f9uD47clVwH9m
	Fh1yGy1tUHJSeaiKPc4PAXo3eLRcDH0ntCDdh3G92c4BD09voMC0o5b5uvcTnp9LydsAM93yQMTNB
	rotiGtGM9QjkjOvRaPr3s40n/eQBOokLPl6Q9Nnky8HirQR7u6ZEl1WlfOj37hYoYUT7Y6Vf0w6zL
	KEvaMikQHu4kibiEAjLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j726h-0007SK-Ju; Wed, 26 Feb 2020 19:12:31 +0000
Received: from pandora.armlinux.org.uk
 ([2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j726e-0007Rc-Oz; Wed, 26 Feb 2020 19:12:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KcpXKrnA+tSfLVsLB+Y3FGpvlq2JJa1WqGuNDRsLFVI=; b=wN0aYjMTZnoSDpDhzYIt38EqZ
 RJf1TJ5E/4mJ7s2PkotL8Y9CcARYlFdLFBhJjHRgQbIO/5Ji4MKvPuToTgdMQSVZaBpewmgISApvn
 hoitaH94VzMNRiKYpmU5JELCdxM/6krlabZlxq8GsuMnMbEC+YGGf03ukVz5HXolo+reNStySqmDb
 fBDYKr+Hr7kd+lbHivf4/VbIUkNapTWXz50IuZqT7s59Bzwnylte2jS600ebdyS68R5ngkl1ST3GE
 QEsruSikfBoyALG0il3MrgKBvRV/HfC296Dar4JHNwzc4R1VVd4Ln7DzNJofB0XNL8X+PD9bkXvqD
 rWi72JvXw==;
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:53150)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1j726A-00011K-VO; Wed, 26 Feb 2020 19:11:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1j7263-0000EC-U4; Wed, 26 Feb 2020 19:11:51 +0000
Date: Wed, 26 Feb 2020 19:11:51 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH net-next v2 1/8] net: phylink: propagate resolved link
 config via mac_link_up()
Message-ID: <20200226191151.GH25745@shell.armlinux.org.uk>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
 <E1j6tqv-0003G6-BO@rmk-PC.armlinux.org.uk>
 <CA+h21hrR1Xkx9gwAT2FHqcH38L=xjWiPxmF2Er7-4fHFTrA8pQ@mail.gmail.com>
 <20200226115549.GZ25745@shell.armlinux.org.uk>
 <CA+h21hqjMBjgQDee8t=Csy5DXVUk9f=PP0hHSDfkuA746ZKzSQ@mail.gmail.com>
 <20200226133614.GA25745@shell.armlinux.org.uk>
 <CA+h21hqHfC0joRDhCQP6MntFdVaApFiC51xk=tUf3+y-C7sX_Q@mail.gmail.com>
 <CA+h21hpzCY=+0U4JgFbqGLS=Sh6SjkSt=4J9e0AGVHKJPOHq1A@mail.gmail.com>
 <DB8PR04MB682837B8182CFC3359B71112E0EA0@DB8PR04MB6828.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DB8PR04MB682837B8182CFC3359B71112E0EA0@DB8PR04MB6828.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_111228_816204_10A2BC86 
X-CRM114-Status: GOOD (  19.44  )
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>,
 Jonathan Corbet <corbet@lwn.net>, Michal Simek <michal.simek@xilinx.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 26, 2020 at 06:32:55PM +0000, Ioana Ciornei wrote:
> > Subject: Re: [PATCH net-next v2 1/8] net: phylink: propagate resolved link config
> > via mac_link_up()
> > 
> > On Wed, 26 Feb 2020 at 20:21, Vladimir Oltean <olteanv@gmail.com> wrote:
> > >
> > > On Wed, 26 Feb 2020 at 15:36, Russell King - ARM Linux admin
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > >
> > > > dpaa2 is complicated by the firmware, and that we can't switch the
> > > > interface mode between (SGMII,1000base-X) and 10G.
> > > >
> > > > If the firmware is in "DPMAC_LINK_TYPE_PHY" mode, it expects to be
> > > > told the current link parameters via the dpmac_set_link_state() call
> > > > - it isn't clear whether that needs to be called for other modes
> > > > with the up/down state (firmware API documentation is poor.)
> > > >
> > >
> > > With PCS control in Linux, I am pretty sure that you don't want
> > > anything other than DPMAC_LINK_TYPE_PHY anyway.
> > > Basically in DPMAC_LINK_TYPE_FIXED, the MC firmware is in control of
> > > the PCS and polls its link state to emit link notifications to objects
> > > connected to the DPMAC. So Linux control of PCS would class with
> > 
> > s/class/clash/
> > 
> > > firmware control of the PCS, leading to undesirable side-effects to
> > > say the least.
> 
> 
> If the DPMAC object is in DPMAC_LINK_TYPE_FIXED, the dpaa2-eth in fact
> does not even connect to a phy so all the phylink interaction is not happening.
> As Vladimir said, in this case it's the MC firmware's job to poll the PCS and
> notify any connected objects of a link change.

Please see the patches I've referred Vladimir to, specifically this:

        if (attr.link_type == DPMAC_LINK_TYPE_PHY) {
                /* FIXME: how do we know whether this DPMAC has a PCS? */
                err = dpaa2_pcs_create(mac, attr.id);
                if (err)
                        goto err_phylink_destroy;

                phylink_add_pcs(mac->phylink, &dpaa2_pcs_phylink_ops);
        }

Hence, if we are not in DPMAC_LINK_TYPE_PHY, then we never talk to
the PCS, thereby satisfying the requirements of the firmware not to
touch the PCS if it's in FIXED mode.

It seems this is becoming a storm in a tea cup.  Please stop.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
