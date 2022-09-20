Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DBDC6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 22:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlQldgbpLnB3RZunTm59AlWrVqgls00cvlhoYLhB5KM=; b=Wq2N2yx0/SeZvWNjkLDOrTsxfW
	fZXNbk7M6mFWPqsMYu7I4QcazcR9MDWw7NPKq4N+lEDMIzH0yTqrlWFYl1IHoWNxDmwVWeSkrARPi
	DFKnBcINrf+hhSMTy1VX7h7kNp8lojdoDThGORrdjnhwgZKAAB3aJ7Kl8osgeFpXXVQcOqjcm45Wm
	1DvfpFiVjXz/j6cl1rgbq7CtWmnaDCXTJqarVQSY1GMkQhsMbYeTpIqQpBKX/fcmohynvy8QuNoB7
	oEFyRCMAHh7TvcDSOfH5sF+SJOtLZ3u0LSXomnPcAYwdeT6SGQpZAbVVPZbnnlwmjcoiS7MlHoRf3
	TkFPeytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaljr-007NDD-31; Tue, 20 Sep 2022 22:29:11 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaljo-007NCV-VP
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 22:29:10 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1oaljj-0007gY-30;
	Wed, 21 Sep 2022 00:29:04 +0200
Date: Tue, 20 Sep 2022 23:28:57 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexander 'lynxis' Couzens <lynxis@fe80.eu>
Subject: Re: [PATCH v2] net: dsa: mt7530: add support for in-band link status
Message-ID: <Yyo+qallmqd2/FG8@makrotopia.org>
References: <Yx4910YC6/Y7ghfm@shell.armlinux.org.uk>
 <Yx5I6nRPxYIiC1ZT@makrotopia.org>
 <20220919183622.205ccabf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919183622.205ccabf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_152909_047061_8655DACA 
X-CRM114-Status: GOOD (  12.48  )
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

On Mon, Sep 19, 2022 at 06:36:22PM -0700, Jakub Kicinski wrote:
> On Sun, 11 Sep 2022 21:45:30 +0100 Daniel Golle wrote:
> >  static void mt7531_pcs_get_state(struct phylink_pcs *pcs,
> >  				 struct phylink_link_state *state)
> >  {
> >  	struct mt7530_priv *priv = pcs_to_mt753x_pcs(pcs)->priv;
> >  	int port = pcs_to_mt753x_pcs(pcs)->port;
> > +	unsigned int val;
> >  
> > -	if (state->interface == PHY_INTERFACE_MODE_SGMII)
> > +	if (state->interface == PHY_INTERFACE_MODE_SGMII) {
> >  		mt7531_sgmii_pcs_get_state_an(priv, port, state);
> > -	else
> > -		state->link = false;
> > +		return;
> > +	} else if ((state->interface == PHY_INTERFACE_MODE_1000BASEX) ||
> > +		   (state->interface == PHY_INTERFACE_MODE_2500BASEX)) {
> > +		mt7531_sgmii_pcs_get_state_inband(priv, port, state);
> > +		return;
> > +	}
> > +
> > +	state->link = false;
> 
> drivers/net/dsa/mt7530.c:3040:15: warning: unused variable 'val' [-Wunused-variable]
>         unsigned int val;
>                      ^

Oops, forgot that one there. Just sent out v3 with this fixed and
an_complete handled more decently.

Thank you for the review!

