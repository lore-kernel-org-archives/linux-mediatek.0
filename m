Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC04FC07E97
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 00:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRzjWx+nGda9tXQJI4n8PlYck74YgGRZXJW9RtNBhRI=; b=F/t7lA1kEcoFVCE+YfFOZ0ZXbr
	IiI6iw9jJ80/YURIRUURjgva39FhlpgbOxtW/sMsys2VVzz4DYw4FA2oeiskwlQvrbbxp4qf/YQzL
	MnbQTZOmRj3+h/W4Pq2OZ4d3xIAt4E7Hs/5ts59b+nhoNgXktTNl67zu8F4HAKW1JPDtZKLwdr16D
	GnBfni1NOe/JTiVWbVVevquUHSDOL3339Fh4L4XYnQb8xBwP0cHu6WbYpnk1J7WeosiWBUQPtcM+F
	iDezDMcoN5dtmcntNuDwA3io5p9CmjA4Bp7rwCldAJGTw6D4Lok91Bcpq8EMG/GCbHSy0NaXt7hRp
	SeggdqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7m8A-003l4D-2s;
	Tue, 28 Nov 2023 00:39:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7m87-003l3b-1Q;
	Tue, 28 Nov 2023 00:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WRzjWx+nGda9tXQJI4n8PlYck74YgGRZXJW9RtNBhRI=; b=akfI6FWSi5E0aCNFACrPmxsP0Q
	Bsk9JtYCr4IBgCup0BKxbeIHxJRoX2cMVNajwTx71CPwK8Ow8zb0IDWO7IJyHHun1FqJFzuQyn+aZ
	6KbHCQOH0nl1uZRWCEP9TYNNHVU34/gS/fwYGzSq8Ex4B/s29NACL/CCvoSqIpBETQSE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r7m7y-001OwQ-Nx; Tue, 28 Nov 2023 01:39:02 +0100
Date: Tue, 28 Nov 2023 01:39:02 +0100
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 2/8] net: phy: add initial support for
 PHY package in DT
Message-ID: <b28b5d10-08cd-4e30-9909-f37834d80c81@lunn.ch>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126015346.25208-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_163911_483728_B60D6BA0 
X-CRM114-Status: GOOD (  14.25  )
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

> +static int of_phy_package(struct phy_device *phydev)
> +{
> +	struct device_node *node = phydev->mdio.dev.of_node;
> +	struct device_node *package_node;
> +	u32 base_addr;
> +	int ret;
> +
> +	if (!node)
> +		return 0;
> +
> +	package_node = of_get_parent(node);
> +	if (!package_node)
> +		return 0;
> +
> +	if (!of_device_is_compatible(package_node, "ethernet-phy-package"))
> +		return 0;
> +
> +	if (of_property_read_u32(package_node, "reg", &base_addr))
> +		return -EINVAL;
> +
> +	ret = devm_phy_package_join(&phydev->mdio.dev, phydev,
> +				    base_addr, 0);

No don't do this. It is just going to lead to errors. The PHY driver
knows how many PHYs are in the package. So it can figure out what the
base address is and create the package. It can add each PHY as they
probe. That cannot go wrong.

If you create the package based on DT you have to validate that the DT
is correct. You need the same information, the base address, how many
packages are in the PHY, etc. So DT gains your nothing except more
potential to get it wrong.

Please use DT just for properties for the package, nothing else.

       Andrew

