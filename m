Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8D2C77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 16:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqcTv+vYdhbaVFSKpmvdraoLLV+d4d/ugbOIciVxvKM=; b=DZS4vZ/d/P0PYGysa4eNeXUe2M
	NqAdCXD7E81A3IiVE5Gg+77YijUYS5fXueJi2o51cAEC+xVJ4J2Xmc2ic7v6hXCcy2qPblM0Tph7Q
	94QN/EUwq+ncwiykPlGW84CW97xxi/e+IYI7gNR3Mp7Fkm5C0ZXsMaO5g0MA/MRa1TCX7Ri/ZfS73
	aRl5buLzai48T5jPH860i1GQaxBr7IOHJPn7+JGPkf/924hS3yp50UsTPMOEoyEAwHeCU8/KzqJk5
	2VQkxjFIIEPTNDKTKlchElUpWKYEVLhTFf1J9B4DaX+Ixz6HFudje6qsfg+hDas4ZqbKXHGtJTSxB
	3M3R/vzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prhpt-004Ngw-0W;
	Wed, 26 Apr 2023 16:17:41 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prhpp-004Nej-2m;
	Wed, 26 Apr 2023 16:17:39 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1prhpE-0005lh-2Q;
	Wed, 26 Apr 2023 18:17:00 +0200
Date: Wed, 26 Apr 2023 17:15:12 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next 04/24] net: dsa: mt7530: properly support
 MT7531AE and MT7531BE
Message-ID: <ZElOEAsoNXUlYL1g@makrotopia.org>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
 <20230425082933.84654-5-arinc.unal@arinc9.com>
 <ZEfsCit0XX8zqUIJ@makrotopia.org>
 <ce681fac-5f00-f0fc-b2cf-89907c50ee7c@arinc9.com>
 <ZEkiIQZsspBlDyEn@makrotopia.org>
 <20230426143944.s5vmhloepa3yodrj@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230426143944.s5vmhloepa3yodrj@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_091737_896290_2437148A 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 26, 2023 at 05:39:44PM +0300, Vladimir Oltean wrote:
> On Wed, Apr 26, 2023 at 02:07:45PM +0100, Daniel Golle wrote:
> > On Wed, Apr 26, 2023 at 11:12:09AM +0300, Arınç ÜNAL wrote:
> > > On 25.04.2023 18:04, Daniel Golle wrote:
> > > > On Tue, Apr 25, 2023 at 11:29:13AM +0300, arinc9.unal@gmail.com wrote:
> > > > > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > > > 
> > > > > Introduce the p5_sgmii pointer to store the information for whether port 5
> > > > > has got SGMII or not.
> > > > 
> > > > The p5_sgmii your are introducing to struct mt7530_priv is a boolean
> > > > variable, and not a pointer.
> > > 
> > > I must've meant to say field.
> > 
> > Being just a single boolean variable also 'field' would not be the right
> > word here. We use 'field' as in 'bitfield', ie. usually disguised integer
> > types in which each bit has an assigned meaning.
> 
> "field" is a perfectly legal name for a member of a C structure.
> https://en.wikipedia.org/wiki/Struct_(C_programming_language)
> Not to be confused with bitfield.

Right, thank you for pointing that out.
Must have slipped off my mind that all this is inside a struct, of
course...


