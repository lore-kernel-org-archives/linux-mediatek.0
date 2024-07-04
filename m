Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB420C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 17:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ou1M28u1XlzE76PDWG8emIb/GMKwICtJleOWsLxvQE=; b=T4n5Q+ug1hGVqV5cficOWr6sE/
	yWVWWHu8wWqE3i33FrHI3Jdpk7S+ECvZgUdCdkMMdyeoIkZLOmAAv8O+A5HnLr0clmnENFzAvSfkM
	PG56lQt0cBwANGIJK4AurzR8V0fQzLVEYdy/KqlGHHoTMHF4bPPPQ1V/TFXbV2w1zxHjo9cg57JbG
	dSmuP06+mC+jJuMHPBL+Zf4EF5eGezVKMH3+Sb+A2YByl0eh/kqU5+z/flKGzzL2VyHK5Td3KeusE
	5kv2tQFm4hwlDIXtKsn+WAMsAhrDO7vgpCPV29D8MyKZeKGQq8LfX3L2A/lCQgSsX4PeEOHqrqYur
	iqzKlOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQZs-0000000E4UI-1is1;
	Thu, 04 Jul 2024 17:49:04 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQZd-0000000E4T2-3ZAw;
	Thu, 04 Jul 2024 17:48:52 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sPQZS-000000001WV-0D7e;
	Thu, 04 Jul 2024 17:48:38 +0000
Date: Thu, 4 Jul 2024 18:48:33 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v4] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
Message-ID: <ZobgcXm9-am7xX6f@makrotopia.org>
References: <1c378be54d0fb76117f6d72dadd4a43a9950f0dc.1720105125.git.daniel@makrotopia.org>
 <20240704171604.3ownsxasch5hokty@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704171604.3ownsxasch5hokty@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_104850_065548_86FFD805 
X-CRM114-Status: GOOD (  52.05  )
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

Hi Vladimir,

On Thu, Jul 04, 2024 at 08:16:04PM +0300, Vladimir Oltean wrote:
> On Thu, Jul 04, 2024 at 04:08:22PM +0100, Daniel Golle wrote:
> > The MDIO address of the MT7530 and MT7531 switch ICs can be configured
> > using bootstrap pins. However, there are only 4 possible options for the
> > switch itself: 7, 15, 23 and 31. As in MediaTek's SDK the address of the
> > switch is wrongly stated in the device tree as 0 (while in reality it is
> > 31), warn the user about such broken device tree and make a good guess
> > what was actually intended.
> 
> Zero is the MDIO broadcast address. Doesn't the switch respond to it, or
> what's exactly the problem?

No, MT7530 main device (ie. the switch itself, not the built-in PHYs
which on MT7530 can also be exposed on the same bus) only responds to
address 31 (default), 7, 15 or 23 (the latter 3 via non-default
bootstrap configuration).

MT7531 always uses address 31 by default and also doesn't respond on
address 0.

See also https://lkml.org/lkml/2024/5/31/236

> 
> > 
> > This is imporant also to not break compatibility with older Device Trees
> 
> important

Well spotted, will fix.

> 
> > as with commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of
> > switch from device tree") the address in device tree will be taken into
> > account, while before it was hard-coded to 0x1f.
> > 
> > Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> 
> I fail to understand the logic behind blaming this commit. There was no
> observable issue prior to 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY
> address of switch from device tree"), was there?

Please see the lengthy debate here:

https://lore.kernel.org/linux-arm-kernel/af561268-9793-4b5d-aa0f-d09698fd6fb0@arinc9.com/T/#mc967f795a062f6aaedea7375a3be104266e88cc4

I should have provided a reference to that in the commit message or
cover letter.

> That's what 'git bisect' with a broken device tree would point towards?

Yes, exactly.

> 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> > Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > ---
> > Changes since v3 [3]:
> >  - simplify calculation of correct address
> > 
> > Changes since v2 [2]:
> >  - use macros instead of magic numbers
> >  - introduce helper functions
> >  - register new device on MDIO bus instead of messing with the address
> >    and schedule delayed_work to unregister the "wrong" device.
> >    This is a slightly different approach than suggested by Russell, but
> >    imho makes things much easier than keeping the "wrong" device and
> >    having to deal with keeping the removal of both devices linked.
> >  - improve comments
> > 
> > Changes since v1 [1]:
> >  - use FW_WARN as suggested.
> >  - fix build on net tree which doesn't have 'mdiodev' as member of the
> >    priv struct. Imho including this patch as fix makes sense to warn
> >    users about broken firmware, even if the change introducing the
> >    actual breakage is only present in net-next for now.
> > 
> > [1]: https://patchwork.kernel.org/project/netdevbpf/patch/e615351aefba25e990215845e4812e6cb8153b28.1714433716.git.daniel@makrotopia.org/
> > [2]: https://patchwork.kernel.org/project/netdevbpf/patch/11f5f127d0350e72569c36f9060b6e642dfaddbb.1714514208.git.daniel@makrotopia.org/
> > [3]: https://patchwork.kernel.org/project/netdevbpf/patch/7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org/
> > 
> >  drivers/net/dsa/mt7530-mdio.c | 91 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 91 insertions(+)
> > 
> > diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
> > index 51df42ccdbe6..2037ed944801 100644
> > --- a/drivers/net/dsa/mt7530-mdio.c
> > +++ b/drivers/net/dsa/mt7530-mdio.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/regmap.h>
> >  #include <linux/reset.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/workqueue.h>
> >  #include <net/dsa.h>
> >  
> >  #include "mt7530.h"
> > @@ -136,6 +137,92 @@ static const struct of_device_id mt7530_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, mt7530_of_match);
> >  
> > +static int
> > +mt7530_correct_addr(int phy_addr)
> 
> The prototype fits onto a single line.
> 
> > +{
> > +	/* The corrected address is calculated as stated below:
> > +	 * 0~6, 31 -> 31
> > +	 * 7~14    -> 7
> > +	 * 15~22   -> 15
> > +	 * 23~30   -> 23
> > +	 */
> > +return (phy_addr - MT7530_NUM_PORTS & ~MT7530_NUM_PORTS) + MT7530_NUM_PORTS & PHY_MAX_ADDR - 1;
> 
> In addition to being weirdly indented and having difficult to follow
> logic.. Why not opt for the simple, self-documenting variant below?
> 
> 	switch (phy_addr) {
> 	case 0 ... 6:
> 	case 31:
> 		return 31;
> 	case 7 ... 14:
> 		return 7;
> 	case 15 ... 22:
> 		return 15;
> 	case 23 ... 30:
> 		return 23;
> 	default:
> 		return -EINVAL ???
> 	}
> 
> > +}
> > +
> > +static bool
> > +mt7530_is_invalid_addr(int phy_addr)
> > +{
> > +	/* Only MDIO bus addresses 7, 15, 23, and 31 are valid options,
> > +	 * which all have the least significant three bits set. Check
> > +	 * for this.
> > +	 */
> > +	return (phy_addr & MT7530_NUM_PORTS) != MT7530_NUM_PORTS;
> 
> Why not implement this in terms of phy_addr != mt7530_correct_addr(phy_addr)?
> 
> > +}
> > +
> > +struct remove_impossible_priv {
> > +	struct delayed_work remove_impossible_work;
> > +	struct mdio_device *mdiodev;
> > +};
> > +
> > +static void
> > +mt7530_remove_impossible(struct work_struct *work)
> 
> Fits onto a single line.
> 
> > +{
> > +	struct remove_impossible_priv *priv = container_of(work, struct remove_impossible_priv,
> > +							   remove_impossible_work.work);
> > +	struct mdio_device *mdiodev = priv->mdiodev;
> > +
> > +	mdio_device_remove(mdiodev);
> > +	mdio_device_free(mdiodev);
> > +	kfree(priv);
> > +}
> > +
> > +static int
> > +mt7530_reregister(struct mdio_device *mdiodev)
> > +{
> > +	/* If the address in DT must be wrong, make a good guess about
> > +	 * the most likely intention, issue a warning, register a new
> > +	 * MDIO device at the correct address and schedule the removal
> > +	 * of the device having an impossible address.
> > +	 */
> > +	struct fwnode_handle *fwnode = dev_fwnode(&mdiodev->dev);
> > +	int corrected_addr = mt7530_correct_addr(mdiodev->addr);
> > +	struct remove_impossible_priv *rem_priv;
> > +	struct mdio_device *new_mdiodev;
> > +	int ret;
> > +
> > +	rem_priv = kmalloc(sizeof(*rem_priv), GFP_KERNEL);
> > +	if (!rem_priv)
> > +		return -ENOMEM;
> > +
> > +	new_mdiodev = mdio_device_create(mdiodev->bus, corrected_addr);
> > +	if (IS_ERR(new_mdiodev)) {
> > +		ret = PTR_ERR(new_mdiodev);
> > +		goto out_free_work;
> > +	}
> > +	device_set_node(&new_mdiodev->dev, fwnode);
> > +
> > +	ret = mdio_device_register(new_mdiodev);
> > +	if (WARN_ON(ret))
> > +		goto out_free_dev;
> > +
> > +	dev_warn(&mdiodev->dev, FW_WARN
> > +		 "impossible switch MDIO address in device tree, assuming %d\n",
> > +		 corrected_addr);
> > +
> > +	/* schedule impossible device for removal from mdio bus */
> > +	rem_priv->mdiodev = mdiodev;
> > +	INIT_DELAYED_WORK(&rem_priv->remove_impossible_work, mt7530_remove_impossible);
> > +	schedule_delayed_work(&rem_priv->remove_impossible_work, 0);
> 
> What makes it so that mt7530_remove_impossible() is actually guaranteed
> to run after the probing of the mdio_device @ the incorrect address
> _finishes_? mdio_device_remove() will not work on a device which has
> probing in progress, will it?
> 
> There's also the more straightforward option of fixing up priv->mdiodev->addr
> in mt7530.c to be something like priv->switch_base, which is derived
> from priv->mdiodev->addr, with a fallback to 0x1f if the latter is zero,
> and a FW_WARN().

