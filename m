Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB0FC7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Q9Ilw93VRUA4xL7mhv1L9R8ajbnrQrZWtw7gRABeBU=; b=R9CmhVYSy+j+J0e8cIYAgGHKX4
	o3NDlQgtJge2HiIifrq8hH25yZ00h5ncgoZemWnOO05xLaCkln4qrLAGeWCqjo+km/laoW7bz5ywF
	/MZuMxws1cmce95CUQnKzt+ceMsfMA9WbbtrX4jTSO4xNYmc5PUncPoOhoJB+tvgJK/DyEKrjAB7m
	IZ9z6M/IcNBLKUpq3zG684p7mtTyO56Qfa04/J70NuZUwBer7/rHpdpZHE1v4xA12ZTMnJWsCZBNb
	mUGgsQTHFnqnSTceSpggXVqqxXlNAq0adpxpA0gAEJrvlrFKfkZjbOAtyGQJCBo3fuPeJJtxK/I35
	z++1ushQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1preuX-0042E1-2J;
	Wed, 26 Apr 2023 13:10:17 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1preuT-0042Bp-2q;
	Wed, 26 Apr 2023 13:10:15 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pretn-0004ob-2w;
	Wed, 26 Apr 2023 15:09:32 +0200
Date: Wed, 26 Apr 2023 14:07:45 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 04/24] net: dsa: mt7530: properly support
 MT7531AE and MT7531BE
Message-ID: <ZEkiIQZsspBlDyEn@makrotopia.org>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
 <20230425082933.84654-5-arinc.unal@arinc9.com>
 <ZEfsCit0XX8zqUIJ@makrotopia.org>
 <ce681fac-5f00-f0fc-b2cf-89907c50ee7c@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce681fac-5f00-f0fc-b2cf-89907c50ee7c@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_061013_917763_D650AA9E 
X-CRM114-Status: GOOD (  21.86  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 26, 2023 at 11:12:09AM +0300, Arınç ÜNAL wrote:
> On 25.04.2023 18:04, Daniel Golle wrote:
> > On Tue, Apr 25, 2023 at 11:29:13AM +0300, arinc9.unal@gmail.com wrote:
> > > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > 
> > > Introduce the p5_sgmii pointer to store the information for whether port 5
> > > has got SGMII or not.
> > 
> > The p5_sgmii your are introducing to struct mt7530_priv is a boolean
> > variable, and not a pointer.
> 
> I must've meant to say field.

Being just a single boolean variable also 'field' would not be the right
word here. We use 'field' as in 'bitfield', ie. usually disguised integer
types in which each bit has an assigned meaning.

> 
> > 
> > > 
> > > Move the comment about MT7531AE and MT7531BE to mt7531_setup(), where the
> > > switch is identified.
> > > 
> > > Get rid of mt7531_dual_sgmii_supported() now that priv->p5_sgmii stores the
> > > information. Address the code where mt7531_dual_sgmii_supported() is used.
> > > 
> > > Get rid of mt7531_is_rgmii_port() which just prints the opposite of
> > > priv->p5_sgmii.
> > > 
> > > Remove P5_INTF_SEL_GMAC5_SGMII. The p5_interface_select enum is supposed to
> > > represent the mode that port 5 is being used in, not the hardware
> > > information of port 5. Set p5_intf_sel to P5_INTF_SEL_GMAC5 instead, if
> > > port 5 is not dsa_is_unused_port().
> > > 
> > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > ---
> > 
> > Other than the comment above this change makes sense and looks good to
> > me, so once you correct the commit message, you may add my Acked-by.
> 
> Will do, thanks.
> 
> Arınç

