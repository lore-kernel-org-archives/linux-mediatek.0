Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995A3CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 15:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umiR4j7DjLNlMEowdV58E6T5tLX87kYcXiEtAZnwsfI=; b=QgEo4EFFCspp8TphoKawzra+or
	oekxWPIzzyh+2EhrehhDfNi0f3jvdBdxYXEB/X/JSzC0iL/zOmPYC4+fQTV6lQx4rq/Zy3cGdtxxP
	3eiSN2gWia3UhcoFyFBkVsp36qs7CbrGtgo2bCYuR3aIdBVMI+O5BAxb9JN9X5+5j4ZCHf64zeSHp
	UV6RZLcXdSFQLlb8v1QRyOXDC4JTKOshsFtWDsv1ctvydy2gLu8lRLH/N0tiRQuXULfQboXkj1+7B
	IdhsBtaPoDARoUR/sSkXBydmeCVP9+6+JIoT437mMgy0PwjkVQKiUQw/ye5jIi9P1YbZBSQzpClul
	B08a3+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma39-0000000HVJP-2W96;
	Thu, 14 Aug 2025 15:39:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZhM-0000000HOwz-2g9s;
	Thu, 14 Aug 2025 15:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=umiR4j7DjLNlMEowdV58E6T5tLX87kYcXiEtAZnwsfI=; b=iDb7f5gZB2pN4DkbmWL3vK8jBc
	b1j2SPyRJE0LPzgYtkp794d1mlSsR3Su4VbXsUVEl/3VdUQfYIJzoSW8UZ7aLON6doRYdR0EPHsjC
	Sd9yUdBI05mo9GljFa9UekRio0NrjMxdlBWOlYTiVTi6Djuc+c2iVg0JIWbXWtGbgPq/ol9sSSK+x
	hgVgTpOeDygMey3TLxzqkpRFzO9WUdh3Vvbzb+bQZm3aJm4wcGXUNpAMhgC2FsbFZiHXCM/cKeN5w
	NuEjtwhfF9dvc+htNDvcY92VDx0bl7hesdXVNTn53U733bb8yy1vtfGd10Z9Dbl2tWZU+9gnNTrht
	n/N3Er7w==;
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZhJ-0000000GStU-23lB;
	Thu, 14 Aug 2025 15:16:59 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-435de72c2cfso741381b6e.1;
        Thu, 14 Aug 2025 08:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184615; x=1755789415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umiR4j7DjLNlMEowdV58E6T5tLX87kYcXiEtAZnwsfI=;
        b=hZB1dZGHN5OKBVvCFgRP5Y4ENwOCacb8ew8IXQxnfo1tmEV+WQ2TqiARGIWEkwXJe+
         KgS70qQPLQ46ZQxlPNK3uLUexETYSIEoGdABm6MqtT6zg14Frc6Ftk0VVIGZdqgb3ndH
         HjrsYZ4n1V6ieyVZhWfqVESqiqjtmTaZCNhc6J0llKzZsZQx4NXsM1GHU8vlVWaXxM9A
         qA558mVC6mmTE0CXZxzolUxtSz9lbeBJQhO8JHIPEoYQMaRK5cJWyWPaqS19os1Jbaxu
         k4j15r8LyyIqsLPqYn75LsO/LvZMURIiTTearOBiqJqqGEeQ/axVV6YN2jw9382FPH+I
         2bFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYdjuExCI0k9xM3FDwfI3tQWzZzYPWkTdnJ5gMSUMZbkxqYL2fbFpVRIucERSsjiF5n/wtwuNGFPjffOuu@lists.infradead.org, AJvYcCW5Qxv6mAIje4VfM5xWDljA5smmd4ewyVA1LIGipgdwlrnMgMifbplYSj/elkUHjGtuBMRyIFQx5X6cu4u47dc=@lists.infradead.org, AJvYcCWPftswyicE3mlbFu/bQMybghwYzwlCdyr9qys+EUzsUUkQQ9Uoxa/bkMWkOzTZQRX3qToBg9h0+1vzDEI63sUDEA==@lists.infradead.org, AJvYcCX8qVEtk/30XyzYtDVIo2z18OwEFr7OZTPOyM9s5ZS+VisPDtGd3lTp53+BeLbfeeYcfIH9cLuoyMvNcts=@lists.infradead.org, AJvYcCXW3KaG/gSw54Orapg4FBA1IgCG+jud4yfqzvEf0Y7V/TG01+/7XSiyRZ71UfOSN+mDJPTtE/I8XQvlqfTdOpE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxvPJDmi26BQ00izX3H7R5KbckiBoHcKATzFNyx/SIRB4m2HVr
	0fcIzwI7Lt65eWwI+Hyjl6aW9cv0U/memYsRRjs+ugGatxubh5BQNP5q4Jr9hyVf
X-Gm-Gg: ASbGncu/rDmVqKISxcBNLb1w4l/E82phC20vnlbB5QltJmzKNmRgZQ63D2yGr5dHQev
	B8Bp6g4BvhRLaZdk7gu9uj8xbg+E8+w8MjCBbWdoPnoJd9HZxUOvKju8uRhQvNRfkNI10Q9BlbH
	sthTfiEK+NUipjQAM+0XyYeiYwwP0I6pakSH49PMTVo8gJP39i+EmrlnJJqcO/PmGwGOnttfhXo
	LqoTNiQ8coWVjRaalhxNqO9mpSsU4HjQcg5h8X/yoYkGgrM21XJ4Win27XeKm0H3VR00mwwTuhT
	YuPom5iQXiNE5ZKjHC2w+Mex9A3MEImlbwqBJ/mysHoJjz8Qh4d/V1MHoO/YvMjKX6zuCbqRrAg
	bFOi3sp5cF17v4GAy/4y8NI5OzbJGmlC/dBaagVEAbBtt+qvrsi3mdzKkB/UVHPeJ
X-Google-Smtp-Source: AGHT+IFtJEo4oHqDV0pgB0SqilJ3EL81kHd/F1rfP7l08gx5vnFIk6NHN0fmrk/x2LM8x5gdIYOz2Q==
X-Received: by 2002:a05:6808:1b07:b0:434:231:3e2c with SMTP id 5614622812f47-435df551323mr2296802b6e.0.1755184615383;
        Thu, 14 Aug 2025 08:16:55 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com. [209.85.167.175])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-435ce856832sm1152266b6e.23.2025.08.14.08.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:16:55 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-435de5d35d2so734338b6e.0;
        Thu, 14 Aug 2025 08:16:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFZSa2Pdt1u5eBSnOOafE80pqMAna/+g0gU2rsfpCaJSpBXHZWKM/yGnRu+S8LXjNeJazOq6u7EerLDhw=@lists.infradead.org, AJvYcCUPnkk4WUgPXe3+7BPMQV/lM1JKAZ1OcyaOFFnTG0DjY2RTSyLVsaH4pe5rO7Qkbdmiij03Ht+W4xI4dC1+VXY=@lists.infradead.org, AJvYcCVl+v0j3F5Cj80kXXMCauo3MGUiEMQiFShNsa02fALaIO2JTN+oPWWrMej8AFxJEYomLIVIV958r5BNCuQs@lists.infradead.org, AJvYcCW47vy5/M3FbDbPk3e6zw+cdAfIy0jsXgm8/f8lJYhgf0K85PuHijB5q+tUOJZDRYovaCM+B26hQJfcT/pEoSm95g==@lists.infradead.org, AJvYcCWy2W5wdj/21oiGYOrK55pehO7WiAaQoQrnA800uGmuLG7l/mBePELY/wZshynzFBT94JL4Cua3r/vQ5XLEH8Q=@lists.infradead.org
X-Received: by 2002:a05:6102:4192:b0:4fc:1484:5500 with SMTP id
 ada2fe7eead31-50feb4013d9mr1289391137.21.1755184278470; Thu, 14 Aug 2025
 08:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-93-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-93-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:11:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpmdSzNcUOgjWLJhH6+5FkPEF9uruqGqbk-u0SC5z5wg@mail.gmail.com>
X-Gm-Features: Ac12FXzyDBZHsviTnjmg5miZS8Vof98mQ5mu_iqWAq-BW-zvBlKCQTg0qFd90xs
Message-ID: <CAMuHMdUpmdSzNcUOgjWLJhH6+5FkPEF9uruqGqbk-u0SC5z5wg@mail.gmail.com>
Subject: Re: [PATCH 093/114] clk: renesas: rzv2h-cpg: remove round_rate() in
 favor of determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Alex Helms <alexander.helms.jy@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_161657_668028_DB0C26FC 
X-CRM114-Status: GOOD (  20.08  )
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

On Mon, 11 Aug 2025 at 17:18, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

