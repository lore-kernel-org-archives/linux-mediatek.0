Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FF0C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 11:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjHdVTNPfpZSE5mw/0S4dwLQIRvAN8JureryKLiLrHw=; b=XpaRe6Gt4qcoLi5HursKs+OcQU
	BTz69NZ5fhsN/I9iqaXs4QX6DnG9KigxSLdx3Iiek9lIATMKB6cfj3kjKMMgQgXaNtGQ72Rw+55Nm
	9mGCjm5JRF8v69SuKx53MV/aFjXYuj1dsgaTm6ciOdsV2AhQZGLihBQK9zWbs6f9WT10N+Dhvf6oi
	4w97+dkxzxJUlxP0sOlSRyh+RSC4uCr7H+6roNU5lAUUsBQRjzaPusIKtTbemavIPtfMzOwjip5Xk
	P0UHQWjyvA0UCCY3zwz6gayNKZ/WoMhjmp2++8iiBQI/i8Dl4aFleQSFhMh0KrWSTrvzyeMrVxR2M
	jtryP3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCePh-00000007AQX-3sfb;
	Thu, 30 May 2024 11:57:46 +0000
Received: from mail-qv1-f45.google.com ([209.85.219.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCePX-00000007ANJ-1n0w;
	Thu, 30 May 2024 11:57:37 +0000
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ab9ce752e0so4088166d6.0;
        Thu, 30 May 2024 04:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717070247; x=1717675047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjHdVTNPfpZSE5mw/0S4dwLQIRvAN8JureryKLiLrHw=;
        b=winccnFz+27fHq6z56Vulw88MTvxpDzZaFpadO9xsGldg28D4OqBteM0bC/bRTFrFG
         uSv/gohj8NBt3TtsxyR7x7UZQGjxhwcdawRzU/c8jaDiv75L2mEPEP/oKBYURWTnExV5
         MT4odq8vfULz5XUDsSY1YS5J0NzBD/sTr7W5R91HKH6XaewUnjCECWWgFBK2NkVbf69g
         RLq+aFOZnT08wHjvZnsbrUh2/0Ouz5cNXMHu7gc+K0+xEnPusDUeFAXpgHATuakznpeA
         jqwFn2RokBzUJBlEPkkXDw1m/jLEArpEHD3IFOTUmppSeeP+vW4FjGpUp4gVgiGSA+lP
         0T1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfHofs+zpLlufH1RVeblQ4TTvQAFOBZ9Bj+9Ouw8CFBoYT7IDWn7+7l/cvlNcq1T431oxI77XvA/2J4ULD2am1wnSYdM55RK+TSoeHQ23scG8Tw7wLe0KrE9SjE/SeNvr+1+epwuEloL3aKPRnh3HppspkY7YR9M8IqaA01X2zRL6EQfOmuaGuH6n/DsQkMaEb1XH4kz9LTNs621bpvR7MOLgjRbHmphKmNkUGsB9e5nZHnMmP7PR567bo1Fo=
X-Gm-Message-State: AOJu0YwSt+LdkMjchcKoLPYgZtWj0HJqoF3umHDG0xVn1XXihWC8xnKR
	6qSXDmW8fMVxvHxGQAjcaAQRg7MjlnTAZi/rm8Vi+vRUTHLoIGarC6EieJgt
X-Google-Smtp-Source: AGHT+IFswuqk57gNu9w5kDePsWPa/SRxqlQ9QFUHnGIXwxvpCc+ScheP2PUA60Q4WuQAGmKPQxfbgQ==
X-Received: by 2002:a05:6214:5d85:b0:6ab:8b67:8db8 with SMTP id 6a1803df08f44-6ae0cb7858emr18131726d6.5.1717070247171;
        Thu, 30 May 2024 04:57:27 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac20a1410csm62565406d6.144.2024.05.30.04.57.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 04:57:26 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-43fab2fa4ccso3913981cf.2;
        Thu, 30 May 2024 04:57:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQRXvGHkKeC/1Pb5J+HM0h44muY5azg/DvMVbR96xO1ffF24Y5YER0prsHE7kE3MvQHGC4QXFhvH8bhNpEjZzaD9OFVcufu+P2rmFgnjGKrQix9EGo4+nODisDhi0D7ZeRFFCBkscvd7SQsXBsSh60Qg/Qw9inx74b6dZy9gSDTicPN+QXYZL8k8oc73Q+42oUrLZdReB9H9FmXMpCL0XkSKTfpLv4SrNhAlE3PwzRUBQjJB2InZVNP6ksQ6s=
X-Received: by 2002:a25:6842:0:b0:dfa:48f3:2253 with SMTP id
 3f1490d57ef6-dfa5a619bd3mr2110161276.32.1717070226150; Thu, 30 May 2024
 04:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 13:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_045735_561853_C6F6A8C7 
X-CRM114-Status: GOOD (  20.20  )
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

Hi Peng,

On Sat, May 4, 2024 at 3:12=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
> Use scope based of_node_put() to simplify code. It reduces the chance
> of forgetting of_node_put(), and also simplifies error handling path.
> I not able to test the changes on all the hardwares, so driver owners,
> please help review when you have time.
>
> This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
> thanks.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Andy's question about code generation on a related patch made me
wonder, too.

On arm32, a conversion to for_each_child_of_node_scoped() seems to
cost ca. 48 bytes of additional code, regardless of whether there were
explicit cleanups before or not.

I checked "pinctrl: renesas: Use scope based of_node_put() cleanups",
and all but the conversions in *_dt_node_to_map() cost 48 bytes each.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

