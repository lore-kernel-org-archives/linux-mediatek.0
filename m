Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A7EC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InaA6S2R9U+w0dMzKJ26FvYihdPWx+aFSXWaCzGQox0=; b=CWNVycvMQaVpIZp8diLJvD/ang
	zf1XlYL3FC9WYl05X5U9ZZdJc6JtzOFOqjraR6QUqk3dz3RlFnRDlAsno5pfUnd0pu+P2NQE0ff8b
	otU20T6Kbkoy2uVpEOJIszM9a8NQUGNw5X5hNn645LaU2cSXvNQ8ZcEXsUkoaa7tCsZ6TBweYOUzP
	WT5/WsS0LocNSP/2FI+IwSwl/hrqVrJjuKD895prdy0t5eJyZbB8x8SMAGZfk2lT8YWgEiloEvVYy
	s/Sm5BqMvM1CA4mzlyo9MIzvyOH5d3yEVHG4SXtoy80Fq+z+NqtzMXDp/i5TQ5mdQHCuE2CmU51KP
	iSl6TJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMoqE-0054Ud-2U;
	Mon, 08 Jan 2024 12:34:54 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMoq9-0054Q4-2J;
	Mon, 08 Jan 2024 12:34:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-55790581457so1299333a12.3;
        Mon, 08 Jan 2024 04:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704717287; x=1705322087; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=InaA6S2R9U+w0dMzKJ26FvYihdPWx+aFSXWaCzGQox0=;
        b=hdfcobFmiyF7tqDHkhs5kkw/Ao+3S41dSOxbNhK4ra2ZdcqcfgjzYp0FlIq/l8TBpv
         tTWGgV7PaTOeJGAC/2aSPBIuR0w7qpWZxkoiqNdojNF3xzZESY++WWVu6tz9Qd+XAaFC
         SknH7P34qNrq1h64GSwIq+CE5NuzI7Fll/rtbfHTaKiEvWvPEbpaNDtQUJunb5mX78UP
         gykutRldzlHuoux7wIokCM6oOsxe3hcRgiw/Du8qE2WJwt4iaNFgqJTmqEH3pOJWDEwz
         qr8r7Ri5B1EJaNlj0IaA+aKZG8SUKWzycQ3pYBMKU7vuW7PBj3uUziZNJN9R1zZnKuM/
         tC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717287; x=1705322087;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InaA6S2R9U+w0dMzKJ26FvYihdPWx+aFSXWaCzGQox0=;
        b=X3HUiyohO7RYM+naAUqlhkK25E2/63OAHM/Uk1zQ8lqtEtCUoECZtDt6+NOLad4cBL
         5EMqo9n5vaO7RQ4DL7qPO6zZ5JKtBpV8zBQ7u9PSOJavwCxtZthJWP+OerjyYnyPNDU1
         Hnwh4x7+sBh/dF6tADBdMABsHeIIGcpxsUNB/RVQunXJkx/HeajnKf8gVesTZii1B8LM
         YUl6OqBibKBjcXlEqz/qpcilR6AeZvwTJTDJ1xC4O3fyauDN+iKoRQYerw5Z9ZY62EOd
         lSHe37H3RSP4ncy19GJVc6a56bx0S9b9VS9T+Flb62JQ4kmUGvxHzeEZ8VAVXWZm2TsY
         Y9/Q==
X-Gm-Message-State: AOJu0YwSsP9DSvkVsSwJ94qgEyXm5CpuG7S0qn8VUBiKmALiwthhc1p+
	cxjAhQa5OYhgm8uCA+OBXNs=
X-Google-Smtp-Source: AGHT+IGUddrnY5+YKbCei4noQYPHLM7BkRkB2zZCINU5UYnRktijbOTfd3LtC/AkKciXs9PFqbp8wQ==
X-Received: by 2002:a17:907:770c:b0:a28:e441:7998 with SMTP id kw12-20020a170907770c00b00a28e4417998mr1222461ejc.108.1704717287040;
        Mon, 08 Jan 2024 04:34:47 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906318100b00a2a632e4eebsm1439209ejy.119.2024.01.08.04.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:34:46 -0800 (PST)
Date: Mon, 8 Jan 2024 14:34:44 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Simon Horman <horms@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
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
	erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: support OF-based registration
 of switch MDIO bus
Message-ID: <20240108123444.r3k4mhgii2yontc4@skbuf>
References: <20240106122142.235389-1-arinc.unal@arinc9.com>
 <20240107195241.GB132648@kernel.org>
 <65274929-fa59-482c-a744-6b9ce162ab46@arinc9.com>
 <20240108110000.aujqhlufehngtkjj@skbuf>
 <20240106122142.235389-1-arinc.unal@arinc9.com>
 <20240107195241.GB132648@kernel.org>
 <65274929-fa59-482c-a744-6b9ce162ab46@arinc9.com>
 <20240108110000.aujqhlufehngtkjj@skbuf>
 <7e89034c-afbd-4180-98e5-50d8cd07f924@arinc9.com>
 <7e89034c-afbd-4180-98e5-50d8cd07f924@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e89034c-afbd-4180-98e5-50d8cd07f924@arinc9.com>
 <7e89034c-afbd-4180-98e5-50d8cd07f924@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_043449_754426_65AAEF5A 
X-CRM114-Status: GOOD (  19.15  )
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

On Mon, Jan 08, 2024 at 03:14:45PM +0300, Arınç ÜNAL wrote:
> I realised that I also miss these:
> 
> - run of_node_put(mnp) if bus = devm_mdiobus_alloc(dev) fails
> - don't run mt7530_free_mdio_irq if MDIO bus is described on OF
> 
> Please let me know if this addresses everything:
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 391c4dbdff42..cf2ff7680c15 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2146,24 +2146,40 @@ mt7530_free_irq_common(struct mt7530_priv *priv)
>  static void
>  mt7530_free_irq(struct mt7530_priv *priv)
>  {
> -	mt7530_free_mdio_irq(priv);
> +	struct device_node *mnp, *np = priv->dev->of_node;
> +
> +	mnp = of_get_child_by_name(np, "mdio");
> +	if (!mnp)
> +		mt7530_free_mdio_irq(priv);
> +	of_node_put(mnp);
> +
>  	mt7530_free_irq_common(priv);
>  }
>  static int
>  mt7530_setup_mdio(struct mt7530_priv *priv)
>  {
> +	struct device_node *mnp, *np = priv->dev->of_node;
>  	struct dsa_switch *ds = priv->ds;
>  	struct device *dev = priv->dev;
>  	struct mii_bus *bus;
>  	static int idx;
> -	int ret;
> +	int ret = 0;
> +
> +	mnp = of_get_child_by_name(np, "mdio");
> +
> +	if (mnp && !of_device_is_available(mnp))
> +		goto out;
>  	bus = devm_mdiobus_alloc(dev);
> -	if (!bus)
> -		return -ENOMEM;
> +	if (!bus) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	if (!mnp)
> +		ds->user_mii_bus = bus;
> -	ds->user_mii_bus = bus;
>  	bus->priv = priv;
>  	bus->name = KBUILD_MODNAME "-mii";
>  	snprintf(bus->id, MII_BUS_ID_SIZE, KBUILD_MODNAME "-%d", idx++);
> @@ -2174,16 +2190,18 @@ mt7530_setup_mdio(struct mt7530_priv *priv)
>  	bus->parent = dev;
>  	bus->phy_mask = ~ds->phys_mii_mask;
> -	if (priv->irq)
> +	if (priv->irq && !mnp)
>  		mt7530_setup_mdio_irq(priv);
> -	ret = devm_mdiobus_register(dev, bus);
> +	ret = devm_of_mdiobus_register(dev, bus, mnp);
>  	if (ret) {
>  		dev_err(dev, "failed to register MDIO bus: %d\n", ret);
> -		if (priv->irq)
> +		if (priv->irq && !mnp)
>  			mt7530_free_mdio_irq(priv);
>  	}
> +out:
> +	of_node_put(mnp);
>  	return ret;
>  }

Looks ok.

Please note that net-next has now closed. Sorry that I couldn't bring
myself to review more during the weekend and the holidays.
https://lore.kernel.org/netdev/20240107172221.733a7a44@kernel.org/

