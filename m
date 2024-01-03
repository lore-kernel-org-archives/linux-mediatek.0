Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3D9C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 19:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MJgpoiYX2ieK9G59Tpv6u4Pnf7MXXAZFvpISXd2cjQ=; b=X546RnAfMCKkAvloDKo7v6Bixv
	j/T366+xYeeorTbQ7oRoE7SXICg/peie0qWukeGSBNeNC5xuqi6EB9qcpAZCGF1lU5lmH4UbhgMSY
	FOaziWiW6J9pV3XIytGFiOj4tJ72RIrbi6Ui1UB0Gy4xO9INmjMbTkSDMGtUloKgjX2dOZ2L+mdX9
	OnMkhbsFIxcJ81Xmb6WugVWe0W9Q15sphvcIqd2auKr8QIKqYheUjY0rJOIbtGPshemVyfqYyPH4S
	K7IV5wK1iOIX9BbzmSqK0k9/8IIvJ8jIkWdXvtT9OjItjb2h60lQENhMJbAo1YrBkcSKXE7b1sCJR
	Uwyb56Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL6W3-00BrLo-2e;
	Wed, 03 Jan 2024 19:02:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL6Vz-00BrJa-06;
	Wed, 03 Jan 2024 19:02:56 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a28ac851523so78178666b.0;
        Wed, 03 Jan 2024 11:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704308570; x=1704913370; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/MJgpoiYX2ieK9G59Tpv6u4Pnf7MXXAZFvpISXd2cjQ=;
        b=HMU78Ya2XDWEWQrw/YVy9ENIdg44RNw6HwEelfug1CD3xnaUHjeteFFyOY8pAaK7Gi
         7VJkcAbj7Im10Nuk3kI1Umpd/VHesmJPzEGBgqcD1cNc0unCBfMqm6ID2ZyoJ54Apjcm
         7ipIR3Hl8Y60g0UOl1JaYwqp4BrsnufoigwHLcYyQvek/AfjJTLUGSFkA+0WacUtWj0m
         V5tp4fzWu8TTwKphvpFxny3EMs303G4hFmL7DTWc21V2m5U8AtgG4xaUWH2J/uJ8TGeY
         jU1ZW36uWU+QVVuvNa3fydfSuu9QtvjI/PPs42VzqoQS4ejj/3d+e6my6fCL6KGln3uF
         wb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704308570; x=1704913370;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/MJgpoiYX2ieK9G59Tpv6u4Pnf7MXXAZFvpISXd2cjQ=;
        b=fDhVO70ObonSN0EsbFAK4gjKPu9Yw8CmmiR0MZBYF9iyU3vq7UUVpXr2I87KQuGEww
         i4kVj4XIMe2snyBlNlRNwEppXpKFwevvap+pNq7bINaI3PSNvEVB+whZwZOIxB/1Ncmq
         S5keZgssX/Q0NhYNodIQrQLiw1Bs2GuHURvIU1U2Bb0xVR3kyHs512BPLtE+hTq7VGpe
         l6wxnshZTKXY6gCMtvDFAFdEjjBzRbmDaNILjQNkQVWeu14Eh3aiKyBFyfk2rTQ8y+jQ
         HMovMOc1FQscReOjvDfQz4Sxq4EtFllVH3TQtUkrpHjbd0wYrTN8bvpVrGVcKz9Thuva
         oODg==
X-Gm-Message-State: AOJu0YxD16FMntRvOMA5VWINNRovMA9trTqx3x18/gc0o0tWuZuPNq1i
	pSzGoDGZ3zOfmDpkr5tpAAg=
X-Google-Smtp-Source: AGHT+IGUH8UoqdtTD6HYFLZRnvMAdGqAM2Civpr13lPO+LrJfvwYUVRvVPe9b2Z+NgdZ2JAyrQq2qw==
X-Received: by 2002:a17:906:a1c2:b0:a26:874f:4847 with SMTP id bx2-20020a170906a1c200b00a26874f4847mr7510133ejb.65.1704308569468;
        Wed, 03 Jan 2024 11:02:49 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id kb6-20020a170907924600b00a27a32e6502sm4939779ejb.117.2024.01.03.11.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 11:02:49 -0800 (PST)
Date: Wed, 3 Jan 2024 21:02:46 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Bauer <mail@david-bauer.net>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: register OF node for internal
 MDIO bus
Message-ID: <20240103190246.ctyeehvfmhctpphf@skbuf>
References: <20231220173539.59071-1-arinc.unal@arinc9.com>
 <20231220173539.59071-1-arinc.unal@arinc9.com>
 <20231221151607.ujobhh4aet4obxdz@skbuf>
 <6600c6b1-2230-4963-940c-8b95a01750fd@arinc9.com>
 <20231227191154.6jkqdlqdxciidpfw@skbuf>
 <bdbe24b2-30f6-48fa-b6eb-a1ae3afe9076@arinc9.com>
 <20231227200217.kdltxpmhvlp6z4cd@skbuf>
 <d2a7cc7e-bb27-472f-8921-5579a894c71d@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2a7cc7e-bb27-472f-8921-5579a894c71d@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_110255_075363_B4969F5F 
X-CRM114-Status: GOOD (  30.86  )
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

On Thu, Dec 28, 2023 at 07:58:13PM +0300, Arınç ÜNAL wrote:
> As Daniel stated on a previous submission of this patch, being able to
> reference the PHYs on the switch MDIO bus is mandatory on MT7988 as
> calibration data from NVMEM for each PHY is required, so defining the MDIO
> bus is required to support MT7988. Therefore, we should support interrupts
> on device trees with the switch MDIO bus defined.

Understood and no objection there. I was just making sure that there is
no existing case in upstream where the internal PHYs are described in OF,
that we'd have to preserve IRQ functionality for.

> The implementation below follows this logic:
> 
> No switch MDIO bus defined: Register the MDIO bus, set the interrupts for
> PHYs if "interrupt-controller" is defined at the switch node.
> 
> Switch MDIO bus defined: Register the MDIO bus, set the interrupts for PHYs
> if ["interrupt-controller" is defined at the switch node and "interrupts"
> is defined at the PHY nodes under the switch MDIO bus node].
> 
> I think this approach fits your description so I'd like to agree that this
> should be the way for all DSA subdrivers. Please let me know what you
> think.
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 391c4dbdff42..bbd230a73ead 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2155,15 +2155,21 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  {
>  	struct dsa_switch *ds = priv->ds;
>  	struct device *dev = priv->dev;
> +	struct device_node *np, *mnp;
>  	struct mii_bus *bus;
>  	static int idx;
>  	int ret;
> +	np = priv->dev->of_node;
> +	mnp = of_get_child_by_name(np, "mdio");
> +

Empty line between variable declarations and code. Or you can initialize
them as part of their declaration, but you need to stick to the "longest
line first" rule.

Also, it would be good to also check of_device_is_available(mnp).

>  	bus = devm_mdiobus_alloc(dev);
>  	if (!bus)
>  		return -ENOMEM;
> -	ds->user_mii_bus = bus;
> +	if (mnp == NULL)

!mnp

> +		ds->user_mii_bus = bus;
> +
>  	bus->priv = priv;
>  	bus->name = KBUILD_MODNAME "-mii";
>  	snprintf(bus->id, MII_BUS_ID_SIZE, KBUILD_MODNAME "-%d", idx++);
> @@ -2174,10 +2180,11 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	bus->parent = dev;
>  	bus->phy_mask = ~ds->phys_mii_mask;
> -	if (priv->irq)
> +	if (priv->irq && mnp == NULL)
>  		mt7530_setup_mdio_irq(priv);
> -	ret = devm_mdiobus_register(dev, bus);
> +	ret = devm_of_mdiobus_register(dev, bus, mnp);
> +	of_node_put(mnp);

This is going to be interesting. There isn't really a correct way to
manage the reference to "mnp", as far as I can tell. Normally, it should
have been possible to release the reference as you did. But you need
something along the lines of what Luiz/Russell have been discussing
here:

https://lore.kernel.org/netdev/20231220045228.27079-2-luizluca@gmail.com/

In any case, the devres variant of of_mdiobus_register() seems incompatible
with the mt7530 driver owning the "mnp" node for any longer than this,
because it has no hook to call of_node_put() once the MDIO bus is unregistered.

>  	if (ret) {
>  		dev_err(dev, "failed to register MDIO bus: %d\n", ret);
>  		if (priv->irq)
> 
> With this device tree:
> 
> switch {
> 	interrupt-controller;
> }
> 
> [    1.420534] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=17)
> [    1.433224] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=18)
> [    1.445338] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=19)
> [    1.457472] mt7530-mdio mdio-bus:1f lan4 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=20)
> [    1.469587] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=21)
> 
> With this device tree:
> 
> switch {
> 	interrupt-controller;
> 
> 	mdio {
> 		phy {
> 			reg = <0>;
> 		}
> 	}
> }
> 
> [    1.413101] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    1.429954] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    1.443704] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    1.455876] mt7530-mdio mdio-bus:1f lan4 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    1.468079] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=POLL)
> 
> With this device tree:
> 
> switch {
> 	interrupt-controller;
> 
> 	mdio {
> 		phy {
> 			reg = <0>;
> 			interrupts = <0>;
> 		}
> 	}
> }
> 
> [    1.420534] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=17)
> [    1.433224] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=18)
> [    1.445338] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=19)
> [    1.457472] mt7530-mdio mdio-bus:1f lan4 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=20)
> [    1.469587] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=21)

Looks sane.

FWIW, I found Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
where internal PHYs don't have an 'interrupts' property, yet they are
probably still expected to use interrupts - according to ksz_irq_phy_setup().

Anyway, what's done is done, but I still don't see the point of making
the binding much more flexible than it needs to be.

