Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904FACA0EE4
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 15:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9du/Bs1Vwkuk15qOOpl62+YeIchI37tbTZ/WdEUy2s=; b=ZjB8nueH/fQjuqzibtojqQBG5x
	TgjKDTItZ/NVMrd78sOUOENMb0q2CgwG5ZD8FfCSjQWaYrBrxpDqcVKQxm2Hy8SD/e1sGkRMLFPI5
	h3/jS6nuy0FMrcraZKDrmaUi6fzHqXX0JVEaqymE0zcbj+M7EPFGgXQblIPl7Qd+mu+r1VyGiPWMt
	YuGFHgt4nlNwOez1Iy0XF4+MpJ9Vf+xpxfbFbVm4ZqduaEZhcIy0tgQGpaXluN4sb8sS6ILpkcsjd
	xSHP32S4j35crd/+5/Utju6SoDW69peuwC8aN8Ncw4v+Jp6HWM3Hl5bslY51XOG9IYuzh5E0JXGJu
	hjEL1efg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma1t-0000000HUnO-4Btz;
	Thu, 14 Aug 2025 15:38:14 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZek-0000000HOFH-2ziy;
	Thu, 14 Aug 2025 15:14:19 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-30cce50b75aso665314fac.0;
        Thu, 14 Aug 2025 08:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755184457; x=1755789257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9du/Bs1Vwkuk15qOOpl62+YeIchI37tbTZ/WdEUy2s=;
        b=ehxfjeKqfUnirCTJFjX07Qqqw42WzJLN8EIiN0cXmlOp+EmmIOM95xCGmeR4zQmmmH
         2MOZcMdFCqB2doOJjUVTyuzuL56ZF+82lL8xekdwiyTxmWXUGoinyrRc7rh2PS4ujt2/
         uP1gBmEGvPrvobbHSKWccK3kYtYZ4YayQutrFrnhoV6kh9AE3XKmSLZNLpQn0G6JfHEz
         /AHAXCAx3E4djNqOWyQR8YQLWfOIOsjpfKgmDTSc/2RNSzIiKIt028wpg7YRyX7DUdyl
         dzHobNC1f5secRUyZdznjN+LevtYXuh/szIKim1uX8ppapIoidD8F5bI09o6Brde30Dy
         LLrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVnZ+nY0jLw+0hfs+ULOmwNY8QHEVyr6xm4Sba3LRHnwHMCp9TE/M33Hw195hF4tpLp3OdBlrIpsu37CPP@lists.infradead.org, AJvYcCUus1JfLmHTfaQmcbJ9pp99QkFqWws85ffmPp+HSQhG16IfebtmT21mxTcGBDqYo8Aqd4yevMb89QHhmlw=@lists.infradead.org, AJvYcCWipWvhBLWGqq0Sbz4HSqaO6mOMdERfsUQ8gBRldLAq5mwOBmqh1mgEJwzzIC2hfa+qeZeLrSkn6Y5TOHno94n8IQ==@lists.infradead.org, AJvYcCXQfERhic02+v/n7AUZC1xqEGInB631K8LGOYepgF52F42LieeUK9jU5sZDr204yiQNF18M85t9BOq2z7Z9AZU=@lists.infradead.org, AJvYcCXnKzbnl34Wa5uAYLDRlltpJmZm4oNdNfIDdfENYKS36HkKdoCvFWBe0pkXLw7vgjQSOUBJAimz/eIE8IUboRQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+CbZ7SsEhXz0CM2FzgDPpOaooYcZwkB0x4KE1dHsHHLNUJcGo
	HpqeTantbwRWSBtw4pXQd8DWdOaCS/UDdkpkBlgXmOCqGuOowuz8gV28kTFICgkd
X-Gm-Gg: ASbGncspr/jYG2BX5RodqZ94WiqisMWtXPEGyMlwqaSLjqjLbYSdV8DVtxIqKjtLTjJ
	C7XPoeq77a+em/BAF3kkIvGnC1C/J0bLUmHDUgFtpCpAbXBSresvGC+tIbL5MLHBAHcbz1tixrz
	2z3ysikuFSabB+N14Mc/gVzbRQrlrzUxu3NG8gCUAy8jL6kzEdUvQQtpCZZkjRO4l+O+2Uh1AK2
	QoCkZvlPq5KzjPFwEKPC7EjBbl5KXatzrQG5L0q8FYx7OsvJMe+LCf3N5WyTILHcZzwEIQan+Gk
	ievpV/KY92MSpOcO+SK/kZNlYzdE7wlF/fIUYUw15KQ2f1DqiKxNxBkIPfrunlOZ/vVd7yR6r2y
	fUs8EOKraPuOU+nFZuoFNK7slM3uMh7bEh5MaGbPt8bwWVH83OYaLBk/AoBar
X-Google-Smtp-Source: AGHT+IGWoPGS/6f8pgeTTjf2kUW+tcSf9U+DzKtuPfrSKz/w/T4nNHnfryGCv3Az+kE6+Hsw4aAoug==
X-Received: by 2002:a05:6870:a102:b0:2d4:ce45:698d with SMTP id 586e51a60fabf-30cd0da6088mr2210703fac.4.1755184456860;
        Thu, 14 Aug 2025 08:14:16 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-30cd018d614sm702907fac.33.2025.08.14.08.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 08:14:16 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-61bd4c45957so503690eaf.1;
        Thu, 14 Aug 2025 08:14:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9YxrS8t+qgNJ7aSA3AlKRfJHYNzOmxXILRw3oWJzDHHpohQN9IMhjsj2SzOfRt5KG6IdDYhZs1AKddbAlSgw=@lists.infradead.org, AJvYcCU9ugBWno7+8c2sCf98rhYl3JEeNNVBnD+6mhUMCZhUN4WhN5loWOPs2aikGSjS37IsWU8c1R7EkSJJmFw=@lists.infradead.org, AJvYcCUXhfPUg1GxAufU4n5X+WNLniy5Tmx9Su//OtPOoQQ62wGkrw4Op1oHrEtWz3mxdVBFGOVmss5Dtx3ErdZG@lists.infradead.org, AJvYcCWe3oUYihW6P7Dn7UxGuYye4FrRVKAwWPq6QkqZTvjqLjExO//S16F7hN2TGCCSkAIvndSDNbtKYyKcDRvNgzA=@lists.infradead.org, AJvYcCX64wx163eWTP/vDz3Sek+/qJszCycl6fd2/EnbKdgHfABK66ENQP+DML542fLo/yILwcHnEssm7k8K3obzF8qEow==@lists.infradead.org
X-Received: by 2002:a05:690c:700b:b0:719:f582:be17 with SMTP id
 00721157ae682-71d635fe81bmr48846567b3.35.1755183986689; Thu, 14 Aug 2025
 08:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-92-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-92-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:06:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUR9phiPyhi9=f3gdA_f5oRmaX=ucj8SUquXQEq7bUTkg@mail.gmail.com>
X-Gm-Features: Ac12FXzt8_e3pGt50aBSDpwDZhCGVBhDLrUDheSmsSXHpMoy_pb5BR_R7aHtEdE
Message-ID: <CAMuHMdUR9phiPyhi9=f3gdA_f5oRmaX=ucj8SUquXQEq7bUTkg@mail.gmail.com>
Subject: Re: [PATCH 092/114] clk: renesas: rzg2l-cpg: convert from
 round_rate() to determine_rate()
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
X-CRM114-CacheID: sfid-20250814_081418_752980_89A5C118 
X-CRM114-Status: GOOD (  19.20  )
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

On Mon, 11 Aug 2025 at 17:19, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
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

