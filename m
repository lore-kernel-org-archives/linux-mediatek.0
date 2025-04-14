Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F44C369B2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Apr 2025 13:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYtZof1JpAgYgjbf7Rfsjlu1zvZsWl5iqqO93SvjAxA=; b=S+hcb7203xUJjsXx6+vTOfhkPk
	tz5YgQ96dIC0wREHU+7stOwHjtz0R69wH8OCHgov8s5hAVRsIfp7cPoDcp19O1KANMk7VRowABw1X
	ztdrxRONqmo98pjsg4wlf1RqjjfWJMwioueS2IA+ok0cRl7BWxsw38KeD/pYsV2+thYY4naxeitym
	WwPTRt8a70PyfcfsXXlnrWQPyn0UQ1RZ/VTkcqYzINBZnyBsSvThXphs+QYWmIdkrhQK0zLos2fM2
	aTbrnj9dJfSUmz9oXPsJmb83glMC0qCpVoN1wwQdBbXT7R/R8lu1wtCU8ywDrCrDnre6MQjTAYHoY
	WGbEKfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Jfi-000000025Gg-10ER;
	Mon, 14 Apr 2025 13:16:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JcU-000000024Tt-2rsk;
	Mon, 14 Apr 2025 13:13:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C9126116E;
	Mon, 14 Apr 2025 13:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FB0C4AF0B;
	Mon, 14 Apr 2025 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744636381;
	bh=PYtZof1JpAgYgjbf7Rfsjlu1zvZsWl5iqqO93SvjAxA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JlWkqhAkffqQUy7ti9hPGnnhvDvKTOIcBCWG5k12bTxqHOWceJcjpt5DeZaOX9rw5
	 k+O9UNs2yN2I6WSh2xKCbB4XVsecud69yS8bjL5Y8UU9gIARpwj73EyxX7g4ig3qCt
	 ZGkzxEHlqjBXBzdCQD9Ko6UrhuiLbOKl81GrD/x2+OSzK+V/nuktrJv/jg741qEMwZ
	 RD8RKyrLwy5p2AlJdFVY40Ijv1jkSEbec9JTX0ytX9dFaVkfdTswxHvU+BOvgm0E6A
	 GeKI7tyrJs2Gvgp+z44jolI6wm3kaWUT/y4B8GJgV5v4h4KlH9bVHS+6MCDetWtoeu
	 /Vf69sMXYQO+w==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso6836945a12.0;
        Mon, 14 Apr 2025 06:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBJ08JFUXI6NauIAWQEg4uJWR/gv9A3K+loxOHE9OTc0aZuqA63pyDQwdeQRdYTtAaBJQVihoXf5sNFAsLompXVw==@lists.infradead.org, AJvYcCVeo6Ys2yvnvIxfAklyBHmLfGTcC8h3VW8GlfoHg0+7SD+vurlpFwbpfCsoFwGvVChT30hevNBQlpKkFmcmQ90=@lists.infradead.org, AJvYcCVr39aJaVYd/e5ijsQrbXvBRwk0/BNhLRhtoOEQKf2Ib0K41ju1cgxRR+K2yGMrONb1BBQSuGOjpsHPTysa@lists.infradead.org, AJvYcCWUXUOoQtAI6JMmonieKlj0vW0Nq+CiJ7N+XWUlLygx73x4MSJH0gsVANKn86GVaenyEq8DYRf831SFqZRXvhk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2PFjPIwrHe1jrMeSElEPdfu6WJYe5hJaY2LbLnyH1oNS/vBWX
	qgrYt1qyb+zzNSf2ths+0WOCo0epFjjhIrz9EWBzBIHBkvWxZDJcgO5bSHTJV33sdYEtMPggVTf
	upnWjMQrU+JVdcHbrgva34BwhYQ==
X-Google-Smtp-Source: AGHT+IGD1RjwJGslsl4TZQ3wfuNijXDBc01yF9Y4gnZ5DJt+B5EtvoBjX+ECQxWRz+SZvCEqXEVdeGMo7Gts//oS3Co=
X-Received: by 2002:a05:6402:1d4d:b0:5ee:497:67d6 with SMTP id
 4fb4d7f45d1cf-5f36ff1c023mr10307363a12.33.1744636380328; Mon, 14 Apr 2025
 06:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
 <20250410-dt-cpu-schema-v2-2-63d7dc9ddd0a@kernel.org> <0ce8559d-5c7d-43a0-8177-7704969fd334@gmail.com>
In-Reply-To: <0ce8559d-5c7d-43a0-8177-7704969fd334@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 14 Apr 2025 08:12:47 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJi+8-WdYEyrGjb=cQXPEb07Lkcj90a32d38ChvYJAA-Q@mail.gmail.com>
X-Gm-Features: ATxdqUHJKQLq2A74uSC_bdg-o7xbFw7BNZs9YlgJy-cREnL8L5s0aEVjMNnl6WA
Message-ID: <CAL_JsqJi+8-WdYEyrGjb=cQXPEb07Lkcj90a32d38ChvYJAA-Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/17] arm64: dts: broadcom: bcm2712: Use "l2-cache"
 for L2 cache node names
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
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

On Fri, Apr 11, 2025 at 6:37=E2=80=AFPM Florian Fainelli <f.fainelli@gmail.=
com> wrote:
>
> On 4/10/25 08:47, Rob Herring (Arm) wrote:
> > There's no need include the CPU number in the L2 cache node names as
> > the names are local to the CPU nodes. The documented node name is
> > also just "l2-cache".
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Not sure how you had intended for me to pick up that patch without
> copying the maintainers.

Looks like there is a problem in MAINTAINERS. This matches what b4 runs:

$ git show cca91c99fe14 | scripts/get_maintainer.pl --nogit
--nogit-fallback --nogit-chief-penguins --norolestats
Rob Herring <robh@kernel.org>
Krzysztof Kozlowski <krzk+dt@kernel.org>
Conor Dooley <conor+dt@kernel.org>
devicetree@vger.kernel.org
linux-kernel@vger.kernel.org


> Applied nonetheless, thanks!

Thanks.

Rob

