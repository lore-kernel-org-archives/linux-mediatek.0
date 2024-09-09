Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B308ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 15:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFPvrWEZnfEN8TWP1cJnvMCekclj4UD9Cp6NnLKH86A=; b=Ifky8qIDCKlaxOMaw3AFHiqju6
	xDT0+vDix2UQvOgEB2nUZasZvH+n6nJOR5YkobrKJhYK6EW0XWuUTqtIFXuzHfVIEK7C6MndwKMtC
	UcIx65Pry/kQthDBxL4yuFdCCIn/WMYqqEB8wKXA9V6rxEesD08bmzXxu+NmRzm8sne8x/DRbIAzN
	lZpy/wRVepyJpFCPEsI4adpSMoyPDjtvPqzXeuVleSLLtseSbjkvDl4SFgY0UzNFQjeynTA6I2Mo8
	N2a6avUa+lCiA/HMa/a2lmMesMxb4OfCC7PCo8+2lrKREhmQOc5MrT4NP6siv7F1Io/P/sHsOXUCq
	wmoNckRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sngUY-00000002W47-3cSb;
	Mon, 09 Sep 2024 15:39:50 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sngTW-00000002Vuz-19ab;
	Mon, 09 Sep 2024 15:38:47 +0000
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1a7c25e350so4298552276.3;
        Mon, 09 Sep 2024 08:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725896324; x=1726501124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFPvrWEZnfEN8TWP1cJnvMCekclj4UD9Cp6NnLKH86A=;
        b=C0/QYSQnZIwJuB8y2i1Yg3ku9zAQkdtc1reLpoDsb3TSab1x/PALxr1+Ek1pEkQxHe
         31J0kHSMQMz5vYb0to5KQcr26JjPSWMUQVItq7JIw9LzmyqftCNctbXOBdfivNTOIF4Y
         nbMz4zlRhQX7MJFqaZitdghXAPOmZ5SaSkWaRtRbI3Gz9wecAQb6wdJmnNsl9IBO87lZ
         4esbY/YskcALamlF+GmNBAPdMc2H2Nkoikea5h3KF4I9pInNW3wObpE47bPdrijetjje
         qT1R0NiFY8fmpkGIjH7uCU308/VEFtWosHsSVFaI86GjRVULyv2ev4ptj2enLLbkQQlk
         NNCA==
X-Forwarded-Encrypted: i=1; AJvYcCW5cNK3GJ0TP/hRf7UqS6RfYJVlxK3mlIzcd4nnPbKx8BVJPGSxh0UP2H4jpAV9ixHVoVLDVzJoLz19OhMK8Uzo@lists.infradead.org, AJvYcCWl58JqcebYjCSuIRcmd7Kw+FkY0JTxtP9XW62FYtlPr57CPk3FZ0a6xQ0DkN48lB9N+8StQ8eUofKnCLcKAF0=@lists.infradead.org, AJvYcCX1YgeHY4lgM0q4blVs/V9FQb9hfa9wbixZKPE8dlZc0A89MP5KnGc+bzFtM08PhK2FRVJWNrV60SIjCknNPTQcag==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOmf7Kka1DPDrXphxiA+DEV2U6AFcSbzWJrf9M9b8GdTFvvDLl
	ukXNpOk04edo89SnXJAtJTL3n/l2fC2fm+JtwGbMPTfAWuK9o5w5Chq3CrFG
X-Google-Smtp-Source: AGHT+IHOyx3w48WkJ01MPMjyNFiPDUnezSa9iMxollEVDzQ4tygWxp+AdfN2AnODzvlBS1azQhOw7w==
X-Received: by 2002:a05:6902:cc9:b0:e1a:97d8:212 with SMTP id 3f1490d57ef6-e1d34a56f42mr11467780276.46.1725896324063;
        Mon, 09 Sep 2024 08:38:44 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1d4b4774e2sm982642276.42.2024.09.09.08.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 08:38:43 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1a7c25e350so4298528276.3;
        Mon, 09 Sep 2024 08:38:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZfAiWwbtpRaSWZXWkBntKF/4hivavFPjB/T3tfPsxp09ywouS2E3Cz7Cim7+mflQDKQjcu9MrPu7K+aJah/6B@lists.infradead.org, AJvYcCWmHPOVhfWRAM4rx1sV38VyZRV6Eo5l+ZDr57Yq59niigZllTt2hO5GQyK4pDSsl95Re7z0E0l3R2XA144s6FQ=@lists.infradead.org, AJvYcCX2o2F2M/M9nB841buAv2FgyF/VDL+TQObWQQe4cMATZbZHybW99h04/BZ5VolWNE0zxmYoWssQTaX+ECblyVA7wA==@lists.infradead.org
X-Received: by 2002:a05:690c:a99:b0:6d7:4dea:5f16 with SMTP id
 00721157ae682-6db45133363mr150456127b3.26.1725896323567; Mon, 09 Sep 2024
 08:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20240909144026.870565-2-u.kleine-koenig@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2024 17:38:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOwfHgLwCSB-koVjW0eHDXkNvo_Af8eRkfbLPdU8ZrsA@mail.gmail.com>
Message-ID: <CAMuHMdXOwfHgLwCSB-koVjW0eHDXkNvo_Af8eRkfbLPdU8ZrsA@mail.gmail.com>
Subject: Re: [PATCH] clk: Switch back to struct platform_driver::remove()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, arm-scmi@vger.kernel.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_083846_332813_20DD6917 
X-CRM114-Status: GOOD (  17.50  )
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

On Mon, Sep 9, 2024 at 4:40=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>
> Convert all clk drivers to use .remove(), with the eventual goal to drop
> struct platform_driver::remove_new(). As .remove() and .remove_new() have
> the same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

>  drivers/clk/renesas/rcar-usb2-clock-sel.c       | 2 +-

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

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

