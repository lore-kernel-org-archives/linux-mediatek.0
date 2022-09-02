Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B41ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 16:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6hJKWK+ULYfDR0vxEt9RZQDPKAk9LpJfzJUF8zaBdM=; b=sphEarj1H/ZWTlXclP/G/sgn/b
	4jFJST2K9dps6mUIIiB3EJAmfaE6zVWEYpQLJfennjvBhBXqFk2S3G3v0ku/qePILVd+K/y4KwD9Q
	8wh3wnbZAo33EI/KgBeeV5c29V5Vl4+zMgZhz4IKitQj5DnAoDYXSsaMzNuUNOqPrRbbUPMTEckW2
	YHOuQ06ITyanc/udAvVIBSyn7vz6L6gpbvxxau3Kag1czIAKTfQzPp98wL1lr7+gh6bzOysY1XIn+
	iiXyLUt9aPNunPhJf65s+TQE44m3rfRVBdxGzHNUUpJ/j3DgCxgq3bmhcEIEJE0ala9RrIZDKH6s0
	Auzb6HIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9fO-0078Lk-Hz; Fri, 02 Sep 2022 16:37:14 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9fM-0078Ik-4d
	for linux-mediatek@lists.infradead.org; Fri, 02 Sep 2022 16:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V6hJKWK+ULYfDR0vxEt9RZQDPKAk9LpJfzJUF8zaBdM=; b=AY7RDjKS66W1tsRQE2bcTFzYmX
	2t1Ownj12//mKYm7PZt/xYm/ibLMofaZ931XxjV6flUwOMt5h75DAm9ALCn53aFoEFoqtGTjnVbZ2
	s3/MEu20PuCS4ANXj2BTJX2RpGU4gNR/gGXroa3+ehuSNpxYVsAiGyLw4Ms48uQevaL4M4U/ZL6bK
	PDn1HS//AKomAmxIXxa9ulfesXi50FwqRSmMiG05eEWi6M+ayWUxd5EeX5fQk8GYkX5HZmSfhF0st
	y4sZVD4xjsC0l1Zaar98QrVPBBl6lzysq7k7n/nYPPW3Je6Yxa1H7GL0ny0IuV8l9XPm96N9A2Isd
	HaTLVVrQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34072)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1oU9f1-0007mF-48; Fri, 02 Sep 2022 17:36:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1oU9eu-0004ZJ-HC; Fri, 02 Sep 2022 17:36:44 +0100
Date: Fri, 2 Sep 2022 17:36:44 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander 'lynxis' Couzens <lynxis@fe80.eu>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH 3/4] net: mediatek: sgmii: mtk_pcs_setup_mode_an: don't
 rely on register defaults
Message-ID: <YxIxHHyl4cuHH68J@shell.armlinux.org.uk>
References: <20220820224538.59489-1-lynxis@fe80.eu>
 <20220820224538.59489-4-lynxis@fe80.eu>
 <YwTyLwRnQ+eTXeDr@shell.armlinux.org.uk>
 <20220902174710.54a1d317@javelin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902174710.54a1d317@javelin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_093712_214686_3CE842A4 
X-CRM114-Status: GOOD (  30.67  )
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

On Fri, Sep 02, 2022 at 05:47:10PM +0200, Alexander 'lynxis' Couzens wrote:
> On Tue, 23 Aug 2022 16:28:47 +0100
> "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> 
> > On Sun, Aug 21, 2022 at 12:45:37AM +0200, Alexander Couzens wrote:
> > > Ensure autonegotiation is enabled.
> > > 
> > > Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
> > > ---
> > >  drivers/net/ethernet/mediatek/mtk_sgmii.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c
> > > b/drivers/net/ethernet/mediatek/mtk_sgmii.c index
> > > 782812434367..aa69baf1a42f 100644 ---
> > > a/drivers/net/ethernet/mediatek/mtk_sgmii.c +++
> > > b/drivers/net/ethernet/mediatek/mtk_sgmii.c @@ -32,12 +32,13 @@
> > > static int mtk_pcs_setup_mode_an(struct mtk_pcs *mpcs)
> > > regmap_write(mpcs->regmap, SGMSYS_PCS_LINK_TIMER,
> > > SGMII_LINK_TIMER_DEFAULT); 
> > > +	/* disable remote fault & enable auto neg */
> > >  	regmap_read(mpcs->regmap, SGMSYS_SGMII_MODE, &val);
> > > -	val |= SGMII_REMOTE_FAULT_DIS;
> > > +	val |= SGMII_REMOTE_FAULT_DIS | SGMII_SPEED_DUPLEX_AN;  
> > 
> > Does SGMII_SPEED_DUPLEX_AN need to be cleared in
> > mtk_pcs_setup_mode_force(), so mtk_pcs_link_up() can force the
> > duplex setting for base-X protocols?
> > 
> 
> Yes SGMII_SPEED_DUPLEX_AN needs to be cleared to have FORCE_DUPLEX
> working. But mtk_pcs_setup_mode_force() is clearing it implicit by
> 
> val &= SGMII_DUPLEX_FULL & ~SGMII_IF_MODE_MASK

It would make the code more reasonable to spell out what is included
in SGMII_IF_MODE_MASK. It's:

#define SGMII_SPEED_DUPLEX_AN           BIT(1)
#define SGMII_SPEED_MASK                GENMASK(3, 2)
#define SGMII_DUPLEX_FULL               BIT(4)
#define SGMII_IF_MODE_BIT5              BIT(5)

I'm guessing no one knows what SGMII_IF_MODE_BIT0 and
SGMII_IF_MODE_BIT5 actually do - and as neither seem to be used in
the code, the definitions are redundant.

> because it's included in the SGMII_IF_MODE_MASK.
> I also don't understand why it's forcing it in the
> mtk_pcs_link_up().

Please note that I've forgotten the contents of these patches, so
these comments may not be entirely accurate...

A lot of the code in the driver is quite weird, so when I converted it
to phylink_pcs, I tried to keep the decision making the same as in the
original code. It would help readability if the decision making was
cleaned up - so similar tests in mtk_pcs_link_up() and
mtk_pcs_config().

By that, I mean - if the test in mtk_pcs_link_up() is for 802.3z modes,
then shouldn't the test in mtk_pcs_config() also be using the same?
From what I understand from mtk_eth_soc.c as it originally stood, the
PCS driver is only used for SGMII, 1000base-X and 2500base-X.

The SGMII duplex setting is changed in mtk_pcs_link_up() only for 802.3z
modes - in other words, 1000base-X and 2500base-X.

When mtk_pcs_config() is called for 1000base-X and 2500base-X, it calls
mtk_pcs_setup_mode_force(). This clears SGMII_AN_ENABLE, disabling
autonegotiation, and forcing 1000Mbps. Presumably, this PCS as the code
was originally written is only capable of SGMII negotiation.

It looks to me like the original code does not support autonegotiation
on 802.3z interface modes.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

