Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA518C678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 11:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRlbWIe1dpHcNCVev+gyATBt1suaJM1LpuD0lQyVqU4=; b=ikk5VRw2lkSoTiSOL6PAP5pmMc
	S5XCGNRLpmx1DuSLLIq/aHCPh+QUb9LAGkx2pRhtEikWCjqhDrpjkZG/bOWKbAVX2/hv6htyo55lx
	Pv8OeP/a0hgahJNIvzJOOgMKy5YauWg2LfpEMGvgmjt29chFTswmevFcxG/BDLyQliWCK6e4oeEuV
	VXqOOZpbn9EGDio+Y+9NBpt9NplqM8MKjFqNrNdlseC68brfpUgHQHeyHVFpkQYZ6YIybha8hT9Rn
	tI5sOVnUp8gp/i2DoH3KaHZY4ghLTrCIUBoy8RwdGIS5nWWAkPbgJRCsOBe+lbggNphEvok2vXoAQ
	SlVUnlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXhYj-00236l-FA; Thu, 02 Mar 2023 11:57:17 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXhYf-00232V-TB; Thu, 02 Mar 2023 11:57:16 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pXhYR-0004Hm-2H;
	Thu, 02 Mar 2023 12:56:59 +0100
Date: Thu, 2 Mar 2023 11:56:56 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [RFC PATCH v11 08/12] net: ethernet: mtk_eth_soc: fix RX data
 corruption issue
Message-ID: <ZACPCHxbuD7deGTa@makrotopia.org>
References: <cover.1677699407.git.daniel@makrotopia.org>
 <9a788bb6984c836e63a7ecbdadff11a723769c37.1677699407.git.daniel@makrotopia.org>
 <20230301233121.trnzgverxndxgunu@skbuf>
 <Y//n4R2QuWvySDbg@makrotopia.org>
 <20230302100022.vcw5kqpiy6jpmq3r@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302100022.vcw5kqpiy6jpmq3r@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_035713_990552_977DD7E5 
X-CRM114-Status: GOOD (  29.28  )
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

On Thu, Mar 02, 2023 at 12:00:22PM +0200, Vladimir Oltean wrote:
> On Thu, Mar 02, 2023 at 12:03:45AM +0000, Daniel Golle wrote:
> > On Thu, Mar 02, 2023 at 01:31:21AM +0200, Vladimir Oltean wrote:
> > > On Wed, Mar 01, 2023 at 07:55:05PM +0000, Daniel Golle wrote:
> > > > Also set bit 12 which disabled the RX FIDO clear function when setting up
> > > > MAC MCR, as MediaTek SDK did the same change stating:
> > > > "If without this patch, kernel might receive invalid packets that are
> > > > corrupted by GMAC."[1]
> > > > This fixes issues with <= 1G speed where we could previously observe
> > > > about 30% packet loss while the bad packet counter was increasing.
> > > > 
> > > > [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/d8a2975939a12686c4a95c40db21efdc3f821f63
> > > > Tested-by: Bjørn Mork <bjorn@mork.no>
> > > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > > > ---
> > > 
> > > Should this patch be submitted separately from the series, to the
> > > net.git tree, to be backported to stable kernels?
> > 
> > Maybe yes, as this issue may affect e.g. the BPi-R3 board when used
> > with 1G SFP modules. Previously this has just never been a problem as
> > all practically all boards with MediaTek SoCs using SGMII also use the
> > MediaTek MT7531 switch connecting in 2500Base-X mode.
> > 
> > Should the Fixes:-tag hence reference the commit adding support for the
> > BPi-R3?
> 
> If it's not an issue that affects existing setups, there is no need to
> backport the patch. But it needs to be clearly described as such in the
> commit message.
> 
> You mention <= 1G speeds, but then only talk about 1G SFP modules.
> I see that the mtk_eth_soc driver also sets "gmii" and "rgmii" in
> phylink's supported_interfaces. Those are also <= 1G speeds. There could
> also be SGMII on-board PHYs. Does the RX FIFO clearing issue not affect
> those?

The issues affects PHYs (and potentially switch PHY ICs) connected via
SGMII operating at 1.25Mbaud.

The only officially supported board affected by this is the BPi-R3 where
it affects the SFP cages -- the on-board MT7531 switch which is also
used on all other boards using these SoCs is connected with 2500Base-X.

The issue does **not** affect RGMII or GMII on the MT7623 SoC, but I
don't have any way to try RGMII or GMII on more recent SoCs as I lack
hardware making use of that to connect a PHY.

