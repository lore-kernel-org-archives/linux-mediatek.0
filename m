Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA85C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 17:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdVRObo32aWz8f8kgjwheJhKiMZUR4c7isPKuP93/wU=; b=pX4eNbpKeosG4HQXV1yYRy0lHP
	gq2O96VYqT2CBfAnoatJ5E9spu8dIbftUo3j5mgg5Yb4rW1xa02Uaxi2xlXkJJMqLCqmivynjcJ8w
	IVx1fdRa1OxF9Z7uhGcXPF2Dy+TefSXCpDe6RMn2V1rD8IjleiL4l/IdWZZLvYjEMojY0f0lKocYi
	g606a2sL/a/nP+qSppBtc8oYdr2fERyvWKi1U41C2I0bdVAhi4g9OXwdCJ897OibouFCMeJkuaWaH
	HZVrtpQTkiOruqpjX/5Iu7gCo3kBBkbQOf/VQrf7n3xCNrb38UxMX6JA+O9MfxupHod6xavpTE7/t
	xonEw6Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wpD-009abu-37;
	Sat, 25 Nov 2023 17:52:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wpA-009abL-0m;
	Sat, 25 Nov 2023 17:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MdVRObo32aWz8f8kgjwheJhKiMZUR4c7isPKuP93/wU=; b=urx7XhfBX0iP+Qbhwb87KAvF9k
	oQo7eZJ9HxvOzzfkiRwavlt3zCsDVtFbuWud3BdkXZGJLfR5/GXGMc9qrS2/pEMwWbwvuPnmIhzP8
	fY9q5+ZtkyA5T7nZGlIaXtmbC9z4j0XzrinGqYFBgcHUiaroB3sgoHUzeWj0JvQC0FTM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r6wos-001Cba-Ao; Sat, 25 Nov 2023 18:51:54 +0100
Date: Sat, 25 Nov 2023 18:51:54 +0100
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
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH v2 01/11] net: phy: extend PHY package API
 to support multiple global address
Message-ID: <a8ce4503-c24d-4d6e-91ec-d03624b31fe0@lunn.ch>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
 <20231125001127.5674-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125001127.5674-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_095212_281981_8A9CDE51 
X-CRM114-Status: GOOD (  21.38  )
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

On Sat, Nov 25, 2023 at 01:11:17AM +0100, Christian Marangi wrote:
> Current API for PHY package are limited to single address to configure
> global settings for the PHY package.
> 
> It was found that some PHY package (for example the qca807x, a PHY
> package that is shipped with a bundle of 5 PHY) require multiple PHY
> address to configure global settings. An example scenario is a PHY that
> have a dedicated PHY for PSGMII/serdes calibrarion and have a specific
> PHY in the package where the global PHY mode is set and affects every
> other PHY in the package.
> 
> Change the API in the following way:
> - Make phy_package_join() require a list of address to be passed and the
>   number of address in the list
> - On shared data init, each address is the list is checked and added to
>   the shared struct.
> - Make __/phy_package_write/read() require an additional arg that
>   select what global PHY address to use in the provided list.

I think this is overly complex.

I would rename struct phy_package_shared addr to base_addr.
phy_package_join() would then pass the base address of the package,
which is the same as your reg property for the package in DT.

I think all current users of devm_phy_package_join() already do pass
the lowest address in the package, so this should not cause any
problems. Most drivers even call it base address, rather than cookie,
which the documentation uses.

I would then extend __phy_package_read() etc to take an offset, which
is added to base_addr, and the read is performed on that address. All
the existing users would pass 0, and your new driver can pass other
values.

I also think you can split this out from the DT binding. Make it two
patch sets. One patch set is about extended the package concept to
allow access to global registers at addresses other than the base. The
DT patch is about properties which are shared by the package. These
seems like two mostly orthogonal concepts.

    Andrew

