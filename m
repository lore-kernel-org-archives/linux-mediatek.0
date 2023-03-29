Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BA5C74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 19:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4ihrCozdY4CpOt1bqW3JpcyR0pVtnhYIbVfF7mP0Qk=; b=R6J2dA3gy0YZfoWJqZKZEcpLRL
	ut2MVW6cYqNg8EfXsp3ogoIB/BxKYy78BenWrb5T54WqCqbHN2R19NFH1TcSQTpMLb7y4zXPDSCYy
	DeUTsKhepqOrlOq+IJ7rVkQCyfBSSCxbtw2jRyxdRICNiuPMmiPtuMFS14lo+NRooeDJrkNasmWi1
	WrccNPuxCfhtNGL+th/AA6EKnKCXPQ0wXK191dM9kABcxvbIPWBqM2AMQo4DbdT0HRJmSYyoW63x6
	PgIv+1OIIjsrcYvQ6CIQ4Uayw6cPcWYxTVRsnDFbuSDDPKsTE/vA+m99NMy+PSPVX2Aa1FHamHG4o
	gG1FFMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phb6i-001ZUh-0s;
	Wed, 29 Mar 2023 19:05:16 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phb6f-001ZTv-2M;
	Wed, 29 Mar 2023 19:05:14 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phb6a-0005fL-2y;
	Wed, 29 Mar 2023 21:05:09 +0200
Date: Wed, 29 Mar 2023 20:05:06 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [RFC PATCH net-next v3 14/15] net: dsa: mt7530: introduce driver
 for MT7988 built-in switch
Message-ID: <ZCSL4l/Fd37CgGBa@makrotopia.org>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <371f0586e257d098993847e71d0c916a03c04191.1680105013.git.daniel@makrotopia.org>
 <8fe9c1b6-a533-4ad9-8a23-4f16547476ed@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fe9c1b6-a533-4ad9-8a23-4f16547476ed@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_120513_778943_C9CAE6FD 
X-CRM114-Status: GOOD (  12.61  )
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

On Wed, Mar 29, 2023 at 06:57:54PM +0200, Andrew Lunn wrote:
> > @@ -18,6 +18,7 @@ enum mt753x_id {
> >  	ID_MT7530 = 0,
> >  	ID_MT7621 = 1,
> >  	ID_MT7531 = 2,
> > +	ID_MT7988 = 3,
> >  };
> >  
> >  #define	NUM_TRGMII_CTRL			5
> > @@ -54,11 +55,11 @@ enum mt753x_id {
> >  #define  MT7531_MIRROR_PORT_SET(x)	(((x) & MIRROR_MASK) << 16)
> >  #define  MT7531_CPU_PMAP_MASK		GENMASK(7, 0)
> >  
> > -#define MT753X_MIRROR_REG(id)		(((id) == ID_MT7531) ? \
> > +#define MT753X_MIRROR_REG(id)		((((id) == ID_MT7531) || ((id) == ID_MT7988)) ?	\
> >  					 MT7531_CFC : MT7530_MFC)
> > -#define MT753X_MIRROR_EN(id)		(((id) == ID_MT7531) ? \
> > +#define MT753X_MIRROR_EN(id)		((((id) == ID_MT7531) || ((id) == ID_MT7988)) ?	\
> >  					 MT7531_MIRROR_EN : MIRROR_EN)
> > -#define MT753X_MIRROR_MASK(id)		(((id) == ID_MT7531) ? \
> > +#define MT753X_MIRROR_MASK(id)		((((id) == ID_MT7531) || ((id) == ID_MT7988)) ?	\
> >  					 MT7531_MIRROR_MASK : MIRROR_MASK)
> 
> Are there more devices coming soon? I'm just wondering if these should
> change into static inline functions with a switch statement? The
> current code is not going to scale too much more.

Afaik no devices with different built-in switches are in the pipe at
this time, so this should be fine for a while.

