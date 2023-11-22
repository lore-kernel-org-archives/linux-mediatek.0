Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A45C61D9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 18:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVSrNzLgRvQ4gfVAo/d/ONIYYWbL33zy5cmCQPLiW2M=; b=um1hXXfjYENbl2jv6Tasfr0C90
	2LBwbQP3mDaov34dHoHOIXbooUs3U3TuaqlJXD0TXnVlUUVnpEueSL3/rLwOSBtlW4Do3G8o1pe0Q
	VNd0BIU6UY44OWf2Jw00fpipQpiCDWzA9QPxi51sYiUrkBh7gpFPfY5x4tOFVZI/32sskMO333grP
	3TAVa71Xg9SugwCuIImZPUy072SkkK9Lh1/wYpigaPcymHrTRF4taDVfFAc3ChJkij2lHaHQVOLpy
	abTQEq22L3pAKAnkkB23qG6IutqlSI95lC2FzWHXn2izyJMwmWBIzXxqATscXDYafset5UaqzKxn+
	/wlIPTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rks-002n1V-1B;
	Wed, 22 Nov 2023 18:15:18 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rko-002n05-2p;
	Wed, 22 Nov 2023 18:15:16 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32d895584f1so4815f8f.1;
        Wed, 22 Nov 2023 10:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700676910; x=1701281710; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NVSrNzLgRvQ4gfVAo/d/ONIYYWbL33zy5cmCQPLiW2M=;
        b=G/7ORVas894U01GThPKpjCndQ7TAjv91DM3dzOxCVgDN16GPOjYaOpaKCpytYz1g2u
         dBgWhfegwO3N9fUdbfvHOiHRd3rtQ/A/+MWm8Y5jVYE3+I72SVim42dre5FjIZW3I9ZQ
         QK3ZplcocOnf/Zqn+InltSNc2DXTnK+ZWw7LF/9Xflgf7GW9lSDJ7P+HIrliJK9HtF4P
         Bwnc3617fqrNjVB1OQtHFOKmJulkoeBX+7HBoJiPYCZNAv3cGbsb6D5w3HIKRnPCzo3N
         lPmGosW06yP5j9H1DZefQdwqs0y0agSWM0HeI6tMGEN/EOBviVx2KCyQW2Cwga/p4mvK
         j7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700676910; x=1701281710;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVSrNzLgRvQ4gfVAo/d/ONIYYWbL33zy5cmCQPLiW2M=;
        b=FNYR2dbaiVDhgN9U9mBA73ipxQQPn0YhCJffDy7asUOHXV309EQiL7qU7tdkiL/0cW
         OSDx6k/mKbI53PwBk4p5/h/5EZomfMPVMy5FDiTG8QEdm6McEua1eFQ6BBUaQHJ/3F8Z
         7eZJRhI5PGnE+BdXV37qcWMgDziSbNAynDMYwS1k9hRkk9wJNYed5VaBdk9zCHLCWV+K
         7bHN+xQ38zf5X/ivaqpUzdULDo2iR8znB78FAQaDYRnYTAwlzqeceFGUPJ4orX/tGHyj
         7obPnLOs7oZ7N/3XJjh8/2B37JZxTV/hia5WnoAMy6dWmIw3EYCF7sjarK3TDo1/wfvs
         Bk3g==
X-Gm-Message-State: AOJu0Yy0/45lXC5ESIKEt3K0ok5rQWifvUg8D9QvjCQ7LSHDI75RSo/L
	lMpuNgqSkepwWLPu3RCYlMs=
X-Google-Smtp-Source: AGHT+IE6ao4vkwq952ctFLHc3qQmln2Fu/+DhwMBUg5bDQNU//QHvdiFV9OG3a65EXYc10npzM6zbA==
X-Received: by 2002:adf:e550:0:b0:331:3b59:3edb with SMTP id z16-20020adfe550000000b003313b593edbmr2507151wrm.42.1700676910297;
        Wed, 22 Nov 2023 10:15:10 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id u7-20020a5d5147000000b003316debbde4sm24378wrt.48.2023.11.22.10.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 10:15:09 -0800 (PST)
Message-ID: <655e452d.5d0a0220.61c31.01ae@mx.google.com>
X-Google-Original-Message-ID: <ZV5FKswuT+PAXpWB@Ansuel-xps.>
Date: Wed, 22 Nov 2023 19:15:06 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Simon Horman <horms@kernel.org>
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
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-5-ansuelsmth@gmail.com>
 <20231122105243.GB28959@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122105243.GB28959@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_101514_922295_AA4B77BC 
X-CRM114-Status: GOOD (  40.23  )
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

On Wed, Nov 22, 2023 at 10:52:43AM +0000, Simon Horman wrote:
> On Mon, Nov 20, 2023 at 02:50:31PM +0100, Christian Marangi wrote:
> > Add initial support for PHY package in DT.
> > 
> > Make it easier to define PHY package and describe the global PHY
> > directly in DT by refereincing them by phandles instead of custom
> > functions in each PHY driver.
> > 
> > Each PHY in a package needs to be defined in a dedicated node in the
> > mdio node. This dedicated node needs to have the compatible set to
> > "ethernet-phy-package" and define "global-phys" and "#global-phy-cells"
> > respectively to a list of phandle to the global phy to define for the
> > PHY package and 0 for cells as the phandle won't take any args.
> > 
> > With this defined, the generic PHY probe will join each PHY in this
> > dedicated node to the package.
> > 
> > PHY driver MUST set the required global PHY count in
> > .phy_package_global_phy_num to correctly verify that DT define the
> > correct number of phandle to the required global PHY.
> > 
> > mdio_bus.c and of_mdio.c is updated to now support and parse also
> > PHY package subnote that have the compatible "phy-package".
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> Hi Christian,
> 
> I was a little hasty in hitting send on my previous message.
> Please find some more minor feedback from my side below.
>

Thanks a lot for the initial review and sorry for the various warning
you had to write about it. I know this was a new concept and that I had
to discuss a lot about the DT structure so I was a bit relaxed in
releasing OF node. Will handle all of them in v2. Again thanks! 

> ...
> 
> > diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
> > index 64ebcb6d235c..bb910651118f 100644
> > --- a/drivers/net/mdio/of_mdio.c
> > +++ b/drivers/net/mdio/of_mdio.c
> > @@ -139,6 +139,44 @@ bool of_mdiobus_child_is_phy(struct device_node *child)
> >  }
> >  EXPORT_SYMBOL(of_mdiobus_child_is_phy);
> >  
> > +static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
> > +				   bool *scanphys)
> > +{
> > +	struct device_node *child;
> > +	int addr, rc;
> > +
> > +	/* Loop over the child nodes and register a phy_device for each phy */
> > +	for_each_available_child_of_node(np, child) {
> > +		if (of_device_is_compatible(child, "ethernet-phy-package")) {
> > +			rc = __of_mdiobus_parse_phys(mdio, child, scanphys);
> > +			if (rc && rc != -ENODEV)
> > +				return rc;
> 
> for_each_available_child_of_node() makes calls to of_node_get() and
> of_node_put(), so when jumping out of a loop it is necessary to call
> of_node_put(), in this case of_node_put(child).
> 
> As flagged by Coccinelle.
> 
> Also flagged in of_mdiobus_find_phy() both before and after this patch.
> 
> > +
> > +			continue;
> > +		}
> > +
> > +		addr = of_mdio_parse_addr(&mdio->dev, child);
> > +		if (addr < 0) {
> > +			*scanphys = true;
> > +			continue;
> > +		}
> > +
> > +		if (of_mdiobus_child_is_phy(child))
> > +			rc = of_mdiobus_register_phy(mdio, child, addr);
> > +		else
> > +			rc = of_mdiobus_register_device(mdio, child, addr);
> > +
> > +		if (rc == -ENODEV)
> > +			dev_err(&mdio->dev,
> > +				"MDIO device at address %d is missing.\n",
> > +				addr);
> > +		else if (rc)
> > +			return rc;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  /**
> >   * __of_mdiobus_register - Register mii_bus and create PHYs from the device tree
> >   * @mdio: pointer to mii_bus structure
> > @@ -180,25 +218,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
> >  		return rc;
> >  
> >  	/* Loop over the child nodes and register a phy_device for each phy */
> > -	for_each_available_child_of_node(np, child) {
> > -		addr = of_mdio_parse_addr(&mdio->dev, child);
> > -		if (addr < 0) {
> > -			scanphys = true;
> > -			continue;
> > -		}
> > -
> > -		if (of_mdiobus_child_is_phy(child))
> > -			rc = of_mdiobus_register_phy(mdio, child, addr);
> > -		else
> > -			rc = of_mdiobus_register_device(mdio, child, addr);
> > -
> > -		if (rc == -ENODEV)
> > -			dev_err(&mdio->dev,
> > -				"MDIO device at address %d is missing.\n",
> > -				addr);
> > -		else if (rc)
> > -			goto unregister;
> > -	}
> > +	rc = __of_mdiobus_parse_phys(mdio, np, &scanphys);
> > +	if (rc)
> > +		goto unregister;
> 
> Jumping to unregister will call of_node_put(child),
> however child appears to be uninitialised here.
> 
> Flagged by clang-16 W=1 build, and Smatch.
> 
> >  
> >  	if (!scanphys)
> >  		return 0;
> 
> ...

-- 
	Ansuel

