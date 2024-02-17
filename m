Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F32C48BC4
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Feb 2024 19:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrLeVjW0ciuJszz4zjPY8G3BJ5RGtt3yEGrW/DSBE6s=; b=r8CiCywz9qRpEibdM+cfKhJRYd
	zy1clFtfj9cplL223fb8CldLZhqvU52yYlZfXjj15AlSMA2sFZDMDV8fTg0FthskHu+e3btvIN1oS
	Wlu0XEC9YYX1EmfwbL01uMak0t2XrJl4fThkGuPnoeKU9fFcs7tt8KTdHw+iGbFnJM0jWagmK1hF+
	KIqPA1oXyXAU1c4FVShVOLjUNdt0ZsGCmnKd9YB57JA/kiO05fsd2oBihPSqgBQpOUEUgF6dCNFFm
	dGGkTcXfU18j7Atc1Rni42zIv4gFO7mYdu63/1nsN79IdBe8ET4ixiYPs0JdsCA91WCJcHr1v3WP6
	veIAf4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbQld-00000006GrB-0nfM;
	Sat, 17 Feb 2024 19:54:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbQlY-00000006Gq5-0ruN;
	Sat, 17 Feb 2024 19:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wrLeVjW0ciuJszz4zjPY8G3BJ5RGtt3yEGrW/DSBE6s=; b=MRU7aZcE2NM7dNQziM3PQNJsnH
	Ky1yXYghGe0xrGkHqqC34Lq74gMVRokiF+u13tk9DIaBxx+dL5y1u/9B1bMTOCxUnlzhMA/3Eb2XN
	PyubFSsl5G++haDa/a6L8VQBQBTO7LKBnr0z5y0fRYPzSXO4o90EciWf3dnqGo2AL3EvTn6/kPpex
	gyYjvZ+OrGkD3a3pxQUD8byvavOYL2OTaFZwD/1ATO+N01uyn60PuOMyulb6Q/F61I65NMYr0CmPp
	N1r5JxCcahrParQlxVKDsIzLQcbnM+bls8Tm4Hn62mHdnpTfQyj0+ep6OX4MzIFaUi7LTljqyfvPk
	rABGBg8w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38274)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rbQkT-0008E1-2M;
	Sat, 17 Feb 2024 19:53:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rbQkG-0006lB-8R; Sat, 17 Feb 2024 19:53:08 +0000
Date: Sat, 17 Feb 2024 19:53:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	UNGLinuxDriver@microchip.com, Peter Geis <pgwipeout@gmail.com>,
	Frank <Frank.Sae@motor-comm.com>, Xu Liang <lxu@maxlinear.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	Andrei Botila <andrei.botila@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Robert Marko <robimarko@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, rust-for-linux@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 0/3] net: phy: detach PHY driver OPs from
 phy_driver struct
Message-ID: <ZdEOpB1oVDE8+Qhq@shell.armlinux.org.uk>
References: <20240217194116.8565-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217194116.8565-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_115428_274761_F901CBD2 
X-CRM114-Status: GOOD (  22.07  )
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

On Sat, Feb 17, 2024 at 08:41:11PM +0100, Christian Marangi wrote:
> Posting as RFC due to the massive change to a fundamental struct.
> 
> While adding some PHY ID for Aquantia, I notice that there is a
> big problem with duplicating OPs with each PHY.
> 
> The original idea to prevent this was to use mask on the PHY ID
> and identify PHY Family. Problem is that OEM started to use all
> kind of PHY ID and this is not doable, hence for PHY that have
> the same OPs, we have to duplicate all of them.
> 
> This is present in Aquantia PHY, but is much more present in
> other PHY, especially in the BCM7XXX where they use a big macro
> for common PHYs.
> 
> To reduce patch delta, I added the additional variable without
> adding tabs as this would have resulted in a massive patch.
> Also to have patch bisectable, this change has to be in one go
> hence I had to use this trick to reduce patch delta.
> 
> Other solution to this problem were to introduce additional
> variables to phy_driver struct but that would have resulted
> in having 2 different way to do the same thing and that is not O.K.
> 
> I took care to compile-test all the PHY, only exception is the unique
> RUST driver, where I still have to learn that funny language and
> I didn't had time to update it, so that is the only driver that
> I think require some fixup.
> 
> I posted 2 example that would benefits from this change, but I can
> find much more in other PHY driver.

Would it make more sense instead of this big churn, to instead
introduce into struct phy_driver:

	struct mdio_device_id	*ids;

which would then allow a phy_driver structure to be matched by
several device IDs?

We then would not need to touch any of the existing drivers initially,
and a later cleanup could be to identify those where all the ops are
the same for several phy_driver structures, and convert them over.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

