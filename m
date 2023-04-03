Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EC5C76188
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 17:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YacHW17qVuUdmBBlaQ5Wf4tYYqXMk2Pl9F+S4OusJVA=; b=PIvp4h8g32Z5SHu65kuMEJfand
	Si7p/FlQ6jciD1+pAfFKxqDGmr3VoLE6aDABQco1wFYNaVur9aTGYoEegxDItYyTxKKVVLh8wgTN+
	4Ixto2a8MbwnU5QFtvXug57hK30mz8aenHd7vp25bzjJXog1SGxWqHGzfUh/vKeAwykaPzR9vLKzB
	2KrvteHoFrWDucD+1QXQSqogHOV9Pxzyse3kHNpHiFNLKBHhXyEujabDIApcMxWH1HmaQOPhwJzC4
	+2C5qcB0pY/4ZgWmI5D0RfogQpMJHXUa3vl2mC1grYYiU6WNRm0ouNqACop2mxPK8zOV6UNCLjzvg
	Sn5LpIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjODD-00G6Es-1q;
	Mon, 03 Apr 2023 17:43:23 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjODB-00G6Do-0y;
	Mon, 03 Apr 2023 17:43:22 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pjOCs-0001Lc-1w;
	Mon, 03 Apr 2023 19:43:02 +0200
Date: Mon, 3 Apr 2023 18:42:59 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
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
	Russell King <linux@armlinux.org.uk>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next v2 00/14] net: dsa: add support for MT7988
Message-ID: <ZCsQIylAgh-rxjfu@makrotopia.org>
References: <cover.1680483895.git.daniel@makrotopia.org>
 <53d89480-936d-25b1-6422-cda7769de369@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53d89480-936d-25b1-6422-cda7769de369@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_104321_338719_6C52F338 
X-CRM114-Status: GOOD (  29.73  )
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

Hi Arınç,

On Mon, Apr 03, 2023 at 08:08:19PM +0300, Arınç ÜNAL wrote:
> On 3.04.2023 04:16, Daniel Golle wrote:
> > The MediaTek MT7988 SoC comes with a built-in switch very similar to
> > previous MT7530 and MT7531. However, the switch address space is mapped
> > into the SoCs memory space rather than being connected via MDIO.
> > Using MMIO simplifies register access and also removes the need for a bus
> > lock, and for that reason also makes interrupt handling more light-weight.
> > 
> > Note that this is different from previous SoCs like MT7621 and MT7623N
> > which also came with an integrated MT7530-like switch which yet had to be
> > accessed via MDIO.
> > 
> > Split-off the part of the driver registering an MDIO driver, then add
> > another module acting as MMIO/platform driver.
> > 
> > The whole series has been tested on various MediaTek boards:
> >   * MT7623A + MT7530 (BPi-R2)
> >   * MT7986A + MT7531 (BPi-R3)
> >   * MT7988A reference board
> 
> You did not address the incorrect information I pointed out here. Now that

I'm sorry, that was certainly not intentional and I may have missed
your comments. Actually it doesn't look like they have made it to the
netdev list archive or patchwork either.

> the patch series is applied, people reading this on the merge branch commit
> will be misled by the misinformation.

I've changed Kconfig stuff according to your recommendation and also
addressed possible misleading USXGMII and 10GBase-KR support by
introducing MT7988-specific functions and using 'internal' PHY mode.
So which of your comments have not been addressed?

> 
> > 
> > Changes since v1:
> >   * use 'internal' PHY mode where appropriate
> >   * use regmap_update_bits in mt7530_rmw
> >   * improve dt-bindings
> 
> As a maintainer of the said dt-bindings, I pointed out almost 7 things for
> you to change. Of those 7 points, you only did one, a trivial grammar
> change. The patch series is applied now so one of us maintainers (you are
> one too now) need to fix it with additional patches.

I was also surprised the series made it to net-next so quickly, but it
wasn't me applying it, I merly posted v2 with all comments I received
addressed.

Me and supposedly also netdevbpf maintainers use patchwork to track
patches and whether comments have been addressed. Can you point me to
emails with the comments which haven't been addressed there? Looking in
patchwork for the dt-bindings patch [1] I don't see any comments there.


Thank you for reviewing!


Daniel


[1]: See patchwork tracking for RFCv3, v1 and v2. Prior to RFCv3 the series
didn't have the dt-bindings addition, I introduced it with RFCv3 when splitting
the series into many small changes:
https://patchwork.kernel.org/project/netdevbpf/patch/9b504e3e88807bfb62022c0877451933d30abeb5.1680105013.git.daniel@makrotopia.org/
https://patchwork.kernel.org/project/netdevbpf/patch/fef2cb2fe3d2b70fa46e93107a0c862f53bb3bfa.1680180959.git.daniel@makrotopia.org/
https://patchwork.kernel.org/project/netdevbpf/patch/dffacdb59aea462c9f7d4242cf9563a04cf79807.1680483896.git.daniel@makrotopia.org/

