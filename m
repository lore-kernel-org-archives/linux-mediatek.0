Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E69C5B552
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Jun 2025 21:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/mQ7BoLcVrO59Xnl3ZQlHndr969rCpRyg45FKaGvoI=; b=B1B2WFPAsiHiocBwwDv6umBA6Y
	JHZ/q2h4scLFhJaXo6CEgtVv+8qbUa/NtKasn9zW1JEpmxaqLbiP2wM9vjQf09UwUR7oKLqy3d3rY
	//R+cDIRyFMqfFjkoVzI5X/m3GpPnXxGWpFup3/O5KGW5wYkiIg3ElwvXCG6yWeJ1rgG9FnVRMvh3
	PKFQGBe9go2HSoRAjFMtSMCqrGDvciZ2RNVO62NE7HSDH4ZA6/+e1rX4tyiiGiSDjwlRyBuHxseoR
	FeEtuIojwlusdvU3A5mRioMtX7y2h0C7AzuIt6jbywa/+JRMp+cbXMhHfKfomHtEv3jBzUmsCrRN2
	55zXzTfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONvp-000000032FG-09PW;
	Sun, 08 Jun 2025 21:51:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONWF-00000002zqE-35FP;
	Sun, 08 Jun 2025 21:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=E/mQ7BoLcVrO59Xnl3ZQlHndr969rCpRyg45FKaGvoI=; b=TKVshFrl5DXthqifrs05BGdJyK
	m8KjuamhBugZEL/wfcv5dN1DjtwKrWBClnWVuqVwuPgQd1VAe48o6HiestzuDpnHgwFmkwUJG7mKM
	yWD6DPX6+v2jJXY25PcJGwPiROdNZ3cbFLznRaparNONitVTfLHH1/MwmKmBaayYjDlw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uONVw-00F6gT-IO; Sun, 08 Jun 2025 23:25:12 +0200
Date: Sun, 8 Jun 2025 23:25:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v3 07/13] arm64: dts: mediatek: mt7988: add switch node
Message-ID: <1fdfba6b-1bf6-4865-be21-2b4d716fbfc0@lunn.ch>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-8-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608211452.72920-8-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_142531_768603_80F37C03 
X-CRM114-Status: UNSURE (   6.88  )
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
Cc: Landen Chao <Landen.Chao@mediatek.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Johnson Wang <johnson.wang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jia-Wei Chang <jia-wei.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> +			mdio {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				mediatek,pio = <&pio>;
> +
> +				gsw_phy0: ethernet-phy@0 {
> +					compatible = "ethernet-phy-ieee802.3-c22";
> +					reg = <0>;
> +					interrupts = <0>;
> +					phy-mode = "internal";

More phys with a phy-mode?

	Andrew

