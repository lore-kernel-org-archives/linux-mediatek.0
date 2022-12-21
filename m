Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A465C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 13:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nU5P7LyVQ3beqazjkGa/5BdKFxoYM9aSKA3nFZTk8DU=; b=iL4GtouVwaaNtxkOZYwNaK5Ekn
	7rew2iusOoy3yc++rQqvyEhtGvAyrI9LDYXjuaCPB7h0NzhamJOJzc8vKRNWHV5wY7m9Ooh8TckeZ
	lxwG/lGDHXoBhdReO4Q621tyiCGmJ+Tvvx8RRZ4cN+EIvsjTRlGvapnsMIhPZYniruVKQ90YZl67k
	12ZWn+kkzRuMjyUDYJSvAB5jiZfCZPrkgLCHAxHv5aSCJUb3EXkvm5oOJoB0sSJdCll3wgFYcGZbz
	OPGv+GtBXK9u2a84kOhRu0j7dE+r5t+kY+rSSIeSLXo43Chqs8kWEkEL4A3hWngKOdLSyadRM5ZvH
	+ztC2+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yzl-00F0RB-9U; Wed, 21 Dec 2022 13:18:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yxv-00Ezeb-6B; Wed, 21 Dec 2022 13:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nU5P7LyVQ3beqazjkGa/5BdKFxoYM9aSKA3nFZTk8DU=; b=51ZBAIiPhn8+my1KlwUrSE6x7b
	fOyvgm8qYYmddkQ0QD65fhhNZf97ZtMcsalpVwBVaJuH7rtnIDpu8qcDrMiqUNL2UP+8CLhjhKNpe
	cJOby3GN/Zk0CDS0zl4ETZAp9aSwSRmGywgKFUpQoGFOoi8t2ixa1HeHItZpNHVJoeH0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1p7yxm-000BDz-5x; Wed, 21 Dec 2022 14:16:50 +0100
Date: Wed, 21 Dec 2022 14:16:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biao Huang <biao.huang@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	macpaul.lin@mediatek.com
Subject: Re: [RESEND PATCH v4] arm64: dts: mt8195: Add Ethernet controller
Message-ID: <Y6MHQnUcfBjibA8C@lunn.ch>
References: <20221221022523.8458-1-biao.huang@mediatek.com>
 <20221221022523.8458-2-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221022523.8458-2-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_051659_321878_4F033CB6 
X-CRM114-Status: UNSURE (   7.27  )
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

> +&eth {
> +	phy-mode ="rgmii-rxid";

That is pretty unusual. You don't see rxid, or txid very often, it is
normally rgmii, or rgmii-id.

> +	phy-handle = <&ethernet_phy0>;
> +	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
> +	snps,reset-delays-us = <0 10000 10000>;
> +	mediatek,tx-delay-ps = <2030>;

How important is the 30 here?

You appear to have the PHY doing the RX delay, and the MAC doing the
TX delay. Normally we have the PHY do both. Can you actually do

phy-mode = "rgmii-id", and mediatek,tx-delay-ps = <30> ? That would
then have the PHY doing the basic 2ns delay, and the MAC doing the
fine tuning needed for TX?

     Andrew

