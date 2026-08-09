Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D330C5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Us/yxeZ6wwubj5U9xONB7RaidvSHc+eag+wpQLfxyCY=; b=BaYlcWOzhIB+ksna72K2d40MtN
	zCEm/N3Y34QRngLvTdfP9SCA+YYVrfQdy+wa8Pr1fTFJYWxgjOeOCb4FDT/U4qmyzvvffQXeLxeE6
	S+Nhd4at3TqnCv6/LYRoLZ6l00wwEw6eDrqm6e24PGfyyuLIL0os1L0MQ12kgBVE0CYSF91+skC9l
	qnpMFyMB7sMehI9Ts/gBiAU0Cx38486iA9cWMpqzh+MFI4KXb/TfU/hGFQZraXq6oqG9oxSpa3bBn
	bzGSSP5TqE0l4IMb0Ky1bkkr9GaF438o86i2uygtn+LBBttJqshYCb1xpowyHWAZilqNspAZO+xPh
	m9OrePhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7Lh-0000000AXkW-0Orw;
	Sun, 09 Aug 2026 17:30:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7Lf-0000000AXjo-1BG0;
	Sun, 09 Aug 2026 17:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Us/yxeZ6wwubj5U9xONB7RaidvSHc+eag+wpQLfxyCY=; b=ODwcXe2sSCRkqUjH85Q4ytEYcF
	o0exTbl/kVkQJGsfGyBbJhxvTIVvCpz4cfLZ2lQ426doZbZUW8iQVsXw/2KbbCygnJJRgQw0AsYAf
	qZD3b4FDJltbS8VeURY4R+m2ACmY3xsOr25Mhb6hWTAbHbPV6B9i+/TGF8RnxRK/WEHk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wt7LT-00GpsI-AI; Sun, 09 Aug 2026 19:29:59 +0200
Date: Sun, 9 Aug 2026 19:29:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v11 04/12] net: phylink: save phylink instance
 fwnode on phylink_create
Message-ID: <351e90da-88bd-4dea-b75f-d848fe465ba1@lunn.ch>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807131301.192060-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_103011_325139_C8D1EEE6 
X-CRM114-Status: GOOD (  11.34  )
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

On Fri, Aug 07, 2026 at 03:12:46PM +0200, Christian Marangi wrote:
> The firmware node associated with the phylink instance might differ from
> the device firmware node passed in phylink_config as such device can
> reference the parent switch or other platform peripherals.
> 
> Some function might need to reference this firmware node after
> phylink_create so add a dedicated fwnode entry in phylink internal struct
> and save it on phylink_create().
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

