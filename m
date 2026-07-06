Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102F8C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 08:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlcdnSGCAGaaD3Qtz41jPpd7wkV1TEYjW94sOKYd3zY=; b=4XGvIaJQdWnCRGO2hHyGIPWnAa
	fNQlyHF+nFdcs1crFwA88vbbYhyOteXj1UR2Oow8DTxGyKVBPuAPQmwf1yh3tx+ArwHO74gW6tQXp
	mhu8J/Dx17htDIeFhV/c7j+8J5uY5ElJq0JSN14Cxz8Ij/2aYHOcYB86okNMyJLKRyZ0UAok65ZYB
	Z9/1WuVg2wWSd8CozrwYKpuE2UQqWUAexQJ3xCXXEV8cZOpScSkP8JVXfYfuxs0H3Y4SAWnzP5dDG
	Eqj5JR1LExsM+lUEEk2EtV6TYn8uf//b3JKNwdhAAG4u9m4gRg3COB0mTCn/WpnS4UkcbDRZND3BA
	WzfwF0BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeMn-0000000BmQF-0H56;
	Mon, 06 Jul 2026 08:07:49 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeMl-0000000BmPu-23b6
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 08:07:48 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so2026997e0c.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 01:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325266; x=1783930066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlcdnSGCAGaaD3Qtz41jPpd7wkV1TEYjW94sOKYd3zY=;
        b=ok3VT1w8fC/TWmXnXOPNOGUSYMbJJj9bN6to1ZgqnZNxS0o+AJhFSAVAJIz3uzkuUb
         LvzsdY2RJZ6tp130w8mnf44LbXQ1QnFpElrFtRg+61WSvU4HOyGeRde29zVi66cykpB9
         D/jSqB9gwYw4fbgf6ayDVpHNWXeopVTDe+0gELAsDl7ptk4X5tjvJ1q0qN2jbBomJ+4t
         j692k8Jk4BmTKBPO0FT0x+IkzhiJ6EIr4mDX3c734xnCyOAX09lAzsjQyPZRKOeXvmnv
         1hD5UXWhvMVZOASjLmqvf7kRGAi5SnaFgzBqmaDoHQ5bRJg7ILdOj+x5YPtJieOQPRdP
         k7hg==
X-Forwarded-Encrypted: i=1; AHgh+RrhJ9XqP28rJyg4FXzPPtVlnOOTyz6pdZ14gwOY9xBT0W+3lHgSTsp0Vg0ab08t47U3uGtJfr4T9kubT/muRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YznpgxhR0l7HwIKpTqMN/2BpBpF7IPJHiTQA1yXP/a6HmAZNwI6
	1LZNjfpewYIa/uPtSXwNSJcTNmELGFTQOPQpUR5EGCxWM2MJ/0aZnt/oloV7vsqI
X-Gm-Gg: AfdE7clR2x58Ts8NWNfz2ivpPzefTJmy5aU5ngOaiZX6UvbvZo2Nmh/ujUVQPEplMJG
	BR6QDp5ju2co9qC+SjMG7zrX8Lhm++UisC2SMwLppIdSDmM5XT7JBIBmDkCZQCrhKv8YXWD4PA/
	TeQU9TdTTRWaXKqLJctuUlIpyDSX0HXX+7ck2/f1q8lGcLqHTtBMmyAyA2Ig9qn2M2xjdecstvh
	twrq09tvYbGpIRtTUvYdWTuO3XNB5riyWwAfZGJBoxzQdjLF53YlyS5uH3BSXaFXcZzVr8eAnfy
	9loIzvPuy3v4u4W9z8C7iC7NIdOzjWsssBb7K+OhneKWhwdfJXu8D3wJJOi5NE3omxpN8RM3CL8
	DbDSvAY7jPxGf9WY21KdBFSaBU5VPgxnMOjnqwXGKJuSzgvpR3rSY3Zep+RdABVi1UyWX7If3JM
	hXvyMICQFP4/S/4nlpbQ7uXw6FrSiavplZl30s1GmTcHlIX2xeJg==
X-Received: by 2002:a05:6102:149d:b0:6c5:d55d:c096 with SMTP id ada2fe7eead31-7427eb211e8mr3194345137.16.1783325266072;
        Mon, 06 Jul 2026 01:07:46 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e19f40debsm5145176137.1.2026.07.06.01.07.45
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:07:45 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-738bd0b7960so2278354137.0
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 01:07:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpAaN3cbZSRoEyr5pUsT09t0o5ayg4dp2Zq2w4hYebmOVC631ferzu9hu+yHJHpidLbCdOGGuN9/uU1E6Lryg==@lists.infradead.org
X-Received: by 2002:a05:6102:800d:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-7427f0478a0mr3286706137.20.1783324855096; Mon, 06 Jul 2026
 01:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1783263835.git.ukleinek@kernel.org> <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
X-Gm-Features: AVVi8CfQACxAMot5VlqKHI6FXvkOZpEWhTZp1dlkgWSruFHOk1f-I-dS5kVo31s
Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Michael Walle <mwalle@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_010747_558821_C6482574 
X-CRM114-Status: GOOD (  16.69  )
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

On Sun, 5 Jul 2026 at 17:14, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>  - Use a single space in a of_device_id array terminator; A single space
>    after the opening { and before the closing } in non-empty
>    initializers;
>  - No comma after an array terminator;
>  - Also no trailing comma after a named initializer iff the
>    closing } is on the same line;
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/pwm/pwm-rcar.c            |  4 ++--
>  drivers/pwm/pwm-renesas-tpu.c     | 10 +++++-----
>  drivers/pwm/pwm-rzg2l-gpt.c       |  2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

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

