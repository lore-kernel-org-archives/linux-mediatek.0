Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1573FC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 19:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9NIB1UrEQDamlxizOHo6isJg5WuPkkHK+fyTAcwgHo=; b=mUb0V0eogl6C+gJ7sjaLRNkoSm
	HX+HFKNlzCQtxg970J1KibcGKl1hrtA9DjBCUZU8XUvSAB9SToCbjZNcmOuv0thm4kPiyrsG5trz3
	nioYL0r8nRuAfH2EOor9DPYiC+YOkELpf6zVmgO3QbKyyWIfht8RxnmE8QYeRHqdrxhz+Pgj9WvvK
	lB8t3F7hjfg+Ak5iS8jcarFU6/cLX67Zuy5bPcBUvdYrUXFV7tXLna0K2njzexaDrEKWE0xizVGnW
	Kzk+DrZoFDMwEAu2ECCUkoxA3auh/x59LFpvk+B+gn37tQqXWfQjb755leR/cdzyVPyjxOKGlDCs2
	1yNc3AEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJtt-000yaA-06;
	Tue, 11 Apr 2023 19:43:33 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmJtq-000yZD-0c;
	Tue, 11 Apr 2023 19:43:31 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pmJtb-00082q-2B;
	Tue, 11 Apr 2023 21:43:15 +0200
Date: Tue, 11 Apr 2023 20:43:10 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next] net: dsa: mt7530: fix support for MT7531BE
Message-ID: <ZDW4Tr4bIGcxwDgs@makrotopia.org>
References: <ZDSlm-0gyyDZXy_k@makrotopia.org>
 <13aedaa6-6b7b-727e-e932-4a5139c54f39@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13aedaa6-6b7b-727e-e932-4a5139c54f39@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_124330_248077_4C205DED 
X-CRM114-Status: GOOD (  25.00  )
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

On Tue, Apr 11, 2023 at 10:30:06PM +0300, Arınç ÜNAL wrote:
> On 11.04.2023 03:11, Daniel Golle wrote:
> > There are two variants of the MT7531 switch IC which got different
> > features (and pins) regarding port 5:
> >   * MT7531AE: SGMII/1000Base-X/2500Base-X SerDes
> >   * MT7531BE: RGMII
> > 
> > Moving the creation of the SerDes PCS from mt753x_setup to mt7530_probe
> > with commit 6de285229773 ("net: dsa: mt7530: move SGMII PCS creation to
> > mt7530_probe function") works fine for MT7531AE which got two instances
> > of mtk-pcs-lynxi, however, MT7531BE requires mt7531_pll_setup to setup
> > clocks before the single PCS on port 6 (usually used as CPU port)
> > starts to work and hence the PCS creation failed on MT7531BE.
> > 
> > Fix this by introducing a pointer to mt7531_create_sgmii function in
> > struct mt7530_priv and call it again at the end of mt753x_setup like it
> > was before commit 6de285229773 ("net: dsa: mt7530: move SGMII PCS
> > creation to mt7530_probe function").
> 
> If I understand correctly, this patch does two things.
> 
> Run mt7531_create_sgmii() from mt753x_setup(), after mt7531_setup() and
> mt7531_setup_common() is run so that PCS on MT7531BE works.

> 
> Run the PCS creation code inside the loop only once if
> mt7531_dual_sgmii_supported() is false so it doesn't set the nonexistent
> port 5 SGMII on MT7531BE.

Yes, both is correct.

> 
> Regarding the first part:
> I was actually in the middle of moving the code until after
> mt7530_pll_setup() and mt7531_pll_setup() on mt7530_setup() and
> mt7531_setup() to mt7530_probe(). To me it makes more sense to run them on
> mt7530_probe() as there's a good amount of duplicate code on mt7530_setup()
> and mt7531_setup().

I thought about doing that as well, however, note that you will have to
move all the reset and regulator setup procedure to mt7530_probe() as
well then, as PLL setup currently happens after that, and that's
probably for a reason.

As the reset and regulator setup works differently on MT7530 and
MT7531, and depending on whether it's a standalone IC package or MCM, I
believe changes unifying this will have to be tested on a lot of
boards...

> 
> This will resolve the problem here, and make my future work regarding the
> PHY muxing feature on the MT7530 switch possible to do.
> 
> Regarding the second part:
> I'll take your changes to my current RFC patch series while addressing
> Jesse's suggestion if this is fine by you.

Yes, I'd appreciate that and I'm ready to test and review once you post
your updated series.

