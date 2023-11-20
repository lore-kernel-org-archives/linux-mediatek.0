Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33061C54E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 21:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTiej26Yh66vUupMXOZ8FNGPsbQnKj9z0H8vgIBxYBg=; b=lAzV61lNo2Le7kFGxZoawocMIZ
	2C5CMrUWBrCZ6BW0SjvyztXHRf/IYbu4lfWChmZJ/mk8N3HnfaUQfP9MJLvjjRslDVKWdPABsv51G
	aGvqJerBNR+ZoIoaMxSevs6VifexCkMtXXMZLsj8ZDNmt8JFBM6HwWn0B1LNZbkvEMmgneOeTzW3P
	79Q1AI/qEMHSLt0wMZlo0YIhv90klwmh6Xa0Xy5lwqeoiXDdvI3StQjouN9vkINdCgYT5HDg5ZQai
	hjjnTmwxLrfpcnFQrFIzd34no1aKzOkR99n/XKtngUc/chNqrCnjJ6geTKVH6UI6gGbYMnUyPhwkC
	3PEH7aGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Bly-00EsUn-05;
	Mon, 20 Nov 2023 21:25:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Blt-00EsTX-1a;
	Mon, 20 Nov 2023 21:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vTiej26Yh66vUupMXOZ8FNGPsbQnKj9z0H8vgIBxYBg=; b=LxeEzEeSpN0Fpj0ZYVs+2MyM++
	NMvgFyArPgGSngt3mWVaHMhRnEUzvoPGekmJsYhOZyMaSqYEdUzNiE0qlvMSpLwsU3d72pBf2863c
	n3u2XkWDfI9BiRlKHJK2mD+1hPOzTWQhpTqTJCKOsLPUMEzkYu8wdHMC+pHcXfo+Udl0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5BlW-000h20-H5; Mon, 20 Nov 2023 22:25:10 +0100
Date: Mon, 20 Nov 2023 22:25:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
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
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <45784368-93e0-4d57-bb0c-5730f53f5a08@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <655bc8d6.050a0220.d22f2.315f@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655bc8d6.050a0220.d22f2.315f@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_132533_816091_4DB4F623 
X-CRM114-Status: GOOD (  10.76  )
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

> A real DT that use this is (ipq807x):
> 
> &mdio {
> 	status = "okay";
> 	pinctrl-0 = <&mdio_pins>;
> 	pinctrl-names = "default";
> 	reset-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
> 
> 	ethernet-phy-package {
> 		compatible = "ethernet-phy-package";
> 		phy-mode = "psgmii";
> 
> 		global-phys = <&qca8075_4>, <&qca8075_psgmii>;
> 		global-phy-names = "combo", "analog_psgmii";
> 
> 		qca8075_0: ethernet-phy@0 {
> 			compatible = "ethernet-phy-ieee802.3-c22";
> 			reg = <0>;
> 		};

...

> 	};
> 
> 	qca8081: ethernet-phy@28 {
> 		compatible = "ethernet-phy-id004d.d101";
> 		reg = <28>;
> 		reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
> 	};

I've no idea if DT allows this. The issue is that reg is the same for
both nodes within the ethernet-phy-package container, and
ethernet-phy@28. They are all addresses on the same MDIO bus.  We are
parsing this bus structure ourselves in __of_mdiobus_register(), so we
could make it work, but i don't know if we should make it work.

      Andrew


