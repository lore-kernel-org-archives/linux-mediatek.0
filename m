Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3910C3DA45
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 11:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ca7YWsHqHzNel/xzp85QT864ezTfPIJoPDCqCbc2WfQ=; b=aLfUK23ucFwQNUo/dKH3nyD+Z5
	6QIkkvNzgok+Ur8og+gS55IRmD17l5Orzdhq1I2rIfPrfFTvp40RVi2zQu3jUiO7Jb9A83Bccff2G
	RzdrWsIQ4oodgJYfKb1T64KbAgyZe5ixaz0AEEI+4AKDVIDtZ7Zo4h4vW3b+o/ft3nfdlZ8qzJbrD
	spFFL4JVPG8V8EDa5LLlh4pX3KHJPgP18jBERq78pb1zbcf9g0JveeG662LfJQ2Z6sFMoGTrKZ7zQ
	+tPpvaQfkLPTLfYrK3mE6ziX2qxX7g6CLW6F7z/mwaolBzzazpWobu4dEBLKuu2yUKfIuAdLC2Bsf
	TcAbH4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRVbV-0000000ANax-14yt;
	Wed, 10 Jul 2024 11:35:21 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRVbD-0000000ANYw-0jQr;
	Wed, 10 Jul 2024 11:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1720611282; x=1721216082; i=frank-w@public-files.de;
	bh=Ca7YWsHqHzNel/xzp85QT864ezTfPIJoPDCqCbc2WfQ=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fPA3cmXmgU6pQYBA574Np/QsgP2UKY3YRdeTeQxzaDJIvMsDm86RE3r8QPgbfdG1
	 PpbXq61an4mXRS7iaxfEuJNg810frhWggLxeVdqp2/lo4oJ92M/bQiC+RwkRdN5al
	 RDi6UhbPZpBRR2f7XU0ixb//8J12/u7IxrUVMSVjNA4T8HPaaxgCqeptDsdctENvs
	 KMHDxteEMaoFAQy7mXjVYZ02LlzC1JjoPBXZHrF0xnd5+knO+YROpLcj8A4Va49vF
	 I7uV1hbbkABQjlFsxDOIBct+JTlqRVJsnv9YIr9dgP+O5aKvwaGFM3TAWFDbmSczt
	 xpeYVmzdcRZUysYYQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.158.245] ([217.61.158.245]) by web-mail.gmx.net
 (3c-app-gmx-bs04.server.lan [172.19.170.53]) (via HTTP); Wed, 10 Jul 2024
 13:34:42 +0200
MIME-Version: 1.0
Message-ID: <trinity-93a5ed81-b890-4d49-bfec-1bbb1219cb65-1720611282583@3c-app-gmx-bs04>
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: Aw: Re: [PATCH v1 0/4] add syscon requirement for mt7988
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jul 2024 13:34:42 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <126053ef-3bfb-47c2-aa17-eb1d26d99102@collabora.com>
References: <20240709101328.102969-1-linux@fw-web.de>
 <126053ef-3bfb-47c2-aa17-eb1d26d99102@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:VqJ3hcPVu1xb9GRAUly8AumwiYagwz5PSVlmCKg5mTSwZJoEnbbu0LT1soXbfegD3Ernj
 +cpVjnfKv7Mc6sSvh/GSJm+gwOdONocDiO3sl5tVAppbv/E//rvACaUzXBknfW5uKmgyUALE3sa4
 GOYdzjiE3ROIWei/P9aszJtcldqIa/3ubboc8IvRuSt0HMYdFOevd3QOAoVvjB82AwO1UEGHu/AB
 wp8+YHPqQPxiQievpPiEqYrCo7HbcOUyEUst3MJZjWZqPn0LXU84ODIG+QnRuQZprx7PgaLTCKkP
 HM=
UI-OutboundReport: notjunk:1;M01:P0:J5us5hzBH7g=;I3oO7BrCPjmdtXrzt/KONxqrjiQ
 eE4SQym1ZEjsCG0I06cjTEAdEqMadHr7wnl5eJsNsexH8IzQCfzI/T8qZioVzNruvB7MpoBWM
 fJKQ6G2nctMhz0sN2/NYfTNpxkF9jCyu1qnhnsjDZvOjkOKhDysuvsN5+Ln18KqLRdW0v1XdU
 9RLZbHdJ1gMcUQm3aJdyvCfKM7qoi27GK1SXfEGS7pRnauXFSnaEdYUyVG5Y5d3QGKltIzqK/
 GntpjfKGLgXu+HhKVypbT2HwxSvWM97s7p5Er3Q26/zonqeE1FvfedpsXlCCkR2NjZwpeg+l5
 gt8N9XKe9Zv9t6Po8Fvaqk+nyBEoswduX3ijEKPDQdVk2OZJsq2DQXsDDTV5ANOCjGL9STWQZ
 +SpTzTJRp5hgMmfG4Uv/nsID2q2kF46nGmqJp8NqEYt/bgkeZDyWDr+h6qxgLDtYRonVrfj43
 Lpe4JviSNXUL/J3+02anpfYGxFWPUUu2MTmE3p/sv9BgFQEp6VSymI33b504yXVjsZVKdSDII
 zqgj3j9qp+BzZIMuSZQ9vov7JZhWlSSStBOWMYKZU+emtTxk9MUVW7Kwc7uDh/pxBV5/deehi
 Hdj/1R47FpWYG2BQdEJAvalty4ziHGt1ZI7L0JSk3WnBl7Nq4+UEN0UtC7PYqI25FDPTtBMYx
 2wO2UWPQWDh11PAiD/UfLPyQM+/r7mnwNnejW+5ewA==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_043503_539249_24199075 
X-CRM114-Status: GOOD (  16.20  )
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

Hi

> Gesendet: Mittwoch, 10. Juli 2024 um 12:45 Uhr
> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.c=
om>
> Betreff: Re: [PATCH v1 0/4] add syscon requirement for mt7988
>
> Il 09/07/24 12:13, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Some nodes require the syscon fallback at least in u-boot when using
> > OF_UPSTREAM.
> >
> > This is because uboot driver uses syscon_node_to_regmap in mtk_eth.c f=
or
> > "mediatek,toprgu", "mediatek,xfi_pll" and reset pointing to watchdog-n=
ode.
> >
>
> I wonder what's the major blocker here to modify the u-boot driver to ta=
ke
> the upstream devicetree as-is, instead of using syscon_node_to_regmap?

in uboot there is no driver for all syscon and to handle parallel access t=
his is done with the syscon fallback.

The syscon uclass is a small driver which is generic and only handle the r=
egmap in global context.

In theory it could be possible that regmap is aquired twice when used from=
 2+ other drivers...to prevent this without
adding the syscon fallback each syscon needs a dedicated driver like in li=
nux which does only syscon stuff (code
duplication at its best :) ).

of course i can use regmap_init_mem in the uboot ethernet driver

https://elixir.bootlin.com/u-boot/latest/source/drivers/core/regmap.c#L242

like it's done once for syscon-uclass.

but i will cause issues when a second device tries to access this regmap. =
So it was be much easier (for me) to add this
fallback and not writing 3 device-drivers in uboot doing the exactly same =
as syscon.

if you have a better idea how to handle it, let me know :)

regards Frank

> Regards,
> Angelo


