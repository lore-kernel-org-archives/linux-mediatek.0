Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47E6C54EBC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 00:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2agmfvIu6tvqdV4RiHb/uxCYt8H24jAHH9QwN+SU+4=; b=lUdHM0Ody1SoHs4RZ9VkhS+4no
	/rA1fGQbC/fZUzrLyoLdMN95I/BA90XXzp2UlKh8fqUh8eVZRold7eFJlmn+M3uQy4eAhk8hfDSRL
	PvdvEmwibvbsm5MjDeHg1Sid91XZq6a3JPYXArL4CYKAv0/o/RbAiIZ9zFvjRYs/eVwGvtF3HjqI+
	MERjgspJniOYj/fiupwdXCwYD1sD2NoNHZcp8t78E8rfvlWe/iXeuGXUpSEnmO2EnYnv+Tb14aWeA
	TgUjkGPwaCei1tjWpz0xkty6On5CtoewRCXQw1HqzOgOA+dkTJ2kbOIqNrnrI21Vxb8WOmFiQltwm
	Ttn7w/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFOXM-008xSS-A4; Wed, 11 Jan 2023 00:00:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFOXB-008xQI-Ea; Wed, 11 Jan 2023 00:00:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D235EB81A1D;
	Tue, 10 Jan 2023 23:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CF2C433EF;
	Tue, 10 Jan 2023 23:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673395198;
	bh=duw0LjoikfQ0dZpYavFL/CIJ3PpYay+YHMc35jB+yLo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Aen/XKrrrdot2L0nFNnJCVlRWaJjhMlTHgIfEE1bbtMoW43S39iE0JCLaLqLKmF9u
	 TLPWIaHzAUVbS8wujgQKuIow1cMsFjMEnclzMKQkkKbLm6uz/qt/iwB7Mo/9mLiHc/
	 LPb/51M2Rbsg4mIiNQrGuaoHuSnn0vSrdUv14oCJ9+BjCHxfqwDrfxYACZ3PZSl4Rd
	 lyMxy1YIBwAD8tylGlaE5Mt/zmnXxeSsr/vlMdCJSOKP5Bng0knu45jVXImBZM7hbo
	 akZkuRcIljdPYnQR8lCJXw9KW447AB0/JgPZKvLxjyPVTg7IXF1MLR0Eb1WuvkTW+2
	 5x4iV4a7gUB8w==
Date: Tue, 10 Jan 2023 15:59:56 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Michael Walle <michael@walle.cc>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jose
 Abreu <Jose.Abreu@synopsys.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, Wei
 Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v3 01/11] net: mdio: Add dedicated C45 API to
 MDIO bus drivers
Message-ID: <20230110155956.06941ea8@kernel.org>
In-Reply-To: <161fdffccb78fca2f16f1f5c78390420f60817b3.camel@redhat.com>
References: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
	<20221227-v6-2-rc1-c45-seperation-v3-1-ade1deb438da@walle.cc>
	<5bd7ee34ead313785951defbf3069b64d4338a45.camel@redhat.com>
	<161fdffccb78fca2f16f1f5c78390420f60817b3.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_160001_674620_A7417D21 
X-CRM114-Status: GOOD (  18.28  )
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

On Tue, 10 Jan 2023 13:49:28 +0100 Paolo Abeni wrote:
> On Tue, 2023-01-10 at 12:16 +0100, Paolo Abeni wrote:
> > On Mon, 2023-01-09 at 16:30 +0100, Michael Walle wrote:  
> > > diff --git a/include/linux/phy.h b/include/linux/phy.h
> > > index 6378c997ded5..65844f0a7fb3 100644
> > > --- a/include/linux/phy.h
> > > +++ b/include/linux/phy.h
> > > @@ -364,6 +364,11 @@ struct mii_bus {
> > >  	int (*read)(struct mii_bus *bus, int addr, int regnum);
> > >  	/** @write: Perform a write transfer on the bus */
> > >  	int (*write)(struct mii_bus *bus, int addr, int regnum, u16 val);
> > > +	/** @read: Perform a C45 read transfer on the bus */  
> > 
> > Minor nit: s/@read/@read_c45/ 
> >   
> > > +	int (*read_c45)(struct mii_bus *bus, int addr, int devnum, int regnum);
> > > +	/** @write: Perform a C45 write transfer on the bus */  
> > 
> > Mutatis mutandis, same thing here.  
> 
> Otherwise the series LGTM. I think it would be preferable avoiding
> reposting a largish series like this for such a minor change. I think
> the series can be merged as-is and the above can be addressed with a
> follow-up patch.

Hmmm if we're doing special treatment I guess can as well fix this 
when applying. Save people who report warnings potential work.

