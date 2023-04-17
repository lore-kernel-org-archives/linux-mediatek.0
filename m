Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38325C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 11:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dz9xfrLEwYGZhZvD4TwpBjibWfuTUq28xye0DSj9/HA=; b=T4qwrMNuZXG2fhheuJgk29jPRo
	aAI4dtw9gB7h5VfrBCCwlWjxsJHhGE6rkDZ5GOvTBa1JXekExpy6uHXpAvPPcyIwZSMQra2tFoHNJ
	Z8SUHFq8qXyxNB1E0zfQRG0eq8Edt9I34ZSHdT3oTLiQOPF8s5NogrmMwwl2brUxsFMsyujqtEG1O
	7CI4NFk5iKzLRQW3T5oJK83NPMDvb+Ge95naE5kmIZ9l4jprT8+WAfXJ4bRnfVY95uJhBz93wDk9U
	991hNVmrObSgHTR4qmLCgYgPoDHpD6gFiTtQIEBCC7N7Hu0mp/qeTUzL+JUq5Ben3Ul8fyngJOIFh
	zTimR+7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNCn-00G0OK-1u;
	Mon, 17 Apr 2023 11:39:33 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poNCj-00G0NO-2x;
	Mon, 17 Apr 2023 11:39:32 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1poNCU-00049u-2O;
	Mon, 17 Apr 2023 13:39:14 +0200
Date: Mon, 17 Apr 2023 12:39:09 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: fix support for MT7531BE
Message-ID: <ZD0v3Y2pdkwazICG@makrotopia.org>
References: <ZDvlLhhqheobUvOK@makrotopia.org>
 <8d36ff3b-e084-9f79-4c00-ec832f2cdbb3@arinc9.com>
 <ZDwDs6BHRo0ukfGF@makrotopia.org>
 <f125954e-d4ac-121f-18c4-bc7db25efa1c@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f125954e-d4ac-121f-18c4-bc7db25efa1c@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_043930_124248_F0194128 
X-CRM114-Status: GOOD (  64.60  )
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

On Mon, Apr 17, 2023 at 12:28:57AM +0300, Arınç ÜNAL wrote:
> On 16/04/2023 17:18, Daniel Golle wrote:
> > On Sun, Apr 16, 2023 at 04:48:23PM +0300, Arınç ÜNAL wrote:
> > > On 16.04.2023 15:08, Daniel Golle wrote:
> > > > [...]
> > > >   * It doesn't move PCS creation to mt7530.c, hence PCS_MTK_LYNXI is
> > > >     only required for MDIO-connected switches
> > > >     (with your patch we would have to move the dependency on PCS_MTK_LYNXI
> > > >     from NET_DSA_MT7530_MDIO to NET_DSA_MT7530)
> > > 
> > > Maybe this is what should happen. Maybe the PCS creation (and therefore
> > > mt7530_regmap_bus) should be on the core driver. Both are on the MDIO driver
> > > for the sole reason of only the devices on the MDIO driver currently using
> > > it. It's not an MDIO-specific operation as far as I can tell. Having it on
> > > the core driver would make more sense in the long run.
> > 
> > Which "long run" are you talking about?
> > regmap creation is bus-specific, and so is the existence of LynxI PCS.
> > There simply aren't any MMIO-connected switches which come with that IP.
> > And I strongly doubt there ever will be. And even if, why should we now
> > prepare for an entirely speculative future? If it actually happens, ie.
> > in case there is going to be a new SoC with MMIO-connected switch which
> > does comes with LynxI PCS (e.g. for port 5 only) we can still move the
> > code.
> 
> Makes sense.


> > > [...]
> > > 
> > > A similar logic is already there on the U-Boot MediaTek ethernet driver.
> > > 
> > > https://github.com/u-boot/u-boot/blob/a94ab561e2f49a80d8579930e840b810ab1a1330/drivers/net/mtk_eth.c#L903
> > > 
> > > So this patch fixes the issue with the only consideration being changing as
> > > less lines of code as possible.
> > 
> > You are ignore two more important arguments:
> >   * It doesn't requrire additional export of mt7530_regmap_bus
> >     (which would imply significantly more storage overhead compared to
> >     an additional function pointer in a priv struct)
> > 
> >   * It doesn't move PCS creation to mt7530.c, hence PCS_MTK_LYNXI is
> >     only required for MDIO-connected switches
> >     (with your patch we would have to move the dependency on PCS_MTK_LYNXI
> >     from NET_DSA_MT7530_MDIO to NET_DSA_MT7530)
> 
> Understood.

> > > And that's okay. We can make the least
> > > amount of changes to fix the issue first, then improve the driver. But
> > > there's nothing new made on the driver after the commit that caused this
> > > issue, backportability to the stable trees is a non-issue. So why not do it
> > > properly the first time?
> > 
> > Most of all I'd rather have it fixed before net-next is merged to Linus'
> > tree and also before net-next will close again.
> > 
> > However, I also simply don't see what would be more "proper" about your
> > solution.
> 
> Nothing. Your patch here is perfectly fine after reading your points. One
> thing I'd like to ask is, if I understand correctly, instead of exporting
> mt7531_create_sgmii(), defining a pointer that points to it causes less
> overhead?

Yes. Depending on build configuration and debugging options an exported
function or constant will require different amounts of storage, ie.
function name and parameter prototypes need to be stored in the kernel
symbol table, any module calling the exporting functions and in the
exporting modules ELF header, the latter being the most significant.
Even if kernel modules aren't used and it's all built-in the overhead
is still more than a few bytes for the struct member definition as well
as the growth of the per-instance allocated struct member itself --
especially given that I have only heard about one board using two
MT7531AE, most boards use exactly one of them.

> 
> The current patch looks very similar to exporting a function. Instead of
> putting EXPORT_SYMBOL_GPL and declaring the function prototype on the header
> file, you declare a function pointer on the priv structure, then assign it
> to the function.

The effect is similar, just limited in scope as a caller needs to have
access to the priv struct (opposed to an EXPORT_SYMBOL* which will
make the function or const available globally).

Also note that exporting mt7531_create_sgmii() would not work equally
well as the result would be a hard dependency of NET_DSA_MT7530 on
NET_DSA_MT7530_MDIO for the exported function being linkable.
The function pointer has the advantage that it can be set to NULL and
in that way we can model a weak dependency.

> 
> > 
> > > 
> > > Whatever the outcome with this patch is, on my upcoming patch series, I
> > > intend to move mt7531_create_sgmii to mt7530.c. Then introduce
> > > priv->p5_sgmii to get rid of mt7531_dual_sgmii_supported().
> > 
> > What is the argument for that?
> 
> Nothing for moving mt7531_create_sgmii() but I think introducing
> priv->p5_sgmii with later patches is in the clear?

Yes, I agree that introducing priv->p5_sgmii can make sense, given that
it would prevent having to export mt7531_dual_sgmii_supported() or
passing its return value as a function parameter, or even just having
to call it many times.

Regarding this current patch (see subject), do you still agree that we
should apply it as-is and then either you or me will prepare another
series further refactoring the driver?


> 
> > 
> > There is not a single MMIO-connected switch which comes with LynxI PCS.
> > (see above)
> > 
> > Imho we should rather try to work into the opposite direction and move
> > more code only used on either MDIO or MMIO from core to the
> > bus-specific drivers. If needed we can even split them more, eg. have
> > different modules for MT7530 and MT7531, so that even the driver for
> > MDIO-connected MT7530 would not require MTK_PCS_LYNXI.
> 
> Interesting, I may work on this in the future. This could benefit my folks
> too.
> 
> > 
> > In that sense I'm a big fan of the structure of the mt76 wireless
> > driver: Have a core module for shared helper functions and then
> > device-specific driver modules. Unfortunately many if not most drivers
> > are doing the exact opposite approach, ie. having some abstration layer
> > which will always need to be extended and changed with every
> > unforeseeable new hardware to be supported which just results in lots
> > of overhead and is a burden to maintain. You can see that in the rt2x00
> > wireless driver which I also worked on a lot: Most of the abstractions
> > aren't even useful with any of the latest hardware generations.
> > 
> > tl;dr: What's wrong with moving functions specific to either variant
> > (MMIO vs. MDIO) into the corresponding modules and keeping the core
> > slim and really only cover shared functionality? This is also why I
> > originally wanted the names of files and Kconfig symbols to reflect the
> > supported hardware rather than the supported bus-type -- I've changed
> > that upon your request and now believe I should have argued more
> > clearly why I made my choice like I did...
> 
> Ah that makes sense. I'd like to address this. I was already planning to to
> do some renaming on the driver. Please, allow me to do the work.

Sure, your efforts are appreciated, and I'll happily review and test
your suggestions.

> 
> I intend to do this slightly different than your initial patch series
> though. Like calling the core driver core, instead of common, and making it
> selectable, and only imply the MT7530 MDIO driver.
> 
> We could split the core and mdio/mmio drivers in a way that there's just the
> core, then the device-specific driver modules. This would mean splitting the
> MT7530 MDIO driver to MT7530 and MT7531 along with moving code from core to
> these two drivers. I believe this would apply for MT7988 too. There would be
> a bit of reused code but it should follow the idea of what you say above.
> Then we can configure the kconfig accordingly.
> 
> Arınç

