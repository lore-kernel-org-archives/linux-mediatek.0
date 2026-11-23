Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D30606A327
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 21:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b/uItXlT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tFn3vYTn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GK26KF0rEouW6Pt03m3PN+6BNa6sEHxbDqdUEV8QxJ0=; b=b/uItXlTjZlnvenJ3qIodka0dY
	Zmdns8wFS+scpnHq3x8OByYCTMfrgYZevRas9nG51hxiWM8l74A51ROx/vUtbN9whgK1ZPWCmtGND
	TIZ5uLB5bJoSFVAo+I8HUS3f+zhOK8/IzOEyGNndZgrlXQOs9fwgpQ/JGuVgf+6+ANNdEvHmZzfkN
	k7NyHxt82NVgW3xav9X3IZfHbe89SiGJLzQBi4sxPZ8ZRF5OSkNk9qKQlRJfGYbIUCCFzbAMweCg6
	bZGfxURfMVSHt1Ve9VxnBYDJt8/zshlNxslIrIgo2/ueDhgmU4IgnznaHNFKGvRGT26Mxan4eED4l
	5ded1OqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbmz-000000050By-3prj;
	Mon, 23 Nov 2026 21:41:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbmv-000000050Ao-3jD1;
	Mon, 23 Nov 2026 21:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GK26KF0rEouW6Pt03m3PN+6BNa6sEHxbDqdUEV8QxJ0=; b=tFn3vYTn+c1LCQlwETyuMJkJcF
	MZQjnZodQD4WfIFd0yqVj8/N/qmuABjfFQwg3DDOtNbMMIiypgKTo+4aHQfC9q8mivFou3pLxj/qa
	SpaTbQxa7z2H31vqQPvXTob93C/FuKwJD1eESkqbGZQfIAMyKlYuhd1fqHJ4ULSo48jI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVbmV-000u8B-8U; Mon, 23 Nov 2026 22:40:59 +0100
Date: Mon, 23 Nov 2026 22:40:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: dsa: mt7530: disable the power rails on setup
 failure
Message-ID: <66d0cc53-b1e9-4c5d-adcd-ac752c21e3fe@lunn.ch>
References: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_134125_949276_5B4F6EFD 
X-CRM114-Status: GOOD (  22.88  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 07:09:13PM +0800, Haoran Wang wrote:
> mt7530_setup() enables the core and io regulators, but only
> mt7530_remove() disables them. A failed probe never reaches .remove(),
> so the rails stay enabled on every setup failure path, and the regulator
> core warns when devres later puts an enabled regulator. The common case
> is mt7530_setup_irq() returning -EPROBE_DEFER, where each re-probe
> enables the rails again.
> 
> Tie the regulator lifetime to the switch setup/teardown pair. Disable the
> rails in mt753x_teardown() and on the mt753x_setup() error paths after
> sw_setup() succeeds, and drop the now-redundant disables from
> mt7530_remove(). This also avoids an unbalanced disable when a switch in
> a multi-switch tree fails setup while already bound. Move
> mt7530_setup_gpio() after the FDB flush so the gpiochip is not left
> registered when the rails are dropped.
> 
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

Please break this patch up into lots of small patches, with good
commit messages, which are obviously correct.

taerdown is the opposite of setup. So do that code movement as one
patch.

Then add patches to fix the missing error handling.

> -	if (priv->id == ID_MT7530) {
> -		ret = regulator_disable(priv->core_pwr);
> -		if (ret < 0)
> -			dev_err(priv->dev,
> -				"Failed to disable core power: %d\n", ret);
> -
> -		ret = regulator_disable(priv->io_pwr);
> -		if (ret < 0)
> -			dev_err(priv->dev, "Failed to disable io pwr: %d\n",
> -				ret);
> -	}

This prints error messages when things go wrong.

> +static void
> +mt7530_disable_pwrs(struct mt7530_priv *priv)
> +{
> +	if (priv->id != ID_MT7530)
> +		return;
> +
> +	regulator_disable(priv->core_pwr);
> +	regulator_disable(priv->io_pwr);

This does not. Why? If you add this helper as a little patch, you can
explain in the commit message why you decided to throw away the error
messages.

> +	/* Flush the FDB table */
> +	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
> +	if (ret < 0)
> +		goto err_disable_pwrs;
> +
>  #ifdef CONFIG_GPIOLIB
>  	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
>  		ret = mt7530_setup_gpio(priv);
>  		if (ret)
> -			return ret;
> +			goto err_disable_pwrs;
>  	}
>  #endif /* CONFIG_GPIOLIB */
>  
> -	/* Flush the FDB table */
> -	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
> -	if (ret < 0)
> -		return ret;

This move should be one patch, and the commit message explaining why.

> +
> +err_disable_pwrs:
> +	mt7530_disable_pwrs(priv);
> +
> +	return ret;
> +
> +err_disable_core_pwr:
> +	if (priv->id == ID_MT7530)
> +		regulator_disable(priv->core_pwr);
> +
> +	return ret;

Having two error cleanup blocks of code with a return is very
unusual. Look at other cleanup blocks. How often do you see this?
Please make it have just one return statement.

> -	if (ret && priv->irq_domain)
> -		mt7530_free_mdio_irq(priv);
> +	if (ret) {
> +		if (priv->irq_domain)
> +			mt7530_free_mdio_irq(priv);
> +		goto err_disable_pwrs;
> +	}

Since you are adding error cleanup at the end of the function, move
this to the end as well.

    Andrew

---
pw-bot: cr

