Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D808C25B10
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 May 2024 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ih1uGOfjRAxCt+6sZss4Yfl3azQjSUpDGJBEtOH8mvE=; b=NHy+o195mrYL8jfaWTGmpJ3m+8
	hEvDDVgEXKO8y9obwJ2anE2jrcOreBpaisRffRF/CVelrIvlPyabjts9SWNAJ4SquNvbOaBPIz/Kn
	ActJNUwXa+eYoKwgm0ZxOkePBNVspD+3uqJ93wPCyU6NmrIjrWVY4tGT7gGrek6sLBMiDYq7aZ7eP
	N1AP+PMUHMuDtBFgLkJObAaIji34+onk7yFUuIjJvw41a1e2MhKG7tkghPR7Mjd3nmzggZllFeGrS
	zhqhyFfusNHFYyIQa5zpTxLZPowisrWLj53EbWCeviVjBeU8ec4hh3LdK1geq67gFU5JnqsfuOj4N
	LyBHw83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6QWi-0000000C7Yd-2qRI;
	Mon, 13 May 2024 07:55:16 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6QWf-0000000C7XN-0a4q;
	Mon, 13 May 2024 07:55:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 175BDE001E;
	Mon, 13 May 2024 07:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715586908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ih1uGOfjRAxCt+6sZss4Yfl3azQjSUpDGJBEtOH8mvE=;
	b=f9ac95v6i1XDmaygmdpkS9KIhKeyRRR3rzxuphI0Luyq5ePjJX81Na7xIwxyP9jltiorT5
	o3RQdE4J0iBlv5VwiuDCBnPjk/bdNj4DrgwUQku75ZXXHOqytN8sUi3raDKyJY2X9piWrO
	USUjdu+raME12Enpsa1gnuUglmy0oHkqtHN8/y0e60Dc6F39+3tJfrm18pfdfraCjaA0no
	wIWhvD6hR/8n67SgI2C5gTU3q2ihA6qXYu4+AHgnSzsCbeRsNJjPcWwDwF/qAiUy3BfoR0
	Ch9OAOcKjdSFVA88ufca5XaZyeLXxw6gUY9xSEYupyKwu6Jpav7BN9WR9OV68A==
Date: Mon, 13 May 2024 09:55:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement
 <gregory.clement@bootlin.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
 UNGLinuxDriver@microchip.com, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
Message-ID: <20240513095504.37776289@xps-13>
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
References: <20240510123018.3902184-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_005513_333596_69876EC0 
X-CRM114-Status: UNSURE (   8.61  )
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

Hi Rob,

robh@kernel.org wrote on Fri, 10 May 2024 07:30:14 -0500:

> Add another batch of various "simple" syscon compatibles which were
> undocumented or still documented with old text bindings. Remove the old
> text binding docs for the ones which were documented.

...

>  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------

I don't know how useful are these compatibles, but if I take the case
of atmel,sama5d3-nfc-io, it is only described in this file, while
several DTSI reference it. After this change they will no longer be
referenced at all but still in use. Is this intended? Shall these
compatibles be totally dropped from the device trees as well?

$ git grep -c atmel,sama5d3-nfc-io arch/
arch/arm/boot/dts/microchip/sama5d2.dtsi:1
arch/arm/boot/dts/microchip/sama5d3.dtsi:1
arch/arm/boot/dts/microchip/sama5d4.dtsi:1
arch/arm/boot/dts/microchip/sama7g5.dtsi:1

Thanks,
Miqu=C3=A8l

