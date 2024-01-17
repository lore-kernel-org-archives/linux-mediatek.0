Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61708C47DA2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jan 2024 20:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6Lc/SpeoZHjRLO/GO2tIVDi6ZtvIYMTaxkExG+20Jo=; b=DETISsF/3PH5cyI2kf4sDb2zNe
	az8r8uIcjlWOdkwVCMqA40XfVs7uk1v7JnxEt7pvgqKwRWAcAs8Lc5CtHAG1UwfGVGAyZjQdaeA9O
	KaIFo/WaDPQnsf5ljN2TCkgvV7h/RK7sZ5DbhSeA6kxwWwZ+zL5lfyTj+fszjt8fqZ4xSzDoBngyh
	RkT4oYIgs1sLXanoqtSsb4PGE0OhoI/E5Shl8lASSXPppPnUjjIWoXDClju1B/ZiJESAWkYPwhDBV
	easUZoedf6YwmqpGkmMvfsxdGVr2/sIBlTrz209n/XhQGoczm2+SHFit36Tt1JcG3Kz6zXWlAaU9Z
	a5rzVU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQCAB-000bBp-0u;
	Wed, 17 Jan 2024 20:05:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQCA7-000b7p-0c;
	Wed, 17 Jan 2024 20:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=R6Lc/SpeoZHjRLO/GO2tIVDi6ZtvIYMTaxkExG+20Jo=; b=3draHPj8t5mDQDFbBv4roebFZx
	rwjM497PSAeoci7h2LvI2jrqsw8Hz3hd6mcxMjkS9fZ7AvRicv5INfMox2ULL+byoce8Qy96RlaJ8
	6gp2gJNqNNV5cBwWN/HW0GI94olfSl2G0a4AA6QCGCBLJ50sDfFGQkVyK9a1R9vxLMLw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rQC9m-005Qig-J3; Wed, 17 Jan 2024 21:05:02 +0100
Date: Wed, 17 Jan 2024 21:05:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
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
Message-ID: <1fb9448f-c2c8-4e01-aa12-5f60f2b49160@lunn.ch>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-2-ansuelsmth@gmail.com>
 <0926ea46-1ce4-4118-a04c-b6badc0b9e15@gmail.com>
 <659aedb1.df0a0220.35691.1853@mx.google.com>
 <0f4ec2ff-4ef7-4667-adef-d065cfbc0a91@gmail.com>
 <65a7210f.df0a0220.d10b2.1162@mx.google.com>
 <c81af808-d836-4054-b596-4a53b05f4c78@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c81af808-d836-4054-b596-4a53b05f4c78@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_120523_254181_48F599A9 
X-CRM114-Status: GOOD (  12.78  )
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

> On one hand it makes sense and looks useful for software development. On
> another, it looks like a violation of the main DT designing rule, when DT
> should be used to describe that hardware properties, which can not be learnt
> from other sources.
> 
> As far as I understand this specific chip, each of embedded PHYs has its own
> MDIO bus address and not an offset from a main common address. Correct me
> please, if I am got it wrong.

I don't have the datasheet for this specific PHY. But the concept of a
quad PHY in one package is well known. Take for example the
VSC8584. The datasheet is open on Microchips website. It has four
strapping pins to determine the addresses of the PHYs in the
package. The PHY number, 0 - 3 determine bits 0-1 of the MDIO
address. The 4 strapping pins then determine bit 2-5 of the address.

In theory, each PHY could have its own strapping pins, allowing it to
be set to any address, and two PHYs could even have the same
address. But i doubt anybody actually builds hardware like that. I
expect the base addresses is set at the package level, and then PHYs
are just offsets from this.

So to me, a range property does seem reasonable. However, I agree, we
need acceptance from the DT Maintainers.

     Andrew

