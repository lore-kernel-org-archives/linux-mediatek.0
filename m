Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A31606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vXvfWX5t;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K9frEIov
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4uoskY1EG7VAfNz08KwlvC9A41XTvME1bf3Oqeq2F30=; b=vXvfWX5tK59JgMeXMUIKel77TJ
	idtvj9pbfyVC3/27oS5RsOPhTEIAonFgEWNvSX1K1+x/jE69O2xW3p41v44Xe8BqZfUAX7oBD6qnt
	2uPy+B9zopzvfUzU3lmV6sTCHDlJ5NPiDUGyicR4sBg8aj+MEQmwjsjc8NjOAqhbdNgqHvgPbcPnZ
	8TuTskFhM2f6ztE9LGTxsDOlqDYg6cO3X1yHUDlGRZVc9tgCjMfrsrP5uDaCYmSiz9TSq/+xA40N9
	cmvUxSttJWmDU95V56NIJs0TbPSP1YJipp/GAHoTAsb0hmwdb8JnTM9ljIat9IM0y9e6cud6l/bRg
	od55qIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9ID-00000009HZe-1eQ7;
	Wed, 25 Nov 2026 09:27:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Ha-00000009HRQ-3Rxf;
	Wed, 25 Nov 2026 09:27:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 93A39601EE;
	Wed, 25 Nov 2026 09:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F951F000D4;
	Wed, 25 Nov 2026 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795598837;
	bh=4uoskY1EG7VAfNz08KwlvC9A41XTvME1bf3Oqeq2F30=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K9frEIovzSE8Eg54wK7g6G21X9W4+yTlJ4tZtlpzS4o9SeKmc7MkZeZYt+AUWnbpZ
	 X/ckwT7EQs1JzCGsXhW6Fu2I2Bw5x2nnVCNo+D1m7tfsW2aKMq2m2S6hi4cpW9qLk7
	 ispD0DapAdic8h/rCUJAvf2qeUe2Pa5rWRZ+3159xjjnQlnj/OHh+4kIWbS3pTF0/0
	 Y/2NbPfQD+p2dRYespYbGDOKuFA656Wsu28a2PNpJNV+nEj7AkcZoqNu9mg4xh80dh
	 DMOlv7Ze4Q69IemonLRKap99Vf6F510HIySvuoeD4s4qp7NpAhwFekcj1wf8SUqD//
	 UFu/HEFKN2nnA==
Subject: Re: [PATCH net 5/5] net: dsa: mt7530: disable regulators on
 mt753x_setup() failure
From: netdev-bot+sashiko@kernel.org
To: wanghr2026@mail.zgclab.edu.cn
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 09:27:16 +0000
Message-ID: <179559883613.3135.7444939334405682827@kernel.org>
In-Reply-To: <179550875790.4156.14185923394520188230@mail.zgclab.edu.cn>
References: <179550875790.4156.14185923394520188230@mail.zgclab.edu.cn>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 0 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] In mt753x_setup() (drivers/net/dsa/mt7530.c), the new error
  paths turn off the MT7530 core/io regulators while devm still keeps…
- [Low] net: dsa: mt7530: inaccurate Fixes tag for mt753x_setup()
  regulator leak

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it sits on the
  failure path the patch reworks.

--

net: dsa: mt7530: disable regulators on mt753x_setup() failure

This patch sends the failure paths in mt753x_setup() that come after
sw_setup() to a shared error label. That label disables the MT7530 core
and io regulators. The mdio irq teardown after a create_sgmii() failure
moves into the same error path.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 1ac4ac1a05664..963d145341759 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -3223,11 +3223,11 @@ mt753x_setup(struct dsa_switch *ds)
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

[Severity: Low]
Is b8f126a8d543 the right commit for the Fixes tag?

In b8f126a8d543, mt7530_switch_ops.setup pointed straight at
mt7530_setup(). There was no mt753x_setup() wrapper and nothing ran
after sw_setup(). The wrapper came with 88bdef8be9f6 ("net: dsa:
mt7530: Extend device data ready for adding a new hardware"), and
at that point it only did:

	return priv->info->sw_setup(ds);

This patch now unwinds the fallible steps after sw_setup(), which are
mt7530_setup_irq() and mt7530_setup_mdio(). Those steps seem to have
come in with ba751e28d442 ("net: dsa: mt7530: add interrupt support").
That commit is where the early returns that leave the regulators on
were added.

With the Fixes tag pointing at the initial driver, the stable tooling
will try to apply this to kernels that have neither mt753x_setup() nor
these failure paths. Should the tag be this instead?

Fixes: ba751e28d442 ("net: dsa: mt7530: add interrupt support")

[Severity: High]
Can these new gotos power off the switch while things that need power
are still registered?

When mt753x_setup() reaches this point, mt7530_setup() has already
returned 0. If the DT node has "gpio-controller", the GPIO controller is
already published:

mt7530_setup()
    mt7530_setup_gpio()
        return devm_gpiochip_add_data(dev, gc, priv);

Suppose mt7530_setup_irq() then fails, for example with -EPROBE_DEFER
from of_irq_get(). The commit message calls this the common case. In
that case mt7530_disable_pwrs() turns off the rails and the gpiochip
stays registered.

If mt7530_setup_mdio() fails instead, the regmap-irq chip from
devm_regmap_add_irq_chip_fwnode() in mt7530_setup_irq() also stays
registered. Its parent IRQ stays requested and TOP_SIG_CTRL_NORMAL stays
set.

Nothing on these paths unregisters them. Only devres unwinding removes
them:

- With a single switch, devres unwinds after dsa_register_switch() fails
  and probe returns.
- In a multi-switch tree, this switch's probe may already have returned
  0 and the tree setup runs from a sibling's probe. Then devres never
  unwinds here, and the switch stays bound against unpowered hardware.

The earlier patch in this series, "net: dsa: mt7530: register the GPIO
controller last in setup", says:

    This becomes important in the next patch, where
    the failure paths disable the regulators and return an error, so the
    controller must not be registered across a failed setup.

Doesn't this patch make that state reachable again on the
mt7530_setup_irq() and mt7530_setup_mdio() failure paths? Only ID_MT7530
is affected, because mt7530_disable_pwrs() returns early for the other
variants.

Could the regulator-dependent registrations (the gpiochip, and ideally
the irq chip and MDIO bus) happen after every fallible step in
mt753x_setup()? Alternatively, could they be undone explicitly before
mt7530_disable_pwrs() is called?

[ ... ]

> @@ -3239,15 +3239,23 @@ mt753x_setup(struct dsa_switch *ds)
>  	if (priv->create_sgmii)
>  		ret = priv->create_sgmii(priv);
>  
> -	if (ret && priv->irq_domain)
> -		mt7530_free_mdio_irq(priv);
> +	if (ret)
> +		goto err_free_irq;

[Severity: High]
This is a pre-existing issue, but it sits on the failure path this patch
reworks. Can a failed create_sgmii() leave priv->ports[5].sgmii_pcs
dangling, and then have it freed a second time?

Take mt7531_create_sgmii() in drivers/net/dsa/mt7530-mdio.c with
p5_sgmii set, where port5 succeeds and port6 fails:

	if (ret && i)
		mtk_pcs_lynxi_destroy(priv->ports[5].sgmii_pcs);

	return ret;

This frees the port5 PCS but does not clear the pointer. Port6 can fail
in devm_kzalloc_obj(), in devm_regmap_init(), or when
mtk_pcs_lynxi_create() returns NULL.

With a single switch, probe fails and devres frees priv.

In a multi-switch tree, the MT7531 can register before the tree is
complete, so its probe returns 0. mt753x_setup() then runs later from a
sibling's probe via dsa_tree_setup()->dsa_switch_setup(). If
create_sgmii() fails there, the MT7531 stays bound with the stale
pointer. On a later unbind this runs:

mt7530_remove()
	for (i = 0; i < 2; ++i)
		mtk_pcs_lynxi_destroy(priv->ports[5 + i].sgmii_pcs);

Is the port5 PCS kfree()d a second time here? Setting
priv->ports[5].sgmii_pcs = NULL after the destroy in
mt7531_create_sgmii() would avoid it.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179550875789.4156.361477684651496992%40mail.zgclab.edu.cn

