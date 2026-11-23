Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02962606A31F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 08:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CtLY8baC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hG9R1cT4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2ZXYzpMsSpVMbq5bALXeiDcyDHaH4rSnY+t2qNogl3c=; b=CtLY8baCLm+Vdtdjuf63xPBeQH
	hSIgrD1jvYXNs48MMB7U/xW7LBOD8GbIZoDlSiIhgZZXmK70Hy6BubUtxIhfDsnHUdVeNC7F0/W3l
	Hhp24nwQnT3mVP5+zLH7a/nidO/CK0RvP+8Db+/876/RApF5LNxxTQ4RbVhN3H0ubOoV1eCqLT/9i
	fOXG2ImumH6wKyPchL235iUaOoX1nF2SDiEKrU/euSIFgAPy+v2SGEg604fUUKgMh0cWbsiyFxGXa
	UnBfSQiEvXvPpWJQPfVMwSdRQYTrfhbngdcjeOuR7YXTumxNMJaa4+oS2J21bFd5LJd9Uu9RkkTYp
	tfkKUPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPNM-00000002Yxc-316g;
	Mon, 23 Nov 2026 08:26:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPNJ-00000002YxF-1etb;
	Mon, 23 Nov 2026 08:26:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C7D0B40590;
	Mon, 23 Nov 2026 08:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCE11F000C4;
	Mon, 23 Nov 2026 08:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795422368;
	bh=2ZXYzpMsSpVMbq5bALXeiDcyDHaH4rSnY+t2qNogl3c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hG9R1cT4I778FIhn9+UnCNDcoR0RghBICzDHiYHixQahjyOswRk8B+/IIHceoKVmM
	 /xEmFoR8oJvHBtjGToResk/kU1fR8t3juUbfgppPOQ6nW5GD8iuYb4yDzoifl6rYJ2
	 uymziFFSfMMjkLVV1KUl+qCF7J2ZNfoVsfGezQHPjoblSSKWe6M5sodasfGgF9rJPP
	 /IG0CdLeds+JE05IIzItpNLvLNMBplTnue/NwuCXYhEn4+F4Ene3jV/1VjfPUPkT6M
	 9dwCHsG9RculA4+82o71pCuTDRcBzlFagnA5U3hYkT5oCYnez0mSU2N+hwNCqQB8wW
	 sQap6TZqvNlWQ==
Subject: Re: [PATCH] net: dsa: mt7530: disable the power rails on setup failure
From: netdev-bot+sashiko@kernel.org
To: wanghr2026@mail.zgclab.edu.cn
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 08:26:07 +0000
Message-ID: <179542236717.3135.17350424891277003723@kernel.org>
In-Reply-To: <1795076103951-10-8fa23d94@mail.zgclab.edu.cn>
References: <1795076103951-10-8fa23d94@mail.zgclab.edu.cn>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.
- [Medium] The new error-path disable in mt7530_setup() can be followed
  by a second disable of the same rails, because mt7530_remove()…
- [Low] In mt7530_setup(), suppose mt7530_setup_gpio() has registered the
  GPIO chip with devm_gpiochip_add_data() and the later…
- [Low] Speculative.

--

net: dsa: mt7530: disable the power rails on setup failure

This commit changes the early returns in mt7530_setup() that come after
the core and io regulator enables. They now jump to new unwind labels,
which disable io_pwr and core_pwr when priv->id == ID_MT7530. The goal is
to stop the switch rails from staying enabled after a failed probe.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d5a199293f78a..769f733f80d2a 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -2579,16 +2581,25 @@ mt7530_setup(struct dsa_switch *ds)
>  	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
>  		ret = mt7530_setup_gpio(priv);
>  		if (ret)
> -			return ret;
> +			goto err_disable_pwrs;
>  	}
>  #endif /* CONFIG_GPIOLIB */
>  
>  	/* Flush the FDB table */
>  	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
>  	if (ret < 0)
> -		return ret;
> +		goto err_disable_pwrs;

[Severity: Low]
Suppose mt7530_setup_gpio() has already registered the gpiochip with
devm_gpiochip_add_data() and the FDB flush then fails. This goto turns
off io_pwr and core_pwr while the gpiochip is still registered.

The gpiochip is only removed when devres on priv->dev is released. In a
single-switch tree that happens at the end of the failed probe. If another
switch's probe drove the tree setup and the MT7530 stays bound, it does
not happen at all.

During that window, could mt7530_gpio_get(), mt7530_gpio_set() and
mt7530_gpio_direction_*() do regmap accesses over MDIO to a switch whose
supplies are off? Should the gpiochip be removed before the hardware
loses power?

>  
>  	return 0;
> +
> +err_disable_pwrs:
> +	if (priv->id == ID_MT7530)
> +		regulator_disable(priv->io_pwr);
> +err_disable_core_pwr:
> +	if (priv->id == ID_MT7530)
> +		regulator_disable(priv->core_pwr);
> +
> +	return ret;
>  }

[Severity: High]
Does this fully cover the leak described in the commit message? These
labels only handle failures inside mt7530_setup(). The rails can still be
left enabled when something fails after mt7530_setup() has returned 0.

mt753x_setup() calls priv->info->sw_setup(), which is mt7530_setup() for
ID_MT7530, and then does this:

drivers/net/dsa/mt7530.c:mt753x_setup() {
    ...
	ret = mt7530_setup_irq(priv);
	if (ret)
		return ret;

	ret = mt7530_setup_mdio(priv);
	if (ret)
		return ret;
    ...
}

mt7530_setup_irq() can fail with -EPROBE_DEFER from of_irq_get() when the
interrupt parent hasn't probed yet. Neither of these returns disables
core_pwr or io_pwr.

Something similar happens in dsa_switch_setup() and dsa_tree_setup().
Failures after ds->ops->setup() succeeds (tag protocol setup, user MDIO
bus, ports, conduit, lags) only unwind through ds->ops->teardown, which is
mt753x_teardown():

static void
mt753x_teardown(struct dsa_switch *ds)
{
	struct mt7530_priv *priv = ds->priv;

	if (priv->bus)
		cancel_delayed_work_sync(&priv->stats_work);
}

In all of these cases dsa_register_switch() fails, so mt7530_probe() fails
and mt7530_remove() never runs. When devres later calls regulator_put(),
the regulator core would hit WARN_ON(regulator->enable_count). On
-EPROBE_DEFER, every re-probe enables the rails again:

mt7530_probe()
  dsa_register_switch()
    dsa_tree_setup()
      dsa_switch_setup()
        mt753x_setup()
          mt7530_setup()       <- rails enabled, returns 0
          mt7530_setup_irq()   <- -EPROBE_DEFER, rails left enabled

Would it be better to tie the regulator lifetime to the whole
setup/teardown pair instead of using local labels in mt7530_setup()? One
option is to disable the rails in mt753x_teardown() and on the
mt753x_setup() error paths, and change mt7530_remove() to match. Another
is to use devm-managed enables.

[Severity: Medium]
Can these new disables lead to unbalanced regulator disables later in
mt7530_remove()?

mt7530_remove() in drivers/net/dsa/mt7530-mdio.c disables both rails
whenever priv->id == ID_MT7530. It does not know whether setup succeeded:

drivers/net/dsa/mt7530-mdio.c:mt7530_remove() {
    ...
	if (priv->id == ID_MT7530) {
		ret = regulator_disable(priv->core_pwr);
		...
		ret = regulator_disable(priv->io_pwr);
    ...
}

The driver supports port 5 as a DSA link (see the
dsa_is_dsa_port(priv->ds, 5) check in mt7530_setup_port5()). In a
multi-switch tree, dsa_tree_setup() returns 0 while the tree is
incomplete:

	complete = dsa_tree_setup_routing_table(dst);
	if (!complete)
		return 0;

So mt7530_probe() can succeed, and mt7530_setup() then runs later from
another switch's dsa_register_switch(). Suppose it fails there after the
rails are enabled. These labels bring the enable counts back to 0, and the
error goes to the other switch's probe. The MT7530 stays bound with its
drvdata set.

On a later unbind, mt7530_remove() would call regulator_disable() again.
_regulator_disable() would then WARN with "unbalanced disables" and return
-EIO. Before this patch the rails stayed enabled after a setup failure, so
remove was balanced in this case.

[Severity: Low]
This one is speculative: should the switch be put back into reset before
the rails are dropped here? By the time any of these gotos run, the chip
has already been taken out of reset earlier in mt7530_setup():

	if (priv->mcm) {
		reset_control_assert(priv->rstc);
		usleep_range(5000, 5100);
		reset_control_deassert(priv->rstc);
	} else {
		gpiod_set_value_cansleep(priv->reset, 0);
		usleep_range(5000, 5100);
		gpiod_set_value_cansleep(priv->reset, 1);
	}

On the non-MCM path, the host keeps driving the reset GPIO at its run
level, and the MDIO controller keeps driving MDC/MDIO, into a chip whose
supplies have just been released. On boards where regulator_disable()
actually removes the rail, could that back-power the I/O domain?

Asserting reset with gpiod_set_value_cansleep(priv->reset, 0) or
reset_control_assert(priv->rstc) before the regulator_disable() calls
would avoid this. mt7530_remove() has the same ordering, but this patch
adds a new power-off sequence that is reached more often.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/1795076103951-10-8fa23d94%40mail.zgclab.edu.cn

