Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71B8606A68C
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 09:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TSisVZmR;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=csCgOiTE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P8tTFRZKMoV9ILmjWhm/Qj+eqvtd5b4s7jrXn6M6sCA=; b=TSisVZmRqP+xiu90TR2oSazPha
	srWm6RRdVZyHnz5/9yscfqv0X5apGjrb+P/O4M/Qcw4AvMXmaEiBuFVD9a0zrOwPo1EzjcMOzrj06
	JHpSF7SVBr+onQ0Nzm98+EXzvsXkELVRADskhQJOlbL9m+ZKKc+CGUVuz3/5jMBPhzI/DrNMvDJ2Z
	uHDtsWKJ0qk9ZSgZYeoBgf/RXU9w1p7AzQaJ+K6axbAyYzJmmIgeuBKYNLPWwjcGudRmw6aParh9/
	nbsEzaYxky3b0x0FppeNWI45J57Y/pWzDPRjaM8i22OIpAikw1ZJJuX17lSVgxL+M/ncsxzw/Aprh
	Y6ftpGew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9HX-00000009HQA-1kEI;
	Wed, 25 Nov 2026 09:27:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9HW-00000009HPx-3Rq5;
	Wed, 25 Nov 2026 09:27:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 50B274465A;
	Wed, 25 Nov 2026 09:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157361F000C0;
	Wed, 25 Nov 2026 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795598833;
	bh=P8tTFRZKMoV9ILmjWhm/Qj+eqvtd5b4s7jrXn6M6sCA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=csCgOiTEhmqVdAe5KLvf/KId4CUz5vLa16QtG35bS9sZm1GXuijGnS/S3MO+RPaga
	 fxNDCfQFBuxz11T1yQvd/M/+rjHNje5veEhF91UvmTAN+OXyL3lGglzKTrEE11TDps
	 vUP9c4glv6izxOtNJth8c51S6+fW2srjzeSkLLw3GoJtq9UQtODO3dbnXqMcFF+bpR
	 SQBx18Py/YdoKlJtVGC23SmLwKCbkP99fdXgXVy6jCqxESjHTV1RPwRSjkhlu0BqLU
	 wbmXubAMzcyzq+hivj9Iy42i8hmN0J4cnrDUVlH7j0MoQGjf6vxkuqcUeC2w0hx8OJ
	 CPaCPmi8NbQtg==
Subject: Re: [PATCH net 3/5] net: dsa: mt7530: register the GPIO controller
 last in setup
From: netdev-bot+sashiko@kernel.org
To: wanghr2026@mail.zgclab.edu.cn
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Wed, 25 Nov 2026 09:27:12 +0000
Message-ID: <179559883260.3135.17892460412824046133@kernel.org>
In-Reply-To: <179550875790.4156.7464757884919680732@mail.zgclab.edu.cn>
References: <179550875790.4156.7464757884919680732@mail.zgclab.edu.cn>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] net: dsa: mt7530: mt7530_setup_gpio() still runs before
  fallible setup steps

--

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2585,6 +2585,11 @@ mt7530_setup(struct dsa_switch *ds)
>  		}
>  	}
>  
> +	/* Flush the FDB table */
> +	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
> +	if (ret < 0)
> +		return ret;
> +
>  #ifdef CONFIG_GPIOLIB
>  	if (of_property_read_bool(priv->dev->of_node, "gpio-controller")) {
>  		ret = mt7530_setup_gpio(priv);

[Severity: Medium]
The commit message says this makes the GPIO controller visible only
once every fallible step of setup has succeeded. However, mt7530_setup()
is only the priv->info->sw_setup() callback. After it returns 0,
mt753x_setup() still calls mt7530_setup_irq() and mt7530_setup_mdio().
Both of those can fail, and mt7530_setup_irq() can also return
-EPROBE_DEFER.

If either of them fails, the gpio_chip that mt7530_setup_gpio()
registered with devm_gpiochip_add_data() on priv->dev stays published.
Once the next patch disables core_pwr and io_pwr on the failure path,
consumers would be left poking MT7530_LED_GPIO_* registers on an
unpowered switch. That is the situation this patch says it prevents.

The same applies to teardown. The chip is tied to devres on priv->dev,
not to the DSA setup/teardown cycle. Consider a multi-switch tree where
a sibling switch fails or defers. mt753x_teardown() then disables the
regulators without unbinding priv->dev, so the chip remains registered.
The next dsa_tree_setup() attempt would run mt7530_setup_gpio() again
and add a second controller.

Should the GPIO registration move to the end of mt753x_setup(), after
mt7530_setup_mdio(), with an explicit gpiochip_remove() in the error
path and in mt753x_teardown()? Or would you rather register it from
probe instead? Either way, the commit message should not claim it is
the last fallible step as things stand.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179550875789.4156.361477684651496992%40mail.zgclab.edu.cn

