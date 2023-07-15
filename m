Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB9CC001DC
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jul 2023 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Un+ufkhrXfZqLrVbDU6HeKyr3kcyHpaOW08JuHJOTAQ=; b=zVfZ1U6HdemT3jL6ToA8/OdghR
	N1j/sEi/YM2F31vRmj6eub9WWzvkdpwqmwTnKZFHyv6mUAMXVwlHw7ffVKurSIwNnjOImEZbup8aU
	YpJ0MQWoRmNXoXYSe1usAiosn4pmZE6YCuVU9T+b72f9GmNojmXrksEvksWI6hsqPlrnwQvHFQPKS
	54Dhf7BVHeA0JG/8q0m3OBUqunjpsI7SGw588X99gyIEovFjqYsLoSNS1nYbx5jGiJHa99KzOFuvZ
	kERDZKJgXq5jL3eiQGIt5Ip+Qnzp3pMYmPFIqJLxxL4ptR1bzBw7UbuEvvL2GcuzVYzdRRPK1dEVv
	tgnHW1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhW0-0093Yh-1b;
	Sat, 15 Jul 2023 15:49:00 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhVw-0093WU-0V;
	Sat, 15 Jul 2023 15:48:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 713BCFF802;
	Sat, 15 Jul 2023 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689436130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Un+ufkhrXfZqLrVbDU6HeKyr3kcyHpaOW08JuHJOTAQ=;
	b=FqWexEyC5/ncjoaJwBj4G53wiu8VDHhDUUmjeiui8D15gl2UK0/z1/JhojGPaXb7myBHt0
	+m0+8luEUYwOnP8t5sbvBF01u6wPPDP8ekc+E+xiI5dXBEOsZg27UBqN6/Cx2Ykd/d38zY
	Uxi4xN1DsWH3172+Q9prP3vN3AfuAUnTk0v/cqkvsBuezHKkylG8hSiaysYLY7BLSvc/OK
	X/4nONxCNA9EoFF0A6ADkUMqN/54fCJrQYuzSAtxsbm00dNaTjHSMLlKGNk9Pa5uVm4JDa
	KtHa+BsMQbwWPxRZR03AmaWLttL4j4jDIfE8mWV10b4zCsVL6+eAIvNGObilXQ==
Date: Sat, 15 Jul 2023 17:48:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Kyungmin Park
 <kyungmin.park@samsung.com>, Han Xu <han.xu@nxp.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Liang
 Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Michal Simek
 <michal.simek@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Vladimir
 Zapolskiy <vz@mleia.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] mtd: Explicitly include correct DT includes
Message-ID: <20230715174804.6fc2a4c1@xps-13>
In-Reply-To: <20230714174751.4060439-1-robh@kernel.org>
References: <20230714174751.4060439-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_084856_328534_BDFBE1EB 
X-CRM114-Status: GOOD (  11.18  )
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

robh@kernel.org wrote on Fri, 14 Jul 2023 11:47:49 -0600:

> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.

				 was?

Otherwise LGTM, I will fix it when applying.

> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks,
Miqu=C3=A8l

