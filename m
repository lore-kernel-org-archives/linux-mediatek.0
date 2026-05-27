Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE4ACD4F54
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 18:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	From:To:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpx6Uj9RIdUNjK8W3CnmyMzyh2ekBIwrGqDnhdzKB20=; b=j+4vQBynnh5At1RIkDkEUhouRj
	yUDZjyinqWlOMmTSoDBJZEwdICd3QmQ9mwjZSyecEnet/aa+aE2EZy9k2DQdZ+D970rJhmtYBiLaD
	Cc1060FfwaWXkCp8YuD1qGQW+iNGGqRGLJ4MORoXJT7uNq29Y3FG4fo3AVa67ddscwd4iH7ndPApX
	ljx/1TX07ziW0aEmIlgXm7UaQj8E1HnQ6Al58LwNTdqDOH0tjcUTZPRHVBWNUVDsPyOX2PzDsu6UM
	jOf7JrYd+9DZJUW0ja+5oA27RCw8SLGtDK4f/eZZnRbQgbKpHGboBhThhnRbIB7Kr11T/jDw1T03n
	oJPUOZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIu1-00000004d3M-0na0;
	Wed, 27 May 2026 18:22:49 +0000
Received: from vinatta.cz ([2a03:3b40:fe:428::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSItx-00000004d1r-00Pr;
	Wed, 27 May 2026 18:22:47 +0000
DKIM-Signature: a=rsa-sha256; bh=kpx6Uj9RIdUNjK8W3CnmyMzyh2ekBIwrGqDnhdzKB20=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1779906099; v=1; x=1780338099;
 b=CZPrCZhIXkDoHB0cMhVJm/JiciH7dzJdwyLBNIe3/8l0Zq3QV7VFjYO1LEd+kDuYAthVAc6v
 9Phsze4RHJ9Wiy9dWqZUi5r11Ec++f5qsA7nGRjusmk7hxln5DUEsOKnpA2/zvZ9LMdttYtwoyk
 obUMhAA8pyd2d3p8TJdxtRngXAsD4MSuHOA2w5iCmS3mJjwGMFQ4EIGNj12WNFNtf7i78IRXvpe
 JEqKD5JLfzCf1QT+W+0p1tE0PQQ7dibqrscIPMku5iDYLpWuWEeYveIaDWU/huyQb4ixLw5hd7h
 EVuNnF/o8bxGM9wtY1p5oWRroCkzvfJ9ffBm6K/KgWwcQ==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 4f3f7766; Wed, 27 May 2026 20:21:39 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 20:21:38 +0200
Message-Id: <DITO1XL17NWQ.31DQEIXADGBND@matfyz.cz>
Subject: Re: [PATCH v1 2/3] regulator: Use named initializers for
 platform_device_id arrays
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: "Matti Vaittinen" <mazziesaccount@gmail.com>, "Marek Vasut"
 <marek.vasut+renesas@gmail.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Samuel Kayode"
 <samkay014@gmail.com>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-omap@vger.kernel.org>
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
 <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_112246_043601_3AFEF6E1 
X-CRM114-Status: UNSURE (   8.10  )
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

Uwe Kleine-K=C3=B6nig (The Capable Hub), 2026-05-27T12:47:45+02:00:
> diff --git a/drivers/regulator/88pm886-regulator.c b/drivers/regulator/88=
pm886-regulator.c
> index a38bd4f312b7..7328cd1cf265 100644
> --- a/drivers/regulator/88pm886-regulator.c
> +++ b/drivers/regulator/88pm886-regulator.c
> @@ -373,7 +373,7 @@ static int pm886_regulator_probe(struct platform_devi=
ce *pdev)
>  }
> =20
>  static const struct platform_device_id pm886_regulator_id_table[] =3D {
> -	{ "88pm886-regulator", },
> +	{ .name =3D "88pm886-regulator" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, pm886_regulator_id_table);

Acked-by: Karel Balej <balejk@matfyz.cz> # for Marvell 88PM886

