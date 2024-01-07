Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE6DC47073
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Jan 2024 18:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jaV7ovbzbIte+b19ohi0bhK6HoVIw2c2WB+T5GbL3w=; b=YZKtKvRUVsdR/vIdZheUfq/rNm
	dxNP8hyWr65UwYkIZFXD2gEX4dkVHTZj2X5AjhVsvNqLgHYTC+moNjDit27V0xoIVJqU+ieBGzGgi
	oYKECYCVHC9Z81UtPmve+YqpHWmwmhDcFDSaasVkyGWDXadTQ5w4zPtGkOlIOHqVuGNuzZhLGZ4Jw
	kRLHIrVlEObSuv0iBWTqv6O3o9Qf7OjSmdx/u2RfBbMO9t6NepDyXjh96/Why1nl1Eb2RCIuRQ4Ea
	+GNQHPYwxWajdKimLH/rUhw/4tmNHpaUOIhA1OWpFgFS3kV3jM+fNCtEBvFF0sIW8jy5nMFnI1kZr
	aGHP0K4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMY8k-003OGc-2s;
	Sun, 07 Jan 2024 18:44:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMY8h-003OG8-3A;
	Sun, 07 Jan 2024 18:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0jaV7ovbzbIte+b19ohi0bhK6HoVIw2c2WB+T5GbL3w=; b=zVfDGiXp6wfbV4hPykKINDsu5o
	bTNMbvJfQbUbj+0Yq4aQOmAJzZjomgTN6WGOFgvTmV14HyQ17z0v39+IkD3N89/rL0nbaor+uITc5
	lcxAn35uNW/cP0ogR2PHGYr7s3Vqu5wHzHa8nx8eSX3C7niVUEGzmGxC5xA6oKpmV3aI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rMY8S-004aGA-Bh; Sun, 07 Jan 2024 19:44:36 +0100
Date: Sun, 7 Jan 2024 19:44:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Vladimir Oltean <olteanv@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <a6a155ab-0852-4f08-b49b-952ac74124a8@lunn.ch>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-2-ansuelsmth@gmail.com>
 <0926ea46-1ce4-4118-a04c-b6badc0b9e15@gmail.com>
 <659aedb1.df0a0220.35691.1853@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <659aedb1.df0a0220.35691.1853@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_104452_089079_35EE0A51 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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

> Honestly I would postpone untile we have a clear idea of what is
> actually part of the PHY and what can be handled externally... Example
> setting the clock in gcc, writing a specific driver...

That is really core of the problem here. We have no reliable
description of the hardware. The datasheet often starts with a block
diagram of the PHY package. Sometimes there is a product brief with
the same diagram. We need that published. I'm not asking for the full
data sheet, just the introductory text which gives a high level
overview of what the hardware actually is. Then we can sketch out a
high level Linux architecture for the PHY package.

     Andrew

