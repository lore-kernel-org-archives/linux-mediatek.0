Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A95CC48BC4
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Feb 2024 22:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/y5qpq3uF2po3jkaK8CtNhWm1biK0mglGlG7nCOk+Q=; b=pwUsBo+KD+JLsYz3v7gWtYY3Du
	2quF3VozK9+4rG7zR6WeIfu7w0QYktGGCBLb7YPdfug+tmRwSW5cblZclGQpfQBAeKNrzG/g+gjGC
	lEYVLT+5Vh0UzHu9Sjj5U5paoO0uOb9kgQDMnyLXsKzhDpionPOkZ68U1vlDe9bK95A3Uy1iik7/C
	Gak0zGDWHg3SgFFsMilOC9SWnHp4ZLyEuBwxX4PNXbLBq6FEkvnDjhrYZwYMmDpWvhOTu2N+Sactw
	/Ot7U9gLF5iBnzBbeqJxgJFWycaHg9p6F3bndO6ecLjlSCol/t54YO0UscVvAg2ZSb2p+P34Hu/pQ
	vvWS7Z0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbT4b-00000006VhJ-1x2P;
	Sat, 17 Feb 2024 22:22:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbT4X-00000006Vg4-0g7F;
	Sat, 17 Feb 2024 22:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=d/y5qpq3uF2po3jkaK8CtNhWm1biK0mglGlG7nCOk+Q=; b=IGuZAJv46IilCO1EOeTEdr/OKc
	Ekt8q/pK20nszsr5XQFOS0VjbUq9e84AIARYog7v8zSxVav9pnVXl/Qsc1FGCRLAka6kjqQx1zysx
	oN5p07q8ZALxEMPQ0kZHo4sazDApO7BcIzOcHiw/nJ7IQVZqcErgi7xkp7DsrgSE7eR0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rbT44-0085gT-3i; Sat, 17 Feb 2024 23:21:44 +0100
Date: Sat, 17 Feb 2024 23:21:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
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
Message-ID: <a804e21d-fe1d-41e8-90fd-64b260c9bcc7@lunn.ch>
References: <20240217194116.8565-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217194116.8565-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_142213_246006_E8570F1D 
X-CRM114-Status: GOOD (  16.36  )
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

To me, this makes the code look ugly. I also expect many text editors
which understand indentation will be unhappy, saying the indentation is
wrong.

>  64 files changed, 737 insertions(+), 291 deletions(-)

These statistics are not good. If you had deleted more lines than you
added, then maybe it might be an O.K. idea.

Sometimes KISS is best.

	Andrew

