Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9D0C5AD49
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Jun 2025 21:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNR/B7AqzdKfH857DzdE8tOVpJSvBSdIIAm71LoG8+Q=; b=09mqWsGj0FeJbLVVit/g6IsLno
	Am+Eg3NDYlIb+zsop0wl2NYZj4vAKcvsoJGW9rk2mmQJiXpm6+QhEo3HoRqbCcCejdguma0KNqZWT
	0nfaGKfatOVXHvbtRd0cnl2r9R/B7UF8trSRpfHx0wc47NihJpNGN2AR7pSeqR0/4u/GR3ch+zvqM
	IMz+foP6eIimUasxHEuH8pTyM0pyv7t5+gR3MSi7aY9GHNb34BSZ79B7CLd636zpi21JRz/gUxEqh
	26+cB1/0RHWrIDoHSAuzrXF0OO7vF2jMkLzb1X+weEaer9jmj4USbyvADvvBQowAz9wORwjJktlwf
	R9f6sCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONxu-000000032Up-1HK5;
	Sun, 08 Jun 2025 21:54:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONcW-000000030Ld-2H9c;
	Sun, 08 Jun 2025 21:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cNR/B7AqzdKfH857DzdE8tOVpJSvBSdIIAm71LoG8+Q=; b=w9VG/uwrH6ldVIbDNCSzexwlcA
	0IkhUzqmyvjr8S5smyyX/m9une4wVH4uaSieDcpqc0vdEgdI/OJckwaOmoF0++WOuysWVwbdKKNOO
	DZiNCTs/0sijtcNrgbwvQmednFxrbPPUH+WXRH8ZYxfB17hNyUJj3xP7iMFp8IU13dFI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uONcB-00F6it-L9; Sun, 08 Jun 2025 23:31:39 +0200
Date: Sun, 8 Jun 2025 23:31:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v3 12/13] arm64: dts: mediatek: mt7988a-bpi-r4: add sfp
 cages and link to gmac
Message-ID: <934b1515-2da1-4479-848e-cd2475ebe98d@lunn.ch>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-13-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608211452.72920-13-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_143200_579408_0C9574C1 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: Landen Chao <Landen.Chao@mediatek.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Johnson Wang <johnson.wang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jia-Wei Chang <jia-wei.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> +&gmac1 {
> +	phy-mode = "internal";
> +	phy-connection-type = "internal";

ethernet-controller.yaml says:

  phy-connection-type:
    description:
      Specifies interface type between the Ethernet device and a physical
      layer (PHY) device.
    enum:
      # There is not a standard bus between the MAC and the PHY,
      # something proprietary is being used to embed the PHY in the
      # MAC.
      - internal
      - mii
      - gmii
  ...

  phy-mode:
    $ref: "#/properties/phy-connection-type"


so phy-mode and phy-connection-type are the same thing.

> +	/* SFP2 cage (LAN) */
> +	sfp2: sfp2 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c_sfp2>;
> +		los-gpios = <&pio 2 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&pio 83 GPIO_ACTIVE_LOW>;
> +		tx-disable-gpios = <&pio 0 GPIO_ACTIVE_HIGH>;
> +		tx-fault-gpios = <&pio 1 GPIO_ACTIVE_HIGH>;
> +		rate-select0-gpios = <&pio 3 GPIO_ACTIVE_LOW>;
> +		maximum-power-milliwatt = <3000>;

sff,sfp.yaml says:

  maximum-power-milliwatt:
    minimum: 1000
    default: 1000
    description:
      Maximum module power consumption Specifies the maximum power consumption
      allowable by a module in the slot, in milli-Watts. Presently, modules can
      be up to 1W, 1.5W or 2W.

I've no idea what will happen when the SFP core sees 3000. Is the
comment out of date?

	Andrew


