Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C0DEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 21:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVzGt1hU6/zJ2p8ESrItLga9WOYSY12aapmt+gJTTm0=; b=o3yPyKOZkj9FqHhV8KrEFCgDXM
	05UcQbRZU9FRtxivwiHq5ChSh+jgzClypvRPm+vQjAaz2rOGdtbu9dIrAGwRs2WnvkO9OEZ1S9Vq3
	Xrs9TpdsboohtyDsNj1KytQWemPx6qgaIlBlL8CqkFXVHwbGPZOHiNaHIbuGcgTQEVJsGsTAqgzq5
	jnxAhb430h+n1fuiEYM2sqsmplZgXMSSEowTZYndfVGCAzwpUCg+kXhp3w8S2j5Cs1i0vzubI/IJn
	i/1JVeig8buK4kSxi8QOoAdcAe2hsGx/AJhzrk9y4s0nlcdj67zxbR20YyLO4Ul6QUgjiaz7QPqqY
	F5rfWMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP8al-000ctn-1X;
	Thu, 27 Jul 2023 21:32:15 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP8ah-000csQ-2I;
	Thu, 27 Jul 2023 21:32:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B14E81BF205;
	Thu, 27 Jul 2023 21:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690493521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RVzGt1hU6/zJ2p8ESrItLga9WOYSY12aapmt+gJTTm0=;
	b=KuzkthgvdjwJnivEU/aryJfGIVIwS2Jo2FGYznAjBe2XO2ObIJRvGb4lZ+5IDN1HoNpZYG
	4od2IsUmCvD1rkxDQUX70EEy/OerDBhxZu3PYbTnWRsnA+Uh3PCr6Soiqs7oTND51Z5H12
	vPxGYo5bgxbp54fa9pK//rRC9ZjhXRAtXs5LXD+g2zg8loPvxEOC0OU9LKtcey5kXGqFUV
	3owWu3CEW9oVKY03yZ19bLiumKfiItmQPfrW7xy4+Zjs6amZuo4MDBNNBF0yaCOsre4eZ+
	CZksNyGouFQz3JfaVim3BzM6WwJl4QqifmvRDrXEUYS0+aUG+hl2XEUkrWRj6g==
Date: Thu, 27 Jul 2023 23:31:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alessandro Zummo <a.zummo@towertech.it>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2] rtc: Explicitly include correct DT includes
Message-ID: <169049349537.641428.12895115995770744599.b4-ty@bootlin.com>
References: <20230724205456.767430-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724205456.767430-1-robh@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_143211_880254_A62E76B1 
X-CRM114-Status: GOOD (  10.38  )
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


On Mon, 24 Jul 2023 14:54:54 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] rtc: Explicitly include correct DT includes
      commit: 48144c2890503b919bc8ee128b63e37008d69250

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

