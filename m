Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7152C001B0
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Jul 2023 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWfuaj908ezvTCArkn3iKuZY57pS5DEGCvs818aKT1g=; b=2A0e+f+QxRzWO8dI+DTJyiX55Q
	o3rvUcpeAuUuGXNwgL0dVOmwk6vWY+KCiHGgx/80KItcAjw5b5OLIP6yiNqob/Rke+bhzDnAm4exm
	hh6jvu3tqQ/3glxo+IGzDi/18vlM3G5yhdfOKpoQYfa6cVCdP2Q2O164fj6Srn4CxZsZxTFP+d1Ta
	s1aWOb1O5p9+AgiS/H5K7qfi9OHnfTAbPp+kwv4B1pt3bAbyCn9PnP+ekjBzK4UoLpWUy46mvuJUQ
	spLzuwTcoEngH5CB4bXa/czsRawhrf6/dtSJAYvRwat//s0DDJrfIOkv7ynvIjD0JyCbasfQUqw+b
	4ilq21MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKjWB-009GRt-2J;
	Sat, 15 Jul 2023 17:57:19 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKjW9-009GQM-15
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Jul 2023 17:57:18 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-c7a5600d04dso3022720276.3
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Jul 2023 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689443836; x=1692035836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWfuaj908ezvTCArkn3iKuZY57pS5DEGCvs818aKT1g=;
        b=hXFWx/7V2ilUSpF3voEEHL3miMi68ZScjxXTYKsraLjLXai5wQQF4WPMOEwKknT73Z
         TosQJPQ0jcS9mV4PZ/Hrjat87xHfW1QZJJvKse42oBPzZB+EGbp2N3i5id7JTxjUsgtN
         WDL0fBXFgAJ7IwzYFb0eaIrxQI4wqfHa1Tk5UXF4g6QhSgtnbN6HAd5LXyrsoH093BeZ
         dnzHSgUdn7weBlTbCB7MsfNkTRHFyDdDqy3vayXALCvXkwp2xHLINAeKis0MHStT3gGB
         zSRQipZgpEoUedpY9iX8KSuraRlyBWdrTzGFZ/p6RBKPRCTekMb8kbzZG2seChNlsEGP
         QXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689443836; x=1692035836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWfuaj908ezvTCArkn3iKuZY57pS5DEGCvs818aKT1g=;
        b=gn+A2r4zNj2jMMO1c5tXkuK7Ou9Ptm2YFIE27JbjckoLsct4glBdsNazZULx4eXcdL
         zNDrGuRwKY7/Y7vXJS051WHDX7YIpKD9x9F5W+I5hEvx7+KeH3slFQKuuLT5K8UYEMmo
         WCZz0Pk7Ztusz7722+oNm+58K2qL5ei4dFaFwBxn3b6J8xsNn7XLLE0zFPI6J/KC8r3M
         Xf4P6PAhTxCcYL9FTilJL/JddSK0NKxvShVYVb1jtGjeTEdnJ1zY92F9tdQnI/7tJOaK
         9WrtiwKjKoF4LYGXyWE0KLHGXyrqA7zsC8RuMriUASWZtK6m5RBHaYIkWe5Htxhv/4h2
         i3DA==
X-Gm-Message-State: ABy/qLZZG8W8RBgpuQrMug9S78ffKzKyTjHny9T+GFhTkeKonAlpUFwr
	aDvWJ2dNNKn/m0sDffGqX0qDw/n3yaJvRt+jyokzlw==
X-Google-Smtp-Source: APBJJlEOgFSlT/aTEORmFdIMvrXhSvSNS+ivT8OhWO9TBnbzSoXq3K3OfZ5ITuyPBt0YYAqSQP7aCMjSrPWQ6SLmwFM=
X-Received: by 2002:a81:4ec2:0:b0:573:cacd:3b6e with SMTP id
 c185-20020a814ec2000000b00573cacd3b6emr7407493ywb.30.1689443836031; Sat, 15
 Jul 2023 10:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174751.4060439-1-robh@kernel.org>
In-Reply-To: <20230714174751.4060439-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Jul 2023 19:57:04 +0200
Message-ID: <CACRpkdaxqeZH_SOhmuZ2rhoU73uDVNPmzGFpCEuk636Jb2qMsw@mail.gmail.com>
Subject: Re: [PATCH] mtd: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@nxp.com>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michal Simek <michal.simek@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Vladimir Zapolskiy <vz@mleia.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_105717_451723_FFA4AC9F 
X-CRM114-Status: GOOD (  10.90  )
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

On Fri, Jul 14, 2023 at 7:48=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for going back and fixing up this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

