Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E4CC3ABC3
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 May 2025 16:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWYabxWwN0rZXGIKRD1Q4hDChX23vVF0dJbDnHVfEtQ=; b=JguuwO4PFC6xk7OwS/eGqyFspR
	7jyyVEnbi31FDJ+EDrH9dzd3k2TLYvOgNH00JrYDXbxMFAnneMEE/PoKQ7qautcZtWQp31hG8J4wU
	VZYJB1QO7dyRCTgktq6vSHTnL6u3yu8InOZ678ErkaKqim/BimnEmP6emAhHBQP87SgFlS7CTRTN0
	4sbuLHzaDLqf4SUOR5g5oRXJ/PPlAcHmWIaxPGbboJU0MPDQzdGuo0x2t90lmETQyNgaaGw0S3FnB
	+2Rg5wScinwnmjUrcOUXDJwCc2X1V5xkA+mVFfW81W1YFYTw8rm8oz+rs5J+nPI0FEa3InJHYx2l/
	e7FPrhyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9xV-00000007Ymn-3rNr;
	Sun, 11 May 2025 16:55:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9he-00000007WnO-3FKC;
	Sun, 11 May 2025 16:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lWYabxWwN0rZXGIKRD1Q4hDChX23vVF0dJbDnHVfEtQ=; b=phdDVKY1LRBkC276g4viHoQG+O
	6j0Rv/ls5B+JImztcemHmjmp6yAcusSEL/17UKxArVwiECMbPqvi9QaxqR02X0noTVLdr6lPrBieM
	18t+IjHVffJrAUGYyNUtP2cIZsCy008XxJO4hUaXRzZuPG40hbAlmSuM8Ztsnjx95GbE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uE9hR-00CGI2-88; Sun, 11 May 2025 18:38:49 +0200
Date: Sun, 11 May 2025 18:38:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v1 08/14] arm64: dts: mediatek: mt7988: add basic
 ethernet-nodes
Message-ID: <78abbdb9-70d8-4e53-8593-91735cde73ec@lunn.ch>
References: <20250511141942.10284-1-linux@fw-web.de>
 <20250511141942.10284-9-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511141942.10284-9-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_093902_815651_DDBC9D36 
X-CRM114-Status: UNSURE (   7.16  )
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
Cc: Landen Chao <Landen.Chao@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> +			gmac0: mac@0 {
> +				compatible = "mediatek,eth-mac";
> +				reg = <0>;
> +				phy-mode = "internal";
> +
> +				fixed-link {
> +					speed = <10000>;
> +					full-duplex;
> +					pause;
> +				};

Does phy-mode internal and fixed-link used together make any sense?
Please could you explain this.

	Andrew

