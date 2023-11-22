Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0D1C61D9C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysDRUdNyjhSZ1cu+6OnJUJ9v5mLNhCKHViDqz25JT0w=; b=qREBZslM9FFe2NqurluUJ6Yj7e
	3kynAN3ni+Ycm/YeFYsJxnyInyE6yHwYw3zCYfq0NCdGCXNPBcfInYv0AFxELHZqGaFzDn0snvmjD
	xvIwaoluI8Bi2I7O265L9jp3ECHSBXho14cwzrVdd2DUAA44WZu2CRqfMqAR/cxMDhywMd57bjmg1
	F0ZqoqH6pCa3wSTEaxQ4XEuF2CIqOLDQiaQfemZDHfHT+oce/tlPL5397JahpT28IAwMMDzQwByM2
	IuYFAyzQEPVb+gH6h2VNWquwP8cGzGr8mBUzLvqZCjt9X+UOtoLGt3BS0Udsp25P4jlrSW6xYjX0Z
	3P1aNPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5kqo-001Tst-0u;
	Wed, 22 Nov 2023 10:52:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5kqk-001Tqv-2W;
	Wed, 22 Nov 2023 10:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B5DC6CE1E8D;
	Wed, 22 Nov 2023 10:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3E9C433CA;
	Wed, 22 Nov 2023 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700650372;
	bh=vg1uuwvQT2sKrRMAHrj+xxj4ykdnjZw0VMW21gcYvUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=geQ+d6cieEbtA6MuRMTYcrI7LhaZsSiMpF6Z0EmxIjhHp2YFr4y5kS8qQGPHIReOx
	 Gx/DQ3C+yWG1GL0GjjGldrto/KOVhyORCImcSSnYdzUxWs+Qm7t8ThARNQJtGM+ZJg
	 +XqEQQ4vGjiD0TCYBukcu8HqtqO/OpbFWMV3SKenBjLcc1921paWbPMp51QrYNOdTi
	 TAkG25biHSjNdtGJPixedr+oJQM/EI46CyD1CLw+EHpwBxyiVd9S3HLkAuxnLBccfN
	 HBUxrr4qET/KN5se9nxEXapkamp5Gas3ngegBl2oENiIc1JZ9eccBVbxE9FimJYdrO
	 +iuhip3TAaSAA==
Date: Wed, 22 Nov 2023 10:52:43 +0000
From: Simon Horman <horms@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 04/14] net: phy: add initial support for PHY
 package in DT
Message-ID: <20231122105243.GB28959@kernel.org>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_025255_189663_936C9142 
X-CRM114-Status: GOOD (  30.57  )
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

On Mon, Nov 20, 2023 at 02:50:31PM +0100, Christian Marangi wrote:
> Add initial support for PHY package in DT.
> 
> Make it easier to define PHY package and describe the global PHY
> directly in DT by refereincing them by phandles instead of custom
> functions in each PHY driver.
> 
> Each PHY in a package needs to be defined in a dedicated node in the
> mdio node. This dedicated node needs to have the compatible set to
> "ethernet-phy-package" and define "global-phys" and "#global-phy-cells"
> respectively to a list of phandle to the global phy to define for the
> PHY package and 0 for cells as the phandle won't take any args.
> 
> With this defined, the generic PHY probe will join each PHY in this
> dedicated node to the package.
> 
> PHY driver MUST set the required global PHY count in
> .phy_package_global_phy_num to correctly verify that DT define the
> correct number of phandle to the required global PHY.
> 
> mdio_bus.c and of_mdio.c is updated to now support and parse also
> PHY package subnote that have the compatible "phy-package".
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Hi Christian,

I was a little hasty in hitting send on my previous message.
Please find some more minor feedback from my side below.

...

> diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
> index 64ebcb6d235c..bb910651118f 100644
> --- a/drivers/net/mdio/of_mdio.c
> +++ b/drivers/net/mdio/of_mdio.c
> @@ -139,6 +139,44 @@ bool of_mdiobus_child_is_phy(struct device_node *child)
>  }
>  EXPORT_SYMBOL(of_mdiobus_child_is_phy);
>  
> +static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
> +				   bool *scanphys)
> +{
> +	struct device_node *child;
> +	int addr, rc;
> +
> +	/* Loop over the child nodes and register a phy_device for each phy */
> +	for_each_available_child_of_node(np, child) {
> +		if (of_device_is_compatible(child, "ethernet-phy-package")) {
> +			rc = __of_mdiobus_parse_phys(mdio, child, scanphys);
> +			if (rc && rc != -ENODEV)
> +				return rc;

for_each_available_child_of_node() makes calls to of_node_get() and
of_node_put(), so when jumping out of a loop it is necessary to call
of_node_put(), in this case of_node_put(child).

As flagged by Coccinelle.

Also flagged in of_mdiobus_find_phy() both before and after this patch.

> +
> +			continue;
> +		}
> +
> +		addr = of_mdio_parse_addr(&mdio->dev, child);
> +		if (addr < 0) {
> +			*scanphys = true;
> +			continue;
> +		}
> +
> +		if (of_mdiobus_child_is_phy(child))
> +			rc = of_mdiobus_register_phy(mdio, child, addr);
> +		else
> +			rc = of_mdiobus_register_device(mdio, child, addr);
> +
> +		if (rc == -ENODEV)
> +			dev_err(&mdio->dev,
> +				"MDIO device at address %d is missing.\n",
> +				addr);
> +		else if (rc)
> +			return rc;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * __of_mdiobus_register - Register mii_bus and create PHYs from the device tree
>   * @mdio: pointer to mii_bus structure
> @@ -180,25 +218,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
>  		return rc;
>  
>  	/* Loop over the child nodes and register a phy_device for each phy */
> -	for_each_available_child_of_node(np, child) {
> -		addr = of_mdio_parse_addr(&mdio->dev, child);
> -		if (addr < 0) {
> -			scanphys = true;
> -			continue;
> -		}
> -
> -		if (of_mdiobus_child_is_phy(child))
> -			rc = of_mdiobus_register_phy(mdio, child, addr);
> -		else
> -			rc = of_mdiobus_register_device(mdio, child, addr);
> -
> -		if (rc == -ENODEV)
> -			dev_err(&mdio->dev,
> -				"MDIO device at address %d is missing.\n",
> -				addr);
> -		else if (rc)
> -			goto unregister;
> -	}
> +	rc = __of_mdiobus_parse_phys(mdio, np, &scanphys);
> +	if (rc)
> +		goto unregister;

Jumping to unregister will call of_node_put(child),
however child appears to be uninitialised here.

Flagged by clang-16 W=1 build, and Smatch.

>  
>  	if (!scanphys)
>  		return 0;

...

