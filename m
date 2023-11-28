Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C539C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 12:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGZ/AOFCUofp/Ip1CkJeKXSMao5eFIWJrE7N8FH5Dk4=; b=kw+vQ5K4y2n4MzvtKX3f7frNEe
	KfZpW5K2HhusRz7HX4QePWiY+duZHfwoD0pBbQaRBX54g06CfPeMKoFEkm0vJWnfizosU6rx+NV2T
	QzAh/eZXYxYtq9ykhfSjePNQVY4xvJvuSCBuE5zgMkzK8bqGMMyloCsjf1UPkcfXnuYVdxXZmVamB
	ysCoVQbwjJjIYaGUe1P5iZwwLRA8UjrBItxJd93IifnCdhR19NyUxWBOCBYXc0Y6AjZJeJVUmImXS
	5mZHgDGlznM+932IreKFqLhvzI9omO/8JecmIAmQLllXlzjVdBF7BmBkJ8w8oOJwfGfO990Tipsn0
	ZXfd7L+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7wuD-005GxP-2U;
	Tue, 28 Nov 2023 12:09:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7wuA-005GwP-2Y;
	Tue, 28 Nov 2023 12:09:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40b399a6529so23459315e9.1;
        Tue, 28 Nov 2023 04:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701173366; x=1701778166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oGZ/AOFCUofp/Ip1CkJeKXSMao5eFIWJrE7N8FH5Dk4=;
        b=P27vRNu9KPgK4F6RPV4+gZxBPxVjneEJ0GtD/DJ85/2ZW5/879dtZQUGbJQkE4WxV4
         WhPei4/9bQr9hLK28OyetcfEckEbdM88zQEBIodlbiq9N9Htr+sPbSNAreUDg07k8r0v
         u6/aHSipjMTzS/Nx8vv1unLEvEmPRmP38FaATp8+jpwE9XKy1jXh63I3hdkfu9sEY2rn
         gQNH4IrnfTqWt+NlhJ3381gKzmyO+TZKoX2v0F/WLRKl1e0pJdvRew5Ta0dr6xCijKCr
         CvNhUoDFl4hApgQL5BL5YNdVP9tYjLJ0NJbqwgqDWnpB5yazDSs+v5t+LBiYTYFk6EWi
         zN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701173366; x=1701778166;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGZ/AOFCUofp/Ip1CkJeKXSMao5eFIWJrE7N8FH5Dk4=;
        b=ZYhbmzlZTeS1w4sIMTmOV3M92tcS/TdyoZnidM9VWQZl1uQRuhuwlbgMDv1nT75wx5
         9t9j1v6GoLFNxru6xNjfa2qtfd/TstDV4qBkyw+NLujBM/+7VbiTjoe23DRpJnGZSgeI
         XIg5NZePug0KCVqnV6gX976Rp6jl2yTzMM00AVvKaAyx5IysnIBimcD0XBjZs0BlbncI
         m5JX5UgKT4yFJTl/ZOpFlGv1PawjylpUOHjHUjhFGXZFIz8jTC0SjqVKNX7AlYP0hAsU
         GJhB0Utam7T+HVCDQsRzq1l1NFbvFUzNQowqtBGvE5MjWXgQXoJm2zTB3UTATI17OdLp
         ruUQ==
X-Gm-Message-State: AOJu0YxJvLUuqRG2s9USxUl6gXfYNVmePdMK6J7qzlX2u8s7OF0GTQuw
	w81inMbqqEOLXiR81HbhW0w=
X-Google-Smtp-Source: AGHT+IGbBBv6SLNWzhb+OGjrpkkr9ufbL/wiM7k+E/3ue7yfq8P984X8hsnAh2R7HaBI8aT4sqQLDQ==
X-Received: by 2002:a05:600c:5124:b0:40b:2ad8:579f with SMTP id o36-20020a05600c512400b0040b2ad8579fmr15342645wms.3.1701173366197;
        Tue, 28 Nov 2023 04:09:26 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c501300b0040b4c26d2dasm2231768wmr.32.2023.11.28.04.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 04:09:25 -0800 (PST)
Message-ID: <6565d875.050a0220.d709d.658b@mx.google.com>
X-Google-Original-Message-ID: <ZWXYcwbGdFX0vGMD@Ansuel-xps.>
Date: Tue, 28 Nov 2023 13:09:23 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 2/8] net: phy: add initial support for
 PHY package in DT
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-3-ansuelsmth@gmail.com>
 <b28b5d10-08cd-4e30-9909-f37834d80c81@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b28b5d10-08cd-4e30-9909-f37834d80c81@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_040930_828441_BA7500E4 
X-CRM114-Status: GOOD (  29.90  )
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

On Tue, Nov 28, 2023 at 01:39:02AM +0100, Andrew Lunn wrote:
> > +static int of_phy_package(struct phy_device *phydev)
> > +{
> > +	struct device_node *node = phydev->mdio.dev.of_node;
> > +	struct device_node *package_node;
> > +	u32 base_addr;
> > +	int ret;
> > +
> > +	if (!node)
> > +		return 0;
> > +
> > +	package_node = of_get_parent(node);
> > +	if (!package_node)
> > +		return 0;
> > +
> > +	if (!of_device_is_compatible(package_node, "ethernet-phy-package"))
> > +		return 0;
> > +
> > +	if (of_property_read_u32(package_node, "reg", &base_addr))
> > +		return -EINVAL;
> > +
> > +	ret = devm_phy_package_join(&phydev->mdio.dev, phydev,
> > +				    base_addr, 0);
> 
> No don't do this. It is just going to lead to errors. The PHY driver
> knows how many PHYs are in the package. So it can figure out what the
> base address is and create the package. It can add each PHY as they
> probe. That cannot go wrong.
>

No it can't and we experiment this with a funny implementation on the
QSDK. Maybe I'm confused?

Example on QSDK they were all based on a value first_phy_addr. This was
filled with the first phy addr found (for the package).

All OEM followed a template with declaring all sort of bloat and they
probably have no idea what they are actually putting in DT. We reverse
all the properties and we gave a meaning to all the values...

We quikly notice that the parsing was very fragile and on some strange
device (an example a Xiaomi 36000) the first PHY for the package was
actually not attached to anything. Resulting in all this logic of
"first_phy_addr" failing as by removing the first PHY, the value was set
to a wrong addr resulting in all sort of problems.

This changed a lot (the original series used a more robust way with
phandle, but it was asked to use base_addr and use offset in the PHY
addr, less robust still OK)

If we revert to PHY driver making the PHY package then we lose all kind
of ""automation"" of having a correct base addr. In PHY driver we would
have to manually parse with parent (as we do here) and check the value?

Why not do the thing directly on PHY core?

By making the PHY driver creating the package, we are back on all kind
of bloat in the PHY driver doing the same thing (parsing package nodes,
probe_once check, config_once check) instead of handling them directly
in PHY core.

Also just to point out, the way the current PHY driver derive the base
addr is problematic. All of them use special regs to find the base one
but I can totally see a PHY driver in the future assuming the first PHY
being the first in the package to be probed, set the base addr on the
first PHY and also assuming that it's always define in DT.

If we really don't want the OF parsing in PHY core and autojoin them,
is at least OK to introduce an helper to get the base addr from a PHY
package node structure? (to at least try to minimaze the bloat that PHY
driver will have?)

Also with the OF support dropped, I guess also the added API in this
series has to be dropped. (as they would be called after the first PHY
probe and that is problematic if for some reason only one PHY of the
package is declared in DT) (an alternative might be moving the
probe_once after the PHY is probed as we expect the phy_package_join
call done in the PHY probe call)

> If you create the package based on DT you have to validate that the DT
> is correct. You need the same information, the base address, how many
> packages are in the PHY, etc. So DT gains your nothing except more
> potential to get it wrong.
> 

For the sake of package join, only the reg has to be validated and the
validation is just if addrs makes sense. Everything else can be done by
PHY package probe once.

> Please use DT just for properties for the package, nothing else.
> 

-- 
	Ansuel

