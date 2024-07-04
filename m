Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AF8C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 17:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akj1yGVTlXRj2mY3MwoGNS6aRJcCL4nmykWEYKR6h6Q=; b=q2e6RxM/ziQz8ByfBG3DyNOrqG
	mnWdOA4aVa5aDFechhDquFctzDDi4PnIYfgA1ma+rpGSFpiPTIy8HXby0wSsdkaCddGSBms8Aieqn
	/szY9lOazASQX8dn5pp3kCriESn/matbJ0Z7Z4O4sMPyKTMAbXcVCOPL9vQDZvjFHl4xg8lbyin12
	5j3OFn+z0Y2uHki9YeUowKk3zVV4W0d5yf3UxzQ5pMg9y8MemFsHr+3RLGH3JZUUNzhdauEcUrO21
	6QkpdGcIJCoHP7j48lTn6BzBMF8GcFgruZ3EgkgAMdrW4joIXtwOozLA4powvoIFCJeuykfiYAik9
	t8j+zs1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQ4J-0000000DxOf-0XNU;
	Thu, 04 Jul 2024 17:16:27 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQ44-0000000DxFC-0XU1;
	Thu, 04 Jul 2024 17:16:13 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ebe6495aedso8882261fa.0;
        Thu, 04 Jul 2024 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113369; x=1720718169; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=akj1yGVTlXRj2mY3MwoGNS6aRJcCL4nmykWEYKR6h6Q=;
        b=Badc+WGHW7p9Bma/B72v0tpG1XHkuOUYSwsg4a/lvaqWP6P2HeO9s9ip3pZSnzbr02
         ULM5UF0nJs5YnCjKB/7SrIfy7p26hvilZ/c2DA6p5bEeGLpCvu9DpdsO+d9sjh64qmIq
         IKB9msE4ClWznTjT2N0Vv66brQyc3XXr+H1Y8DA9Js77xDR/YQ3oyW6UJ8s9UgtEtJZt
         uVFmcDlJ5iUdpUX5ixcps1dJsg+jS4Y4u/0cdaMjN4nf7ytet4t5j6owUH5ttXPFDzGi
         U2YEHpJ2+MoEJ5GhznnGpwN6FrHSszfFEN5nkIwZHJHmXGMGGi2FH9kGhg49z0MpQ0m6
         j+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113369; x=1720718169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akj1yGVTlXRj2mY3MwoGNS6aRJcCL4nmykWEYKR6h6Q=;
        b=bua4OoUrS/OnO0ic3yBLtLJ5+W6l5Z2MUnwZ4Rw2Z37lGAysIlZCC0oukfjdEJKNwW
         z5VEL7s7PEjNByXs3aibQ3BmG5910BiJVCHKOfV6Leg2/QsY2r9t/52yqb96TReibEYZ
         +y5qFVjTqXg5f8PrmWQ9dXgnT/lqxrIlFcSv8UNMpy4nzWuBh/J/TkRFG957BBzMXwAy
         oaBSfV0FRinTtSJG0wI2iB/2WRO4rlzSdy02/FwtlayBLaAay1xYGuhBJzwHxoynZ+HH
         qOrV6DlCk0bmXtA969bWraoRwy42nIUAN2AjvUawcoGZWL4iRI+W3xiRTOzeWlA0/q2O
         Q/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXXWB8ZsADa5v6SNadDeW+RYCn6fvK2vRNSnCIAM0h4FFpT3q5RkjLZmxq8bz5FZSNIn/bBJDvEWYSW/ENbcdQpH2KPopxhBIunCs+q6REVhvKryX52fD8mbwR0MByyjP8qbEqbzdK61inHhGK0nW43OobJ8v99zLE=
X-Gm-Message-State: AOJu0YxXSp29envPHgpUaJ9LbwG/M4NEYvNeOixgmG1wTrDe64kLNNDU
	N4d3n5z5he2fBllSmxJQqXbN6Cy1wRpMSWxxqUGtTFXreGXhrGJu
X-Google-Smtp-Source: AGHT+IFTA8kd9mjM2p40e2ZtadZbcVKxwDbfrWZ/Shn/mauifxOtKFwqzRmFtdoxFS3r+DxEPLODog==
X-Received: by 2002:a2e:9515:0:b0:2eb:f472:e7d3 with SMTP id 38308e7fff4ca-2ee8ed22c62mr15348351fa.6.1720113368407;
        Thu, 04 Jul 2024 10:16:08 -0700 (PDT)
Received: from skbuf ([188.25.110.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42649dec1cbsm12327265e9.1.2024.07.04.10.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:16:07 -0700 (PDT)
Date: Thu, 4 Jul 2024 20:16:04 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
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
Message-ID: <20240704171604.3ownsxasch5hokty@skbuf>
References: <1c378be54d0fb76117f6d72dadd4a43a9950f0dc.1720105125.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c378be54d0fb76117f6d72dadd4a43a9950f0dc.1720105125.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_101612_198663_F825B5B3 
X-CRM114-Status: GOOD (  41.87  )
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

On Thu, Jul 04, 2024 at 04:08:22PM +0100, Daniel Golle wrote:
> The MDIO address of the MT7530 and MT7531 switch ICs can be configured
> using bootstrap pins. However, there are only 4 possible options for the
> switch itself: 7, 15, 23 and 31. As in MediaTek's SDK the address of the
> switch is wrongly stated in the device tree as 0 (while in reality it is
> 31), warn the user about such broken device tree and make a good guess
> what was actually intended.

Zero is the MDIO broadcast address. Doesn't the switch respond to it, or
what's exactly the problem?

> 
> This is imporant also to not break compatibility with older Device Trees

important

> as with commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of
> switch from device tree") the address in device tree will be taken into
> account, while before it was hard-coded to 0x1f.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")

I fail to understand the logic behind blaming this commit. There was no
observable issue prior to 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY
address of switch from device tree"), was there? That's what 'git bisect'
with a broken device tree would point towards?

> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> Changes since v3 [3]:
>  - simplify calculation of correct address
> 
> Changes since v2 [2]:
>  - use macros instead of magic numbers
>  - introduce helper functions
>  - register new device on MDIO bus instead of messing with the address
>    and schedule delayed_work to unregister the "wrong" device.
>    This is a slightly different approach than suggested by Russell, but
>    imho makes things much easier than keeping the "wrong" device and
>    having to deal with keeping the removal of both devices linked.
>  - improve comments
> 
> Changes since v1 [1]:
>  - use FW_WARN as suggested.
>  - fix build on net tree which doesn't have 'mdiodev' as member of the
>    priv struct. Imho including this patch as fix makes sense to warn
>    users about broken firmware, even if the change introducing the
>    actual breakage is only present in net-next for now.
> 
> [1]: https://patchwork.kernel.org/project/netdevbpf/patch/e615351aefba25e990215845e4812e6cb8153b28.1714433716.git.daniel@makrotopia.org/
> [2]: https://patchwork.kernel.org/project/netdevbpf/patch/11f5f127d0350e72569c36f9060b6e642dfaddbb.1714514208.git.daniel@makrotopia.org/
> [3]: https://patchwork.kernel.org/project/netdevbpf/patch/7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org/
> 
>  drivers/net/dsa/mt7530-mdio.c | 91 +++++++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
> index 51df42ccdbe6..2037ed944801 100644
> --- a/drivers/net/dsa/mt7530-mdio.c
> +++ b/drivers/net/dsa/mt7530-mdio.c
> @@ -11,6 +11,7 @@
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/workqueue.h>
>  #include <net/dsa.h>
>  
>  #include "mt7530.h"
> @@ -136,6 +137,92 @@ static const struct of_device_id mt7530_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, mt7530_of_match);
>  
> +static int
> +mt7530_correct_addr(int phy_addr)

The prototype fits onto a single line.

> +{
> +	/* The corrected address is calculated as stated below:
> +	 * 0~6, 31 -> 31
> +	 * 7~14    -> 7
> +	 * 15~22   -> 15
> +	 * 23~30   -> 23
> +	 */
> +return (phy_addr - MT7530_NUM_PORTS & ~MT7530_NUM_PORTS) + MT7530_NUM_PORTS & PHY_MAX_ADDR - 1;

In addition to being weirdly indented and having difficult to follow
logic.. Why not opt for the simple, self-documenting variant below?

	switch (phy_addr) {
	case 0 ... 6:
	case 31:
		return 31;
	case 7 ... 14:
		return 7;
	case 15 ... 22:
		return 15;
	case 23 ... 30:
		return 23;
	default:
		return -EINVAL ???
	}

> +}
> +
> +static bool
> +mt7530_is_invalid_addr(int phy_addr)
> +{
> +	/* Only MDIO bus addresses 7, 15, 23, and 31 are valid options,
> +	 * which all have the least significant three bits set. Check
> +	 * for this.
> +	 */
> +	return (phy_addr & MT7530_NUM_PORTS) != MT7530_NUM_PORTS;

Why not implement this in terms of phy_addr != mt7530_correct_addr(phy_addr)?

> +}
> +
> +struct remove_impossible_priv {
> +	struct delayed_work remove_impossible_work;
> +	struct mdio_device *mdiodev;
> +};
> +
> +static void
> +mt7530_remove_impossible(struct work_struct *work)

Fits onto a single line.

> +{
> +	struct remove_impossible_priv *priv = container_of(work, struct remove_impossible_priv,
> +							   remove_impossible_work.work);
> +	struct mdio_device *mdiodev = priv->mdiodev;
> +
> +	mdio_device_remove(mdiodev);
> +	mdio_device_free(mdiodev);
> +	kfree(priv);
> +}
> +
> +static int
> +mt7530_reregister(struct mdio_device *mdiodev)
> +{
> +	/* If the address in DT must be wrong, make a good guess about
> +	 * the most likely intention, issue a warning, register a new
> +	 * MDIO device at the correct address and schedule the removal
> +	 * of the device having an impossible address.
> +	 */
> +	struct fwnode_handle *fwnode = dev_fwnode(&mdiodev->dev);
> +	int corrected_addr = mt7530_correct_addr(mdiodev->addr);
> +	struct remove_impossible_priv *rem_priv;
> +	struct mdio_device *new_mdiodev;
> +	int ret;
> +
> +	rem_priv = kmalloc(sizeof(*rem_priv), GFP_KERNEL);
> +	if (!rem_priv)
> +		return -ENOMEM;
> +
> +	new_mdiodev = mdio_device_create(mdiodev->bus, corrected_addr);
> +	if (IS_ERR(new_mdiodev)) {
> +		ret = PTR_ERR(new_mdiodev);
> +		goto out_free_work;
> +	}
> +	device_set_node(&new_mdiodev->dev, fwnode);
> +
> +	ret = mdio_device_register(new_mdiodev);
> +	if (WARN_ON(ret))
> +		goto out_free_dev;
> +
> +	dev_warn(&mdiodev->dev, FW_WARN
> +		 "impossible switch MDIO address in device tree, assuming %d\n",
> +		 corrected_addr);
> +
> +	/* schedule impossible device for removal from mdio bus */
> +	rem_priv->mdiodev = mdiodev;
> +	INIT_DELAYED_WORK(&rem_priv->remove_impossible_work, mt7530_remove_impossible);
> +	schedule_delayed_work(&rem_priv->remove_impossible_work, 0);

What makes it so that mt7530_remove_impossible() is actually guaranteed
to run after the probing of the mdio_device @ the incorrect address
_finishes_? mdio_device_remove() will not work on a device which has
probing in progress, will it?

There's also the more straightforward option of fixing up priv->mdiodev->addr
in mt7530.c to be something like priv->switch_base, which is derived
from priv->mdiodev->addr, with a fallback to 0x1f if the latter is zero,
and a FW_WARN().

