Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C9BC2A06C
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jan 2026 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzt8nsTReCOrFFimHSYnuwYVhyLibD7TXrGiySpB+f0=; b=SiuJDcXZ/JQY3sH9X7AqLmS7Nb
	1GKcDfksjF6TrVVTXtUwRoB0SmSszrA1jjFBu8T3aHVDGRE/fAt4+TkEO28rmkr1F9yYJacn8hflt
	itWhsLScixAjlo8vlH9ZB2g1SMQm51M9VTwTm98Z/hMaSCkLFdHMyXYf2wyGldjXLznvLqwVKdcch
	h46y9iwCsdJ5DF0i7xtUJLPPB7Mkda4pA3BiyHOzlqV17tsOuV2+UTa9EyxUJbdib21imY4fBTVVi
	Mr6SyenIn9NMn1MXfJZsoLxd4z0ZLcAAQUh4Vf3pvEJBtBlVVsqwm/nGXjkUt8mq/F15J0ksQ5NL8
	npK0jxgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMR8-0000000ABph-3ZWW;
	Sun, 04 Jan 2026 11:38:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMR0-0000000ABpG-1sWS
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Jan 2026 11:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24D436014D
	for <linux-mediatek@lists.infradead.org>; Sun,  4 Jan 2026 11:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A575CC2BC87
	for <linux-mediatek@lists.infradead.org>; Sun,  4 Jan 2026 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767526686;
	bh=zzt8nsTReCOrFFimHSYnuwYVhyLibD7TXrGiySpB+f0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lSrmBejJxZP8gHrW1lt8qLoXx5i5yIr8c9JjAw76JwT4w2DU5Bw/V3A8ds+61J9gA
	 qrA1BD0oGFxFt5TGFqAv6/RSxsC53w/k7B87GXnPPGu5JyBIFEy/k2xW5XqJfBLQwZ
	 s7To43MM/23LrjwnT2MHsbj2v+MNR3gch8pFv9yPYQDYuMjuaAik+CInCYu5+ZmfZA
	 x9Du36muqnYdgEnwcEtBPGE0Q2krb+xtqRR3x8L+34PJR5hQ5QQvm7VmmsMrN+wnM9
	 I2UaQA0Jag3f/lobO/fONtZhnVUHsQ9680OTtldkoKQt1MckmCleLVqFj0F055vXis
	 sgoDnkXq9m56w==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78d6a3c3b77so10529857b3.0
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 03:38:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUV1ClgAvX4VYfAxQn/CONwUgfDiZEWxC0xYvcPCkCllR/LugQfL5ZFVbOB4E84nnybLSH9O0nGaV2fBPJG/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YytWY8ORm/4HFEvy44KWAG+YjWe46cLv+wN41zQxpo/B2fLrEzB
	t6wxzGW1Xpjtvp003TVzKFu7yuq6sOuNq6UAK55K32ReF348AAi0FCLWJ0EzgnS30DV53K1tY+4
	4iECy6heMKygGsONCNpb8zerpmseym2A=
X-Google-Smtp-Source: AGHT+IF4Orabbp+U3oU6DE4mJfK9KKnbEOxrcm3UcvoG3IBBIUd0oK3DmWjwYq82sAXiIcIbWSh2iznA2Fvf8inAirk=
X-Received: by 2002:a05:690e:b4d:b0:645:591a:cb5c with SMTP id
 956f58d0204a3-646e341a6cdmr3638468d50.23.1767526685648; Sun, 04 Jan 2026
 03:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20251212231203.727227-1-robh@kernel.org>
In-Reply-To: <20251212231203.727227-1-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Jan 2026 12:37:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAaAH9_YdTGqHUcOp8PfW+1P=ZLZzS_QseVYWxA4kiWw@mail.gmail.com>
X-Gm-Features: AQt7F2qijkDXeXovdHRRQ5QEL33UZBQlEMiEIzun3p2-rj7cwfnP7kAmQfWhUyg
Message-ID: <CAD++jLkAaAH9_YdTGqHUcOp8PfW+1P=ZLZzS_QseVYWxA4kiWw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove unused includes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Peter Rosin <peda@axentia.se>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-iio@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Dec 13, 2025 at 12:12=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Remove includes which are not referenced by either DTS files or drivers.
>
> There's a few more which are new, so they are excluded for now.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Good.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

