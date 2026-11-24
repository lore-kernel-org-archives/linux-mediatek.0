Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFA3606A321
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J04lt2tC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jkO62I/N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uh6VIcmUihTJZpbQIAs5Uul2q/clKDFIcJydo+fPY/c=; b=J04lt2tC1elsL9Pw5kCV0RWkHf
	grUhUg3An7ogU63fauOIxmuVD7gXgcGm5Rk/N74asWO9tc15vRfsaEPLlzLfXOj8RhgUrxMn9jgpD
	6gdKXBhlXB2l9s8N43yoHHAY47bMQgYbFHxtZKNCKHtLFw8vPPMAxfK6y1MrpUcVet187FFZRoPff
	C2rW8/5eQywrC6SrqhUn3tHXn0Bn5e/xFY7ZPzxbfTy0gQ9OQVlgoIPSXChC+cuYOj9p/SWsMjkT4
	aY7ppHIxgudqBSN4+UhrSW2fJnTCXgOZBcwsiQEW3DpWtudaYLxNlTlcT2oJTtJv1DoQBCYMJA6IW
	Kk6vtPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpI2-00000006Tet-0yj4;
	Tue, 24 Nov 2026 12:06:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpHa-00000006TUT-2zIA;
	Tue, 24 Nov 2026 12:06:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 786E24042D;
	Tue, 24 Nov 2026 12:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3816E1F000EF;
	Tue, 24 Nov 2026 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521958;
	bh=uh6VIcmUihTJZpbQIAs5Uul2q/clKDFIcJydo+fPY/c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jkO62I/NkOgxLczWDu+s+u6Vg9w+FOcmx9E0LT9FVUmdYwqbuW/6XfqM+4cTjlWwl
	 /DMR3U9M0WVJK3k/DpZDuAx2HptQYdiZ0ZZDmguKe/3xuiUTRJh6eVaf5Yl2sFVgWl
	 LNHeEJBu5kuf6e9G4GVSbWI3s4PYuA1Qb7uel+lYx+J1Lk1c/7JWeOgSl0GO048IMr
	 NUb0Qn4jJ143ter8OZhYaZflZEnDxnS1JXD4xU5mJhGcV9zApiWZ77+s60/9Pw32b/
	 +6KYSeua4GbIi5RqKV8iblvGZJAyFacFUsQJLLDUIB+qiB7xZK+Xk6j9UTksJL7VFq
	 FW4U0YiQ1OUqw==
Subject: Re: [PATCH v2] net: dsa: mt7530: disable the power rails on setup failure
From: netdev-bot+sashiko@kernel.org
To: wanghr2026@mail.zgclab.edu.cn
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 12:05:56 +0000
Message-ID: <179552195677.3135.2679930645626053258@kernel.org>
In-Reply-To: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
References: <179543215348.11880.18316180385674365789@mail.zgclab.edu.cn>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The commit message says moving mt7530_setup_gpio() after the FDB
  flush means "the gpiochip is not left registered when the rails are…
- [Low] The patch fixes a runtime bug: regulators stay enabled on
  mt7530_setup()/mt753x_setup() failure, enable_count grows on each…
- [Low] The new power-down helper mt7530_disable_pwrs() drops core_pwr
  and io_pwr without first asserting the chip reset.

--

net: dsa: mt7530: disable the power rails on setup failure

This patch moves the MT7530 core/io regulator disable out of
mt7530_remove(). The rails are now disabled in mt753x_teardown() and on
the mt7530_setup()/mt753x_setup() error paths. It also moves
mt7530_setup_gpio() after the FDB flush in mt7530_setup().

> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

[Severity: Low]

This fixes a regulator core WARN and an unbalanced regulator_disable() in
mt7530_remove(), but there is no Fixes: tag.

git blame shows that the regulator_enable() calls in mt7530_setup(), with
their bare return ret error paths, come from:

ddda1ac116c8 ("net: dsa: mt7530: support the 7530 switch on the Mediatek MT7621 SoC")

That commit restructured code first added in:

b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")

Should one of these be added as a Fixes: tag? The recent fix to the same
regulator handling, c2cdef41e0b4 ("net: dsa: mt7530: fix NULL dereference
on unbind of MT7531 and MT7621"), carries one.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d5a199293f78a..5bbeed0491c45 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2376,6 +2376,16 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	return ret;
>  }
>  
> +static void
> +mt7530_disable_pwrs(struct mt7530_priv *priv)
> +{
> +	if (priv->id != ID_MT7530)
> +		return;
> +
> +	regulator_disable(priv->core_pwr);
> +	regulator_disable(priv->io_pwr);
> +}

[Severity: Low]

Should reset be asserted here before the rails are dropped?

mt7530_probe() requests the reset GPIO with GPIOD_OUT_LOW, so reset is
asserted while the chip is unpowered. mt7530_setup() then pulses reset and
leaves it deasserted:

	gpiod_set_value_cansleep(priv->reset, 0);
	usleep_range(5000, 5100);
	gpiod_set_value_cansleep(priv->reset, 1);

Every new caller of mt7530_disable_pwrs() cuts io_pwr and core_pwr with
reset still deasserted. That covers the err_disable_pwrs labels in
mt7530_setup() after the reset pulse, the mt753x_setup() error paths, and
mt753x_teardown().

The SoC then keeps driving the inactive level into the RESET pad of a chip
whose IO rail is off, and this repeats on every -EPROBE_DEFER re-probe.
The MCM path also never calls reset_control_assert() before power-off.

The v2 notes say this was left out because it matches the old
mt7530_remove() ordering. However, this patch adds several new power-down
points. Would asserting reset first, then disabling io_pwr and core_pwr,
better mirror the power-up sequence?

[ ... ]

> @@ -3205,11 +3228,11 @@ mt753x_setup(struct dsa_switch *ds)
>  
>  	ret = mt7530_setup_irq(priv);
>  	if (ret)
> -		return ret;
> +		goto err_disable_pwrs;
>  
>  	ret = mt7530_setup_mdio(priv);
>  	if (ret)
> -		return ret;
> +		goto err_disable_pwrs;

[Severity: High]

The commit message says:

  Move mt7530_setup_gpio() after the FDB flush so the gpiochip is not left
  registered when the rails are dropped.

and the v2 notes say "no failure path leaves the gpiochip registered after
the rails are disabled". Does that hold on these paths?

mt7530_setup_gpio() is now the last step of mt7530_setup(), so the reorder
only covers the FDB flush failure. When mt7530_setup_irq() fails here, for
example with -EPROBE_DEFER from of_irq_get(), the gpiochip is already
registered through devm:

mt7530_setup_gpio() {
    ...
    return devm_gpiochip_add_data(dev, gc, priv);
}

err_disable_pwrs then calls mt7530_disable_pwrs() while the gpiochip is
still registered. The commit message calls -EPROBE_DEFER the common case.

On the mt7530_setup_mdio() failure path, mt7530_setup_irq() has also
already registered the regmap IRQ chip and its threaded handler:

	ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
					      priv->regmap, irq,
					      IRQF_ONESHOT,
					      0, &mt7530_regmap_irq_chip,
					      &irq_data);

The new mt7530_disable_pwrs() call in mt753x_teardown() has the same
problem. DSA calls teardown from the teardown label in dsa_switch_setup()
when tag protocol or user MDIO bus setup fails. It also runs on any tree
teardown, through:

dsa_tree_teardown()->dsa_tree_teardown_switches()->dsa_switch_teardown()

In all of these cases three resources stay registered while the rails are
cut: the gpiochip, the regmap IRQ chip, and the internal MDIO bus from
devm_of_mdiobus_register(). Their lifetime is tied to device bind, not to
DSA setup/teardown.

In a multi-switch tree, unbinding another switch tears this switch down
while it stays bound. The registered-but-unpowered state then lasts for as
long as this switch stays bound. Before this patch the rails stayed on in
these cases.

Can a gpiochip consumer (mt7530_gpio_get(), mt7530_gpio_set() and the
direction callbacks), the regmap-irq threaded handler, or a PHY on the MDIO
bus then issue regmap/MDIO accesses to an unpowered chip?

Would this need explicit unregistration in teardown and on these error
paths, using non-devm registration or the devm_*_release helpers, instead
of the reorder? If not, could the commit message and the v2 notes be
corrected?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179543215348.11880.18316180385674365789%40mail.zgclab.edu.cn

