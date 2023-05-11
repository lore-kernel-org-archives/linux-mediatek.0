Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FACC77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibAhBAmHJ6yhyzj5+F05uayDJSz9alO8DnKaHYwkNGo=; b=Z4no8d7s0bzEtv0kEVRXUg1i+h
	s6vKchVmx6cyMnmJqL+7NmCyng/Je/s9LT0qGREOqeeZdS/QXkuAgBo1XW/K1kjWslGbHsc8qOkjn
	gnRD3Ud5OpfpJuhm6Abd4y1ck95l1iEKLT0lHm+mWHxjKWWcWrr1g2F6TbFEF4bMNcC5I7xtxjmso
	9hEUhxfw6Dku4qkOQ3Y4Ormlwv2rUXIfT+8Nu7NNw8ZT3FA8il0zc23RBKfJbabpjYAY0RXgjBMDl
	U9zT5Dh5MQ/dpa+Fq7LuNSh8aFTVJ6xmzD6l+ldnmR4IKsHSGK/3QvBDvjDgyCdOwi/7y04fg/FBR
	mqghV6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px8c7-009Gv2-1x;
	Thu, 11 May 2023 15:53:55 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px8c5-009Guh-34;
	Thu, 11 May 2023 15:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ibAhBAmHJ6yhyzj5+F05uayDJSz9alO8DnKaHYwkNGo=; b=QjzBruMZVWmsLGFgP/8XSOWzSa
	fic6mBKMi1ZsiehY2fVf9u/+AdCzgobIb9Rq4rLxf6KlLBoCa8LFkf9Hc56s7DKth8ItHfAUDlHd6
	3xa9RGRIKZiC32Xl2fsjo/Uy6stF+qf7X/GD0c7druyEVaRIAKaGHjz67ukvLPjIQP3lJ38TANMt6
	Nocw5MpCboYa27odXzDnvgGq7Nqdi8Q8U7ZJCgb6SSMpd0tpnZxE6PgBwQIlIcGOyyHD+DUAG4HXW
	GPmwUVgJww1Q904C6D0VwmKj8Aj/zQsW5O5T0uiExs67R/HFh6Ia2Z1bn0aY8jM3j8/e5PV7FGUn1
	b3pcZS4g==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px8c2-008I13-37;
	Thu, 11 May 2023 15:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ibAhBAmHJ6yhyzj5+F05uayDJSz9alO8DnKaHYwkNGo=; b=WJUzN6XHqB3KSjjpPPs4y1a+1f
	+4zCufedEPT+HZ8vqclGBxP0CAyGN0H+jvhMt9a2eb9PgHF2iNQUbJQ5Lvxm/wL5x3nST4cK154m9
	PPyDXvF3Xf9khmN1a9rd0w8/qcdQ7urQt3RfgJCyYAcUGb/TkQcvTqRr40VS1tc8Guy4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1px8bz-00CZfM-6I; Thu, 11 May 2023 17:53:47 +0200
Date: Thu, 11 May 2023 17:53:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Simon Horman <simon.horman@corigine.com>
Subject: Re: [PATCH net-next v4 1/2] dt-bindings: arm: mediatek: add
 mediatek,boottrap binding
Message-ID: <55f8ac31-d81d-43de-8877-6a7fac2d37b4@lunn.ch>
References: <cover.1683813687.git.daniel@makrotopia.org>
 <f2d447d8b836cf9584762465a784185e8fcf651f.1683813687.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2d447d8b836cf9584762465a784185e8fcf651f.1683813687.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_165351_119363_FECF3F8F 
X-CRM114-Status: GOOD (  10.65  )
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

On Thu, May 11, 2023 at 04:10:20PM +0200, Daniel Golle wrote:
> The boottrap is used to read implementation details from the SoC, such
> as the polarity of LED pins. Add bindings for it as we are going to use
> it for the LEDs connected to MediaTek built-in 1GE PHYs.

What exactly is it? Fuses? Is it memory mapped, or does it need a
driver to access it? How is it shared between its different users?

Thank
	Andrew

