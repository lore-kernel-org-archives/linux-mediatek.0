Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEED3C25B10
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 May 2024 08:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyoZN19SXhcNpowY087583lyuLXsiKEVgwfckAcf1+w=; b=qd5GuV+GCBjLcW7zUDFRj54Qh1
	55KriXsfcIl7rpgBU0G+KjYAMxRUANPCiH5oU2iotLewLmKhSn+nXc/PHCXN1HFzy/IhyyDxYojCH
	6iqMDEEKiUEgNWCiCZ1cTsvSoj2BFLjeQSyJ/LrLls+aqMO+RwgTchYsK8hlbNytsaTcf4SJVNY+E
	CVfe5tNXBWK/0r/pTa6hlCssFgCfF/GYe+tHKPkQU6SjYQyIRc1TttyOfS4YCiQZr13/VdE0Iqr7i
	Bxr6Tw5Jw7QABISONLMb+ySOMDxpmSgymCBEGGKtQztsuc/1erRK0H8JnoGdgX06QlLmwTID0BYc5
	be4NZpVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Qgn-0000000C9Of-1RJq;
	Mon, 13 May 2024 08:05:41 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Qgh-0000000C9Mp-0lYn;
	Mon, 13 May 2024 08:05:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C90EC0005;
	Mon, 13 May 2024 08:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715587529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iyoZN19SXhcNpowY087583lyuLXsiKEVgwfckAcf1+w=;
	b=f3DMme5dxtAT4mt5HSyw2dTwDS4cj1aQP7DTsF7JEASt6rAPey2MD6dQjtqCv/f//7ygwr
	80tVcE3yboCLUBnrFQNlSPQbNERb3wwFmlBAzZULm6qLGkekBcWFHmAR+nso3/P5/3xKUi
	jeo8olmnvjtndE9Z8cObUyAS+2gNhW5Uv3rCLkHEncVjQ2OFRVXHs1lDRzno4Td6rkDMdf
	XX3MudMxRzLYEKTNr8IbYiINhlFGkBVlnKNAg19ttCrWo7nXUqBsYV3UhNtI8o0A55+6oO
	9WX0VTKscxls9YA1fYGNpPorXUQ22t0JENtl1Og8jDDN/lrQznxUw6FTyswgOA==
Date: Mon, 13 May 2024 10:05:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Gregory Clement
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
Message-ID: <20240513100523.4a23d58c@xps-13>
In-Reply-To: <20240513-timing-snippet-38983a6b3e2f@spud>
References: <20240510123018.3902184-1-robh@kernel.org>
	<20240513095504.37776289@xps-13>
	<20240513-timing-snippet-38983a6b3e2f@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_010535_504932_939FB635 
X-CRM114-Status: GOOD (  18.33  )
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

Hi Conor,

conor@kernel.org wrote on Mon, 13 May 2024 08:59:34 +0100:

> On Mon, May 13, 2024 at 09:55:04AM +0200, Miquel Raynal wrote:
> > Hi Rob,
> >=20
> > robh@kernel.org wrote on Fri, 10 May 2024 07:30:14 -0500:
> >  =20
> > > Add another batch of various "simple" syscon compatibles which were
> > > undocumented or still documented with old text bindings. Remove the o=
ld
> > > text binding docs for the ones which were documented. =20
> >=20
> > ...
> >  =20
> > >  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------ =20
> >=20
> > I don't know how useful are these compatibles, but if I take the case
> > of atmel,sama5d3-nfc-io, it is only described in this file, while
> > several DTSI reference it. After this change they will no longer be
> > referenced at all but still in use. Is this intended? Shall these
> > compatibles be totally dropped from the device trees as well?
> >=20
> > $ git grep -c atmel,sama5d3-nfc-io arch/
> > arch/arm/boot/dts/microchip/sama5d2.dtsi:1
> > arch/arm/boot/dts/microchip/sama5d3.dtsi:1
> > arch/arm/boot/dts/microchip/sama5d4.dtsi:1
> > arch/arm/boot/dts/microchip/sama7g5.dtsi:1 =20
>=20
> atmel,sama5d3-nfc-io is added to the syscon yaml binding in this patch,
> so it's a move not a removal, no?

Ah sorry, I missed the additions in this file, fine then, sorry for the
misunderstanding.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com> # mtd

Thanks,
Miqu=C3=A8l

