Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5398C636BD
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 16:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iy9DkvTUULFctuQ4J2jQdgB4mi9Zm+S/Is3pyIli3pE=; b=yvoQ64gmGh9fBTmwYhn5F+ZFbq
	xFpjZUoBOgCHkToIAMIN1uX2aV6TnXzGFNsT/nK4s+Fhl1Aw0qDEqaGkl2mbBb1gOdNq/OS+2ldbW
	NuOkDiJpVsihxA/D1HGO3W4rJDmJUmzX44riDl50vmKVMh8WJ7EIjo7/PAvJhI7iqceakm2r0je+/
	GTozEURvaribja+eVt2g85aERYG2jusWEQgzTzD7ldyvWrBg/TVyrrY1zxOicZMaAEXJYOZWdrj9z
	I9BSDJoUvFB1cJYebsr78zhVDl+6PTSdyGQZGWbPwLsVzDzFDrCYwJSQN++VJZirbenwK+7jRzo3J
	QWfob09A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ZWf-007jk4-21;
	Fri, 24 Nov 2023 16:59:33 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ZWc-007jgd-0x;
	Fri, 24 Nov 2023 16:59:31 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50970c2115eso2812221e87.1;
        Fri, 24 Nov 2023 08:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700845167; x=1701449967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iy9DkvTUULFctuQ4J2jQdgB4mi9Zm+S/Is3pyIli3pE=;
        b=TU8kdzw8RD07QUyjXdgIBKlDaMOuuDttLMnkPvwi3hCYw+89Jbj85ZHSZ2t3oxChGj
         SE0AMqnRnzQFOxVnXKPi9j1Br0xT+M9fn1l4xjarmYdcz/6qw6j91tliiXftvASHzlGG
         ptNnz6NmrOQInzQ6YYcoardPVop4goyPVy8Jze/IeoVcCck9yRQFSzjCRfTXV43t0qf/
         N9/oRyQjGm08NGXf1HU5eqikDm12FCH8JKnaI/P3lqT0NGiG4w0w62PU4DpyJWcsNlpo
         eu8Ukpor6e/jJDCfhR/TiVPL2cw/vBYFzP4D/7XOXeeG9QOGTbUfdirWf52JauxOkTaL
         TqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700845167; x=1701449967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iy9DkvTUULFctuQ4J2jQdgB4mi9Zm+S/Is3pyIli3pE=;
        b=bWfTmZlSBz34OvLCm3cozG1rMYBblwtjr+xJch3fvJp62r9ANVgO0awnLoCE9Q6ERc
         58CatuWTg66CByIt5J7oV84oYulBLpXZ74PqpHqwbrs4kuPgvZQyRYt0wE12w1NI4Ali
         vXjrjFRgQnKnl0WpXNwd24rDZxuKI0hEGZj34FsJvrGSCL52EYekMRuqKHxFB3XkAuqU
         BPrIeGefmuOqFSJUu1g/MLg6Kp+XdKP6sFNpLDJpZA9Tw/FBM3yBmIDyYVOKb26Nh1Yo
         uF6ixhA4URiPIwLGq3J2Zy4/p88r1eT0eAgYgiTcMimWxZMTesligp0mgP7iXGGWpKlN
         9HYA==
X-Gm-Message-State: AOJu0Yy6kqhMc4tsPDe97FFvDdSEYlmjIY8Hjin5BHUwuGnBTLePbfua
	1+f5fwtDYnNMAwMiLUIl0Y9OdcwLr5NGNA==
X-Google-Smtp-Source: AGHT+IFTZsO8j04BNlT9aZP8j1EV20GYlvavfH+NA2vrjMwE44V/a5r9I8YYhnUfcmph4nIUYbEn1g==
X-Received: by 2002:a05:6512:ba1:b0:503:221:6b1a with SMTP id b33-20020a0565120ba100b0050302216b1amr3522725lfv.0.1700845167083;
        Fri, 24 Nov 2023 08:59:27 -0800 (PST)
Received: from skbuf ([188.26.185.12])
        by smtp.gmail.com with ESMTPSA id gx26-20020a170906f1da00b009ad89697c86sm2296113ejb.144.2023.11.24.08.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 08:59:26 -0800 (PST)
Date: Fri, 24 Nov 2023 18:59:23 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <20231124165923.p2iozsrnwlogjzua@skbuf>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_085930_336605_006FE45E 
X-CRM114-Status: GOOD (  31.28  )
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

On Wed, Nov 22, 2023 at 07:32:22PM +0100, Christian Marangi wrote:
> Sooooo.... Sorry if I insist but I would really love to have something
> ""stable"" to move this further. (the changes are easy enough so it's
> really a matter of finding a good DT structure)
> 
> Maybe a good idea would be summarize the concern and see what solution
> was proposed:

Sorry, I didn't follow the entire discussion. I hope I'm not too far off
with my understanding of your problems.

I think you are hitting some of the same points I have hit with DSA.
The PHY package could be considered an SoC with lots of peripherals on
it, for which you'd want separate drivers. Just like a DSA switch would.
I don't think it's exactly phylib's place to deal with that, just like
it's not DSA's place to deal with complex SoCs, just with the switching
IP (like the Ethernet PHY IP for phylib).
https://lore.kernel.org/lkml/20221222134844.lbzyx5hz7z5n763n@skbuf/

Why does the ethernet-phy-package DT binding attempt to be so grand and
generic? I would expect the 180 degree opposite. Make it have a _single_
compatible of "qcom,qca807x" (but don't use an "x" wildcard, do specify
the full package name).

Make it have a "reg" property which is the base MDIO address of the package.

Write an mdio_device driver that probes on that. The PHY core already
knows that if a child on the MDIO bus has a compatible string of the
normal form (not like "ethernet-phy-id004d.d0b2"), then it's looking at
an mdio_device.

Make the OF node of the package have an "mdio" child with its own
compatible string, which represents the place where PHYs are. The driver
for the "mdio" child has a very simple implementation of the mii_bus
ops, which just calls into the device parent (it can assume a certain
parent implementation and private data structures).

Lateral to the "mdio" child node of the "qcom,qca807x" package node, you
could put any other device tree properties that you want.

Make the mdio_device driver for "qcom,qca807x" use shared code if you
want - but keep the device tree structure hardware-specific. Look at the
compatible strings that e.g. the drivers/mfd/simple-mfd-i2c.c driver
probes on. You could always change the driver implementation for a
certain compatible string, but you'll be stuck with the ultra-generic
compatible = "ethernet-phy-package", which has the problems that you
mention.

> 
> Concern list:
> 1. ethernet-phy-package MUST be placed in mdio node (not in ethernet,
>    the example was wrong anyway) and MUST have an addr
> 
>    Current example doesn't have an addr. I would prefer this way but
>    no problem in changing this.
> 
>    Solution:
>      - Add reg to the ethernet-phy-package node with the base address of
>        the PHY package (base address = the first PHY address of the
>        package)

Correct, what I'm saying is compatible with this.

> 
>        We will have a PHY node with the same address of the PHY package
>        node. Each PHY node in the PHY package node will have reg set to
>        the REAL address in the mdio bus.

If the real PHY IPs are children of the package rather than on the same
level with it, I don't think this will be a problem. I wonder if some
address translation could be done with the "ranges" device tree property.
I've never seen this with MDIO though.

> 4. Not finding a correct place to put PHY package info.
> 
>    I'm still convinced the mdio node is the correct place.
>    - PHY package are PHY in bundle so they are actual PHY
>    - We already have in the mdio node special handling (every DSA switch
>      use custom compatible and PHY ID is not used to probe them
>      normally)
>    - Node this way won't be treated as PHY as they won't match the PHY
>      node name pattern and also won't have the compatible pattern for
>      PHY.
> 
>    Solution:
>     - ethernet-phy-package node is OK given a reg is defined.

I agree that it should sit under the MDIO node. I disagree with the idea
of a standardized binding for PHY packages.

