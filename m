Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC48C5B552
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 May 2025 08:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UODADZBFNNuhdOjNi7w1d1lWaPaCSwIUX58mKie6mVI=; b=p5oVzErr/34mAtLG5OM90/vZK/
	tsvnA2mlwU36GbOIkf4D49BkWNyAEPm8yMNLDyCYlBRLGh55NTMuCL0Fb+uA0bXREUEnATS/rQav+
	KP31gIYFx0jzGFbiGDZM8kyxiFns+IMu4OCMkmgyMLJeoXWrqKFvL4RvrcCMvTi8xiCLUXdzjR9Ub
	h5j7e+cS5l/ctZYRQc6zeImvaFWs3Y51BPe6vx2LZgFhHEC8OvvTrdkHjmBKYliaZHSyyfYzbEQEH
	ezthN0lX43Jf8CHy44Ha3psoNobqmhYlqWdnAF4OWLXf50pcpt7EbAehGpatbD0nlqHoYcoFBpdui
	WcherptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKv2u-0000000HatJ-2vYU;
	Fri, 30 May 2025 08:24:56 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKura-0000000HZRZ-1Rj2;
	Fri, 30 May 2025 08:13:15 +0000
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3f8ae3ed8f4so1171859b6e.3;
        Fri, 30 May 2025 01:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748592793; x=1749197593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UODADZBFNNuhdOjNi7w1d1lWaPaCSwIUX58mKie6mVI=;
        b=bt3e3W0iSfTtEB/yrf4nP0EmiIXMC90PWd1AeKMte7LyhyM6YbBzlrSUkxtCg2gS1p
         5O0jZpaLxgc+BRas97Ie8BlX18BskPHd/Odm6oNshXHVie3/eYZFtVHZmocuiya2rsAY
         k1LK+cvOoGAtbyZB3dBMsK3ZaqM/sdpOfX5gTcLllkJUTJdKOZXExxHWtfjXWNVQOUG6
         3ZnvzKCrTV2mGWO6I0Cv61GpCQ8QEOf4aPyAGOZZY7PqKXzyvXmhfWcCSNLWrf6MiiLT
         /Kiy4hYcY13Nfj4nvtH0eueb91C4L/36G1tkaJ4Hf0wsbMIO0+hO/hxYW1i64lzx7kMF
         cmbw==
X-Forwarded-Encrypted: i=1; AJvYcCV/Yk2HvQvIggDh5UILdbTSQrSkmXXcIEe8/9x4ufjpsyGf+Od1oNrnv38hN3Op24T9NV6eNQAmhHE6FXX9snYL@lists.infradead.org, AJvYcCVz4ct41yjw58oxsvhr+3qNQ3JQlXMHzrXIyVlg8GY4A1afUw1RUj61qYtR63yWk0mcKaG8B96wwOV4Ah0=@lists.infradead.org, AJvYcCW4RC1i+2Sj3AVxvDHUQsg++vXdcLr+pxztUsDMYsGJ/ITxYcybVXLTyqjz3uoI+EnWeJggO8ek8Rfh3J2Xa5A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwP3ZycOfSi3zlGqKvJtnxh0m9LAHIKGXR0XU+ficrAtAPP+Pcw
	NHvJkfpPmbXYcd+pyl8RzuatSTpzbVBtOZ0ZDhj4GIJmyRKiN7PQOz8OhylA4Oho
X-Gm-Gg: ASbGncuYL1fVfedevGlojRRfrP2pF/VmthZnq1AGDPmjfNsdd1dI6yKA9Hv4wfTdwDW
	zmFPH8KQqOYXjDiwyJHPd8P2KDUiQQOWyOgxKdis/xGfOA35o4IXpNwlIbclWDUqITGUtay3aAx
	V8DY26tUz80pe61/8Tkkg00Qo4+VdRNGhZArJ5UwO0pa5fYFuVK3IbabUTSTThYDgvzxIuPBU/1
	/0BzWA0Ll1DocYG/m6x+N80/nHl+11ceMn7UYf7T+sBwZEJE6VlSdb4GM5dzXa+64TmyxibvG4/
	VqnQC2U0CVvBlIAi+oJKu09WRkm2i7FuT3EUStyo5k+IxhsWbQMhH/D0lAVvHGLOdazf0V4rK6x
	qb3eW74uSj3iQsYSSv4lO4FgvMK2O
X-Google-Smtp-Source: AGHT+IGLrEicfQYSQPcX2fcNrvbNfh+KRnAhkN7QgH7gXLkApSnIA9v9MkD1/ZDVc5mdQ2icW9p07g==
X-Received: by 2002:a05:6808:6b8b:b0:403:3673:65f0 with SMTP id 5614622812f47-40679733143mr1349138b6e.31.1748592792879;
        Fri, 30 May 2025 01:13:12 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678c1b622sm319297b6e.11.2025.05.30.01.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:13:12 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3f8ae3ed8f4so1171838b6e.3;
        Fri, 30 May 2025 01:13:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6kv4Y1Ptsqm/znvHpQDfa6kyYDMCcOTIajnQBBye9SZV6UlFhkpggADLxhBOw58Fi3LoJtkQaUvMK77c=@lists.infradead.org, AJvYcCWRnBO/gBPXh94Ng2fZHg5VUSqj2M+kMpowZokiC1WwlH7ZnBjhKnIMPT+OIcO3xGmuo6pIbn3eGrH494wFrXE=@lists.infradead.org, AJvYcCXvDjhvMoknEs+nvPFBJLdJVbsN+LymfYBl5SclLJqnXVeeHvS5prgsXVzaibTBUpbX+kchlvKMD607FalzsXWn@lists.infradead.org
X-Received: by 2002:a05:6122:17aa:b0:530:677b:1e93 with SMTP id
 71dfb90a1353d-53080df1088mr2012964e0c.0.1748592388616; Fri, 30 May 2025
 01:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
 <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com> <b6b7fb61-878e-4407-b964-564efb3524b1@linaro.org>
In-Reply-To: <b6b7fb61-878e-4407-b964-564efb3524b1@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 May 2025 10:06:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHyLYk0oSN8XDNCXUvLQLe2u0k0noVJLbR+pYWDTB4+w@mail.gmail.com>
X-Gm-Features: AX0GCFuCNZIpijI8V-LFtD11RdEuCtx09JrM6Rph_c1WT65W3SrLJtlImd30cUI
Message-ID: <CAMuHMdUHyLYk0oSN8XDNCXUvLQLe2u0k0noVJLbR+pYWDTB4+w@mail.gmail.com>
Subject: Re: [PATCH 14/17] pinctrl: renesas: Move fixed assignments to
 'pinctrl_desc' definition
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_011314_386114_8B4F929B 
X-CRM114-Status: GOOD (  20.65  )
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

Hi Krzysztof,

CC wsa

On Wed, 28 May 2025 at 19:55, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 28/05/2025 14:54, Geert Uytterhoeven wrote:
> >>         .pmxops = &rzn1_pmx_ops,
> >>         .confops = &rzn1_pinconf_ops,
> >>         .owner = THIS_MODULE,
> >> +       .pins = rzn1_pins,
> >> +       .npins = ARRAY_SIZE(rzn1_pins),
> >>  };
> >>
> >>  static int rzn1_pinctrl_parse_groups(struct device_node *np,
> >> @@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
> >>
> >>         ipctl->dev = &pdev->dev;
> >>         rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
> >
> > ... if you would replace this assignment by a hardcoded name
> > like "pinctrl-rzn1".
>
> I saw it, but this would not be equivalent. dev_name includes platform
> bus id, e.g. pinctrl-rzn1.0 which might matter here - conflict of names.
> Are you sure this would work fine?

There can be only one anyway.
Most drivers used a fixed name:

drivers/pinctrl/renesas/pinctrl-rza1.c: rza1_pctl->desc.name = DRIVER_NAME;
drivers/pinctrl/renesas/pinctrl-rza2.c: priv->desc.name = DRIVER_NAME;
drivers/pinctrl/renesas/pinctrl-rzg2l.c: pctrl->desc.name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl-rzn1.c: rzn1_pinctrl_desc.name =
dev_name(&pdev->dev);
drivers/pinctrl/renesas/pinctrl-rzt2h.c: desc->name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl-rzv2m.c: pctrl->desc.name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl.c: pmx->pctl_desc.name = DRV_NAME;

It might change the path in debugfs (/sys/kernel/debug/pinctrl/) though.
Wolfram?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

